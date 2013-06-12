/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
*/
package org.tair.processor.transposonfamily;

import java.sql.*;
import java.util.*;
import javax.servlet.http.*;

import org.tair.community.*;
import org.tair.handler.*;
import org.tair.querytools.*;
import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * TransposonFamilyHandler handles all requests to search for, create and update 
 * entries in the TransposonFamily table. 
 */
public class TransposonFamilyHandler implements RequestHandler {

  // JSP page for searching - localize here for simplicity
  private String searchForm = "/jsp/processor/transposonfamily/display_transposons.jsp"; 


  /**
   * Processes all requests for transposon family entries. This method relies
   * on a request parameter called "update_action" to determine what stage of the
   * process user is currently in.  Valid values for update_action are:
   *
   * <li> browse - lets you browse through all transposon families on a page </li> 
   *
   * @param request HttpServletRequest forwarded from UpdaterServlet
   * @return RequestHandlerResponse containing URL to forward user to as well
   * as any data objects needed for display on the following page
   * @exception InvalidLoginException thrown if user is not logged in
   * @exception SQLException thrown if a database error occurs
   * @exception InvalidParameter exception thrown if invalid update_action, id or data received
   * @exception InvalidFormException thrown if invalid or incomplete form data is received
   * @exception UnauthorizedRequestException thrown if non-curator user attempts to access definitions functions
   */
  public RequestHandlerResponse process( HttpServletRequest request ) 
  throws InvalidLoginException, InvalidParameterException, SQLException, InvalidFormException, UnauthorizedRequestException {
    String updateAction = null;
    RequestHandlerResponse response = null;
    
    updateAction = request.getParameter( "update_action" );
    if ( updateAction == null || updateAction.equals( "something" ) ) {
      //checkLoginPermissions(request);
      response = new RequestHandlerResponse();
      response.setPage( searchForm );

    }else if ( updateAction.equals( "browse" ) ) { // list all glossarys
      response = browseAll(request);

    } else {
      throw new InvalidParameterException( "Invalid action requested: " + updateAction );
    }
    
    return response;
  }

  
    /**
    * retrieve all transposon families that are asscated in the Transpsoson Family table and
    * displays them
    *
    * @param HttpServletRequest forwarded from UpdaterServlet
    * @throws SQLException if a database error occurs
    */
  private RequestHandlerResponse browseAll(HttpServletRequest request) throws SQLException {

    DBReadManager connectionPool = null;
    DBconnection conn = null;

    try {
      connectionPool = DBReadManager.getInstance();
      conn = connectionPool.get_connection();

      RequestHandlerResponse response = new RequestHandlerResponse();
      TransposonFamilyCollection families = new TransposonFamilyCollection(conn);
      request.setAttribute("browse_fams", families);

      DefinitionsCollection glossary = new DefinitionsCollection(conn, "glossary");
      request.setAttribute("glossary", glossary);
      response.setPage( "/jsp/processor/transposonfamily/display_transposons.jsp" );
      return response;
    } finally {
      if (conn != null) {
	connectionPool.return_connection(conn);
      }
    }
  }

}
