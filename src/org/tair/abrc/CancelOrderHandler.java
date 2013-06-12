//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
//------------------------------------------------------------------------------
package org.tair.abrc;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.tair.abrc.order.Order;
import org.tair.abrc.OrderBuilder;
import org.tair.abrc.payment.CompositeInvoice;
import org.tair.abrc.payment.creditcard.CreditCardController;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.DataConstants;
import org.tair.utilities.SessionHandler;

public class CancelOrderHandler extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		try {
			OrderBuilder.cancelOrder(req);
		} catch(Exception e) {}
		res.sendRedirect("/servlets/Community?action=login");
	}

	public static void cancelOrder( CompositeOrder order, java.util.Date dateModified ) throws InvalidActionException
	{
		order.cancel();
		order.set_date_complete(dateModified);
		// check to make sure that no payments have been made for
		// invoice line items -- shouldn't be possible to have line
		// items paid without stocks being shipped (in which case
		// an exception should have already been thrown), but check
		// to make sure
		if(order.hasInvoice()){
			CompositeInvoice invoice = order.getInvoice();
			if(invoice.hasPayments()){
				throw new InvalidActionException( "Cannot cancel order if payments have already been made" );
			} else {
				// else remove all line items and void any
				// credit card authorizations
				invoice.removeAllCharges();
				if(invoice.isCreditCard())
					try{ CreditCardController.fullVoid(invoice); }
					catch(Exception e) { e.printStackTrace(); }
				invoice.set_status( DataConstants.getCancelledInvoice() );
			}
		}
	}
}
