/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
*/
package org.tair.processor.statistics;

import java.sql.*;
import java.util.*;
import javax.servlet.http.*;

import org.tair.handler.*;
import org.tair.querytools.*;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * StatisticsHandler handles all requests about statistics
 */


public class StatisticsHandler implements RequestHandler {
  
 /**
   * Processes all requests for statistics, This method relies on a request parameter called 
   * "update_action" ,   Valid values for update_action are:
   * <ul>
   * <li>view - view the database table statistics
   * </ul> 
   * @param request HttpServletRequest forwarded from UpdaterServlet
   * @return RequestHandlerResponse containing URL to forward user to as well 
   * @exception SQLException thrown if a database error occurs 
   */
 
    public RequestHandlerResponse process( HttpServletRequest request ) 
	throws SQLException{

	String updateAction = null;
	RequestHandlerResponse response = null;

	updateAction = request.getParameter( "update_action" );
	if ( updateAction == null || updateAction.equals( "view" ) ) {
	    response = getTableStatistics( request );
	}

	return response;
    } 
    
    private RequestHandlerResponse getTableStatistics (HttpServletRequest request) 
        throws SQLException {
      
	DBReadManager connectionPool = null;
	DBconnection conn = null;

	try {
	    connectionPool = DBReadManager.getInstance();
	    conn = connectionPool.get_connection();
	    RequestHandlerResponse response = new RequestHandlerResponse();
            TableStatisticsCollection coll =  new  TableStatisticsCollection(conn);
            response.setAttribute("table_statistics_collection", coll );
            response.setPage( "/jsp/processor/statistics/display_statistics.jsp" );
	    return response;
	} finally {
	    if (conn != null) {
		connectionPool.return_connection(conn);
	    }
	}
    }
    
  
  
}
