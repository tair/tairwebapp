// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// -----------------------------------------------------------------------
package org.tair.abrc;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import org.tair.db.DB;
import org.tair.tfc.DBconnection;
import org.tair.abrc.order.Orders;
import org.tair.abrc.order.PendingPayment;
import org.tair.utilities.MD5;

public class PaymentPopupPO extends HttpServlet
{
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		DBconnection conn = DB.getRead();
		try {
			CompositeOrder order = new CompositeOrder(conn, new Long(req.getParameter("orders_id")));
			Iterator iter = order.getEligibleForPaymentLineItems();
			boolean elig = iter != null && iter.hasNext();
			req.setAttribute("eligible", elig);
			req.setAttribute("order", order);
			if(elig){
				Orders.cancelPendingPaymentsFor(order.get_order_number());
				PendingPayment pmt = new PendingPayment();
				String digest = MD5.hexDigest(Long.toString(order.get_order_number()) + Long.toString(new java.util.Date().getTime()));
				pmt.setToken(digest);
				pmt.setStatus("PENDING");
				pmt.setOrderNumber(order.get_order_number());
				pmt.save();
				req.setAttribute("paymentToken", pmt.getToken());
			}
		} catch(Exception e) {
		} finally {
			DB.release(conn);
		}
		req.getRequestDispatcher("/jsp/abrc/payment_popup_po.jsp").forward(req, res);
	}
}
