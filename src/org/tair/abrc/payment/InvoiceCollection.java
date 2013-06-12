// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.8 $
// $Date: 2006/07/26 21:27:06 $
// ------------------------------------------------------------------------------

package org.tair.abrc.payment;


import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.jboss.logging.Logger;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcInvoice;
import org.tair.tfc.TfcLineItem;


/**
 * InvoiceCollection is a custom collection that stores all invoices for a
 * particular person or community as TfcInvoice s.
 */

public class InvoiceCollection implements Serializable {
  /** Serial version UID for Serializable class */
  private static final long serialVersionUID = 1L;
  private static final Logger logger =
    Logger.getLogger(InvoiceCollection.class);
  private ArrayList<TfcInvoice> items;
  private boolean hasUnpaidInvoices;

  // id stores the id of the InvoiceCollelction we are searching for of the type
  // below
  // ie: if we are searching for all invoices by person, type would be "person"
  // and id
  // would be the person_id
  private Long id;
  private String type;

  /**
   * Creates an empty instance of InvoiceCollection
   */
  public InvoiceCollection() {
    items = new ArrayList<TfcInvoice>();
  }

  /**
   * Creates an instance of InvoiceCollection that contains all invoices for
   * either a person or community according to the submitted value of type.
   * Acceptable literal type values are:
   * 
   * <ul>
   * <li></li>
   * <li>person - submitted id must be person_id
   * <li>organization - submitted id must be organizatin_id</li>
   * </ul>
   * 
   * @param conn An active connection to the database
   * @param id person_id ot organization_id to retrieve invoices for
   * @param type If submitted value is "person" invoices will be retrieved for
   *          an person id; if value is "organization" invoices will be
   *          retrieved for a organization id
   * @throws SQLException if a database error occurs
   */
  public InvoiceCollection(DBconnection conn, Long id, String type)
      throws SQLException {

    this();

    populate(conn, id, type);
    setCollectionID(id);
    setCollectionType(type);
  }

  /**
   * Populates collection by retrieving line_item_ids associated to submitted
   * invoice or payment id and creating TfcLineItem objects for each
   * 
   * @param conn An active connection to the database
   * @param id Invoice or payment id to retrieve line items for
   * @param type If submitted value is "invoice" line items will be retrieved
   *          for an invoice id; if value is "payment" line items will be
   *          retrieved for a payment id
   * @throws SQLException if a database error occurs
   */
  private void populate(DBconnection conn, Long id, String type)
      throws SQLException {

    ArrayList<Long> ids = new ArrayList<Long>();
    StringBuffer query = new StringBuffer();
    query.append("SELECT i.invoice_id as invoice_id "
                 + " FROM Invoice i, Orders o ");

    query.append(" WHERE i.orders_id = o.orders_id ");

    if (type.equals("person")) {
      query.append(" AND o.person_id = ? ");
    } else if (type.equals("organization")) {
      query.append(" AND  o.organization_id = ? ");

      // welcome.jsp is running very slow, so we introduce only querying
      // invoices of that person that are in progress. to cut speed of
      // users with a lot of cancelled old invoices we dont care about

    } else if (type.equals("person_inprogress")) {
      query.append(" AND o.person_id = ? ");
      query.append(" AND i.status = 'in_progress' ");
    } else if (type.equals("organization_inprogress")) {
      query.append(" AND  o.organization_id = ? ");
      query.append(" AND i.status = 'in_progress' ");
    }

    conn.setQuery(query.toString());
    conn.setQueryVariable(id);

    logger.debug("Querying in-progress invoices: "
                 + query.toString()
                 + " with "
                 + (type.equalsIgnoreCase("person") ? "person" : "organization")
                 + " id " + id);

    ResultSet results = conn.getResultSet();
    while (results.next()) {
      ids.add(new Long(results.getLong("invoice_id")));
    }

    if (!ids.isEmpty()) {
      Iterator<Long> iter = ids.iterator();
      while (iter.hasNext()) {
        items.add(new TfcInvoice(conn, iter.next()));
      }
    }
    setHasUnpaidInvoices(conn);
    conn.releaseResources();
  }

  /**
   * Retrieves person_id or organiation_id for this collection of invoices. Id
   * type can be determined through the getCollectionType method which will
   * return either "person" or "organization" (or null) depending on what value
   * was submitted in the constructor.
   * 
   * <p>
   * This method may return <code>null</code> if collection was created using
   * the no params constructor to represent items for a new person or
   * organization and type has not yet been explicitly set through the
   * setCollectionType method.
   * 
   * @return Id used to populate collection or <code>null</code> if no
   *         collection id has been set for collection yet.
   */
  public Long getCollectionID() {
    return id;
  }

  /**
   * Returns string value representing the type of invoice collection this
   * instance represents. Type should be "person" or "organization" if
   * collection represents all line items for a payment or invoice. This method
   * may return <code>null</code> if collection was created using the no params
   * constructor to represent items for a new person or organization and type
   * has not yet been explicitly set through the setCollectionType method.
   * 
   * @return Type of line item collection this collection was created as or
   *         <code>null</code> if no collection type has been set for collection
   *         yet.
   */
  public String getCollectionType() {
    return type;
  }

  /**
   * Sets collection type for this collection. This method should be used to
   * define a collection that was created empty and populated with invoices for
   * a new person or organization. This data should be set when setting value of
   * collection id so that type of id is clearly defined
   * 
   * @param type Type of line item collection this collection instance
   *          represents.
   */
  public void setCollectionType(String type) {
    this.type = type;
  }

  /**
   * Sets id for object collection was populated for. This method should be used
   * to define a collection that was created empty and populated with invoices
   * for a new person or organization. Id must be an person_id or a
   * orgnaization_id; collection type should be set accordingly to clearly
   * define which is being used
   * 
   * @param id person id or organization id for all items collection; id type is
   *          determined by collection type.
   */
  public void setCollectionID(Long id) {
    this.id = id;
  }

  /**
   * Tells whether there are unpaid invoices to search for. Unapid invoices
   * means that the invoice is marked to in_progress, all Line Items for that
   * invoice have been notified, and amount due is greater than $0
   * 
   * @param conn the JDBC connection wrapper
   * 
   * @return boolean to tell whether the invoices collection has unpaid invoices
   * @throws SQLException
   * 
   */
  public void setHasUnpaidInvoices(DBconnection conn) throws SQLException {
    boolean has_invoices = false;
    if (!isEmpty()) {
      TfcInvoice item = null;
      for (Iterator<TfcInvoice> iter = iterator(); iter.hasNext();) {
        item = iter.next();
        // check whether status is in progress
        if (item.get_status().equals("in_progress")) {

          // check to see whether all line items are notified
          Long invoice_id = new Long(item.get_invoice_id());
          LineItemCollection li_coll =
            new LineItemCollection(conn, invoice_id, "invoice");

          // check #1 = see if it is all items notified.
          Float balance_due = new Float(0.00);
          boolean all_notified = true;
          if (!li_coll.isEmpty()) {
            Iterator<TfcLineItem> li_iter = null;
            li_iter = li_coll.iterator();
            while (li_iter.hasNext()) {
              TfcLineItem li = li_iter.next();

              if (li.get_type().equals("stock_charge")
                  && li.get_notified_date() == null && li.get_amount() > 0) {
                all_notified = false;
              }

              if (li.get_status().equals("unpaid")) {
                balance_due = balance_due + li.get_amount();
              }
            }
          }
          // check #2 = see if the balance is 0
          if (all_notified == true) {
            if (balance_due > 0) {
              has_invoices = true;
            }
          }
        }
      }
    }
    hasUnpaidInvoices = has_invoices;
  }

  /**
   * @return
   */
  public boolean get_hasUnpaidInvoices() {
    return hasUnpaidInvoices;
  }

  /**
   * Get an iterator over the invoices.
   * 
   * @return an iterator
   */
  public Iterator<TfcInvoice> iterator() {
    return !isEmpty() ? items.iterator() : null;
  }

  /**
   * Get the invoice at a specified index.
   * 
   * @param index the index into the array of invoices
   * @return
   */
  public TfcInvoice get(int index) {
    return (TfcInvoice)items.get(index);
  }

  /**
   * Number of invoices in the collection
   * 
   * @return number of invoices
   */
  public int size() {
    return items.size();
  }

  /**
   * Is the list of invoices empty?
   * 
   * @return true if empty, false if at least one invoice
   */
  public boolean isEmpty() {
    return items.isEmpty();
  }
}
