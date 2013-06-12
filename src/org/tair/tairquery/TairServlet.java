// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.e
// $Revision: 1.51 $
// $Date: 2006/03/08 17:32:19 $
// ------------------------------------------------------------------------------
package org.tair.tairquery;


import java.io.IOException;
import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jboss.logging.Logger;
import org.tair.abrc.order.PendingPayment;
import org.tair.abrc.order.Storage;
import org.tair.abrc.order.PendingPayment;
import org.tair.abrc.order.Storage;
import org.tair.abrc.order.PendingPayment;
import org.tair.abrc.order.Storage;
import org.tair.abrc.order.PendingPayment;
import org.tair.abrc.order.Storage;
import org.tair.abrc.order.PendingPayment;
import org.tair.abrc.order.Storage;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.bs.community.PersonDelegate;
import org.tair.querytools.Detail;
import org.tair.querytools.DetailFactory;
import org.tair.querytools.GeneDetail;
import org.tair.querytools.LocusDetail;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcStock;
import org.tair.utilities.AccessionManager;
import org.tair.utilities.DatabaseServerOfflineException;
import org.tair.utilities.InvalidAccessionException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.ServletLogger;
import org.tair.utilities.TextConverter;

import com.poesys.bs.delegate.DelegateException;


/**
 * TairServlet is the main servlet for retrieving objects to be displayed on a
 * detail page. This servlet receives HTTP requests and uses parameters from the
 * <code>HttpServletRequest</code> to create any one of several objects that
 * implement the <code>Detail</code> interface. Detail objects can be created
 * using a type/id syntax, where a parameter called "type" in the request
 * denotes what type (i.e. gene) of object to create and a parameter called "id"
 * is the specific id to use when creating the object (i.e. gene_id). Detail
 * objects can also be created using the TAIR accession syntax, where a
 * parameter called "accession" equals the published TAIR accession number for
 * the detail object (usually accession # = type:super_id where super_id is
 * tair_object_id, community_id, or reference_id).
 * 
 * <p>
 * Detail objects are created by <code>DetailFactory</code>, which creates
 * instances of Detail classes according to the type key it receives.
 * DetailFactory also holds all URLs for JSPs used to display Detail class data.
 * 
 * <p>
 * TairServlet now handles all creation of StockDetail objects that used to be
 * handled by StockSearcher and SeedSearcher URLs. Now that all stock info. is
 * in the db, this URLs are set up as aliases to this servlet; this is done to
 * preserve any external linking done to TAIR using this URLs, while allowing us
 * to get rid of obsolete servlets & centralize all Detail object creation here.
 * 
 * @see Detail
 * @see DetailFactory
 */

public class TairServlet extends HttpServlet {
  /** Serial version UID for Serializable object  */
  private static final long serialVersionUID = 1L;
  /** Logger for this class */
  private static final Logger logger = Logger.getLogger(TairServlet.class);
  
  private DBReadManager connectionPool;
  private DetailFactory factory;
  private static long germLimit = 15L;
  private static long polyLimit = 15L;

  /**
   * Creates DetailFactory with type keys and associated class names for
   * creating Detail objects, and populates collection of JSP URLs to use for
   * displaying detail information for each possible type. This method also
   * initializes the <code>DBReadManager</code> connection pool.
   * 
   * @param config An instance of ServletConfig that contains configuration
   *          information for this servlet
   * @throws ServletException If any errors encountered in initializing servlet
   */
  public void init(ServletConfig config) throws ServletException {
    super.init(config);
    try {
      DBReadManager.init();
      connectionPool = DBReadManager.getInstance();
      factory = new DetailFactory();
    } catch (Exception ex) {
      ex.printStackTrace();
      throw new ServletException("Error initializing TairServlet: "
                                 + ex.getMessage());
    }
  }

  /**
   * Handles all requests (GET & POST) for this servlet. Creates one of several
   * possible Detail objects through DetailFactory by retrieving type and id
   * information from HttpServletRequest. Once Detail object is successfully
   * created, request is forwarded to type specific detail JSP as stored in
   * internal collection. Except for IOExceptions, all exceptions generated by
   * processing, including when no appropriate Detail object can be created for
   * request params, are caught by this method and the request is forwarded to
   * one of several error pages to give feedback to the user.
   * 
   * @param request HttpServletRequest being serviced that contains all
   *          parameters submitted by user
   * @param response HttpServletResponse for this request
   * @see Detail
   * @see DetailFactory
   */
  public void service(HttpServletRequest request, HttpServletResponse response)

  throws ServletException, IOException {

    String name = null;
    String type = null;
    Long id = null;
    DBconnection conn = null;
    String displayPage = null;
    Detail detailObject = null;

    ServletLogger.start(getClass().getName(), request, response);

    try {

      conn = connectionPool.get_connection();

      //
      // Use specialized method to handle creating by stock number -
      // this is done to handle any external linking to TAIR that uses
      // the now obsolete StockSearcher or SeedSearcher URLs. Since
      // both obsolete URLs will have the parameter "stock_number",
      // we can intercept the request here & keep all detail object
      // creation in this servlet. Creating stock detail this way will
      // not throw RecordNotFoundException if stock not found -- user
      // will instead by re-directed to specialized error page requested
      // by ABRC
      //
      if (!TextConverter.isEmpty(request.getParameter("stock_number"))) {

        Map<String, Object> stockInfo = getStockDetail(conn, request);
        detailObject = (Detail)stockInfo.get("detail");
        displayPage = (String)stockInfo.get("page");
      } else if (!TextConverter.isEmpty(request.getParameter("test"))) {
        // Special test for pending payment query
        // TODO Remove after debugging complete
        Long num = new Long(request.getParameter("test"));
        List<PendingPayment> list = Storage.getPendingPaymentsFor(num);
        if (list != null) {
          logger.info("Pending payment list has " + list.size() + " payments.");
          request.setAttribute("error_source", "Tair Servlet");
          request.setAttribute("message",
                               "Pending payment list has "
                                   + list.size()
                                   + " payments.");
          request.setAttribute("exception", new SQLException("Pending Payment query executed"));
        } else {
          logger.info("Pending payment list is null.");
          request.setAttribute("error_source", "Tair Servlet");
          request.setAttribute("message",
                               "Pending payment list is null.");
        }

        forward(request, response, "/jsp/common/gen_servlet_error.jsp");
        return;
      } else { // handle requests by accession number or id

        if (!TextConverter.isEmpty(request.getParameter("accession"))) {

          String accession = request.getParameter("accession").trim();

          Map<String, Comparable<?>> accessionType =
            parseAccession(conn, accession);
          type = (String)accessionType.get("type");
          id = (Long)accessionType.get("id");

        } else {
          if (!TextConverter.isEmpty(request.getParameter("name"))) {
            name = request.getParameter("name").toUpperCase();
          }

          if (!TextConverter.isEmpty(request.getParameter("type"))) {
            type = request.getParameter("type").toLowerCase();
          }

          try {
            if (!TextConverter.isEmpty(request.getParameter("id"))) {
              id = new Long(request.getParameter("id"));
            }
          } catch (NumberFormatException nfe) {
            throw new InvalidParameterException("Invalid id: "
                                                + nfe.getMessage());
          }
        }

        // redirect people from the stock page, for seed stocks to the new
        // germplasm/stock page -> ABRC request
        if ("stock".equalsIgnoreCase(type) && (id != null || name != null)) {
          Long stock_id = id;
          if (stock_id == null) {
            stock_id = TfcStock.retrieveStockID(conn, name);
          }
          Long germplasm_id = stockIdToGermplasmId(conn, stock_id);
          if (stock_id != null && germplasm_id != null) {
            type = "germplasm";
            id = germplasm_id;
          }
        }

        if (type == null || (id == null && name == null)) {
          throw new InvalidParameterException("Invalid type, id "
                                              + "or name submitted");
        }

        // object creation will throw RecordNotFoundException
        // if no record found for submitted id or name
        if (id != null) {
          // Redirect for new Faces page implementations
          if ("person".equalsIgnoreCase(type)) {
            PersonDelegate delegate =
              CommunityDelegateFactory.getPersonDelegate();
            BigInteger communityId = new BigInteger(id.toString());
            BsPerson person = delegate.getPersonByCommunityId(communityId);
            if (person == null) {
              throw new RecordNotFoundException("No person with community id "
                                                + communityId);
            }
            // Person Faces page
            response.sendRedirect("/entity/person_detail/" + id);
            return;
          } else if ("organization".equalsIgnoreCase(type)) {
            // Special-case organization, which is not a detail object anymore
            // id is a community id, not an organization id
            BigInteger communityId = new BigInteger(id.toString());
            OrganizationDelegate delegate =
              CommunityDelegateFactory.getOrganizationDelegate();
            BsOrganization organization =
              delegate.getOrganizationByCommunityId(communityId);
            if (organization == null) {
              throw new RecordNotFoundException("No organization with community id "
                                                + communityId);
            }
            request.setAttribute("detail", organization);
            forward(request, response, "/jsp/community/organization_detail.jsp");
            return;
          }
          detailObject = factory.getDetail(conn, type, id);
        } else {
          detailObject = factory.getDetail(conn, type, name);
        }

        displayPage = factory.getDetailPage(type);
      }

      // The following hackery is (hopefully) temporary, and will be replaced
      // by our up-and-coming MDA solution. The hasLoaded() check prevents the
      // load() method from being called on a detailObject from the cache
      // (because
      // if it is in the cache, load() has already been called on it).
      if (detailObject instanceof LocusDetail
          && !((LocusDetail)detailObject).hasLoaded())
        ((LocusDetail)detailObject).load(conn, germLimit, polyLimit);
      else if (detailObject instanceof GeneDetail
               && !((GeneDetail)detailObject).hasLoaded())
        ((GeneDetail)detailObject).load(conn, germLimit, polyLimit);

      request.setAttribute("detail", detailObject);
      forward(request, response, displayPage);

      // if accession # has wrong format
    } catch (InvalidAccessionException iae) {
      logger.error("Invalid accession: " + iae.getMessage(), iae);
      forward(request, response, "/jsp/tairjsp/invalid_accession.jsp");

      // if requested detail object not found
    } catch (RecordNotFoundException rfe) {
      // no need to log this in the file log
      request.setAttribute("exception", rfe);
      forward(request, response, "/jsp/tairjsp/record_not_found.jsp");

      /* Specialized SQL Exceptions */
    } catch (DatabaseServerOfflineException dso) {
      // no need to log this one
      request.setAttribute("exception", dso);
      forward(request, response, "/jsp/common/database_offline.jsp");

      // if any other database error
    } catch (SQLException se) {
      logger.error(se.getMessage(), se);
      request.setAttribute("error_source", "Tair Servlet");
      request.setAttribute("message", "Database error");
      request.setAttribute("exception", se);
      forward(request, response, "/jsp/common/gen_servlet_error.jsp");

      // if bad action or type was passed in, or invalid id
    } catch (InvalidParameterException ipe) {
      // No need to log this.
      request.setAttribute("error_source", "Tair Servlet");
      request.setAttribute("message", "Invalid parameter");
      request.setAttribute("exception", ipe);
      forward(request, response, "/jsp/common/gen_servlet_error.jsp");

    } catch (DelegateException de) {
      // Poesys/DB business delegate exception
      logger.error("Data access error: " + de.getMessage(), de);
      request.setAttribute("error_source", "TAIR Business Delegate");
      request.setAttribute("message", "Data Access Error");
      request.setAttribute("exception", de);
      forward(request, response, "/jsp/common/gen_servlet_error.jsp");
   } finally {
      ServletLogger.end(getClass().getName(), request, response);
      if (conn != null) {
        conn.releaseResources();
        DBReadManager.return_connection(conn);
      }
    }
  }

  /**
   * Parse out accession type and number from "accession" request parameter.
   * Accession IDs should always be the "super" id for an object type (i.e.
   * tair_object_id or reference_id), however many object constructors require
   * the specific id (i.e. clone_id or gene_id). After parsing, submitted super
   * id will be translated to specific id if necessary.
   * 
   * @param conn An active connection to the database
   * @param accession Submitted request parameter value of "accession" to be
   *          parsed
   * @return Map containing String key "type" referencing object type key and
   *         String key "id" referencing ID to use for object creation as a Long
   * @throws InvalidAccessionException if accession number not in correct format
   * @throws RecordNotFoundException if ID translation fails
   * @throws SQLException if a database error occurs
   */
  private Map<String, Comparable<?>> parseAccession(DBconnection conn,
                                                    String accession)
      throws InvalidAccessionException, SQLException {

    Long accessionID = null;
    Long id = null;
    String type = null;
    Map<String, Comparable<?>> returnVals = null;
    int delimiter = accession.indexOf(":");

    try {
      if (delimiter > 0 && accession.length() > 0) {
        type = accession.substring(0, delimiter).toLowerCase();
        accessionID = new Long(accession.substring(++delimiter));
      }

    } catch (NumberFormatException nfe) {
      throw new InvalidAccessionException("Invalid accession number: "
                                          + nfe.getMessage());
    }

    // some accession types don't exactly match DetailFactory types
    // needed for object creation, so use AccessionManager to translate
    type = AccessionManager.translateType(type);

    // translate accession (super) id into id needed for Detail object
    // creation - not necessary in all cases, but AccessionManager will
    // take care of it for us
    if (type != null) {
      id = AccessionManager.translateID(conn, type, accessionID);
    }

    if (id == null) {
      RecordNotFoundException rnf =
        new RecordNotFoundException("Accession number not found: " + 
                                    accessionID);
      rnf.setType(type);
      rnf.setID(accessionID);
      throw rnf;
    }
    returnVals = new Hashtable<String, Comparable<?>>();
    returnVals.put("id", id);
    returnVals.put("type", type);

    return returnVals;
  }

  /**
   * Specialized method to retrieve stock numbers if requested through obsolete
   * URLs. Creating stock detail objects here will not throw exception if record
   * not found, rather will redirect to specialized error page. Return map with
   * detail object & page (detail page or error page) to redirect user to
   * 
   * @param conn An active connection to the database
   * @param request Servlet request
   * @return Map containing GermplasmDetail or StockDetail object as value
   *         referenced by "detail" String key and JSP to forward user to for
   *         display as String value referenced by "page" String key
   * @throws SQLException if a database error occurs
   * @throws InvalidParameterException if object creation fails
   */
  private Map<String, Object> getStockDetail(DBconnection conn,
                                             HttpServletRequest request)
      throws SQLException, InvalidParameterException {

    Detail detailObject = null;
    Map<String, Object> returnVals = null;
    String stockNumber = null;
    Long stockId = null;
    Long germplasmId = null;
    String page = null;
    String type = null;

    try {
      stockNumber = request.getParameter("stock_number");
      stockId = TfcStock.retrieveStockID(conn, stockNumber);
      germplasmId = stockIdToGermplasmId(conn, stockId);
      if (stockId == null || germplasmId == null) {
        detailObject =
          factory.getDetail(conn, "stock", stockNumber.toUpperCase());
        type = "stock";
      } else {
        detailObject = factory.getDetail(conn, "germplasm", germplasmId);
        type = "germplasm";
      }
    } catch (RecordNotFoundException rnf) {
      // intercept exception and redirect to specialized error page
      // since user community may be looking for stocks that haven't
      // been released yet, and this page gives them more info. than
      // generic "not found" page
      page = "/jsp/abrc/seed_not_found.jsp";
    }

    // if the page has not been set get the detail page
    if (page == null) {
      page = factory.getDetailPage(type);
    }

    returnVals = new HashMap<String, Object>();
    returnVals.put("detail", detailObject);
    returnVals.put("page", page);

    return returnVals;
  }

  /**
   * Maps the given stock id to a germplasm id so that users can be redirected
   * to the new germplasm/stock page. If no mapping exsits null is returned.
   * (what if there are multiple mappings?)
   * @param conn JDBC connection to the database
   * @param stockId the stock id to convert
   * @return a germplasm id or null if stock is not a germplasm
   * @throws SQLException when there is a database error
   */
  public Long stockIdToGermplasmId(DBconnection conn, Long stockId)
      throws SQLException {

    if (stockId == null) {
      return null;
    }

    Long id = null;

    String query =
      "SELECT g.tair_object_id "
          + " FROM TairObject_Stock ts, Germplasm g, Stock s "
          + " WHERE ts.tair_object_id = g.tair_object_id  "
          + " AND ts.stock_id = s.stock_id " + " AND g.is_obsolete = 'F' "
          + " AND s.is_obsolete = 'F' " + " AND ts.stock_id = "
          + stockId.toString();

    try {
      conn.setQuery(query);
      ResultSet results = conn.getResultSet();
      while (results.next()) {
        id = new Long(results.getLong("tair_object_id"));
      }
    } finally {
      conn.releaseResources();
    }

    return id;
  }

  /**
   * Convenience method to handle all forwarding to JSPs for display
   * 
   * @param request User's current servlet request
   * @param response User's current servlet response
   * @param nextPage Relative URL to redirect user to
   */
  private void forward(HttpServletRequest request,
                       HttpServletResponse response, String nextPage) {
    try {
      RequestDispatcher dispatcher =
        getServletContext().getRequestDispatcher(nextPage);

      dispatcher.forward(request, response);

    } catch (IOException e) {
      ServletContext context = getServletContext();
      context.log(e.getMessage());

    } catch (ServletException e) {
      ServletContext context = getServletContext();
      context.log(e.getMessage());
    }
  }
}
