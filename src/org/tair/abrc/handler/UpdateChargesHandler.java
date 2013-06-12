//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.6 $
// $Date: 2006/08/09 18:14:34 $
//------------------------------------------------------------------------------

package org.tair.abrc.handler;

import java.sql.SQLException;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.tair.abrc.CompositeOrder;
import org.tair.abrc.payment.CompositeInvoice;
import org.tair.abrc.payment.PriceCalculator;
import org.tair.abrc.payment.creditcard.CreditCardController;
import org.tair.abrc.stock.Stock;

import org.tair.community.LoginChecker;

import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;

import org.tair.tfc.DBconnection;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.TfcLineItem;

import org.tair.utilities.BooleanWebFormField;
import org.tair.utilities.CompoundWebFormField;
import org.tair.utilities.CompoundVector;
import org.tair.utilities.DataConstants;
import org.tair.utilities.FloatWebFormField;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.TextConverter;
import org.tair.utilities.UnauthorizedRequestException;
import org.tair.utilities.WebFormField;

/**
 * UpdateChargesHandler handles curator actions to update line item charges for
 * an order.
 */

public class UpdateChargesHandler implements RequestHandler {

    /**
     * Processes curator actions to update line item charges for an order.
     * Curator can adjust stock unit prices, line item totals, all order charges
     * including express shipping charge and phytosanitary charge and apply
     * waivers to either individual stocks or the entire order.
     * 
     * <p>
     * Method uses an "update_action" request parameter to determine what
     * actions to take. If update_action is null, curator is redirected to the
     * main JSP for updating charges. If update_action = "update" order charges
     * will be adjusted according to form input params received.
     * 
     * @param request
     *            <code>HttpServletRequest</code> passed from
     *            <code>OrderServlet</code>
     * @return <code>RequestHandlerResponse</code> containing URL to redirect
     *         user to
     * @throws InvalidActionException
     *             if order is missing data when trying to save stock order to
     *             database
     * @throws InvalidFormException
     *             thrown if invalid form data is submitted
     * @throws InvalidLoginException
     *             thrown if user is not logged in
     * @throws InvalidParameterException
     *             thrown if an invalid order is received
     * @throws UnauthorizedRequestException
     *             if user is not
     * @throws SQLException
     *             thrown if an error occurs while storing stock order to the
     *             database
     */
    public RequestHandlerResponse process( HttpServletRequest request )
            throws InvalidActionException, InvalidFormException,
            InvalidParameterException, InvalidLoginException,
            UnauthorizedRequestException, SQLException {

        // only logged in curators are allowed past this point
        if ( !LoginChecker.isLoggedIn( request ) ) {
            throw new InvalidLoginException( "User not logged in" );

        } else if ( !LoginChecker.isTairCurator( request ) ) {
            throw new UnauthorizedRequestException( "Not authorized for "
                    + "this resource" );
        }

        CompositeOrder order = getOrder( request );

        // retrieve form input and update if requested
        String updateAction = request.getParameter( "update_action" );
        if ( updateAction != null && updateAction.equals( "update" ) ) {
            updateCharges( request, order );
        }

        RequestHandlerResponse response = new RequestHandlerResponse();
        response.setPage( "/jsp/abrc/payment/update_charges.jsp" );
        response.setAttribute( "order", order );

        return response;

    }

    /**
     * Creates a CompositeOrder object using orders_id submitted in request.
     * 
     * @param request
     *            Servlet request
     * @return CompositeOrder created for submitted orders_id
     * @throws InvalidParameterException
     *             if orders_id is missing or invalid
     * @throws SQLException
     *             if an error occurs while retrieving order data
     */
    private CompositeOrder getOrder( HttpServletRequest request )
            throws InvalidParameterException, SQLException {

        String ordersIDstr = request.getParameter( "orders_id" );
        if ( TextConverter.isEmpty( ordersIDstr ) ) {
            throw new InvalidParameterException( "Invalid order id: "
                    + ordersIDstr );
        }

        CompositeOrder order = null;
        Long ordersID = null;
        DBconnection conn = null;
        DBReadManager connPool = DBReadManager.getInstance();

        try {

            ordersID = new Long( ordersIDstr );
            conn = connPool.get_connection();
            order = new CompositeOrder( conn, ordersID );

        } catch ( NumberFormatException nfe ) {
            throw new InvalidParameterException( "Invalid order id: "
                    + ordersIDstr );
        } finally {
            connPool.return_connection( conn );
        }

        return order;
    }

    /**
     * Retrieves submitted form values and updates charges for stock order with
     * those values.
     * 
     * @param request
     *            Servlet request
     * @param order
     *            Order to update charges for
     * @throws InvalidActionException
     *             if charge adjustments violate any logical constraints
     * @throws InvalidFormException
     *             if invalid form values received
     * @throws SQLException
     *             if a database error occurs while storing updates to database
     */
    private void updateCharges( HttpServletRequest request, CompositeOrder order )
            throws InvalidActionException, InvalidFormException, SQLException {

        // get validated form input from request
        Map formValues = getFormValues( request );

        // waive all charges for order if requested
        Boolean noCharge = (Boolean) formValues.get( "no_charge" );
        if ( noCharge != null && noCharge.booleanValue() ) {
            waiveAllCharges( order );

            // else set individual charges for stocks and line items
        } else {

            // set individual prices for stocks
            updateStockCharges( formValues, order );

            // set any waivers for individual stocks
            updateStockWaivers( formValues, order );

            // set other line item charges for order
            Float charge = (Float) formValues.get( "order_charge" );
            String type = DataConstants.getOrderChargeLineItem();
            updateLineItem( order, type, charge );

            charge = (Float) formValues.get( "express_shipping_charge" );
            type = DataConstants.getExpressShippingLineItem();
            updateLineItem( order, type, charge );

            charge = (Float) formValues.get( "phytosanitary_charge" );
            type = DataConstants.getPhytosanitaryChargeLineItem();
            updateLineItem( order, type, charge );

            // update phytosanitary charge status if submitted
            updatePhytosanitaryStatus( order, formValues );

            // check for increase/decrease in invoice charges
            validateInvoiceCharges( order );

        }

        storeOrder( order );
    }

    /**
     * Stores order to database
     * 
     * @param order
     *            Order to store
     * @throws InvalidActionException
     *             if order is in an invalid state and cannot be stored
     * @throws SQLException
     *             if a database error occurs
     */
    private void storeOrder( CompositeOrder order )
            throws InvalidActionException, SQLException {

        DBWriteManager connPool = DBWriteManager.getInstance();
        DBconnection conn = null;

        try {

            conn = connPool.get_connection();
            System.out.println("DEBUG [HLP-837] : Update order.store FROM UpdateChargesHandler.storeOrder");
            order.store( conn );
        } finally {
            connPool.return_connection( conn );
        }

    }

    /**
     * Validates invoice charges for order after all price adjustments have been
     * done.
     * 
     * An exception will be thrown if order's price has increased from initial
     * amount quoted when it was placed - this is not allowed by system's rules
     * because of various issues with invoicing and credit card payments.
     * 
     * <p>
     * If total price of order has been decreased from initial amount, a partial
     * void will be issued for any credit card orders.
     * 
     * @param order
     *            Order to validate charges for
     * @throws InvalidActionException
     *             if order charges are increased past original amount
     */
    private void validateInvoiceCharges( CompositeOrder order )
            throws InvalidActionException {

        CompositeInvoice invoice = order.getInvoice();

        float total = invoice.get_invoice_total().floatValue();
        float origTotal = 0;
        
        System.out.println("UpdateChargesHandler: validateInvoiceCharges" + total);
        // auth_amount represents original total for cc orders
        if ( invoice.isCreditCard() ) {
            origTotal = invoice.get_auth_amount().floatValue();

            // value currently stored in db (as opposed to total calculated
            // from line items) is best source of orig. total for po orders
        } else {
            origTotal = invoice.getLastInvoiceTotal().floatValue();
        }

        if ( total > origTotal ) {
            throw new InvalidActionException( "Cannot increase order charges" );

            // do partial void of cc auth amount if amount has decreased - if
            // new total is zero, do a full void
        } else if ( invoice.isCreditCard() && origTotal >= total ) {
            if ( total == 0 ) {
                try {
                    CreditCardController.fullVoid( invoice );
                    invoice.set_status(DataConstants.getCancelledInvoice() );
                } catch(Exception e) { e.printStackTrace(); }
            } //***commented this out as partial void is not working correctly
            //} else {
            //    CreditCardController.partialVoid( invoice );
            //}
        } else if ( !invoice.isCreditCard() && origTotal >= total ) {
            if ( total == 0 ) {
                invoice.set_status(DataConstants.getCancelledInvoice() );
            }
        }
    }

    /**
     * Updates charge waivers for individual stocks. Line item charges will be
     * adjusted accordingly - if a waiver is being added, existing line item
     * charge and unit price of stock will be set to zero. If waiver is being
     * removed, unit price of stock will be set to whatever current value is in
     * Stock table and a new line item will be created.
     * 
     * @param formValues
     *            Map of submitted form values with field name as key
     *            referencing submitted value.
     * @param order
     *            Order to set stock waivers for
     * @throws InvalidActionException
     *             if trying to set a waiver for a stock that has already been
     *             paid for.
     */
    private void updateStockWaivers( Map formValues, CompositeOrder order )
            throws InvalidActionException {

        // Waivers retrieved from form request as a CompoundVector that
        // holds stock number as key referencing any submitted charge
        // waivers for that stock
        CompoundVector waiveCharges = (CompoundVector) formValues
                .get( "waive_charge" );

        CompositeInvoice invoice = order.getInvoice();

        if ( waiveCharges != null && waiveCharges.size() > 0 ) {
            for ( int i = 0; i < waiveCharges.size(); i++ ) {

                String stockNumber = (String) waiveCharges.getKeyAt( i );
                String waiver = (String) waiveCharges.getValueAt( i );
                Stock stock = order.getStock( stockNumber );
                String currentWaiver = stock.get_waive_charge();

                if ( updateWaiver( currentWaiver, waiver ) ) {

                    // cannot alter waiver if stock has already been paid for -
                    // UI shouldn't allow this, but check just in case
                    if ( invoice.stockItemPaid( stock.get_stock_id() ) ) {
                        throw new InvalidActionException( "Cannot set waiver "
                                + "for stock with a " + "payment" );
                    }

                    // if removing waiver, set NULL for waiver value
                    // and try to calculate stock charge and line item
                    if ( waiver.equals( DataConstants.getNoWaiver() ) ) {
                        String nullWaiver = null;
                        stock.set_waive_charge( nullWaiver );
                        stock.set_stock_charge( stock.get_base_price() );
                        PriceCalculator.getStockLineItem( order, stock );

                        // if setting waiver set stock charge to zero and
                        // remove line item
                    } else {
                        stock.set_waive_charge( waiver );
                        stock.set_stock_charge( new Float( 0 ) );
                        invoice.removeStockCharge( stock.get_stock_id() );
                    }
                }
            }
        }
    }

    /**
     * Utility method to determine if stock charge waiver should be updated from
     * current value in the db to submitted value from form. This decision is
     * complicated a bit by the fact that "no waiver" is submitted with a value,
     * instead of NULL or empty string.
     * 
     * update waiver if: - stock currently has no waiver and waiver requested -
     * stock currently has waiver and waiver is being removed - stock currently
     * has waiver and a different waiver is being set
     * 
     * @param currentWaiver
     *            Current value of stock's waive_charge field
     * @param newWaiver
     *            Form value submitted for stock waiver
     * @return <code>true</code> if stock waiver should be updated or
     *         <code>false</code> if waiver should be left as is
     */
    private boolean updateWaiver( String currentWaiver, String newWaiver ) {
        boolean updateWaiver = false;

        String noWaiver = DataConstants.getNoWaiver();

        if ( currentWaiver == null && !newWaiver.equals( noWaiver ) ) {
            updateWaiver = true;

        } else if ( currentWaiver != null && newWaiver.equals( noWaiver ) ) {
            updateWaiver = true;

        } else if ( currentWaiver != null && !currentWaiver.equals( newWaiver ) ) {
            updateWaiver = true;
        }
        return updateWaiver;
    }

    /**
     * Updates status for existing, unpaid phytosanitary charge line items. 
     * Status will only be set if
     * charge exists within the order already.
     * 
     * @param order
     *            Order to update phytosanitary charge status for
     * @param formValues
     *            Submitted values from form
     */
    private void updatePhytosanitaryStatus( CompositeOrder order, Map formValues ) {
        String phytoStatus = (String) formValues.get( "phyto_status" );
        CompositeInvoice invoice = order.getInvoice();
        TfcLineItem item = invoice.getPhytosanitaryLineItem();

        if ( phytoStatus != null && item != null ) {
            item.set_status( phytoStatus );
        }
    }

    /**
     * Retrieves all form values from request and validates them.
     * 
     * @param request
     *            Servlet request
     * @return Map containing validated form values from request with form field
     *         name as String key referencing strongly typed value for that
     *         field.
     * @throws InvalidFormException
     *             if invalid form input is received
     */
    private Map getFormValues( HttpServletRequest request )
            throws InvalidFormException {

        // get list of WebFormField objects that represent form fields;
        WebFormField[] fields = getFormFields();

        //
        // Iterate through fields and validate each - save
        // validated web form value in values map with field
        // name as key.
        //
        // Save all validation errors to throw single exception
        // with all messages
        //
        Map values = new HashMap();
        Map errors = new HashMap();

        for ( int i = 0; i < fields.length; i++ ) {
            try {
                values.put( fields[i].getFieldName(), fields[i]
                        .validate( request ) );
            } catch ( InvalidParameterException ipe ) {
                errors.put( fields[i].getFieldName(), ipe.getMessage() );
            }
        }

        // validate individual stock prices and convert CompoundVector
        // to a map for simplicity
        validateStockCharges( values, errors );

        if ( !errors.isEmpty() ) {
            throw new InvalidFormException( errors, "Errors on form submission" );
        }

        return values;
    }

    /**
     * Utility method to ensure that all submitted stock charge values are valid
     * numbers. While validating, stock charge values are also converted from
     * the CompoundVector that CompoundWebFormField returned from servlet
     * request into a generic Map where stock number simply references its
     * charges. This is easier to understand and deal with, especially since
     * capabilites of CompoundVector aren't needed here.
     * 
     * <p>
     * Validation errors will be added to submitted map of errors.
     * 
     * @param values
     *            Map of values retrieved from servlet request
     * @param errors
     *            Validation errors encountered up to this point
     */

    private void validateStockCharges( Map values, Map errors ) {
        // check to ensure that stock prices are good numeric values and
        // convert CompoundVector to a simple map
        CompoundVector stockCharges = (CompoundVector) values
                .get( "stock_charge" );

        Map converted = new HashMap();

        if ( stockCharges != null ) {
            for ( int i = 0; i < stockCharges.size(); i++ ) {
                String stockNumber = (String) stockCharges.getKeyAt( i );
                String chargeStr = (String) stockCharges.getValueAt( i );
                Float charge = null;

                if ( TextConverter.isEmpty( chargeStr ) ) {
                    charge = new Float( 0 );
                } else {
                    try {
                        charge = new Float( chargeStr );
                    } catch ( NumberFormatException nfe ) {
                        errors.put( stockNumber, "Invalid stock charge for: "
                                + stockNumber );
                    }
                }
                converted.put( stockNumber, charge );
            }
        }

        // replace stock_charge value with converted Map
        values.put( "stock_charge", converted );
    }

    /**
     * Retrieves WebFormField objects to use for retrieving and validating input
     * from form.
     * 
     * @return Array of WebFormField objects for use in retrieving data from
     *         form.
     */
    private WebFormField[] getFormFields() {
        WebFormField[] fields = new WebFormField[7];

        fields[0] = new CompoundWebFormField( "waive_charge", false, 50,
                "waive_charge_", false );

        fields[1] = new CompoundWebFormField( "stock_charge", false, 50,
                "stock_charge_", false );

        fields[2] = new FloatWebFormField( "order_charge", false );
        fields[3] = new FloatWebFormField( "express_shipping_charge", false );
        fields[4] = new FloatWebFormField( "phytosanitary_charge", false );
        fields[5] = new BooleanWebFormField( "no_charge", "T" );
        fields[6] = new WebFormField( "phyto_status", false );

        return fields;
    }

    /**
     * Utility method to update line item of submitted type to submitted charge.
     * This includes setting a non-zero charge to zero, or creating a new charge
     * where one hadn't been invoiced before.
     * 
     * <p>
     * This method should be used to set an order's order charge, phytosanitary
     * charge and express shipping charge NOT stock charges. Stock charges must
     * be individually adjusted through the setStockCharges method
     * 
     * @param order
     *            Stock order to update charges for
     * @param type
     *            Line item type to adjust
     * @param charge
     *            Charge to set for line item
     */
    private void updateLineItem( CompositeOrder order, String type, Float charge ) {
        CompositeInvoice invoice = order.getInvoice();
        TfcLineItem item = invoice.getItemType( type );

        // if charge is null, do nothing as it means item was displayed
        // read only
        if ( charge != null ) {
            // if submitted charge is zero remove line item from invoice
            if ( charge.floatValue() <= 0 ) {
                if ( item != null ) {
                    invoice.removeLineItem( item );
                }

                // else if charge submitted update line item to new charge
            } else {

                if ( item == null ) {

                    // utility method in PriceCalculator will create and
                    // initialize line item as well as add it to invoice
                    item = PriceCalculator.getLineItem( order, type );
                }
                item.set_amount( charge );
            }
        }
    }

    /**
     * Waives all charges for order including all stock charges and any
     * order/shipping/phytosanitary charges. If order has a credit card
     * authorization associated to it, it will be completely voided. If any line
     * item charges have already been paid for, an exception will be thrown and
     * action will not be allowed.
     * 
     * @param order
     *            Order to waive charges for
     * @throws InvalidActionException
     *             if order charges cannot be waived
     */
    private void waiveAllCharges( CompositeOrder order )
            throws InvalidActionException {

        CompositeInvoice invoice = order.getInvoice();
        if ( invoice.hasPayments() ) {
            throw new InvalidActionException( "Cannot waive charges for order "
                    + "if payments have already been " + "made" );
        }

        order.set_no_charge( new Boolean( true ) );

        // set "curator" waivers for all stocks in order
        Stock stock = null;
        String waiver = DataConstants.getCuratorNoCharge();
        for ( Iterator iter = order.getStocks(); iter.hasNext(); ) {
            stock = (Stock) iter.next();
            stock.set_waive_charge( waiver );
            stock.set_stock_charge( new Float( 0 ) );
        }

        // clear all invoice line item charges and set invoice status to
        // "cancelled"
        invoice.removeAllCharges();
        invoice.set_status( DataConstants.getCancelledInvoice() );

        // do a full void of any credit card authorizations
        if ( invoice.isCreditCard() ) {

            // will throw exception if communications error
            // occurs while talking to remote service
            try{ CreditCardController.fullVoid( invoice ); }
            catch (Exception e) { e.printStackTrace(); }
        }
    }

    /**
     * Sets unit prices and line item charges for individual stocks in order.
     * 
     * @param formValues
     *            Map of submitted form values with field name as key
     *            referencing submitted value.
     * @param order
     *            Order to update
     * @throws InvalidParameterException
     *             if an invalid stock number received,
     * @throws InvalidFormException
     *             if invald stock price received
     */
    private void updateStockCharges( Map formValues, CompositeOrder order ) {

        // get map of charges submitted for stocks with stock number as key
        // referencing unit price
        Map stockCharges = (Map) formValues.get( "stock_charge" );

        // set today's date for price changes
        java.util.Date dateModified = new java.util.Date();

        Stock stock = null;
        String stockNumber = null;
        Float charge = null;
        Float newItemCharge = null;
        TfcLineItem item = null;

        Iterator iter = stockCharges.keySet().iterator();
        while ( iter.hasNext() ) {
            stockNumber = (String) iter.next();
            stock = order.getStock( stockNumber );
            charge = (Float) stockCharges.get( stockNumber );

            // only update if new charge is different from value already set
            if ( !charge.equals( stock.get_stock_charge() ) ) {
                stock.set_stock_charge( charge );
                stock.set_order_date_last_modified( dateModified );

                // update line item for stock - new item will be
                // initialized by PriceCalculator if it doesn't
                // already exist
                item = PriceCalculator.getStockLineItem( order, stock );
                newItemCharge = PriceCalculator.getStockCharge( stock );
                item.set_amount( newItemCharge );
            }
        }
    }

}
