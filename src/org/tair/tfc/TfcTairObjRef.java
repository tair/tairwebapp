//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.14 $
// $Date: 2004/07/21 17:30:55 $
//------------------------------------------------------------------------------
package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;
import java.io.Serializable;

/**
 * This class maps to the table TairObjRef in the tair database. Each instance
 * maps one row of data in TairObjRef table. Each data object maps to one field
 * of a row in the table. 
 */

public class TfcTairObjRef implements Serializable {   

    private Long tairobj_ref_id;
    private Long tair_object_id;
    private Long reference_id;
    private Long attribution_type_id;

    /**
     * Creates an empty instance of TfcTairObjRef
     */
    public TfcTairObjRef() {  }

    /**
     * Creates an instance of TfcTairObjRef that represents the data referenced
     * by submitted tairobj_ref_id
     *
     * @param conn An active connection to the database
     * @param tairobj_ref_id tairobj_ref_id to retrieve data for
     * @throws SQLException in the case of an invalid operation or database 
     * error, or if no row found for submitted id
     */
    public TfcTairObjRef( DBconnection conn, Long tairobj_ref_id ) 
	throws SQLException {

	boolean found = false;

	String query = 
	    getBaseSelect() + 
	    "WHERE tairobj_ref_id = " + tairobj_ref_id.toString();
	found = processResults( conn, query);
	
	if ( !found ) {
	    throw new RecordNotFoundException( "No entry for found " +
					       "tairobj_ref_id: " + 
					       tairobj_ref_id );
	}
    }
  
    /**
     * Creates an instance of TfcTairObjRef that represents the data referenced
     * by submitted combination of tair object id, reference id and 
     * attribution_type_id (which may be null). The combination of these three 
     * ids can be counted on to be unique, and can therefore be used as a 
     * substitute primary key for tairobj_ref_id
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id to retrieve data for
     * @param reference_id Reference id to retrieve data for
     * @param attribution_type_id Attribution type id to retrieve data for. This id
     * may be null, since not all tair object/reference associations have an 
     * attribution type
     * @throws SQLException in the case of an invalid operation or database error, or
     * if no row found for submitted combination of ids
     */
    public TfcTairObjRef( DBconnection conn, 
			  Long tair_object_id, 
			  Long reference_id, 
			  Long attribution_type_id ) 
	throws SQLException {

	boolean found = false;
	String query = 
	    getBaseSelect() +
	    "WHERE tair_object_id = " + tair_object_id + " " +
	    "AND reference_id = " + reference_id + " " +
	    "AND attribution_type_id = " + attribution_type_id;

	found = processResults( conn, query);

	if ( !found ) {
	    throw new RecordNotFoundException( "No entry found  " +
					       "for tair object id " + 
					       tair_object_id + 
					       ", reference id " + 
					       reference_id + " " +
					       "attribution type id " + 
					       attribution_type_id );
	}
    }

    /**
     * Retrieve basic select clause for all population methods
     */
    private String getBaseSelect() {
	String select =
	    "SELECT distinct reference_id, " +
	    "tairobj_ref_id, " +
	    "attribution_type_id, " +
	    "tair_object_id " +
	    "FROM TairObj_Ref ";
	return select;
    }




    /**
     * Retrieve results & store in member variables; return true if results 
     * found, false if query yielded no results
     */
    private boolean processResults( DBconnection conn, String query ) 
	throws SQLException {

	boolean found = false;

	conn.setQuery( query );
	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    found = true;
      
	    long id = results.getLong( "reference_id" );
	    if ( !results.wasNull() ){
		set_reference_id( new Long( id ) );
	    }
      
	    id = results.getLong( "tairobj_ref_id" );
	    if ( !results.wasNull() ){
		set_tairobj_ref_id( new Long( id ) );
	    }
      
	    id = results.getLong( "attribution_type_id" );
	    if ( !results.wasNull() ) {
		set_attribution_type_id( new Long( id ) );
	    }
      
	    id = results.getLong( "tair_object_id" );
	    if ( !results.wasNull() ){
		set_tair_object_id( new Long( id ) );
	    }
	}
	conn.releaseResources();

	return found;
    }
    
    public void set_tairobj_ref_id ( Long value ) { 
	tairobj_ref_id = value; 
    }

    public Long get_tairobj_ref_id() {
	return tairobj_ref_id;
    }

    public void set_tair_object_id ( Long value ) {
	tair_object_id = value;
    }

    public Long get_tair_object_id() {
	return tair_object_id; 
    }

    public void set_reference_id ( Long value ) { 
	reference_id = value; 
    }

    public Long get_reference_id() { 
	return reference_id;
    }

    public void set_attribution_type_id ( Long value ) {
	attribution_type_id = value; 
    }

    public Long get_attribution_type_id() {
	return attribution_type_id; 
    }

    
    /**
     * Determines if a row exists with unique combination of tair_object_id,
     * reference_id and attribution_type_id; if true, storing object to db will
     * be skipped, since the combination of these three keys represents the sum
     * total of the info. in a given row
     */
    private boolean rowExists( DBconnection conn ) throws SQLException {
	String query = null;
	ResultSet results = null;
	int count = 0;

	query = 
	    "SELECT count(*) AS row_count " +
	    "FROM TairObj_Ref " +
	    "WHERE tair_object_id = " + get_tair_object_id() + " " +
	    "AND reference_id = " + get_reference_id() + " " +
	    "AND attribution_type_id = " + get_attribution_type_id();
	conn.setQuery( query );
	results = conn.getResultSet();
	if ( results.next() ) {
	    count = results.getInt( "row_count" );
	}
	conn.releaseResources();

	return ( count > 0 );
    }

    /**
     * Deletes tair object reference association with tairobj_ref_id 
     * from database
     *
     * @param conn An active connection to the database with DELETE privileges
     * @throws SQLException if a database error occurs
     */
    public void delete( DBconnection conn ) throws SQLException {
	String query = "DELETE TairObj_Ref WHERE tairobj_ref_id = ?";
	
	conn.setQuery( query );
	conn.setQueryVariable( get_tairobj_ref_id() );
	conn.executeUpdate();
    }


    /**
     * Stores contents of object to TairObj_Ref id to create a new linkage 
     * between tair object id and reference id.  This operation is done as an
     * INSERT if tairobj_ref_id is null; if id is not null store operation is 
     * done as an UPDATE. If id is null but a row is found in TairObj_Ref that
     * has the unique combination of tair_object_id, reference_id and 
     * attribution_type_id in object, object will considered to exists, but 
     * UPDATE operation will not be executed. This is because the combination
     * of the three keys represents all information in the table, meaning
     * that there is no data to actually update the record with.
     *
     * <p>
     * When updating, RecordNotFoundException will be thrown if no row is found
     * with object's tairobj_ref_id; When INSERTing, newly created 
     * tairobj_ref_id will be stored internally for reference;
     *
     * @param conn An active connection to the database with INSERT/UPDATE 
     * permissions
     * @throws SQLException thrown if a database error occurs
     * @throws InvalidActionException thrown if either tair object id or 
     * reference id is null
     */
    public void store( DBconnection conn ) 
	throws SQLException, InvalidActionException {

	StringBuffer query = new StringBuffer();
	ResultSet results = null;

	if ( get_tair_object_id() == null || get_reference_id() == null ) {
	    throw new InvalidActionException( "db storage failed for " +
					      "tair_object_id " + 
					      get_tair_object_id() + ", " +
					      "reference_id " + 
					      get_reference_id() + 
					      " - one or more ids is null" );
	}
    
	// even if tairobj_ref_id is null, check if row exists w/composite keys
	boolean exists = false;
	if ( get_tairobj_ref_id() != null ) {
	    exists = true;
	}else{
	    exists = rowExists( conn );      
	}

	if ( !exists ) {
	    query.append(
			 "INSERT INTO TairObj_Ref ( " +
			 "tairobj_ref_id, " + 
			 "tair_object_id, " +
			 "reference_id, " +
			 "attribution_type_id " +
			 ") VALUES ( " +
			 "TAIROBJ_REF_SEQ.NEXTVAL, " + 
			 get_tair_object_id() + ", " +
			 get_reference_id() + ", " +
			 get_attribution_type_id() + 
			 ") ");
			 conn.setInsertQuery( query.toString(), "TAIROBJ_REF_ID" );
			 Long id = conn.executeInsert();
			 set_tairobj_ref_id( id );
	    conn.releaseResources();
      

	    // only do UPDATE if using tairobj_ref_id -- update not needed if 
	    // we've determined that row exists using composite key criteria 
	    // since the combination of keys represents all the info. in the 
	    // table
	} else if ( get_tairobj_ref_id() != null ) {
	    query.append( "UPDATE TairObj_Ref SET " +
			  "tair_object_id = " + get_tair_object_id() + ", " +
			  "reference_id = " + get_reference_id() + ", " +
			  "attribution_type_id = " + 
			  get_attribution_type_id() + " " +
			  "WHERE tairobj_ref_id = " + 
			  get_tairobj_ref_id().toString() 
			  );
      
	    System.out.println( query.toString() );
      
      
	    conn.setQuery( query.toString() );
	    int rowsAffected = conn.executeUpdate();
	    conn.releaseResources();
      
	    if ( rowsAffected <= 0 ) {
		throw new RecordNotFoundException( "UPDATE failed: no row " +
						   "found for tairobj_ref_id " + 
						   get_tairobj_ref_id() );
	    }
	}
    }

    /**
     * For unit testing only
     */
    public void test(){
	System.out.println( "****** TfcTairObjRef content test ******" );
	System.out.println( "reference_id: " + get_reference_id() );
	System.out.println( "attribution_type_id: " + get_attribution_type_id() );
	System.out.println( "tair_object_id: " + get_tair_object_id() );
	System.out.println( "tairobj_ref_id: " + get_tairobj_ref_id() );    
	System.out.println( "**** TfcTairObjRef content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ){

	try{
	    DBconnection conn = new DBconnection();

	    System.out.println( "Creating from tairobj_ref_id..." );
	    Long tairObjRefID = new Long( 14 );
	    TfcTairObjRef ref = new TfcTairObjRef( conn, tairObjRefID );
	    ref.test();

	    System.out.println( "\nCreating from reference id, " +
				"attribution type id and tair object id..." );
	    Long tairObjectID = new Long( 1950429 );
	    Long referenceID = new Long( 1 );
	    //	    Long attributionTypeID = new Long( 15 );
	    Long attributionTypeID = null;
	    ref = new TfcTairObjRef( conn, 
				     tairObjectID, 
				     referenceID, 
				     attributionTypeID );
	    ref.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }

}
