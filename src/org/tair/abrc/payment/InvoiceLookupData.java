//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
//$Revision: 1.7 $
//$Date: 2006/08/03 23:30:46 $
//------------------------------------------------------------------------------
package org.tair.abrc.payment;


import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.bs.community.PersonDelegate;
import org.tair.db.community.CommunityFactory;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcInvoice;
import org.tair.tfc.TfcLineItem;
import org.tair.tfc.TfcOrders;
import org.tair.tfc.TfcStock;
import org.tair.utilities.LookupDataModel;
import org.tair.utilities.SearchType;
import org.tair.utilities.TextConverter;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * The purpose of this class is to provide a "get as needed" function for
 * display of row data on summary pages for a type specific search - in this
 * case annotation search. It retrieves the required data for a page's worth of
 * rows using ids for lookup of the data. The ids are stored in the internal
 * table which is populated by ResultsFetcher which retrieved the page's worth
 * of data from the search's temp table. The lookup data is retrieved ( often
 * multiple rows per id ) and stored as an array in the table's cell that
 * corresponds to that lookup data.
 * 
 * InvoiceLookupData is used by <code>ResultsFetcher</code> as a
 * <code>LookupDataModel</code> object. InvoiceLookupData implements the methods
 * defined by <code>LookupDataModel</code> in a search type specific manner.
 * InvoiceLookupData uses <code>SearchType</code> to identify columns for lookup
 * for this particular search type.
 **/

public class InvoiceLookupData implements LookupDataModel {

  private String[] lookupColumnNames;
  private String searchType = "invoice";
  private String[][] resultsTable;
  private String[][] lineItems;
  private String[] lookupData;
  private String[] lab;// only one entry per row
  private String[] balanceDue;// only one entry per row
  private String[] eligibleAmount;// only one entry per row
  private String[] invoiceType;// only one entry per row
  private String[] lastShippedDate;// only one entry per row
  private String[] lastNotifiedDate;// only one entry per row
  private String[] invoiceDate;// only one entry per row
  private String[] status;// only one entry per row
  private String[] personName; // only one entry per row
  private String[] authAmount;
  private String[] paymentRefId;
  private String[] verificationCode;
  private String[] dateLastModified;
  private DBReadManager connectionPool;

  public InvoiceLookupData() {
    setLookupColumnNames(SearchType.getLookupColumns(this.getType()));
  }

  // gets a pooled connection to the database
  private DBconnection getConnection() throws SQLException {
    connectionPool = DBReadManager.getInstance();
    return connectionPool.get_connection();
  }

  // releases a connection back to the database pool
  private void returnConnection(DBconnection conn) throws SQLException {
    DBReadManager.return_connection(conn);
  }

  // sets the list of the lookup columns that contain ids for lookup
  private void setLookupColumnNames(String[] lookupColumns) {
    lookupColumnNames = lookupColumns;
  }

  // returns a list of the lookup columns that contain ids for lookup
  private String[] getLookupColumnNames() {
    return lookupColumnNames;
  }

  // returns the correspnding index for a temp table column name --
  // to be used to access the lookup ID
  // from the 'in memory' results table
  private int getIndex(String columnName) {
    int columnIndex = 0;
    for (int i = 0; i < SearchType.getTempTableColumns(getType()).length; i++) {
      if (SearchType.getTempTableColumns(getType())[i].equals(columnName))
        columnIndex = i;
    }
    return columnIndex;
  }

  // returns length of results table
  private int getResultsLength() {
    return resultsTable.length;
  }

  // returns this search type
  private String getType() {
    return searchType;
  }

  /**
   * provides to the object a subset (a page worth for display on the summary
   * page) of the temp table results as a two dimensional string array. The
   * columns are the temp table columns and the rows are the result set rows -
   * the rows for a particular pages display. Lookup keys can be accessed via
   * the arrays contents for columns that have been identified as lookup
   * columns.
   * 
   * @param summaryTable The table of one page of data from a summary page
   **/
  public void setSummaryData(String[][] summaryTable) throws SQLException {
    resultsTable = summaryTable;
    // resultsLength = summaryTable.length;
    // set the data items that are for display to the summary page
    DBconnection conn = null;
    try {
      conn = getConnection();
      setLab(conn);
      setBalanceDue(conn);
      setEligibleForPayment(conn);
      setLastNotifiedDate(conn);
      setLastShippedDate(conn);
      setInvoiceDate(conn);
      setPersonNames(conn);
    } finally {
      if (conn != null)
        returnConnection(conn);
    }
    setStatus();
    setInvoiceType();
  }

  /**
   * provides to the object a subset (user-selected rows of data from the
   * summary page) of the temp table results as a two dimensional string array.
   * The columns are the temp table columns and the rows are the user-selected
   * rows from the summary page. Lookup keys can be accessed via the arrays
   * contents for columns that have been identified as lookup columns.
   * 
   * @param downloadTable The table of user-selected rows from summary pages
   **/
  // currently no download page has been requested for this search --
  // default is the same as summary page
  public void setDownloadData(String[][] downloadTable) throws SQLException {
    resultsTable = downloadTable;
    // resultsLength = downloadTable.length;
    // set the data items that are needed for download page
    DBconnection conn = null;
    try {
      conn = getConnection();
      setLab(conn);
      setBalanceDue(conn);
      setEligibleForPayment(conn);
      setLastNotifiedDate(conn);
      setLastShippedDate(conn);
      setInvoiceDate(conn);
      setLineItems(conn);
      setAuthAmount(conn);
      setPaymentRefId(conn);
      setVerificationCode(conn);
      setDateLastModified(conn);
    } finally {
      if (conn != null)
        returnConnection(conn);
    }
    setStatus();
    setInvoiceType();
  }

  // populate person's name from organization_id
  private void setPersonNames(DBconnection conn) throws SQLException {
    personName = new String[getResultsLength()];
    for (int i = 0; i < getResultsLength(); i++) {
      // check to see if this is a valid row for getting data for
      if (!TextConverter.isEmpty(resultsTable[i][getIndex("orders_id")])) {
        Long orders_id = new Long(resultsTable[i][getIndex("orders_id")]);
        TfcOrders thisOrder = new TfcOrders(conn, orders_id);
        PersonDelegate delegate =
          CommunityDelegateFactory.getPersonDelegate();
        IPrimaryKey key =
          CommunityFactory.getPersonPrimaryKey(thisOrder.get_person_id());
        BsPerson thisPerson = delegate.getObject((SequencePrimaryKey)key);
        personName[i] =
          thisPerson.getFirstName() + " " + thisPerson.getLastName();

      }
    } // looping through rows in result set
  }

  // populate authorized amount from invoice_id
  private void setAuthAmount(DBconnection conn) throws SQLException {
    authAmount = new String[getResultsLength()];
    for (int i = 0; i < getResultsLength(); i++) {
      if (!TextConverter.isEmpty(resultsTable[i][getIndex("invoice_id")])) {
        Long invoice_id = new Long(resultsTable[i][getIndex("invoice_id")]);
        TfcInvoice thisInvoice = new TfcInvoice(conn, invoice_id);
        if (thisInvoice.get_auth_amount() != null) {
          authAmount[i] = thisInvoice.get_auth_amount().toString();
        } else {
          authAmount[i] = "";
        }
      }
    }
  }

  // populate payment_ref_id from invoice_id
  private void setPaymentRefId(DBconnection conn) throws SQLException {
    paymentRefId = new String[getResultsLength()];
    for (int i = 0; i < getResultsLength(); i++) {
      if (!TextConverter.isEmpty(resultsTable[i][getIndex("invoice_id")])) {
        Long invoice_id = new Long(resultsTable[i][getIndex("invoice_id")]);
        TfcInvoice thisInvoice = new TfcInvoice(conn, invoice_id);
        if (thisInvoice.get_payment_ref_id() != null) {
          paymentRefId[i] = thisInvoice.get_payment_ref_id();
        } else {
          paymentRefId[i] = "";
        }
      }
    }
  }

  // populate verification code from invoice_id
  private void setVerificationCode(DBconnection conn) throws SQLException {
    verificationCode = new String[getResultsLength()];
    for (int i = 0; i < getResultsLength(); i++) {
      if (!TextConverter.isEmpty(resultsTable[i][getIndex("invoice_id")])) {
        Long invoice_id = new Long(resultsTable[i][getIndex("invoice_id")]);
        TfcInvoice thisInvoice = new TfcInvoice(conn, invoice_id);
        if (thisInvoice.get_verification_code() != null) {
          verificationCode[i] = thisInvoice.get_verification_code();
        } else {
          verificationCode[i] = "";
        }
      }
    }
  }

  // populate verification code from invoice_id
  private void setDateLastModified(DBconnection conn) throws SQLException {
    dateLastModified = new String[getResultsLength()];
    for (int i = 0; i < getResultsLength(); i++) {
      if (!TextConverter.isEmpty(resultsTable[i][getIndex("invoice_id")])) {
        Long invoice_id = new Long(resultsTable[i][getIndex("invoice_id")]);
        TfcInvoice thisInvoice = new TfcInvoice(conn, invoice_id);
        if (thisInvoice.get_date_last_modified() != null) {
          dateLastModified[i] =
            formatDBStringToDate(thisInvoice.get_date_last_modified().toString());
        } else {
          dateLastModified[i] = "";
        }
      }
    }
  }

  // populate lab from organization_id
  private void setLab(DBconnection conn) throws SQLException {
    lab = new String[getResultsLength()];
    for (int i = 0; i < getResultsLength(); i++) {
      // Look up organization if there is a result in the results table at this
      // index.
      if (!TextConverter.isEmpty(resultsTable[i][getIndex("organization_id")])) {
        // Get the organization from the database.
        OrganizationDelegate delegate =
          CommunityDelegateFactory.getOrganizationDelegate();
        BigInteger id =
          new BigInteger(resultsTable[i][getIndex("organization_id")]);
        IPrimaryKey key = CommunityFactory.getOrganizationPrimaryKey(id);
        BsOrganization organization =
          delegate.getObject((SequencePrimaryKey)key);
        // Extract the name.
        lab[i] = organization.getName();
      }
    } // looping through rows in result set
  }

  private String getLab(int row) {
    return lab[row];
  }

  private String getPersonName(int row) {
    return personName[row];
  }

  private String getAuthAmount(int row) {
    return authAmount[row];
  }

  private String getPaymentRefId(int row) {
    return paymentRefId[row];
  }

  private String getVerificationCode(int row) {
    return verificationCode[row];
  }

  private String getDateLastModified(int row) {
    return dateLastModified[row];
  }

  // populate last shipped date from Orders_Stock
  private void setLastShippedDate(DBconnection conn) throws SQLException {
    lastShippedDate = new String[getResultsLength()];
    ResultSet results = null;
    String query =
      "SELECT CAST( max(date_last_modified) as varchar(10) ) "
          + " AS last_shipped " + " FROM Orders_Stock "
          + " WHERE status = 'shipped' AND orders_id = ? ";
    conn.setQuery(query);
    for (int i = 0; i < getResultsLength(); i++) {
      if (!TextConverter.isEmpty(resultsTable[i][getIndex("orders_id")])) {
        conn.setQueryVariable(1,
                              new Long(resultsTable[i][getIndex("orders_id")]));
        results = conn.getResultSet();
        while (results.next()) {
          if (results.getString("last_shipped") != null) {
            lastShippedDate[i] = results.getString("last_shipped");
          } else {
            lastShippedDate[i] = "";
          }
        }
      }
    }
  }

  private String getLastShippedDate(int row) {
    return lastShippedDate[row];
  }

  // calulate balance due from LineItems for each invoice in result set
  private void setBalanceDue(DBconnection conn) throws SQLException {
    balanceDue = new String[getResultsLength()];
    ResultSet results = null;
    String query =
      "SELECT amount FROM LineItem WHERE status = 'unpaid'"
          + " AND invoice_id = ? ";
    BigDecimal balance = null;
    float lineItemsUnpaid = 0;
    conn.setQuery(query);
    for (int i = 0; i < getResultsLength(); i++) {
      if (!TextConverter.isEmpty(resultsTable[i][getIndex("invoice_id")])) {
        if (!resultsTable[i][getIndex("invoice_total")].equalsIgnoreCase("0")) {
          lineItemsUnpaid = 0;
          conn.setQueryVariable(new Long(resultsTable[i][getIndex("invoice_id")]));
          results = conn.getResultSet();
          while (results.next()) {
            lineItemsUnpaid += results.getFloat("amount");
          } // if next
          balance = new BigDecimal(lineItemsUnpaid);
          balanceDue[i] = balance.setScale(2, RoundingMode.HALF_UP).toString();
        } else {
          balanceDue[i] = "0";
        }
      }
    }
  }

  private String getBalanceDue(int row) {
    return balanceDue[row];
  }

  // calulate eligible for payment from LineItems
  // for each invoice in result set
  private void setEligibleForPayment(DBconnection conn) throws SQLException {
    eligibleAmount = new String[getResultsLength()];
    // shippedNotPaid
    LineItemCollection eligibleItems = null;
    TfcLineItem item = null;
    float amount = 0;
    BigDecimal eligibleAmt = null;
    Iterator itemIter = null;

    for (int i = 0; i < getResultsLength(); i++) {
      if ((resultsTable[i][getIndex("invoice_id")]) != null) {
        amount = 0;
        eligibleItems =
          new LineItemCollection(conn,
                                 new Long(resultsTable[i][getIndex("invoice_id")]),
                                 "shippedNotPaid");
        // iterate through one by one adding to total amount
        itemIter = eligibleItems.iterator();
        if (itemIter != null) {
          while (itemIter.hasNext()) {
            item = (TfcLineItem)itemIter.next();
            amount += item.get_amount().floatValue();
          }
        }
        eligibleAmt = new BigDecimal(amount);
        eligibleAmount[i] = 
          eligibleAmt.setScale(2, RoundingMode.HALF_UP).toString();
      } else {
        eligibleAmount[i] = "0";
      }
    }
  }

  private String getEligibleForPayment(int row) {
    return eligibleAmount[row];
  }

  // set invoice date
  private void setInvoiceDate(DBconnection conn) throws SQLException {
    invoiceDate = new String[getResultsLength()];
    for (int i = 0; i < getResultsLength(); i++) {
      if (!TextConverter.isEmpty(resultsTable[i][getIndex("invoice_id")])) {
        Long invoice_id = new Long(resultsTable[i][getIndex("invoice_id")]);
        TfcInvoice thisInvoice = new TfcInvoice(conn, invoice_id);

        if (thisInvoice.get_invoice_date() != null) {
          invoiceDate[i] =
            formatDBStringToDate(thisInvoice.get_invoice_date().toString());
        } else {
          invoiceDate[i] = "";
        }
      } else {
        invoiceDate[i] = "";
      }
    }
  }

  private String getInvoiceDate(int row) {
    return invoiceDate[row];
  }

  // set last notified date from LineItem
  private void setLastNotifiedDate(DBconnection conn) throws SQLException {
    lastNotifiedDate = new String[getResultsLength()];
    ResultSet results = null;
    String query =
      "SELECT CAST( max( notification_date ) AS varchar(10) ) "
          + " AS last_notified " + " FROM LineItem "
          + " WHERE invoice_id = ? and orders_id = ? ";
    conn.setQuery(query);
    for (int i = 0; i < getResultsLength(); i++) {
      if (!TextConverter.isEmpty(resultsTable[i][getIndex("invoice_id")])
          && !TextConverter.isEmpty(resultsTable[i][getIndex("orders_id")])) {
        conn.setQueryVariable(new Long(resultsTable[i][getIndex("invoice_id")]));
        conn.setQueryVariable(1,
                              new Long(resultsTable[i][getIndex("invoice_id")]));
        conn.setQueryVariable(2,
                              new Long(resultsTable[i][getIndex("orders_id")]));
        results = conn.getResultSet();
        while (results.next()) {
          if (results.getString("last_notified") != null) {
            lastNotifiedDate[i] = results.getString("last_notified");
          } else {
            lastNotifiedDate[i] = "";
          }
        } // if next
      }
    }
  }

  private String getLastNotifiedDate(int row) {
    return lastNotifiedDate[row];
  }

  // format status for display purposes
  // if code here changes, we need to also change getDBstatus (which does a
  // reverse lookup)
  private void setStatus() {
    status = new String[getResultsLength()];
    for (int i = 0; i < getResultsLength(); i++) {
      if (!TextConverter.isEmpty(resultsTable[i][getIndex("invoice_status")])) {
        if (resultsTable[i][getIndex("invoice_status")].equalsIgnoreCase("in_progress")) {
          status[i] = "in progress";
        } else if (resultsTable[i][getIndex("invoice_status")].equalsIgnoreCase("paid_in_full")) {
          status[i] = "paid in full";
        } else if (resultsTable[i][getIndex("invoice_status")].equalsIgnoreCase("new")) {
          status[i] = "new";
        } else if (resultsTable[i][getIndex("invoice_status")].equalsIgnoreCase("cancelled")) {
          status[i] = "cancelled";
        }
      }
    }
  }

  private String getStatus(int row) {
    return status[row];
  }

  private String getDBStatus(int row) {
    if (status[row].equals("in progress")) {
      return "in_progress";
    } else if (status[row].equals("paid in full")) {
      return "paid_in_full";
    } else {
      return status[row];
    }
  }

  // format payment method for display purposes
  // if this function changes, you will also need to change
  // getDBInvoiceType which does a reverse lookup
  private void setInvoiceType() {
    invoiceType = new String[getResultsLength()];
    for (int i = 0; i < getResultsLength(); i++) {
      if (!TextConverter.isEmpty(resultsTable[i][getIndex("invoice_type")])) {
        if (resultsTable[i][getIndex("invoice_type")].equalsIgnoreCase("credit_card")) {
          invoiceType[i] = "cc";
        } else {
          invoiceType[i] = "po";
        }
      }
    }
  }

  private String getDBInvoiceType(int row) {
    if (invoiceType[row].equals("cc")) {
      return "credit_card";
    } else {
      return "purchase_order";
    }
  }

  private String getInvoiceType(int row) {
    return invoiceType[row];
  }

  /**
   * @param columnName The column name of the temp table to be checked
   * @return boolean representation of check for lookup column
   */
  public boolean isLookupColumn(String columnName) {
    boolean isLookup = false;
    for (int i = 0; i < getLookupColumnNames().length; i++) {
      if (columnName.equals(getLookupColumnNames()[i]))
        isLookup = true;
    }
    return isLookup;
  }

  // populates a line item collection that contain the line items,

  private void setLineItems(DBconnection conn) throws SQLException {
    lineItems = new String[getResultsLength()][];
    LineItemCollection lineItemInfo = null;
    TfcLineItem item = null;
    Iterator itemIter = null;
    String stockNumber = null;

    // this cycles through all of the line items
    // based on invoice id, retrieves them and writes them to a collection of
    // line items
    for (int i = 0; i < getResultsLength(); i++) {
      if ((resultsTable[i][getIndex("invoice_id")]) != null) {
        String orderNumber = resultsTable[i][getIndex("order_number")];

        lineItemInfo =
          new LineItemCollection(conn,
                                 new Long(resultsTable[i][getIndex("invoice_id")]),
                                 "invoice");
        lineItems[i] = new String[lineItemInfo.size()];
        itemIter = lineItemInfo.iterator();
        int j = 0;
        if (itemIter != null) {
          while (itemIter.hasNext()) {
            StringBuffer lineItemBuffer = new StringBuffer();
            item = (TfcLineItem)itemIter.next();
            // iterate through one by one
            lineItemBuffer.append(item.get_invoice_id().toString() + "\t");
            // get the Stock Number (name) for the stock id
            if (item.get_stock_id() != null) {
              stockNumber =
                TfcStock.retrieveStockNumber(conn, item.get_stock_id());
              lineItemBuffer.append(stockNumber + "\t");
            } else {
              lineItemBuffer.append("" + "\t");
            }
            // get the order number for the orders id.
            // if ( item.get_orders_id() != null ) {
            // Long orderNumber = TfcInvoice.translateOrdersNumber( conn,
            // item.get_orders_id() );
            // lineItemBuffer.append( orderNumber + "\t" );
            // }
            // else {
            // lineItemBuffer.append(""+"\t");
            // }
            lineItemBuffer.append(orderNumber + "\t");

            lineItemBuffer.append(item.get_status().toString() + "\t");
            lineItemBuffer.append(item.get_type().toString() + "\t");
            if (item.get_payment_id() != null) {
              lineItemBuffer.append(item.get_payment_id().toString() + "\t");
            } else {
              lineItemBuffer.append("" + "\t");
            }

            lineItemBuffer.append(item.get_amount().toString() + "\t");

            if (item.get_notified_date() != null) {
              lineItemBuffer.append(TextConverter.dateToString(item.get_notified_date())
                                    + "\t");
            } else {
              lineItemBuffer.append("" + "\t");
            }

            lineItemBuffer.append(item.get_line_item_id().toString() + "\t");

            if (item.get_stock_id() != null) {
              lineItemBuffer.append(item.get_stock_id().toString() + "\t");
            } else {
              lineItemBuffer.append("" + "\t");
            }

            if (item.get_orders_id() != null) {
              lineItemBuffer.append(item.get_orders_id().toString());
            } else {
              lineItemBuffer.append("");
            }

            lineItems[i][j] = lineItemBuffer.toString();
            j++;
          }
        }
      }
    }
  }

  private String[] getLineItems(int row) {
    return lineItems[row];
  }

  /**
   * @param row The integer representing the row of the table of data
   * @param columnName The String representing the column name of the table of
   *          data
   * @param DBformat boolean representing whether we want data exactly how it is
   *          in the database
   * @return String representation of the compound data for the requested cell
   *         as a comma-delimited string
   */
  public String getDataAsString(int row, String columnName, boolean DBformat) {
    StringBuffer dataString = new StringBuffer();
    if (columnName.equals("lab")) {
      dataString.append(getLab(row));
    }
    if (columnName.equals("person_name")) {
      dataString.append(getPersonName(row));
    }
    if (columnName.equals("balance_due")) {
      dataString.append(getBalanceDue(row));
    }
    if (columnName.equals("eligible_amount")) {
      dataString.append(getEligibleForPayment(row));
    }
    if (columnName.equals("auth_amount")) {
      dataString.append(getAuthAmount(row));

    }
    if (columnName.equals("payment_ref_id")) {
      dataString.append(getPaymentRefId(row));
    }
    if (columnName.equals("verification_code")) {
      dataString.append(getVerificationCode(row));
    }
    if (columnName.equals("date_last_modified")) {
      if (DBformat) {
        dataString.append(getDateLastModified(row));
      } else {
        dataString.append(formatDBStringToDate(getDateLastModified(row)));
      }
    }
    if (columnName.equals("last_shipped_date")) {
      if (DBformat) {
        dataString.append(getLastShippedDate(row));
        // dataString.append( formatStringToDBDate(getLastShippedDate(row) ) );
      } else {
        dataString.append(getLastShippedDate(row));
      }
    }
    if (columnName.equals("last_notified_date")) {
      if (DBformat) {
        // dataString.append( formatStringToDBDate(getLastNotifiedDate(row) ) );
        dataString.append(getLastNotifiedDate(row));
      } else {
        dataString.append(getLastNotifiedDate(row));
      }
    }
    if (columnName.equals("invoice_status")) {
      if (DBformat) {
        dataString.append(getDBStatus(row));
      } else {
        dataString.append(getStatus(row));
      }
    }

    if (columnName.equals("invoice_date")) {
      dataString.append(getInvoiceDate(row));
    }

    if (columnName.equals("invoice_type")) {
      if (DBformat) {
        dataString.append(getDBInvoiceType(row));
      } else {
        dataString.append(getInvoiceType(row));
      }
    }
    if (columnName.equals("line_items")) {
      for (int i = 0; i < getLineItems(row).length; i++) {
        if (i > 0) {
          dataString.append("\n");
        }
        dataString.append(getLineItems(row)[i]);
      }
    }

    return new String(dataString);
  }

  /**
   * @param row The integer representing the row of the table of data
   * @param columnName The String representing the column name of the table of
   *          data
   * @return String array of the compound data for the requested cell, row in
   *         sub-result set
   */
  public String[] getDataAsArray(int row, String columnName) {
    if (columnName.equals("lab")) {
      lookupData = new String[1];
      lookupData[0] = getLab(row);
    }
    if (columnName.equals("balance_due")) {
      lookupData = new String[1];
      lookupData[0] = getBalanceDue(row);
    }
    if (columnName.equals("eligible_amount")) {
      lookupData = new String[1];
      lookupData[0] = getEligibleForPayment(row);
    }
    if (columnName.equals("last_shipped_date")) {
      lookupData = new String[1];
      lookupData[0] = getLastShippedDate(row);
    }
    if (columnName.equals("last_notified_date")) {
      lookupData = new String[1];
      lookupData[0] = getLastNotifiedDate(row);
    }
    if (columnName.equals("invoice_status")) {
      lookupData = new String[1];
      lookupData[0] = getStatus(row);
    }
    if (columnName.equals("invoice_date")) {
      lookupData = new String[1];
      lookupData[0] = getInvoiceDate(row);
    }

    if (columnName.equals("invoice_type")) {
      lookupData = new String[1];
      lookupData[0] = getInvoiceType(row);
    }
    if (columnName.equals("line_items")) {
      System.out.println("lookup data size = " + lookupData.length);
      lookupData = getLineItems(row);
    }

    return lookupData;
  }

  private String formatStringToDBDate(String date) {
    // convert date from MM/DD/YYYY to YYYY-MM-DD
    String[] splitDate = date.split("/");
    if (splitDate.length > 1) {
      String formattedDate =
        splitDate[2] + "-" + splitDate[0] + "-" + splitDate[1];
      return formattedDate;
    } else {
      return date;
    }
  }

  private String formatDBStringToDate(String date) {
    // convert date from YYYY-MM-DD to MM/DD/YYYY
    String[] splitDate = date.split("-");
    if (splitDate.length > 1) {
      String formattedDate =
        splitDate[1] + "/" + splitDate[2] + "/" + splitDate[0];
      return formattedDate;
    } else {
      return date;
    }
  }
}
