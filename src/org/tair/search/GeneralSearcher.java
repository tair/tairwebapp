//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.3 $
// $Date: 2005/02/07 20:27:38 $
//------------------------------------------------------------------------------ 

package org.tair.search;

import java.sql.SQLException;
import java.util.Map;
import org.tair.tfc.DBconnection;

import org.tair.utilities.SearchResultsCollection;

/**
 * GeneralSearcher defines an interface to be implemented by any type-specific
 * Searcher objects that are used in the general search.  GeneralSearchHandler
 * contains a collection of all available objects implementing the interface, 
 * then uses them to get raw counts or full result sets, of different object
 * types that match the search criteria.  This is done through the single 
 * interface method doGeneralSearch() which will either just get counts of 
 * matches, or will select search results for display on the type-specific 
 * summary page. This allows GeneralSearchHandler to search all object types 
 * generically, while allowing each specific searcher implementing the interface
 * to define exactly how the search parameters should be used to find objects 
 * of that specific type.
 */

public interface GeneralSearcher {

    /**
     * Executes a general search for a specific object type, retrieving either 
     * the number of matching objects, or the full list of search results to be
     * displayed on the type specific summary page. 
     *
     * @param param Collection of search parameters for executing general search.  
     * All classes implementing this interface expect the following parameters:
     *
     * <ul>
     * <li>searchTerm - String value of single search term to find matches with</li>
     * <li>method - String value of search method (starts with, contains etc.) to 
     *  use when searching
     * <li>sessionID - User's session ID. Needed for creating and accessing temp 
     *  tables that full result sets are stored in</li>
     * </ul>
     *
     * @param doCounts If <code>true</code> only the number of matching objects 
     * of a specific type are retrieved; if <code>false</code> a full search 
     * will be executed, retrieving data objects for display on a 
     * type-specific summary page
     *
     * @return SearchResultsCollection containing either only the number of 
     * matching objects found (available through the getResultSize() method), 
     * or any and all data needed by a type-specific summary page for 
     * displaying the itemized list of matching search results.  When doing full
     * searches, SearchResultsCollection must at a minimum contain the URL of 
     * the JSP used to display type-specific search results.  This is used by 
     * GeneralSearchHandler to redirect the user's request to the proper JSP for
     * viewing the full results of the general search.
     * 
     * @throws SQLException if a database error occurs
     */
    public SearchResultsCollection doGeneralSearch( Map params, 
						    boolean doCounts,
                            boolean firstSearch) 
	throws SQLException;

    public String generateInsertLine(DBconnection conn, Map params, 
                            String type )
    throws SQLException;
}
