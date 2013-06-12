//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.12 $
// $Date: 2006/03/08 17:32:26 $
//------------------------------------------------------------------------------
package org.tair.tairquery;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tair.handler.MultipartRequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.processor.microarray.MicroarrayLoadHandler;
import org.tair.search.ExpressionSearchHandler;
import org.tair.search.KeywordSearchHandler;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBWriteManager;
import org.tair.utilities.DatabaseServerOfflineException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.ServletLogger;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.UnauthorizedRequestException;
import org.tair.utilities.WebApp;

import com.oreilly.servlet.MultipartRequest;

/**
 * MultipartServlet is the servlet for searching the TAIR database through 
 * user search interfaces that have a file upload capbility. The reason for the
 * separate servlet is that the search form that contains a file upload control
 * requires the attribute of enctype="multipart/form-data" on the form.  
 * With this attribute set none of the query styring parameters are accessible 
 * through the request object.  A MultipartRequest object must be created to 
 * access the form parameters.  The MultipartRequest class is a third party
 * class contained with in the com.oreilly.servlet package.  The servlet presses
 * the request and hands it off to the  appropriate handler but now the request
 * handler is a MultipartRequestHandler since the MultipartRequest object must
 * be passed to the type specific search handler processing this type of form.
 *
 * <p>
 * This servlet receives HTTP requests and distributes them off to one of 
 * several objects that implement the <code>MultipartRequestHandler</code>
 * interface to handle the  request. MultipartServlet uses a parameter from the 
 * <code>MultipartRequest</code> called <code>type</code>  as a key to determine 
 * which MultipartRequestHandler should be used to process the request. Each 
 * MultipartRequestHandler returns a <code>RequestHandlerResponse</code> object 
 * that contains the URL of the JSP to forward the request to for display, and
 * any objects creating during processing that are needed for display of 
 * results.
 *
 * <p>
 * MultipartRequestHandlers are created by inline right now using an if 
 * statement to determine which one to invoke.  In the future if the need 
 * arises a factory could be used to create instances of handler classes 
 * according to the type key it receives. 
 *
 * <p>
 * Currently, the two searches that need MultipartRequestHandlers also use temp
 * tables which will be created when  SearchServlet initializes. The 
 * SearchServlet, retrieves a list of temp table info class names from
 * ObjectInfoCollection (also read from the search config file) and passes them
 * to <code>MasterTableInfo</code> which instantiates the info classes and 
 * stores them internally for use in creating and defining user temp tables that
 * cache search results.
 *
 * <p>
 * The two searches that use MultipartRequestHander are:
 * type = expression
 * type = goslim
 * 
 *
 * @see MultipartRequestHandler
 * @see SearchServlet
 */

public class MultipartServlet extends HttpServlet {

    /**
   * 
   */
    private static final long serialVersionUID = 2235516168564623067L;
    // Directory in tmp/ to write files to as they
    // are uploaded. Location defined in WebApp
    // FILE_UPLOADS_DIR property
    private String uploadDir;

    /**
     * Initializes both <code>DBWriteManager</code> and 
     * <code>DBReadManager</code> connection pools to ensure they are available
     * when accessed directly by MultipartRequestHandler objects.
     *
     * @param config  An instance of ServletConfig that contains configuration 
     * information for this servlet
     * @throws  ServletException  If any errors encountered in initializing servlet
     */  
    public void init( ServletConfig config ) throws ServletException {    
        super.init( config );

        try {       
            // make sure both connection pools are initialized
            DBReadManager.init();
            DBWriteManager.init();

        } catch ( Exception ex ) {
            ex.printStackTrace( );
            throw new ServletException( "Error initializing multipart " +
					"servlet: " + ex.getMessage() );
        }

	// get tmp directory to write uploaded files to
	uploadDir = WebApp.getAppRoot() + WebApp.getProperty( "FILE_UPLOADS_DIR" );
    
    }


    /**
     * Handles all requests (GET & POST) for this servlet.  Method passes
     * request off to one of several MultipartRequestHandler objects for 
     * processing and receives a RequestHandlerResponse object containing
     * a <code>String</code> for what URL the request should be forwarded to,
     * and any newly created objects to be translated to the user's 
     * HttpServletRequest for display to the user.  Except for IOExceptions,
     * all exceptions generated by processing are caught by this method and
     * the request is forwarded to one of several error pages to give 
     * feedback to the user.
     * 
     * <p>
     * Service looks for an type parameter in the HttpServletRequest to decide
     * which MultipartRequestHandler to use for processing.
     *
     *
     * @param request HttpServletRequest being serviced that contains all 
     * parameters submitted by user
     * @param response HttpServletResponse for this request
     * @throws IOException if an error occurs while communicating with client
     * @throws ServletException if any other error occurs
     *
     * @see MultipartRequestHandler
     * @see RequestHandlerResponse
     */
    public void service ( HttpServletRequest request, 
			  HttpServletResponse response ) 
	throws IOException, ServletException {

        ServletLogger.start(getClass().getName(), request, response);
        
        try {
            MultipartRequest multi = null;
            MultipartRequestHandler handler = null;

            // possibly check getContentType() here
            try {

		// microarray needs 10MB buffer -- any reason to limit
		// to 500kb for searches?
                multi = new MultipartRequest( request, 
					      uploadDir,
					      //500 * 1024 ); // 500KB           
					      //10 * 1024 * 1024 ); // 10 MB
					      1 * 1024 * 1024 ); // 2

            } catch ( IOException ioe ) {
                throw new InvalidParameterException( "Invalid MULTIPART " +
						     "REQUEST: " + 
						     ioe.getMessage() );
            }
	    
            // retrieve requested type & use to create the appropriate 
	    // MultpartRequestHandler for processing
            String type = multi.getParameter( "type" );  
            if ( type.equalsIgnoreCase( "expression" ) ) {
                handler = new ExpressionSearchHandler();
            } else if ( type.equalsIgnoreCase( "single_channel" ) ) {
                handler = new ExpressionSearchHandler();
            } else if ( type.equalsIgnoreCase( "goslim" ) ) {
                handler = new KeywordSearchHandler();

	    } else if ( type.equals( "upload_microarray" ) ) {
		handler = new MicroarrayLoadHandler();

            } else {
		throw new InvalidParameterException( "Invalid search " +
						     "type requested: " + 
						     type );               
	    }

            RequestHandlerResponse resp = handler.process( request, multi );

            // transfer any attributes in RequestHandlerResponse to 
	    // HttpServletRequest so next page can access them.
            if ( resp.hasAttributes() ) {
                Iterator iter = resp.getAttributeKeys();
                while ( iter.hasNext() ) {
                    String key = ( String ) iter.next();
                    request.setAttribute( key, resp.getAttribute( key ) );
                }
            }      

            // forward to JSP returned by RequestHandlerResponse
            forward( request, response, resp.getPage() ); 
              
            /* Specialized SQL Exceptions */
        } catch ( DatabaseServerOfflineException dso ) {
            request.setAttribute( "exception", dso );
            forward( request, response, "/jsp/common/database_offline.jsp" );

            // if any other database error
        } catch ( SQLException se ) {
            log( se.getMessage(), se );
            request.setAttribute( "error_source", "Multipart Servlet" );
            request.setAttribute( "message", "Database Error" );
            request.setAttribute( "exception", se );
            forward( request, response, "/jsp/common/gen_servlet_error.jsp" );
	    
            // if bad form data was passed in
        } catch ( InvalidFormException ife ) {
            request.setAttribute( "exception", ife );
            forward( request, response, "/jsp/common/gen_form_error.jsp" );
      
            // if bad action or type was passed in, or invalid id
        } catch ( InvalidParameterException ipe ) {
            log( ipe.getMessage(), ipe );
            request.setAttribute( "error_source", "Multipart Servlet" );
            request.setAttribute( "message", "Invalid Parameter" );
            request.setAttribute( "exception", ipe );
            forward( request, response, "/jsp/common/gen_servlet_error.jsp" );
      
            // if search session object not found or is wrong type
        } catch ( SessionOutOfTimeException sot ) {
            request.setAttribute( "message", 
				  "Session has expired.  Restart search." );
            request.setAttribute( "exception", sot );

            forward( request, 
		     response,
		     "/jsp/common/search_session_error.jsp" );

            // if object not in session when they should be  
        } catch ( InvalidSessionException ise ) {
            request.setAttribute( "exception", ise );
            forward( request, response, "/jsp/common/session_error.jsp" );

	    // if non-curator user tries to access curator functions
        } catch ( UnauthorizedRequestException ure ) {
            log( ure.getMessage(), ure );
            request.setAttribute( "exception", ure );
            forward( request, response, "/jsp/common/unauthorized_error.jsp" );

	    // if user is not logged in when they should be
        } catch ( InvalidLoginException ipe ) { 
            log( ipe.getMessage(), ipe );
            request.setAttribute( "exception", ipe );
            forward( request, response, "/jsp/community/login.jsp" );
        } catch ( RuntimeException re ) {
          log( re.getMessage() );
          request.setAttribute( "error_source", "Multipart Servlet" );
          request.setAttribute( "message", "Runtime Error" );
          request.setAttribute( "exception", re );
          forward( request, response, "/jsp/common/gen_servlet_error.jsp" );
        } finally {
          ServletLogger.end(getClass().getName(), request, response);
        }
    }

    /**
     * Convenience method to handle all forwarding to JSPs for display
     *
     * @param request Servlet request
     * @param response Servlet response
     * @param nextPage URL of JSP to redirect to
     *
     * @throws IOException if an error occurs while forwarding
     * @throws ServletException if any other error occurs while forwarding
     */
    private void forward( HttpServletRequest request, 
			  HttpServletResponse response, 
			  String nextPage ) 
	throws IOException, ServletException {

	RequestDispatcher dispatcher = 
	    getServletContext().getRequestDispatcher( nextPage );
	
	dispatcher.forward( request, response );
    }


} 
