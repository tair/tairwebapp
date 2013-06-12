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
 * associate publications to this gene class symbol
 */

public class AssociatePubsAction extends UpdateAction {
    public AssociatePubsAction () {
	super("associate_pubs");
    }

    /** associate publications to this symbol
     * @param request HttpServletRequest forwarded from GeneSymbolHandler Servlet
     * @return RequestHandlerResponse containing URL to forward user to
     * @exception InvalidLoginException thrown if user is not logged in
     * @exception SQLException thrown if a database error occurs
     * @exception InvalidParameter exception thrown if invalid update_action, id or data received
     * @exception UnauthorizedRequestException thrown if non-curator user attempts to access 
     * @exception SessionOutOfTimeException thrown if session out of time  
     * @exception InvalidFormException thrown if invalid or incomplete form data is received
     */
    
    public RequestHandlerResponse execute(HttpServletRequest request)
	throws SQLException, InvalidFormException,
               InvalidParameterException, UnauthorizedRequestException,
	       InvalidLoginException, SessionOutOfTimeException {

	CompositeGeneClassSymbol compSymbol = 
	    getCompositeGeneSymbolFromSession ( request );

        TairObjectPublicationCollection pubs  = compSymbol.getPublications();
        TairObjectPublication pub = null;
        
        String[] refIDs = request.getParameterValues( "id" );
	if ( refIDs != null && refIDs.length > 0 ){ 
	    try {
		connectionPool = DBReadManager.getInstance();
		conn = connectionPool.get_connection();
		for (int i= 0; i< refIDs.length; i++){
		    pub = new TairObjectPublication ( conn, new Long ((String)refIDs[i]) );
                    compSymbol.addPublication (pub) ;
		}
                
              // from user or curator edit 
              if (compSymbol.get_tair_object_id() != null ){
                  compSymbol.set_tair_object_id ( compSymbol.get_tair_object_id() ); 
              } 
	    } finally {
		if ( conn != null ) {
		    connectionPool.return_connection( conn );
		}
	    }
	}
	RequestHandlerResponse response = new RequestHandlerResponse();
        response.setAttribute ("symbol", compSymbol); 
	response.setPage( "/jsp/processor/genesymbol/add_loci_publication.jsp" ); 
   
	return response ;    

    }
}
