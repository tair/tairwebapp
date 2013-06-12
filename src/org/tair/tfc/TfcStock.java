//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.43 $
// $Date: 2006/07/26 22:01:33 $
//------------------------------------------------------------------------------

package org.tair.tfc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

import org.jboss.logging.Logger;
import org.tair.abrc.AbrcConstantCollection;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;




/** 
 * TfcStock maps to the Stock table in the tair database. Each instance maps one 
 * row of data. Each data object maps to one field of a row in the table. Each 
 * field has one set method and one get method for accessing from outside of 
 * class.
 */

public class TfcStock extends TfcTairObject {
  private static final Logger logger = Logger.getLogger(TfcStock.class);

    private Long stock_id;
    private Long stock_type_id;
    private String stock_type;
    private Long stock_availability_type_id;
    private String stock_availability_type;
    private Boolean fixed_price;
    private Float base_price;
    private Float express_shipping_charge;
    private Boolean express_shipping_required;
    private String description;
    private String name;
    private Boolean is_seed;
    private Boolean is_restricted;
    private Boolean is_molecular_mapping;
    private Boolean is_classical_mapping;
    private Boolean NASC_request;
    private Boolean NASC_request_fee;
    private String format_received;
    private String maintenance_method;
    private String media;
    private String growth_temperature;
    private String duration_of_growth;
    private String format_shipped;
    private String kit_contents;
    private Long number_in_set;
    private Integer num_lines;
    private String box;
    private String position;
    private String location;
    private Boolean has_stock_notes;
    private Boolean MTA_signature;
    private String ABRC_comments;
    private java.util.Date date_last_modified;
    private java.util.Date release_date;
    private Boolean is_obsolete;
    private String original_name;
    private java.util.Date date_entered;
    private String stock_availability_comment;

    /**
     * Creates an empty instance of TfcStock
     */
    public TfcStock() {
        super();
    }


    /**
     * Creates an instance of TfcStock that maps the row in Stock table with 
     * the supplied stock_id.
     *
     * @param conn An active connection to the database
     * @param stock_id The stock_id to use for retrieving information
     * @throws SQLException thrown if an error occurs while retrieving 
     * information, or if supplied value for stock_id does not map to a valid 
     * row in the Stock table
     */
    public TfcStock( DBconnection conn, Long stock_id ) throws SQLException {
        super( conn, stock_id );   
    }

    /**
     * Implements abstract method in superclass to return "Stock" as name 
     * of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "Stock";
    }

    /**
     * Implements abstract method in superclass to return "stock_id" as name
     * of primary key column to use when creating SQL statement for object 
     * population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "stock_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all Stock specific columns to be included in SQL SELECT statement
     * when populating object.
     *
     * @return String array of all columns to include in SELECT statment
     * when populating object.
     */
    public final String[] getColumns() {

	String[] localClassColumns = new String[] {
	    "stock_id", 
	    "stock_type_id", 
	    "stock_availability_type_id", 
	    "fixed_price", 
	    "base_price", 
	    "express_shipping_charge",
	    "express_shipping_required",
	    "description", 
	    "name", 
	    "is_seed",
	    "is_restricted", 
	    "is_molecular_mapping", 
	    "is_classical_mapping", 
	    "NASC_request", 
	    "NASC_request_fee", 
	    "format_received", 
	    "maintenance_method", 
	    "media", 
	    "growth_temperature", 
	    "duration_of_growth", 
	    "format_shipped", 
	    "kit_contents", 
	    "number_in_set", 
	    "num_lines", 
	    "box", 
	    "position", 
	    "location", 
	    "has_stock_notes", 
	    "MTA_signature", 
	    "ABRC_comments", 
	    "date_last_modified", 
	    "release_date", 
	    "is_obsolete", 
	    "date_entered",
	    "original_name",
	    "stock_availability_comment"
	};
	
	return localClassColumns;
    }


    /**
     * Retrieves Stock specific data from result set and store in member 
     * variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	set_stock_id( new Long( results.getLong( "stock_id" ) ) ); 
	set_stock_type_id( new Long( results.getLong( "stock_type_id" ) ) );
	set_stock_availability_type_id( 
	    new Long( results.getLong( "stock_availability_type_id" ) ) );

	set_fixed_price( 
	    TextConverter.stringToBoolean( results.getString( "fixed_price" ) ) );

	set_base_price( new Float( results.getFloat( "base_price" ) ) );
	set_description(DBconnection.getClob(results, "description"));
	set_name( results.getString( "name" ) );
	set_is_seed( 
	    TextConverter.stringToBoolean( results.getString( "is_seed" ) ) );

	set_is_restricted( 
	    TextConverter.stringToBoolean( results.getString( "is_restricted" ) ) );
	
	set_is_molecular_mapping( 
	    TextConverter.stringToBoolean( results.getString( "is_molecular_mapping" ) ) );

	set_is_classical_mapping( 
	    TextConverter.stringToBoolean( results.getString( "is_classical_mapping" ) ) );

	set_NASC_request( 
	    TextConverter.stringToBoolean( results.getString( "NASC_request" ) ) );
	set_NASC_request_fee( 
	    TextConverter.stringToBoolean( results.getString( "NASC_request_fee" ) ) );

	set_format_received( results.getString( "format_received" ) );
	set_maintenance_method( results.getString( "maintenance_method" ) );
	set_media( results.getString( "media" ) );
	set_growth_temperature( results.getString( "growth_temperature" ) );
	set_duration_of_growth( results.getString( "duration_of_growth" ) );
	set_format_shipped( results.getString( "format_shipped" ) );
	set_kit_contents( results.getString( "kit_contents" ) );
	
	long l = results.getLong( "number_in_set" );
	if ( !results.wasNull() ) {
	    set_number_in_set( new Long( l ) );
	}
	
	int i = results.getInt( "num_lines" );
	if ( !results.wasNull() ) {
	    set_num_lines( new Integer( i ) );
	}

	float f = results.getFloat( "express_shipping_charge" );
	if ( !results.wasNull() ) {
	    set_express_shipping_charge( new Float( f ) );
	}
	
	set_express_shipping_required ( 
		    TextConverter.stringToBoolean( results.getString( "express_shipping_required" ) ) );
	
	set_box( results.getString( "box" ) );
	set_position( results.getString( "position" ) );
	set_location( results.getString( "location" ) );

	set_has_stock_notes( 
	    TextConverter.stringToBoolean( 
		results.getString( "has_stock_notes" ) ) );

	set_MTA_signature( 
	    TextConverter.stringToBoolean( 
		results.getString( "MTA_signature" ) ) );

	set_ABRC_comments(DBconnection.getClob(results, "ABRC_comments"));
	set_date_last_modified( results.getDate( "date_last_modified" ) );
	set_release_date( results.getDate( "release_date" ) );

	set_is_obsolete( 
	    TextConverter.stringToBoolean( 
		results.getString( "is_obsolete" ) ) );

	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );


	// resolve stock type and stock availability type data from lookup table
	TfcStockType stockType = new TfcStockType( get_stock_type_id() );
	set_stock_type( stockType.get_stock_type() );

	TfcStockAvailabilityType avail = 
	    new TfcStockAvailabilityType( get_stock_availability_type_id() );
	set_stock_availability_type( avail.get_stock_availability_type() );

	set_stock_availability_comment( results.getString( "stock_availability_comment" ) );
    }


    /**
     * Retrieves stock_id given stock number (name)
     *
     * @param conn An active connection to the database
     * @param name Stock number to retrieve stock id for
     * @return Stock id for submitted stock number, or <code>null</code>
     * if no stock found with stock_number
     * @throws SQLException thrown if a database error occurs
     */
    public static Long retrieveStockID( DBconnection conn, String name ) 
	throws SQLException {

        Long stockID = null;
        ResultSet results = null;
        String query = null;

        if ( name != null ) {
            query = 
		"SELECT stock_id " +
		"FROM Stock " +
		"WHERE name LIKE " +
		TextConverter.dbQuote( name.toUpperCase() ) + " ESCAPE '\\\'";

            conn.setQuery( query );

            results = conn.getResultSet();
            if ( results.next() ) {
                stockID = new Long( results.getLong( "stock_id" ) );
            }
            conn.releaseResources();
        }
        return stockID;
    }
    
    /**
     * Retrieves stock number (name) given stock_id
     *
     * @param conn An active connection to the database
     * @param stockId  to retrieve Stock number name for
     * @return Stock number (name) for submitted stock id, or <code>null</code>
     * if no stock found with stock name
     * @throws SQLException thrown if a database error occurs
     */
    public static String retrieveStockNumber( DBconnection conn, Long stockId ) 
	throws SQLException {

        String stockNumber = null;
        ResultSet results = null;
        String query = null;

        if ( stockId != null ) {
            query = 
		"SELECT name " +
		"FROM Stock " +
		"WHERE stock_id = " + stockId;

            conn.setQuery( query );

            results = conn.getResultSet();
            if ( results.next() ) {
            	stockNumber = new String( results.getString( "name" ) );
            }
            conn.releaseResources();
        }
        return stockNumber;
    }

    /**
     * Utility method to get description for submitted stock id.  This is often
     * used in searches where TEXT description field is not included in main
     * search select SQL for performance reasons, but is needed for display on
     * results page
     * 
     * @param conn An active connection to the database
     * @param stockID Stock id to retrieve data for
     * @return Description for submitted stock id
     * @throws SQLException if a database error occurs
     */
    public static String retrieveDescription( DBconnection conn, Long stockID )
	throws SQLException {

	String description = null;

	String query = 
	    "SELECT description " +
	    "FROM Stock " +
	    "WHERE stock_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( stockID );

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    description = results.getString( "description" );
	}
	conn.releaseResources();

	return description;
    }

    //
    // Get 'em & set 'em
    //

    public void set_stock_id( Long id ) {
	this.stock_id = id; 
    }

    public void set_stock_type_id( Long type ) { 
	this.stock_type_id = type; 
    }

    public void set_stock_type( String type ) { 
	this.stock_type = type; 
    }

    public void set_stock_availability_type_id( Long avail ) { 
	this.stock_availability_type_id = avail; 
    }

    public void set_stock_availability_type( String type ) { 
	this.stock_availability_type = type; 
    }

    public void set_fixed_price( Boolean fixed ) { 
	this.fixed_price = fixed; 
    }

    public void set_base_price( Float price ) { 
	this.base_price = price; 
    }

    public void set_description( String descr ) { 
	this.description = descr; 
    }

    public void set_name( String name ) {
	this.name = name; 
    }

    public void set_is_seed( Boolean seed ) { 
	is_seed = seed; 
    }

    public void set_is_restricted( Boolean restricted ) { 
	is_restricted = restricted; 
    }

    public void set_is_molecular_mapping( Boolean is_molecular_mapping ) { 
	this.is_molecular_mapping = is_molecular_mapping; 
    }

    public void set_is_classical_mapping( Boolean is_classical_mapping ) {
	this.is_classical_mapping = is_classical_mapping; 
    }

    public void set_NASC_request( Boolean NASC_request ) {
	this.NASC_request = NASC_request; 
    }

    public void set_NASC_request_fee( Boolean NASC_request_fee ) { 
	this.NASC_request_fee = NASC_request_fee; 
    }

    public void set_format_received( String format_received ) {
	this.format_received = format_received; 
    }

    public void set_maintenance_method( String maintenance_method ) { 
	this.maintenance_method = maintenance_method; 
    }

    public void set_media( String media ) { 
	this.media = media; 
    }

    public void set_growth_temperature( String growth_temperature ) { 
	this.growth_temperature = growth_temperature; 
    }

    public void set_duration_of_growth( String duration_of_growth ) { 
	this.duration_of_growth = duration_of_growth; 
    }

    public void set_format_shipped( String format_shipped ) {
	this.format_shipped = format_shipped; 
    }

    public void set_kit_contents( String kit_contents ) {
	this.kit_contents = kit_contents;
    }

    public void set_number_in_set( Long number_in_set ) { 
	this.number_in_set = number_in_set; 
    }

    public void set_num_lines( Integer num_lines ) {
	this.num_lines = num_lines; 
    }

    public void set_box( String box ) {
	this.box = box; 
    }

    public void set_position( String position ) {
	this.position = position; 
    }

    public void set_location( String location ) {
	this.location = location; 
    }

    public void set_has_stock_notes( Boolean has_stock_notes ) {
	this.has_stock_notes = has_stock_notes; 
    }

    public void set_MTA_signature( Boolean MTA_signature ) {
	this.MTA_signature = MTA_signature; 
    }
    public void set_ABRC_comments( String ABRC_comments ) {
	this.ABRC_comments = ABRC_comments; 
    }

    public void set_date_last_modified( java.util.Date date_last_modified ) {
	this.date_last_modified = date_last_modified; 
    }

    public void set_release_date( java.util.Date release_date ) {
	this.release_date = release_date; 
    }

    public void set_is_obsolete( Boolean is_obsolete ) {
	this.is_obsolete = is_obsolete; 
    }

    public void set_stock_availability_comment( String stock_availability_comment ) {
	this.stock_availability_comment = stock_availability_comment;
    }

    public Long get_stock_id() {
	return stock_id; 
    }

    public Long get_stock_type_id() {
	return stock_type_id; 
    }

    public String get_stock_type() {
	return stock_type; 
    }

    public Long get_stock_availability_type_id() {
	return stock_availability_type_id; 
    }

    public String get_stock_availability_type() {
	return stock_availability_type; 
    }

    public Boolean get_fixed_price() {
	return fixed_price; 
    }

    public Float get_base_price() {
	return base_price; 
    }

    public String get_description() {
	return description; 
    }

    public String get_name() {
	return name; 
    }

    public Boolean get_is_seed() {
	return is_seed; 
    }

    public Boolean get_is_restricted() {
	return is_restricted; 
    }

    public Boolean get_is_molecular_mapping() {
	return is_molecular_mapping; 
    }

    public Boolean get_is_classical_mapping() {
	return is_classical_mapping; 
    }

    public Boolean get_NASC_request() {
	return NASC_request; 
    }

    public Boolean get_NASC_request_fee() {
	return NASC_request_fee; 
    }

    public String get_format_received() {
	return format_received; 
    }

    public String get_maintenance_method() {
	return maintenance_method; 
    }

    public String get_media() {
	return media; 
    }

    public String get_growth_temperature() {
	return growth_temperature; 
    }

    public String get_duration_of_growth() {
	return duration_of_growth; 
    }

    public String get_format_shipped() {
	return format_shipped; 
    }

    public String get_kit_contents() {
	return kit_contents; 
    }

    public Long get_number_in_set() {
	return number_in_set; 
    }

    public Integer get_num_lines() {
	return num_lines; 
    }

    public String get_box() {
	return box; 
    }

    public String get_position() {
	return position; 
    }

    public String get_location() {
	return location; 
    }

    public Boolean get_has_stock_notes() {
	return has_stock_notes; 
    }

    public Boolean get_MTA_signature() {
	return MTA_signature; 
    }

    public String get_ABRC_comments() {
	return ABRC_comments; 
    }

    public java.util.Date get_date_last_modified() {
	return date_last_modified; 
    }

    public java.util.Date get_release_date() {
	return release_date; 
    }

    public Boolean get_is_obsolete() {
	return is_obsolete; 
    }

    public void set_original_name ( String name ) { 
	this.original_name = name; 
    }

    public String get_original_name() { 
	return original_name; 
    }

    public void set_date_entered ( java.util.Date date ) { 
	this.date_entered = date;
    }

    public java.util.Date get_date_entered() { 
	return date_entered; 
    }

    public void set_express_shipping_charge( Float charge ) {
	this.express_shipping_charge = charge;
    }

    public Float get_express_shipping_charge() {
	return express_shipping_charge;
    }
    
    public void set_express_shipping_required( Boolean expressRequired ) { 
    	express_shipping_required = expressRequired; 
    }

    public Boolean get_express_shipping_required() {
	return express_shipping_required;
    }

    public String get_stock_availability_comment() {
	return stock_availability_comment;
    }


    /**
     * Returns abbreviated version of description for display in search 
     * results.  Currently limits description to the nearest whitespace 
     * character to 100 characters and adds trailing "..."  to create 
     * abbreviated text that doesn't cut off in the middle of a word.
     *
     * @return Description abbreviated to around 100 characters, or 
     * <code>null</code> if stock's description is null
     */
    public String get_abbrev_description() {
        return TextConverter.truncateString( get_description(), 100 );
    }


    /**
     * Utility method to format float into money format. 
     * Dollar sign will optionally be included according to
     * value of showDollar
     */
    private String formatPrice( Float price, boolean showDollar ) {
        String formatStr = null;
        if ( price != null ) {
            DecimalFormat df = null;
            if ( showDollar ) {
                df = new DecimalFormat( "$0.##" );
            } else {
                df = new DecimalFormat( "0.##" );
            }
            formatStr = df.format( price ); 
        }
        return formatStr;
    }
    

    /**
     * Retrieves stock base price formatted in money format.  US $
     * sign will be optionally included according to submitted value
     * of showDollar
     *
     * @param showDollar If <code>true</code> returned string will contain
     * US $ sign before amount; if <code>false</code> amount will be returned
     * without dollar sign
     * @return String containing formatted stock base price or null if stock
     * has no base price
     */
    public String get_format_base_price( boolean showDollar ) {
        return formatPrice( get_base_price(), showDollar );
    }

    /**
     * Retrieves stock base price formatted in $US money format ($0.00). This
     * version of format method will always return amount with US $ sign in
     * the string.
     *
     * @return String containing formatted stock base price, or null if stock has
     *  no base price
     */
    public String get_format_base_price() {
        return formatPrice( get_base_price(), true );
    }

    public String get_format_express_shipping_charge() {
    	return formatPrice ( get_express_shipping_charge(), true );
    }

    /**
     * Retrieves stock commercial price formatted in $US money format ($0.00). 
     * Commercial price is calculated by multiplying base price by the commercial
     * stock multiplier (stored in AbrcConstant table) US $ sign 
     * will be optionally included according to submitted value of showDollar
     *
     * @param showDollar If <code>true</code> returned string will contain
     * US $ sign before amount; if <code>false</code> amount will be returned
     * without dollar sign
     * @return String containing formatted commercial stock price, or null if 
     * stock has no base price
     */
    public String get_format_commercial_price( boolean showDollar ) {
	AbrcConstantCollection constants = AbrcConstantCollection.getInstance();

	float multiplier = 
	    constants.getValue( "commercial stock" ).floatValue();

        float price = get_base_price().floatValue();
	price *= multiplier;

	String formatStr = formatPrice( new Float( price ), showDollar );

        return formatStr;
    }


    /**
     * Retrieves stock commercial price formatted in $US money format ($0.00). 
     * Commercial price is calculated by multiplying base price by the commercial
     * stock multiplier (stored in AbrcConstant table). This version of format 
     * method will always return amount with US  $ sign in the string.
     *
     * @return String containing formatted commercial stock price, or null if 
     * stock has no base price
     */
    public String get_format_commercial_price() {
        return get_format_commercial_price( true );
    }

    
    /**
     * Stores contents of stock record to the database as an INSERT or UPDATE 
     * depending on whether stock_id primary key is NULL or not.
     * 
     * <p>
     * Since storing TfcStock data results in storage to the TairObject table 
     * through TfcTairObject super class, this method should be called as part
     * of an explicit database transaction to properly handle committing or 
     * rolling back of transaction in case of errors
     *
     * @param conn An active connection to the database
     * @throws RecordNotFoundException if no row found for tair object id when
     * updating.
     * @throws SQLException if a database error occurs
     * @throws InvalidActionException if no tair object id has been set for
     * object when trying to UPDATE
     */
    public void store( DBconnection conn ) 
        throws RecordNotFoundException, SQLException, InvalidActionException {


	// store TairObject values before Stock to ensure 
	// a tair_object_id is created for new entries
	super.store( conn );

	// Get map of Stock specific column names and values to store
	Map localValues = getLocalValuesMap();

	// if primary key null, do an insert and save newly 
	// created stock id in member variable
        if ( get_stock_id() == null ) {

	    // use utility method in superclass to create INSERT 
	    // statement using localValues map. INSERT will automatically
	    // include tair_object_id as well as a SELECT to get
	    // newly created stock_id.
	    String insertQuery = createChildTableInsert( localValues, "STOCK_ID", "STOCK_SEQ" );
	    conn.setInsertQuery( insertQuery, "STOCK_ID" );
	    Long id = conn.executeInsert();
	    set_stock_id( id );
	    conn.releaseResources();
	    
	    // else do update
	} else {

	    // use utility method in superclass to create UPDATE
	    // statement using localValues map -- UPDATE will always
	    // be done using tair_object_id as primary key column in
	    // WHERE clause
	    String updateQuery = createChildTableUpdate( localValues );
	    conn.setQuery( updateQuery );

	    int rowsAffected = conn.executeUpdate();
	    conn.releaseResources();

	    if ( rowsAffected <= 0 ) { 
		throw new RecordNotFoundException( "Update on Stock " + 
						   "failed: No row found " +
						   "for tair object id: " + 
						   get_tair_object_id() );
	    }
	}	    

    }
    
    /**
     * Retrieves values to store for a Stock entry as a Map of column names
     * and values to store for each column using current values of member 
     * variables. This Map is used by utility methods defined in superclass
     * that create INSERT and UPDATE SQL statements for Stock.
     *
     * <p>
     * Column names and values must be stored in Map as String. Values must be 
     * stored with any quotation marks around values included in String so
     * that they can be directly included in SQL created in superclass.
     * 
     * @return Map of column names for Stock table as String keys referencing
     * values for each column name.  
     */
    private Map getLocalValuesMap() {
	Map localValues = new HashMap();
	localValues.put( "stock_type_id",  
			 TextConverter.dbQuote( get_stock_type_id() ) );

	localValues.put( "stock_availability_type_id",  
			 TextConverter.dbQuote( 
			     get_stock_availability_type_id() ) );

	localValues.put( "fixed_price",  
			 TextConverter.dbQuote( get_fixed_price() ) );

	localValues.put( "base_price",  
			 TextConverter.dbQuote( get_base_price() ) );

	localValues.put( "description",  
			 TextConverter.dbQuote( get_description() ) );


	// manually set description_uc uppercase search field -- shouldn't
	// usually be done in application code, but TEXT field can't be
	// used correctly in trigger so we need to do it here whenever
	// stock is updated
	String descUC = get_description();
	if ( descUC != null ) {
	    // truncate to 2048 (size of varchar - shouldn't ever be 
	    // exceeded, but just in case)
	    if ( descUC.length() > 2048 ) {
		descUC = descUC.substring(0, 2048);
	    }

	    // uppercase value
	    descUC = descUC.toUpperCase();
	}
	localValues.put( "description_uc",
			 TextConverter.dbQuote( descUC ) );
 
	localValues.put( "name",  TextConverter.dbQuote( get_name() ) );

	localValues.put( "is_seed",  TextConverter.dbQuote( get_is_seed() ) );

	localValues.put( "is_restricted",  
			 TextConverter.dbQuote( get_is_restricted() ) );

	localValues.put( "is_molecular_mapping", 
			 TextConverter.dbQuote( get_is_molecular_mapping() ) );
	
	localValues.put( "is_classical_mapping",  
			 TextConverter.dbQuote( get_is_classical_mapping() ) );

	localValues.put( "NASC_request",  
			 TextConverter.dbQuote( get_NASC_request() ) );
	
	localValues.put( "NASC_request_fee",  
			 TextConverter.dbQuote( get_NASC_request_fee() ) );
	
	localValues.put( "format_received",  
			 TextConverter.dbQuote( get_format_received() ) );

	localValues.put( "maintenance_method",  
			 TextConverter.dbQuote( get_maintenance_method() ) );
	
	localValues.put( "media",  TextConverter.dbQuote( get_media() ) );

	localValues.put( "growth_temperature",  
			 TextConverter.dbQuote( get_growth_temperature() ) );

	localValues.put("duration_of_growth",
			TextConverter.dbQuote( get_duration_of_growth() ) );

	localValues.put( "format_shipped",  
			 TextConverter.dbQuote( get_format_shipped() ) );

	localValues.put( "kit_contents",  
			 TextConverter.dbQuote( get_kit_contents() ) );
	
	localValues.put( "number_in_set",  
			 TextConverter.dbQuote( get_number_in_set() ) );

	localValues.put( "num_lines",
			 TextConverter.dbQuote( get_num_lines() ) );
			 
	localValues.put( "box",  TextConverter.dbQuote( get_box() ) );
	localValues.put( "position",  
			 TextConverter.dbQuote( get_position() ) );

	localValues.put( "location",  
			 TextConverter.dbQuote( get_location() ) );

	localValues.put( "has_stock_notes",  
			 TextConverter.dbQuote( get_has_stock_notes() ) );

	localValues.put( "MTA_signature",  
			 TextConverter.dbQuote( get_MTA_signature() ));

	localValues.put( "ABRC_comments",  
			 TextConverter.dbQuote( get_ABRC_comments() ));

	localValues.put( "date_last_modified",  
			 TextConverter.dbQuote( 
			     get_date_last_modified(), "mm/dd/yyyy" ) );

	localValues.put( "release_date",  
			 TextConverter.dbQuote( get_release_date(), "mm/dd/yyyy" ) );

	localValues.put( "is_obsolete", 
			 TextConverter.dbQuote( get_is_obsolete() ) );
	
	localValues.put( "date_entered",
			 TextConverter.dbQuote( get_date_entered(), "mm/dd/yyyy" ) );
	
	localValues.put( "original_name",
			 TextConverter.dbQuote( get_original_name() ) );

	localValues.put( "express_shipping_charge",
			 TextConverter.dbQuote( get_express_shipping_charge() ) );
	
	localValues.put( "express_shipping_required",
			 TextConverter.dbQuote( get_express_shipping_required() ) );
    
	return localValues;
	
    }




    /**
     * For unit testing only
     */
    public void test() {
	super.test();
        logger.debug( "****** TfcStock content test *******");
        logger.debug( "stock ID: " + get_stock_id() );
        logger.debug( "stock type ID: " + get_stock_type_id() );
        logger.debug( "stock type: " + get_stock_type() );
        logger.debug( "stock availability_type_id: " + 
			    get_stock_availability_type_id() );
        logger.debug( "stock availability_type: " + 
			    get_stock_availability_type() );
        logger.debug( "fixed price: " + get_fixed_price() ); 
        logger.debug( "base price: " + get_base_price() ); 
        logger.debug( "description: " + get_description() );
        logger.debug( "abbrev description: " + get_abbrev_description() );
        logger.debug( "name: " + get_name() );
        logger.debug( "is seed: " + get_is_seed() );
        logger.debug( "is restricted: " + get_is_restricted() );
        logger.debug( "is_molecular_mapping: " + 
			    get_is_molecular_mapping() ); 
        logger.debug( "is_classical_mapping: " + 
			    get_is_classical_mapping() ); 
        logger.debug( "NASC_request: " + get_NASC_request() ); 
        logger.debug( "NASC_request_fee: " + get_NASC_request_fee() );
        logger.debug( "format_received: " + get_format_received() ); 
        logger.debug( "maintenance_method: " + 
			    get_maintenance_method() ); 
        logger.debug( "media: " + get_media() ); 
        logger.debug( "growth_temperature: " + 
			    get_growth_temperature() ); 
        logger.debug( "duration_of_growth: " + 
			    get_duration_of_growth() ); 
        logger.debug( "format_shipped: " + get_format_shipped() );
        logger.debug( "kit_contents: " + get_kit_contents() ); 
        logger.debug( "number_in_set: " + get_number_in_set() ); 
        logger.debug( "num_lines: " + get_num_lines() ); 
        logger.debug( "box: " + get_box() ); 
        logger.debug( "position: " + get_position() ); 
        logger.debug( "location: " + get_location() ); 
        logger.debug( "has_stock_notes: " + get_has_stock_notes() ); 
        logger.debug( "MTA_signature: " + get_MTA_signature() ); 
        logger.debug( "ABRC_comments: " + get_ABRC_comments() ); 
        logger.debug( "date_last_modified: " + 
			    get_date_last_modified() ); 
        logger.debug( "release_date: " + get_release_date() ); 
        logger.debug( "is_obsolete: " + get_is_obsolete() ); 
        logger.debug( "format base price: " + get_format_base_price() );
        logger.debug( "format commercial price: " + 
			    get_format_commercial_price() );
        logger.debug( "original_name: " + get_original_name() );
        logger.debug( "date_entered: " + get_date_entered() );
        logger.debug( "express shipping charge: " + 
			    get_express_shipping_charge() );
        logger.debug( "express shipping required: " + 
			    get_express_shipping_required() );
        logger.debug( "**** TfcStock content test end ****");
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
    
        try {

            DBconnection conn = new DBconnection();
            TfcStock stock = new TfcStock( conn, new Long( 88854 ) );
            stock.test();
        } catch ( Exception e ) {
            e.printStackTrace();
        }

    }
}
