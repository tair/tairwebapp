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

public class AssociateLociAction  extends UpdateAction {
    public AssociateLociAction () {
	super("associate_loci");
    }


    /** associate locus to this symbol, and also associate alias to the locus' representative gene model
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

        GeneSymbolLocusCollection loci = compSymbol.getLoci();
        GeneSymbolLocus locus = null;
       
	CompoundVector loci_vector = (CompoundVector) 
	    ( new CompoundWebFormField("associate_locus", false, "add_locus",false)).validate(request);
        
        try {
	    connectionPool = DBReadManager.getInstance();
	    conn = connectionPool.get_connection();
	    for (int i= 0; i< loci_vector.size(); i++){
                Long locus_id  = new Long ((String)loci_vector.getValueAt( i ) );  
                Long aliasDigit = getAliasDigit (errors , locus_id , request);
                locus = new GeneSymbolLocus ( conn, locus_id );
                
                if (aliasDigit != null ){ 
		    String alias_name = compSymbol.get_symbol() + aliasDigit ;
                    TfcGeneAlias alias = new TfcGeneAlias ();
                    alias.set_alias(alias_name);
                    locus.set_alias (alias);
                } 
                compSymbol.addLocus (locus) ;
	    }
            // from user edit 
            if (compSymbol.get_gene_class_symbol_id () != null ){
                compSymbol.set_gene_class_symbol_id( compSymbol.get_gene_class_symbol_id () ) ;
            } 
	} finally {
	    if ( conn != null ) {
		connectionPool.return_connection( conn );
	    }
	}

	RequestHandlerResponse response = new RequestHandlerResponse();
        response.setAttribute("symbol", compSymbol);
	response.setPage( "/jsp/processor/genesymbol/add_loci_publication.jsp" ); 
   
	return response ;    
    }

    // get  the alias digit for adding alias when user associate loci to symbol

    private Long getAliasDigit( HashMap errors, Long locus_id,  HttpServletRequest request )
        	throws  InvalidFormException {
        String  alias_form_name = "add_alias_" + locus_id ;
        Long aliasDigit = null ;
        field = new LongWebFormField ( alias_form_name, false );   
        try {
	    aliasDigit =(Long) field.validate ( request );
        }catch ( InvalidParameterException ipe ) {  
	    String errMessage = 
		"The alias you want to associate should be all digits. "+
		"Please go back and correct.";
      
	    errors.put( alias_form_name ,  errMessage );
	}
	if ( errors != null && !errors.isEmpty() ) {
	    throw new InvalidFormException( errors );
	} 
        return aliasDigit ; 
    }
}
