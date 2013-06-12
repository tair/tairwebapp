// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.genesymbol.updateaction;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.tair.handler.RequestHandlerResponse;
import org.tair.processor.genesymbol.CompositeGeneClassSymbol;
import org.tair.tfc.DBWriteManager;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.UnauthorizedRequestException;

/** this class check permission and lead the curator to approval page if the 
 *  gene  class symbol is waiting approval
 */

public class CuratorApproveAction extends UpdateAction {
    public CuratorApproveAction () {
	super("curator_approve");
    }


    public void verify(HttpServletRequest request) 
	throws InvalidLoginException, UnauthorizedRequestException {
	checkIsSymbolCurator(request);
    }

    /**
     * get tair_object_id from request, and direct curator to approval page if the 
     * symbol is waiting for approval. If the symbol has been reviewed, direct curaotr 
     * to the page says the symbol has been reviewed
     * @param request HttpServletRequest forwarded from GeneSymbolHandler Servlet
     * @return RequestHandlerResponse containing URL to forward user to
     * @exception InvalidLoginException thrown if user is not logged in
     * @exception SQLException thrown if a database error occurs
     * @exception InvalidParameter exception thrown if invalid update_action, id or data received
     * @exception UnauthorizedRequestException thrown if non-curator user attempts to access 
     * @exception SessionOutOfTimeException thrown if session out of time
     */

    public RequestHandlerResponse execute(HttpServletRequest request)
	throws SQLException, InvalidParameterException, UnauthorizedRequestException,
	       InvalidLoginException, SessionOutOfTimeException{

	RequestHandlerResponse response = new RequestHandlerResponse();
        String tair_object_id = null;
        
        if (request.getParameter("id") !=null){
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

            HttpSession session = request.getSession(true);
            session.setAttribute("compositeSymbol", symbol); 
            session.setAttribute("action_from","curator");
   
        } finally {
	    if ( conn != null ) {
	      DBWriteManager.return_connection( conn );
	    }
	}
        
        response.setAttribute ("symbol", symbol);
        response.setAttribute ("from_who", "curator");
	response.setPage( "/jsp/processor/genesymbol/confirm_all.jsp" );     
        return   response ;

    }
}
