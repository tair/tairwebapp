// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.12 $
// $Date: 2004/08/11 16:14:28 $
// ------------------------------------------------------------------------------

package org.tair.search;


import java.io.Serializable;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.tair.abrc.payment.InvoiceSearchResult;


/**
 * SearchSession handles all session aware activities for the various searches
 * executed through SearchServlet. Each user will have a single SearchSession
 * object stored in their <code>HttpSession</code> while they do various
 * searches. This object keeps track of what type of searches user has executed
 * during current session to permit detection of duplicate searches (and
 * optimization of server processing by returning existing results or ignoring a
 * new search request).
 * 
 * <p>
 * For most searches, search results are placed into a Result_<type> table that
 * has the columns supported by the search. Invoice searches store the results
 * in the SearchSession object itself in a special map using the hash of the SQL
 * statement as a query id.
 * 
 * <p>
 * SearchSession handles all of these duties by requiring search code to
 * register each new search type when it is begun.
 * 
 * <p>
 * SearchSession implements the HttpSessionBindingListener interface. You can
 * use this interface to listen for search events (unimplemented at this time).
 * 
 * <p>
 * Search session also offers a way to store user's accumulated download
 * selections by storing a running list of items selected for download as user
 * scrolls through multiple pages of search results. SearchHandlers should check
 * for ids in request, then store them here until user finally requests that all
 * ids be downloaded.
 */

public class SearchSession implements HttpSessionBindingListener, Serializable {

  /** Serial version id */
  private static final long serialVersionUID = 1L;

  // list of registered searches in progress
  private Vector<String> currentSearches = new Vector<String>();

  // collections of search specific criteria
  private Map<String, Map<String, Object>> searchCriteria = new HashMap<String, Map<String, Object>>();;

  // map of invoice search result managers identified by query id (hash of SQL)
  private Map<String, ISearchResultsManager<InvoiceSearchResult, Long>> invoiceResults =
    new HashMap<String, ISearchResultsManager<InvoiceSearchResult, Long>>();

  // lists of downloads being accumulated - key is search type
  private Map<String, Vector<Long>> downloads = new HashMap<String, Vector<Long>>();

  /**
   * Registers a search of submitted type for this session id. If this is the
   * first time a search of this type has been executed for this user, a temp
   * table will be created to hold their search results; if a table has already
   * been built, all results held in the table will be deleted, as it is assumed
   * the user has begun a new search and old results are no longer needed.
   * Tables are built and cleaned out by retrieving the appropriate commands for
   * the given search type from <code>MasterTableInfo</code>
   * 
   * @param type Search type being executed
   * @param session_id Session id for this user's session (used to create
   *          individual table names
   * @throws SQLException if a database error occurs
   */
  public void registerSearch(String type, String session_id)
      throws SQLException {

    // add search type to list of searches in progress
    if (currentSearches == null) {
      currentSearches = new Vector<String>();
    }

    currentSearches.addElement(type);

    // get rid of any ids to be downloaded that might be hanging around
    if (downloads != null && downloads.containsKey(type)) {
      downloads.remove(type);
    }
  }
  
  /**
   * Given a hash-coded query id, look up the search type by scanning the
   * current searches and comparing hashes. The method throws a runtime
   * exception if there are no current searches or if the query id does not
   * represent the hash code for any of the current searches.
   * 
   * @param queryId a hash-coded query id
   * @return the corresponding query type
   */
  public String getSearchTypeFromId(int queryId) {
    String searchType = null;
    
    if (currentSearches == null || currentSearches.size() == 0) {
      throw new RuntimeException("Session has no current searches");
    }
    
    // look at searches in progress and hash them and compare with query id
    for (String type : currentSearches) {
      // TAIR-1622: following line is getting a null pointer exception,
      // make that impossible with a null check.
      if (type != null && type.hashCode() == queryId) {
        searchType = type;
        break;
      }
    }
    
    if (searchType == null) {
      throw new RuntimeException("No search corresponds to query id " + queryId);
    }
    
    return searchType;
  }

  /**
   * Determines whether a search of submitted type is in progress for this user
   * by examining inner collection of registered searches
   * 
   * @param type Type of search to check for
   * @return <code>true</code> if an entry is found for the requested search, or
   *         <code>false</code> if no search of requested type is found.
   */
  public boolean searchInProgress(String type) {
    return (currentSearches != null && currentSearches.contains(type));
  }

  /**
   * Adds the submitted list of ids to the collection of items to be downloaded
   * for search of submitted type. When user finally selects "download", all
   * items stored here will downloaded and this collection will be emptied (see
   * getDownload())
   * 
   * @param type Search type to save selected ids for
   * @param ids Selected ids to add to collection of items to be downloaded.
   */
  public void addDownload(String type, Long[] ids) {
    Vector<Long> saveIDs = null;

    if (ids != null && ids.length > 0) {
      if (downloads == null) {
        downloads = new HashMap<String, Vector<Long>>();
      }

      if (downloads.containsKey(type)) {
        saveIDs = downloads.get(type);
      } else {
        saveIDs = new Vector<Long>();
        downloads.put(type, saveIDs);
      }

      for (int i = 0; i < ids.length; i++) {
        saveIDs.add(ids[i]);
      }
    }
  }

  /**
   * Retrieves any items stored for downloading while scrolling through search
   * results for search of submitted type. When collection of items is retrieved
   * here, it is removed from internal collection of downloads are in progress
   * since it is assumed collection has retrieved of part of user's download,
   * and it is no longer necessary to keep list.
   * 
   * @param type the type of search
   * 
   * @return Vector containing any items saved for download as <code>Long</code>
   *         ids.
   */
  public Vector<Long> getDownload(String type) {
    Vector<Long> savedIDs = null;

    if (downloads != null && downloads.containsKey(type)) {
      savedIDs = downloads.get(type);
      downloads.remove(type);
    }
    return savedIDs;
  }

  /**
   * Determines if submitted ID is in list of download items for submitted
   * search type.
   * 
   * @param type the type of search
   * @param id the download item id
   * 
   * @return <code>true</code> if submitted ID is in list of download items for
   *         submitted type or <code>false</code> if submitted ID not found
   */
  public boolean hasDownloadID(String type, Long id) {
    boolean found = false;

    // DON'T use getDownload to get reference to download vector --
    // accessing that way will clear list of download ids
    if (downloads != null && downloads.containsKey(type)) {
      Vector<Long> savedIDs = downloads.get(type);
      if (savedIDs != null && savedIDs.contains(id)) {
        found = true;
      }
    }

    return found;
  }

  /**
   * Sets the search criteria for the submitted type. It is helpful to store
   * this information in session so that at any time we can refer back to info
   * used to create search results (for instance, to create text explaining
   * result set).
   * 
   * @param type Search type criteria are for
   * @param criteria Search criteria used for current search of submitted type
   */
  public void setSearchCriteria(String type, Map<String, Object> criteria) {
    if (searchCriteria == null) {
      searchCriteria = new HashMap<String, Map<String, Object>>();
    }
    searchCriteria.put(type, criteria);
  }

  /**
   * Retrieves the stored criteria for the submitted type of search.
   * 
   * @param type the type of search
   * 
   * @return Map containing search criteria previously stored for the submitted
   *         search type, or <code>null</code> if no criteria stored for search
   *         type.
   */
  public Map<String, Object> getSearchCriteria(String type) {
    Map<String, Object> criteria = null;

    if (searchCriteria != null && searchCriteria.containsKey(type)) {
      criteria = searchCriteria.get(type);
    }
    return criteria;
  }

  /**
   * Empty implementation of the valueBound define in the interface
   * HttpSessionBindingListener; method does nothing because no actions are
   * necessary when first binding to session.
   */
  public void valueBound(HttpSessionBindingEvent event) {
    // Does nothing at this time
  }

  /**
   * Implementation of valueUnbound method in HttpSessionBindingListener. When
   * session expires, this method is called.
   */
  public void valueUnbound(HttpSessionBindingEvent event) {
    // Does nothing at this time
  }

  /**
   * Get an iterator over the invoice search results for a given query.
   * 
   * @param queryId the unique hashcode for an invoice query SQL statement
   * @return a invoiceResults
   */
  public Iterator<InvoiceSearchResult> getInvoiceResults(Long queryId) {
    return invoiceResults.get(queryId).iterator();
  }

  /**
   * Set the invoice results manager for a query.
   * 
   * @param queryId the hashcode for an invoice query SQL statement
   * @param manager an <code>InvoiceResultsManager</code> instance, possibly
   *          decorated
   */
  public void setInvoiceResultsManager(String queryId,
                                       ISearchResultsManager<InvoiceSearchResult, Long> manager) {
    invoiceResults.put(queryId, manager);
  }

  /**
   * Get the invoice results manager for a specific query.
   * @param queryId the unique identifier for this query in the session
   * 
   * @return a invoiceResults
   */
  public ISearchResultsManager<InvoiceSearchResult, Long> getInvoiceResultsManager(String queryId) {
    return invoiceResults.get(queryId);
  }
}
