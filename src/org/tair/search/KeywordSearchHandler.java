// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.21 $
// $Date: 2005/08/03 19:38:12 $
// ------------------------------------------------------------------------------
package org.tair.search;


import java.io.File;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.tair.handler.MultipartRequestHandler;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.goslim.GOSlimBuilder;
import org.tair.search.goslim.GOSlimChart;
import org.tair.search.goslim.GOSlimChartFactory;
import org.tair.search.table.MasterTableInfo;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.GifFactory;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.ResultsFetcher;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.TextConverter;
import org.tair.utilities.WebApp;

import com.oreilly.servlet.MultipartRequest;


/**
 * KeywordSearchHandler handles all search functions for keywords. When
 * searching, KeywordSearchHandler uses the <code>SearchSession</code> object
 * to create a temp table to hold an individual users keyword search results.
 * With these stored results, user can easily scroll through a large result set
 * through subsequent requests to KeywordSearchHandler.
 * 
 * <p>
 * KeywordSearchHandler uses <code>KeywordSearcher</code> to perform initial
 * search and to store the search results. KeywordSearchHandler sets response
 * attributes and forwards execution to the appropriate jsp for display. For
 * search summary results display, /jsp/search/keyword_summary.jsp is invoked
 * with the requested page number, the page size, and a textual description of
 * the requested search. The summary jsp calls a utility class
 * <code>ResultsFetcher</code> which has methods for retrieval of data in the
 * results set and meta data about the result set and paging information. For
 * the download option, the utility class <code>ResultsFetcher</code> is used
 * directly by KeywordSearchHandler to construct a textual result set to be
 * passed to /jsp/common/download.jsp
 * </p>
 */

public class KeywordSearchHandler implements MultipartRequestHandler,
    RequestHandler {

  private String listJsp = "/jsp/goslim/list.jsp";
  private String pieJsp = "/jsp/goslim/pie.jsp";
  private String formJsp = "/jsp/search/keyword_form.jsp";
  private String summaryJsp = "/jsp/search/keyword_summary.jsp";
  // private String downloadJsp = "/jsp/common/download.jsp";
  private String downloadText;
  private String searchCriteria;
  // private String resultsMsg;
  private String type;
  // private String pieType;
  private String chartType;
  private String sessionID;
  private String queryID;
  private String inputQueryID;
  private int compGifHeight;
  private int procGifHeight;
  private int funcGifHeight;
  private String mode;
  private SearchSession searchSession;
  private Map<String, Object> searchParams =
      new HashMap<String, Object>();
  private HttpServletRequest request;
  private RequestHandlerResponse response;
  private MultipartRequest multipartRequest;

  public KeywordSearchHandler() {
  }

  // used for goslim build option only --
  // invoked from htdocs/tools/bulk/go/index.jsp
  public RequestHandlerResponse process(HttpServletRequest httpRequest,
                                        MultipartRequest multipartRequest)
      throws SQLException, InvalidParameterException, InvalidFormException,
      SessionOutOfTimeException {
    if (httpRequest != null) {
      if (multipartRequest != null) {
        setRequest(httpRequest);
        // holds info like session id which multipart request does not have
        setMultipartRequest(multipartRequest);
        // used for getting and putting parms from the multi-part request
        // action might be in "action" or "search_action" -
        // summary pages use search action
        // because of conflicts with form.action attribute in
        // javascript in Mac IE 4.5
        String action = getMultipartRequest().getParameter("action");
        if (action == null) {
          action = getMultipartRequest().getParameter("search_action");
        }
        type = getMultipartRequest().getParameter("type");
        response = new RequestHandlerResponse();
        setSessionID();
        if (action != null && action.equals("build")) {
          boolean htmlOutput = true;
          if (getMultipartRequest().getParameter("output_type") != null) {
            String outputType =
                getMultipartRequest().getParameter("output_type");
            if (outputType.equalsIgnoreCase("text")) {
              htmlOutput = false;
            }
          }
          build(htmlOutput);
          if (!htmlOutput) {
            response.setAttribute("downloadText", getDownloadText());
            response.setPage("/jsp/common/download_mod.jsp");
          } else {
            response.setPage(listJsp);
          }
        } else {
          throw new InvalidParameterException(
                                              "Invalid search action requested: "
                                                  + action
                                                  + " for search type: " + type);
        }
      }
    }
    response.setAttribute("input_query_id", getInputQueryID() );
    response.setAttribute("query_id", getQueryID() );
    return response;
  }

  /**
   * Processes servlet request to perform requested action. Method uses the
   * "action" parameter in the submitted <code>HttpServletRequest</code> to
   * determine what action is appropriate. The possible values of action are:
   * <ul>
   * <li>search - Search parameters are retrieved from request and passed to
   * KeywordSearcher for searching</li>
   * <li>results - Requested page number of multiple page result set is
   * retrieved from request and passed on to /jsp/search/keyword_summary.jsp to
   * retreive requested page of results using ResultsFetcher class </li>
   * <li>download - Marked keywords are retrieved from request and information
   * is retrieved from <code>ResultsFetcher</code> in tab-delimited format for
   * download
   * </ul>
   * 
   * @param request HttpServletRequest passed from SearchServlet
   * @return RequestHandlerResponse containing: URL of JSP to forward to and
   *         freshly set response attributes
   * @exception SQLException thrown if a database error occurs while searching
   * @exception InvalidParameterException thrown if an invalid search action is
   *              requested, or an invalid keyword id is submitted for download
   * @exception InvalidFormException thrown if no keywords selected for download
   * @exception SessionOutOfTimeException thrown when results are requested and
   *              no keyword search is in progress
   */

  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidParameterException, InvalidFormException,
      SessionOutOfTimeException {

    // action might be in "action" or "search_action" - summary pages
    // use search action
    // because of conflicts with form.action attribute in javascript in
    // Mac IE 4.5


    String action = request.getParameter("action");
    if (action == null) {
      action = request.getParameter("search_action");
    }
    type = request.getParameter("type");
    response = new RequestHandlerResponse();
    setRequest(request);
    setSessionID();
    if (getRequest().getParameter("mode") != null) {
      mode = (String)getRequest().getParameter("mode");
    }
    if (action != null && action.equals("chartify")) {
      if (!TextConverter.isEmpty(getRequest().getParameter("chartType")))
        chartType = (String)getRequest().getParameter("chartType");
      chartify();
      response.setAttribute("compHeight", new Integer(getCompGifHeight()));
      response.setAttribute("procHeight", new Integer(getProcGifHeight()));
      response.setAttribute("funcHeight", new Integer(getFuncGifHeight()));
      response.setPage(pieJsp);
    } else if (action != null && action.equals("list")) {
      response.setPage(listJsp);
    } else if (action != null && action.equals("new_search")) {
      response.setAttribute("mode", getMode());
      response.setPage(formJsp);
    } else if (action != null && action.equals("search")) {
      search();
      response.setAttribute("pageNum", new Integer(1));
      response.setAttribute("searchCriteria", getSearchCriteria());
      response.setAttribute("origForm", (String)getRequest()
          .getParameter("origForm"));
      response.setAttribute("mode", getMode());
      response.setAttribute("query_id", getQueryID());
      response.setPage(summaryJsp);
      // should change this to re_search, like the others, mhm
    } else if (action != null && action.equals("results")) {
      results();
      response.setAttribute("pageNum", new Integer(getRequest()
          .getParameter("pageNum")));
      response.setAttribute("searchCriteria", getSearchCriteria());
      response.setAttribute("origForm", (String)getRequest()
          .getParameter("origForm"));
      response.setAttribute("query_id", getQueryID());
      response.setAttribute("mode", getMode());
      response.setPage(summaryJsp);
    } else if (action != null && action.equals("re_sort")) {
      results();
      response.setAttribute("pageNum", new Integer(1));
      response.setAttribute("query_id", getQueryID() );
      response.setAttribute("sortColumn", (String)getRequest()
          .getParameter("sortColumn"));
      response.setPage(listJsp);

    } else if (action != null && action.equals("download")) {
      if (getMode().equalsIgnoreCase("curator")) {
        addSelectedIDs();
      }
      // right now the only user that can select keywords on the
      // results page is curator. The setKeyowrdList adds the
      // current page's selected keywords to any keywords already
      // stored in search session - see results() method

    } else if (action != null && action.equals("ann_type")) {
      // invokes searchers that have implemented the
      // AnnotationTypeSearcher interface in order to display their
      // summary pages that display results from their association
      // to keywords
      response = annotationTypeSearch();

    } else {
      throw new InvalidParameterException("Invalid search action requested: "
                                          + action + " for search type: "
                                          + type);

    }
    return response;
  }

  // registers the search with SearchSessionfor go slim build
  private void build(boolean htmlOutput) throws SQLException,
      InvalidFormException, InvalidParameterException,
      SessionOutOfTimeException {
    setMultipartRequestSearchParams();
    System.out.println("get into this part of the build script");
    searchSession = SessionHandler.getSearchSession(getRequest(), getType());
    // register "locigoslim" search which isn't really a type
    // of search but we need to do it in order to create a temp table
    // that will hold input loci and then be able to share the contents
    // of that table between searches - for instance : the results page of
    // the goslim build has a link on the frequency field which will go
    // to the gene search but it needs the input loci in order to generate
    // the correct results - so that what the temp table that is created here
    // will provide
    GOSlimBuilder gs = new GOSlimBuilder();
    gs.build(getSearchParams() );
    setQueryID ( gs.getQueryID() );
    setInputQueryID ( gs.getInputQueryID() );

    searchSession.setSearchCriteria(gs.getQueryID(), getSearchParams());
    
    searchSession.registerSearch("locigoslim", getQueryID() );
    if (!htmlOutput)
      goSlimDownload(gs.getDownloadIDs());
    // loci parameter will be used when a link from the goslim results page
    // is emnabled to display annotations
    // response.setAttribute( "loci", gs.getPoundTblName() );
  }

	// creates bar and pie charts with goslim data
	private void chartify() throws SQLException, SessionOutOfTimeException
	{
		searchSession = SessionHandler.getSearchSession(getRequest());
		if(searchSession == null || !searchSession.searchInProgress(getType()))
			throw new SessionOutOfTimeException("No goslim build in progress");
		Random generator = new Random(System.currentTimeMillis());
		String absDir = WebApp.getAbsDynImageDir();
		String relDir = WebApp.getDynImageDir();
		Long fileID = generator.nextLong();
		chartifyType("comp", absDir, relDir, fileID+"comp_pie.gif");
		chartifyType("proc", absDir, relDir, fileID+"proc_pie.gif");
		chartifyType("func", absDir, relDir, fileID+"func_pie.gif");
	}

	private void chartifyType(String keywordType, String absDir, String relDir, String gifName) throws SQLException
	{
		String query_id = getRequest().getParameter("query_id");
		String input_query_id = getRequest().getParameter("input_query_id");
		System.out.println("query id : " + query_id );
		GOSlimChart gsp = GOSlimChartFactory.getChart(keywordType, getChartType(), query_id, input_query_id);
		GifFactory.createGIF(gsp.getImage(), absDir + gifName, gsp.getWidth(), gsp.getHeight());
		setFuncGifHeight(gsp.getHeight());
		response.setAttribute(keywordType+"_gif_name",relDir+gifName);
	}

  // create a tab-delimited export string from ResultsFetcher for the
  // ids from the goslim/list.jsp - currently for the goslim
  // list ids cannot be selected individually -- the download option
  // operates only on
  // the entire displayed list
  private void goSlimDownload(Vector ids) throws SQLException,
      InvalidFormException, InvalidParameterException,
      SessionOutOfTimeException {
    StringBuffer export = new StringBuffer(" ");
    if (ids == null || ids.isEmpty()) {
      throw new InvalidFormException("No rows for download");
    }
    ResultsFetcher download = new ResultsFetcher(queryID, type);
    download.setDownloadPage(ids);
    export.append(download.getExportHeader()); // get header
    export.append(download.createExport());
    // get download data from results set
    downloadText = export.toString();
  }

  // execute keyword search, populate temp table with search results from the
  // standalone keyword search and browse form( keyword_form.jsp )
  private void search() throws SQLException, InvalidFormException,
      InvalidParameterException {
    setSearchParams();
    searchSession = SessionHandler.getSearchSession(getRequest(), getType());
    KeywordSearcher kwSearcher = new KeywordSearcher();
    setSearchCriteria();
    DBWriteManager connectionPool = null;
    DBconnection conn = null;
    boolean firstSearch = true;
    String query_id = "";

    try {
        connectionPool = DBWriteManager.getInstance();
        conn = connectionPool.getSearchConnection();

        // search criteria needs to be set by query_id. gotta figure out
        // if this is a first sarch or not. 
        String insert_query = kwSearcher.generateInsertLine( conn, getSearchParams(), "form");
        if (MasterTableInfo.queryIDExists( insert_query, conn ) ){
            firstSearch = false;
        }
        query_id = MasterTableInfo.getQueryID( insert_query, conn, getType() );
        searchParams.put( "query_id", query_id );
        setQueryID( query_id );

    } finally {
        connectionPool.return_connection( conn );
    }
    if (firstSearch != false ){
        searchSession.setSearchCriteria(query_id, getSearchParams());
        kwSearcher.search( (HashMap)getSearchParams() );
    }
  }

  // page through keyword result set - search results from the
  // standalone keyword search
  // and browse form( keyword_form.jsp ),
  // storing selected ids in SearchSession for later retrieval is only being
  // used when in "curator" mode right now
  // the capability of selecting keywords is enabled on the jsp for only
  // that mode however if the feature of selecting keywords from the results
  // page is enabled for other users it will be here
  private void results() throws SQLException, SessionOutOfTimeException,
      InvalidFormException, InvalidParameterException {
    addSelectedIDs();
  }

    // this method adds selected ids to search session's list of selected ids
    // for the keyword search
    // the list of keywords stored in
    // searchSession can later be used for the download capbility
    // and right now could be used for retrieval by the curation tool
    // which is currently how the checkboxes are presented - based
    // on mode = "curation"
    @SuppressWarnings( { "unchecked" })
    private void addSelectedIDs() throws SQLException, InvalidFormException,
    InvalidParameterException, SessionOutOfTimeException {
        
        searchSession = SessionHandler.getSearchSession(getRequest());
        String query_id = "";
        if (searchSession != null && searchSession.searchInProgress(getType())) {
            if ( !TextConverter.isEmpty (getRequest().getParameter("query_id") ) ){
                query_id  = (String) getRequest().getParameter("query_id");
                searchParams = searchSession.getSearchCriteria(query_id);
                if (searchParams == null ) {
                    throw new SessionOutOfTimeException( "No keyword search in progress");
                }
            }else {
                throw new SessionOutOfTimeException( "No keywod search in progress");
            }
            searchParams.put("query_id", query_id );
            setQueryID( query_id );
            
            setSearchCriteria();
            if (!TextConverter.isEmpty(getRequest().getParameter("id"))) {
                Long[] ids = TextConverter.stringToLongArray(getRequest()
                    .getParameterValues("id"));
                searchSession.addDownload(getType(), ids);
            }
        } else {
            throw new SessionOutOfTimeException("No keyword search in progress");
        }
    }

  // execute type specific search and display results - this is from a
  // link off the keyword results page that lists
  // the different keyword/datatype associations such as; genes,
  // publications, annotattions, etc. the link will
  // invoke methods in the type specific searches that are required by
  // the AnnotationTypeSearcher interface, similar to
  // the way the general searcher invokes the type specific searchers
  // after displaying the hit count
  // expected parameters passed via url for type specific search are :
  // kw_id, table, scope ( term, children or combo )
  // type specific searchers that implement AnnotataionTypeSearcher will
  // implement a method which is called here -
  // doAnnotationTypeSearcher( params ) which is a map of the params for
  // the searchers to use to build the sql for the search
  // the result is presentation of the type specific summary page which is
  // populated based on the searcher using the passed in params
  // this is used in situations where associated data counts are displayed
  // the link off the count needs to present an existing searches
  // summary page that reflects the displayed count. The counts can be
  // representative of associated data hits to a keyword by
  // the term alone, or the term's children or both -- this is the purpose of
  // the "scope" parameter
  private RequestHandlerResponse annotationTypeSearch() throws SQLException,
      InvalidFormException, InvalidParameterException {
    RequestHandlerResponse response = null;
    Map<String, Object> params = null;
    SearchResultsCollection searchResults = null;
    AnnotationTypeSearcher searcher = null;
    DBWriteManager connectionPool = null;
    DBconnection conn = null;
    String query_id = "";
    boolean firstSearch = true;

    try {
    
    connectionPool = DBWriteManager.getInstance();
    conn = connectionPool.getSearchConnection();


    if (TextConverter.isEmpty(getRequest().getParameter("kw_id"))) {
      throw new InvalidFormException("No keyword id submitted");
    }
    if (TextConverter.isEmpty(getRequest().getParameter("table"))) {
      throw new InvalidFormException("No search type submitted");
    }
    if (TextConverter.isEmpty(getRequest().getParameter("scope"))) {
      throw new InvalidFormException("No search scope submitted");
    }
    params = new HashMap<String, Object>();
    params.put( "show_obsolete", getRequest().getParameter("show_obsolete") );
    params.put("kw_id", new Long(getRequest().getParameter("kw_id")));
    
    System.out.println("keyword id1st time : " + getRequest().getParameter("table").trim() );
    params.put("table", getRequest().getParameter("table").trim());
    params.put("scope", getRequest().getParameter("scope").trim());
    // make sure to pass session id to searcher for creating/populating
    // temp tables
    params.put("sessionID", getRequest().getSession(true).getId());
    response = new RequestHandlerResponse();
    // currently these are the only three type specific searchers handled
    // as more searchers are added, perhaps the searcher classname could
    // be added to the AnnotationType table
    if (getRequest().getParameter("table").equalsIgnoreCase("Gene") || 
	getRequest().getParameter("table").equalsIgnoreCase("Locus")) {
      searcher = (AnnotationTypeSearcher)new GeneSearcher();
    } else if (getRequest().getParameter("table")
        .equalsIgnoreCase("Publication")) {
      searcher = (AnnotationTypeSearcher)new PublicationSearcher();
    } else if (getRequest().getParameter("table")
        .equalsIgnoreCase("ExpressionSet")) {
      searcher = (AnnotationTypeSearcher)new ExprSearcher();
    } else {
      throw new InvalidFormException("No searcher for this type found");
    }

    //register with searchSession 
    String insert_query = searcher.generateInsertLine( conn, params, "annotation" );
    System.out.println ("insert query keyword search handler : " + insert_query );
    // Because these queries use ? variables, must always execute fresh.
    firstSearch = true;
    //if (MasterTableInfo.queryIDExists ( insert_query, conn ) ){
      //  firstSearch = false;
    //}
    query_id = MasterTableInfo.getQueryID( insert_query, conn, searcher.getSearchType() );

    // need to use searchSession to create temp table for search type and
    // to store search criteria for displaying criteria on every subsequent
    // search results page
    searchSession =
        SessionHandler.getSearchSession(request, searcher.getSearchType());
    params.put("query_id", query_id);

    searchSession.setSearchCriteria(query_id, params);
    searchResults = searcher.doAnnotationTypeSearch(params, firstSearch);
    response.setAttribute("searchCollection", searchResults);
    response.setAttribute("query_id", query_id );
    if (response == null ){
        System.out.println("ersponse is null");
    }else if (searchResults == null ){
        System.out.println ("serach results are null");
    }else if (searchResults.getResultsPage() == null){
        System.out.println ("results page is null");
    }
    response.setPage(searchResults.getResultsPage());
    } finally {
        if (conn != null ) {
            connectionPool.return_connection( conn );
        }
    }
    
    return response;
  }

  // returns a textual description of the requested search for
  // display on the keyword_summary.jsp page
  private String getSearchCriteria() {
    return searchCriteria;
  }

  // assembles a textual description of the requested search using
  // selected parameters stored in a hashmap
  private void setSearchCriteria() {

	Map params = TextConverter.scrub(getSearchParams());

    StringBuffer criteria = new StringBuffer("Your query for keywords where ");
    // Search by name or keyword
    if ((String)params.get("name") != null) {
      criteria.append(TextConverter.convertMethods((String)params.get("method")) + " ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append((String)params.get("name"));
      criteria.append("</font> ");
    } else {
      criteria.append("<font class=\"emphasis\">");
      criteria.append(" any ");
      criteria.append("</font> ");
    }
    if ((String)params.get("extdb_id") != null ) {
        criteria.append(" and external accession is ");
        criteria.append("<font class=\"emphasis\">");
        criteria.append((String)params.get("extdb_id"));
        criteria.append("</font>");
    }
    criteria.append(" resulted in ");
    searchCriteria = criteria.toString();
  }

  // returns download data as a string -- requested from the goslim_form.jsp
  private String getDownloadText() {
    return downloadText;
  }

  // returns user specified search parameters from the form jsp as hash map;
  // key = input name from form, value = selected value
  private Map<String, Object> getSearchParams() {
    return searchParams;
  }

  // stores the user specified search parameters from the form jsp in a
  // hash map called searchParams where:
  // key = input name from form, value = selected value from form
  private void setSearchParams() throws InvalidFormException {
    // for keyword search and browse
    if (!TextConverter.isEmpty(getRequest().getParameter("name"))) {
      searchParams.put("name", getRequest().getParameter("name"));
      searchParams.put("method", getRequest().getParameter("method"));
    }
    if (!TextConverter.isEmpty(getRequest().getParameter("category"))) {
      // There can be multiple categories, so save an array of values
      searchParams.put("category", getRequest().getParameterValues("category"));
    }
    if (!TextConverter.isEmpty(getRequest().getParameter("mode"))) {
      searchParams.put("mode", getMode());
    }
    if (!TextConverter.isEmpty(getRequest().getParameter("extdb_id"))){
        searchParams.put("extdb_id", getRequest().getParameter("extdb_id"));
    }
  }

  // this version used for multipart request -- goslim build option
  // stores the user specified search parameters from the form jsp
  // in a hash map called searchParams where:
  // key = input name from form, value = selected value from form
  private void setMultipartRequestSearchParams() throws InvalidFormException {
    // for goslim
    Map<String, String> errors = new HashMap<String, String>();
    String mode = null;
    if (!TextConverter.isEmpty(getMultipartRequest().getParameter("mode"))) {
      mode = (String)getMultipartRequest().getParameter("mode");
      System.out.println(" mode param not empty ");
      System.out.println(" mode = " + mode);
      searchParams.put("mode", mode);

    }
    if (!mode.equalsIgnoreCase("whole")) {
      if (!TextConverter.isEmpty(getMultipartRequest().getParameter("loci"))) {
        searchParams.put("loci", (String)getMultipartRequest()
            .getParameter("loci"));
      } else {// loci info must be provided by file then
        Enumeration files = getMultipartRequest().getFileNames();
        // eventhough this provides for more than one file the file
        // control only allows selection of one file
        if (files != null) {
          if (files.hasMoreElements()) {
            String name = (String)files.nextElement();
            String filename = getMultipartRequest().getFilesystemName(name);
            if (filename == null) {
              errors.put("file upload", "problem with obtaining file system "
                                        + " name from Multipart object");
            }
            File f = getMultipartRequest().getFile(name);
            if (f != null) {
              searchParams.put("file", f);
            } else {
              errors.put("file upload",
                         "loci information must be provided as a "
                             + "list in either the text area or as an "
                             + "uploaded file ");
            }
          } else {
            errors.put("file upload",
                       "loci information must be provided as a "
                           + "list in either the text area or as an "
                           + "uploaded file ");
          }
        }
      }
    }
    if (errors != null && !errors.isEmpty()) {
      throw new InvalidFormException(errors, "Errors on form submission");
    }

  }

  // returns this search type
  private String getChartType() {
    return chartType;
  }

  // returns this mode - right now only "curator" is valid
  private String getMode() {
    return mode;
  }

  // sets this session id
  private void setSessionID() {
    sessionID = getRequest().getSession(true).getId();
  }
    
  private void setQueryID( String id ){
    System.out.println("the query id of this keyword serach is : " + id );
    queryID = id;
  }

  private String getQueryID(){
    return queryID;
  }
  
  // input query id is the other query id for any tables that are used to
  // generate the input. (like the columns of result_locigoslim)
  private void setInputQueryID ( String id ) { 
    inputQueryID = id;
  } 

  private String getInputQueryID () { 
    return inputQueryID;
  } 

  // returns this session id
  private String getSessionID() {
    return sessionID;
  }

  // sets comp gif height
  private void setCompGifHeight(int height) {
    compGifHeight = height;
  }

  // returns comp gif height
  private int getCompGifHeight() {
    return compGifHeight;
  }

  // sets proc gif height
  private void setProcGifHeight(int height) {
    procGifHeight = height;
  }

  // returns proc gif height
  private int getProcGifHeight() {
    return procGifHeight;
  }

  // sets func gif height
  private void setFuncGifHeight(int height) {
    funcGifHeight = height;
  }

  // returns func gif height
  private int getFuncGifHeight() {
    return funcGifHeight;
  }

  // returns requested pie type
  private String getType() {
    return type;
  }

  // sets a handle to this request object
  private void setMultipartRequest(MultipartRequest multipartRequest) {
    this.multipartRequest = multipartRequest;
  }

  // returns a handle to this request object
  private MultipartRequest getMultipartRequest() {
    return this.multipartRequest;
  }

  // sets a handle to this request object
  private void setRequest(HttpServletRequest request) {
    this.request = request;
  }

  // returns a handle to this request object
  private HttpServletRequest getRequest() {
    return request;
  }

}
