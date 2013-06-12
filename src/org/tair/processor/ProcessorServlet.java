//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.9 $
// $Date: 2006/03/08 17:32:34 $
//------------------------------------------------------------------------------
package org.tair.processor;

import java.util.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

import org.tair.handler.*;
import org.tair.utilities.*;
import org.tair.tfc.*;


/**
 * ProcessorServlet handles all functionality that does not clearly belong
 * in any of the other existing servlets (Search, TairObject etc.).  
 * ProcessorServlet should be used to deploy all future functionality. 
 * This servlet receives HTTP requests and distributes them off to one of
 * several objects that implement the <code>RequestHandler</code> interface
 * to handle the  request. ProcessorServlet uses a parameter from the 
 * <code>HttpServletRequest</code> called <code>type</code> as a key to 
 * determine which RequestHandler should be used to process the request.
 *
 * <p>
 * RequestHandlers and their associated type keys are defined by the processor
 * servlet handler config file. This config file is read by the servlet's
 * init method and its mappings are stored by <code>HandlerFactory</code>. 
 * At runtime, HandlerFactory creates instances of handler classes according to 
 * the type key it receives.
 *
 * @see RequestHandler
 * @see HandlerFactory
 */

public class ProcessorServlet extends HttpServlet {

    /**
   * 
   */
    private static final long serialVersionUID = -7652494706116401440L;
    private HandlerFactory factory;

    /**
     * Populates handler factory with action keys and associated class names
     * for creating RequestHandler objects to service requests for specific 
     * actions. RequestHandler mappings are read from the processor handler
     * config file This method also initializes both 
     * <code>DBWriteManager</code> and <code>DBReadManager</code> connection 
     * pools to ensure they are available when accessed directly by RequestHandler 
     * objects.
     *
     * @param config  An instance of ServletConfig that contains configuration 
     * information for this servlet
     * @throws ServletException  If any errors encountered in initializing 
     * servlet
     */
    public void init( ServletConfig config ) throws ServletException {
	super.init( config );

	try {
	    DBWriteManager.init();
	    DBReadManager.init();

	    // Populate factory with action keys & associated class names.
	    // Get map of info from ObjectInfoCollection, which reads
	    // data from processor config file (should be at 
	    // $HOME/conf/processor.conf)
            factory = new HandlerFactory( );
            ObjectInfoCollection info = new ObjectInfoCollection();
            info.loadProcessorFile();
            Map handlers = info.getProcessorHandlerClasses();
	    
	    String type = null;
	    String handlerClass = null;
            Iterator iter = handlers.keySet().iterator();
            while ( iter.hasNext() ) {
                type = (String) iter.next();
                handlerClass = (String) handlers.get( type );
                factory.addHandler( type, handlerClass );
            }

        } catch ( Exception ex ) {
            ex.printStackTrace( );
            throw new ServletException( "Error initializing processor servlet: " + 
                                        ex.getMessage() );
        }
    
    }
  
    /**
     * Handles all requests (GET & POST) for this servlet.  Method passes request
     * off to one of several RequestHandler objects for processing and receives a
     * RequestHandlerResponse object containing a <code>String</code> for what URL
     * the request should be forwarded to, and any newly created objects to be 
     * translated to the user's HttpServletRequest for display to the user.  Except for 
     * IOExceptions, all exceptions generated by processing are caught by this method 
     * and the request is forwarded to one of several error pages to give feedback 
     * to the user.
     * 
     * Service looks for a type parameter in the HttpServletRequest to decide which
     * RequestHandler to use for processing. Types and Handlers are defined in
     * processor handler config file (should usually be at $HOME/conf/processor.conf)
     *
     * @param request HttpServletRequest being serviced that contains all parameters 
     *  submitted by user
     * @param response HttpServletResponse for this request
     * @see RequestHandler
     * @see RequestHandlerResponse
     * @see HandlerFactory
     */
    public void service( HttpServletRequest request, HttpServletResponse response ) 
	throws IOException {

      ServletLogger.start(getClass().getName(), request, response);
      
	try {
	    String type = request.getParameter( "type" );
      
	    if ( type == null || !factory.containsKey( type ) ) {
		throw new InvalidParameterException( "Invalid type requested: " + 
						     type );

	    }
	    // use type as key to retrieve appropriate RequestHandler for processing
	    RequestHandler handler = factory.getHandler( type );
	    RequestHandlerResponse resp = handler.process( request );
	    
	    // transfer any attributes in RequestHandlerResponse to HttpServletRequest
	    if ( resp.hasAttributes() ) {
		Iterator iter = resp.getAttributeKeys();
		while ( iter.hasNext() ) {
		    String key = (String) iter.next();
		    request.setAttribute( key, resp.getAttribute( key ) );
		}
	    }
	    
	    // forward to JSP returned by RequestHandlerResponse
	    forward( request, response, resp.getPage() ); 


	    // if somewhere user needs to be logged in
	} catch ( InvalidLoginException ile ) {
      
	    // pass along original request so user can be returned there
	    // after logging in
	    String originalPage = (String) request.getParameter( "originalPage"  );

	    // if no originalPage yet, create it by parameters from GET or POST
	    if ( originalPage == null || originalPage.equals( "" ) ) {
		originalPage = HTMLFactory.getRequestURL( request );
	    }

	    request.setAttribute( "originalPage", originalPage );
	    request.setAttribute( "exception", ile );
	    forward( request, response, "/jsp/community/login.jsp" );


	    /* Specialized SQL Exceptions */
	    
	    // if database server offline as part of planned downtime
	} catch ( DatabaseServerOfflineException dso ) {
	    request.setAttribute( "exception", dso );
	    forward( request, response, "/jsp/common/database_offline.jsp" );
	    
	    // if any other database error
	} catch ( SQLException se ) {
	    log( se.getMessage(), se );
	    request.setAttribute( "error_source", "Processor Servlet" );
	    request.setAttribute( "message", "Database error" );
	    request.setAttribute( "exception", se );
	    forward( request, response, "/jsp/common/gen_servlet_error.jsp" );

	    // if bad form data was passed in
	} catch ( InvalidFormException ife ) {
	    request.setAttribute( "exception", ife );
	    forward( request, response, "/jsp/common/gen_form_error.jsp" );

	    // if trying to do something that violates business rules 
	} catch ( InvalidActionException iae ) {
	    request.setAttribute( "exception", iae );
	    forward( request, response, "/jsp/common/invalid_action_error.jsp" );

	    // if bad action or type was passed in, or invalid id
	} catch ( InvalidParameterException ipe ) {
	    log( ipe.getMessage(), ipe );
	    request.setAttribute( "error_source", "Processor Servlet" );
	    request.setAttribute( "message", "Invalid parameter" );
	    request.setAttribute( "exception", ipe );
	    forward( request, response, "/jsp/common/gen_servlet_error.jsp" );

	    // if requesting resource not authorized for
	} catch ( UnauthorizedRequestException ure ) {
	    request.setAttribute( "exception", ure );
	    forward( request, response, "/jsp/common/unauthorized_error.jsp" );

	    // if object not in session when it should be  
	} catch ( InvalidSessionException ise ) {
	    request.setAttribute( "exception", ise );
	    forward( request, response, "/jsp/common/session_error.jsp" );
	
		} finally {
        ServletLogger.end(getClass().getName(), request, response);
    }

    }


    /**
     * Convenience method to handle all forwarding to JSPs for display
     */
    private void forward( HttpServletRequest request, 
			  HttpServletResponse response, 
			  String nextPage ) 
    {
	try {
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher( nextPage );
	    dispatcher.forward( request, response );

	} catch ( IOException e ) {
	    ServletContext context = getServletContext();
	    context.log( e.getMessage() );

	} catch ( ServletException e ) {
	    ServletContext context = getServletContext();
	    context.log( e.getMessage() );
	}

    }

}