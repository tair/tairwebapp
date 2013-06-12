// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.32 $
// $Date: 2006/04/04 23:35:26 $
// ------------------------------------------------------------------------------

package org.tair.search;


import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.tair.handler.MultipartRequestHandler;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.table.MasterTableInfo;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcKeyword;
import org.tair.utilities.Debugger;
import org.tair.utilities.DownloadAllHandler;
import org.tair.utilities.DownloadThread;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.ResultsFetcher;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.StringList;
import org.tair.utilities.TextConverter;
import org.tair.utilities.WebApp;

import com.oreilly.servlet.MultipartRequest;


/**
 * ExpressionSearchHandler handles all search functions for the expression
 * search. When searching, ExpressionSearchHandler uses the
 * <code>SearchSession</code> object to create a temp table to hold an
 * individual users expression search results. With these stored results, user
 * can easily scroll through a large result set through subsequent requests to
 * ExpressionSearchHandler.
 * 
 * <p>
 * ExpressionSearchHandler uses <code>ExpressionSearcher</code> or
 * conditionally <code>SingleChannelSearcher</code> based on selected array
 * type to perform initial search and to store the search results.
 * ExpressionSearchHandler sets response attributes and forwards execution to
 * the appropriate jsp for display. For search summary results display,
 * /jsp/search/expression_summary.jsp or /jsp/search/single_channel_summary.jsp
 * is invoked with the requested page number, the page size, and a textual
 * description of the requested search. The summary jsp calls a utility class
 * <code>ResultsFetcher</code> which has methods for retrieval of data in the
 * results set and meta data about the result set and paging information. For
 * the download option, the utility class <code>ResultsFetcher</code> is used
 * directly by ExpressionSearchHandler to construct a textual result set to be
 * passed to /jsp/common/download.jsp
 * </p>
 * 
 * <p>
 * Expression search form offers user the ability to show or hide different
 * sections of the search form. Since this is not really possible in HTML, each
 * request to show/hide results in a call to the server to get the new form
 * view. ExpressionSearchHandler will receive all of these submissions and will
 * retrieve and validate search params between each page load. If a file upload
 * is received as part of a UI update request, the uploaded file will be
 * validated then saved into user's session. When search is finally executed,
 * file will be retrieved from session and passed to ExpressionSearcher for
 * processing.
 */

public class ExpressionSearchHandler implements MultipartRequestHandler,
    RequestHandler, DownloadAllHandler {

  private String downloadJsp = "/jsp/common/download.jsp";
  private String formJsp = "/jsp/search/expression_form.jsp";
  private String ntfListJsp = "/jsp/search/expression_ntf.jsp";
  private String summaryJsp;
  private String searchCriteria;
  private String ntfMsg;
  private String type;
  private String nameType;
  private String arrayType;
  private String filename;
  private String emailAddress;
  private boolean requestEmailAddress;
  private File uploadedFile; // list of names provided via uploaded file
  private String namesList;// list of names provided via text box
  //private String sessionID;
  private String queryID;
  private String downloadText;
  private boolean hasExperimentCriteria;
  private SearchSession searchSession;
  private Map<String, Object> searchParams =
      new HashMap<String, Object>();
  private HttpServletRequest httpRequest;
  private RequestHandlerResponse response;
  private MultipartRequest multipartRequest;
  
  /**
   * Processes servlet request to perform requested action. Method uses the
   * "action" parameter in the submitted <code>HttpServletRequest</code> to
   * determine what action is appropriate. The possible values of action are:
   * 
   * <ul>
   * <li>search - Search parameters are retrieved from request and passed to
   * ExpressionSearcher for searching</li>
   * <li>results - Requested page number of multiple page result set is
   * retrieved from request and passed on to /jsp/search/expression_summary.jsp
   * to retreive requested page of results using ResultsFetcher class </li>
   * <li>download - Marked rows are retrieved from request and information is
   * retrieved from <code>ResultsFetcher</code> in tab-delimited format for
   * download</li>
   * <li>update_display - Search parameters are retrieved from request and
   * added to response to JSP can fill in form fields with last submitted
   * values. File upload submission will be stored in session until search is
   * executed.
   * 
   * </ul>
   * 
   * @param request HttpServletRequest passed from SearchServlet
   * @return RequestHandlerResponse containing: URL of JSP to forward to and
   *         freshly set response attributes
   * @throws SQLException thrown if a database error occurs while searching
   * @throws InvalidParameterException thrown if an invalid search action is
   *           requested, or an invalid id is submitted for download
   * @throws InvalidFormException thrown if no rows selected for download
   * @throws SessionOutOfTimeException thrown when results are requested and no
   *           expression search is in progress
   */

  public RequestHandlerResponse process(HttpServletRequest httpRequest,
                                        MultipartRequest multipartRequest)
      throws SQLException, InvalidParameterException, InvalidFormException,
      SessionOutOfTimeException {

    // holds info like session id which multipart request does not have
    setHttpRequest(httpRequest);

    // used for get and putting parms from the request into a map
    setMultipartRequest(multipartRequest);

    // action might be in "action" or "search_action" -
    // summary pages use search action
    // because of conflicts with form.action attribute in javascript
    // in Mac IE 4.5
    String action = getMultipartRequest().getParameter("action");
    if (action == null) {
      action = getMultipartRequest().getParameter("search_action");
    }
    type = getMultipartRequest().getParameter("type");
    response = new RequestHandlerResponse();

    if (action != null && action.equals("search")) {
      setSearchParams(false);
      search();
      response.setAttribute("pageNum", new Integer(1));
      response.setAttribute("size", new Integer(getMultipartRequest()
          .getParameter("size")));
      response.setAttribute( "query_id", getQueryID() );
      // get color from param map
      response.setAttribute("color", getSearchParams().get("color"));
      response.setAttribute("searchCriteria", getSearchCriteria());

      // gets a display message about loci or
      // array elements that provides a link to the ntflist.jsp
      // blank if no ntfs
      response.setAttribute("ntfMsg", getNTFMsg());

      response.setPage(getSummaryJsp());

      // if updating display of expression search form, collect values of any
      // search params already entered to save for future searching and
      // redirect to search form to show updated display
    } else if (action != null && action.equals("update_display")) {

      // retrieve submitted values and put in request as Map for
      // displaying again on form when new view is shown
      setSearchParams(true);

      // be sure to add page size, which isn't regularly retrieved
      // by setSearchParams, to search params collection
      getSearchParams().put(
                            "size",
                            new Integer(getMultipartRequest()
                                .getParameter("size")));
      response.setAttribute("searchParams", getSearchParams());

      // get requested show/hide values for different sections of form
      // and put into searchParams for easy access on form through
      // ExpressionSearchFormHelper
      setDisplayParams();

      response.setPage(formJsp);

    } else {
      throw new InvalidParameterException("Invalid search action requested: "
                                          + action);
    }

    return response;

  }

  public RequestHandlerResponse process(HttpServletRequest httpRequest)
      throws SQLException, InvalidParameterException, InvalidFormException,
      SessionOutOfTimeException {

    // holds info like session id which multipart request does not have
    setHttpRequest(httpRequest);

    // action might be in "action" or "search_action" - summary pages use
    // search action because of conflicts with form.action attribute in
    // javascript in Mac IE 4.5
    String action = getHttpRequest().getParameter("action");
    if (action == null) {
      action = getHttpRequest().getParameter("search_action");
    }
    type = getHttpRequest().getParameter("type");
    response = new RequestHandlerResponse();

    // if requesting a new search, clear any previous expression search
    // session object to avoid confusion (form resets will be done through
    // this type of request as well).
    if (action != null && action.equals("new_search")) {
      response.setPage(formJsp);
      SessionHandler.removeExpressionSearchSession(httpRequest);

    } else if (action != null && action.equals("download")) {
      download();
      response.setAttribute("query_id", getQueryID() );
      response.setAttribute("downloadText", getDownloadText());
      response.setPage(downloadJsp);

    } else if (action != null && action.equals("downloadAll")) {
      downloadAll();
      if (requestEmailAddress()) {
        response.setAttribute("query_id", getQueryID() );
        response.setAttribute("type", getType());
        response.setPage("/jsp/community/email_address.jsp");
      } else {
        response.setAttribute("downloadText", getDownloadText());
        response.setPage(downloadJsp);
      }

    } else if (action != null && action.equals("email")) {
      if (getHttpRequest().getParameter("emailAddress") != null) {
        setEmailAddress(getHttpRequest().getParameter("emailAddress"));
        Debugger.println(Debugger.logMsg(this, "email address =  "
                                               + getEmailAddress()));
        email();
        String pieFile = WebApp.getDynImageDir() + getFilename();
        response.setAttribute("downloadURL", pieFile);
        response.setAttribute("searchUrl", "Search?action=new_search&type="
                                           + getType());
        response.setPage("/jsp/common/download_all_response.jsp");
      } else {
        response.setAttribute("downloadText",
                              "No email address has been provided ");
        response.setPage("/jsp/common/download.jsp");
      }

    } else if (action != null && action.equals("ntfListing")) {
      generateNTFListing();
      response.setAttribute("nameType", getNameType());
      response.setAttribute("uploadedFile", getUploadedFile());
      response.setAttribute("namesList", getNamesList());
      response.setPage(ntfListJsp);

    } else if (action != null && action.equals("re_search")) {
      results();
      response.setAttribute("pageNum", new Integer(getHttpRequest()
          .getParameter("pageNum")));
      response.setAttribute("size", new Integer(getHttpRequest()
          .getParameter("size")));

      // get color from param map
      response.setAttribute("color", getSearchParams().get("color"));
      
      response.setAttribute("query_id", getQueryID() );
      response.setAttribute("ntfMsg", getNTFMsg());
      response.setAttribute("searchCriteria", getSearchCriteria());
      response.setAttribute("sortColumn", new String(getHttpRequest()
          .getParameter("sortColumn")));

      response.setPage(getSummaryJsp());

      // need to retain the sort coumn through paging - to show as the
      // selected sort column response.setPage( summaryJsp );
    } else if (action != null && action.equals("re_sort")) {
      results();
      response.setAttribute("pageNum", new Integer(getHttpRequest()
          .getParameter("pageNum")));
      response.setAttribute("size", new Integer(getHttpRequest()
          .getParameter("size")));
      // get color from param map
      response.setAttribute("color", getSearchParams().get("color"));
      
      response.setAttribute("query_id", getQueryID());
      response.setAttribute("ntfMsg", getNTFMsg());
      response.setAttribute("searchCriteria", getSearchCriteria());
      response.setAttribute("sortColumn", new String(getHttpRequest()
          .getParameter("sortColumn")));

      // this is the only difference between re-sort and re-search --
      // / needed so it won't always re-sort but will retain the sort
      // columns upon paging
      response.setAttribute("reSort", new String("T"));

      response.setPage(getSummaryJsp());

    } else {
      throw new InvalidParameterException("Invalid search action requested: "
                                          + action);
    }
    return response;
  }

  /**
   * create a tab-delimited export string from ResultsFetcher for the selected
   * ids from the expression_summary.jsp
   */
  private void download() throws SQLException, InvalidFormException,
      InvalidParameterException, SessionOutOfTimeException {

    String[] formIDs;
    Vector<Long> idList = new Vector<Long>();
    Long[] ids;
    String query_id = "";

    searchSession = SessionHandler.getSearchSession(getHttpRequest());

    // get previous pages ids
    if (searchSession != null && searchSession.searchInProgress(getType())) {
      query_id = (String) getHttpRequest().getParameter("query_id");
      setQueryID( query_id );

      idList = searchSession.getDownload(query_id);
      if (idList == null) {
        idList = new Vector<Long>();
      }
    } else {
      throw new SessionOutOfTimeException("No " + getType()
                                          + " search in progress");
    }
    // combine previously selected with selections from current page
    if (!TextConverter.isEmpty(getHttpRequest().getParameter("id"))) {
      formIDs = getHttpRequest().getParameterValues("id");
      if (formIDs != null && formIDs.length > 0) {
        for (int i = 0; i < formIDs.length; i++) {
          System.out.println("id : " + formIDs[i]);
          Long id = new Long(formIDs[i]);
          idList.add(id);
        }
      }
    }
    if (idList == null || idList.isEmpty()) {
      throw new InvalidFormException("No rows selected for download");
    }
    
    ids = new Long[idList.size()];
    if (idList.size() > 0) {
      for (int i = 0; i < idList.size(); i++) {
        ids[i] = idList.elementAt(i);
      }
    }
    downloadText = populateDownloadContent(ids);
  }

  /**
   * create a tab-delimited export string from ResultsFetcher for all rows in
   * the temp table
   */
  private void downloadAll() throws SQLException, InvalidFormException,
      SessionOutOfTimeException, InvalidParameterException {
    SearchSession searchSession = null;
    Long[] ids = null; // Longs
    ArrayList idList = null;
    String query_id = "";

    // make sure search is still in session
    searchSession = SessionHandler.getSearchSession(getHttpRequest());
    query_id = (String) getHttpRequest().getParameter( "query_id");
    if (searchSession == null || !searchSession.searchInProgress(getType()) || query_id == null) {
      throw new SessionOutOfTimeException("No search in progress");
    }
    setQueryID( query_id );
    ResultsFetcher download = new ResultsFetcher(getQueryID(), getType());
    idList = download.getAllIDsInTempTable();
    Debugger.println(Debugger.logMsg(this, "idlist size =  " + idList.size()));
    ids = new Long[idList.size()];
    if (idList.size() > 0) {
      for (int i = 0; i < idList.size(); i++) {
        ids[i] = (Long)idList.get(i);
        System.out.println("ids : " + ids[i]);
      }
    }
    if (download.getResultSetSize() > 1000) {
      // store the id list in session
      searchSession.addDownload(getQueryID(), ids);
      setRequestEmailAddress(true);
    } else {
      downloadText = populateDownloadContent(ids);
      setRequestEmailAddress(false);
    }
  }

  // initiates a separate thread to process large download results stes
  // and emails a notification containing the url where the results are
  // located to the provided email address
  private void email() throws SessionOutOfTimeException {

    SearchSession searchSession = null;
    File fTemp = null;
    FileWriter fwTemp = null;
    Long[] ids = null;
    Vector savedIds = null;
    // need a random ID for the file name
    Random generator = new Random(System.currentTimeMillis());
    int fileID = generator.nextInt();
    String query_id = (String) getHttpRequest().getParameter( "query_id");
    setQueryID( query_id );

    // make sure search is still in session
    searchSession = SessionHandler.getSearchSession(getHttpRequest());
    searchParams = searchSession.getSearchCriteria(getQueryID());
    setPlainSearchCriteria();
    if (searchSession == null || !searchSession.searchInProgress(getType()) || query_id == null) {
      throw new SessionOutOfTimeException("No search in progress");
    } else {
      // get ids from session
      savedIds = searchSession.getDownload(getQueryID());
      if (savedIds == null) {
        savedIds = new Vector();
      }
    }
    // put the saveds ids from session into an array of Longs
    ids = new Long[savedIds.size()];
    for (int i = 0; i < savedIds.size(); i++) {
      ids[i] = (Long)savedIds.elementAt(i);
    }
    Debugger.println(Debugger.logMsg(this, "temp filecreation  "));
    try {
      // Build the absolute file name.
      setFilename(getType() + "_" + fileID + "_download.txt");
      fTemp = new File(WebApp.getAbsDynImageDir() + getFilename());
      fwTemp = new FileWriter(fTemp);
      fwTemp
          .write("Your download results are being processed."
                 + " Please check back in a few minutes. \n"
                 + " Refresh your browser to view your results. "
                 + " You may want to bookmark this page for your convenience. ");
      fwTemp.close();
    } catch (IOException se) {
      System.err.println("IO Exception in download thread: " + se.getMessage());
      se.printStackTrace();
    }
    // set up thread here
    DownloadThread thread = new DownloadThread();
    thread.setSearchType(getType());
    thread.setSearchCriteria(getSearchCriteria());
    thread.setIds(ids);
    thread.setHandler(this);
    thread.setTempFile(fTemp);
    thread.setEmailAddress(getEmailAddress());
    thread.start();
  }

    /**
    * Execute expression search, populate temp table with search results from the
    * expression_form.jsp
    */
    private void search() throws SQLException, InvalidFormException,
    InvalidParameterException {
        System.out.println("IN THE SEARCH PART OF EXPRESSION SEARC HANDLER!!!!"); 
        DBWriteManager connectionPool = null;
        DBconnection conn = null;

        try { 
            
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();
        
            //
            // we'll need to check to see if any "experiment criteria" are
            // included in the params if so, we'll want to invoke an Experiment
            // Search to populate a temp table with the results from the experiment
            // search given the supplied parameters, then use the results from the
            // temp table as part of the Expression Search. If not, proceed as usual
            // check the five experiment search criteria params:
            // term_2, experiment_goal,
            // experimental_factor, bio_sample, and experiment_category
            if (hasExperimentCriteria) {
                
                // register the search with searchSession
                // invoke the search with the criteria
                System.out.println("has experiment criteria. setting up auxSearcher");
                ExprSearcher auxSearcher = new ExprSearcher();
                String auxSearchType = auxSearcher.getSearchType();
                String aux_query_id = "";
                boolean firstSearch = true;
      
                String insert_query = auxSearcher.generateInsertLine( conn, getSearchParams(), "form");
                if (MasterTableInfo.queryIDExists (insert_query, conn) ){
                    firstSearch = false;
                } 
                aux_query_id = MasterTableInfo.getQueryID( insert_query, conn, auxSearchType );
      
                searchSession =
                    SessionHandler.getSearchSession(getHttpRequest(), auxSearchType);
                searchParams.put ("aux_query_id", aux_query_id );
                searchSession.setSearchCriteria( aux_query_id, getSearchParams());
                auxSearcher.search( getSearchParams(), firstSearch);

                // get the type to pass on to the ExpressionSearcher so it
                // can figure out which temp tbl to join to
                searchParams.put("auxSearchType", auxSearchType);
            }
            String query_id = ""; 
            searchSession =
                SessionHandler.getSearchSession(getHttpRequest(), getType());
            if (getType().equalsIgnoreCase("single_channel")) {
                SingleChannelSearcher scSearcher = new SingleChannelSearcher();
                boolean firstSearch = true;

                String insert_query = scSearcher.generateInsertLine (conn, getSearchParams(), "form");
                if (MasterTableInfo.queryIDExists (insert_query, conn) ){
                    firstSearch = false;
                }
                query_id = MasterTableInfo.getQueryID ( insert_query, conn, getType() );
                searchParams.put("query_id", query_id);
                setQueryID( query_id ); 
                scSearcher.search( getSearchParams(), firstSearch );
            
            
            } else { // original expression searcher
                ExpressionSearcher exSearcher = new ExpressionSearcher();
                boolean firstSearch = true;
                
                String insert_query = exSearcher.generateInsertLine( conn, getSearchParams(), "form");
                if (MasterTableInfo.queryIDExists (insert_query, conn) ){
                    firstSearch = false;
                }
                query_id = MasterTableInfo.getQueryID( insert_query, conn, getType() );
                searchParams.put("query_id", query_id);
                setQueryID( query_id );
                exSearcher.search(getSearchParams(), firstSearch);
            }
            
            searchSession.setSearchCriteria(query_id, getSearchParams());
            setSearchCriteria();
            setNTFMsg();
    
        } finally { 
            if (conn != null ) connectionPool.return_connection(conn);
        }
    }

    /**
    * Page through result set - search results from the expression search
    */
    private void results() throws SQLException, SessionOutOfTimeException {
    searchSession = SessionHandler.getSearchSession(getHttpRequest());
    String query_id = "";

    if (searchSession != null && searchSession.searchInProgress(getType())) {
      query_id = (String) getHttpRequest().getParameter("query_id");
      System.out.println("query : " + query_id);

      searchParams = (HashMap<String, Object>)searchSession.getSearchCriteria(query_id);
      if (searchParams == null ) {
        throw new SessionOutOfTimeException ("No expression search in progress");
      }
      searchParams.put("query_id", query_id);
      setQueryID(query_id);

      setSearchCriteria();
      setNTFMsg();
      // check for any items selected for download and save in
      // searchSession until download is selected as action
      if (!TextConverter.isEmpty(getHttpRequest().getParameter("id"))) {
        Long[] ids =
            TextConverter.stringToLongArray(getHttpRequest()
                .getParameterValues("id"));
        searchSession.addDownload(getQueryID(), ids);
      }
    } else {
      throw new SessionOutOfTimeException("No " + getType()
                                          + " search in progress");
    }
  }

  // this download content population takes in unique row ids for the search;
  // used for download all
  public String populateDownloadContent(Long[] ids) throws SQLException {
    StringBuffer export = new StringBuffer();
    Vector<Long> idList = new Vector<Long>(100);
    boolean first = true;
    ResultsFetcher download = new ResultsFetcher(getQueryID(), getType());
    if (ids != null && ids.length > 0) {
      if (first) {
        // get header
        export.append(download.getExportHeader());
        first = false;
      }
      for (int i = 0; i < ids.length; i++) {
        idList.add(ids[i]);
        if (i % 100 == 0) {
          Debugger.println(Debugger.logMsg(this, "i = " + i));
          // get download data from results set
          download.setDownloadPage(idList);
          export.append(download.createExport());
          idList.clear();
        }
      }
      // get the remaining ids
      if (idList.size() > 0) {
        Debugger.println(Debugger.logMsg(this, "remaining ids, idList size = "
                                               + idList.size()));
        // get download data from results set
        download.setDownloadPage(idList);
        export.append(download.createExport());
      }
    }
    return export.toString();
  }

  /**
   * Generate the listing of not found items
   */
  private void generateNTFListing() throws SQLException,
      SessionOutOfTimeException {
    searchSession = SessionHandler.getSearchSession(getHttpRequest());
    if (searchSession != null && searchSession.searchInProgress(getType())) {
      searchParams =
          (HashMap<String, Object>)searchSession
              .getSearchCriteria(getType());
      setNameType();
      setUploadedFile();
      setNamesList();
      // file stuff is needed for this
    } else {
      throw new SessionOutOfTimeException("No " + getType()
                                          + " search in progress");
    }
  }

  /**
   * Returns a textual description of the requested search for display on the
   * summary page
   */
  private String getSearchCriteria() {
    return searchCriteria;
  }

  /**
   * Assembles a textual description of the requested search using selected
   * parameters stored in a hashmap This version does not include the html
   * formatting for highlights; used for email sent to recipients of the
   * download all function
   */
  private void setPlainSearchCriteria() {
    StringBuffer criteria =
        new StringBuffer("Your query for expression values for ");
	Map params = TextConverter.scrub(getSearchParams());
    // array type
    if (params.get("array_type") != null) {
      setArrayType((String)params.get("array_type"));
      criteria.append(" array type of ");
      criteria.append(getDisplayArrayType());
      criteria.append(" where ");
    }
    // check to see if experiment criteria have been entered
    if (hasExperimentCriteria) {
      criteria.append(" experiment search criteria include ");
      boolean useComma = false;
      if (params.get("term_1") != null) {
        String nameType = (String)params.get("name_type_1");
        if (nameType.equalsIgnoreCase("name")) {
          criteria.append("experiment ");
        }
        criteria.append(nameType + " ");
        criteria.append(TextConverter.convertMethods((String)params
            .get("method_1"))
                        + " ");
        criteria.append((String)params.get("term_1"));
        useComma = true;
      }

      if (params.get("experiment_category") != null) {
        if (useComma) {
          criteria.append(" ,");
        }
        criteria.append(" the experiment category of ");
        criteria.append(StringList
            .stringToCommaString((String)params
                .get("experiment_category")));
        useComma = true;
      }
      if (params.get("experiment_goal") != null) {
        if (useComma) {
          criteria.append(" ,");
        }
        criteria.append(" experiment goal is ");
        criteria.append((String)params.get("experiment_goal"));
        criteria.append(" using method of ");
        criteria.append((String)params.get("goal_method"));
        useComma = true;
      }
      if (params.get("experimental_factor") != null) {
        if (useComma) {
          criteria.append(" ,");
        }
        criteria.append(" experimental factor is ");
        criteria.append((String)params.get("experimental_factor"));
        criteria.append(" using method of ");
        criteria.append((String)params.get("factor_method"));
        useComma = true;
      }
      if (params.get("bio_sample") != null) {
        if (useComma) {
          criteria.append(" ,");
        }
        criteria.append(" sample is ");
        criteria.append((String)params.get("bio_sample"));
        criteria.append(" using method of ");
        criteria.append((String)params.get("bio_sample_method"));
      }
      criteria.append(" and ");
    }

    // Search by name
    if (params.get("input") != null) {
      String nameSearchType = (String)params.get("input");
      if (nameSearchType.equalsIgnoreCase("wild")) {
        // wild carded name search chosen
        if (params.get("expression_name_type") != null) {
          criteria.append((String)params.get("expression_name_type")
                          + " ");
          criteria.append(" matches exactly ");
          criteria.append((String)params.get("expression_term"));
        }
      } else { // list name search chosen
        if (params.get("listNameType") != null) {
          criteria.append(" the provided list of names is of type ");
          criteria.append((String)params.get("listNameType"));
        }
      }
    }
    if (params.get("design") != null) {
      criteria.append(" , the array design of ");
      criteria.append(getMultipleOptions((String[])params.get("design")));
    }
    if (params.get("analysis_level") != null) {
      criteria.append(" , the analysis level of the values at the ");
      criteria.append((String)params.get("analysis_level"));
      criteria.append(" level ");
    }
    if (getArrayType().equalsIgnoreCase("single_channel")) {
      // single channel options
      if (params.get("detection") != null) {
        criteria.append(" , detection is ");
        criteria.append((String)params.get("detection"));
      }
      if (params.get("signal_min") != null) {
        criteria.append(" , signal is between ");
        criteria.append((String)params.get("signal_min"));
        criteria.append(" and ");
        criteria.append((String)params.get("signal_max"));
      }
      if (params.get("percentile_min") != null) {
        criteria.append(" , signal percentile is between ");
        criteria.append((String)params.get("percentile_min"));
        criteria.append(" and ");
        criteria.append((String)params.get("percentile_max"));
      }
    } else {
      // dual channel options
      if (params.get("absolute") != null) {
        criteria.append(" , absolute expression is ");
        criteria.append((String)params.get("absolute"));
      }
      if (params.get("relative") != null) {
        criteria.append(" , relative expression is ");
        criteria.append((String)params.get("relative"));
      }
      if (params.get("value") != null) {
        criteria.append(" with fold change values of ");
        criteria.append((String)params.get("value"));
      }
      if (params.get("error") != null) {
        criteria.append(" and standard error of  ");
        criteria.append((String)params.get("error"));
      }
    }

    criteria.append(" resulted in ");
    searchCriteria = new String(criteria);
  }

  /**
   * Assembles a textual description of the requested search using selected
   * parameters stored in a hashmap
   */
  private void setSearchCriteria() {
    StringBuffer criteria =
        new StringBuffer("Your query for expression values for ");
    Map params = TextConverter.scrub(getSearchParams());
    // array type
    if (params.get("array_type") != null) {
      setArrayType((String)params.get("array_type"));
      criteria.append(" array type of ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(getDisplayArrayType());
      criteria.append("</font> ");
      criteria.append(" where ");
    }
    // check to see if experiment criteria have been entered
    if (hasExperimentCriteria) {
      criteria.append(" experiment search criteria include ");
      boolean useComma = false;
      if (params.get("term_1") != null) {
        String nameType = (String)params.get("name_type_1");
        if (nameType.equalsIgnoreCase("name")) {
          criteria.append("experiment ");
        }
        criteria.append(nameType + " ");
        criteria.append(TextConverter.convertMethods((String)params.get("method_1")) + " ");
        criteria.append("<font class=\"emphasis\">");
        criteria.append((String)params.get("term_1"));
        criteria.append("</font> ");
        useComma = true;
      }

      if (params.get("experiment_category") != null) {
        if (useComma) {
          criteria.append(" ,");
        }
        criteria.append(" the experiment category of ");
        criteria.append("<font class=\"emphasis\">");
        criteria.append(StringList.stringToCommaString(((String)params.get("experiment_category"))));
        criteria.append("</font> ");
        useComma = true;
      }
      if (params.get("experiment_goal") != null) {
        if (useComma) {
          criteria.append(" ,");
        }
        criteria.append(" experiment goal is ");
        criteria.append("<font class=\"emphasis\">");
        criteria.append((String)params.get("experiment_goal"));
        criteria.append("</font> ");
        criteria.append(" using method of ");
        criteria.append("<font class=\"emphasis\">");
        criteria.append((String)params.get("goal_method"));
        criteria.append("</font> ");
        useComma = true;
      }
      if (params.get("experimental_factor") != null) {
        if (useComma) {
          criteria.append(" ,");
        }
        criteria.append(" experimental factor is ");
        criteria.append("<font class=\"emphasis\">");
        criteria.append((String)params.get("experimental_factor"));
        criteria.append("</font> ");
        criteria.append(" using method of ");
        criteria.append("<font class=\"emphasis\">");
        criteria.append((String)params.get("factor_method"));
        criteria.append("</font> ");
        useComma = true;
      }
      if (params.get("bio_sample") != null) {
        if (useComma) {
          criteria.append(" ,");
        }
        criteria.append(" sample is ");
        criteria.append("<font class=\"emphasis\">");
        criteria.append((String)params.get("bio_sample"));
        criteria.append("</font> ");
        criteria.append(" using method of ");
        criteria.append("<font class=\"emphasis\">");
        criteria.append((String)params.get("bio_sample_method"));
        criteria.append("</font> ");
      }
      criteria.append(" and ");
    }

    // Search by name
    if (params.get("input") != null) {
      String nameSearchType = (String)params.get("input");
      if (nameSearchType.equalsIgnoreCase("wild")) {
        // wild carded name search chosen
        if (params.get("expression_name_type") != null) {
          criteria.append((String)params.get("expression_name_type")
                          + " ");
          criteria.append(" matches exactly ");
          criteria.append("<font class=\"emphasis\">");
          criteria.append((String)params.get("expression_term"));
          criteria.append("</font> ");
        }
      } else { // list name search chosen
        if (params.get("listNameType") != null) {
          criteria.append(" the provided list of names is of type ");
          criteria.append("<font class=\"emphasis\">");
          criteria.append((String)params.get("listNameType"));
          criteria.append("</font> ");
        }
      }
    }
    if (params.get("design") != null) {
      criteria.append(" , the array design of ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append(getMultipleOptions((String[])params.get("design")));
      criteria.append("</font> ");
    }
    if (params.get("analysis_level") != null) {
      criteria.append(" , the analysis level of the values at the ");
      criteria.append("<font class=\"emphasis\">");
      criteria.append((String)params.get("analysis_level"));
      criteria.append("</font> ");
      criteria.append(" level ");
    }
    if (getArrayType().equalsIgnoreCase("single_channel")) {
      // single channel options
      if (params.get("detection") != null) {
        criteria.append(" , detection is ");
        criteria.append("<font class=\"emphasis\">");
        criteria.append((String)params.get("detection"));
        criteria.append("</font> ");
      }
      if (params.get("signal_min") != null) {
        criteria.append(" , signal is between ");
        criteria.append("<font class=\"emphasis\">");
        criteria.append((String)params.get("signal_min"));
        criteria.append("</font> ");
        criteria.append(" and ");
        criteria.append("<font class=\"emphasis\">");
        criteria.append((String)params.get("signal_max"));
        criteria.append("</font> ");
      }
      if (params.get("percentile_min") != null) {
        criteria.append(" , signal percentile is between ");
        criteria.append("<font class=\"emphasis\">");
        criteria.append((String)params.get("percentile_min"));
        criteria.append("</font> ");
        criteria.append(" and ");
        criteria.append("<font class=\"emphasis\">");
        criteria.append((String)params.get("percentile_max"));
        criteria.append("</font> ");
      }
    } else {
      // dual channel options
      if (params.get("absolute") != null) {
        criteria.append(" , absolute expression is ");
        criteria.append("<font class=\"emphasis\">");
        criteria.append((String)params.get("absolute"));
        criteria.append("</font> ");
      }
      if (params.get("relative") != null) {
        criteria.append(" , relative expression is ");
        criteria.append("<font class=\"emphasis\">");
        criteria.append((String)params.get("relative"));
        criteria.append("</font> ");
      }
      if (params.get("value") != null) {
        criteria.append(" with fold change values of ");
        criteria.append("<font class=\"emphasis\">");
        criteria.append((String)params.get("value"));
        criteria.append("</font> ");
      }
      if (params.get("error") != null) {
        criteria.append(" and standard error of  ");
        criteria.append("<font class=\"emphasis\">");
        criteria.append((String)params.get("error"));
        criteria.append("</font> ");
      }
    }

    criteria.append(" resulted in ");
    searchCriteria = new String(criteria);
  }

    static String getMultipleOptions ( String[] options ) {
        StringBuilder buf = new StringBuilder(" ");
        for(String opt : options){
            buf.append(opt.replaceAll("<","&lt;").replace(">","&gt;"));
            buf.append(" , ");
        }
        return buf.length() > 1 ? buf.subSequence(0,buf.length()-3).toString() : buf.toString();
    }
 
  /**
   * Returns a message containing a link to the ntf lsit jsp or blank if no ntfs
   */
  private String getNTFMsg() {
    return ntfMsg;
  }

  /**
   * Assembles a message containing a link to the ntf lsit jsp or blank if no
   * ntfs
   */
  private void setNTFMsg() {
    StringBuffer msg = new StringBuffer(" ");
    // if hasNTFs
    if (((Boolean)getSearchParams().get("hasNTFs")).booleanValue()) {
      if (getSearchParams().get("listNameType") != null) {
        nameType = (String)getSearchParams().get("listNameType");
        // resolve which type it is here
        msg.append(" To see records with no hits go to ");
        msg
            .append("<A href=\"Search?type="
                    + getType()
                    + "&nameType="
                    + nameType
                    + "&action=ntfListing\" target=\"_other\">Not Found List</A>");
      }
    }
    ntfMsg = msg.toString();
  }

  /**
   * returns download data as a string
   */
  private String getDownloadText() {
    return downloadText;
  }

  /**
   * Returns user specified search parameters from the form jsp as hash map; key =
   * input name from form, value = selected value
   */
  private Map<String, Object> getSearchParams() {
    return searchParams;
  }

  /**
   * Retrieves experiment search criteria and adds to search params collection.
   * These params will be used by ExprSearcher for actually doing the expression
   * search but must be handled separately here - could use a public method from
   * ExprSearchHandler but the request objects are different -- here we need to
   * use the Multpart Request on account of the upload file option.
   * 
   * Check the five experiment search criteria params: term_1 experiment_goal
   * experimental_factor bio_sample experiment_category
   * 
   * As method retrieves search params, it will set the hasExperimentCriteria
   * flag so other code knows to detail w/experiment params.
   * 
   * @param errors Map to hold validation errors
   * @throws SQLException if database error occurs while translating experiment
   *           criteria into display values
   */
  private void getExperimentParams(Map<String, String> errors)
      throws SQLException {

    if (!TextConverter.isEmpty(getMultipartRequest().getParameter("term_1"))) {
      searchParams.put("term_1", getMultipartRequest().getParameter("term_1")
          .trim());
      searchParams.put("name_type_1", getMultipartRequest()
          .getParameter("name_type_1"));
      searchParams.put("method_1", getMultipartRequest()
          .getParameter("method_1"));
      hasExperimentCriteria = true;
    }

    // if searching by experiment category,
    // submitted values will be keyword ids --
    // get keyword values for each for displaying search parameters.
    if (!TextConverter.isEmpty(getMultipartRequest()
        .getParameter("experiment_category"))) {

      String ids =
          StringList.arrayToString(getMultipartRequest()
              .getParameterValues("experiment_category"));
      searchParams.put("experiment_category_id",TextConverter.stringToLongArray(getMultipartRequest().getParameterValues("experiment_category")));

      DBReadManager connectionPool = null;
      DBconnection conn = null;
      try {
        connectionPool = DBReadManager.getInstance();
        conn = connectionPool.get_connection();
        String param =
            StringList.arrayToString(TfcKeyword
                .translateKeywordIDs(conn, StringList.stringToIdList(ids)));
        searchParams.put("experiment_category", param);
      } finally {
        connectionPool.return_connection(conn);
      }
      hasExperimentCriteria = true;
    }
    // check experiment_goal
    if (!TextConverter.isEmpty(getMultipartRequest()
        .getParameter("experiment_goal"))) {

      searchParams.put("experiment_goal", getMultipartRequest()
          .getParameter("experiment_goal").trim());
      searchParams.put("goal_method", getMultipartRequest()
          .getParameter("goal_method"));
      hasExperimentCriteria = true;
    }
    // check experimental_factor
    if (!TextConverter.isEmpty(getMultipartRequest()
        .getParameter("experimental_factor"))) {

      searchParams.put("experimental_factor", getMultipartRequest()
          .getParameter("experimental_factor").trim());

      searchParams.put("factor_method", getMultipartRequest()
          .getParameter("factor_method"));

      hasExperimentCriteria = true;
    }
    // check bio_sample
    if (!TextConverter
        .isEmpty(getMultipartRequest().getParameter("bio_sample"))) {
      searchParams.put("bio_sample", getMultipartRequest()
          .getParameter("bio_sample"));

      searchParams.put("bio_sample_method", getMultipartRequest()
          .getParameter("bio_sample_method"));

      hasExperimentCriteria = true;
    }
  }

  /**
   * Stores the user specified search parameters from the form jsp in a hash map
   * called searchParams where: key = input name from form, value = selected
   * value from form.
   * 
   * <p>
   * Handling of file input will be slightly different if current request is
   * just updating search form view as opposed to actually executing search.
   * updateDisplay flag lets file handling method know which is happening now.
   * (See getFileInput for gory details)
   * 
   * @param updateDisplay If <code>true</code>, search form display is being
   *          updated (meaning no search will be executed); if
   *          <code>false</code> search will be executed)
   * @throws InvalidFormException if invalid form input received
   * @throws SQLException if a database error occurs while retrieving experiment
   *           category display data
   */
  private void setSearchParams(boolean updateDisplay)
      throws InvalidFormException, SQLException {

    HashMap<String, String> errors = new HashMap<String, String>();

    // get experiment search criteria
    getExperimentParams(errors);

    // Retrieve and validate name input for either name type text box
    // or list (from file or textarea).
    getNameInput(errors, updateDisplay);

    // now check out the rest of the form
    if (!TextConverter.isEmpty(getMultipartRequest()
        .getParameter("analysis_level"))) {
      searchParams.put("analysis_level", getMultipartRequest()
          .getParameter("analysis_level"));
    }

    if (!TextConverter
        .isEmpty(getMultipartRequest().getParameter("array_type"))) {
      searchParams.put("array_type", (String)getMultipartRequest()
          .getParameter("array_type"));
      setArrayType((String)getMultipartRequest().getParameter("array_type"));
    }

    if (!TextConverter.isEmpty(getMultipartRequest().getParameter("design"))) {
      searchParams.put("design", getMultipartRequest().getParameterValues("design"));
    }

    if (!TextConverter.isEmpty(getMultipartRequest().getParameter("detection"))) {
      searchParams.put("detection", getMultipartRequest()
          .getParameter("detection"));
    }

    if (!TextConverter
        .isEmpty(getMultipartRequest().getParameter("signal_min"))) {
      searchParams.put("signal_min", getMultipartRequest()
          .getParameter("signal_min"));
    }

    if (!TextConverter
        .isEmpty(getMultipartRequest().getParameter("signal_max"))) {
      searchParams.put("signal_max", getMultipartRequest()
          .getParameter("signal_max"));
    }

    if (!TextConverter.isEmpty(getMultipartRequest()
        .getParameter("percentile_min"))) {
      searchParams.put("percentile_min", getMultipartRequest()
          .getParameter("percentile_min"));
    }

    if (!TextConverter.isEmpty(getMultipartRequest()
        .getParameter("percentile_max"))) {
      searchParams.put("percentile_max", getMultipartRequest()
          .getParameter("percentile_max"));
    }

    if (!TextConverter.isEmpty(getMultipartRequest().getParameter("absolute"))) {
      searchParams.put("absolute", getMultipartRequest()
          .getParameter("absolute"));
    }

    if (!TextConverter.isEmpty(getMultipartRequest().getParameter("relative"))) {
      searchParams.put("relative", getMultipartRequest()
          .getParameter("relative"));
    }

    if (!TextConverter.isEmpty(getMultipartRequest().getParameter("value"))) {
      searchParams.put("value", getMultipartRequest().getParameter("value"));
    }

    if (!TextConverter.isEmpty(getMultipartRequest().getParameter("error"))) {
      searchParams.put("error", getMultipartRequest().getParameter("error"));
    }

    if (!TextConverter.isEmpty(getMultipartRequest().getParameter("order"))) {
      searchParams.put("order", getMultipartRequest().getParameter("order"));
    }

    if (!TextConverter.isEmpty(getMultipartRequest().getParameter("color"))) {
      searchParams.put("color", getMultipartRequest().getParameter("color"));
    }

    // set a default parameter of hasNTFs to false; if there are array elements
    // or loci submitted from a list or file that do not
    // contribute to the result
    // set then this will be set to true and a link will be created in the
    // textual description of the search criteria for users to click
    // on to see the
    // entries that did not get hits
    searchParams.put("hasNTFs", new Boolean(false));

    if (errors != null && !errors.isEmpty()) {
      throw new InvalidFormException(errors, "Errors on form submission");
    }
  }

  /**
   * Retrieves parameters for searching by name. User can search by entering a
   * single name and selecting a name type to search for, or by submitting a
   * list of locus or array element names. List may be submitted either in HTML
   * textarea, or in an uploaded file. Expression search requires that some form
   * of name input be submitted or an error message will be put into errors map.
   * 
   * <p>
   * File upload will be handled slightly differently depending on whether
   * search is being executed now, or if display is just being updated.
   * updateDisplay variable flags which mode we're in currently (see
   * getUploadedFileInput for the gory details on how this flag affects file
   * handling).
   * 
   * @param errors Map to hold any error messages from retrieving name input
   * @param updateDisplay If <code>true</code>, search form display is being
   *          updated (meaning no search will be executed); if
   *          <code>false</code> search will be executed)
   */
  private void getNameInput(Map<String, String> errors, boolean updateDisplay) {

    // error if no name input option selected
    if (TextConverter.isEmpty(getMultipartRequest().getParameter("input"))) {
      errors.put("name search option",
                 "no name search option selected, either wild-carded "
                     + " search or list");
    } else {

      String nameInput = (String)getMultipartRequest().getParameter("input");
      searchParams.put("input", nameInput);

      // get input from text box & name type menu
      if (nameInput.equalsIgnoreCase("wild")) {
        searchParams.put("expression_name_type", getMultipartRequest()
            .getParameter("expression_name_type"));

        searchParams.put("expression_term", getMultipartRequest()
            .getParameter("expression_term"));

        // if name option chosen, make sure to remove any previously
        // uploaded file from memory
        SessionHandler.removeExpressionSearchSession(getHttpRequest());

        // else get list of names from textarea or from file upload
      } else if (nameInput.equalsIgnoreCase("list")) {

        // determine whether names are locus or array element name
        if (!TextConverter.isEmpty(getMultipartRequest()
            .getParameter("listNameType"))) {

          searchParams.put("listNameType", getMultipartRequest()
              .getParameter("listNameType"));
          setNameType();
        }

        // if list selected, must have either a name list, or an upload file
        // (either in current request or session) - if not set error message
        if (!TextConverter.isEmpty(getMultipartRequest().getParameter("names"))) {
          searchParams.put("names", (String)getMultipartRequest()
              .getParameter("names"));

          // if names uploaded through textarea,
          // make sure to remove any previously
          // uploaded file from memory
          SessionHandler.removeExpressionSearchSession(getHttpRequest());

          // if a list from textarea is not provided
          // look for names in uploaded
          // file - if no file found, set error message
        } else if (!getUploadFileInput(errors, updateDisplay)) {
          errors.put("list or file",
                     "either a list or a file must be provided when "
                         + "search by list is chosen");

        }
      }
    }
  }

  /**
   * Get input from uploaded file of element names. File will be saved as a File
   * object reference either in user's session or in search params map;
   * expression searcher will use File reference to parse content into element
   * names when search is executed.
   * 
   * <p>
   * If file is first uploaded as part of an update display request, the file's
   * contents will be parsed and validated to ensure that the file contains good
   * data and an exception can be thrown immediately rather than waiting until
   * search is finally executed (which might be a few page loads later making
   * addressing the error more complicated). Validated file will then be saved
   * in user's session as part of ExpressionSearchSession. This is done so that
   * user does not end up uploading file multiple times in the process of
   * updating the search form view.
   * 
   * <p>
   * Method will return <code>true</code> if a file was uploaded. This is done
   * since calling method will need to verify that some input was received
   * (search requires name or file input). NOTE: if a file was received, but did
   * not pass validation tests, an error will be put into errors map, but method
   * will still return true. This is done since error message generated by false
   * return of this method will only apply to missing data, not invalid data.
   * 
   * @param errors Map to hold any errors that may occur
   * @param updateDisplay if <code>true</code> current request is to update
   *          search form view, not to execute search; if <code>false</code>
   *          current request is to execute search
   * @return <code>true</code> if file input has been received or
   *         <code>false</code> if no file found in request or user's session
   */
  private boolean getUploadFileInput(Map<String, String> errors,
                                     boolean updateDisplay) {
    boolean fileUploaded = false;

    File uploadedFile = null;

    // name of file on user's system - save for displaying on updated
    // search form if needed
    String originalFileName = null;

    // get ExpressionSearchSession object and check if a file has
    // already been uploaded.
    ExpressionSearchSession exprSearchSession =
        SessionHandler.getExpressionSearchSession(getHttpRequest());

    if (exprSearchSession != null && exprSearchSession.hasUploadedFile()) {
      uploadedFile = exprSearchSession.getUploadedFile();

      // else, retrieve file from current request
    } else {

      // multipart request allows for multiple files, but there
      // should never be more than one
      Enumeration files = getMultipartRequest().getFileNames();

      if (files == null) {
        errors.put("file upload", "problem with creating file object");

      } else if (!files.hasMoreElements()) {
        errors.put("file upload", "problem with obtaining file name");

      } else {
        String name = (String)files.nextElement();
        String filename = getMultipartRequest().getFilesystemName(name);
        if (filename == null) {
          errors.put("file upload", "problem with obtaining file system name "
                                    + "from Multipart object");
        }

        uploadedFile = getMultipartRequest().getFile(name);
        originalFileName = getMultipartRequest().getOriginalFileName(name);
      }
    }

    // determine whether to save file in session (if just updating display),
    // or to add to search params map (if executing search).
    if (uploadedFile != null) {

      fileUploaded = true;

      // save in expression search session object if
      // updating search form display
      if (updateDisplay) {

        // if expression search session null, file must be new; validate
        // file input and save until executing search
        if (exprSearchSession == null) {

          exprSearchSession =
              new ExpressionSearchSession(uploadedFile, originalFileName);

          SessionHandler.setExpressionSearchSession(getHttpRequest(),
                                                    exprSearchSession);

          // if expression search session not null,
          // don't need to do anything
          // further until actually executing search
        }

        // If not updating display, search will be executed.
        // Retrieve file and
        // put into search params - searcher will parse and
        // validate as part of
        // searching. Clean up any expression search session from memory.
      } else {
        searchParams.put("file", uploadedFile);
        SessionHandler.removeExpressionSearchSession(getHttpRequest());
      }
    }
    return fileUploaded;
  }

  /**
   * Retrieves submitted values of parameters that control the showing & hiding
   * of different sections of search form. These parameters will be retrieved
   * from the multipart request and added to Map of search parameters. Display
   * values can then be accessed on JSP using ExpressionSearchFormHelper.
   * 
   * <p>
   * This is necessary since display params will be submitted through the
   * multipart form, and so will not be accessible using the HttpServletRequest
   * on the JSP.
   */
  private void setDisplayParams() {
    Map<String, Object> searchParams = getSearchParams();
    MultipartRequest multiRequest = getMultipartRequest();

    searchParams.put("showExpression", multiRequest
        .getParameter("showExpression"));
    searchParams.put("showExperiment", multiRequest
        .getParameter("showExperiment"));
    searchParams.put("showArrayDesign", multiRequest
        .getParameter("showArrayDesign"));
  }

  /**
   * sets this search type
   */
  private void setType(String type) {
    this.type = type;
  }

  /**
   * returns this search type
   */
  private String getType() {
    return type;
  }

  /**
   * sets this array type
   */
  private void setArrayType(String arrayType) {
    if (arrayType != null) {
      if (arrayType.equalsIgnoreCase("single_channel")) {
        setType("single_channel");
        setSummaryJsp("/jsp/search/single_channel_summary.jsp");
      } else { // original jsp
        setType("expression");
        setSummaryJsp("/jsp/search/expression_summary.jsp");
      }
    }
    this.arrayType = arrayType;
  }

  /**
   * returns this array type
   */
  private String getArrayType() {
    return arrayType;
  }

  /**
   * returns this array type without the underscores
   */
  private String getDisplayArrayType() {
    String display = null;
    if (getArrayType() != null) {
      if (getArrayType().equalsIgnoreCase("single_channel")) {
        display = "single channel";
      } else {
        display = "dual channel";
      }
    }
    return display;
  }

  /**
   * sets the summary jsp
   */
  private void setSummaryJsp(String jsp) {
    summaryJsp = jsp;
  }

  /**
   * returns the appropriate summary jsp based on array type
   */
  private String getSummaryJsp() {
    return summaryJsp;
  }

  /**
   * Sets this name type for the search
   */
  private void setNameType() {
    if (getSearchParams().get("listNameType") != null) {
      nameType = (String)getSearchParams().get("listNameType");
    }
  }

  /**
   * Sets the filename for download all reults
   */
  private void setFilename(String filename) {
    this.filename = filename;
  }

  /**
   * Gets the filename for download all reults
   */
  private String getFilename() {
    return filename;
  }

  /**
   * Sets the email address for download all reults
   */
  private void setEmailAddress(String emailAddress) {
    this.emailAddress = emailAddress;
  }

  /**
   * Gets the email address for download all reults
   */
  private String getEmailAddress() {
    return emailAddress;
  }

  /**
   * returns uploaded file submitted by the user
   */
  private File getUploadedFile() {
    return uploadedFile;
  }

  /**
   * sets uploaded file submitted by the user
   */
  private void setUploadedFile() {
    if (getSearchParams().get("file") != null) {
      uploadedFile = (File)getSearchParams().get("file");
    }
  }

  /**
   * returns names list submitted by the user via text box
   */
  private String getNamesList() {
    return namesList;
  }

  /**
   * sets names list submitted by the user via text box
   */
  private void setNamesList() {
    if (getSearchParams().get("names") != null) {
      namesList = (String)getSearchParams().get("names");
    }
  }

  /**
   * returns this name type for the search
   */
  private String getNameType() {
    return nameType;
  }

  /**
   * sets this session id
   */
  private void setQueryID( String queryID ) {
    this.queryID = queryID; 
  }

  /**
   * returns this session id
   */
  private String getQueryID() {
    return queryID;
  }

  /**
   * sets true or false if email address is needed
   */
  private void setRequestEmailAddress(boolean addressNeeded) {
    if (addressNeeded) {
      requestEmailAddress = true;
    } else {
      requestEmailAddress = false;
    }
  }

  /**
   * returns true or false whether email address is needed
   */
  private boolean requestEmailAddress() {
    return this.requestEmailAddress;
  }

  /**
   * sets a handle to this request object
   */
  private void setMultipartRequest(MultipartRequest multipartRequest) {
    this.multipartRequest = multipartRequest;
  }

  /**
   * returns a handle to this request object
   */
  private MultipartRequest getMultipartRequest() {
    return this.multipartRequest;
  }

  /**
   * Sets a handle to this request object
   */
  private void setHttpRequest(HttpServletRequest httpRequest) {
    this.httpRequest = httpRequest;
  }

  /**
   * Returns a handle to this request object
   */
  private HttpServletRequest getHttpRequest() {
    return this.httpRequest;
  }

}
