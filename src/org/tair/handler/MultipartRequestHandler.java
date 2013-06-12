//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.3 $
// $Date: 2005/09/14 16:22:52 $
//------------------------------------------------------------------------------ 

package org.tair.handler;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;

import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.UnauthorizedRequestException;

import com.oreilly.servlet.*;

/**
  * MultipartRequestHandler defines a general interface for individual classes 
  * that process different types of HttpServletRequests with the attribute of 
  * enctype="multipart/form-data" set on the form.  Request contains a single 
  * method, process( HttpServletRequest request, MultipartRequest multi ), 
  * to be defined by  classes implementing the interface.
  */  

public interface MultipartRequestHandler {

    /**
     * Executes any actions specific to a type of <code>HttpServletRequest</code>. 
     *
     * @param request  HttpServletRequest passed from servlet that contains any
     * request parameters
     * @return RequestHandlerResponse that contains a <code>String</code> value
     * representing the page to forward to, along with any attributes to be 
     * included with the HttpServletResponse
     *
     * @throws InvalidFormException if invalid values submitted from user form
     * @throws SQLException if a database error occurs while processing
     * @throws InvalidSessionException if an object necessary for processing is
     * not found in user's <code>HttpSession</code>
     * @throws InvalidParameterException if a parameter is not of proper type,
     * or has an invalid value
     * @throws UnauthorizedRequestException if action requested violates 
     * business rules, or user does not have permissions for action
     * @throws InvalidLoginException if user is not logged in when trying to 
     * access protected functionality
     *
     * @see org.tair.handler.RequestHandlerResponse
     * @see javax.servlet.http.HttpServletRequest
     * @see javax.servlet.http.HttpServletResponse
     */
    public RequestHandlerResponse process( HttpServletRequest request, 
					   MultipartRequest multi )
	throws InvalidFormException, SQLException, InvalidSessionException, 
	       InvalidParameterException, UnauthorizedRequestException, 
	       InvalidLoginException;

}
