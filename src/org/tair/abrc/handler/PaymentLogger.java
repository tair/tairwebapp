// ----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// -----------------------------------------------------------------------

package org.tair.abrc.handler;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.ServletLogger;
import java.sql.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

//create table tempdb..PaymentLog (
// order_date datetime default getdate(),
// orderNumber varchar(50),
// postedBy varchar(50),
// req_params text,
// session_params text)

public class PaymentLogger
{
	public static void save(DBconnection conn, HttpServletRequest req, String postedBy)
	{
		try {
			String name;
			StringBuffer sb_req = new StringBuffer(), sb_sess = new StringBuffer();
			HttpSession session = req.getSession();
			for(Enumeration e = session.getAttributeNames() ; e.hasMoreElements() ;){
				name = (String) e.nextElement();
				sb_sess.append(name).append(":").append(String.valueOf(session.getAttribute(name))).append(",");
			}

			for(String key: (Set<String>) req.getParameterMap().keySet())
				sb_req.append(key).append(":").append(req.getParameter(key)).append(",");

			String number = String.valueOf(req.getParameter("orderNumber"));

			conn.setQuery("INSERT INTO tempdb..PaymentLog (orderNumber,req_params,session_params,postedBy) VALUES (?,?,?,?)");
			conn.setQueryVariable(1, number);
			conn.setQueryVariable(2, sb_req.toString().replaceAll(",$", "")); //trim trailing comma
			conn.setQueryVariable(3, sb_sess.toString().replaceAll(",$", "")); //trim trailing comma
			conn.setQueryVariable(4, postedBy);
			conn.executeUpdate();

		} catch(Exception e) {
			System.err.println("Failed to save payment info: " + e);
		}
	}
}
