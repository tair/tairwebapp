// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.genesymbol.updateaction;

import java.math.BigInteger;
import java.sql.*;
import java.util.*;
import javax.servlet.http.*;

import org.tair.community.*;
import org.tair.handler.*;
import org.tair.querytools.*;
import org.tair.tfc.*;
import org.tair.utilities.*;
import org.tair.processor.genesymbol.*;

/** this class check permission and redirect user to edit gene class symbol page
 */

public class EditSymbolAction extends UpdateAction {
    public EditSymbolAction() {
	super("edit_symbol");
    }

   /**
     * check user permission and direct user to deit gene class symbol page.
     * @param request HttpServletRequest forwarded from GeneSymbolHandler Servlet
     * @return RequestHandlerResponse containing URL to forward user to
     * @exception InvalidLoginException thrown if user is not logged in
     * @exception SQLException thrown if a database error occurs
     * @exception InvalidParameter exception thrown if invalid update_action, id or data received
     * @exception UnauthorizedRequestException thrown if non-curator user attempts to access 
     * @exception SessionOutOfTimeException thrown if session out of time
     * @exception InvalidFormException thrown if invalid or incomplete form data is received
     */
    

    public  RequestHandlerResponse execute ( HttpServletRequest request )
	throws SQLException, InvalidFormException,
               InvalidParameterException, UnauthorizedRequestException,
	       InvalidLoginException, SessionOutOfTimeException {
        String tair_object_id =  null; 
        if (request.getParameter("id") != null){
            tair_object_id = request.getParameter("id");
        }
        if (tair_object_id == null){
            throw new InvalidParameterException ("tair_object_id can't be null");
        }
        CompositeGeneClassSymbol  symbol =  null;	
        try {
	    connectionPool = DBWriteManager.getInstance();
	    conn = connectionPool.get_connection();
	    symbol = new  CompositeGeneClassSymbol(conn, new Long(tair_object_id));
            symbol.set_status ("await_approval"); 
            BigInteger user_id =  SessionHandler.getCommunityID( request ) ;
            if (!canEditSymbol(symbol, user_id) ){ 
                throw new UnauthorizedRequestException( "You don't have permission to edit this gene class symbol" );
            }
	    HttpSession session = request.getSession(true);
	    session.setAttribute("compositeSymbol", symbol); 
	} finally {
	    if ( conn != null ) {
	      DBWriteManager.return_connection( conn );
	    }
	}
        
	RequestHandlerResponse response = new RequestHandlerResponse();
        response.setAttribute ("symbol", symbol);
        response.setPage("/jsp/processor/genesymbol/confirm_all.jsp" );
        return response; 
    }

    // can edit symbol
    // either the submitter of the submiiter's associaed org's contact person
    private boolean canEditSymbol (CompositeGeneClassSymbol symbol , BigInteger user_id ){
        if (symbol.get_submitter_id().equals ( user_id ) ){
            return true;
        } 
        if (symbol.getAssociatedOrgContactPerson() != null 
	    && symbol.getAssociatedOrgContactPerson(). equals ( user_id )){
	    return true;  
        } 
        return false; 
    }
}
