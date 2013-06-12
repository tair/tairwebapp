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
  * direct the user to symbol registration page (symbol_registration.jsp)
  */
public class ModifySymbolAction extends UpdateAction {
    public ModifySymbolAction () {
	super("modify_symbol");
    }

    /**
     * direct the user to symbol registration page (symbol_registration.jsp)
     * if the user wants so
     * @param request HttpServletRequest forwarded from GeneSymbolHandler Servlet
     * @return RequestHandlerResponse containing URL to forward user to
     * @exception SessionOutOfTimeException thrown if session out of time
     */

    public RequestHandlerResponse execute(HttpServletRequest request)
	throws SessionOutOfTimeException {
	CompositeGeneClassSymbol symbol = 
	    getCompositeGeneSymbolFromSession ( request );
	
        RequestHandlerResponse response = new RequestHandlerResponse();
        response.setAttribute ("symbol", symbol);
        
        String action_from_who = getActionFromWhoFromSession ( request );

        response.setPage ("/jsp/processor/genesymbol/modify_symbol.jsp" );

        response.setAttribute ("from_who", action_from_who ); 
       
	return response ;    
    }

  
}
