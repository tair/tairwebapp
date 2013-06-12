/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.table.MasterTableInfo;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.ResultsFetcher;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.TextConverter;

/**
  * PolyAlleleSearchHandler handles all search functions for polymorphisms and alleles. When searching,
  * PolyAlleleSearchHandler uses the <code>SearchSession</code> object to create
  * a temp table to hold an individual users polymorphism/allees search results. With these
  * stored results, user can easily scroll through a large result set through
  * subsequent requests to PolyAlleleSearchHandler.
  *
  * <p>
  * PolyAlleleSearchHandler uses <code>PolyAlleleSearcher</code> to perform initial search and
  * to store the search results.  PolyAlleleSearchHandler sets response attributes and forwards
  * execution to the appropriate jsp for display.  For search summary results display, /jsp/search/polyallele_summary.jsp
  * is invoked with the requested page number, the page size, and a textual description of the requested search.  The
  * summary jsp calls a utility class <code>ResultsFetcher</code> which has methods for retrieval of data in the
  * results set and meta data about the result set and paging information.  For the download option, the utility class
  * <code>ResultsFetcher</code> is used directly by PolyAlleleSearchHandler to construct a textual result set to be
  * passed to /jsp/common/download.jsp
  * </p>
  */


public class PolyAlleleSearchHandler implements RequestHandler {

    private String form_jsp = "/jsp/search/polyallele_form.jsp";
    private String summary_jsp = "/jsp/search/polyallele_summary.jsp";
    private String download_jsp = "/jsp/common/download.jsp";
    private String type = "polyallele";
    private String query_id;
    private String down_load_text;
    private SearchSession searchSession;
    private HashMap searchParams = new HashMap();
    private HttpServletRequest request;

    public PolyAlleleSearchHandler() {}

    /**
     * Processes servlet request to perform requested action.  Method  uses the
     * "action" parameter in the submitted <code>HttpServletRequest</code>
     * to determine what action is appropriate.  The possible values of action are:
     * <ul>
     * <li>search - Search parameters are retrieved from request and passed
     * to PolyAlleleSearcher for searching</li>
     * <li>results - Requested page number of multiple page result set is
     * retrieved from request and passed on to /jsp/search/polyallele_summary.jsp to retreive requested
     * page of results using ResultsFetcher class </li>
     * <li>download - Marked polymorphisms/alleles are retrieved from request and information
     * is retrieved from <code>ResultsFetcher</code> in tab-delimited format for download
     * </ul>
     *
     * @param request HttpServletRequest passed from SearchServlet
     * @return RequestHandlerResponse containing: URL of JSP to forward to and freshly set response attributes
     * @exception SQLException thrown if a database error occurs while searching
     * @exception InvalidParameterException thrown if an invalid search action is requested, or
     * an invalid polymorphism id is submitted for download
     * @exception InvalidFormException thrown if no polymorphisms selected for download
     * @exception SessionOutOfTimeException thrown when results are requested and no polymorphism search is in progress
     */

    public RequestHandlerResponse process( HttpServletRequest request ) throws SQLException, InvalidParameterException, InvalidFormException, SessionOutOfTimeException {

        // action might be in "action" or "search_action"  - summary pages use search action
        // because of conflicts with form.action attribute in javascript in Mac IE 4.5

        String action = request.getParameter( "action" );
        if ( action == null ) {
            action = request.getParameter( "search_action" );
        }
        RequestHandlerResponse response = new RequestHandlerResponse();
        setRequest(request);
        //setSessionID();

        if ( action != null && action.equals( "new_search" ) ) {
            response.setPage( form_jsp );

        } else if ( action != null && action.equals( "search" ) ) {
            search();
            response.setAttribute( "pageNum", new Integer(1) );
            response.setAttribute( "size", new Integer( request.getParameter( "size" ) ) );
            response.setAttribute( "searchCriteria", getSearchCriteria() );
            response.setAttribute("query_id", getQueryID());
            response.setPage( summary_jsp );

        } else if ( action != null && action.equals( "results" ) ) {
            results();
            response.setAttribute( "pageNum", new Integer( request.getParameter( "pageNum" ) ) );
            response.setAttribute( "size", new Integer( request.getParameter( "size" ) ) );
            response.setAttribute( "searchCriteria", new String( request.getParameter( "searchCriteria" ) ));
            response.setAttribute( "query_id", getQueryID() );
            response.setPage( summary_jsp );

        } else if ( action != null && action.equals( "download" ) ) {
            download();
            response.setAttribute( "downloadText", getDownloadText() );
            response.setPage( download_jsp );

        } else {
            throw new InvalidParameterException( "Invalid search action requested: " + action );

        }
        return response;
    }

    // returns a textual description of the requested search
    private String getSearchCriteria() {
        Map params = TextConverter.scrub(getSearchParams());
        StringBuffer criteria = new StringBuffer("Your query ");
        String allele = (String)params.get("allele");
        if (allele != null && allele.equals("is")) {
            criteria.append(" for ONLY alleles where ");
        }
        if (allele != null && allele.equals("not")) {
            criteria.append(" for ONLY polymorphisms where ");
        }
        if (allele != null && allele.equals("any")) {
            criteria.append(" for EITHER polymorphisms or alleles where ");
        }

        // Search by Name
        if ( params.get("term1") != null ) {
            criteria.append((String)params.get("name_type1") + " ");
            criteria.append(TextConverter.convertMethods((String)params.get("method1")) + " ");
            criteria.append((String)params.get("term1") + ", ");
        }
        if ( params.get("term2") != null ) {
            criteria.append(" AND " + (String)params.get("name_type2") + " ");
            criteria.append(TextConverter.convertMethods((String)params.get("method2")) + " ");
            criteria.append((String)params.get("term2") + ", ");
        }

        // Restrict by Features
        String features = null;
        if ( params.get("has_marker") != null ) {
            criteria.append(" has genetic markers is TRUE, ");
        }
        if ( params.get("has_observable_phenotype") != null ) {
            criteria.append(" has observable phenotype is TRUE, ");
        }
        /*if ((String)params.get("has_ABRC_stock") != null) {
          criteria.append(" has ABRC stock is TRUE, ");
          }*/
        if ( params.get("poly_type") != null ) {
            features = getMultipleFeatures((String[])params.get("poly_type"));
            if (!(features.equals(" any"))) criteria.append(" polymorphism types of " + features + ", ");
        }
        if ( params.get("ecoLow") != null && params.get("ecoHi") != null ) {
            if ( !((String)params.get("ecoLow")).equals("any") ) {
                criteria.append(" polymorphic between ecotypes of ");
                criteria.append((String)params.get("ecoLow") + " AND ");
                criteria.append((String)params.get("ecoHi") + ", ");
            }
        }
        if ( params.get("poly_site") != null ) {
            features = getMultipleFeatures((String[])params.get("poly_site"));
            if (!features.equals(" any")) criteria.append(" polymorphism sites of " + features + ", ");
        }
        /*features = getMultipleFeatures((String[])params.get("allele_mode"));
          if (!features.equals(" any")) criteria.append(" allele modes of " + features + ", ");*/
        if ( params.get("inheritance" ) != null  ) {
            if ( !((String)params.get("inheritance")).equals("any") ) {
                criteria.append(" inheritance of " + (String)params.get("inheritance") + ", ");
            }
        }
        if ( params.get("insertion_type") != null ) {
            features = getMultipleFeatures((String[])params.get("insertion_type"));
            if (!features.equals(" any")) criteria.append(" insertion types of " + features + ", ");
        }
        if ( params.get("transgene") != null ) {
            features = getMultipleFeatures((String[])params.get("transgene"));
            if (!features.equals(" any")) criteria.append(" transgene construct types of " + features + ", ");
        }
        if ( params.get("mutagen") != null ) {
            features = getMultipleFeatures((String[])params.get("mutagen"));
            if (!features.equals(" any")) criteria.append(" mutagens of " + features + ", ");
        }
        if ( params.get("chromosome") != null ) {
            criteria.append(" chromosome is " + Units.translateChromosome((String)params.get("chromosome")) + " , " );
        }
        // Restrict By Map Location
        if ( params.get("map_type") != null ) {
            criteria.append(" AND is on map " + (String)params.get("map_type"));
            criteria.append(" with a range type of " +(String)params.get("range_type") + " , ");
            criteria.append(" high range of " + (String)params.get("high_range") + " , ");
            criteria.append(" high units of " + (String)params.get("high_unit") + " and ");
            criteria.append(" low range of " + (String)params.get("low_range") + " , ");
            criteria.append(" low units of " + (String)params.get("low_unit") + " , ");
        }

        // Time Restriction
        if ( params.get("limit_time") != null ) {
            criteria.append(" AND there is a time restriction of the last two months, ");
        } else {
            criteria.append(" AND there is no time restriction, ");
        }
        criteria.append(" yielded ");
        return ( new String( criteria ) );

    }

    private String getMultipleFeatures (String[] features) {
        return ExpressionSearchHandler.getMultipleOptions(features);
    }

    // registers the search with SearchSession and invokes the Searcher with the specified search parameters and session id
    private void search() throws SQLException, InvalidFormException, InvalidParameterException, SessionOutOfTimeException {
        setSearchParams();
        searchSession = SessionHandler.getSearchSession(getRequest(), getType());
        PolyAlleleSearcher pa_searcher = new PolyAlleleSearcher();
        DBWriteManager connectionPool = null;
        DBconnection conn = null;
        boolean firstSearch = true;
        String query_id = "";

        try {
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();

            //search criteria needs to be set by query_id. gotta figure out if this is the first search or not
            String insert_query = pa_searcher.generateInsertLine( conn, getSearchParams(), "form" );
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
            pa_searcher.doSearch( getSearchParams()  );
        }
    }

    // checks for active search in SearchSession and stores polymorphism ids for download, if selected
    private void results() throws SQLException, InvalidFormException, InvalidParameterException, SessionOutOfTimeException {
        searchSession = SessionHandler.getSearchSession( getRequest() );
        String query_id = (String) getRequest().getParameter("query_id");
        if ( searchSession != null && searchSession.searchInProgress( getType() ) ) {
            System.out.println("qury_id : " + query_id);
            searchParams = (HashMap)searchSession.getSearchCriteria( query_id );
            if (searchParams == null ) {
                throw new SessionOutOfTimeException( "1No polymorphism search in progress" );
            }
            searchParams.put("query_id", query_id);
            setQueryID( query_id );

            // check for any items selected for download and save in searchSession until download is selected as action
            if ( !TextConverter.isEmpty( getRequest().getParameter( "id" ) ) ) {
                Long[] ids = TextConverter.stringToLongArray( getRequest().getParameterValues( "id" ));
                searchSession.addDownload( query_id, ids );
            }
        } else {
            throw new SessionOutOfTimeException( "2No polymorphism search in progress" );
        }
    }

    // assemble the list of selected polymorphism ids stored in SearchSession and the current request parameter,
    // then get a tab-delimited export string from ResultsFetcher for that list of ids
    private void download() throws SQLException, InvalidFormException, InvalidParameterException, SessionOutOfTimeException {
        String[] formIDs;
        StringBuffer export = new StringBuffer(" ");
        Vector ids = null;
        // get stored ids from SearchSession
        searchSession = SessionHandler.getSearchSession( getRequest() );
        String queryID = (String) getRequest().getParameter( "query_id");
        if ( searchSession != null && searchSession.searchInProgress( getType() ) && queryID != null ) {
            setQueryID( queryID );
            ids = searchSession.getDownload( queryID ); // get any polymorphisms selected on previous pages
            if ( ids == null ) {
                ids = new Vector();
            }
        } else {
            throw new SessionOutOfTimeException( "3No polymorphism search in progress" );
        }
        // combine previously selected with selections from current page
        if ( !TextConverter.isEmpty( getRequest().getParameter( "id" ) ) ) {
            formIDs = getRequest().getParameterValues( "id" );
            if ( formIDs != null && formIDs.length > 0 ) {
                for ( int i = 0; i < formIDs.length; i++ ) {
                    ids.add( formIDs[ i ] );
                }
            }
        }
        if ( ids == null || ids.isEmpty() ) {
            throw new InvalidFormException( "No polymorphisms selected for download" );
        }
        ResultsFetcher download = new ResultsFetcher( getQueryID(), getType() );
        download.setDownloadPage( ids );
        export.append( download.getExportHeader()) ; // get header
        export.append( download.createExport() ); // get download data from results set
        down_load_text = export.toString();
    }

    // returns download data as a string
    private String getDownloadText() { return down_load_text; }

    // returns user specified search parameters from the form jsp as hash map;
    // key = input name from form, value = selected value
    private HashMap getSearchParams() { return searchParams; }

    // stores the  user specified search parameters from the form jsp in a hash map called searchParams where:
    // key = input name from form, value = selected value from form
    private void setSearchParams() throws InvalidFormException {
        String order = null;
        if ( getRequest().getParameter( "order" ) != null && !( getRequest().getParameter( "order" ) ).trim().equals( "" ) ) {
            order = getRequest().getParameter( "order" );
            searchParams.put( "order", order );
        }
        if (!TextConverter.isEmpty(getRequest().getParameter("name_type1")) )searchParams.put("name_type1",getRequest().getParameter("name_type1"));
        if (!TextConverter.isEmpty(getRequest().getParameter("method1")) )searchParams.put("method1",getRequest().getParameter("method1"));
        if (!TextConverter.isEmpty(getRequest().getParameter("term1")) )searchParams.put("term1",getRequest().getParameter("term1"));           if (!TextConverter.isEmpty(getRequest().getParameter("name_type2")) )searchParams.put("name_type2",getRequest().getParameter("name_type2"));
        if (!TextConverter.isEmpty(getRequest().getParameter("method2")) )searchParams.put("method2",getRequest().getParameter("method2"));
        if (!TextConverter.isEmpty(getRequest().getParameter("term2")) )searchParams.put("term2",getRequest().getParameter("term2"));
        if (!TextConverter.isEmpty(getRequest().getParameter("has_marker")) )searchParams.put("has_marker",getRequest().getParameter("has_marker"));
        if (!TextConverter.isEmpty(getRequest().getParameter("has_observable_phenotype")) )searchParams.put("has_observable_phenotype",getRequest().getParameter("has_observable_phenotype"));
        if (!TextConverter.isEmpty(getRequest().getParameter("has_ABRC_stock")) )searchParams.put("has_ABRC_stock",getRequest().getParameter("has_ABRC_stock"));
        if (!TextConverter.isEmpty(getRequest().getParameter("poly_type"))) searchParams.put( "poly_type",(String[])getRequest().getParameterValues("poly_type"));
        if (!TextConverter.isEmpty(getRequest().getParameter("ecoLow")) )searchParams.put("ecoLow",getRequest().getParameter("ecoLow"));
        if (!TextConverter.isEmpty(getRequest().getParameter("ecoHi")) )searchParams.put("ecoHi",getRequest().getParameter("ecoHi"));           if (!TextConverter.isEmpty(getRequest().getParameter("poly_site")) )searchParams.put("poly_site",(String[])getRequest().getParameterValues("poly_site"));
        //if (!TextConverter.isEmpty(getRequest().getParameter("allele_mode")) )searchParams.put("allele_mode",(String[])getRequest().getParameterValues("allele_mode"));
        if (!TextConverter.isEmpty(getRequest().getParameter("inheritance")) )searchParams.put("inheritance",getRequest().getParameter("inheritance"));
        if (!TextConverter.isEmpty(getRequest().getParameter("insertion_type")) )searchParams.put("insertion_type",(String[])getRequest().getParameterValues("insertion_type"));
        if (!TextConverter.isEmpty(getRequest().getParameter("transgene")) )searchParams.put("transgene",(String[])getRequest().getParameterValues("transgene"));
        if (!TextConverter.isEmpty(getRequest().getParameter("limit_time")) )searchParams.put("limit_time",getRequest().getParameter("limit_time"));
        if (!TextConverter.isEmpty(getRequest().getParameter("mutagen")) )searchParams.put("mutagen",(String[])getRequest().getParameterValues("mutagen"));
        if (!TextConverter.isEmpty(getRequest().getParameter("allele"))) searchParams.put( "allele",getRequest().getParameter("allele"));
        String chromosome = null;
	if ( !TextConverter.isEmpty( request.getParameter( "chromosome" ) ) ) {
            chromosome = getRequest().getParameter( "chromosome" );
            searchParams.put( "chromosome", chromosome );
        }
        String map_type = null;
	if ( !TextConverter.isEmpty( request.getParameter( "map_type" ) ) ) {
            map_type = getRequest().getParameter( "map_type" );
            searchParams.put( "map_type", map_type );
        }
        String low_range = null;
        String high_range = null;
        if ( getRequest().getParameter( "low_range" ) != null && !( getRequest().getParameter( "low_range" ) ).trim().equals( "" ) ) {
            low_range = getRequest().getParameter( "low_range" );
            searchParams.put( "range_type", getRequest().getParameter( "range_type" ) );
            searchParams.put( "low_unit", getRequest().getParameter( "low_unit" ) );
            searchParams.put( "low_range", low_range );
        }

        if ( !TextConverter.isEmpty( getRequest().getParameter( "high_range" ) ) && !(getRequest().getParameter( "high_range" ) ).trim().equals( "--unused--" )) {
            high_range = getRequest().getParameter( "high_range" );
            searchParams.put( "range_type", getRequest().getParameter( "range_type" ) );
            searchParams.put( "high_unit", getRequest().getParameter( "high_unit" ) );
            searchParams.put( "high_range", high_range );
        }
        if ( ( low_range != null || high_range != null ) && ( map_type == null ) ) {
            String message = "Map_type must be specified to search by map location range";
            throw new InvalidFormException( message );
        }
        if ( ( order != null && order.equalsIgnoreCase( "position" ) ) && map_type == null ) {
            String message = "Map type must be specified when ordering by position";
            throw new InvalidFormException( message );
        }
    }

    // returns this search type
    private String getType() { return type; }

    // gets and sets the query id
    private String getQueryID() { return query_id; }
    private void setQueryID(String query_id) { this.query_id = query_id; }

    // sets a handle to this request object
    private void setRequest( HttpServletRequest request ) { this.request = request; }

    // returns a handle to this request object
    private HttpServletRequest getRequest() { return request; }

}
