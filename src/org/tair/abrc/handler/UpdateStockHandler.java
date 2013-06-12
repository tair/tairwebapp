//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.8 $
// $Date: 2006/02/08 19:25:41 $
//------------------------------------------------------------------------------

package org.tair.abrc.handler;

import java.sql.*;
import java.util.*;
import javax.servlet.http.*;

import org.tair.community.*;
import org.tair.handler.*;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * UpdateStockHandler handles all requests to update a single stock record using
 * a web interface. Only updates of existing stocks can be done; new stock
 * additions must be done through manual database loading.
 */

public class UpdateStockHandler implements RequestHandler {

    /**
     * Processes requests for various tasks involved in updating a single stock
     * record. Update actions are determined by the submitted value of the
     * "update_action" request parameter. Valid values of update_action are:
     * 
     * <ul>
     * <li>new_update or <code>null</code> - redirects user to page where
     * they can identify stock to update by entering its stock number</li>
     * <li>search - creates TfcStock object for stock with submitted stock
     * number and redirects user to form where they can edit field values for
     * stock</li>
     * <li>update - updates stock with submitted form field values and saves
     * changes to the database</li>
     * </ul>
     * 
     * <p>
     * All actions in UpdateStockHandler are restricted to TAIR curators only.
     * 
     * @param request
     *            HttpServletRequest from OrderServlet
     * @return RequestHandlerResponse containing URL of JSP to redirect user to
     *         along with any objects needed for display.
     * @throws InvalidLoginException
     *             if user is not logged in
     * @throws UnauthorizedRequestException
     *             if user is not a TAIR curator
     * @throws SQLException
     *             if a database error occurs
     * @throws InvalidFormException
     *             if a validation error occurs when processing input from
     *             update form
     * @throws InvalidParameterException
     *             if an invalid update_action or stock id is received
     */
    public RequestHandlerResponse process( HttpServletRequest request )
        throws InvalidLoginException, UnauthorizedRequestException,
        SQLException, InvalidFormException, InvalidParameterException {

        // make sure user is a logged in TAIR curator before proceeding
        checkLogin( request );

        RequestHandlerResponse response = null;

        String updateAction = request.getParameter( "update_action" );

        // if stock to update hasn't been defined yet, redirect to
        // simple search page
        if ( updateAction == null || updateAction.equals( "new_update" ) ) {
            response = new RequestHandlerResponse();
            response.setPage( "/jsp/abrc/find_update_stock.jsp" );

            // find stock by stock number and display on maintenance page
        } else if ( updateAction.equals( "search" ) ) {
            response = searchStock( request );

            // take input from maintenance form and update stock
            // record with new values
        } else if ( updateAction.equals( "update" ) ) {
            response = updateStock( request );

        } else {
            throw new InvalidParameterException( "Invalid update action: "
                                                 + updateAction );
        }

        return response;
    }

    /**
     * Ensure that requesting user is logged in as curator
     * 
     * @throws InvalidLoginException
     *             if user not logged in
     * @throws UnauthorizedRequestException
     *             if user not TAIR curator
     */
    private void checkLogin( HttpServletRequest request )
        throws InvalidLoginException, UnauthorizedRequestException {

        if ( !LoginChecker.isLoggedIn( request ) ) {
            throw new InvalidLoginException( "User not logged in" );

        } else if ( !LoginChecker.isTairCurator( request ) ) {
            throw new UnauthorizedRequestException( "Not authorized for "
                                                    + "this resource" );
        }

    }

    /**
     * Creates a stock record for stock with submitted stock number and
     * redirects to maintenance page that displays stock field values and allows
     * updates.
     * 
     * <p>
     * If no stock found with submitted stock number, curator is redirected to a
     * no results page that allows her to search again
     * 
     * @param request
     *            HttpServletRequest from OrderServlet
     * @return RequestHandlerResponse containing stock object for submitted
     *         stock number and URL of JSP to redirect user to
     * @throws SQLException
     *             if a database error occurs
     * @throws InvalidFormException
     *             if no stock number submitted
     */
    private RequestHandlerResponse searchStock( HttpServletRequest request )
        throws SQLException, InvalidFormException {

        String stockNumber = request.getParameter( "stock_number" );
        if ( TextConverter.isEmpty( stockNumber ) ) {
            throw new InvalidFormException( "No stock number submitted" );
        }

        DBconnection conn = null;
        DBReadManager connectionPool = DBReadManager.getInstance();
        RequestHandlerResponse response = new RequestHandlerResponse();

        try {
            conn = connectionPool.get_connection();

            Long stockID = TfcStock.retrieveStockID( conn, stockNumber );
            if ( stockID != null ) {
                TfcStock stock = new TfcStock( conn, stockID );
                response.setAttribute( "stock", stock );
                response.setPage( "/jsp/abrc/update_stock.jsp" );
            } else {
                response.setPage( "/jsp/abrc/update_stock_not_found.jsp" );
            }

        } finally {
            connectionPool.return_connection( conn );
        }

        return response;
    }

    /**
     * Update stock with values from form submission and save stock record to
     * the database
     * 
     * @param request
     *            HttpServletRequest from OrderServlet
     * @throws SQLException
     *             if a database error occurs
     * @throws InvalidFormException
     *             if form submission is incorrect
     * @return RequestHandlerResponse with URL of JSP to redirect user to
     */
    private RequestHandlerResponse updateStock( HttpServletRequest request )
        throws InvalidFormException, SQLException {

        Map updateFields = validateFields( request );

        TfcStock stock = null;
        DBconnection conn = null;
        DBWriteManager connectionPool = DBWriteManager.getInstance();

        try {

            conn = connectionPool.get_connection();

            Long stockID = (Long) updateFields.get( "stock_id" );
            stock = new TfcStock( conn, stockID );
            updateStockFields( conn, stock, updateFields );

            // take auto-commit off to do stock/tair object
            // update as single transaction
            conn.remove_auto_commit_mode();
            stock.store( conn );
            conn.commit(); // commit transaction if no errors occured above

            // rollback transaction if any exceptions occur
        } catch ( Exception e ) {
            conn.rollback();
            // propagate exception as SQLException to let
            // the rest of the world know
            throw new SQLException( "Error storing stock: " + e.getMessage() );

        } finally {
            conn.set_auto_commit_mode(); // set auto-commit back on
            conn.releaseResources();
            connectionPool.return_connection( conn );
        }

        RequestHandlerResponse response = new RequestHandlerResponse();
        response.setAttribute( "stock", stock );
        response.setPage( "/jsp/abrc/stock_updated.jsp" );

        return response;

    }

    /**
     * Retrieves and validate form fields by creating an array of WebFormFields
     * where each field represents a form field submission, then retrieving and
     * validating each form field according to rules set in createWebFormFields.
     * 
     * @param request
     *            HttpServletRequest request from OrderServlet
     * @return Map containing validated form field values with field name as
     *         <code>String</code> key referencing type specific Object for
     *         each field
     * @throws InvalidFormException
     *             if any there are any validation errors with form submission
     */
    private Map validateFields( HttpServletRequest request )
        throws InvalidFormException {

        List fields = createWebFormFields();
        Map errors = new HashMap();
        Map values = new HashMap();

        //
        // Iterate through fields and validate each - save
        // validated web form value in values map with field
        // name as key.
        //
        // Save all validation errors to throw single exception
        // with all messages
        //
        WebFormField field = null;
        Iterator iter = fields.iterator();
        while ( iter.hasNext() ) {
            field = (WebFormField) iter.next();

            try {
                values.put( field.getFieldName(), field.validate( request ) );
            } catch ( InvalidParameterException ipe ) {
                errors.put( field.getFieldName(), ipe.getMessage() );
            }
        }

        if ( !errors.isEmpty() ) {
            throw new InvalidFormException( errors, "Errors on form submission" );
        }

        return values;
    }

    /**
     * Create List of web form field objects to retrieve and validate all input
     * values from web form
     */
    private List createWebFormFields() {

        ArrayList fields = new ArrayList();

        // create numeric fields - params are field name and whether
        // field is required
        fields.add( new LongWebFormField( "stock_id", true ) );
        fields.add( new LongWebFormField( "stock_type_id", true ) );
        fields.add( new LongWebFormField( "stock_availability_type_id", true ) );
        fields.add( new LongWebFormField( "number_in_set", false ) );
        fields.add( new FloatWebFormField( "base_price", true ) );
        fields.add( new FloatWebFormField( "express_shipping_charge", false ) );
        fields.add( new IntegerWebFormField( "num_lines", false ) );

        // create boolean fields - params are field name and String value to
        // consider a Boolean true
        fields.add( new BooleanWebFormField( "is_seed", "true" ) );
        fields.add( new BooleanWebFormField( "fixed_price", "true" ) );
        fields.add( new BooleanWebFormField( "is_restricted", "true" ) );
        fields.add( new BooleanWebFormField( "is_molecular_mapping", "true" ) );
        fields.add( new BooleanWebFormField( "is_classical_mapping", "true" ) );
        fields.add( new BooleanWebFormField( "NASC_request", "true" ) );
        fields.add( new BooleanWebFormField( "NASC_request_fee", "true" ) );
        fields.add( new BooleanWebFormField( "has_stock_notes", "true" ) );
        fields.add( new BooleanWebFormField( "MTA_signature", "true" ) );
        fields.add( new BooleanWebFormField( "is_obsolete", "true" ) );
        fields.add( new BooleanWebFormField( "express_shipping_required",
                                             "true" ) );

        // create text fields - params are field name, whether field is
        // required, and maximum number of characters allowed
        fields.add( new WebFormField( "description", false, 2500 ) );
        fields.add( new WebFormField( "format_received", false, 20 ) );
        fields.add( new WebFormField( "maintenance_method", false, 255 ) );
        fields.add( new WebFormField( "media", false, 20 ) );
        fields.add( new WebFormField( "growth_temperature", false, 20 ) );
        fields.add( new WebFormField( "duration_of_growth", false, 20 ) );
        fields.add( new WebFormField( "format_shipped", false, 100 ) );
        fields.add( new WebFormField( "kit_contents", false, 255 ) );
        fields.add( new WebFormField( "box", false, 20 ) );
        fields.add( new WebFormField( "position", false, 20 ) );
        fields.add( new WebFormField( "location", false, 50 ) );
        fields.add( new WebFormField( "ABRC_comments", false, 1500 ) );

        // create date fields - params are field name and whether
        // field is required
        fields.add( new DateWebFormField( "date_entered", false ) );
        fields.add( new DateWebFormField( "release_date", false ) );
        fields.add( new DateWebFormField( "date_last_modified", true ) );

        return fields;
    }

    /**
     * Retrieve all stock properties from validated collection of web form field
     * values and update stock object with new values
     * 
     * @param conn
     *            An active connection to the database
     * @param stock
     *            Stock to update
     * @param values
     *            Map of validated stock properties with field name as
     *            <code>String</code> key referencing typed value for that
     *            field
     */
    private void updateStockFields( DBconnection conn,
                                   TfcStock stock,
                                   Map values ) throws SQLException {

        // stock type and stock availability type are stored as
        // foreign keys to values in lookup tables - if this values
        // are changing, do a quick translation to update text
        // version of type stored within Tfc object as well to
        // ensure display value is in synch.
        Long stockTypeID = (Long) values.get( "stock_type_id" );
        if ( !stockTypeID.equals( stock.get_stock_type_id() ) ) {
            TfcStockType stockType = new TfcStockType( stockTypeID );
            stock.set_stock_type_id( stockTypeID );
            stock.set_stock_type( stockType.get_stock_type() );
        }

        Long stockAvailabilityTypeID = 
            (Long) values.get( "stock_availability_type_id" );

        Long currentAvailabilityId = stock.get_stock_availability_type_id();
        if ( !stockAvailabilityTypeID.equals( currentAvailabilityId ) ) {
            TfcStockAvailabilityType availabilityType = 
                new TfcStockAvailabilityType( stockAvailabilityTypeID );
            stock.set_stock_availability_type_id( stockAvailabilityTypeID );

            String availabilityTypeStr = availabilityType.get_stock_availability_type(); 
            stock.set_stock_availability_type( availabilityTypeStr );
        }

        stock.set_number_in_set( (Long) values.get( "number_in_set" ) );
        stock.set_base_price( (Float) values.get( "base_price" ) );

        Float charge = (Float) values.get( "express_shipping_charge" );
        stock.set_express_shipping_charge( charge );

        Boolean expressRequired = 
            (Boolean) values.get( "express_shipping_required" );
        
        stock.set_express_shipping_required( expressRequired );

        stock.set_num_lines( (Integer) values.get( "num_lines" ) );
        stock.set_is_seed( (Boolean) values.get( "is_seed" ) );
        stock.set_fixed_price( (Boolean) values.get( "fixed_price" ) );
        stock.set_is_restricted( (Boolean) values.get( "is_restricted" ) );

        Boolean isMolecular = (Boolean) values.get( "is_molecular_mapping" );
        stock.set_is_molecular_mapping( isMolecular );

        Boolean isClassical = (Boolean) values.get( "is_classical_mapping" ); 
        stock.set_is_classical_mapping( isClassical );

        stock.set_NASC_request( (Boolean) values.get( "NASC_request" ) );
        stock.set_NASC_request_fee( (Boolean) values.get( "NASC_request_fee" ) );

        stock.set_has_stock_notes( (Boolean) values.get( "has_stock_notes" ) );
        stock.set_MTA_signature( (Boolean) values.get( "MTA_signature" ) );
        stock.set_is_obsolete( (Boolean) values.get( "is_obsolete" ) );

        stock.set_format_received( (String) values.get( "format_received" ) );

        String method = (String) values.get( "maintenance_method" );
        stock.set_maintenance_method( method );

        stock.set_media( (String) values.get( "media" ) );

        String growthTemp = (String) values.get( "growth_temperature" );
        stock.set_growth_temperature( growthTemp );

        String duration = (String) values.get( "duration_of_growth" );
        stock.set_duration_of_growth( duration );

        stock.set_format_shipped( (String) values.get( "format_shipped" ) );
        stock.set_kit_contents( (String) values.get( "kit_contents" ) );
        stock.set_box( (String) values.get( "box" ) );
        stock.set_position( (String) values.get( "position" ) );
        stock.set_location( (String) values.get( "location" ) );
        stock.set_ABRC_comments( (String) values.get( "ABRC_comments" ) );

        stock.set_date_entered( (java.util.Date) values.get( "date_entered" ) );
        stock.set_release_date( (java.util.Date) values.get( "release_date" ) );
        
        java.util.Date dateLastModified =
            (java.util.Date) values.get( "date_last_modified" ); 
        
        stock.set_date_last_modified( dateLastModified );

        stock.set_description( (String) values.get( "description" ) );
    }

}
