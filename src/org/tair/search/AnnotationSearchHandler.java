//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.8 $
// $Date: 2004/07/23 21:38:41 $
//------------------------------------------------------------------------------

package org.tair.search;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.table.MasterTableInfo;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.TextConverter;

/**
 * AnnotationSearchHandler handles all search functions for keywords. 
 * When searching,
 * AnnotationSearchHandler uses the <code>SearchSession</code> 
 * object to create
 * a temp table to hold an individual users annotation search results. 
 * With these
 * stored results, user can easily scroll through a large result set through
 * subsequent requests to AnnotationSearchHandler.
 *
 * <p>
 * AnnotationSearchHandler uses <code>AnnotationSearcher</code> to perform 
 * initial search
 * and
 * to store the search results.  AnnotationSearchHandler sets response
 *  attributes and forwards
 * execution to the appropriate jsp for display.  For search summary 
 * results display,
 * /jsp/search/annotation_summary.jsp  
 * is invoked with the requested page number, the page size, and a textual 
 * description of 
 * the requested search.  The 
 * summary jsp calls a utility class <code>ResultsFetcher</code> which has 
 * methods for 
 * retrieval of data in the 
 * results set and meta data about the result set and paging information. 
 *  For the 
 * download option, the utility class    
 * <code>ResultsFetcher</code> is used directly by AnnotationSearchHandler 
 * to construct
 * a textual result set to be 
 * passed to /jsp/common/download.jsp
 * </p> 
 */


public class AnnotationSearchHandler implements RequestHandler {

    private String downloadJsp = "/jsp/common/download.jsp";
    private String formJsp = "/jsp/search/annotation_form.jsp";
    private String summaryJsp =  "/jsp/search/annotation_summary.jsp";
    private String searchCriteria;
    private String resultsMsg; 
    private String type;
    private String sessionID;
    private String queryID;
    private String downloadText;
    private SearchSession searchSession;
    private Map searchParams = new HashMap(); 
    private HttpServletRequest request;
    private RequestHandlerResponse response;

    public AnnotationSearchHandler() {}


    /**
     * Processes servlet request to perform requested action.  Method  uses the 
     * "action" parameter in the submitted <code>HttpServletRequest</code>
     * to determine what action is appropriate.  The possible values of action 
     * are:
     * <ul>
     * <li>search - Search parameters are retrieved from request and passed
     * to KeywordSearcher for searching</li>
     * <li>results - Requested page number of multiple page result set is
     * retrieved from request and passed on to /jsp/search/keyword_summary.jsp 
     * to retreive requested
     * page of results using ResultsFetcher class </li>
     * <li>download - Marked keywords are retrieved from request and information
     * is retrieved from <code>ResultsFetcher</code> in tab-delimited format 
     * for download
     * </ul>
     * 
     * @param request HttpServletRequest passed from SearchServlet
     * @return RequestHandlerResponse containing: URL of JSP to forward to and
     *  freshly set response attributes 
     * @exception SQLException thrown if a database error occurs while searching
     * @exception InvalidParameterException thrown if an invalid search action 
     * is requested, or
     * an invalid keyword id is submitted for download
     * @exception InvalidFormException thrown if no keywords selected for download
     * @exception SessionOutOfTimeException thrown when results are requested 
     * and no annotation search is in progress
     */ 
  
    public RequestHandlerResponse process( HttpServletRequest request ) 
        throws SQLException, InvalidParameterException, InvalidFormException,
               SessionOutOfTimeException {

        // action might be in "action" or "search_action"  - summary pages use 
        // search action
        // because of conflicts with form.action attribute in javascript in
        // Mac IE 4.5

        String action = request.getParameter( "action" );
        if ( action == null ) {
            action = request.getParameter( "search_action" );
        }
        type = request.getParameter( "type" );
        response = new RequestHandlerResponse();
        setRequest( request );    
        setSessionID();
        if ( action != null && action.equals( "search" ) ) {
            search();
            response.setAttribute( "pageNum", new Integer(1) );
            response.setAttribute( "searchCriteria", getSearchCriteria() );
            response.setAttribute( "query_id", getQueryID() );
            // textual description of the search params 
            response.setPage( getSummaryJsp() );

        } else if ( action != null && action.equals( "re_search" ) ) {
            results();
            response.setAttribute
                ( "pageNum", 
                  new Integer( getRequest().getParameter( "pageNum" ) ) );
            response.setAttribute( "searchCriteria", getSearchCriteria() );
            response.setAttribute( "query_id", getQueryID() );
            response.setPage( getSummaryJsp() );
            
        } else {
            throw new InvalidParameterException
                ( "Invalid search action requested: " + action + 
                  " for search type: " + type );
        }
        return response;
    }
    
    // execute annotation search, populate temp table with search results 
    // from the annotation search
    private void search() 
        throws SQLException, InvalidFormException, InvalidParameterException {
        setSearchParams(); 
        SearchSession searchSession = SessionHandler.getSearchSession( getRequest(), getType() );
        AnnotationSearcher annotationSearcher = new AnnotationSearcher();
        setSearchCriteria();
        
        DBWriteManager connectionPool = null;
        DBconnection conn = null;
        boolean firstSearch = true;
        String query_id = "";

        try {
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();

            //search criteria needs to be set by query_id. gotta figure out if this is the first search or not
            String insert_query = annotationSearcher.generateInsertLine( conn, getSearchParams(), "form" );
            if (MasterTableInfo.queryIDExists( insert_query, conn ) ){
                firstSearch = false;
            }
            query_id = MasterTableInfo.getQueryID( insert_query, conn, getType() );
            searchParams.put( "query_id", query_id );
            setQueryID( query_id );
       } finally {
            connectionPool.return_connection ( conn );
        }
        searchSession.setSearchCriteria( getQueryID(), getSearchParams() );
        if ( firstSearch != false ) { 
            annotationSearcher.search( ( Map )getSearchParams() );
        }
    }

    // page through result set 
    private void results() throws SQLException, SessionOutOfTimeException {
        SearchSession searchSession = SessionHandler.getSearchSession( getRequest() );
        String query_id = (String) getRequest().getParameter("query_id");
        if ( searchSession != null && query_id != null &&
            searchSession.searchInProgress( getType() ) ) {
            searchParams = ( Map )searchSession.getSearchCriteria( query_id );
            System.out.println("query id : " + query_id );
            if (searchParams == null ) { 
              throw new SessionOutOfTimeException ("No annotation search in progress" );
            }
            searchParams.put( "query_id", query_id );
            setQueryID (query_id);
            setSearchCriteria();
        } else {
            throw new SessionOutOfTimeException
                ( "No " + getType() + " search in progress" );
        }   	  
    }

    // returns a textual description of the requested search for 
    // display on the annotation_summary.jsp page 
    private String getSearchCriteria() { return searchCriteria; }

    // assembles a textual description of the requested search using 
    // selected parameters stored in a hashmap 
    private void setSearchCriteria() { 
        // Search by exact publication name ( exact reference id ) 
        // from publication detail page
        if ( ( String )getSearchParams().get("pub_title") != null) {
            StringBuffer criteria = new StringBuffer
                ("Your query for annotations ");
            criteria.append( " based on the publication " );
            criteria.append( "<font class=\"emphasis\">" );
            criteria.append( ( String )getSearchParams().get( "pub_title" ) );
            criteria.append( "</font> " );
            criteria.append(" resulted in "); 
            searchCriteria =  criteria.toString();
            setSummaryJsp( "/jsp/search/publication_annotation_summary.jsp" );
        }
        // Search by keyword ( keyword id ) from annotation_count 
        // display ( from treeview, keyword summary, or keyword detail page)
        // there are three ways to display annotations for a keyword
        // 1 - for the keyword itself
        // 2 - for the keyword's children only
        // 3 - for the keyword and its children
        // these three different ways will be handled through a 
        // parameter called "scope" 
        if ( ( String )getSearchParams().get("keyword") != null) {
            String scopeWording = null;
            if ( ( String )getSearchParams().get("scope") != null) {
                if ( ( ( String )getSearchParams().get("scope") ).
                     equalsIgnoreCase( "term" ) ) {
                    scopeWording = " ";
                } else if ( ( ( String )getSearchParams().get("scope") ).
                            equalsIgnoreCase( "children" ) ) {
                    scopeWording = "'s child terms ";
                } else if ( ( ( String )getSearchParams().get("scope") ).
                            equalsIgnoreCase( "combo" ) ) {
                    scopeWording = " and its child terms ";                
                } else {
                    scopeWording = " the term ";
                }                
            } else {
                scopeWording = " the term ";
            } 
            StringBuffer criteria = 
                new StringBuffer("Your query for annotations ");
            criteria.append( " based on " );
            criteria.append( "<font class=\"emphasis\">" );
            criteria.append( ( String )getSearchParams().get( "keyword" ) );
            criteria.append( "</font> " );
            criteria.append( scopeWording );
            criteria.append(" resulted in "); 
            searchCriteria =  criteria.toString();
            setSummaryJsp( "/jsp/search/keyword_annotation_summary.jsp" );
        }
        // Search by exact gene name ( exact tair object id ) 
        // from gene detail page
        if ( ( String )getSearchParams().get("gene_name") != null) {
            StringBuffer criteria = new StringBuffer
                ("Your query for annotations ");
            criteria.append( " based on the gene " );
            criteria.append( "<font class=\"emphasis\">" );
            criteria.append( ( String )getSearchParams().get( "gene_name" ) );
            criteria.append( "</font> " );
            criteria.append(" resulted in "); 
            searchCriteria =  criteria.toString();
            setSummaryJsp( "/jsp/search/gene_annotation_summary.jsp" );
        }
        // Search by exact locus name ( exact tair object id ) 
        // from locus detail page
        if ( ( String )getSearchParams().get("locus_name") != null) {
            StringBuffer criteria = new StringBuffer
                ("Your query for annotations ");
            criteria.append( " based on the locus " );
            criteria.append( "<font class=\"emphasis\">" );
            criteria.append( ( String )getSearchParams().get( "locus_name" ) );
            criteria.append( "</font> " );
            criteria.append(" resulted in "); 
            searchCriteria =  criteria.toString();
            setSummaryJsp( "/jsp/search/locus_annotation_summary.jsp" );
        }
    }

    // returns download data as a string -- requested from the goslim_form.jsp
    private String getDownloadText() { return downloadText; }
    
    // returns user specified search parameters from the form jsp as hash map;
    // key = input name from form, value = selected value 
    private Map getSearchParams() { return searchParams; }
   
    // stores the  user specified search parameters from the form jsp in a hash 
    // map called searchParams where:
    // key = input name from form, value = selected value from form      
    private void setSearchParams() throws InvalidFormException {
        // for annotations from publication detail page
        if ( !TextConverter.isEmpty
             ( getRequest().getParameter("pub_title") ) &&
             !TextConverter.isEmpty
             ( getRequest().getParameter("reference_id") ) ) {
            searchParams.put( "pub_title", 
                              getRequest().getParameter( "pub_title" ) );
            searchParams.put( "reference_id" ,
                              getRequest().getParameter( "reference_id" )  );
        }
        // for annotations from annotation_count display on treeview, keyword 
        // summary page or keyword detail page
        if ( !TextConverter.isEmpty( getRequest().getParameter("kw") ) &&
             !TextConverter.isEmpty( getRequest().getParameter("kw_id") ) ) {
            searchParams.put( "keyword", getRequest().getParameter( "kw" ) );
            searchParams.put( "keyword_id" ,
                              getRequest().getParameter( "kw_id" )  );
            if ( !TextConverter.isEmpty
                 ( getRequest().getParameter("scope") ) ) {
                searchParams.put
                    ( "scope" ,getRequest().getParameter( "scope" )  ); 
            }
        }
        // for annotations from gene detail page
        if ( !TextConverter.isEmpty
             ( getRequest().getParameter("gene_name") ) &&
             !TextConverter.isEmpty
             ( getRequest().getParameter("tair_object_id") ) ) {
            searchParams.put( "gene_name", 
                              getRequest().getParameter( "gene_name" ) );
            searchParams.put( "tair_object_id" ,
                              getRequest().getParameter( "tair_object_id" )  );
        }
        // for annotations from locus detail page
        if ( !TextConverter.isEmpty
             ( getRequest().getParameter("locus_name") ) &&
             !TextConverter.isEmpty
             ( getRequest().getParameter("tair_object_id") ) ) {
            searchParams.put( "locus_name", 
                              getRequest().getParameter( "locus_name" ) );
            searchParams.put( "tair_object_id" ,
                              getRequest().getParameter( "tair_object_id" )  );
        }
    }

    // returns this search type 
    private String getType() { 
        return type; 
    }

    // sets the summary jsp 
    private void setSummaryJsp( String summaryJsp ) { 
        this.summaryJsp = summaryJsp;
    }

    // returns summary jsp
    private String getSummaryJsp() { 
        return summaryJsp;
    }
    
    // sets query id
    private void setQueryID( String queryID ) {
        this.queryID = queryID;
    }
    private String getQueryID () { 
        return queryID;
    }

    // sets this session id 
    private void setSessionID() { 
        sessionID = getRequest().getSession( true ).getId();
    }

    // returns this session id     
    private String getSessionID() { 
        return sessionID; 
    }
 
    // sets a handle to this request object 
    private void setRequest( HttpServletRequest request ) { 
        this.request = request;
    }

    // returns a handle to this request object       
    private HttpServletRequest getRequest() { 
        return request;
    } 

}
