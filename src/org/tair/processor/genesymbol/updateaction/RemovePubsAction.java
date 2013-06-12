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

/** remove the publication association from  symbol
 */
import org.tair.processor.genesymbol.*;
public class RemovePubsAction extends UpdateAction {
    public RemovePubsAction () {
	super("remove_pubs");
    }

    /** remove the publication association from  symbol
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
        HashMap errors = new HashMap();
        CompositeGeneClassSymbol compSymbol = 
	    getCompositeGeneSymbolFromSession ( request );
        CompoundVector pubs_vector = null;
        field = new  CompoundWebFormField("remove_pubs", true ,"remove_pub_",false);
        try {
            pubs_vector =  (CompoundVector)field.validate( request ); 
        }catch  ( InvalidParameterException ipe ) { 
	    String errMessage = 
		"You must check a publication by clicking it's corresponding check box for remove. " +
		"Please go back and modify.";
      
	    errors.put( "remove_pubs", errMessage );
        }

        // not sure why the  CompoundWebFormField didn't catch if user didn't check anyhthing for remove
        if ( pubs_vector== null ||  pubs_vector.size()< 1 ){
            errors.put( "remove_pubs", "You must check a publication by clicking it's corresponding check box for remove. " +
	        	"Please go back and modify." );
        }

        if ( errors != null && !errors.isEmpty() ) {
	    throw new InvalidFormException( errors );
	}

	//        CompoundVector pubs_vector = (CompoundVector) 
	//  ( new CompoundWebFormField("remove_pubs", false, "remove_pub",false)).validate(request); 
        
        try {
	    connectionPool = DBReadManager.getInstance();
	    conn = connectionPool.get_connection();
	    for (int i= 0; i< pubs_vector.size(); i++){
	        TairObjectPublication pub = 
                    new TairObjectPublication ( conn, new Long ((String)pubs_vector.getValueAt( i )  ) );
                compSymbol.removePublication (pub) ;
	    }
             
	} finally {
	    if ( conn != null ) {
		connectionPool.return_connection( conn );
	    }
	}
             
	RequestHandlerResponse response = new RequestHandlerResponse(); 
        response.setAttribute ("symbol", compSymbol); 
	response.setPage( "/jsp/processor/genesymbol/add_loci_publication.jsp" ); 
   
	return response ;    
    }

}
