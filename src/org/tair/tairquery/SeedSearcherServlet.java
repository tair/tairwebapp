/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.tairquery;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tair.utilities.ServletLogger;


/**
 * SeedSearcherServlet now exists just to intercept requests made the old /servlets/SeedSearcher
 * URL and to forward those requests to active code to handle the requests.
 *
 * <p>
 * Originally this class was deployed as org.tair.abrc.SeedSearcherServlet and acted as the main
 * servlet for searching & viewing seed data in the ABRC seed stock file.  Since all this data 
 * is now stored in the database, SeedSearcherServlet's functionality is now handled by the main
 * germplasm search in SearchServlet, and by TairObject (TairServlet) for creating detail objects and
 * forwarding to the stock page. TairServlet has been altered to create stock detail objects given
 * the old SeedSearcher syntax; however, to allow for any bookmarks users may have to old SeedSearcher
 * URL w/out any querystring params (which used to send user to seed search page), we can't simply alias
 * all requests to TairServlet since it's awkward to blindly send user to new seed search page that 
 * advises users to use germplasm search.  Easiest just to create this mostly empty servlet and keep
 * it around for a little while to handle these requests.
 * 
 * NM 5.5.03
 */

public class SeedSearcherServlet extends HttpServlet {

  /**
   * 
   */
  private static final long serialVersionUID = 5695137719468987252L;


  public void init( ServletConfig config ) throws ServletException {
    super.init( config );
  }


  public void service( HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    String action = null;
    String forwardURL = null;
    RequestDispatcher dispatcher = null;

    ServletLogger.start(getClass().getName(), request, response);
    
    // action might be in "action" or "search_action"  - summary pages use
    // search action because of conflicts with form.action attribute in javascript in Mac IE 4.5
    action = request.getParameter( "action" );
    if ( action == null ) {
      action = request.getParameter( "search_action" );
    }
    
    if ( action != null && action.equals( "detail" ) ) {
      forwardURL = "/servlets/TairObject";
    } else {
      forwardURL = "/jsp/abrc/seed_search.jsp";
    }

    ServletLogger.end(getClass().getName(), request, response);
    
    dispatcher = request.getRequestDispatcher( forwardURL );
    dispatcher.forward( request, response );
  }

}
