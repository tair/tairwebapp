//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.7 $
// $Date: 2006/03/01 19:31:29 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.payment;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.tair.abrc.InvoiceEmailHandler;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcLineItem;
import org.tair.tfc.TfcOrders;
import org.tair.utilities.Debugger;
import org.tair.utilities.InvalidActionException;

/**
 * CeditCardPaymentHandler functions for making bulk credit card captures
 * against pre-authorized credit cards When a set of stocks is shipped the
 * curator may indicate that funds be captured
 * 
 */

public class CreditCardPaymentHandler {

	private TfcOrders order;

	private CompositeInvoice invoice;

	private DBWriteManager connectionPool;

	/**
	 * 
	 * @param invoice
	 *            CompositeInvoice
	 */
	public void captureBulkPayments(Long invoice_id) throws SQLException, InvalidActionException {
		DBconnection conn = null;
		InvoiceEmailHandler email = new InvoiceEmailHandler();
		Map params;
		InvoicePayer invoicePayer = new InvoicePayer();
		try {
			conn = getConnection();
			setInvoice(conn, invoice_id);
			setOrder(conn, getInvoice().get_orders_id());
			// capture payments for cc invoices only
			// by virtue of a filter used to create the composite
			// invoice the line items for the invoice will only
			// contain not already paid items
			if (getInvoice().get_payment_method().equalsIgnoreCase(
					"credit_card")
					&& getInvoice().hasLineItems()) {
				Debugger.println(Debugger.logMsg(this, "*** CAPTURE *** "));
				Debugger.println(Debugger.logMsg(this, "*** order num = ")
						+ getOrder().get_order_number());
				Debugger.println(Debugger.logMsg(this, "*** auth amount =  ")
						+ getInvoice().get_auth_amount());
				Debugger.println(Debugger.logMsg(this, "*** ref id = ")
						+ getInvoice().get_payment_ref_id());
				Debugger.println(Debugger
						.logMsg(this, "*** capture amount =  ")
						+ getInvoice().getBalanceDue());

				// call to capture method goes here *****
				// populate map
				// send the email for credit card purchase
				email.sendRequestForPayment(invoice_id);

				params = new HashMap();
				params.put("method", "online_credit_card");
				// Convert Long invoice id to Integer for compatibility with invoice payer
				params.put("invoice_id", new Integer(getInvoice().get_invoice_id().toString()));
				params.put("reference", getInvoice().get_payment_ref_id());
				params.put("id_list", getIDList());
				invoicePayer.pay(params);

			}
		} finally {
			returnConnection(conn);
		}
	}


	// gets a pooled connection to the database
	private DBconnection getConnection() throws SQLException {
		connectionPool = DBWriteManager.getInstance();
		return connectionPool.get_connection();
	}

	// releases a connection back to the database pool
	private void returnConnection(DBconnection conn) throws SQLException {
		connectionPool.return_connection(conn);
	}

	// instantiates a CompositInvoice object
	private void setInvoice(DBconnection conn, Long invoiceID)
			throws SQLException {
		invoice = new CompositeInvoice(conn, invoiceID, "shippedNotPaid");
	}

	// returns an instantiated CompositeInvoice object
	private CompositeInvoice getInvoice() {
		return invoice;
	}

	// instantiates a TfcOrders object
	private void setOrder(DBconnection conn, Long orderID) throws SQLException {
		order = new TfcOrders(conn, orderID);
	}

	// returns an instantiated TfcOrders object
	private TfcOrders getOrder() {
		return order;
	}

	// returns a semi colon delimited list of line item ids that can be paid
	private String getIDList() {
		StringBuffer list = new StringBuffer("");
		Iterator iter = getInvoice().getLineItems();
		TfcLineItem item = null;
		if (iter != null) {
			boolean first = true;
			while (iter.hasNext()) {
				if (!first) {
					list.append(";");
				}
				item = (TfcLineItem) iter.next();
				list.append(item.get_line_item_id().toString());
				first = false;
			}
		}
		return list.toString();
	}

}
