//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.7 $
// $Date: 2006/09/29 20:40:56 $
//------------------------------------------------------------------------------
package org.tair.processor.notepad;

import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.tair.community.LoginChecker;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.querytools.Notepad;
import org.tair.querytools.NotepadDetail;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcNotepad;
import org.tair.utilities.EMail;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.TextConverter;
import org.tair.utilities.UnauthorizedRequestException;
import org.tair.utilities.WebApp;
import org.tair.utilities.WebFormField;

/**
 * NotepadHandler handles all requests to create, confirm and store notepad 
 * entries, or user annotations, to Tair objects.  All actions in NotepadHandler
 * require that user be logged in.  When user makes first request, the TAIR 
 * accession number of the data object they've requested to annotate is stored
 * in user's session.  When the notepad data has been stored to the database, 
 * this value is used to return the user to the detail page they started from 
 * by redirecting the user to TairServlet & appending the stored accession 
 * number
 *
 * <p>
 * Notepad objects are held in user's session while they are being created.  
 * This is done to pass the data smoothly across multiple pages.  Holding object
 * in session is done instead of passing data in hidden form fields, since form
 * fields have problems if notepad text contains special characters like 
 * quotation marks that confuse the HTML.  Simply holding object in session is 
 * easier than encoding and decoding values to ensure they are passed correctly
 *
 * <p>
 * After a notepad object is created, curator can deactivate an entry so that
 * it no longer displays on the detail page.  This is done by first finding the
 * entry, confirming that it should be deactivated, then by changing the 
 * item's status to "inactive".
 */


public class NotepadHandler implements RequestHandler {

    /**
     * Processes all requests for creating a new notepad entry.  This method 
     * relies on a request parameter called "update_action" to determine what 
     * stage of the process user is currently in.  Valid values for 
     * update_action are:
     *
     * <ul>
     * <li>add - First step of process.  User must be logged in to proceed.  If 
     * user is logged in, tair object id & accession number of detail object 
     * being viewed are retrieved and saved, and user is forwarded to input form
     * for entering comment</li>
     * <li>confirm - User's input is retrieved & validated. If no errors, user 
     * is forwarded to page to confirm input</li>
     * <li>store - User's data is saved to database.  User is then returned to 
     * detail page they started from
     * <li>search - Curator redirected to a page for entering notepad id of an
     * item to deactivate
     * <li>confirm_deactivate - Notepad with submitted id is retrieved and
     * curator is redirected to page to confirm deactivation of that item
     * <li>deactivate - Status of notepad entry is set to "inactive"
     * </ul>
     *
     * @param request HttpServletRequest forwarded from UpdaterServlet
     * @return RequestHandlerResponse containing URL to forward user to as well
     * as any data objects needed for display on the following page
     * @throws InvalidActionException thrown if attempt is made to store notepad
     * item when it's in an invalid state (w/out person id, for example)
     * @throws InvalidFormException thrown if invalid or incomplete form data is
     * received
     * @throws InvalidLoginException thrown if user is not logged in
     * @throws InvalidParameterException exception thrown if invalid id or data 
     * received
     * @throws InvalidSessionException if no notepad entry found in user's 
     * session when expected
     * @throws RecordNotFoundException if no row found for a notepad id
     * @throws SQLException thrown if a database error occurs
     * @throws UnauthorizedRequestException if user is not a curator when a
     * curator only action is requested
     */
    public RequestHandlerResponse process( HttpServletRequest request ) 
	throws InvalidActionException, InvalidFormException, 
	       InvalidLoginException, InvalidParameterException, 
	       InvalidSessionException, SQLException,  
	       UnauthorizedRequestException {

	RequestHandlerResponse response = null;
	String updateAction = request.getParameter( "update_action" );



	// user must be logged in to continue
	if ( !LoginChecker.isLoggedIn( request ) ) {
	    throw new InvalidLoginException( "User not logged in." );

	} else if ( TextConverter.isEmpty( updateAction ) ) {
	    throw new InvalidParameterException( "Invalid update action " +
						 "requested: " + updateAction );

	    // redirect to page for adding new entry
	} else if ( updateAction.equals( "add" ) ) {
	    response = addNote( request );

	    // validate input and redirect to confirmation page 
	    // before adding new entry to db
	} else if ( updateAction.equals( "confirm" ) ) {
	    response = confirmNote( request );

	    // store confirmed notepad entry to db
	} else if ( updateAction.equals( "store" ) ) {
	    response = storeNote( request );


	    // redirect to page for finding notepad entry to deactivate
	} else if ( updateAction.equals( "search" ) ) {
	    response = searchNote( request );
		
	    // find notepad with submitted id redirect to confirm
	    // that curator wants to deactivate
	} else if ( updateAction.equals( "confirm_deactivate" ) ) {
	    response = confirmDeactivation( request );

	    // deactivate notepad entry in db
	} else if ( updateAction.equals( "deactivate" ) ) {
	    response = deactivateNote( request );

	} else {
	    throw new InvalidParameterException( "Invalid update action " +
						 "requested: " + updateAction );
	}

	return response;

    }



    /**
     * First step in process -- basically, just confirm that use is logged in 
     * (already taken care of) and validate tair object id before redirecting
     * to jsp for user to add note
     *
     * @param request Servlet requests
     * @return Response containing URL of JSP to redirect to for adding note
     * @throws InvalidParameterException if invalid tair object id submitted
     */
    private RequestHandlerResponse addNote( HttpServletRequest request ) 
	throws InvalidParameterException {

	// throws exception if invalid ID
	Long tairObjectID = getTairObjectID( request );

	// Make sure that TAIR accession of data object for new notepad
	// entry is in session or current request.
	checkAccession( request );


	RequestHandlerResponse response = new RequestHandlerResponse();
	response.setAttribute( "tair_object_id", tairObjectID );
	response.setPage( "/jsp/processor/notepad/add_comment.jsp" );

	return response;
    }
  

    /**
     * Retrieve tair object id from request & transform into a Long -- throw 
     * exception if invalid or null id received -- separate this action here 
     * since we'll be verifying object id several times in this handler
     *
     * @param request Servlet request
     * @return tair object id submitted in request as a Long
     * @throws InvalidParameterException if an invalid value received for
     * tair object id
     */
    private Long getTairObjectID( HttpServletRequest request )
	throws InvalidParameterException {

	Long tairObjectID = null;
	String requestID =  request.getParameter( "tair_object_id" );
    
	if ( TextConverter.isEmpty( requestID ) ) {
	    throw new InvalidParameterException( "Invalid tair object id: " + 
						 requestID );

	} else {
      
	    try {
		tairObjectID = new Long( requestID  );
	    } catch ( NumberFormatException nfe ) {
		throw new InvalidParameterException( "Invalid tair object " +
						     "id: " + requestID );
	    }
	}

	return tairObjectID;
    }


    /**
     * Checks to make sure that TAIR accession # of data object is in user's 
     * session or in current request. This is required at all steps of new entry
     * workflow to ensure that user can be redirected to original detail page 
     * after comment is saved.
     *
     * @param request Servlet request to access session or current request 
     * params through
     * @throws InvalidParameterException if no accession number found in 
     * session or current request
     */
    private void checkAccession( HttpServletRequest request ) 
	throws InvalidParameterException {

	// if accession not already in session, add it or throw
	// exception
	if ( !SessionHandler.hasReturnAccession( request ) ) {

	    String accession = request.getParameter( "accession" );
	    if ( TextConverter.isEmpty( accession ) ) {
		throw new InvalidParameterException( "Invalid or missing " +
						     "accession number" );
	    } else {
		SessionHandler.setReturnAccession( request, accession );
	    }
	}
    }


    /**
     * Retrieve user note input from request - validate input, create Notepad 
     * object to display user's note on confirm page, store Notepad object in
     * session to store object after input is confirmed - if a Notepad object
     * already exists in session, this action will replace it with the new one
     *
     * @param request Servlet request containing user input from notepad form
     * @return response containing URL of JSP for confirming note
     * @throws InvalidParameterException if an invalid tair object id received
     * @throws InvalidFormException if invalid or incomplete data received
     * from web form
     * @throws InvalidLoginException if user not logged in
     */
    private RequestHandlerResponse confirmNote( HttpServletRequest request ) 
	throws InvalidParameterException, InvalidFormException, 
	       InvalidLoginException {

	// Make sure that TAIR accession of data object for new notepad
	// entry is in session or current request.
	checkAccession( request );
	
	RequestHandlerResponse response = new RequestHandlerResponse();
	Notepad notepad;
  try {
    notepad = createNotepad( request );
    SessionHandler.setNotepad( request, notepad );
    response.setAttribute( "note", notepad );
    response.setPage( "/jsp/processor/notepad/confirm_comment.jsp" );
  } catch (InvalidLoginException e) {
    // User not logged in, can't make notepad comment
    response.setAttribute( "exception", "Can't comment if not logged in" );
    response.setPage( "/jsp/common/invalid_action_error.jsp" );
  }

	return response;
    }


    /**
     * Retrieves notepad data from request & user session & create Notepad object
     * to represent it
     *
     * @param request Servlet request containing user input for notepad entry
     * @return Notepad object populated with data in request
     * @throws InvalidFormException if invalid of incomplete data received
     * @throws InvalidLoginException if user not logged in
     */
    private Notepad createNotepad( HttpServletRequest request ) 
	throws InvalidFormException, InvalidLoginException {

	Notepad notepad = null;
	String comment = null;
	Long tairObjectID = null;

	// save up all errors to throw single form exception
	HashMap errors = new HashMap();

	// create WebFormField to handle validation & retrieval of comment
	WebFormField commentField = new WebFormField( "comment", true );
	try {
	    comment = (String) commentField.validate( request );
	} catch ( InvalidParameterException ipe ) { 
	    String errMessage = 
		"You must fill in the comment field. " +
		"Please go back and enter the " +
		"comment and resubmit. ";
	    errors.put( "comment", errMessage );
	}
    
	try {
	    tairObjectID = getTairObjectID( request ); 
	} catch ( InvalidParameterException ipe ) {
	    errors.put( "tair object id", ipe.getMessage() );
	}
    
	if ( errors != null && !errors.isEmpty() ) {
	    throw new InvalidFormException( errors );
	}
    
	notepad = new Notepad(SessionHandler.getPersonID( request ));
	notepad.set_tair_object_id( tairObjectID );
	notepad.set_comment( comment );

	// hardcode all statuses to active for now
	notepad.set_status( "active" );

	return notepad;
    }


    /**
     * Stores new notepad entry to the database.  Email will be sent to
     * Eva at Carnegie notifying here that a new entry has been added.
     * After notepad entry is stored, user will be returned to the detail
     * page for the data element note was added for.
     *
     * @param request Servlet request
     * @return Response with URL of detail page to return user to
     * @throws SQLException if a database error occurs
     * @throws InvalidFormException if missing or invalid notepad data 
     * is received
     * @throws InvalidLoginException if user is not logged in
     * @throws InvalidActionException if notepad is not able to be stored
     * due to some inconsistency such as missing tair object id
     * @throws InvalidSessionException if notepad entry not found in user's
     * session
     * @throws InvalidParameterException if no TAIR accession found to
     * redirect user to
     */
    private RequestHandlerResponse storeNote( HttpServletRequest request ) 
	throws SQLException, InvalidFormException, InvalidLoginException, 
	       InvalidActionException, InvalidSessionException,
	       InvalidParameterException {

	RequestHandlerResponse response = null;
	DBWriteManager connectionPool = null;
	DBconnection conn = null;


	// Make sure that TAIR accession of data object for new notepad
	// entry is in session or current request.
	checkAccession( request );


	try {
	    // get note created in earlier steps from session
	    Notepad note = SessionHandler.getNotepad( request ); 
	    if ( note == null ) {
		throw new InvalidSessionException( "No notepad object found in session " + request.getSession().getId() );
	    }

	    connectionPool = DBWriteManager.getInstance();
	    conn = connectionPool.get_connection();
	    note.store( conn );
	    response = new RequestHandlerResponse();
      
	    // send user back to detail page where they started
	    String returnAccession = SessionHandler.getReturnAccession( request );


	    // send email to Eva at Carnegie notifying her that a new note
	    // was submitted
	    notifyCarnegie( note, returnAccession );
	    
	    // redirect user to original detail page
	    response.setPage( "/servlets/TairObject?accession=" + 
			      returnAccession );
	    
	    // remove objects from session to allow cleanup
	    SessionHandler.removeReturnAccession( request ); 
	    SessionHandler.removeNotepad( request );
      
	} finally {
	    if ( conn != null ) {
		connectionPool.return_connection( conn );
	    }
	}

	return response;
    }

    /**
     * Sends Email to Eva at Carnegie w/links to new notepad entry & object 
     * detail page. Email is also sent to archive address at Carnegie for
     * posterity
     *
     * @param note Newly created notepad entry
     * @returnAccession TAIR accession number of data element notepad entry
     * was created for
     */
    private void notifyCarnegie( Notepad note, String returnAccession ) {

            //Per Jira issue TAIR-27
	    String address = "notepad@acoma.stanford.edu";

	    // create URL to view notepad entry
	    String noteURL = 
	        WebApp.getServerURL() + 
	        "/servlets/TairObject?type=notepad&id=" + note.get_notepad_id();

	    // create URL for detail page
	    String objectURL = 
	        WebApp.getServerURL() + 
	        "/servlets/TairObject?accession=" + returnAccession;

	    StringBuffer msg = new StringBuffer();
	    msg.append( "A new notepad entry has been entered for TAIR " +
			"accession# " + returnAccession + "\n\n" +
			"The note can be viewed at:\n\n" + noteURL + "\n\n" );
	    msg.append( "The object detail page can be viewed at:\n\n" + 
			objectURL ); 
                  
      
	    try {
		EMail.send( WebApp.getProperty( "MAIL_HOST" ),
			    WebApp.getProperty( "FROM_ADDRESS" ),
			    address,
			    "New notepad entry: " + returnAccession,
			    msg.toString()
			    );
        
		// don't worry about giving user error message for mail failure, 
		// just print to STDERR (shouldn't happen anyway, but ya never 
		// know...)
	    } catch ( Exception e ) {
		System.err.println( "Could not send mail to: " + address );
		e.printStackTrace();
	    }
    }


    /**
     * Checks that user is a TAIR curator, then redirects to page where
     * curator can enter a notepad id to deactivate.
     *
     * @param request Servlet request
     * @return Response containing URL of JSP where curator can enter a
     * notepad id to deactivate
     * @throws UnauthorizedRequestException if user is not a TAIR curator
     */
    private RequestHandlerResponse searchNote( HttpServletRequest request ) 
	throws UnauthorizedRequestException {

	// throws exception if user not curator
	checkCurator( request );

	RequestHandlerResponse response = new RequestHandlerResponse();
	response.setPage( "/jsp/processor/notepad/search_notepad.jsp" );

	return response;
    }


    /**
     * Ensures that user making request is a TAIR curator.
     *
     * @param request Servlet request
     * @throws UnauthorizedRequestException if user is not a TAIR curator
     */
    private void checkCurator( HttpServletRequest request ) 
	throws UnauthorizedRequestException {
	
	if ( !LoginChecker.isTairCurator( request ) ) {
	    throw new UnauthorizedRequestException( "Not authorized for " +
						    "this resource" );
	}
    }


    /**
     * Creates notepad object for submitted notepad id and redirects to
     * page where curator can confirm she wants to deactivate entry. If
     * no notepad entry is found with submitted id, curator is redirected
     * to an error page.
     *
     * @param request Servlet request containing notepad id to find
     * @return Response containing notepad entry as Notepad object and
     * URL of JSP for curator to view entry and confirm that it should
     * be deactivated
     * @throws InvalidFormException if no notepad id found in request
     * @throws InvalidParameterException if an invalid id submitted
     * @throws SQLException if a database error occurs
     * @throws UnauthorizedRequestException if user is not a TAIR curator
     */
    private RequestHandlerResponse confirmDeactivation( HttpServletRequest request )
	throws InvalidFormException, InvalidParameterException, SQLException,
	       UnauthorizedRequestException {

	// throws exception if user not curator
	checkCurator( request );

	DBconnection conn = null;
	DBReadManager connectionPool = null;

	// get id from request -- throws exception if missing or invalid
	// id received
	Long notepadID = getNotepadID( request );

	RequestHandlerResponse response = new RequestHandlerResponse();

	try {
	    connectionPool = DBReadManager.getInstance();
	    conn = connectionPool.get_connection();

	    // create notepad object for submitted id - will throw not found
	    // exception if no row for id - and redirect to page for confirming
	    // deactivation
	    NotepadDetail notepad = new NotepadDetail( conn, notepadID );
	    response.setAttribute( "note", notepad );
	    response.setPage( "/jsp/processor/notepad/confirm_notepad_deactivate.jsp" );

	    // if no entry found with submitted id, redirect to not found page 
	} catch ( RecordNotFoundException rnfe ) {
	    response.setPage( "/jsp/processor/notepad/notepad_not_found.jsp" );
	    
	} finally {
	    connectionPool.return_connection( conn );
	}

	
	return response;
    }

    /**
     * Retrieves notepad_id from request and transforms to a Long value.
     * Exceptions thrown if id not found in request or if invalid value
     * found.
     *
     * @param request Servlet request containing notepad id to retrieve
     * @return Notepad id from request as a Long
     * @throws InvalidFormException if notepad id not found in request
     * @throws InvalidParameterException if invalid id found
     */
    private Long getNotepadID( HttpServletRequest request )
	throws InvalidFormException, InvalidParameterException {

	Long notepadID = null;

	String reqID = request.getParameter( "notepad_id" );
	
	try {
	    if ( TextConverter.isEmpty( reqID ) ) {
		throw new InvalidFormException( "No notepad id submitted" );
	    } else {
		notepadID = new Long( reqID );
	    
	    }
	    
	} catch ( NumberFormatException nfe ) {
	    throw new InvalidParameterException( "Invalid notepad id: " + 
						 reqID );
	}

	return notepadID;
    }

	
    /**
     * Deactivates notepad entry by setting status to "inactive".  Curator must 
     * have already reviewed notepad entry and confirmed that she wants to 
     * deactivate entry.
     *
     * @param request Servlet request containing notepad_id to deactivate
     * @return Response with URL of JSP confirming deactivation of entry
     * @throws InvalidActionException if notepad entry does not have valid
     * id when deactivation is requested
     * @throws InvalidFormException if no notepad id in request
     * @throws InvalidParameterException if invalid notepad id submitted
     * @throws RecordNotFoundException if no row found for notepad id
     * @throws SQLException if a database error occurs
     * @throws UnauthorizedRequestException if user is not a TAIR curator
     */
    private RequestHandlerResponse deactivateNote( HttpServletRequest request ) 
	throws InvalidActionException, InvalidFormException, 
	       InvalidParameterException, SQLException, 
	       UnauthorizedRequestException {

	// get id from request -- throws exception if missing or invalid
	// id received
	Long notepadID = getNotepadID( request );
		
	DBWriteManager connectionPool = null;
	DBconnection conn = null;
	
	try {
	    connectionPool = DBWriteManager.getInstance();
	    conn = connectionPool.get_connection();

	    // create instance of notepad with id, manually set status to
	    // inactive, then store changes to db
	    TfcNotepad notepad = new TfcNotepad( conn, notepadID);
	    notepad.set_status( "inactive" );
	    notepad.store( conn );

	} finally {
	    connectionPool.return_connection( conn );
	}

	// redirect to confirmation page
	RequestHandlerResponse response = new RequestHandlerResponse();
	response.setPage( "/jsp/processor/notepad/notepad_deactivated.jsp" );

	return response;
    }
     
}
