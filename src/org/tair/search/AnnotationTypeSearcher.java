/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search;

import java.sql.*;
import java.util.*;

import org.tair.tfc.DBconnection;
import org.tair.utilities.*;

/**
 * AnnotationTypeSearcher defines an interface to be implemented by any type-specific
 * Searcher objects that are used in the keyword search/ keyword browser and keyword detail (link off displayed counts).  
 * GeneralSearchHandler
 * instantiates Searchers implementing the interface, then
 * populates the searcher with sql to generate the appropriate results based on the count field that is clicked on.
 * This is done through the single interface
 * method doAnnotationTypeSearch() which will 
 * select search results for display on the type-specific summary page.
 */

public interface AnnotationTypeSearcher {

  /**
   * Executes an annotation type search for a specific object type, retrieving 
   * the list of search results to be displayed on the
   * type specific summary page. 
   *
   * @param param Collection of search parameters for executing annotation type search.  All classes
   * implementing this interface expect the following parameters:
   * <ul>
   * <li>keyword_id - Long id of keyword to search with</li>
   * <li>child_table_name - String value of child_table_name</li>
   * <li>scope - String value of whether the keyword hierachy was used as a search criteria, values are : term, children, combo
   * <li>sessionID - User's session ID. Needed for creating and accessing temp tables that result sets are stored in</li>
   *  result sets are stored in</li>
   * </ul>
   *
   * @return SearchResultsCollection containing any and all data needed by a type-specific
   * summary page for displaying the itemized list of matching search results. 
   * @exception SQLException thrown if a database error occurs
   */
  public SearchResultsCollection doAnnotationTypeSearch( Map params, boolean firstSearch ) throws SQLException;
    
  public String generateInsertLine(DBconnection conn, Map params, String type ) throws SQLException;

  public String getSearchType();
}
