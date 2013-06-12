/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.community;

import javax.servlet.http.*;
import org.tair.handler.*;

public class LogoutHandler implements RequestHandler {
	/**
	 * Logs user out by invalidating their <code>HttpSession</code.
	 *
	 * @param request <code>HttpServletRequest</code> passed from calling servlet
	 * @return <code>RequestHandlerResponse</code> containing URL of page to forward user to
	 */
	public RequestHandlerResponse process(HttpServletRequest request) {
		RequestHandlerResponse response = new RequestHandlerResponse();
		response.setPage(CommunityPageHolder.getLoggedOutPage());
		request.getSession().invalidate();
		return response;
	}
}
