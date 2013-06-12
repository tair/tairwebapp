//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.8 $
// $Date: 2004/07/06 20:24:54 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.HashMap;

import org.tair.utilities.InvalidActionException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

/**
 * This class maps to the Affymetrics table. Each instance represents
 * one row of data; each member variable maps to a column of a row in the 
 * table.
 */

public class TfcAffyMetrics {   

    private Long hyb_data_id;
    private Integer SDTm;
    private Float SRT;
    private Float FC_intensity_threshold;
    private String abs_dec_matrix;
    private Integer central_minus_count;
    private Float central_minus_avg;
    private Integer corner_plus_count;
    private Float corner_plus_avr;
    private Integer corner_minus_count;
    private Float corner_minus_avg;
    private Float background_avg;
    private Float background_stdev;
    private Float noise;

    private Float alpha1;
    private Float alpha2;
    private Float tau;
    private Float TGT_value;
    private Float gamma1h;
    private Float gamma1l;
    private Float gamma2h;
    private Float gamma2l;
    private Float perturbation;
    private Float baseline_noise;
    private Float baseline_sf;

    /**
     * Creates an instance of TfcAffyMetrics
     */
    public TfcAffyMetrics() {  
	super();
    }

    /**
     * Creates an instance of TfcAffyMetrics that reflects the data referenced
     * by submitted hyb_data_id
     *
     * @param conn An active connection to the database
     * @param hyb_data_id Hyb data id to retrieve data for
     * @throws RecordNotFoundException if no row  found for submitted id
     * @throws SQLException thrown if a database error occurs
     */
    public TfcAffyMetrics( DBconnection conn, Long hyb_data_id ) 
	throws RecordNotFoundException, SQLException {

	boolean found = false;

	String query = 
	    getBaseQuery() + 
	    "WHERE hyb_data_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( hyb_data_id );

	ResultSet results = conn.getResultSet();
	found = processResults( results );
	
	if ( !found ) {
	    throw new RecordNotFoundException( "No affymetrics row found " +
					       "for hyb_data_id: " + 
					       hyb_data_id );
	}
    }

    /**
     * Creates an instance of TfcAffyMetrics that reflects the data referenced
     * by submitted hyb_data_id.  This constructor is provided to allow client
     * code a way to attempt to construct an object given a hyb_data_id without
     * a RecordNotFoundException being thrown if no row found for submitted id.
     * This is useful because the only way to know whether a given hyb_data_id
     * has corresponding AffyMetrics data or not is to search the AffyMetrics
     * table; having this constructor skip the normal exception pattern for 
     * Tfc classes allows client code to determine whether AffyMetrics data 
     * exists, and to retrieve that data all in the same call, without making 
     * separate SQL calls for each.
     *
     * @param conn An active connection to the database
     * @param hyb_data_id Hyb data id to retrieve AffyMetrics data for
     * @param noException If <code>true</code> no exception will be thrown if
     * no affymetrics row found for hyb_data_id (client code will need to 
     * manually determine if data was found through accessor methods); if 
     ( <code>false</code>, RecordNotFoundException will be thrown if no row 
     * found for hyb_data_id
     * @throws RecordNotFoundException if no row found for hyb data id when 
     * noException is <code>false</code>
     * @throws SQLException thrown if a database error occurs
     */
    public TfcAffyMetrics( DBconnection conn, 
			   Long hyb_data_id, 
			   boolean noException ) 
	throws SQLException 
    {

	boolean found = false;
	String query = 
	    getBaseQuery() + 
	    "WHERE hyb_data_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( hyb_data_id );

	ResultSet results = conn.getResultSet();
	found = processResults( results );

	if ( !found && !noException ) {
	    throw new RecordNotFoundException( "No affymetrics row found for " +
					       "hyb_data_id: " + hyb_data_id );
	}

    }

  
    /**
     * Store results of query in member variables - return flag to notify caller
     * whether query produced results or not
     */
    private boolean processResults( ResultSet results ) throws SQLException {
	boolean found = results.next();

	if ( found ) {
	    set_hyb_data_id( new Long( results.getLong( "hyb_data_id" ) ) );

	    int i_num = 0;
	    float f_num = 0;
	    i_num = results.getInt( "central_minus_count" );
	    if ( !results.wasNull() ) {
		set_central_minus_count( new Integer( i_num ) );
	    }

	    i_num = results.getInt( "corner_minus_count" );
	    if ( !results.wasNull() ) {
		set_corner_minus_count( new Integer( i_num ) );
	    }

	    i_num = results.getInt( "corner_plus_count" );
	    if ( !results.wasNull() ) {
		set_corner_plus_count( new Integer( i_num ) );
	    }

	    i_num = results.getInt( "SDTm" );
	    if ( !results.wasNull() ) {
		set_SDTm( new Integer( i_num ) );
	    }

	    set_abs_dec_matrix( results.getString( "abs_dec_matrix" ) );

	    f_num = results.getFloat( "central_minus_avg" );
	    if ( !results.wasNull() ) {
		set_central_minus_avg( new Float( f_num ) );
	    }

	    f_num = results.getFloat( "corner_minus_avg" );
	    if ( !results.wasNull() ) {
		set_corner_minus_avg( new Float( f_num ) );
	    }

	    f_num = results.getFloat( "corner_plus_avr" );
	    if ( !results.wasNull() ) {
		set_corner_plus_avr( new Float( f_num ) );
	    }

	    set_SRT( new Float( results.getFloat( "SRT" ) ) );
               
	    f_num = results.getFloat( "FC_intensity_threshold" );
	    if ( !results.wasNull() ) {
		set_FC_intensity_threshold( new Float( f_num ) );
	    }

	    f_num = results.getFloat( "background_stdev" );
	    if ( !results.wasNull() ) {
		set_background_stdev( new Float( f_num ) );
	    }
      
	    f_num = results.getFloat( "background_avg" );
	    if ( !results.wasNull() ) {
		set_background_avg( new Float( f_num ) );
	    }

	    f_num = results.getFloat( "noise" );
	    if ( !results.wasNull() ) {
		set_noise( new Float( f_num ) );
	    }

	    f_num = results.getFloat( "alpha1" );
	    if ( !results.wasNull() ) {
		set_alpha1( new Float( f_num ) );
	    }

	    f_num = results.getFloat( "alpha2" );
	    if ( !results.wasNull() ) {
		set_alpha2( new Float( f_num ) );
	    }

	    f_num = results.getFloat( "tau" );
	    if ( !results.wasNull() ) {
		set_tau( new Float( f_num ) );
	    }

	    f_num = results.getFloat( "TGT_value" );
	    if ( !results.wasNull() ) {
		set_TGT_value( new Float( f_num ) );
	    }

	    f_num = results.getFloat( "gamma1h" );
	    if ( !results.wasNull() ) {
		set_gamma1h( new Float( f_num ) );
	    }

	    f_num = results.getFloat( "gamma1l" );
	    if ( !results.wasNull() ) {
		set_gamma1l( new Float( f_num ) );
	    }

	    f_num = results.getFloat( "gamma2h" );
	    if ( !results.wasNull() ) {
		set_gamma2h( new Float( f_num ) );
	    }

	    f_num = results.getFloat( "gamma2l" );
	    if ( !results.wasNull() ) {
		set_gamma2l( new Float( f_num ) );
	    }

	    f_num = results.getFloat( "perturbation" );
	    if ( !results.wasNull() ) {
		set_perturbation( new Float( f_num ) );
	    }

	    f_num = results.getFloat( "baseline_noise" );
	    if ( !results.wasNull() ) {
		set_baseline_noise( new Float( f_num ) );
	    }

	    f_num = results.getFloat( "baseline_sf" );
	    if ( !results.wasNull() ) {
		set_baseline_sf( new Float( f_num ) );
	    }
	}

	return found;
    }

    /**
     * Return basic select statement
     */
    private String getBaseQuery() {
	StringBuffer query = new StringBuffer();
	query.append( "SELECT hyb_data_id, " +
		      "central_minus_count, " +
		      "corner_minus_count, " +
		      "corner_plus_count, " +
		      "SDTm, " +
		      "central_minus_avg, " +
		      "corner_minus_avg, " +
		      "corner_plus_avr, " +
		      "SRT, " +
		      "FC_intensity_threshold, " +
		      "background_stdev, " +
		      "background_avg, " +
		      "noise, " +
		      "abs_dec_matrix, " + 
		      "alpha1," +
		      "alpha2," +
		      "tau," +
		      "TGT_value," +
		      "gamma1h," +
		      "gamma1l," +
		      "gamma2h," +
		      "gamma2l," +
		      "perturbation," +
		      "baseline_noise," +
		      "baseline_sf " +
		      "FROM AffyMetrics " );
	return query.toString();    
    } 

    public void set_hyb_data_id( Long id ) {
	this.hyb_data_id = id; 
    }

    public Long get_hyb_data_id() {
	return hyb_data_id;
    }

    public void set_central_minus_count( Integer count ) {
	this.central_minus_count = count;
    }

    public Integer get_central_minus_count() {
	return central_minus_count; 
    }

    public void set_corner_minus_count( Integer count ) {
	this.corner_minus_count = count;
    }

    public Integer get_corner_minus_count() { 
	return corner_minus_count; 
    }

    public void set_corner_plus_count( Integer count ) {
	this.corner_plus_count = count;
    }

    public Integer get_corner_plus_count() { 
	return corner_plus_count; 
    }

    public void set_SDTm( Integer value ) {
	this.SDTm = value; 
    }

    public Integer get_SDTm() { 
	return SDTm; 
    }

    public void set_central_minus_avg( Float avg ) { 
	this.central_minus_avg = avg;
    }

    public Float get_central_minus_avg() {
	return central_minus_avg;
    }

    public void set_corner_minus_avg( Float avg ) {
	this.corner_minus_avg = avg; 
    }

    public Float get_corner_minus_avg() {
	return corner_minus_avg;
    }

    public void set_corner_plus_avr( Float avr ) { 
	this.corner_plus_avr = avr;
    }

    public Float get_corner_plus_avr() { 
	return corner_plus_avr;
    }

    public void set_SRT( Float value ) {
	this.SRT = value;
    }

    public Float get_SRT() { 
	return SRT;
    }

    public void set_FC_intensity_threshold( Float threshold ) {
	this.FC_intensity_threshold = threshold;
    }

    public Float get_FC_intensity_threshold() { 
	return FC_intensity_threshold; 
    }

    public void set_background_stdev( Float stdev ) {
	this.background_stdev = stdev; 
    }

    public Float get_background_stdev() {
	return background_stdev;
    }

    public void set_background_avg( Float avg ) {
	this.background_avg = avg;
    }

    public Float get_background_avg() { 
	return background_avg; 
    }

    public void set_noise( Float noise ) {
	this.noise = noise; 
    }

    public Float get_noise() {
	return noise; 
    }

    public void set_abs_dec_matrix( String value ) {
	this.abs_dec_matrix = value;
    }

    public String get_abs_dec_matrix() {
	return abs_dec_matrix;
    }

    public void set_alpha1( Float value ) {
	this.alpha1 = value;
    }

    public Float get_alpha1() {
	return alpha1;
    }

    public void set_alpha2( Float value ) {
    	this.alpha2 = value;
    }

    public Float get_alpha2() {
	return alpha2;
    }

    public void set_tau( Float value ) {
	this.tau = value;
    }

    public Float get_tau() {
	return tau;
    }

    public void set_TGT_value( Float value ) {
	this.TGT_value = value;
    }

    public Float get_TGT_value() {
	return TGT_value;
    }

    public void set_gamma1h( Float value ) {
	this.gamma1h = value;
    }

    public Float get_gamma1h() {
	return gamma1h;
    }

    public void set_gamma1l( Float value ) {
	this.gamma1l = value;
    }

    public Float get_gamma1l() {
	return gamma1l;
    }

    public void set_gamma2h( Float value ) {
	this.gamma2h = value;
    }

    public Float get_gamma2h() {
	return gamma2h;
    }

    public void set_gamma2l( Float value ) {
	this.gamma2l = value;
    }
					
    public Float get_gamma2l() {
	return gamma2l;
    }

    public void set_perturbation( Float value ) {
	this.perturbation = value;
    }

    public Float get_perturbation() {
	return perturbation;
    }

    public void set_baseline_noise( Float value ) {
	this.baseline_noise = value;
    }

    public Float get_baseline_noise() {
	return baseline_noise;
    }

    public void set_baseline_sf( Float value ) {
	this.baseline_sf = value;
    }

    public Float get_baseline_sf() {
	return baseline_sf;
    }


    /**
     * Stores affymetrics data to the database as an UPDATE or INSERT 
     * depending on whether a row already exists in table for hyb data id
     * or not.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if data required for storing has 
     * not been set 
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
	throws SQLException, InvalidActionException {

	// ensure required data has been set
	validate();

	if ( !exists( conn ) ) {
	    insert( conn );
	} else {
	    update( conn );
	}

    }

    /**
     * Retrieves values to store for this class as a Map of column names
     * and values to store for each column using current values of member 
     * variables. This Map can be used by utility methods defined in StoreUtils
     * to create INSERT and UPDATE SQL statements.
     *
     * <p>
     * Column names and values must be stored in Map as String. Values must be 
     * stored with any quotation marks around values included in String so
     * that they can be directly included in SQL created in utility class.
     *
     * @return Map of column names for table as String keys referencing
     * values for each column name.  
     */
    private Map getColumnValuesMap() {
	Map columnValues = new HashMap();

	columnValues.put( "hyb_data_id", 
			  TextConverter.dbQuote( get_hyb_data_id() ) );

	columnValues.put( "SDTm", TextConverter.dbQuote( get_SDTm() ) );
	columnValues.put( "SRT", TextConverter.dbQuote( get_SRT() ) );

	columnValues.put( "FC_intensity_threshold", 
			  TextConverter.dbQuote( 
			      get_FC_intensity_threshold() ) );

	columnValues.put( "abs_dec_matrix", 
			  TextConverter.dbQuote( get_abs_dec_matrix() ) );

	columnValues.put( "central_minus_count", 
			  TextConverter.dbQuote( get_central_minus_count() ) );
	
	columnValues.put( "central_minus_avg", 
			  TextConverter.dbQuote( get_central_minus_avg() ) );
	
	columnValues.put( "corner_plus_count", 
			  TextConverter.dbQuote( get_corner_plus_count() ) );

	columnValues.put( "corner_plus_avr", 
			  TextConverter.dbQuote( get_corner_plus_avr() ) );

	columnValues.put( "corner_minus_count", 
			  TextConverter.dbQuote( get_corner_minus_count() ) );
	
	columnValues.put( "corner_minus_avg", 
			  TextConverter.dbQuote( get_corner_minus_avg() ) );
	
	columnValues.put( "background_avg", 
			  TextConverter.dbQuote( get_background_avg() ) );
	
	columnValues.put( "background_stdev", 
			  TextConverter.dbQuote( get_background_stdev() ) );

	columnValues.put( "noise", TextConverter.dbQuote( get_noise() ) );

	columnValues.put( "alpha1", TextConverter.dbQuote( get_alpha1() ) );
	columnValues.put( "alpha2", TextConverter.dbQuote( get_alpha2() ) );
	columnValues.put( "tau", TextConverter.dbQuote( get_tau() ) );

	columnValues.put( "TGT_value",
			  TextConverter.dbQuote( get_TGT_value() ) );
	
	columnValues.put( "gamma1h", TextConverter.dbQuote( get_gamma1h() ) );
	columnValues.put( "gamma1l", TextConverter.dbQuote( get_gamma1l() ) );
	columnValues.put( "gamma2h", TextConverter.dbQuote( get_gamma2h() ) );
	columnValues.put( "gamma2l", TextConverter.dbQuote( get_gamma2l() ) );

	columnValues.put( "perturbation",
			  TextConverter.dbQuote( get_perturbation() ) );

	columnValues.put( "baseline_noise", 
			  TextConverter.dbQuote( get_baseline_noise() ) );
	
	columnValues.put( "baseline_sf", 
			  TextConverter.dbQuote( get_baseline_sf() ) );
	
	return columnValues;

    }

    /** 
     * Inserts a new row into AffyMetrics containing contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    private void insert( DBconnection conn ) throws SQLException {

	// create insert w/out SELECT @@IDENTITY since join table has
	// no primary key
	String query = StoreUtils.createInsertStatement( "AffyMetrics", 
							 getColumnValuesMap());
	conn.setQuery( query );
	conn.executeUpdate();
	conn.releaseResources();
    }

    /** 
     * Updates an existing row in Affymetrics with contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws RecordNotFoundException if UPDATE does not affect any rows
     * @throws SQLException if a database error occurs
     */
    private void update( DBconnection conn )
	throws RecordNotFoundException, SQLException {

	String query = 
	    StoreUtils.createUpdateStatement( "AffyMetrics", 
					      "hyb_data_id",
					      get_hyb_data_id(),
					      getColumnValuesMap() );

	conn.setQuery( query );
	int rowsAffected = conn.executeUpdate();
	conn.releaseResources();
    }


    /**
     * Determines if a row already exists in AffyMetrics table for hyb data id.
     *
     * @param conn An active connection to the database
     * @return <code>true</code> if a row exists for hyb data id, 
     * <code>false</code> if no row found for hyb data id
     * @throws SQLException if a database error occurs
     */
    private boolean exists( DBconnection conn ) throws SQLException {
	boolean exists = false;
	
	String query =
	    "SELECT COUNT(*) FROM AffyMetrics WHERE hyb_data_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( get_hyb_data_id() );

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    if ( results.getInt( 1 ) > 0 ) {
		exists = true;
	    }
	}
	conn.releaseResources();

	return exists;
    }


    /**
     * Validates object to ensure that data required for INSERT to the 
     * database has been properly set.  
     *
     * @throws InvalidActionException if any data required for storing to db
     * have not been set
     */
    private void validate() throws InvalidActionException {
	// require hyb data id at a minimum
	if ( get_hyb_data_id() == null ) {
	    throw new InvalidActionException( "Cannot store Affymetrix data " +
					      "with hyb data id NULL" );
	}

    }

    /**
     * Deletes a row of affymetrics data
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    public void delete( DBconnection conn ) throws SQLException {
	String query = "DELETE AffyMetrics WHERE hyb_data_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( get_hyb_data_id() );
	conn.executeUpdate();
	conn.releaseResources();
    }
	


    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "****** TfcAffyMetrics content test ******" );
	System.out.println( "hyb_data_id: " + get_hyb_data_id() );
	System.out.println( "central_minus_count: " + 
			    get_central_minus_count() );

	System.out.println( "corner_minus_count: " + get_corner_minus_count() );
	System.out.println( "corner_plus_count: " + get_corner_plus_count() );
	System.out.println( "SDTm: " + get_SDTm() );
	System.out.println( "central_minus_avg: " + get_central_minus_avg() );
	System.out.println( "corner_minus_avg: " + get_corner_minus_avg() );
	System.out.println( "corner_plus_avr: " + get_corner_plus_avr() );
	System.out.println( "SRT: " + get_SRT() );
	System.out.println( "FC_intensity_threshold: " + 
			    get_FC_intensity_threshold() );

	System.out.println( "background_stdev: " + get_background_stdev() );
	System.out.println( "background avg: " + get_background_avg() );
	System.out.println( "noise: " + get_noise() );
	System.out.println( "abs_dec_matrix: " + get_abs_dec_matrix() );

	System.out.println( "alpha1: " + get_alpha1() );
	System.out.println( "alpha2: " + get_alpha2() );
	System.out.println( "tau: " + get_tau() );
	System.out.println( "TGT_value: " + get_TGT_value() );
	System.out.println( "gamma1h: " + get_gamma1h() );
	System.out.println( "gamma1l: " + get_gamma1l() );
	System.out.println( "gamma2h: " + get_gamma2h() );
	System.out.println( "gamma2l: " + get_gamma2l() );
	System.out.println( "perturbation: " + get_perturbation() );
	System.out.println( "baseline_noise: " + get_baseline_noise() );
	System.out.println( "baseline_sf: " + get_baseline_sf() );
	System.out.println( "**** TfcAffyMetrics content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

	try{
	    DBconnection conn = new DBconnection();
	    Long id = new Long( 2 );
	    TfcAffyMetrics am = new TfcAffyMetrics( conn, id );
	    am.test();
	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }  
}
