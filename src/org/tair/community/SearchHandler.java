//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.14 $
// $Date: 2003/12/03 17:56:02 $
//------------------------------------------------------------------------------

package org.tair.community;

import java.util.*;
import java.sql.*;
import javax.servlet.http.*;
import org.tair.handler.*;
import org.tair.tfc.*;
import org.tair.utilities.*;

/** 
  * SearchHandler handles Community search requests as part of registration 
  * or profile maintenance. SearchHandler examines request parameters and
  * calls appropriate search methods in <code>CommunitySearcher</code> after
  * validating request information with <code>CommunityFormValidator</code>. 
  * Searches handled by SearchHandler include:
  * 
  * <ul>
  * <li>Searches for duplicate person records when user is first registering</li>
  * <li>Searches for duplicate lab/organization records when user first creates 
  *     organization</li>
  * <li>Searches for PIs and associated labs</li>
  * <li>Searches for other parent organizations</li>
  * <li>Searches for lab and organization members</li>
  * </ul>
  *
  * @see CommunitySearcher
  * @see CommunityFormValidator
  * @see RequestHandler
  *
  */


public class SearchHandler implements RequestHandler {

    private final String actionURL =  "Community";


    /**
     * Executes searches as part of community profile maintenance. Type of search
     * to be done is specified by "path" request parameter.  Valid values of path
     * include:
     * 
     * 
     * <ul>
     * <li>super_org - Returns all organizations for org to org affiliations
     * <li>member - Returns persons for organization member affiliations
     * <li>duplicate_person - Returns persons as part of duplicate search before
     *     creating new registration
     * <li>duplicate_org - Returns "other" organizations as part of duplicate
     *     search before creating a new registration
     * <li>duplicate_lab - Returns labs as part of duplicate search before creating 
     *     a new registration
     * <li>person_org - Returns all non-lab organizations for a person to affiliate
     *     themselves to
     * <li>pi - Searches for lab PIs and their associated labs for person to affiliate
     *     themselves to
     * </ul>
     * 
     * @param request <code>HttpServletRequest</code> passed from servlet
     * @return <code>RequestHandlerResponse</code> containing URL of next page user should 
     *    be forwarded to, and a <code>SearchResultsCollection</code> containing search 
     *    results and scrolling parameters.
     * @exception InvalidFormException thrown if a search is requested without proper 
     *    parameters in request
     * @exception SQLException thrown if an error occurs while retrieving information 
     *    from the database
     * @exception InvalidParameterException thrown if an invalid type or path is requested
     * @see SearchResultsCollection
     * @see ScrollCalculator
     */
    public RequestHandlerResponse process( HttpServletRequest request ) 
        throws InvalidFormException, SQLException, InvalidParameterException {

        RequestHandlerResponse response = null;
        DBconnection conn = null;
        DBReadManager connectionPool = null;

        try {

            connectionPool = DBReadManager.getInstance();
            conn = connectionPool.get_connection();
            response = search( request, conn );
            
        } finally {
          DBReadManager.return_connection( conn );
        }

        return response;
    }

    /**
     * Searches community records according to "path" parameter in request. Path
     * may have the following values:
     * 
     * <ul>
     * <li>super_org - Returns all organizations for org to org affiliations
     * <li>member - Returns persons for organization member affiliations
     * <li>duplicate_person - Returns persons as part of duplicate search before
     *     creating new registration
     * <li>duplicate_org - Returns "other" organizations as part of duplicate
     *     search before creating a new registration
     * <li>duplicate_lab - Returns labs as part of duplicate search before creating 
     *     a new registration
     * <li>person_org - Returns all non-lab organizations for a person to affiliate
     *     themselves to
     * <li>pi - Searches for lab PIs and their associated labs for person to affiliate
     *     themselves to
     * </ul>

     */
    @SuppressWarnings("unchecked")
    private RequestHandlerResponse search( HttpServletRequest request,
                                           DBconnection conn ) 
        throws SQLException, InvalidFormException, InvalidParameterException {
        
        
        // path tells us what type of search we're doing
        String path = request.getParameter( "path" );
        
        
        
        // get scroll & search params
        ScrollParams scrollParams = ScrollCalculator.getScrollParams( request );
        Map params = CommunityFormValidator.validateAffiliationSearchInfo( request );
        


        // if/else through values of path to determine what search
        // method to call on CommunitySearcher - searchCollection
        // will hold results of search
        SearchResultsCollection searchCollection = null;
        
        // return all orgs including labs for org to org affiliations
        if ( path != null && path.equals( "super_org" ) ) { 
            searchCollection = CommunitySearcher.searchOrganizations( conn, 
                                                                      params, 
                                                                      scrollParams, 
                                                                      false );
            // only return persons for member search results
        } else if ( path != null && path.equals( "member" ) ) {
            searchCollection = CommunitySearcher.searchPersons( conn, 
                                                                params, 
                                                                scrollParams);
            
        // return list of persons w/any labs they're PI for
        } else if ( path != null && path.equals( "pi" ) ) {
            searchCollection = CommunitySearcher.searchPIs( params, 
                                                            scrollParams );
            
            // return persons for duplicate search before adding new record
        } else if ( path != null && path.equals( "duplicate_person" ) ) {
            
            searchCollection = CommunitySearcher.getPersonDuplicates( conn, 
                                                                      params, 
                                                                      scrollParams );
            
            // Duplicate search before adding new record for (non-lab) org.
        } else if ( path != null && path.equals( "duplicate_org" ) ) {
            searchCollection = CommunitySearcher.searchOrganizations( conn, 
                                                                      params, 
                                                                      scrollParams, 
                                                                      true );
            
            // Duplicate search before adding new record for new lab.
        } else if ( path != null && path.equals( "duplicate_lab" ) ) {
            searchCollection = CommunitySearcher.getLabDuplicates(params, 
                                                                   scrollParams );

            // non-lab org. search for person affiliations
        } else if ( path != null && path.equals( "person_org" ) ) {
            searchCollection = CommunitySearcher.searchOrganizations( conn, 
                                                                      params, 
                                                                      scrollParams, 
                                                                      true );
        } else {
            throw new InvalidParameterException( "Invalid search path requested: " + path );
        }
        
        return createResponse( path, searchCollection, scrollParams, params );
        
    }


    /**
     * Utility method to create response that contains URL of JSP to forward request
     * to. If searchCollection is not empty, user will be redirected to specific results
     * page for search path.  Search collection will create scroll links for
     * user to scroll through multiple pages of results.  If no results, then
     * user will be redirected to specific no results page for search path
     *
     * @param path Type of search executed
     * @param searchCollection Search results from search
     * @param scrollParams Params that define what subset of search
     *   results is currently being shown
     * @param params Search params used to execute search
     */
    @SuppressWarnings("unchecked")
    private RequestHandlerResponse createResponse( String path, 
                                                   SearchResultsCollection searchCollection,
                                                   ScrollParams scrollParams,
                                                   Map params ) {

        RequestHandlerResponse response = new RequestHandlerResponse();
        
        // get links to scroll through multiple pages of results
        if ( searchCollection != null && !searchCollection.isEmpty() ) {
            String commParams = "action=search&path=" + path;
            
            String scrollLinks = ScrollCalculator.getScrollLinks( scrollParams.getSize(), 
                                                                  scrollParams.getPage(), 
                                                                  params, 
                                                                  commParams, 
                                                                  searchCollection, 
                                                                  actionURL 
                                                                  );
            if ( scrollLinks != null ) {
                searchCollection.setScrollLinks( scrollLinks );
            }
            response.setAttribute( "searchCollection", searchCollection );
            response.setPage( getResultsPage( path )  );
      
            // if collection empty, go to no results page w/option to search again
        } else {
            response.setPage( getNoResultsPage( path ) );
        }
        return response;
    }


    /**
     * Utility method to encapsulate which JSPs to use for
     * displaying search results from different searches 
     * represented by submitted value of path
     */
    private String getResultsPage( String path ) {
        String page = null;
        
        if ( path.equals( "super_org" ) ) {
            page = "/jsp/community/org_search_results.jsp";

        } else if ( path.equals( "member" ) ) {
            page = "/jsp/community/member_search_results.jsp";

        } else if ( path.equals( "pi" ) ) {
            page = "/jsp/community/lab_search_results.jsp";

        } else if ( path.equals( "duplicate_person" ) ) {
            page = "/jsp/community/new_person_results.jsp";
            
        } else if ( path.equals( "duplicate_org" ) ) {
            page = "/jsp/community/new_org_results.jsp";

        } else if ( path.equals( "duplicate_lab" ) ) {
            page = "/jsp/community/new_lab_results.jsp";
            
        } else if ( path.equals( "person_org" ) ) {
            page = "/jsp/community/person_org_search_results.jsp";
            
        }
        return page;
    }
    
    /**
     * Utility method to encapsulate which JSPs to use for displaying
     * no results message for each of different search types represented
     * by submitted value of path
     */
    private String getNoResultsPage( String path ) {
        String page = null;

        if ( path.equals( "super_org" ) ) {
            page = "/jsp/community/org_no_results.jsp";

        } else if ( path.equals( "member" ) ) {
            page = "/jsp/community/member_no_results.jsp";

        } else if ( path.equals( "pi" ) ) {
            page = "/jsp/community/lab_no_results.jsp";
            
        } else if ( path.equals( "duplicate_person" ) ) {
            page = "/jsp/community/new_person_no_results.jsp";
            
        } else if ( path.equals( "duplicate_org" ) ) {
            page = "/jsp/community/new_org_no_results.jsp";
            
        } else if ( path.equals( "duplicate_lab" ) ) {
            page = "/jsp/community/new_lab_no_results.jsp";
            
        } else if ( path.equals( "person_org" ) ) {
            page = "/jsp/community/person_org_no_results.jsp";
        }

        return page;
    }
}
