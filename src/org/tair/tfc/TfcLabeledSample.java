//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.3 $
// $Date: 2004/07/06 16:33:02 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.HashMap;

import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.TextConverter;


/**
 * This class maps to the LabeledSample table. Each instance represents one row
 * of data; each member variable maps to a column of a row in the table.
 */


public class TfcLabeledSample {   

    private Long bio_sample_id; 
    private Long hyb_description_id; 
    private Long labeling_protocol_ref_id;
    private String name;
    private String label;
    private String channel_number;


    /**
     * Creates an empty instance of TfcLabeledSample
     */
    public TfcLabeledSample() {  }

    /**
     * Creates an instance of TfcLabeledSample that reflects the data referenced
     * by combination of submitted bio_sample_id and hyb_description_id
     *
     * @param conn An active connection to the database
     * @param bio_sample_id Bio sample id to retrieve data for
     * @param hyb_description_id Hyb description id to retrieve data for
     * @throws RecordNotFoundException if no row found for combination of ids
     * @throws SQLException if a database error occurs
     */
    public TfcLabeledSample( DBconnection conn, 
			     Long bio_sample_id, 
			     Long hyb_description_id ) 
	throws SQLException {



	String query = 
	    getBaseQuery() + 
	    "WHERE bio_sample_id = ? " + 
	    "AND hyb_description_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( 1, bio_sample_id );
	conn.setQueryVariable( 2, hyb_description_id );

	ResultSet results = conn.getResultSet();
        boolean found = processResults( results );
	conn.releaseResources();
	
        if ( !found ) {
            throw new RecordNotFoundException( "No row found for " +
					       "bio sample id: " + 
					       bio_sample_id + " and " +
                                               "hyb description id: " + 
					       hyb_description_id );
        }
    }
  
    /**
     * Stores results of query in member variables
     *
     * @param results Results of population query
     * @return <code>true</code> if result set has a row of results; 
     * <code>false</code> if no rows in result set
     * @throws SQLException if a database error occurs
     */
    private boolean processResults( ResultSet results ) throws SQLException {
        boolean found = results.next();

	if ( found ) {
            set_bio_sample_id( new Long( results.getLong( "bio_sample_id" ) ) );

	    Long hybID = new Long( results.getLong( "hyb_description_id" ) );
            set_hyb_description_id( hybID );
	    
            set_channel_number( results.getString( "channel_number" ) );
            set_name( results.getString( "name" ) );
            set_label( results.getString( "label" ) );
	    
            long id = results.getLong( "labeling_protocol_ref_id" );
            if ( !results.wasNull() ) {
                set_labeling_protocol_ref_id( new Long( id ) );
            }
        }

        return found;
    }
        
    /**
     * Return basic select statement for populating labeled samples
     */
    private String getBaseQuery() {
        StringBuffer query = new StringBuffer();
        query.append( "SELECT bio_sample_id, " +
                      "hyb_description_id, " +
                      "channel_number, " +
                      "name, " +
                      "label, " +
                      "labeling_protocol_ref_id " +
                      "from LabeledSample " );
        return query.toString();    
    } 


    public void set_bio_sample_id( Long value ) { 
	bio_sample_id = value; 
    }

    public Long get_bio_sample_id() {
	return bio_sample_id;
    }

    public void set_hyb_description_id( Long value ) {
	hyb_description_id = value; 
    }

    public Long get_hyb_description_id() {
	return hyb_description_id;
    }

    public void set_channel_number( String value ) {
	channel_number = value;
    }

    public String get_channel_number() { 
	return channel_number; 
    }

    public void set_name( String value ) {
	name = value; 
    }

    public String get_name() {
	return name; 
    }

    public void set_label( String value ) { 
	label = value;
    }

    public String get_label() {
	return label;
    }

    public void set_labeling_protocol_ref_id( Long value ) { 
	labeling_protocol_ref_id = value; 
    }

    public Long get_labeling_protocol_ref_id() { 
	return labeling_protocol_ref_id;
    }


    /**
     * Stores labeled sample data to the database. This operation is always
     * done as an INSERT.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if data required for storing has 
     * not been set 
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
        throws RecordNotFoundException, SQLException, InvalidActionException {

        // ensure required data has been set
        validate();


	// create insert w/out SELECT @@IDENTITY since join table has
	// no primary key
        String query =
	    StoreUtils.createInsertStatement( "LabeledSample",
					      getColumnValuesMap());
        conn.setQuery( query );
	conn.executeUpdate();
        conn.releaseResources();
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

	columnValues.put( "bio_sample_id",
			  TextConverter.dbQuote( get_bio_sample_id() ) );

	columnValues.put( "hyb_description_id",
			  TextConverter.dbQuote( get_hyb_description_id() ) );
	
	columnValues.put( "labeling_protocol_ref_id",
			  TextConverter.dbQuote( 
			      get_labeling_protocol_ref_id() ) );

	columnValues.put( "name", TextConverter.dbQuote( get_name() ) );
	columnValues.put( "label", TextConverter.dbQuote( get_label() ) );

	columnValues.put( "channel_number", 
			  TextConverter.dbQuote( get_channel_number() ) );
	
	return columnValues;

    }

    /**
     * Validates object to ensure that data required for INSERT to the 
     * database has been properly set.  
     *
     * @throws InvalidActionException if any ids required for storing to db
     * have not been set
     */
    private void validate() throws InvalidActionException {
	if ( get_bio_sample_id() == null ||
	     get_hyb_description_id() == null ) {
	    
	    String errMsg = 
		"Cannot store LabeledSample with " +
		"bio sample id: " + get_bio_sample_id() +
		" hybdescription id: " + get_hyb_description_id();
	    
	    throw new InvalidActionException( errMsg );
	}
    }


    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** TfcLabeledSample content test ******" );
        System.out.println( "bio_sample_id: " + get_bio_sample_id() );
        System.out.println( "hyb_description_id: " + get_hyb_description_id() );
        System.out.println( "channel_number: " + get_channel_number() );
        System.out.println( "name: " + get_name() );
        System.out.println( "label: " + get_label() );
        System.out.println( "labeling_protocol_ref_id: " + get_labeling_protocol_ref_id() );
        System.out.println( "**** TfcLabeledSample content test end ****" );
        
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

        try{
            DBconnection conn = new DBconnection();
            Long bioSampleID = new Long( 3 );
            Long hybDescrID = new Long( 2 );
            TfcLabeledSample ls = new TfcLabeledSample( conn, bioSampleID, hybDescrID );
            ls.test();
        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }  
}
