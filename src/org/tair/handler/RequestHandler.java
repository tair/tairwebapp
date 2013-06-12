//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.4 $
// $Date: 2005/05/26 22:22:00 $
//------------------------------------------------------------------------------ 

package org.tair.handler;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;

import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.UnauthorizedRequestException;


/**
 * RequestHandler defines a general interface for individual classes that 
 * process different types of HttpServletRequests.  RequestHandler specifies a 
 * single method, process( HttpServletRequest request ), to be defined by 
 * classes implementing the interface.
 */  

public interface RequestHandler {

    /**
     * Executes any actions specific to a type of <code>HttpServletRequest</code>.
     * Servlets use collections of objects implementing this interface to handle
     * different types of requests.
     *
     * @param request  HttpServletRequest passed from servlet that contains any
     * request parameters
     * @return RequestHandlerResponse that contains a <code>String</code> value
     * representing the page to forward to, along with any attributes to be 
     * included with the HttpServletResponse
     * @throws InvalidFormException if invalid values submitted from user form
     * @throws InvalidParameterException thrown if a parameter is not of proper
     * type, or has an invalid value
     * @throws InvalidLoginException if user is not logged in when trying
     * to access protected functionality
     * @throws InvalidSessionException if an object necessary for processing is
     * not found in user's <code>HttpSession</code>
     * @throws SQLException if a database error occurs while processing
     * @throws UnauthorizedRequestException thrown if action requested violates
     * business rules, or user does not have permissions for action
     *
     * @see org.tair.handler.RequestHandlerResponse
     * @see javax.servlet.http.HttpServletRequest
     * @see javax.servlet.http.HttpServletResponse
     */
    public RequestHandlerResponse process( HttpServletRequest request )
	throws InvalidFormException, InvalidSessionException, 
	       InvalidParameterException, UnauthorizedRequestException,
	       InvalidLoginException, SQLException;

}
