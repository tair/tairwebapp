//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.5 $
// $Date: 2004/09/02 22:15:54 $
//------------------------------------------------------------------------------ 
package org.tair.tfc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.tair.utilities.RecordNotFoundException;


/**
 * This class maps to the DomainMatch table in the tair database. Each 
 * instance maps one row of data in DomainMatch table. Each data object 
 * maps to one field of a row in the table. Each field has one set method 
 * and one get method for accessing from outside of class.
 */



public class TfcDomainMatch extends TfcEvidence {   

  private Long domain_match_id;
  private Long protein_domain_id;
  private Long aa_sequence_id;
  private Integer start_position;
  private Integer end_position;
  private Float score;

  /**
   * Creates an empty instance of TfcDomainMatch
   */
  public TfcDomainMatch() {  
      super();
  }


  /**
   * Creates an instance of TfcDomainMatch that reflects the data referenced
   * by submitted evidence id.
   *
   * @param conn An active connection to the database
   * @param evidence_id Evidence id to retrieve data for
   * @throws RecordNotFoundException if no row found for evidence_id
   * @throws SQLException if a database error occurs
   */
    public TfcDomainMatch( DBconnection conn, Long evidence_id ) 
	throws RecordNotFoundException, SQLException {

	super( conn, evidence_id );

	String query =  
	    "SELECT domain_match_id, "+ 
	    "protein_domain_id, "+
	    "aa_sequence_id, "+ 
	    "score, "+
	    "start_position, "+
	    "end_position "+
	    "FROM DomainMatch "+ 
	    "WHERE evidence_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( evidence_id );

	ResultSet results = conn.getResultSet();	       

	boolean found = processResults( results );
	conn.releaseResources();

	if ( !found ) {
	    throw new RecordNotFoundException( "No domain match found " +
					       "for evidence id: " + 
					       evidence_id );
	}
    }


    /**
     * Retrieves data from row of submitted result set and stores
     * in member variables
     *
     * @return <code>true</code> if result set contained a row of
     * results, <code>false</code> if result set contained no rows of
     * results
     * @throws SQLException if a database error occurs
     */
    private boolean processResults( ResultSet results ) throws SQLException {

	boolean found = results.next();

	if ( found ) {
	    
	    long id = results.getLong( "domain_match_id" );
	    if ( !results.wasNull() ) {
		this.domain_match_id = new Long( id );
	    }
	  
	    id = results.getLong( "protein_domain_id" );
	    if ( !results.wasNull() ) {
		this.protein_domain_id = new Long( id );
	    }
	    
	    id = results.getLong( "aa_sequence_id" );
	    if ( !results.wasNull() ) {
		this.aa_sequence_id = new Long( id );
	    }
	    
	    float f = results.getFloat( "score" );
	    if ( !results.wasNull() ) {
		this.score = new Float( f );
	    }
	    
	    int i  = results.getInt( "start_position" );
	    if ( !results.wasNull() ) {
		this.start_position = new Integer( i );
	    }
	    
	    i  = results.getInt( "end_position" );
	    if ( !results.wasNull() ) {
		this.end_position = new Integer( i );
	    }
	}

	return found;
    }

    public void set_domain_match_id( Long id ) { 
	this.domain_match_id = id;
    }

    public Long get_domain_match_id() {
	return domain_match_id; 
    }

    public void set_aa_sequence_id( Long id ) {
	this.aa_sequence_id = id;
    }

    public Long get_aa_sequence_id() {
	return aa_sequence_id; 
    }

    public void set_protein_domain_id( Long id ) { 
	this.protein_domain_id = id;
    }

    public Long get_protein_domain_id() {
	return protein_domain_id; 
    }

    public void set_start_position( Integer position ) {
	this.start_position = position;
    }

    public Integer get_start_position() {
	return start_position; 
    }

    public void set_end_position( Integer position ) {
	this.end_position = position;
    }

    public Integer get_end_position() {
	return end_position; 
    }

    public void set_score( Float score ) {
	this.score = score;
    }

    public Float get_score() { 
	return score;
    }
  
    /**
     * For unit testing only
     */
    public void test() {
	super.test();
	System.out.println( "****** TfcDomainMatch content test ******" );
	System.out.println( "domain_match_id: " + get_domain_match_id() );
	System.out.println( "aa_sequence_id: " + get_aa_sequence_id() );
	System.out.println( "protein_domain_id: " + get_protein_domain_id() );
	System.out.println( "score: " + get_score() );
	System.out.println( "start_position: " + get_start_position() );
	System.out.println( "end_position: " + get_end_position() );
	System.out.println( "**** TfcDomainMatch content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
    
	try {

	    DBconnection conn = new DBconnection();
	    Long id = new Long( 500132914 );
	    TfcDomainMatch domain_match = new TfcDomainMatch( conn, id ); 
	    domain_match.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }
}
