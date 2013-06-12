// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.definitions;

import java.sql.*;
import java.util.*;
import javax.servlet.http.*;

import org.tair.community.*;
import org.tair.handler.*;
import org.tair.querytools.*;
import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * DefinitionsHandler handles all requests to search for, create and update 
 * entries in the Definitions table. Each update or insert action is done
 * to a single Definitions record at time.
 *
 * <p>
 * All actions in DefinitionsHandler require that user is logged in as TAIR curator. 
 */


public class DefinitionsHandler implements RequestHandler {

  // JSP page for searching - localize here for simplicity
  private String searchForm = "/jsp/processor/definitions/definitions_form.jsp"; 



  /**
   * Processes all requests for searching and updating definitions entries. This method relies
   * on a request parameter called "update_action" to determine what stage of the
   * process user is currently in.  Valid values for update_action are:
   *
   * <ul>
   * <li>search - Retrieves all definition entries for submitted table name</li>
   * <li>update - Updates submitted definition with form values; any empty values will
   * cause any existing definition for a given row to be overwritten with <code>null</code>. 
   * Definition may be deleted as part of update actions. After update is performed, 
   * collection of definitions is retrieved again, and user is redirected to update page 
   * where they can view all updated definitions for originally submitted table name</li>
   * <li>new_search, or <code>null</code> - Redirects user to form for searching by table name</li>
   * <li>add - Ensures that a table name has been submitted for new row in db, then redirects
   * user to form to enter data for new row.</li>
   * <li>create - Creates a new definitions row from the submitted data.  After insert is 
   * performed collection of definitions is retrieved again, and user is redirected to
   * update page where they can view all updated definitions for originally submitted table name</li>
   * </ul>
   *
   * <p>
   * User must be logged in as TAIR curator for all actions.
   * 
   * @param request HttpServletRequest forwarded from UpdaterServlet
   * @return RequestHandlerResponse containing URL to forward user to as well
   * as any data objects needed for display on the following page
   * @exception InvalidLoginException thrown if user is not logged in
   * @exception SQLException thrown if a database error occurs
   * @exception InvalidParameter exception thrown if invalid update_action, id or data received
   * @exception InvalidFormException thrown if invalid or incomplete form data is received
   * @exception UnauthorizedRequestException thrown if non-curator user attempts to access definitions functions
   */
  public RequestHandlerResponse process( HttpServletRequest request ) throws InvalidLoginException, InvalidParameterException, SQLException, InvalidFormException, UnauthorizedRequestException {
    String updateAction = null;
    RequestHandlerResponse response = null;



    
    updateAction = request.getParameter( "update_action" );
    if ( updateAction == null || updateAction.equals( "new_search" ) ) {
      checkLoginPermissions(request);
      response = new RequestHandlerResponse();
      response.setPage( searchForm );

    } else if ( updateAction.equals( "search" ) ) {
      checkLoginPermissions(request);
      response = searchDefinitions( request );

    } else if ( updateAction.equals( "update" ) ) {
      checkLoginPermissions(request);
      response = updateDefinitions( request, true ); // update existing

    } else if ( updateAction.equals( "add" ) ) { // redirect to form for adding
      checkLoginPermissions(request);
      response = addDefinitions( request );

    } else if ( updateAction.equals( "create" ) ) { // create new record
      checkLoginPermissions(request);
      response = updateDefinitions( request, false );

    }else if ( updateAction.equals( "glossary" ) ) { // list all glossarys
      response = displayGlossary(request);

    } else {
      throw new InvalidParameterException( "Invalid action requested: " + updateAction );
    }
    
    return response;
  }

  
  /**
   * Throws an exception if the user is either not logged in, or is
   * not a curator.  
   *
   * @param request HttpServletRequest forwarded from UpdaterServlet
   * @exception InvalidLoginException thrown if user is not logged in
   * @exception UnauthorizedRequestException thrown if non-curator user attempts to access definitions functions
   */
  private void checkLoginPermissions(HttpServletRequest request) 
       throws InvalidLoginException, UnauthorizedRequestException {
    if ( !LoginChecker.isLoggedIn( request ) ) {
      throw new InvalidLoginException( "User not logged in" );
    }

    if ( !LoginChecker.isTairCurator( request ) ) {
      throw new UnauthorizedRequestException( "Not authorized for this resource" );
    }
  }
  

  private RequestHandlerResponse displayGlossary(HttpServletRequest request) throws SQLException {

    DBReadManager connectionPool = null;
    DBconnection conn = null;

    try {
      connectionPool = DBReadManager.getInstance();
      conn = connectionPool.get_connection();

      RequestHandlerResponse response = new RequestHandlerResponse();
      DefinitionsCollection glossary = new DefinitionsCollection(conn, "glossary");
      request.setAttribute("glossary", glossary);
      response.setPage( "/jsp/processor/definitions/display_glossary.jsp" );
      return response;
    } finally {
      if (conn != null) {
	connectionPool.return_connection(conn);
      }
    }
  }




  /*
    Retrieve all definitions stored for table name by creating
    DefinitionsCollection using name as key in constructor.  If table name
    not found, collection will be empty -- JSP will handle giving user error
    message is this is the case.  Redirect to page for displaying current db
    values and to allow curator to update definitions
  */
  private RequestHandlerResponse searchDefinitions( HttpServletRequest request ) throws SQLException, InvalidFormException {
    RequestHandlerResponse response = null;
    String tableName = null;
    DBReadManager connectionPool = null;
    DBconnection conn = null;
    DefinitionsCollection definitions = null;
    WebFormField searchField = null;



    try {
      // Use WebFormField to retrieve & validate table name search value
      searchField = new WebFormField( "table_name", true, 50 ); // create required field, max chars of 50
      tableName = (String) searchField.validate( request );

      connectionPool = DBReadManager.getInstance();
      conn = connectionPool.get_connection();
      definitions = new DefinitionsCollection( conn, tableName );
      response = new RequestHandlerResponse();
      response.setAttribute( "definitions", definitions );
      response.setPage( "/jsp/processor/definitions/update_definitions.jsp" );

    } catch ( InvalidParameterException ipe ) { // if missing table name value, throw form exception
      throw new InvalidFormException( ipe.getMessage() );

    } finally {
      if ( conn != null ) {
	connectionPool.return_connection( conn );
      }
    }
    
    return response;
  }


  /*
    Retrieve definitions data from request and store to database.  If existing is true, data
    is submitted as an update to an existing definition record so definitions_id must be supplied
    as part of submission.  If existing is false, data is created as a new definitions record

    After storing data to db, retrieve collection of definitions for table name through searchDefinitions()
    method and display updated definitions
  */
  private RequestHandlerResponse updateDefinitions( HttpServletRequest request, boolean existing ) throws SQLException, InvalidFormException, InvalidLoginException {
    TfcDefinitions definition = null;
    DBWriteManager connectionPool = null;
    DBconnection conn = null;
    RequestHandlerResponse response = null;
    boolean delete = ( request.getParameter( "delete" ) != null && request.getParameter( "delete" ).equals( "true" ) );

    
    // create definition from submitted params no matter what
    definition = createDefinitions( request, existing ); 
				 
   
    try { // save changes to db - delete record if requested, or add/update 

      connectionPool = DBWriteManager.getInstance();
      conn = connectionPool.get_connection();

      if ( delete ) { 
	// deletes row in Definitions, as well as corresponding row
	// for definition in TableStats
	definition.delete( conn );

      } else {

	// if no row already exists with these values, store to database
	if ( !TfcDefinitions.duplicateRowExists( conn, 
						 definition.get_definitions_id(), 
						 definition.get_table_name(), 
						 definition.get_field_name(), 
						 definition.get_field_value() ) 
	     ) {
	  definition.store( conn );

	} else { // otherwise, let user know they're trying to create a duplicate row
	  String errMsg = 
	    "A definitions row already exists with table name: " + definition.get_table_name() + 
	    ", field name: " + definition.get_field_name() + 
	    " and field value: " + definition.get_field_value();
	  throw new InvalidFormException( errMsg );
	}
      }
      
    } finally {
      if ( conn != null ) {
	connectionPool.return_connection( conn );
      }
    }

    // after storing, retrieve definitions for table name again & display update page w/new values
    // by calling searchDefinitions() again and returning results
    response = searchDefinitions( request );

    // if delete was just called, we may have deleted the only entry for table. Rather
    // than show user results page (which will come up as "no search results" now), redirect
    // user to main search page -- will probably never happen, but ya never know...
    if ( delete ) {
      DefinitionsCollection searchResults = (DefinitionsCollection) response.getAttribute( "definitions" );
      if ( searchResults.isEmpty() ) {
	response.setPage( searchForm );
      }
    }

    return response;
  }


  /*
    If requesting to add a new row, just make sure table name is in request, and forward
    to page to add info
  */
  private RequestHandlerResponse addDefinitions( HttpServletRequest request ) throws SQLException, InvalidFormException, InvalidLoginException {
    RequestHandlerResponse response = null;
    
    if ( TextConverter.isEmpty( request.getParameter( "table_name" ) ) ) { 
      throw new InvalidFormException( "Table name cannot be blank" );
    }
      
    response = new RequestHandlerResponse();
    response.setPage( "/jsp/processor/definitions/add_definitions.jsp" );
    return response;
  }


  /*
    Create definitions object from form values in request. If creating object for an update,
    existing should be true; when validating params, definitions_id must be supplied. If
    existing is false, info will be created as a new definitions record
  */
  private TfcDefinitions createDefinitions( HttpServletRequest request, boolean existing ) throws InvalidLoginException, InvalidFormException {
    Map values = null;
    TfcDefinitions definition = new TfcDefinitions();

    // get submitted values - id required if existing record
    values = validateFields( request, existing ); 
    definition.set_definitions_id( (Long) values.get( "definitions_id" ) );
    definition.set_table_name( (String) values.get( "table_name" ) );
    definition.set_definition( (String) values.get( "definition" ) );
    definition.set_reference( (String) values.get( "reference" ) );
    definition.set_field_name( (String) values.get( "field_name" ) );
    definition.set_field_value( (String) values.get( "field_value" ) );
    definition.set_display_value( (String) values.get( "display_value" ) );
    definition.set_do_stats( (Boolean) values.get( "do_stats" ) );
    definition.set_is_glossary( (Boolean) values.get( "is_glossary" ) );

    // set date last updated as now
    definition.set_date_last_modified( new java.util.Date() );

    // record who's doing the update
    definition.set_community_id( SessionHandler.getCommunityID( request ) );

    return definition;
  }
  
  /*
    Retrieve and validate form fields by creating an array of WebFormFields where
    each field represents a form field submission, then retrieving and validating
    each form field according to rules set in createWebFormFields.  If existing
    is true, definitions_id is a required field that must be in request
  */
  private Map validateFields( HttpServletRequest request, boolean existing ) throws InvalidFormException {
    Map errors = null;
    WebFormField[] fields = createWebFormFields( existing );
    Map values = new HashMap();


    // iterate through array and validate each field -- save up errors 
    // to throw single exception with all messages
    for ( int i = 0; i < fields.length; i++ ) {
      try {
	values.put( fields[ i ].getFieldName(), fields[ i ].validate( request ) );
      } catch ( InvalidParameterException ipe ) {
	if ( errors == null ) {
	  errors = new HashMap();
	}
	errors.put( fields[ i ].getFieldName(), ipe.getMessage() );
      }
    }
    
    if ( errors != null && !errors.isEmpty() ) {
      throw new InvalidFormException( errors, "Errors on form submission" );
    }

    return values;
  }

  // Create array of web form fields to retrieve and validate for creating definitions object
  private WebFormField[] createWebFormFields( boolean existing ) {

    WebFormField[] fields = new WebFormField[ 9 ];
    fields[ 0 ] = new WebFormField( "table_name", true, 50 );

    // if updating an existing record, id is a required field
    fields[ 1 ] = new LongWebFormField( "definitions_id", existing );

    fields[ 2 ] = new WebFormField( "definition", false );
    fields[ 3 ] = new WebFormField( "reference", false, 255 );
    fields[ 4 ] = new WebFormField( "field_name", false, 30 );
    fields[ 5 ] = new WebFormField( "field_value", false, 50 );
    fields[ 6 ] = new WebFormField( "display_value", false, 50 );
    fields[ 7 ] = new BooleanWebFormField( "do_stats", "true" );
    fields[ 8 ] = new BooleanWebFormField( "is_glossary", "true" );
    return fields;
  }

}
