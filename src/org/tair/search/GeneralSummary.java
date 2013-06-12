/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * GeneralSummary stores the results of the general search display.  Results are 
 * stored as counts of matching entries for all of the different object types
 * searched (i.e. genes, clones etc.). These search results are supplied to
 * GeneralSummary by GeneralSearchHandler, which executes type specific general
 * searches by generically creating objects that implement the GeneralSearcher
 * interface to handle the type specific searching.  The object types being searched
 * are defined by the general search config file, which is loaded by SearchServlet
 * using ObjectInfoCollection when the servlet initializes.
 */

public class GeneralSummary {

  // search term
  private String searchTerm;

  // search method used (contains, exact etc.)
  private String searchMethod;

  // collection of search types and results counts
  private Map results;

  /**
   * Creates an empty instance of GeneralSummary
   */
  public GeneralSummary() {
    results = new HashMap();
  }

  /**
   * Sets the search parameters used to retrieve object type counts.  These are
   * saved for display on the general search summary page.  Currently, this method
   * expects two search parameters: "searchTerm", the term to search the database for,
   * and "method" the search method (i.e. starts with, contains etc.) to use when searching
   * the for searchTerm.
   *
   * @param params Search params used to create search result counts
   */
  public void setSearchParams( Map params ) {
    this.searchTerm = (String) params.get( "searchTerm" );
    this.searchMethod = (String) params.get( "method" );
  }
 
  /**
   * Sets the results of a general search for supplied type.  Results are stored as
   * a SearchResultsCollection, which contains the raw number of matches along with
   * other info. from the search which may or may not be needed depending on the 
   * search type.
   *
   * @param type Object type (i.e. gene, clone etc.) for search results
   * @param searchResults Collection that contains the number of matches of submitted
   * type that were found for search term
   */
  public void setSearchResults( String type, SearchResultsCollection searchResults ) {
    this.results.put( type, searchResults );
  }
    
  /**
   * Retrieves the number of matches found for submitted object type
   *
   * @return Number of matching objects found for submitted type, or
   * zero if no matches found, of if type is not found in internal collection
   * of general search results
   */
  public int getTypeCount( String type ) {
    SearchResultsCollection resultsColl = null;
    int count = 0;

    if ( results.containsKey( type ) ) {
      resultsColl = (SearchResultsCollection) results.get( type );
      count = resultsColl.getResultSize();
    }

    return count;
  }



  /**
   * Retrieves total number of matches for search term
   *
   * @return Total number of matches for search term in all 
   * categories, or zero if no matches found.
   */
  public int getTotalCount() {
    Iterator iter = null;
    String type = null;
    int total = 0;
    
    iter = results.keySet().iterator();
    while ( iter.hasNext() ) {
      type = (String) iter.next();
      total += getTypeCount( type );
    }

    return total;
  }

  /**
   * Retrieves the search term used to get the results of general search
   *
   * @return Search term used for general search
   */
  public String getSearchTerm() { return searchTerm; }

  /**
   * Retrieves search method (i.e. starts with, contains etc.) used to retrieve
   * search results for search term
   *
   * @return Search method used for searching with search term
   */
  public String getSearchMethod() { return searchMethod; }

  /**
   * Determines if any matches were found for submitted type
   *
   * @return <code>true</code> if at least one match was found for submitted type
   * or <code>false</code> if no matches found for submitted type, or if type is
   * not found in internal collection of general search results
   */
  public boolean hasTypeCount( String type ) { return ( getTypeCount( type ) > 0 ); }

  /**
   * Determines if search executed has results in more than one search category;
   * this information is used by the general summary JSP to automatically forward
   * user to type specific summary page if matches occurred in only one category
   * (i.e. if this method returns false)
   *
   * @return <code>true</code> if general search had matches in more than one
   * search category, or <code>false</code> if search had matches in zero or one
   * category
   */
  public boolean hasMultipleResults() {
    Iterator iter = null;
    boolean hasMultiple = false;
    int counter = 0;

    iter = getSearchTypes();
    if ( iter != null ) {
      while ( iter.hasNext() ) {
	if ( hasTypeCount( (String) iter.next() ) ) {
	  counter++;
	}

	if ( counter == 2 ) {
	  hasMultiple = true;
	  break;
	}
      }
    }
    return hasMultiple;
  }

  /**
   * Retrieves all search sub-types as keys that can be used to get type-specific 
   * result counts using hasTypeCount(). This method is used by the general results 
   * page to generically display results in all categories
   *
   * @return Retrieves all search sub-types as an <code>Iterator</code> of
   * <code>String</code> keys, or <code>null</code> if no sub-types in collection of
   * search results (shouldn't happen...)
   */
  public Iterator getSearchTypes() {
    return ( results != null && !results.isEmpty() ) ? results.keySet().iterator() : null;
  }
  
}
  








