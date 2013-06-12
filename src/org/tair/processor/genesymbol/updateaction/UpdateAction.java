// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.genesymbol.updateaction;

import java.math.BigInteger;
import java.sql.*;
import javax.servlet.http.*;

import org.tair.community.*;
import org.tair.handler.*;
import org.tair.tfc.*;
import org.tair.utilities.*;

import org.tair.processor.genesymbol.*;

/**
 * the abstract supper class for all update actions for gene class symbol
 */

public abstract class UpdateAction {
    protected String actionName;
    protected DatabaseManager connectionPool = null ;
    protected DBconnection conn = null;
    protected WebFormField field = null;

    public UpdateAction() {}
   
    public UpdateAction(String actionName) {
	this.actionName = actionName;
    }

    public String getActionName() {
	return actionName;
    }

    /**
     * check permission depends on actionName
     * @param request HttpServletRequest 
     * @exception InvalidLoginException thrown if user is not logged in
     * @exception UnauthorizedRequestException thrown if non-curator user attempts to access
     */
    public void verify(HttpServletRequest request) 
	throws InvalidLoginException, UnauthorizedRequestException {
	checkLoginPermissions(request);
    }

    /**
     * execute , this will call diffrent execute in children class 
     * depends on diffrent actionName
     * @param request HttpServletRequest
     * @return RequestHandlerResponse containing URL to forward user to
     * @exception InvalidLoginException thrown if user is not logged in
     * @exception SQLException thrown if a database error occurs
     * @exception InvalidParameter exception thrown if invalid update_action, id or data received
     * @exception UnauthorizedRequestException thrown if non-curator user attempts to access 
     * @exception SessionOutOfTimeException thrown if session out of time
     */

    public  RequestHandlerResponse execute(HttpServletRequest request)
	throws SQLException, InvalidFormException,
               InvalidParameterException, UnauthorizedRequestException,
	       InvalidLoginException, SessionOutOfTimeException{
   	RequestHandlerResponse response = new RequestHandlerResponse();
        return response ;
    }

    /**
     * Throws an exception if the user is either not logged in, or is
     * not a symbol curator: symbol curator are: all tair curators and mutant symbol curator
     * the MUTANT_SYMBOL_CURATOR_ID is saved in WebApp file 
     *
     * @param request HttpServletRequest forwarded from UpdaterServlet
     * @exception InvalidLoginException thrown if user is not logged in
     * @exception UnauthorizedRequestException thrown if non-curator user attempts to access definitions functions
     */
    protected void checkIsSymbolCurator(HttpServletRequest request) 
	throws InvalidLoginException, UnauthorizedRequestException {
        BigInteger communityID = SessionHandler.getCommunityID( request );
       
        if ( !LoginChecker.isLoggedIn( request )) { 
	    throw new InvalidLoginException( "Please login as curator to continue" );
        }
        if ( ! ( LoginChecker.isTairCurator( request )) && 
             communityID != new BigInteger( WebApp.getProperty("MUTANT_SYMBOL_CURATOR_ID") )){
          throw new UnauthorizedRequestException("Not authorized for review/approve the gene class symbol");
	}
	
    }
    
    protected void setActionFromWhoFromSession(HttpServletRequest request)
    throws InvalidLoginException, UnauthorizedRequestException {
        BigInteger communityID = SessionHandler.getCommunityID( request );
        HttpSession session = request.getSession(false);

        if ( ( LoginChecker.isTairCurator( request )) ||
            communityID == new BigInteger( WebApp.getProperty("MUTANT_SYMBOL_CURATOR_ID") )){
            
            session.setAttribute("action_from","curator");
        } 
    }

    /**
     * Throws an exception if the user is either not logged in
     *
     * @param request HttpServletRequest forwarded from UpdaterServlet
     * @exception InvalidLoginException thrown if user is not logged in
     * @exception UnauthorizedRequestException thrown if non-curator user attempts to access definitions functions
     */
    protected void checkLoginPermissions(HttpServletRequest request) 
	throws InvalidLoginException, UnauthorizedRequestException {
	if ( !LoginChecker.isLoggedIn( request ) ) {
	    throw new InvalidLoginException( "User not logged in" );
	}
    }

    /**
     * get ComposisteGeneClassSymbol from session
     * A new GeneClassSymbol will be created if no GeneClassSymobl in the session
     * @param request HttpServletRequest 
     * exception SessionOutOfTimeException thrown if session out of time
     */

    protected CompositeGeneClassSymbol getCompositeGeneSymbolFromSession( HttpServletRequest request) 
	throws SessionOutOfTimeException {
	CompositeGeneClassSymbol symbol = null;
	HttpSession session = request.getSession(false);
        if (session == null) { 
            throw new SessionOutOfTimeException("User session time out");
        }
	if ( session.getAttribute("compositeSymbol") == null  ){
	    session.setAttribute("compositeSymbol", new CompositeGeneClassSymbol());
	}

	symbol = (CompositeGeneClassSymbol)session.getAttribute("compositeSymbol") ;
	return symbol ;
    }


    /**
     * remove symbol from session
     * @param request HttpServletRequest 
     * exception SessionOutOfTimeException thrown if session out of time
     */
    protected void removeCompositeGeneSymbolFromSession( HttpServletRequest request) 
       throws SessionOutOfTimeException {
	HttpSession session = request.getSession(false);
        if (session == null ){ 
            throw new SessionOutOfTimeException("User session time out");
        } 
	if ( session.getAttribute("compositeSymbol") != null  ){
	    session.removeAttribute("compositeSymbol");
	}
    }   
    
      /**
     * get request from who  from session
     * either from curator or from user
     * @param request HttpServletRequest 
     * exception SessionOutOfTimeException thrown if session out of time
     */

    // since curator can change symbol's symbol, change symbol type and associate symbol to 
    // different submitter

    protected String getActionFromWhoFromSession  ( HttpServletRequest request)
	throws SessionOutOfTimeException { 
        	HttpSession session = request.getSession(false);
        if (session == null ){ 
            throw new SessionOutOfTimeException("User session time out");
        }
  
        String from  = (String) session.getAttribute("action_from");
	
        if ( ! TextConverter.isEmpty( from ) ){
	   return from.equals("curator")? "curator" : "user"; 
	}
        return "user";
   } 
    
}
