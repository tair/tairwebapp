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
//import org.tair.utilities.*;
import org.tair.abrc.order.Order;
import org.tair.abrc.order.Orders;
import org.tair.abrc.order.Payment;
import org.tair.abrc.order.PaymentResult;
import org.tair.abrc.order.PendingPayment;
import org.tair.abrc.order.ProcessedPayment;
import org.tair.community.LoginChecker;
import org.tair.tfc.DBconnection;

public class PendingOrderServlet extends HttpServlet
{
	final static String RESULT = "PENDING-ORDER-SERVLET-RESULT";

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		if(LoginChecker.isTairCurator(req)){
			req.setAttribute("msg", req.getSession().getAttribute(RESULT));
			req.setAttribute("orders", Orders.pendingOrders());
			req.getSession().removeAttribute(RESULT);
			req.getRequestDispatcher("/jsp/abrc/manage_pending.jsp").forward(req, res);
		} else
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		String result = null, cmd = req.getParameter("cmd");
		if("finalize".equals(cmd))
			result = doFinalize(req.getParameter("payment-info"));
		else if("attempt".equals(cmd))
			result = attemptFinalize(req.getParameter("order-number"));
		else if ("clear".equalsIgnoreCase(cmd))
			result = clearPendingOrders(req.getParameter("pending_orders_date"));
		if(result != null)
			req.getSession().setAttribute(RESULT, result);
		res.sendRedirect(req.getServletPath());
	}

	private String clearPendingOrders( String num ) throws IOException
	{
		System.out.println("getting in clearPendigOrders : " + num);
		try {
			int number = Integer.parseInt(num);
			Orders.purgeAbandonedOrders(number);
		} catch ( Exception e ){
			throw new IOException ("could not clear pending orders: " + e);
		}
		return "Pending orders purged.";
	}

	private String attemptFinalize(String onum) throws IOException
	{
		if(onum == null || !onum.matches("\\d+"))
			return "Missing or invalid order number";
		Long num = new Long(onum);
		Order order = Orders.getOrder(new Long(onum));
		if(order == null)
			return "Failed to load order";
		PendingPayment pending = order.getPendingPayment();
		if(pending == null)
			return "All payments for this order have been cancelled or no payments have been made";
		List<Payment> payments = pending.getPayments();
		if(payments.size() == 0){
			try { 
				//cancel the order
				Orders.purgeOrder( order );
			} catch (Exception e) { throw new IOException ("could not clear pending order : " + e); }
			return "No payments associated. Order is canceled";
		}
		CompositeOrder comp = Orders.processPendingPayment(order);
		if(comp == null || comp.get_orders_id() == null)
			return "This order could not be finalized";
		return "Finalized";
	}

	private String doFinalize(String input)
	{
		if(input == null || input.equals(""))
			return "No payment information was submitted";
		String[] pair;
		Map<String,String> map = new HashMap<String,String>();
		for(String line: input.split("\\n")){
			pair = line.split("=",2);
			map.put(pair[0].trim(), pair.length == 2 ? pair[1].trim() : "");
		}

		Payment pmt = new Payment(map);
		if("authorization".equals(pmt.orderPage_transactionType)){
			Long num = new Long(pmt.orderNumber);
			Order o = Orders.getOrder(num);
			if(o == null)
				return String.format("Pending Order #%d does not exist", num);
		}

		CompositeOrder comp = Orders.processPendingPayment(pmt);
		if(comp != null && comp.get_orders_id() != null)
			return "Order successfully processed";
		return "Order processing failed";
	}
}
