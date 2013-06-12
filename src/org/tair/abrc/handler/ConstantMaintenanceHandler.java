//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2005/09/14 16:21:39 $
//------------------------------------------------------------------------------

package org.tair.abrc.handler;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.tair.abrc.AbrcConstantCollection;
import org.tair.community.LoginChecker;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAbrcConstant;
import org.tair.utilities.CompoundVector;
import org.tair.utilities.CompoundWebFormField;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.UnauthorizedRequestException;

/**
 * ConstantMaintenanceHandler handles the display and update of the various
 * ABRC constants used in the stock ordering process. These constants are
 * all stored in the AbrcConstant table and are used to adjust various stock
 * order charges according to each user.  ConstantMaintenanceHandler provides
 * a web interface to allow ABRC curators to easily update the values of each
 * of these constants.
 */

public class ConstantMaintenanceHandler implements RequestHandler {

    /**
     * Handles all requests involved in displaying and updating ABRC
     * constants. Method uses the "update_action" request param to 
     * determine what actions to take for each request. Possible values of
     * "update_action" are:
     *
     * <ul>
     * <li>view - Retrieves current values of constants from the database
     * and redirects to a JSP where user can view and update values. This is
     * the default action if no value for update_action is received.</li>
     * <li>update - Retrieves updated values submitted for each constant 
     * through the update form, validates values and stores updates to the 
     * database.</li>
     * </ul>
     *
     * @param request HttpServletRequest forwarded from OrderServlet
     * @return RequestHandlerResponse containing URL of page to forward user to
     * @throws InvalidActionException if a Tfc object fails its own internal
     * validation before storing to the database
     * @throws InvalidFormException if invalid form data is submitted
     * @throws InvalidLoginException if user is not logged in
     * @throws InvalidParameterException thrown if an invalid update_action
     * value is received
     * @throws SQLException thrown if a database error occurs
     * @throws UnauthorizedRequestException if user is not an ABRC/TAIR curator
     */
    public RequestHandlerResponse process( HttpServletRequest request ) 
        throws InvalidFormException, InvalidLoginException, 
	       InvalidParameterException, SQLException, 
	       UnauthorizedRequestException {


	// user must be logged in as ABRC/TAIR curator to continue
	if ( !LoginChecker.isLoggedIn( request ) ) {
	    throw new InvalidLoginException( "User not logged in" );

	} else if ( !LoginChecker.isTairCurator( request ) ) {
	    throw new UnauthorizedRequestException( "Unauthorized to access " +
						    "this resource" );
	}

	RequestHandlerResponse response = null;

	// retrieve update_action to determine what action to take
	String action = request.getParameter( "update_action" );

	// default action - retrieve current constant values and redirect
	// to page for display and update
	if ( action == null || action.equals( "view" ) ) {
	    response = viewConstants();

	    // update database with submitted values for each constant
	} else if ( action.equals( "update" ) ) {
	    response = updateConstants( request );

	} else {
	    throw new InvalidParameterException( "Invalid update_action " +
						 "received: " + action );
	}
	
	return response;
	
    }


    /**
     * Retrieves current values for each constant and redirects curator
     * to page where she can view and update values.
     *
     * @return Response containing constants as <code>TfcAbrcConstant</code>
     * objects consolidated as a single <code>AbrcConstantCollection</code> as
     * well as the URL of JSP for displaying and updating values.
     * @throws SQLException if a database error occurs while retrieving values
     */
    private RequestHandlerResponse viewConstants() throws SQLException {
	RequestHandlerResponse response = new RequestHandlerResponse();

	AbrcConstantCollection constants = 
	    AbrcConstantCollection.getInstance();

	response.setAttribute( "constants", constants );
	response.setPage( "/jsp/abrc/update_constants.jsp" );

	
	return response;
    }


    /**
     * Retrieves values submitted for each constant, validates submission and 
     * updates database with new values.
     * 
     * @return Response containing URL of JSP confirming updates
     * @throws InvalidActionException if a constant fails its own internal 
     * validation before storing values to the database
     * @throws InvalidFormException if form submission contains invalid values
     * @throws SQLException if a database error occurs
     */
    private RequestHandlerResponse updateConstants( HttpServletRequest request )
	throws InvalidActionException, InvalidFormException, SQLException {

	RequestHandlerResponse response = new RequestHandlerResponse();

	AbrcConstantCollection constants = AbrcConstantCollection.getInstance();

	// get submitted constants as Map with abrc_constant_id as
	// Long key referencing constant as Integer
	Map formValues = getFormValues( request );

	DBconnection conn = null;

	try {
	    conn = DBWriteManager.getInstance().get_connection();

	    Long abrcConstantID = null;
	    Float constant = null;
	    TfcAbrcConstant constantObj = null;

	    Iterator iter = formValues.keySet().iterator();
	    while ( iter.hasNext() ) {
		abrcConstantID = (Long) iter.next();
		constant = (Float) formValues.get( abrcConstantID );
		constantObj = constants.get( abrcConstantID );
		
		// only update if submitted value is different than
		// current value
		if ( !constantObj.get_constant().equals( constant ) ) {
		    constantObj.set_constant( constant );
		    constantObj.store( conn );
		}
	    }

	} finally {
	  DBWriteManager.return_connection( conn );
	}
   	
	response.setPage( "/jsp/abrc/constants_updated.jsp" );

	return response;
    }


    /**
     * Retrieve constant form values from request and convert String
     * submission to Integer before returning validated values.  Constant
     * form fields are named to contain abrc_constant_id to allow for
     * multiple values to be set within the same submission. This method
     * jumps through the necessary hoops to get ids and constant values
     * cleaned up for easy use by calling method.
     *
     * @param request Servlet request containing form field values to retrieve
     * @return Submitted constant values as Map with abrc_constant_id
     * as Long key referencing constant value as Integer
     */
    private Map getFormValues( HttpServletRequest request ) 
	throws InvalidFormException {
	
	// use CompoundWebFormField to easily parse out abrc_constant_id
	// from each submitted field name
        CompoundWebFormField constantField = 
	    new CompoundWebFormField( "constant", // field name
				      true, // required field 
				      "constant_", // prefix to parse out
				      true ); // parse key as numeric value
				      
	CompoundVector formValues = null;

	try { 
	    formValues = (CompoundVector) constantField.validate( request );
	} catch ( InvalidParameterException ipe ) {
	    throw new InvalidFormException( "Invalid form submission: " + 
					    ipe.getMessage() );
	}

	//
	// compound field returns values as CompoundVector with Long
	// key referencing String value. Convert value to Float - 
	// throw exception if any non-numeric constant values received
	//

	Map validatedValues = new HashMap();
	Long abrcConstantID = null;
	String constantStr = null;
	Float constant = null;
	Map errors = null;

	for ( int i = 0; i < formValues.size(); i++ ) {
	    abrcConstantID = (Long) formValues.getKeyAt( i );
	    constantStr = (String) formValues.getValueAt( i );

	    try {
		constant = new Float( constantStr );

	    } catch ( NumberFormatException nfe ) {
		if ( errors == null ) {
		    errors = new HashMap();
		}
		errors.put( constantStr, 
			    "Invalid constant value: " + constantStr );
	    }
	    
	    validatedValues.put( abrcConstantID, constant );
	}

	if ( errors != null ) {
	    throw new InvalidFormException( errors, "Invalid form submission" );
	}
	
	return validatedValues;
    }

}
