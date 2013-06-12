// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.genesymbol.updateaction;

import java.math.BigInteger;
import java.sql.*;
import java.util.*;
import javax.servlet.http.*;

import org.tair.bs.community.BsPerson;
import org.tair.community.*;
import org.tair.handler.*;
import org.tair.querytools.*;
import org.tair.tfc.*;
import org.tair.utilities.*;

import org.tair.processor.genesymbol.*;
/**
 * associate gene class symbol to community person as the symbol's submitter
 */
public class AssociatePersonAction extends UpdateAction {
    public AssociatePersonAction () {
	super("associate_person");
    }
    /**
     * verify authorization permission for this action
     * For associatePerson, only curator can execute this action
     * @param request HttpServletRequest forwarded from GeneSymbolHandler Servlet   
     * @exception InvalidLoginException thrown if user is not logged in
     * @exception UnauthorizedRequestException thrown if non-curator user attempts to access  
     */ 
    public void  verify(HttpServletRequest request) 
	throws InvalidLoginException, UnauthorizedRequestException {
	checkIsSymbolCurator(request);
    }

    /**
     * execute the associate person as stmbol submitter function, can only be executed by cuartor      
     * 
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
        BsPerson person = null;
        HashMap errors = new HashMap();

        field = new WebFormField("id", true );
        BigInteger person_community_id = null;
        try {
           String community_id = (String) field.validate( request );
           person_community_id = new BigInteger(community_id);   
        } catch ( InvalidParameterException ipe ) { 
           String errMessage = 
	   "You must select a person as the symbol's submitter . " +
	       "Please go back and select the right person. ";
      
          errors.put( "id", errMessage );
        }

        if ( errors != null && !errors.isEmpty() ) {
           throw new InvalidFormException( errors );
        }

        try {
	    connectionPool = DBReadManager.getInstance();
	    conn = connectionPool.get_connection();
            if (person_community_id != null ){
		compSymbol.set_submitter_id( person_community_id ) ;
                String submitter_name = compSymbol.getPersonNameFromId ( conn,person_community_id ) ;
                compSymbol.set_submitter_name ( submitter_name);
                compSymbol.set_submitter_info (submitter_name); 
            }      
	} finally {
	    if ( conn != null ) {
	      DBReadManager.return_connection( conn );
	    }
	}

	RequestHandlerResponse response = new RequestHandlerResponse();
        
        request.setAttribute ("symbol", compSymbol );  
        String action_from_who =  getActionFromWhoFromSession ( request );       
        if (action_from_who.equals("curator") ){
            response.setPage ("/jsp/processor/genesymbol/curator_modify_symbol.jsp" );
            response.setAttribute ("from_who", "curator"); 
        }else {          
	    response.setPage( "/jsp/processor/genesymbol/symbol_registration.jsp" ); 
        }
       
	return response ;    

    }
}
