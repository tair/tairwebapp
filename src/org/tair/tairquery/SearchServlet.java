// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.48 $
// $Date: 2006/03/08 17:57:11 $
// ------------------------------------------------------------------------------

package org.tair.tairquery;


import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jboss.logging.Logger;
import org.tair.abrc.handler.InvoiceHandlerFactory;
import org.tair.handler.HandlerFactory;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.GeneralSearchHandler;
import org.tair.search.table.MasterTableInfo;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBWriteManager;
import org.tair.utilities.DatabaseServerOfflineException;
import org.tair.utilities.HTMLFactory;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.ObjectInfoCollection;
import org.tair.utilities.ServletLogger;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.UnauthorizedRequestException;


/**
 * SearchServlet is the main servlet for searching the TAIR database through
 * user search interfaces. This servlet receives HTTP requests and distributes
 * them off to one of several objects that implement the
 * <code>RequestHandler</code> interface to handle the request. SearchServlet
 * uses a parameter from the <code>HttpServletRequest</code> called
 * <code>type</code> as a key to determine which RequestHandler should be used
 * to process the request. Each RequestHandler returns a
 * <code>RequestHandlerResponse</code> object that contains the URL of the JSP
 * to forward the request to for display, and any objects creating during
 * processing that are needed for display of results.
 * 
 * <p>
 * RequestHandlers are created by <code>HandlerFactory</code>, which creates
 * instances of handler classes according to the type key it receives. Each
 * Handler object handles all requests for a particular type of search. The list
 * of search types and corresponding Handler class names is populated by
 * ObjectInfoCollection, which reads in the list of handlers from the search
 * config file. This is done to make it easier to deploy SearchServlet in
 * multiple environments (test, production, stanford etc.) without having to
 * compile a different version (with a different list of handlers) for each
 * environment. The location of the search config file is stored in the
 * SysProperties object as the SEARCH_CONF_FILE property which should be
 * $HOME/conf/search.conf.
 * 
 * <p>
 * As SearchServlet initializes, it also retrieves a list of temp table info
 * class names from ObjectInfoCollection (also read from the search config file)
 * and passes them to <code>MasterTableInfo</code> which instantiates the info
 * classes and stores them internally for use in creating and defining user temp
 * tables that cache search results.
 * 
 * <p>
 * Servlet also populates GeneralSearchHandler's collection of search types and
 * corresponding GeneralSearcher class names to use for different types of
 * searches executed as part of general search. This list of types and class
 * names is retrieved from ObjectInfoCollection which reads the data from the
 * general search config file. The location of this file is stored in the
 * SysProperties object as the GENERAL_SEARCH_FILE property, which should
 * usually be $HOME/conf/general.conf
 * 
 * @see RequestHandler
 * @see HandlerFactory
 * @see ObjectInfoCollection
 */

public class SearchServlet extends HttpServlet {

  /** Serial version UID for Serializable class */
  private static final long serialVersionUID = 1L;

  /** Logger for the servlet */
  private static final Logger logger = Logger.getLogger(SearchServlet.class);

  private HandlerFactory factory;
  private Map<String, String> pages;

  /**
   * Populates handler factory with type keys and associated class names for
   * creating RequestHandler objects to service requests for specific actions.
   * This collection is populated by ObjectInfoCollection, which reads in the
   * list from the object type config file. Servlet initialization also
   * populates GeneralSearchHandler's collection of GeneralSearcher objects and
   * search types used for executing general searches, and initializes both
   * <code>DBWriteManager</code> and <code>DBReadManager</code> connection pools
   * to ensure they are available when accessed directly by RequestHandler
   * objects.
   * 
   * @param config An instance of ServletConfig that contains configuration
   *          information for this servlet
   * @throws ServletException If any errors encountered in initializing servlet
   * @see ObjectInfoCollection
   */
  @SuppressWarnings("unchecked")
  public void init(ServletConfig config) throws ServletException {
    Map<String, String> handlers = null;
    Iterator<String> iter = null;
    String type = null;
    String handlerClass = null;
    ObjectInfoCollection info = null;

    super.init(config);

    try {
      // make sure both connection pools are initialized
      DBReadManager.init();
      DBWriteManager.init();

      // get list of search types & handler class names from
      // ObjectInfoCollection
      // and populate HandlerFactory with types for this servlet
      factory = new HandlerFactory();
      info = new ObjectInfoCollection();
      info.loadSearchFile();
      handlers = info.getSearchHandlers();

      iter = handlers.keySet().iterator();
      while (iter.hasNext()) {
        type = (String)iter.next();
        handlerClass = (String)handlers.get(type);
        factory.addHandler(type, handlerClass);
      }

      // manually add download handler since it doesn't make sense to
      // list it in config file read by ObjectTypeCollection
      factory.addHandler("download", "org.tair.abrc.handler.DownloadHandler");

      // store pages for common simple redirections -- load list from
      // ObjectInfoCollection, which gets data from search config file
      pages = info.getSearchPages();

      // get collection of search temp table classes used by searches to
      // cache search results & pass to MasterTableInfo so it can populate
      // its collection of info classes
      MasterTableInfo.populateTempTables(info.getTableInfoClasses());

      // load general search types and corresponding GeneralSearcher class
      // names and pass to GeneralSearchHandler to use for executing different
      // sub-searches of general search.
      info.loadGeneralSearchFile();
      GeneralSearchHandler.populateSearchers(info.getGeneralSearchClasses());

    } catch (Exception ex) {
      ex.printStackTrace();
      throw new ServletException("Error initializing search servlet: "
                                 + ex.getMessage());
    }

  }

  /**
   * <p>
   * Handles all requests (GET & POST) for this servlet. Method passes request
   * off to one of several RequestHandler objects for processing and receives a
   * RequestHandlerResponse object containing a <code>String</code> for what URL
   * the request should be forwarded to, and any newly created objects to be
   * translated to the user's HttpServletRequest for display to the user. Except
   * for IOExceptions, all exceptions generated by processing are caught by this
   * method and the request is forwarded to one of several error pages to give
   * feedback to the user.
   * </p>
   * <p>
   * Service looks for an type parameter in the HttpServletRequest to decide
   * which RequestHandler to use for processing.
   * </p>
   * <p>
   * If the request response handler attribute "downloadText" is set with a
   * non-null string, this service sets the HTTP content headers to download the
   * text as a file. When the browser renders the response, it will prompt for
   * download and will then display the original page.
   * </p>
   * 
   * @param request HttpServletRequest being serviced that contains all
   *          parameters submitted by user
   * @param response HttpServletResponse for this request
   * @see RequestHandler
   * @see RequestHandlerResponse
   * @see HandlerFactory
   */
  public void service(HttpServletRequest request, HttpServletResponse response) {

    ServletLogger.start(getClass().getName(), request, response);

    // retrieve requested type & use as key to retrieve appropriate
    // RequestHandler
    // for processing. Retrieve action to see if we can do page redirection
    // w/out
    // creating new object
    try {

      String type = request.getParameter("type");

      // action might be in "action" or "search_action" - summary pages use
      // search action because of conflicts with form.action attribute in
      // javascript in Mac IE 4.5
      String action = request.getParameter("action");
      if (action == null) {
        action = request.getParameter("search_action");
      }

      if (type == null || !factory.containsKey(type)) {
        throw new InvalidParameterException("Invalid search type requested: "
                                            + type);
      }

      // if new search requested, handle redirection to search form here w/out
      // creating Handler (if possible). It is possible that a search type will
      // not have a search form defined in pages collection (if NULL is entered
      // in search.conf). In this case, handler will be created to initiate
      // search
      // and redirect appropriately. This is done to allow for custom actions at
      // the beginning of a new search to be defined by individual handlers
      // (expression
      // search, for example).
      if (action != null
          && action.equals("new_search")
          && pages.containsKey(type)) {

        String nextPage = (String)pages.get(type);
        forward(request, response, nextPage);

      } else {
        // create handler to process request
        RequestHandler handler = null;
        // For invoice and userinvoice types, create an InvoiceSearchHandler.
        if ("invoice".equals(type) || "userinvoice".equals(type)) {
          InvoiceHandlerFactory factory = new InvoiceHandlerFactory(request);
          handler = factory.getHandler(null);
        } else {
          handler = factory.getHandler(type);
        }

        RequestHandlerResponse resp =
          SearchServletHandler.getResponse(handler, request);

        if (resp == null) {
          try {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
          } catch (Exception e) {
          }
          return;
        }

        // transfer any attributes in RequestHandlerResponse to
        // HttpServletRequest
        // so next page can access them.
        if (resp.hasAttributes()) {
          Iterator<String> iter = resp.getAttributeKeys();
          while (iter.hasNext()) {
            String key = (String)iter.next();
            request.setAttribute(key, resp.getAttribute(key));
          }
          String downloadText = (String)request.getAttribute("downloadText");
          String downloadName = (String)request.getAttribute("downloadName");
          if (downloadName == null || downloadName.length() == 0) {
            downloadName = "download.csv";
          }
          if (downloadText != null && downloadText.length() > 0) {
            // Write out the download text directly through the servlet.
            response.setHeader("Content-length", "" + downloadText.length());
            // Use "invalid" MIME type to force browser to use name as is
            // without attaching some extension or other
            response.setContentType("application/tair-download; charset=utf-8");
            response.setHeader("Content-Disposition", "attachment; filename="
                                                      + downloadName);
            byte[] bytes = downloadText.getBytes();
            try {
              response.getOutputStream().write(bytes);
              return; // don't forward, already committed
            } catch (IOException e) {
              logger.error(e.getMessage(), e);
              request.setAttribute("exception", e);
              resp.setPage("/jsp/common/error.jsp");
            }
          }
        }

        // forward to JSP returned by RequestHandlerResponse
        forward(request, response, resp.getPage());
      }

      // if connection pools are denying connections to present
      // a specific error message
    } catch (DatabaseServerOfflineException dso) {
      request.setAttribute("exception", dso);
      forward(request, response, "/jsp/common/database_offline.jsp");

      // if any other database error
    } catch (SQLException se) {
      log(se.getMessage(), se);
      request.setAttribute("error_source", "Search Servlet");
      request.setAttribute("message", "Database Error");
      request.setAttribute("exception", se);
      forward(request, response, "/jsp/common/gen_servlet_error.jsp");

      // if bad form data was passed in
    } catch (InvalidFormException ife) {
      request.setAttribute("exception", ife);
      forward(request, response, "/jsp/common/gen_form_error.jsp");

      // if bad action or type was passed in, or invalid id
    } catch (InvalidParameterException ipe) {
      log(ipe.getMessage(), ipe);
      request.setAttribute("error_source", "Search Servlet");
      request.setAttribute("message", "Invalid Parameter");
      request.setAttribute("exception", ipe);
      forward(request, response, "/jsp/common/gen_servlet_error.jsp");

      // if search session object not found or is wrong type
    } catch (SessionOutOfTimeException sot) {
      request.setAttribute("message", "Session has expired.  Restart search.");
      request.setAttribute("exception", sot);
      forward(request, response, "/jsp/common/search_session_error.jsp");

      // if object not in session when they should be
    } catch (InvalidSessionException ise) {
      request.setAttribute("exception", ise);
      forward(request, response, "/jsp/common/session_error.jsp");

      // should never happen in this servlet
    } catch (UnauthorizedRequestException ure) {
      log(ure.getMessage(), ure);
      request.setAttribute("exception", ure);
      forward(request, response, "/jsp/common/unauthorized_error.jsp");

    } catch (InvalidLoginException ipe) {
      // if request doesn't already have originalPage defined
      // to redirect user to after login, recreate it from current
      // contents of request
      if (request.getAttribute("originalPage") == null) {
        String originalPage = (String)request.getParameter("originalPage");

        if (originalPage == null || originalPage.equals("")) {
          originalPage = HTMLFactory.getRequestURL(request);
        }

        request.setAttribute("originalPage", originalPage);
      }
      request.setAttribute("exception", ipe);
      forward(request, response, "/jsp/community/login.jsp");

    } finally {
      ServletLogger.end(getClass().getName(), request, response);
    }

  }

  /**
   * convenience method to handle all forwarding to JSPs for display
   * 
   * @param request the HTTP request
   * @param response the HTTP response
   * @param nextPage the page to which to forward
   */
  private void forward(HttpServletRequest request,
                       HttpServletResponse response, String nextPage) {
    try {
      RequestDispatcher dispatcher =
        getServletContext().getRequestDispatcher(nextPage);
      dispatcher.forward(request, response);

    } catch (IOException e) {
      // Look for "Stream closed" and ignore it, otherwise just log.
      if (!e.getMessage().contains("Stream closed")) {
        logger.error("Search exception: " + e.getMessage(), e);
      }
    } catch (ServletException e) {
      logger.error("Search exception: " + e.getMessage(), e);
    } catch (Exception e) {
      // Look for "flushing data" and ignore it, otherwise just log.
      if (!e.getMessage().contains("flushing data")) {
        logger.error("Search exception: " + e.getMessage(), e);
      } else {
        logger.error("Search exception: " + e.getMessage(), e);
        throw new RuntimeException("Invalid search: " + e.getMessage(), e);
      }
    }
  }
}
