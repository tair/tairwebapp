//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.18 $
// $Date: 2006/02/27 21:03:12 $
//------------------------------------------------------------------------------

package org.tair.search;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.table.MasterTableInfo;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcTaxon;
import org.tair.utilities.DateWebFormField;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.TextConverter;


/**
  * GermplasmSearchHandler handles all search functions for germplasms. When
  * searching, GermplasmSearchHandler uses the <code>SearchSession</code> object
  * to create a temp table to hold an individual user's germplasm search results.
  * With these stored results, user can easily scroll through a large result set
  * through subsequent requests to GermplasmSearchHandler.
  *
  * <p>
  * GermplasmSearchHandler uses <code>GermplasmSearcher</code> to perform initial
  * search, to retrieve pages of results when scrolling through results, and to
  * retrieve germplasm info. when download option is selected.
  */

public class GermplasmSearchHandler implements RequestHandler {
  private static final Logger logger = Logger.getLogger(GermplasmSearchHandler.class);

    private String searchType = "germplasm";


    /**
     * Processes servlet request to perform requested action.  Method  uses the
     * "search_action" parameter in the submitted <code>HttpServletRequest</code>
     * to determine what action is appropriate.  The possible values of search_action are:
     * <ul>
     * <li>search - Search parameters are retrieved from request and passed
     * to GermplasmSearcher for searching</li>
     * <li>re_search - Requested page number of multiple page result set is
     * retrieved from request and passed to GermplasmSearcher to receive requested
     * page of results</li>
     * <li>download - Marked search results are retrieved from request and information
     * is collected into tab-delimited format for download
     * </ul>
     *
     * <p>Results of search and re_search are returned as a <code>SearchResultsCollection</code>
     * containing an array of <code>GermplasmSummary</code> objects, as well as scrolling
     * params, link and plain text explanation of search parameters used to construct result
     * set
     *
     * @param request HttpServletRequest passed from SearchServlet
     * @return RequestHandlerResponse containing URL of JSP to forward to, and any
     * search results objects that may have resulted from request
     * @throws SQLException thrown if a database error occurs while searching
     * @throws InvalidParameterException thrown if an invalid search action is requested,
     * or an invalid id is submitted for download
     * @throws InvalidFormException thrown if no items selected for download
     * @throws SessionOutOfTimeException thrown when re_searching if no germplasm
     *  search is in progress
     */
    public RequestHandlerResponse process( HttpServletRequest request )
        throws SQLException, InvalidParameterException, InvalidFormException,
               SessionOutOfTimeException {

        String action = request.getParameter( "search_action" );
        RequestHandlerResponse response = null;

        if ( action != null && action.equals( "search" ) ) {
            response = search( request, true );

        } else if ( action != null && action.equals( "re_search" ) ) {
            response = search( request, false );

        } else if ( action != null && action.equals( "download" ) ) {
            response = download( request );

        } else {
            throw new InvalidParameterException( "Invalid search action requested: " + action );
        }
        return response;
    }


    /**
     * Retrieve search and scroll parameters to execute search and return selected slice
     * of result set
     */
    private RequestHandlerResponse search( HttpServletRequest request, boolean firstSearch )
        throws SQLException, InvalidFormException, InvalidParameterException,
               SessionOutOfTimeException {

        RequestHandlerResponse response = null;
        SearchSession searchSession = null;
        DBWriteManager connectionPool = null;
        DBconnection conn = null;
        ScrollParams scrollParams = null;
        SearchResultsCollection searchCollection = null;
        GermplasmSearcher searcher = null;
        Map searchParams = null;
        String query_id = "";
        
        searcher = new GermplasmSearcher();
        try {
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();
            scrollParams = ScrollCalculator.getScrollParams( request );


            // if first time through this search, populate temp table & get 1st page of results
            if ( firstSearch ) {
                searchParams = getSearchParams( request, conn );
                
                String insert_query = searcher.generateInsertLine(conn, searchParams, "form");
                logger.debug("Germplasm search query: " + insert_query);
                if (MasterTableInfo.queryIDExists( insert_query, conn ) ){
                    firstSearch = false;
                }
                query_id = MasterTableInfo.getQueryID( insert_query, conn, searchType );

                // register search w/SearchSession
                searchSession = SessionHandler.getSearchSession( request, conn, searchType );
                searchParams.put( "query_id", query_id);

                searchSession.setSearchCriteria( query_id, searchParams );

            } else {  // else get requested slice of result set already stored in temp table

                // get search data from session
                searchSession = SessionHandler.getSearchSession( request );
                if ( searchSession != null && searchSession.searchInProgress( searchType ) ){
                    query_id = (String) request.getParameter("query_id");
                    searchParams = searchSession.getSearchCriteria( query_id );

                    // check for any items selected for download and save in
                    // searchSession until download is selected action
                    if ( !TextConverter.isEmpty( request.getParameter( "id" ) ) ) {
                        Long[] ids = TextConverter.stringToLongArray( request.getParameterValues( "id" ) );
                        searchSession.addDownload( searchType, ids );
                    }

                } else {
                    throw new SessionOutOfTimeException( "No germplasm search in progress" );
                }
            }
            
            if (searchParams == null) {
              throw new InvalidParameterException("Could not map germplasm search parameters");
            }

            searchCollection = searcher.search( conn, searchParams, scrollParams, firstSearch );
            response = new RequestHandlerResponse();
            response.setAttribute( "searchCollection", searchCollection );
            response.setAttribute( "query_id", query_id );
            response.setPage( searchCollection.getResultsPage() );

        } finally {
            if ( conn != null ) {
                connectionPool.return_connection( conn );
            }
        }
        return response;
    }



    /**
     * Translate array of form fields to boolean values
     */
    private void checkBoolean( HttpServletRequest request,
                               Map searchParams,
                               String[] fieldNames )
    {
        for ( int i = 0; i < fieldNames.length; i++ ) {
            checkBoolean( request, searchParams, fieldNames[ i ] );
        }
    }

    /**
     * Translate single form field to boolean value
     */
    private void checkBoolean( HttpServletRequest request,
                               Map searchParams,
                               String fieldName )
    {
        if ( !TextConverter.isEmpty( request.getParameter( fieldName ) ) &&
             request.getParameter( fieldName ).equals( "true" ) ) {
            searchParams.put( fieldName, new Boolean( true ) );
        } else {
            searchParams.put( fieldName, new Boolean( false ) );
        }
    }


    /**
     * Retrieve search params from request
     */
    private Map getSearchParams( HttpServletRequest request, DBconnection conn )
        throws SQLException, InvalidFormException {

        HashMap searchParams = new HashMap();
        HashMap errors = new HashMap();

        if ( !TextConverter.isEmpty( request.getParameter( "germplasm_type" ) ) ) {
            searchParams.put( "germplasm_type", request.getParameter( "germplasm_type" ) );
        }

        if ( !TextConverter.isEmpty( request.getParameter( "taxon" ) ) ) {
            // get taxon id of a thaliana to search taxon w/out a table join
            Long arabidopsisID = TfcTaxon.translateScientificName( conn, "Arabidopsis thaliana" );
            searchParams.put( "taxon", request.getParameter( "taxon" ) );
            searchParams.put( "arabidopsisID", arabidopsisID );
        }

        if ( !TextConverter.isEmpty( request.getParameter( "name_1" ) ) ) {
            searchParams.put( "name_type_1", request.getParameter( "name_type_1" ) );
            searchParams.put( "name_1", request.getParameter( "name_1" ).trim() );
            searchParams.put( "method_1", request.getParameter( "method_1" ) );
        }

        if ( !TextConverter.isEmpty( request.getParameter( "name_2" ) ) ) {
            searchParams.put( "name_type_2", request.getParameter( "name_type_2" ) );
            searchParams.put( "name_2", request.getParameter( "name_2" ).trim() );
            searchParams.put( "method_2", request.getParameter( "method_2" ) );
        }

        if ( !TextConverter.isEmpty( request.getParameter( "name_3" ) ) ) {
            searchParams.put( "name_type_3", request.getParameter( "name_type_3" ) );
            searchParams.put( "name_3", request.getParameter( "name_3" ).trim() );
            searchParams.put( "method_3", request.getParameter( "method_3" ) );
        }

        // for locus_detail.jsp, gene_detail.jsp; doesn't appear on germplasm_form.jsp.
        if ( !TextConverter.isEmpty( request.getParameter( "allele_id_1" ) ) ) {
            searchParams.put( "allele_id_1", request.getParameter( "allele_id_1" ) );
        }

        if ( !TextConverter.isEmpty( request.getParameter( "allele_name_1" ) ) ) {
            searchParams.put( "allele_name_1", request.getParameter( "allele_name_1" ) );
            searchParams.put( "allele_method_1", request.getParameter( "allele_method_1" ) );
            searchParams.put( "genotype_1", request.getParameter( "genotype_1" ) );
        }

        if ( !TextConverter.isEmpty( request.getParameter( "allele_name_2" ) ) ) {
            searchParams.put( "allele_name_2", request.getParameter( "allele_name_2" ) );
            searchParams.put( "allele_method_2", request.getParameter( "allele_method_2" ) );
            searchParams.put( "genotype_2", request.getParameter( "genotype_2" ) );
        }

        if ( !TextConverter.isEmpty( request.getParameter( "allele_name_3" ) ) ) {
            searchParams.put( "allele_name_3", request.getParameter( "allele_name_3" ) );
            searchParams.put( "allele_method_3", request.getParameter( "allele_method_3" ) );
            searchParams.put( "genotype_3", request.getParameter( "genotype_3" ) );
        }


        // add germplasm features to search for - translate form submission into Boolean
        // to reflect whether form checkbox was checked (true) or not (false)
        String[] features = new String[] {
            "is_abrc_stock",
            "has_observable_phenotype",
            "has_foreign_dna",
            "is_natural_variant",
            "has_polymorphisms",
            "has_images",
            "is_mapping_strain",
            // for locus_detail.jsp, gene_detail.jsp; doesn't appear on germplasm_form.jsp.
            "has_phenotype"
        };
        checkBoolean( request, searchParams, features );

        if ( !TextConverter.isEmpty( request.getParameter( "ploidy" ) ) ) {
            searchParams.put( "ploidy", request.getParameter( "ploidy" ) );
        }


        checkBoolean( request, searchParams, "is_aneuploid" );

        if ( !TextConverter.isEmpty( request.getParameter( "aneuploid_chromosome" ) ) ) {
            try {
                Integer aneuploidChrom = new Integer( request.getParameter( "aneuploid_chromosome" ) );
                searchParams.put( "aneuploid_chromosome", aneuploidChrom );
            } catch ( NumberFormatException nfe ) {
                errors.put( "aneuploid_chromosome",
                            "Invalid aneuploid chromosome: " + nfe.getMessage() );
            }
        }

        if ( !TextConverter.isEmpty( request.getParameter( "background" ) ) ) {
            searchParams.put( "background", request.getParameterValues( "background" ) );
        }


        if ( !TextConverter.isEmpty( request.getParameter( "mutagen" ) ) ) {
            searchParams.put( "mutagen", request.getParameterValues( "mutagen" )  );
        }

        if ( !TextConverter.isEmpty( request.getParameter( "insertion_type" ) ) ) {
            searchParams.put( "insertion_type", request.getParameterValues( "insertion_type" ) );
        }

        if ( !TextConverter.isEmpty( request.getParameter( "construct_type" ) ) ) {
            searchParams.put( "construct_type", request.getParameterValues( "construct_type" ) );
        }

        try {

            // Translate submitted date from form in mm/dd/yyyy format to java.util.Date value
            // suitable for searching - easily done using DateWebFormField.
            if ( !TextConverter.isEmpty( request.getParameter( "restrict_date_from" ) ) ) {
                java.util.Date fromDate = DateWebFormField.retrieveDate( request,
                                                                         "restrict_date_from" );
                searchParams.put( "restrict_date_from", fromDate );
            }


            // If submitted to date is not today's date (ignore if it is), manually set
            // time to last second of the day (23:59:59) so that when searching for items
            // altered before that date, items altered on that date will get caught. A little
            // awkward, but necessary because vanilla translation of string value to simple
            // date format will set time as midnight *beginning* the day, when we need it for
            // ending the day
            if ( !TextConverter.isEmpty( request.getParameter( "restrict_date_to" ) ) ) {
                GregorianCalendar now = new GregorianCalendar();
                now.set( Calendar.HOUR_OF_DAY, 0 );
                now.set( Calendar.MINUTE, 0 );
                now.set( Calendar.SECOND, 0 );
                now.set( Calendar.MILLISECOND, 0 );
                java.util.Date compareNow = now.getTime();
                java.util.Date toDate = DateWebFormField.retrieveDate( request,
                                                                       "restrict_date_to" );

                if ( toDate.before( compareNow ) ) {
                    now.setTime( toDate );
                    now.set( Calendar.HOUR_OF_DAY, 23 );
                    now.set( Calendar.MINUTE, 59 );
                    now.set( Calendar.SECOND, 59 );
                    toDate = now.getTime();
                    searchParams.put( "restrict_date_to", toDate );
                }
            }
        } catch ( InvalidParameterException ipe ) {
            errors.put( "Time Restriction", ipe.getMessage() );
        }


        String order = null;
        if ( request.getParameter( "order" ) != null ) {
            order = request.getParameter( "order" );
            searchParams.put( "order", order );
        }

        String chromosome = null;
	if ( !TextConverter.isEmpty( request.getParameter( "chromosome" ) ) ) {
            chromosome = request.getParameter( "chromosome" );
            searchParams.put( "chromosome", chromosome );
        }

        String map_type = null;
	if ( !TextConverter.isEmpty( request.getParameter( "map_type" ) ) ) {
            map_type = request.getParameter( "map_type" );
            searchParams.put( "map_type", map_type );
        }

        String low_range = null;
        String high_range = null;
        if ( !TextConverter.isEmpty( request.getParameter( "low_range" ) ) ) {
            low_range = request.getParameter( "low_range" ).trim();
            searchParams.put( "range_type", request.getParameter( "range_type" ) );
            searchParams.put( "low_unit", request.getParameter( "low_unit" ) );
            searchParams.put( "low_range",low_range );
        }

        if ( !TextConverter.isEmpty( request.getParameter( "high_range" ) ) &&
             !( request.getParameter( "high_range" ) ).trim().equals( "--unused--" ) ) {

            high_range = request.getParameter( "high_range" ).trim();
            searchParams.put( "range_type", request.getParameter( "range_type" ) );
            searchParams.put( "high_unit", request.getParameter( "high_unit" ) );
            searchParams.put( "high_range", high_range );
        }

        if ( ( low_range != null || high_range != null ) &&  map_type == null ) {
            String message = "Map type must be specified to search by map location range";
            errors.put( "search by location", message );
        }

        // translate assignments from input to searchable assignment values
        // if searching by map location
        if ( Units.validMapType( (String) searchParams.get( "map_type" ) ) ) {
            Units units = new Units( conn, searchParams );
            searchParams.put( "units", units );
        }



        // parent germplasm info. will only be in search params if linking
        // from parent's detail page to view full list of children
        if ( !TextConverter.isEmpty( request.getParameter( "parent_germplasm_id" ) ) ) {
            try {
                Long id = new Long( request.getParameter( "parent_germplasm_id" ) );
                searchParams.put( "parent_germplasm_id", id );
                searchParams.put( "parent_germplasm_name",
                                  request.getParameter( "parent_germplasm_name" ) );
            } catch ( NumberFormatException nfe ) {
                errors.put( "parent germplasm id",
                            "Invalid parent germplasm id: " + nfe.getMessage() );
            }
        }


        if ( errors != null && !errors.isEmpty() ) {
            throw new InvalidFormException( errors, "Errors on form submission" );
        }

        return searchParams;
    }

    /**
     * Download all selected items
     */
    private RequestHandlerResponse download( HttpServletRequest request )
        throws SQLException, InvalidFormException, InvalidParameterException,
               SessionOutOfTimeException {

        Long[] formIDs;
        StringBuffer export = null;
        String downloadText = null;
        GermplasmSummary[] records = null;
        GermplasmSearcher searcher = null;
        DBWriteManager connectionPool = null;
        DBconnection conn = null;
        String session_id = null;
        RequestHandlerResponse response = null;
        List ids = null;
        SearchSession searchSession = null;

        searchSession = SessionHandler.getSearchSession( request );
        String query_id = (String) request.getParameter( "query_id" );
        if ( searchSession == null || !searchSession.searchInProgress( searchType ) || query_id == null) {
            throw new SessionOutOfTimeException( "No germplasm search in progress" );
        } else {
            // get any items selected on previous pages
            ids = searchSession.getDownload( query_id );
            if ( ids == null ) {
                ids = new ArrayList();
            }
        }

        // combine previously selected with selections from current page
        if ( !TextConverter.isEmpty( request.getParameter( "id" ) ) ) {
            formIDs = TextConverter.stringToLongArray( request.getParameterValues( "id" ) );
            if ( formIDs != null && formIDs.length > 0 ) {
                for ( int i = 0; i < formIDs.length; i++ ) {
                    ids.add( formIDs[ i ] );
                }
            }
        }

        if ( ids == null || ids.isEmpty() ) {
            throw new InvalidFormException( "No records selected for download" );
        }

        try {
            session_id = request.getSession().getId();
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();
            searcher = new GermplasmSearcher();
            records = searcher.getSelected( conn, ids, query_id );

            if ( records != null && records.length > 0 ) {
                export = new StringBuffer();

                // get header from first element in results
                export.append( records[ 0 ].getExportHeader() );
                for ( int i = 0; i < records.length; i++ ) {
                    export.append( records[ i ].createExport() );
                }
                downloadText = export.toString();
            }

            response = new RequestHandlerResponse();
            response.setPage( "/jsp/common/download.jsp" );
            response.setAttribute( "downloadText", downloadText );

        } catch ( NumberFormatException nfe ) {
            throw new InvalidParameterException( "Invalid id: " + nfe.getMessage() );

        } finally {
            if ( conn != null ) {
                connectionPool.return_connection( conn );
            }
        }
        return response;
    }


}
