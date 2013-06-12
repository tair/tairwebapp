//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.13 $
// $Date: 2005/09/14 16:20:51 $
//------------------------------------------------------------------------------ 

package org.tair.abrc.catalog;
import org.tair.utilities.InvalidParameterException;
import org.tair.handler.RequestHandlerResponse;
import org.tair.handler.RequestHandler;
import javax.servlet.http.*;

/**
 * CatalogHandler is a relic that previously handled requests to create and view
 * ABRC stock catalog data. It now just forwards all requests to a jsp page.
 */

public class CatalogHandler implements RequestHandler {
	public RequestHandlerResponse process( HttpServletRequest request ) throws InvalidParameterException {
		RequestHandlerResponse response = new RequestHandlerResponse();
		response.setPage( "/jsp/abrc/catalog/contents.jsp" );
		return response;
	}
}
