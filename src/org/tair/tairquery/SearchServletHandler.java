/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.tairquery;

import java.sql.SQLException;
import java.io.IOException;

import java.util.Iterator;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tair.handler.HandlerFactory;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;

import org.tair.search.GeneralSearchHandler;
import org.tair.search.table.MasterTableInfo;

import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBWriteManager;

import org.tair.utilities.DatabaseServerOfflineException;
import org.tair.utilities.HTMLFactory;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.ObjectInfoCollection;
import org.tair.utilities.ServletLogger;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.UnauthorizedRequestException;
import org.tair.utilities.Timer;

import java.util.*;

/**
  * This class is used to manage searches so that duplicate search requests will be handled efficiently.
  *
  * @see SearchServlet
  */

public class SearchServletHandler {

	private static Map<Integer,SearchServletHandler> searches = new HashMap<Integer,SearchServletHandler>();
	private RequestHandlerResponse resp;
	private boolean done;

	private SearchServletHandler() {
		resp = null;
		done = false;
	}

	/*
	 * This method blocks until a RequestHandlerResponse is available. If the request is a duplicate,
	 * the current thread will sleep until the original request provides a RequestHandlerResponse. Duplicate
	 * requests are detemined by the hashRequest() method.
	 */
	public static RequestHandlerResponse getResponse(RequestHandler searcher, HttpServletRequest request) throws InvalidFormException, InvalidSessionException, InvalidParameterException, UnauthorizedRequestException, InvalidLoginException, SQLException {
		Integer id = hashRequest(request);
		SearchServletHandler handler = searches.get(id);
		try {
			if(handler == null)
				return getResponse(id, searcher, request);
			return waitForResponse(handler);
		} catch(InterruptedException e) {
			return null;
		}
	}

	private static RequestHandlerResponse waitForResponse(SearchServletHandler handler) throws InterruptedException {
		while(!handler.done)
			Thread.sleep(1000);
		return handler.resp;
	}

	private static RequestHandlerResponse getResponse(Integer id, RequestHandler searcher, HttpServletRequest request) throws InvalidFormException, InvalidSessionException, InterruptedException, InvalidParameterException, UnauthorizedRequestException, InvalidLoginException, SQLException {
		SearchServletHandler handler = new SearchServletHandler();
		searches.put(id, handler);
		try{ handler.resp = searcher.process(request); }
		finally {
			handler.done = true;
			searches.remove(id);
		}
		return handler.resp;
	}

	/*
	 * This method provides an identity for a request.
	 */
	public static Integer hashRequest(HttpServletRequest request){
		StringBuffer buff = new StringBuffer();
		buff.append(request.getSession().getId());
		for(Object param: request.getParameterMap().keySet()){
			buff.append(param);
			for(String value: request.getParameterValues(param.toString()))
				buff.append(value);
		}
		return new Integer(buff.toString().hashCode());
	}
}
