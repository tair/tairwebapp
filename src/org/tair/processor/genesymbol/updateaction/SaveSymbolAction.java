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

/**
 *Check symbol parameters and save the symbol information into Session
 */

import org.tair.processor.genesymbol.*;

public class SaveSymbolAction extends UpdateAction {
    
    private String action_from_who;
    private CompositeGeneClassSymbol  symbol ;
    public SaveSymbolAction () {
	super("save_symbol");
    }

    /**
     * Check symbol parameters and save the symbol information into Session 
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

    // this part can be invoked from the "Submit" button in symbol_registration page
    // and the "Search" button in symbol_registration page, the parameters differs in "submit".
    // the first one get submit=SUBMIT and the later one get submit=SEARCH
    // if submit=SUBMIT, we check all the required parameters and redirect to confirm_all page
    // if submit="SEARCH person", we save parameters and redirect to Search community page
    // if submit="SEARCH lab", we save parameters and redirect to Search community page
 
   public RequestHandlerResponse execute(HttpServletRequest request)
	throws SQLException, InvalidFormException,
               InvalidParameterException, UnauthorizedRequestException,
	       InvalidLoginException, SessionOutOfTimeException {
       String from_where = request.getParameter("submit") ;
       //setActionFromWhoFromSession ( request );
       action_from_who =  getActionFromWhoFromSession ( request );
       symbol =  getCompositeGeneSymbolFromSession ( request ); 
       
       if ( ! TextConverter.isEmpty ( from_where) ){
	   if (from_where.startsWith ( "search") ){
	       return  saveSymbolAndGoToSearchCommunity (request);
	   } 
       }
       return saveSymbolAndGoToConfirmationPage (request);
   }
      
   private  RequestHandlerResponse saveSymbolAndGoToConfirmationPage (HttpServletRequest request)
	throws InvalidParameterException,InvalidFormException,
               InvalidLoginException, SessionOutOfTimeException{
      
       saveSymbolInfor (  request );	
      
       // go to confirmation page
       RequestHandlerResponse response = new RequestHandlerResponse();
       response.setAttribute ("symbol", symbol);
      
       response.setAttribute ("from_who", action_from_who);       
       response.setPage( "/jsp/processor/genesymbol/confirm_all.jsp" ); 
       return response ;
   }

   /**
     * save user input for gene class symbol from registration page, and direct curator to search
     * organization page 
     * @param request HttpServletRequest forwarded from GeneSymbolHandler Servlet
     * @return RequestHandlerResponse containing URL to forward user to
     * @exception InvalidParameter exception thrown if invalid update_action, id or data received
     * @exception InvalidFormException thrown if invalid or incomplete form data is received
     * @exception InvalidLoginException thrown if user is not logged in
     * @exception SessionOutOfTimeException thrown if session out of time
     */

    public RequestHandlerResponse saveSymbolAndGoToSearchCommunity(HttpServletRequest request)
	throws InvalidParameterException,InvalidFormException,
               InvalidLoginException, SessionOutOfTimeException{
        
        saveSymbolInfor ( request );	

        RequestHandlerResponse response = new RequestHandlerResponse();
	response.setAttribute ("symbol", symbol);
        String search_what = request.getParameter ("submit");       
	response.setPage( "/servlets/Search?action=new_search&type=community&mode=gene_symbol&search_what="+search_what  );     
        return   response ;

    }
  
    // save symbol information into CompositeGeneClassSymbol class
  
    private void saveSymbolInfor  (HttpServletRequest request) 
	throws InvalidParameterException,InvalidFormException, SessionOutOfTimeException{
	HashMap errors = new HashMap();

	String symbol_full_name = checkSymbolFullName ( errors, request);

	String is_mutant = request.getParameter("has_mutant") ;
	if ( ! TextConverter.isEmpty(is_mutant) ) {
	    symbol.set_has_mutant_phenotype( 
                 is_mutant.equals("y") ? (new Boolean(true)): (new Boolean (false)) 
            );
	}
      
	String phenotype = "";	
	boolean require_phenotype =  false ;
        if ( ! action_from_who.equals ("curator") ){
            require_phenotype = true;
        }   
	if (symbol.get_has_mutant_phenotype() != null &&
	    symbol.get_has_mutant_phenotype().booleanValue() ) { 
	    phenotype = checkPhenotype (errors, request, require_phenotype );
	}

	// rethrow the invalid form exception with better error messages
	if ( errors != null && !errors.isEmpty() ) {
	    throw new InvalidFormException( errors );
	} 
           
	String gene_symbol = request.getParameter ("gene_symbol");
	   
	if ( ! TextConverter.isEmpty(gene_symbol) ) {
	    symbol.set_symbol (gene_symbol);   
	}

	if ( request.getParameter("description" ) != null ){
	    symbol.set_description(TextConverter.textToDB(request.getParameter("description" )).trim());
	}
 
	if ( request.getParameter("comments" ) != null ){
	    symbol.set_comments(TextConverter.textToDB(request.getParameter("comments" )).trim());
	}
    
	String associate_loci = request.getParameter("associated_loci_count");
	if ( ! TextConverter.isEmpty(associate_loci)){
	    symbol.set_associated_loci_count( associate_loci );
	}
	if ( phenotype != null ){ 
	    symbol.set_mutant_phenotype_class(TextConverter.textToDB( phenotype.trim() )) ;
	}
	
	symbol.set_descriptive_symbol(symbol_full_name);
	symbol.set_status("await_approval");
    }

    // symbol full name is required
    private String checkSymbolFullName(HashMap errors, HttpServletRequest request) {
        String symbol_full_name = null;
        field = new WebFormField("symbol_full_name", true ); 
        try {
            symbol_full_name = (String) field.validate( request );
        } catch ( InvalidParameterException ipe ) { 
	    String errMessage = 
		"The Gene Class Symbol Full Name can't be null . " +
		"Please go back and input a full name for your gene class symbol.";
      
	    errors.put( "symbol_full_name", errMessage );
        }
        return symbol_full_name;
    }

    // phenotype is required for mutant gene class symbol
    // exception : not required if is curator

    private String checkPhenotype(HashMap errors, HttpServletRequest request, boolean required ) {
        String phenotype = null;
	
	field = new WebFormField( "phenotype",  required ); 
	try {
	    phenotype = (String) field.validate( request );
	} catch ( InvalidParameterException ipe ) { 
	    String errMessage = 
		"A phenotype class is required for a mutant phenotype symbol. " +
		"Please go back and provide phenotype class for this gene class symbol. ";
      
	    errors.put( "phenotype", errMessage );
	}
        
        return phenotype;
    }
}
