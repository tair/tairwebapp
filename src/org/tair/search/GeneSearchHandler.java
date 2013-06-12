// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.42 $
// $Date: 2006/03/16 22:30:35 $
// ------------------------------------------------------------------------------

package org.tair.search;


import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.table.MasterTableInfo;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcTaxon;
import org.tair.utilities.Debugger;
import org.tair.utilities.DownloadAllHandler;
import org.tair.utilities.DownloadThread;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.TextConverter;
import org.tair.utilities.WebApp;


/**
 * GeneSearchHandler handles all search functions for genes. When searching,
 * GeneSearchHandler uses the <code>SearchSession</code> object to create a temp
 * table to hold an individual users gene search results. With these stored
 * results, user can easily scroll through a large result set through subsequent
 * requests to GeneSearchHandler.
 * 
 * <p>
 * GeneSearchHandler uses <code>GeneSearcher</code> to perform initial search,
 * to retrieve pages of results when scrolling through results, and to retrieve
 * gene info. when download option is selected.
 * 
 * GeneSearchHandler implements <code>DownlaodAllHandler</code>
 */

public class GeneSearchHandler implements RequestHandler, DownloadAllHandler {
  private String searchType = "gene";
  private String filename = null;

  public GeneSearchHandler() {
  }

  /**
   * Processes servlet request to perform requested action. Method uses the
   * "action" parameter in the submitted <code>HttpServletRequest</code> to
   * determine what action is appropriate. The possible values of action are:
   * <ul>
   * <li>search - Search parameters are retrieved from request and passed to
   * GeneSearcher for searching</li>
   * <li>re_search - Requested page number of multiple page result set is
   * retrieved from request and passed to GeneSearcher to receive requested page
   * of results</li>
   * <li>download - Marked genes are retrieved from request and information is
   * collected into tab-delimited format for download
   * </ul>
   * 
   * <p>
   * Results of search and re_search are returned as a
   * <code>SearchResultsCollection</code> containing an array of
   * <code>Vector</code> objects representing a locus that in turn each contain
   * an array of associated <code>GeneSummary<code> objects, as
   * well as scrolling
   * params, link and plain text explanation of search parameters used to
   * construct result set
   * 
   * @param request HttpServletRequest passed from SearchServlet
   * @return RequestHandlerResponse containing URL of JSP to forward to, and any
   *         search results objects that may have resulted from request
   * @exception SQLException thrown if a database error occurs while searching
   * @exception InvalidParameterException thrown if an invalid search action is
   *              requested, or an invalid gene id is submitted for download
   * @exception InvalidFormException thrown if no genes selected for download
   * @exception SessionOutOfTimeException thrown when re_searching if no gene
   *              search is in progress
   */
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidParameterException,
      SessionOutOfTimeException {

    RequestHandlerResponse response = null;

    // action might be in "action" or "search_action" - summary pages use
    // search action because of conflicts with form.action
    // attribute in javascript in Mac IE 4.5
    String action = request.getParameter("action");
    if (action == null) {
      action = request.getParameter("search_action");
    }

    if (action != null && action.equals("search")) {
      response = search(request, true);

    } else if (action != null && action.equals("re_search")) {
      response = search(request, false);

    } else if (action != null && action.equals("download")) {
      response = download(request);

    } else if (action != null && action.equals("downloadAll")) {
      response = downloadAll(request);

    } else if (action != null && action.equals("sendToSequenceDLAll")) {
      response = sendToDLAll(request, "sequence");

    } else if (action != null && action.equals("sendToSequenceDL")) {
      response = sendToDL(request, "sequence");

    } else if (action != null && action.equals("email")) {
      response = email(request);

    } else {
      throw new InvalidParameterException("Invalid search action requested: "
                                          + action);
    }

    return response;
  }

  // retrieve search and scroll parameters to execute search and return
  // selected slice of result set
  private RequestHandlerResponse search(HttpServletRequest request,
                                        boolean firstSearch)
      throws SQLException, SessionOutOfTimeException,
      InvalidParameterException, InvalidFormException {

    RequestHandlerResponse response = null;
    Map searchParams = null;
    SearchSession searchSession = null;
    DBWriteManager connectionPool = null;
    DBconnection conn = null;
    ScrollParams scrollParams = null;
    SearchResultsCollection searchCollection = null;
    GeneSearcher searcher = null;
    String query_id = "";
    try {
      connectionPool = DBWriteManager.getInstance();
      conn = connectionPool.getSearchConnection();

      scrollParams = ScrollCalculator.getScrollParams(request);
      searcher = new GeneSearcher();

      // if first time searching, populate temp table with search results
      // and get 1st page of results
      if (firstSearch) {

        // create search data that persists in session
        searchParams = getSearchParams(request, conn);

        // check for the origin of the search request
        // if it came from the goslim results page then the temp
        // table that holds the loci names used for input into
        // the goslim search
        if (searchParams.get("origin") != null) {
          String origin = (String)searchParams.get("origin");

          // check to see that the temp table that holds
          // the input loci from the goslim search is still
          // active
          searchSession = SessionHandler.getSearchSession(request);
          if (searchSession != null && searchSession.searchInProgress(origin)) {

          } else {
            throw new SessionOutOfTimeException("No "
                                                + origin
                                                + " search in progress");

          }
        }

        // Check any search term
        // Check any search term
        String searchTerm = (String)searchParams.get("searchTerm");
        if (searchTerm != null) {
          checkSearchTerm(searchTerm);
        }
        
        // Check any name
        String name = (String)searchParams.get("name");
        if (name != null) {
          checkSearchTerm(name);
        }

        // register with searchSession
        String insert_query =
          searcher.generateInsertLine(conn, searchParams, "form");
        System.out.println("insert query : " + insert_query);
        if (MasterTableInfo.queryIDExists(insert_query, conn)) {
          System.out.println("query already exists : ");
          firstSearch = false;
        }
        query_id = MasterTableInfo.getQueryID(insert_query, conn, searchType);
        System.out.println("query id : " + query_id);
        // SessionHandler will automatically register search with
        // SearchSession if not done already
        searchSession =
          SessionHandler.getSearchSession(request, conn, searchType);

        searchParams.put("query_id", query_id);

        // setting the search criteria by query_id instead of type
        searchSession.setSearchCriteria(query_id, searchParams);
        searchCollection =
          searcher.search(conn, searchParams, scrollParams, firstSearch);

        // else if paging through results, retrieve requested
        // results slice
      } else {
        searchSession = SessionHandler.getSearchSession(request);

        if (searchSession != null && searchSession.searchInProgress(searchType)) {

          if (!TextConverter.isEmpty(request.getParameter("query_id"))) {
            query_id = (String)request.getParameter("query_id");
            searchParams = searchSession.getSearchCriteria(query_id);
            if (searchParams == null) {
              throw new SessionOutOfTimeException("No gene search in progress");
            }
          } else {
            throw new SessionOutOfTimeException("No gene search in progress");
          }

          searchParams.put("query_id", query_id);

          // searchParams = searchSession.getSearchCriteria(searchType);
          searchCollection =
            searcher.search(conn, searchParams, scrollParams, false);

          // check for any items selected for download
          // and save in searchSession
          // until download is selected action
          if (!TextConverter.isEmpty(request.getParameter("id"))) {
            Long[] ids =
              TextConverter.stringToLongArray(request.getParameterValues("id"));
            searchSession.addDownload(query_id, ids);
          }

        } else {
          throw new SessionOutOfTimeException("No gene search in progress");
        }
      }

      response = new RequestHandlerResponse();
      response.setAttribute("query_id", query_id);
      response.setAttribute("searchCollection", searchCollection);
      response.setAttribute("searchParams", searchParams);
      response.setPage(searchCollection.getResultsPage());

    } finally {
      if (conn != null) {
        connectionPool.return_connection(conn);
      }
    }
    return response;
  }

  /**
   * Check the search term for syntax issues. Currently this checks only whether
   * an escape character \ is next to a % or _.
   * 
   * @param searchTerm the search term to check
   * @throws InvalidParameterException when there is an invalid character or 
   * some other error in the term
   */
  private void checkSearchTerm(String searchTerm) throws InvalidParameterException {
    if (searchTerm.contains("\\")) {
      int index = searchTerm.indexOf('\\', 0);
      while (index >= 0) {
        String next = searchTerm.substring(index + 1, index+2);
        if (!(next.equals("%") || next.equals("_"))) {
          throw new InvalidParameterException("Illegal escaped character \\"
                                             + next + " in search term " + searchTerm);
        } else {
          // Find next escape char
          index = searchTerm.indexOf('\\', index+1);
        }
      }
    }

  }

  /*
   * utility method to translate a form field value into a Boolean; If request
   * parameter is found with fieldName, and fieldName equals "true", a Boolean
   * true value is stored in searchParams with fieldName as key; if no parameter
   * found with fieldName, or if value is anything but "true", a Boolean false
   * value is stored
   */
  private void createBoolean(HttpServletRequest request, Map searchParams,
                             String fieldName) {
    String formValue = request.getParameter(fieldName);
    if (!TextConverter.isEmpty(formValue) && formValue.equals("true")) {
      searchParams.put(fieldName, new Boolean(true));
    } else {
      searchParams.put(fieldName, new Boolean(false));
    }
  }

  // retrieve search params from request
  private Map getSearchParams(HttpServletRequest request, DBconnection conn)
      throws InvalidFormException, SQLException {

    HashMap searchParams = new HashMap();
    HashMap errors = new HashMap();
    KeywordSearchHelper ksh = new KeywordSearchHelper();

    searchParams.put("taxon", request.getParameter("taxon"));
    if (request.getParameter("taxon") != null
        && !request.getParameter("taxon").equalsIgnoreCase("any")) {
      Long taxon_id = new Long(request.getParameter("taxon"));
      searchParams.put("taxon_name",
                       TfcTaxon.get_scientific_name(conn, taxon_id));
      System.out.println("doing this thing : "
                         + TfcTaxon.get_scientific_name(conn, taxon_id));
    }
    if (!TextConverter.isEmpty(request.getParameter("name"))) {
      searchParams.put("name", request.getParameter("name"));
      searchParams.put("method", request.getParameter("method"));
      searchParams.put("name_type", request.getParameter("name_type"));
    }

    // translate checkboxes into Boolean values
    // checkboxes are no longer used on this page...
    String[] checkboxes =
      new String[] { "is_predicted", "has_full_length_cDNA", "is_sequenced",
                    "is_not_sequenced", "has_cDNA_or_EST", "is_genetic_marker",
                    "has_publication", "is_on_a_map", "is_obsolete" };

    for (int i = 0; i < checkboxes.length; i++) {
      createBoolean(request, searchParams, checkboxes[i]);
    }

    // translate gene_model_advanced param.
    // This information was previously stored in checkboxes.
    if (!TextConverter.isEmpty(request.getParameter("gene_model_advanced"))) {
      String[] advancedTypes =
        request.getParameterValues("gene_model_advanced");

      for (int i = 0; i < advancedTypes.length; i++) {
        searchParams.put(advancedTypes[i], new Boolean(true));
      }
    }

    if (!TextConverter.isEmpty(request.getParameter("gene_model_type"))) {
      String[] geneModelTypes = request.getParameterValues("gene_model_type");
      if (geneModelTypes.length > 0 && !geneModelTypes[0].equals("any")) {
        searchParams.put("gene_model_type", geneModelTypes);
      }
    }

    if (!TextConverter.isEmpty(request.getParameter("limit_time"))) {
      GregorianCalendar now = new GregorianCalendar();
      now.add(Calendar.MONTH, -2); // set month back two months
      java.util.Date date = now.getTime();
      searchParams.put("limit_time", date);
    }

    // If assembly unit info specified, search is coming from
    // assembly unit detail page
    if (!TextConverter.isEmpty(request.getParameter("assembly_map_element_id"))) {
      try {
        searchParams.put("assembly_unit_name",
                         request.getParameter("assembly_unit_name"));
        searchParams.put("assembly_map_element_id",
                         new Long(request.getParameter("assembly_map_element_id")));
      } catch (NumberFormatException nfe) {
        errors.put("assembly unit map element id", nfe.getMessage());
      }
    }

    String order = null;
    if (!TextConverter.isEmpty(request.getParameter("order"))) {
      order = request.getParameter("order");
      searchParams.put("order", order);
    }

    String chromosome = null;
    if (!TextConverter.isEmpty(request.getParameter("chromosome"))) {
      chromosome = request.getParameter("chromosome");
      searchParams.put("chromosome", chromosome);
    }

    String map_type = null;
    if (!TextConverter.isEmpty(request.getParameter("map_type"))) {
      map_type = request.getParameter("map_type");
      searchParams.put("map_type", map_type);
    }

    String low_range = null;
    if (!TextConverter.isEmpty(request.getParameter("low_range"))) {
      low_range = request.getParameter("low_range");
      searchParams.put("range_type", request.getParameter("range_type"));
      searchParams.put("low_unit", request.getParameter("low_unit"));
      searchParams.put("low_range", low_range);
    }

    String high_range = null;
    if (!TextConverter.isEmpty(request.getParameter("high_range"))
        && !(request.getParameter("high_range")).trim().equals("--unused--")) {

      high_range = request.getParameter("high_range");
      searchParams.put("range_type", request.getParameter("range_type"));
      searchParams.put("high_unit", request.getParameter("high_unit"));
      searchParams.put("high_range", high_range);
    }

    if ((low_range != null || high_range != null) && map_type == null) {
      errors.put("map type", "Map type must be specified to search by map "
                             + "location range");
    }

    // translate assignments from input to searchable assignment values
    // if searching by map location
    if (Units.validMapType((String)searchParams.get("map_type"))) {
      Units units = new Units(conn, searchParams);
      searchParams.put("units", units);
    }

    if ((order != null && order.equalsIgnoreCase("position"))
        && map_type == null) {
      errors.put("map type",
                 "Map type must be specified when ordering by position");
    }

    if (!TextConverter.isEmpty(request.getParameter("slim_name"))
        && !TextConverter.isEmpty(request.getParameter("origin"))) {
      searchParams.put("slim_name", request.getParameter("slim_name"));
      searchParams.put("origin", request.getParameter("origin"));
      searchParams.put("origin_identifier",
                       request.getParameter("origin_identifier"));
    }
    ksh.putKeywordIncludeParams(request, searchParams);

    if (errors != null && !errors.isEmpty()) {
      throw new InvalidFormException(errors, "Errors on form submission");
    }

    return searchParams;
  }

  // collect information for each gene in selected locus and
  // create tab-delimited export string for download
  private RequestHandlerResponse download(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidParameterException,
      SessionOutOfTimeException {
    RequestHandlerResponse response = null;
    Long[] formIDs;
    SearchSession searchSession = null;
    Vector ids = null;
    DBconnection conn = null;
    DBReadManager connectionPool = null;
    StringBuffer export = null;
    GeneSummary[] genes = null;
    GeneSearcher searcher = null;

    // make sure search is still in session
    searchSession = SessionHandler.getSearchSession(request);
    String query_id = (String)request.getParameter("query_id");
    if (searchSession == null
        || !searchSession.searchInProgress(searchType)
        || query_id == null) {
      throw new SessionOutOfTimeException("No gene search in progress");
    } else {
      // get any loci selected on previous pages
      if (ids == null) {
        ids = new Vector();
      }
    }

    // combine previously selected with selections from current page
    if (!TextConverter.isEmpty(request.getParameter("id"))) {
      formIDs =
        TextConverter.stringToLongArray(request.getParameterValues("id"));
      if (formIDs != null && formIDs.length > 0) {
        for (int i = 0; i < formIDs.length; i++) {
          ids.add(formIDs[i]);
        }
      }
    }
    if (ids == null || ids.isEmpty()) {
      throw new InvalidFormException("No genes selected for download");
    }
    // get collection of Genes from search results using selected
    // locus IDs
    try {
      connectionPool = DBReadManager.getInstance();
      conn = connectionPool.get_connection();
      searcher = new GeneSearcher();
      genes = searcher.getSelected(ids, query_id);
      export = new StringBuffer();
      if (genes != null && genes.length > 0) {
        export.append(genes[0].getExportHeader());
        // get header from first element in results
        for (int i = 0; i < genes.length; i++) {
          export.append(genes[i].createExport(conn));
        }
      }
      response = new RequestHandlerResponse();
      response.setAttribute("downloadText", export.toString());
      response.setPage("/jsp/common/download.jsp");
    } catch (NumberFormatException nfe) {
      throw new InvalidParameterException("Invalid locus id: "
                                          + nfe.getMessage());
    } finally {
      if (conn != null) {
        connectionPool.return_connection(conn);
      }
    }
    return response;
  }

  // this download content population takes in gene ids; used for download all
  public String populateDownloadContent(Long[] ids) throws SQLException {
    GeneSummary gene = null;
    DBconnection conn = null;
    DBReadManager connectionPool = null;
    StringBuffer export = new StringBuffer();
    if (ids != null && ids.length > 0) {
      boolean first = true;
      // get header from first element in results
      for (int i = 0; i < ids.length; i++) {
        try {
          connectionPool = DBReadManager.getInstance();
          conn = connectionPool.get_connection();
          gene = new GeneSummary(conn, (Long)ids[i]);
          if (first) {
            export.append(gene.getExportHeader());
            first = false;
          }
          export.append(gene.createExport(conn));
        } finally {
          if (conn != null) {
            connectionPool.return_connection(conn);
          }
        }
      }
    }
    return export.toString();
  }

  private RequestHandlerResponse sendToDL(HttpServletRequest request,
                                          String type) throws SQLException,
      InvalidFormException, InvalidParameterException,
      SessionOutOfTimeException {

    RequestHandlerResponse response = null;
    Long[] formIDs;
    SearchSession searchSession = null;
    Vector ids = null;
    DBconnection conn = null;
    DBReadManager connectionPool = null;
    String[] gene_names = null;
    GeneSummary[] genes = null;
    GeneSearcher searcher = null;

    // make sure search is still in session
    searchSession = SessionHandler.getSearchSession(request);
    String query_id = (String)request.getParameter("query_id");

    if (searchSession == null || !searchSession.searchInProgress(searchType)) {
      throw new SessionOutOfTimeException("No gene search in progress");
    } else {
      ids = searchSession.getDownload(query_id);
      // get any loci selected on previous pages
      if (ids == null) {
        ids = new Vector();
      }
    }

    // combine previously selected with selections from current page
    if (!TextConverter.isEmpty(request.getParameter("id"))) {
      formIDs =
        TextConverter.stringToLongArray(request.getParameterValues("id"));
      if (formIDs != null && formIDs.length > 0) {
        for (int i = 0; i < formIDs.length; i++) {
          ids.add(formIDs[i]);
        }
      }
    }
    if (ids == null || ids.isEmpty()) {
      throw new InvalidFormException("No genes selected for download");
    }

    // get collection of Genes from search results using selected
    // locus IDs
    try {
      connectionPool = DBReadManager.getInstance();
      conn = connectionPool.get_connection();
      searcher = new GeneSearcher();
      genes = searcher.getSelected(ids, query_id);
      if (genes != null && genes.length > 0) {
        HashMap hm = new HashMap();
        for (int i = 0; i < genes.length; i++) {
          GeneSummary gs = (GeneSummary)genes[i];
          hm.put((String)gs.get_locus(), 1);
        }
        Set set = hm.entrySet();
        gene_names = new String[hm.size()];
        Iterator i = set.iterator();
        int j = 0;
        while (i.hasNext()) {
          Map.Entry me = (Map.Entry)i.next();
          gene_names[j] = (String)me.getKey();
          j++;
        }
      }
      response = new RequestHandlerResponse();
      response.setAttribute("gene_names", gene_names);
      if (type.equals("sequence")) {
        response.setPage("/tools/bulk/sequences/index.jsp");
      } else {
        response.setPage("/tools/bulk/sequences/index.jsp");
      }
    } catch (NumberFormatException nfe) {
      throw new InvalidParameterException("Invalid locus id: "
                                          + nfe.getMessage());
    } finally {
      if (conn != null) {
        connectionPool.return_connection(conn);
      }
    }
    return response;
  }

  private RequestHandlerResponse sendToDLAll(HttpServletRequest request,
                                             String type) throws SQLException,
      InvalidFormException, SessionOutOfTimeException,
      InvalidParameterException {

    RequestHandlerResponse response = null;
    SearchSession searchSession = null;
    int capacity = 0;
    String[] ids = null; // Longs
    String query = null;
    DBconnection conn = null;
    DBReadManager connectionPool = null;

    // make sure search is still in session
    searchSession = SessionHandler.getSearchSession(request);
    String query_id = (String)request.getParameter("query_id");
    if (searchSession == null
        || !searchSession.searchInProgress(searchType)
        || query_id == null) {
      throw new SessionOutOfTimeException("No gene search in progress");
    }

    // populate array of ids from temp table
    // if size of vectore < 1000 proceed with download as usual
    // spawn a download thread, handing a reference back to the
    // GeneSearchHandler to populate the download contents from the
    // download thread; that way it removes type specific processing
    // for future generalized usage
    query =
      "SELECT DISTINCT locus as name FROM RESULT_GENE WHERE QUERY_ID = '"
          + query_id
          + "' ";

    try {
      connectionPool = DBReadManager.getInstance();
      conn = connectionPool.get_connection();
      Debugger.println(Debugger.logMsg(this,
                                       "send this locus name to sequence bulk dl tool query "
                                           + query));
      conn.setQuery(query);
      ResultSet results = conn.getResultSet();
      if (!TextConverter.isEmpty(request.getParameter("size"))) {
        capacity = new Integer(request.getParameter("size")).intValue();
      }
      Debugger.println(Debugger.logMsg(this, "capacity " + capacity));
      int idx = 0;
      HashMap hm = new HashMap();
      while (results.next()) {
        hm.put((String)results.getString("name"), 1);
      }
      Set set = hm.entrySet();
      ids = new String[hm.size()];
      Iterator i = set.iterator();
      int j = 0;
      while (i.hasNext()) {
        Map.Entry me = (Map.Entry)i.next();
        ids[j] = (String)me.getKey();
        j++;
      }
    } finally {
      if (conn != null) {
        connectionPool.return_connection(conn);
      }
    }
    response = new RequestHandlerResponse();
    response.setAttribute("gene_names", ids);
    if (type.equals("sequence")) {
      response.setPage("/tools/bulk/sequences/index.jsp");
    } else {
      response.setPage("/tools/bulk/sequences/index.jsp");
    }
    return response;
  }

  // provides capability to download all the genes that are stored in the
  // temp table as results from searching
  // collect information for each gene in selected locus and
  // create tab-delimited export string for download
  private RequestHandlerResponse downloadAll(HttpServletRequest request)
      throws SQLException, InvalidFormException, SessionOutOfTimeException,
      InvalidParameterException {
    RequestHandlerResponse response = null;
    SearchSession searchSession = null;
    int capacity = 0;
    Long[] ids = null; // Longs
    String query = null;
    DBconnection conn = null;
    DBReadManager connectionPool = null;

    // make sure search is still in session
    searchSession = SessionHandler.getSearchSession(request);
    String query_id = (String)request.getParameter("query_id");
    if (searchSession == null
        || !searchSession.searchInProgress(searchType)
        || query_id == null) {
      throw new SessionOutOfTimeException("No gene search in progress");
    }
    // populate array of ids from temp table
    // if size of vectore < 1000 proceed with download as usual
    // spawn a download thread, handing a reference back to the
    // GeneSearchHandler to populate the download contents from the
    // download thread; that way it removes type specific processing
    // for future generalized usage
    query =
      "SELECT DISTINCT gene_id FROM RESULT_GENE WHERE QUERY_ID = '"
          + query_id
          + "' ";

    try {
      connectionPool = DBReadManager.getInstance();
      conn = connectionPool.get_connection();
      Debugger.println(Debugger.logMsg(this, "downloadAll gene id query "
                                             + query));
      conn.setQuery(query);
      ResultSet results = conn.getResultSet();
      if (!TextConverter.isEmpty(request.getParameter("size"))) {
        capacity = new Integer(request.getParameter("size")).intValue();
      }
      Debugger.println(Debugger.logMsg(this, "capacity " + capacity));
      ids = new Long[capacity];
      int idx = 0;
      while (results.next()) {
        ids[idx] = new Long(results.getLong("gene_id"));
        idx++;
      }
    } finally {
      if (conn != null) {
        connectionPool.return_connection(conn);
      }
    }
    response = new RequestHandlerResponse();
    if (ids.length > 1000) {
      // store the id list in session
      searchSession.addDownload(query_id, ids);
      response.setAttribute("type", searchType);
      response.setAttribute("query_id", query_id);
      response.setPage("/jsp/community/email_address.jsp");
    } else {
      response.setAttribute("downloadText", populateDownloadContent(ids));
      response.setPage("/jsp/common/download.jsp");
    }
    return response;
  }

  // initiates a separate thread to process large download results stes
  // and emails a notification containing the url where the results are
  // located to the provided email address
  private RequestHandlerResponse email(HttpServletRequest request)
      throws SessionOutOfTimeException {

    RequestHandlerResponse response = null;
    String emailAddress = null;
    SearchSession searchSession = null;
    File fTemp = null;
    FileWriter fwTemp = null;
    Map searchParams = null;
    Long[] ids = null;
    Vector savedIds = null;
    // need a random ID for the file name
    Random generator = new Random(System.currentTimeMillis());
    int fileID = generator.nextInt();

    // make sure search is still in session
    searchSession = SessionHandler.getSearchSession(request);
    String query_id = (String)request.getParameter("query_id");
    if (searchSession == null
        || !searchSession.searchInProgress(searchType)
        || query_id == null) {
      throw new SessionOutOfTimeException("No gene search in progress");
    } else {

      searchParams = searchSession.getSearchCriteria(query_id);

      // get ids from session
      savedIds = searchSession.getDownload(query_id);
      // get any loci selected on previous pages
      if (savedIds == null) {
        savedIds = new Vector();
      }
    }
    // put the saveds ids from session into an array of Longs
    ids = new Long[savedIds.size()];
    for (int i = 0; i < savedIds.size(); i++) {
      ids[i] = (Long)savedIds.elementAt(i);
    }
    response = new RequestHandlerResponse();
    try {
      setFilename(searchType + "_" + query_id + "_download.txt");
      fTemp = new File(WebApp.getAbsDynImageDir() + getFilename());
      fwTemp = new FileWriter(fTemp);
      fwTemp.write("Your download results are being processed."
                   + " Please check back in a few minutes. \n"
                   + " Refresh your browser to view your results. "
                   + " You may want to bookmark this page for your convenience. ");
      fwTemp.close();
    } catch (IOException se) {
      System.err.println("IO Exception in download thread: " + se.getMessage());
      se.printStackTrace();
    }
    if (request.getParameter("emailAddress") != null) {
      emailAddress = request.getParameter("emailAddress");
      // set up thread here
      DownloadThread thread = new DownloadThread();
      thread.setSearchCriteria(getPlainFormatSearchCriteria(searchParams));
      thread.setIds(ids);
      thread.setHandler(this);
      thread.setTempFile(fTemp);
      thread.setEmailAddress(emailAddress);
      thread.start();
      response.setAttribute("downloadURL", WebApp.getDynImageDir()
                                           + getFilename());
      response.setAttribute("searchUrl", "Search?action=new_search&type=gene");
      response.setPage("/jsp/common/download_all_response.jsp");
    } else {
      response.setAttribute("downloadText",
                            "No email address has been provided ");
      response.setPage("/jsp/common/download.jsp");
    }
    return response;
  }

  // sets the filename used for download all results
  private void setFilename(String filename) {
    this.filename = filename;
  }

  private String getPlainFormatSearchCriteria(Map searchParams) {
    StringBuffer buffer = null;
    String criteria = null;
    Boolean isObsolete;

    if (searchParams != null) {
      buffer = new StringBuffer();
      String taxon = (String)searchParams.get("taxon");
      String taxon_name = (String)searchParams.get("taxon_name");

      String search_name = (String)searchParams.get("name");
      String search_method = (String)searchParams.get("method");
      String name_type = (String)searchParams.get("name_type");

      String[] gene_model_type = (String[])searchParams.get("gene_model_type");

      Boolean is_predicted = (Boolean)searchParams.get("is_predicted");
      Boolean has_full_length_cDNA =
        (Boolean)searchParams.get("has_full_length_cDNA");
      Boolean is_sequenced = (Boolean)searchParams.get("is_sequenced");
      Boolean is_not_sequenced = (Boolean)searchParams.get("is_not_sequenced");
      Boolean is_genetic_marker =
        (Boolean)searchParams.get("is_genetic_marker");
      Boolean is_on_a_map = (Boolean)searchParams.get("is_on_a_map");
      isObsolete = (Boolean)searchParams.get("is_obsolete");
      Boolean has_cDNA_or_EST = (Boolean)searchParams.get("has_cDNA_or_EST");
      Boolean has_publication = (Boolean)searchParams.get("has_publication");

      java.util.Date limit_time =
        (java.util.Date)searchParams.get("limit_time");
      String chromosome = (String)searchParams.get("chromosome");
      String high_unit = (String)searchParams.get("high_unit");
      String high_range = (String)searchParams.get("high_range");
      String low_unit = (String)searchParams.get("low_unit");
      String low_range = (String)searchParams.get("low_range");
      String range_type = (String)searchParams.get("range_type");
      String map_type = (String)searchParams.get("map_type");
      Units units = (Units)searchParams.get("units");
      String keyword_term = null;
      String keyword_method = null;
      String keywordTypes = null;

      if (searchParams.get("keyword_term") != null) {
        keyword_term = (String)searchParams.get("keyword_term");
        keyword_method = (String)searchParams.get("keyword_method");
      } else {
        keyword_term = "any";
      }
      String evidence = null;
      if (searchParams.get("evidence") != null) {
        evidence = getMultipleFeatures((String[])searchParams.get("evidence"));
      }
      // assembly unit data will only be present if search was linked to from
      // assembly unit detail page
      String assembly_unit_name =
        (String)searchParams.get("assembly_unit_name");

      boolean first = true;
      buffer.append("Your query for genes where ");

      if (!TextConverter.isEmpty(taxon_name)) {
        first = appendComma(buffer, first);
        buffer.append("taxon name is " + taxon_name);
      }

      if (!TextConverter.isEmpty(search_name)) {
        if (name_type != null && name_type.equals("phenotype ")) {
          buffer.append("gene phenotype ");
        } else if (name_type != null && name_type.equals("accession")) {
          buffer.append("GenBank accession ");
        } else if (name_type != null && name_type.equals("genbank_gi")) {
          buffer.append("GenBank gi ");
        } else if (name_type != null && name_type.equals("description")) {
          buffer.append("gene description ");
        } else {
          buffer.append("gene name ");
        }
        buffer.append(TextConverter.convertMethods(search_method));
        buffer.append(" " + search_name);
        first = false;
      }

      if (!TextConverter.isEmpty(keyword_term)) {
        first = appendComma(buffer, first);
        buffer.append("keyword ");
        buffer.append(TextConverter.convertMethods(keyword_method));
        buffer.append(" " + keyword_term);
      }

      if (!TextConverter.isEmpty(keywordTypes)) {
        first = appendComma(buffer, first);
        buffer.append("keyword types " + keywordTypes);
      }

      if (!TextConverter.isEmpty(evidence)) {
        first = appendComma(buffer, first);
        buffer.append("evidence " + evidence);
      }

      if (!TextConverter.isEmpty(assembly_unit_name)) {
        first = appendComma(buffer, first);
        buffer.append("annotation unit is " + assembly_unit_name);
      }

      if (gene_model_type != null && gene_model_type.length > 0) {
        first = appendComma(buffer, first);
        buffer.append("gene model type is ");
        boolean firstType = true;
        for (int i = 0; i < gene_model_type.length; i++) {
          if (!firstType) {
            buffer.append(" or ");
          }
          buffer.append(gene_model_type[i]);
          firstType = false;
        }
      }

      if (has_publication != null && has_publication.booleanValue()) {
        first = appendComma(buffer, first);
        buffer.append("has associated literature");
      }

      if (is_predicted != null && is_predicted.booleanValue()) {
        first = appendComma(buffer, first);
        buffer.append("gene structure predicted");
      }

      if (has_full_length_cDNA != null && has_full_length_cDNA.booleanValue()) {
        first = appendComma(buffer, first);
        buffer.append("has full-length cDNA");
      }

      if (has_cDNA_or_EST != null && has_cDNA_or_EST.booleanValue()) {
        first = appendComma(buffer, first);
        buffer.append("has cDNA or EST");
      }

      if (is_sequenced != null && is_sequenced.booleanValue()) {
        first = appendComma(buffer, first);
        buffer.append("is sequenced");
      }

      if (is_not_sequenced != null && is_not_sequenced.booleanValue()) {
        first = appendComma(buffer, first);
        buffer.append("is not sequenced");
      }

      if (is_on_a_map != null && is_on_a_map.booleanValue()) {
        first = appendComma(buffer, first);
        buffer.append("is on a map");
      }

      if (isObsolete != null && isObsolete.booleanValue()) {
        first = appendComma(buffer, first);
        buffer.append("is obsolete");
      }

      if (is_genetic_marker != null && is_genetic_marker.booleanValue()) {
        first = appendComma(buffer, first);
        buffer.append("is genetic marker");
      }
      if (limit_time != null) {
        first = appendComma(buffer, first);
        buffer.append("entered after: "
                      + TextConverter.dateToString(limit_time));
      }

      if (map_type != null) {
        first = appendComma(buffer, first);
        buffer.append("map type is " + map_type);
      }

      if (chromosome != null) {
        first = appendComma(buffer, first);
        buffer.append("chromosome is " + Units.translateChromosome(chromosome));
      }
      // if searching by element, format is element_type name,
      // else if searching by raw position format is position units
      String formatLowRange = null;
      String formatHighRange = null;
      if (low_range != null
          && low_unit != null
          && (low_unit.equalsIgnoreCase("kb") || low_unit.equalsIgnoreCase("cm"))) {
        formatLowRange = low_range + " " + low_unit;

      } else {
        formatLowRange = low_unit + " " + low_range;
      }

      if (high_range != null
          && high_unit != null
          && (high_unit.equalsIgnoreCase("kb") || high_unit.equalsIgnoreCase("cm"))) {
        formatHighRange = high_range + " " + high_unit;

      } else {
        formatHighRange = high_unit + " " + high_range;
      }
      if (range_type != null && range_type.equalsIgnoreCase("around")) {
        if (units != null) {
          first = appendComma(buffer, first);

          if (low_range != null) {
            buffer.append("around: " + formatLowRange + " within ");
            buffer.append(units.getVariance() + " " + units.get_low_unit());
          }
        }
      } else if (range_type != null && range_type.equalsIgnoreCase("between")) {
        first = appendComma(buffer, first);

        if (low_range != null || high_range != null) {
          buffer.append("range: ");
        }

        if (low_range != null) {
          buffer.append(formatLowRange);
        }

        if (low_range != null && high_range != null) {
          buffer.append(" to ");
        }

        if (high_range != null) {
          buffer.append(formatHighRange + " ");
        }
      }
    }
    criteria = buffer.toString();
    return criteria;
  }

  private String getMultipleFeatures(String[] features) {
    StringBuffer f_buffer = new StringBuffer(" ");
    for (int i = 0; i < features.length; i++) {
      if (i > 0) {
        f_buffer.append(" , ");
      }
      f_buffer.append(features[i]);
    }
    return (new String(f_buffer));
  }

  private final boolean appendComma(StringBuffer buffer, boolean first) {
    if (!first) {
      buffer.append(", ");
    } else {
      first = false;
    }
    return first;
  }

  // gets the filename used for download all results
  private String getFilename() {
    return filename;
  }

}
