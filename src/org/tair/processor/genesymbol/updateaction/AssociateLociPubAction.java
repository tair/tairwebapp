// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.genesymbol.updateaction;

import java.sql.*;
import java.util.*;
import javax.servlet.http.*;

import org.tair.community.*;
import org.tair.handler.*;
import org.tair.querytools.*;
import org.tair.tfc.*;
import org.tair.utilities.*;

import org.tair.processor.genesymbol.*;
/**
 * forward user to associate loci and publication page 
 */

public class AssociateLociPubAction extends UpdateAction {

    public AssociateLociPubAction () {
	super("associate_loci_pub");
    }

    /**
     * forward user to associate loci and publication page if the user request so
     * @param request HttpServletRequest forwarded from GeneSymbolHandler Servlet
     * @return RequestHandlerResponse containing URL to forward user to
     * @exception InvalidLoginException thrown if user is not logged in
     * @exception UnauthorizedRequestException thrown if non-curator user attempts to access 
     * @exception SessionOutOfTimeException thrown if session out of time
     */
    public RequestHandlerResponse execute(HttpServletRequest request)
	throws UnauthorizedRequestException,
	       InvalidLoginException, SessionOutOfTimeException {
        CompositeGeneClassSymbol symbol = 
	    getCompositeGeneSymbolFromSession ( request );
	
        RequestHandlerResponse response = new RequestHandlerResponse();
        response.setAttribute ("symbol", symbol);
	response.setPage( "/jsp/processor/genesymbol/add_loci_publication.jsp" ); 
	return response ;   
    }
}
