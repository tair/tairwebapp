// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// -----------------------------------------------------------------------
package org.tair.abrc;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.tair.abrc.order.Orders;

public class POPayment extends HttpServlet
{
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		String num = req.getParameter("order-number");
		if(num != null && num.matches("\\d+"))
			Orders.cancelPendingPaymentsFor(new Long(num));
		String origin = req.getParameter("origin");
		res.sendRedirect(origin == null ? "/" : origin);
	}
}
