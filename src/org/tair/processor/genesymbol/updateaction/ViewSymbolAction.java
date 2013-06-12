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

/** this class check permission and display a gene class symbol list page, include:
 * from curator: the to be reviewed/approved symbols 
 *               all symbols  
 * from user : the gene class symbols submitted by this user
 * others: a list of all gene class symbols
 */

public class ViewSymbolAction extends UpdateAction {
    public ViewSymbolAction() {
	super("view_symbol");
    }
    /**
     * to verify permission for all_view symbol action, if it's not from user, check user is logged in or not
     * if is from curator , check if the request is from cuartor  
     * @param request HttpServletRequest forwarded from GeneSymbolHandler Servlet
     * @exception InvalidLoginException thrown if user is not logged in  
     * @exception UnauthorizedRequestException thrown if non-curator user attempts to access 
     */

    public void verify(HttpServletRequest request)
	throws InvalidLoginException, UnauthorizedRequestException {
        String from_who = request.getParameter("from");
       
        if ( !TextConverter.isEmpty (from_who ) && from_who.equals("user") ) {
	    super.verify(request);     
	}else if ( !TextConverter.isEmpty (from_who ) && from_who.equals("curator")){
            checkIsSymbolCurator( request);
        }
    }

   /**
     * display different gene class symbol list page according to user's permission 
     * @param request HttpServletRequest forwarded from GeneSymbolHandler Servlet
     * @return RequestHandlerResponse containing URL to forward user to
     * @exception InvalidLoginException thrown if user is not logged in
     * @exception SQLException thrown if a database error occurs
     * @exception InvalidParameter exception thrown if invalid update_action, id or data received
     * @exception UnauthorizedRequestException thrown if non-curator user attempts to access 
     * @exception SessionOutOfTimeException thrown if session out of time    
     */

    public RequestHandlerResponse execute(HttpServletRequest request) 	
	throws SQLException,
               InvalidParameterException, UnauthorizedRequestException,
	       InvalidLoginException, SessionOutOfTimeException {
	// if the request is not from user or curator, we redirect to symbol_list_summary page

        boolean from_curator = false ;

        String from_who = request.getParameter("from");
        if(! TextConverter.isEmpty (from_who) && from_who.equals("curator") ){
            from_curator = true ;
        } 
       
        String status = request.getParameter("status");

        if  ( TextConverter.isEmpty(request.getParameter("from") ) || // from anybody
	      ( from_curator && ! TextConverter.isEmpty (status) && status.equals("all")) // from curator browse                
            ){
	    return directToAllSymbolListPage (request, from_curator );   
	}

        RequestHandlerResponse response = new RequestHandlerResponse();
	
        try {
	    connectionPool = DBReadManager.getInstance();
	    conn = connectionPool.get_connection();
	    if ( from_who .equals("curator")){ 
                if (status != null && status.equals ("new")){  
		    response.setAttribute("symbolList", new GeneClassSymbolCollection(conn, from_curator ));
                    response.setAttribute ("from_who","curator"); 
                }
	    }else if (from_who .equals("user")){
                BigInteger user_id =  SessionHandler.getCommunityID( request ) ; 
                response.setAttribute("symbolList", new GeneClassSymbolCollection(conn, user_id ));
                response.setAttribute ("from_who","user");
            }
        } finally {
	    if ( conn != null ) {
	      DBReadManager.return_connection( conn );
	    }
	} 
        response.setPage("/jsp/processor/genesymbol/symbol_list.jsp" );
       	return response; 
    }
   
    /**
     * direct to all symbol list page if the request is not from curator or user
     */
    private RequestHandlerResponse  directToAllSymbolListPage(HttpServletRequest request, boolean from_curator) 	
	throws SQLException{

        RequestHandlerResponse response = new RequestHandlerResponse();
	String symbol_type = "all" ; 
	String symbolStartsWith = "A"; 
	if (! TextConverter.isEmpty(request.getParameter("symbol_type")) ){
	    symbol_type = request.getParameter("symbol_type"); 
        }

	if (! TextConverter.isEmpty(request.getParameter("startwith")) ){
	    symbolStartsWith = request.getParameter("startwith").toUpperCase(); 
        }
        GeneClassSymbolCollection symbols = null;
       
       	try {
	    connectionPool = DBReadManager.getInstance();
	    conn = connectionPool.get_connection();
  	    symbols = new  GeneClassSymbolCollection( conn, symbol_type, symbolStartsWith);
        }finally {
	    if ( conn != null ) {
		connectionPool.return_connection( conn );
	    }
	} 
	response.setAttribute("symbolType",symbol_type ); 
        response.setAttribute("symbolList",symbols);
        if(from_curator){
            response.setAttribute ("from_who","curator"); 
        }
        response.setPage("/jsp/processor/genesymbol/symbol_list_summary.jsp" );
       	return response;    
    }

}
