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
/** direct user to confirmation page
 */ 
public class ConfirmAllAction extends UpdateAction {
    public ConfirmAllAction () {
	super("confirm_all");
    }

    /**
     * leads user to confirm page 
     * @param request HttpServletRequest forwarded from GeneSymbolHandler Servlet
     * @return RequestHandlerResponse containing URL to forward user to
     * @exception SessionOutOfTimeException thrown if session out of time
     */

    public RequestHandlerResponse execute(HttpServletRequest request)
	throws SessionOutOfTimeException {
       RequestHandlerResponse response = new RequestHandlerResponse();
       CompositeGeneClassSymbol symbol = 
	    getCompositeGeneSymbolFromSession ( request );
       response.setAttribute ("symbol", symbol); 
       String action_from_who =  getActionFromWhoFromSession ( request );
       response.setAttribute ("from_who", action_from_who); 	
       response.setPage( "/jsp/processor/genesymbol/confirm_all.jsp" );     
       return   response ;   
    }

}
