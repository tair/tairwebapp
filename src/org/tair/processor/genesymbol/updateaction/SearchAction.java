// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.genesymbol.updateaction;

import java.math.BigInteger;
import java.sql.*;
import java.util.*;
import javax.servlet.http.*;

import org.tair.bs.community.BsCommunity;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.CommunityDelegate;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.community.*;
import org.tair.db.community.CommunityFactory;
import org.tair.handler.*;
import org.tair.querytools.*;
import org.tair.tfc.*;
import org.tair.utilities.*;
import org.tair.processor.genesymbol.*;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;

/** this class execute the search actions on gene class symbol registration
 *  when user input symbol for submit , it will check if this symbol exists in 
 *  GeneClassSymbol table or Locus table /Gene table/GeneAlias table  
 *  when the user want to associate the symbol to locus, it checks if the locus 
 *  name exists in locus table
 */
public class SearchAction extends UpdateAction {
    public SearchAction() {
	super("search");
    }


    /**
     * execute the seach function, it calles the GeneSymbolSeacher for the actual search 
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

	String search_type = request.getParameter("search_type");
        boolean beenWarned = false;
        
        if(  ! TextConverter.isEmpty(request.getParameter ("been_warned"))){
            beenWarned = true;
        }

	String search_term = null ;
	Boolean is_mutant = new Boolean(false) ; 
        String mutant = null;

	CompositeGeneClassSymbol  symbol = 
	    getCompositeGeneSymbolFromSession ( request );

	RequestHandlerResponse response = new RequestHandlerResponse();

        if ( search_type.equals("symbol")){
           
            // create required field, max chars of 6
	    field = new SymbolNameWebFormField( "gene_symbol", true, 6 );
            try {
                search_term = (String) (field.validate( request )); 
            } catch ( InvalidParameterException ipe ) {  
                String errMessage = 
		"The Gene Class Symbol should be 3 letters if possible (2-6 allowed) and "+
                "should not include numbers. "+
		 "Please go back and correct the gene class symbol.";
      
	       errors.put( "gene_symbol", errMessage );
            }

            // the mutant field has to  be checked
            field = new WebFormField("has_mutant", true );
            try {
                mutant = (String) (field.validate( request )); 
            } catch ( InvalidParameterException ipe ) { 
	        String errMessage = 
		"The Gene Class Symbol should describe either a mutant phenotype "+
                "or gene product. " +
		"Please go back and check the appropriate type button for"+
                " your gene class symbol. ";
      
	       errors.put( "has_mutant", errMessage );
            } 
          
            if ( errors != null && !errors.isEmpty() ) {
		throw new InvalidFormException( errors );
            } 

            if (search_term.toUpperCase().startsWith("AT") && !beenWarned ){
		return addWarningMessage ( request, search_term);
            }
            if ( mutant.equals("y") ){
	        is_mutant = new Boolean(true);
            }
	} else if (  search_type.equals("locus") ){
	    search_term = request.getParameter("locus_name");
	}
        
        try {
          connectionPool = DBReadManager.getInstance();
          conn = connectionPool.get_connection();
             
	    GeneSymbolSearcher searcher = new GeneSymbolSearcher(search_type, search_term);
	    HashMap results = searcher.search( conn ); 
           
	    if ( search_type.equals("symbol") &&  results==null ){
		symbol.set_symbol(search_term);
		symbol.set_has_mutant_phenotype(is_mutant);
		symbol.set_submitter_id ( SessionHandler.getCommunityID( request ));
                if ( symbol.get_submitter_id() !=null ){
		    symbol.set_submitter_info ( symbol.getPersonNameFromId ( conn, symbol.get_submitter_id()) );
                }
        CommunityDelegate delegate = CommunityDelegateFactory.getCommunityDelegate();
        IPrimaryKey key = CommunityFactory.getCommunityPrimaryKey(SessionHandler.getCommunityID( request ));
        BsCommunity submitter = delegate.getObject((SequencePrimaryKey)key);
        // Get the submitter's organization by affiliation (first one found).
        BsOrganization submitterOrg = null;
        for (BsOrganization org : submitter.getOrganization()) {
          submitterOrg = org;
          break; // take the first one found, usually only one
        }
                symbol.setAssociatedOrg (submitterOrg);
                response.setAttribute("symbol", symbol);
            }
            response.setAttribute( "search_term", search_term);
	    response.setAttribute( "searchResult", results );
            response.setAttribute( "symbol_name", symbol.get_symbol() );
	    response.setPage( searcher.getNextPage() );
       
        } finally {
          if ( conn != null ) {
          DatabaseManager.return_connection( conn );
          }
      }
	return response ; 
    }

    /**
     * Add warning message to the symbol input form
     * @param request HttpServletRequest forwarded from GeneSymbolHandler Servlet
     * @param symbol the gene class symbol user entered
     */
    private RequestHandlerResponse addWarningMessage( HttpServletRequest request, String symbol ){
        RequestHandlerResponse response = new RequestHandlerResponse();
        response.setPage("/jsp/processor/genesymbol/input_symbol.jsp");
        response.setAttribute( "gene_symbol", symbol ); 
        response.setAttribute( "warnning", "name" );  
        return response ;
    }
}
