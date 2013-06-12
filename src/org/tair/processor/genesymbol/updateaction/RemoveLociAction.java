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

public class RemoveLociAction extends UpdateAction {
    public RemoveLociAction() {
	super("remove_loci");
    }

     /** remove the locus association from  symbol
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

        CompoundVector loci_vector =  null;
      
        field = new  CompoundWebFormField("remove_locus", true ,"remove_locus",false);
        try {
            loci_vector =  (CompoundVector)field.validate( request ); 
        }catch  ( InvalidParameterException ipe ) { 
	    String errMessage = 
		"You must check a locus by clicking it's corresponding check box for remove. " +
		"Please go back and modify.";
      
	    errors.put( "remove_locus", errMessage );
        }

        // not sure why the  CompoundWebFormField didn't catch if user didn't check anyhthing for remove
        if ( loci_vector== null ||  loci_vector.size()< 1 ){
            errors.put( "remove_locus", "You must check a locus by clicking it's corresponding check box for remove. " +
	        	"Please go back and modify." );
        }

        if ( errors != null && !errors.isEmpty() ) {
	    throw new InvalidFormException( errors );
	}
        try {
	    connectionPool = DBReadManager.getInstance();
	    conn = connectionPool.get_connection();
	    for (int i= 0; i< loci_vector.size(); i++){
                GeneSymbolLocus locus = null;
                if (compSymbol.get_gene_class_symbol_id() != null){
                   locus = new GeneSymbolLocus ( conn, compSymbol.get_gene_class_symbol_id(),
                                 new Long ((String)loci_vector.getValueAt( i )  ) );
                }else {
		    locus = new GeneSymbolLocus ( conn, new Long ((String)loci_vector.getValueAt( i )  ) );
                }
              
                compSymbol.removeLocus (locus) ;
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
