// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.

package org.tair.abrc.handler;


import java.math.BigInteger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.tair.abrc.CompositeOrder;
import org.tair.abrc.stock.Stock;
import org.tair.bs.community.BsCommunity;
import org.tair.bs.community.CommunityDelegate;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.db.community.CommunityFactory;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.CommunityFullSearcher;
import org.tair.search.CommunitySummary;
import org.tair.search.SearchSession;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.CompoundVector;
import org.tair.utilities.DataConstants;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.TextConverter;
import org.tair.utilities.UnauthorizedRequestException;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * DownloadHandler creates all export files for community, order and invoice
 * maintenance exports. Like other Handler objects, DownloadHandler returns a
 * RequestHandlerResponse object that contains any attributes to be put into the
 * HttpServletRequest and a URL of the next page to forward to. In this case,
 * the single attribute returned is a <code>String</code> called "downloadText",
 * which the calling servlet then prints to the output stream, committing the
 * response. The browser continues to display the original page from which the
 * user initiated the download request.
 */

public class DownloadHandler implements RequestHandler {

  /**
   * 
   * <p>
   * Processes the download request by calling the appropriate download factory
   * to get the download text for two types of download:
   * </p>
   * <ul>
   * <li>order</li>
   * <li>community</li>
   * </ul>
   * <p>
   * Note that invoice downloads are handled through the
   * <code>InvoiceDownloadHandler</code> and the
   * <code>InvoiceDownloadItemHandler</code>.
   * </p>
   * 
   * @param request HttpServletRequest forwarded from Servlet
   * @return RequestHandlerResponse with next page to be forwarded to
   * @throws UnauthorizedRequestException thrown if non-curator user tries to
   *           access this feature
   * @throws SQLException thrown if database error occurs while retrieving data
   *           for export
   * @throws InvalidParameterException thrown if invalid community ID submitted
   * @throws InvalidFormException thrown if no ids submitted with request
   * 
   * @see org.tair.abrc.handler.InvoiceDownloadHandler
   * @see org.tair.abrc.handler.InvoiceDownloadItemHandler
   * 
   */
  public RequestHandlerResponse process(HttpServletRequest request)
      throws UnauthorizedRequestException, InvalidFormException,
      InvalidParameterException, SQLException, SessionOutOfTimeException {

    String downloadText = null;

    String downloadType = request.getParameter("download_type");
    if (downloadType == null) {
      throw new InvalidParameterException("No download type requested");
    }

    RequestHandlerResponse response = new RequestHandlerResponse();

    if (downloadType.equals("community")) {
      String curatorFlag = request.getParameter("curator");
      if (curatorFlag != null && curatorFlag.equals("true")) {
        // Curator request, download full information.
        downloadText = curatorCommunity(request);
        // Tell the response handler to name the file "order", no extension
        response.setAttribute("downloadName", "community");
      } else {
        // Not a curator request, forward to standard user download page.
        downloadText = userCommunity(request);
        response.setPage("/jsp/common/download.jsp");
        // Tell the response handler to name the file "order", no extension
        response.setAttribute("downloadName", "community");
      }
    } else if (downloadType.equals("order")) {
      downloadText = downloadOrders(request);
      // Tell the response handler to name the file "order", no extension
      response.setAttribute("downloadName", "order");
    } else {
      throw new InvalidParameterException("Invalid download type requested: "
                                          + downloadType);
    }

    // Setting downloadText tells SearchServlet to download the text as a file
    // and then redisplay the current page.
    response.setAttribute("downloadText", downloadText);
    return response;
  }

  /**
   * Download all selected community records in format used by ABRC curators.
   * 
   * @param request the HTTP request
   * @return the text of the downloaded file
   * @throws InvalidFormException when an input in the form is invalid
   * @throws InvalidParameterException when an input parameter is invalid
   * @throws SQLException when there is a database problem
   * @throws SessionOutOfTimeException when the session isn't there
   */
  private String curatorCommunity(HttpServletRequest request)
      throws InvalidFormException, InvalidParameterException, SQLException,
      SessionOutOfTimeException {

    StringBuilder downloadString = new StringBuilder("");

    ArrayList<Long> ids = getCommunityIdsToExport(request);

    CommunityDelegate delegate =
      CommunityDelegateFactory.getCommunityDelegate();
    for (Long id : ids) {
      IPrimaryKey key =
        CommunityFactory.getCommunityPrimaryKey(new BigInteger(id.toString()));
      BsCommunity community = delegate.getObject((SequencePrimaryKey)key);
      if (community != null) {
        community.getDownloadString(downloadString);
      }
    }
    return downloadString.toString();
  }

  /**
   * Get a list of the community ids to export.
   * 
   * @param request the HTTP request
   * @return the list of <code>Long</code> ids
   * @throws SessionOutOfTimeException when no community search is in progress
   * @throws InvalidFormException when no records are selected for download
   */
  private ArrayList<Long> getCommunityIdsToExport(HttpServletRequest request)
      throws SessionOutOfTimeException, InvalidFormException {
    // make sure community search in progress
    SearchSession searchSession = SessionHandler.getSearchSession(request);

    if (searchSession == null || !searchSession.searchInProgress("community")) {
      throw new SessionOutOfTimeException("No community search in progress");
    }

    Vector<Long> ids = null;
    // get any community records selected on previous pages
    ids = searchSession.getDownload("community");
    if (ids == null) {
      ids = new Vector<Long>();
    }

    // combine previously selected with selections from current page
    if (!TextConverter.isEmpty(request.getParameter("id"))) {
      Long[] formIDs =
        TextConverter.stringToLongArray(request.getParameterValues("id"));

      if (formIDs != null && formIDs.length > 0) {
        for (int i = 0; i < formIDs.length; i++) {
          ids.add(formIDs[i]);
        }
      }
    }

    if (ids == null || ids.isEmpty()) {
      throw new InvalidFormException("No community records selected for downloading");
    }

    // Convert Vector to ArrayList<Long>--bridge old programming style
    ArrayList<Long> idArray = new ArrayList<Long>(ids.size());
    for (Object id : ids) {
      idArray.add((Long)id);
    }
    return idArray;
  }

  /**
   * Download regular user community information.
   * 
   * @param request the HTTP request
   * @return the download text
   * @throws InvalidFormException when a form field is invalid
   * @throws InvalidParameterException when a page parameter is invalid
   * @throws SQLException when there is a database problem
   * @throws SessionOutOfTimeException when no community search is in progress
   */
  private String userCommunity(HttpServletRequest request)
      throws InvalidFormException, InvalidParameterException, SQLException,
      SessionOutOfTimeException {

    String exportStr = null;

    // make sure community search in progress
    SearchSession searchSession = SessionHandler.getSearchSession(request);
    String queryID = (String)request.getParameter("query_id");
    if (searchSession == null || !searchSession.searchInProgress("community")
        || queryID == null) {
      throw new SessionOutOfTimeException("No community search in progress");
    }
    Vector<Long> ids = null;

    // get any community records selected on previous pages
    ids = searchSession.getDownload("community");
    if (ids == null) {
      ids = new Vector<Long>();
    }

    // combine previously selected with selections from current page
    if (!TextConverter.isEmpty(request.getParameter("id"))) {
      Long[] formIDs =
        TextConverter.stringToLongArray(request.getParameterValues("id"));

      if (formIDs != null && formIDs.length > 0) {
        for (int i = 0; i < formIDs.length; i++) {
          ids.add(formIDs[i]);
        }
      }
    }

    if (ids == null || ids.isEmpty()) {
      throw new InvalidFormException("No community records selected for downloading");
    }

    DBconnection conn = null;

    try {
      conn = DBWriteManager.getInstance().getSearchConnection();
      CommunityFullSearcher searcher = new CommunityFullSearcher();
      CommunitySummary[] communities = searcher.getSelected(conn, ids, queryID);

      if (communities != null && communities.length > 0) {
        StringBuffer buffer = new StringBuffer();

        // get header from first element in results
        buffer.append(communities[0].getExportHeader());
        for (int i = 0; i < communities.length; i++) {
          buffer.append(communities[i].createExport());
        }
        exportStr = buffer.toString();
      }

    } finally {
      DBWriteManager.return_connection(conn);
    }

    return exportStr;
  }

  /**
   * Retrieves a CompoundVector containing order numbers and stocks in them that
   * have been requested for export. When a stock is downloaded for the first
   * time, its status will automatically be upgraded to "in progress". Each
   * order is then stored to ensure that item and order status are saved (order
   * status may change with item status changes). Orders can be downloaded in
   * either "order" or "item" format; export text for both formats is retrieved
   * by calling createABRCExport() on either order, or stock.
   * 
   * @param request HttpServletRequest passed from CommunityServlet
   * @return the download text
   * @returns <code>String</code> containing all export information
   * @throws SQLException thrown if database error occurs while retrieving data
   *           for export
   * @throws InvalidParameterException thrown if invalid order or stock ID
   *           submitted
   * @throws InvalidFormException thrown if no ids submitted with request
   */
  private String downloadOrders(HttpServletRequest request)
      throws InvalidFormException, InvalidParameterException, SQLException {

    StringBuffer export = null;
    DBconnection conn = null;

    try {
      CompoundVector orderStock =
        (CompoundVector)request.getAttribute("orderStock");

      if (orderStock == null || orderStock.isEmpty()) {
        throw new InvalidFormException("No items selected for download");
      }

      boolean itemExport =
        (request.getParameter("item") != null && request.getParameter("item").equals("true"));

      java.util.Date dateModified =
        (java.util.Date)request.getAttribute("dateModified");

      dateModified = dateModified != null ? dateModified : new java.util.Date();

      export = new StringBuffer();
      // Get a write connection, this processes and stores a lot of stuff.
      conn = DBWriteManager.getInstance().get_connection();

      Long orderID = null;
      Object[] stockNumbers = null;
      String[] stockNumStr = null;
      CompositeOrder order = null;

      for (int i = 0; i < orderStock.size(); i++) {
        orderID = (Long)orderStock.getKeyAt(i);
        // get all stock numbers for this order ID
        stockNumbers = orderStock.getValuesFor(orderID);

        if (stockNumbers != null && stockNumbers.length > 0) {
          if (itemExport) {
            order = new CompositeOrder(conn, orderID, "download_items");
          } else {
            order = new CompositeOrder(conn, orderID);
          }
          // stock numbers returned as Object[]
          stockNumStr = TextConverter.toStringArray(stockNumbers);

          Stock stock = null;
          for (int j = 0; j < stockNumStr.length; j++) {
            stock = order.getStock(stockNumStr[j]);
            if (stock == null) {
              throw new InvalidParameterException("Invalid " + "stock "
                                                  + "number");
            } else {
              String status = stock.get_status();
              if (status == null || status.equals(DataConstants.getNewStock())) {

                stock.set_status(DataConstants.getInProgressStock());

                stock.set_order_date_last_modified(dateModified);
              }
            }
          }

          // store all stock status changes - order status will update
          // automatically
          order.store(conn);

          // create export string for selected stocks - use itemExport
          // to determine whether we're creating an item or order
          // format export
          export.append(order.createABRCExport(stockNumStr, itemExport));

          // make sure to increment i to last occurrence of order id
          i = orderStock.lastKeyIndex(orderID);
        }
      }

    } finally {
      DBWriteManager.return_connection(conn);
    }

    return export.toString();
  }

}
