//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.16 $
// $Date: 2005/05/03 21:21:30 $
//------------------------------------------------------------------------------ 
package org.tair.abrc.stock;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.text.DecimalFormat;

import org.tair.abrc.AbrcConstantCollection;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcOrdersStock;

import org.tair.utilities.DataConstants;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

/**
 * ListStock is a lightweight data class for displaying lists of order search
 * results.  Each instance of ListStock contains only the information needed 
 * for displaying data in a list view, and is useful for avoiding the 
 * relatively high cost of instantiating a full <code>Stock</code> object for
 * each search result. This class is used mostly for displaying stock search 
 * results, where order information such as order id & date are needed, but 
 * where the individual results represent stocks rather than entire orders.
 *
 * @see CompositeOrder
 * @see OrderSearcher
 * @see Stock
 */

public class ListStock {

    private Long stock_id;
    private String stock_number;

    // minimal order info. for displaying recent stock orders
    // as individual stock items w/out larger order structure
    private Long person_id;
    private Long person_community_id;
    private String firstName;
    private String lastName;
    private Long orders_id;
    private Long order_number;
    private java.util.Date order_date;
    private Boolean commercial;

    // contains order specific info for stock
    private TfcOrdersStock orders_stock;

    // if true, seed stock, if false DNA
    Boolean isSeed;

    // price for stock - from Stock table 
    // Determine whether to store commercial price or not based on 
    // commercial status of lab
    private String stock_price;

    // if true, use stock price instead of user fee
    private Boolean fixed_price;


    /**
     * Creates an empty instance of ListStock
     */
    public ListStock() {
	orders_stock = new TfcOrdersStock();
    }


    /**
     * Creates an instance of ListStock to represent the database record 
     * associated with the supplied order ID and the stock with stockID.
     *
     * @param conn An active connection to the database
     * @param orderID The id of the order to retrieve data for
     * @param stockID The id of the stock to retrieve data for
     * @throws SQLException thrown if invalid or null order ID is submitted,
     * if stockID is not part of order with order iD, or if an error occurs
     * while retrieving data from the database.
     */
    public ListStock( DBconnection conn, Long orderID, Long stockID ) 
	throws SQLException {

	populate( conn, orderID, stockID );
    }


    /**
     * Process and save results of query
     */
    private void processResults( DBconnection conn, String query )
	throws SQLException {

	boolean found = false;

	conn.setQuery( query );

	ResultSet results = conn.getResultSet();
	Long stockID = null;
	if ( results.next() ) {
	    found = true;
	    stockID = new Long( results.getLong( "stock_id" ) );
	    this.orders_id = new Long( results.getLong( "orders_id" ) );
	    this.order_number = new Long( results.getLong( "order_number" ) );
	    this.order_date = results.getDate( "order_date" );
	    this.person_community_id = 
		new Long( results.getLong( "person_community_id" ) );
	    
	    this.person_id = new Long( results.getLong( "person_id" ) );
	    this.firstName = results.getString( "first_name" );
	    this.lastName = results.getString( "last_name" );
	    this.stock_number = results.getString( "stock_name" );
	    
	    this.fixed_price = 
		TextConverter.stringToBoolean( 
		    results.getString( "fixed_price" ) );
		
	    this.stock_price = 
		get_format_stock_price( 
		    new Float( results.getFloat( "base_price" ) ) );

	    this.commercial = 
		TextConverter.stringToBoolean( 
		    results.getString( "commercial" ) );

	    this.isSeed = 
		TextConverter.stringToBoolean( 
		    results.getString( "is_seed" ) );

	    orders_stock = new TfcOrdersStock();

	    orders_stock.set_orders_id( 
		 new Long( results.getLong( "orders_id" ) ) );

	    set_stock_id( stockID  );
	    orders_stock.set_stock_id( stockID  );
	    orders_stock.set_status( results.getString( "stock_status" ) );
	    orders_stock.set_quantity( results.getInt( "quantity" ) );

	    orders_stock.set_waive_charge( 
		 results.getString( "waive_charge" ) );
	    
	    orders_stock.set_date_last_modified( 
	        results.getDate( "date_last_modified" ) );
	}
	conn.releaseResources();

	if ( !found ) {
	    throw new RecordNotFoundException( "No order found" );
	}
    }


    /**
     * Get order and stock data for this dna stock using stock id
     */
    private void populate( DBconnection conn, Long orderID, Long stockID ) 
	throws SQLException {

	String query = null;
	if ( orderID != null && stockID != null ) {
	    query =
		"SELECT o.orders_id, " +
		"o.order_date, " +
		"o.order_number, " +
		"o.person_id, " +
		"p.community_id AS person_community_id, " +
		"p.last_name, " +
		"p.first_name, " +
		"og.commercial, " +
		"os.stock_id, " +
		"os.status AS stock_status, " +
		"os.quantity, " +
		"os.waive_charge, " +
		"os.date_last_modified, " +
		"s.name AS stock_name, " +
		"s.base_price, " +
		"s.fixed_price, " +
		"s.is_seed " +
		"FROM Orders o, " +
		"Person p, " +
		"Organization og, " +
		"Orders_Stock os, " +
		"Stock s " +
		"WHERE o.person_id = p.person_id " +
		"AND o.organization_id = og.organization_id " +
		"AND o.orders_id = os.orders_id " +
		"AND os.stock_id = s.stock_id " +
		"AND os.orders_id = " + orderID.toString() + " " +
		"AND os.stock_id = " + stockID.toString();
	    processResults( conn, query );
      
	} else {
	    throw new RecordNotFoundException( "Invalid order or stock id" );
	}
    }



    /**
     * Set stock price for DNA stocks - convert to String & commercial 
     * price if necessary
     */
    private String get_format_stock_price( Float base_price ) {
	String formatStr = null;
	DecimalFormat df = null;
	float convertPrice;

	if ( base_price != null && base_price.floatValue() > 0 ) {
	    df = new DecimalFormat( "$0.00" );
	    convertPrice = base_price.floatValue();
	    if ( commercial != null && commercial.booleanValue() ) {
		AbrcConstantCollection constants = 
		    AbrcConstantCollection.getInstance();

		float multiplier = 
		    constants.getValue( "commercial stock" ).floatValue();

		convertPrice *= multiplier;
	    }
	    formatStr = df.format( convertPrice ); 
	}
	return formatStr;
    }      

    public final void set_orders_id( Long orders_id ) { 
	this.orders_id = orders_id; 
	orders_stock.set_orders_id( orders_id );
    }

    public final void set_order_number( Long order_number ) {
	this.order_number = order_number;
    }

    public final void set_stock_number( String name ) {
	this.stock_number = name;
    }

    public final void set_stock_id( Long id ) { 
	this.stock_id = id; 
    }

    public final void set_person_id( Long person_id ) {
	this.person_id = person_id; 
    }

    public final void set_person_community_id( Long person_community_id ) { 
	this.person_community_id = person_community_id;
    }

    public final void set_first_name( String name ) { 
	this.firstName = name;
    }

    public final void set_last_name( String name ) {
	this.lastName = name; 
    }

    public final void set_order_date( java.util.Date order_date ) {
	this.order_date = order_date;
    }

    public final void set_fixed_price( Boolean fixed_price ) { 
	this.fixed_price = fixed_price;
    }

    public final void set_stock_price( String stock_price ) { 
	this.stock_price = stock_price;
    }

    public final void set_stock_price( Float stock_price ) { 
	this.stock_price = get_format_stock_price( stock_price );
    }

    public final void set_commercial( Boolean commercial ) { 
	this.commercial = commercial; 
    }

    public final void set_is_seed( Boolean isSeed ) { 
	this.isSeed = isSeed;
    }

    public final String get_stock_number() {
	return stock_number;
    }  

    public final Long get_stock_id() {
	return stock_id;
    }

    public final Long get_person_id() { 
	return person_id;
    }

    public final Long get_person_community_id() {
	return person_community_id;
    }

    public final String get_first_name() { 
	return firstName; 
    }

    public final String get_last_name() { 
	return lastName;
    }

    public final Long get_orders_id() { 
	return orders_id; 
    }

    public final Long get_order_number() {
	return order_number;
    }

    public final java.util.Date get_order_date() {
	return order_date; 
    }

    public final Boolean get_fixed_price() {
	return fixed_price;
    }

    public final Boolean get_commercial() {
	return commercial;
    }

    public final Boolean get_is_seed() { 
	return isSeed; 
    }

    /**
     * Check fixed_price & return stock_price or null depending on 
     * whether this stock should have a charge
     */
    public final String get_stock_price() { 
	String retString = null;
	if ( fixed_price != null && fixed_price.booleanValue() ) {
	    retString = stock_price;
	}
	return retString;
    }
    
    //
    // TfcOrdersStock wrappers
    //
    public final void set_stock_status( String status ) {
	orders_stock.set_status( status );  
    }

    public final void set_quantity( int quantity ) {
	orders_stock.set_quantity( quantity );
    }

    public final void set_waive_charge( String waiver ) {
	orders_stock.set_waive_charge( waiver );
    }

    public final void set_date_last_modified( java.util.Date last_modified ) { 
	orders_stock.set_date_last_modified( last_modified ); 
    }

    public final void set_stock_charge( Float charge ) { 
	orders_stock.set_stock_charge( charge );
    }

    public final String get_stock_status() { 
	return orders_stock.get_status();
    }

    public final int get_quantity() { 
	return orders_stock.get_quantity();
    }

    public final String get_waive_charge() {
	return orders_stock.get_waive_charge();
    }

    public final java.util.Date get_date_last_modified() {
	return orders_stock.get_date_last_modified(); 
    }

    public final Float get_stock_charge() {
	return orders_stock.get_stock_charge(); 
    }

    /**
     * Shortcut method to determine is stock's status is "inactive" or not; 
     * this is needed frequently when doing stock counts in an order when only
     * active stocks should be counted.
     *
     * @return <code>true</code> if stock has an inactive status in current
     * order, or <code>false</code> if stock has any status besides "inactive" 
     * (including a null status)
     */
    public final boolean inactive() {
	return DataConstants.getInactiveStock().equals( get_stock_status() );
    }


    /**
     * Retrieves stock charge formatted in $US money format ($0.00)
     *
     * @return String containing formatted stock price, or null if stock has 
     * no base price
     */
    public final String get_format_stock_charge() {
	String formatStr = null;
	if ( get_stock_charge() != null &&
	     get_stock_charge().floatValue() > 0) {

	    DecimalFormat df = new DecimalFormat( "$0.00" );
	    formatStr = df.format( get_stock_charge() ); 
	}
	return formatStr;
    }

    /**
     * Retrieves formatted stock charge of stock if no waiver has been
     * granted for this stock as part of a stock order. If a waiver has been
     * granted, "waived" is returned. Using this method avoids having to do 
     * this comparison on the order display level
     *
     *@return Formatted string containing stock charge of this stock in US money
     * format, or "waived" if a  charge waiver has been granted for this stock 
     * in current order
     */
    public final String get_calculated_stock_charge() {
	String calculatedStr = null;
	if ( get_waive_charge() == null ) {
	    calculatedStr = get_format_stock_charge();
	} else {
	    calculatedStr = "waived";
	}

	return calculatedStr;
    }
  

    /**
     * Returns combination of first name and last name of person who placed 
     * the order. 
     *
     * @return String containing first name and last name
     */
    public String get_person_name() { 
	return get_first_name() + " " + get_last_name();
    }


    /** 
     * For unit testing only.
     */
    public void test() {
	System.out.println( "order id: " + get_orders_id() );
	System.out.println( "order number: " + get_order_number() );
	System.out.println( "person community id: " + 
			    get_person_community_id() );

	System.out.println( "person id: " + get_person_id() );
	System.out.println( "first name: " + get_first_name() );
	System.out.println( "last name: " + get_last_name() );

	System.out.println( "order_date: " + 
			    TextConverter.dateToString( get_order_date() ) );

	System.out.println( "stock_number: " + get_stock_number() );
	System.out.println( "fixed price: " + get_fixed_price() );
	System.out.println( "stock price: " + get_stock_price() );
	System.out.println( "commercial: " + get_commercial() );

	orders_stock.test();
    }

  
    public static void main( String args[] ) {
	try {
	    DBconnection conn = new DBconnection();
	    Long stockID = new Long( 88695 );
	    Long orderID = new Long( 100002 );
      
	    System.out.println( "Creating DNA stock..." );
	    ListStock stock = new ListStock( conn, orderID, stockID );
	    stock.test();
      
	    System.out.println( "Creating seed stock..." );
	    stockID = new Long( 203312 ); 
	    stock = new ListStock( conn, orderID, stockID );
	    stock.test();
      
	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }
  
}
