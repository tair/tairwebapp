/**
 * This class maps to the AnalysisReference table. Each instance represents
 * one row of data; each member variable maps to a column of a row in the table.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */

package org.tair.tfc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

public class TfcAnalysisReference extends TfcReference {   

  private Long analysis_reference_id;
  private Long evidence_id;
  private Long analysis_software_id;
  private String name;
  private String parameters;
  private String output_definition_criteria;
  private java.util.Date date_run;
  private Boolean is_nucleotide;
  private Boolean is_peptide;

  /**
   * Creates an empty instance of TfcAnalysisReference
   */
  public TfcAnalysisReference() { 
    super();
  }

  
  /**
   * Creates an instance of TfcAnalysisReference that reflects the data in 
   * submitted reference id
   * 
   * @param conn An active connection to the database
   * @param reference_id Reference id to retrieve data for
   * @exception SQLException thrown if a database error occurs or if no
   * row found with submitted id
   */
  public  TfcAnalysisReference( DBconnection conn, Long reference_id ) throws SQLException {
    super( conn, reference_id ); 

    String query = null;
    boolean found = false;
    if ( reference_id != null ) {
      query = getBaseQuery() + "WHERE reference_id = " + reference_id.toString();
      found = processResults( conn, query );
    }
    if ( !found ) {
      throw new RecordNotFoundException( "No analysis reference found with reference id: " + reference_id );
    }
  }

  
  /**
   * Creates an instance of TfcAnalysisReference that reflects
   * the data referenced by submitted analysis reference name
   *
   * @param conn An active connection to the database
   * @param name Analysis reference name to retrieve data for
   * @exception SQLException thrown if a database error occurs, or if no row
   * found with submitted name
   */
  public TfcAnalysisReference( DBconnection conn, String name ) throws SQLException {
    super( conn, get_super_id( conn, name ) );
 
    String query = null;
    boolean found = false;

    if ( name != null ) {
      query = getBaseQuery() + "WHERE name = " + TextConverter.dbQuote( name );
      found = processResults( conn, query );
    }

    if ( !found ) {
      throw new RecordNotFoundException( "No analysis reference found with name: " + name );
    }
  }
  
  private String getBaseQuery() {
    String query = 
      "SELECT analysis_reference_id, " +
      "analysis_software_id, " +
      "name, " +
      "parameters, " +
      "output_definition_criteria, " +
      "date_run, " +
      "is_nucleotide, " +
      "is_peptide " +
      "FROM AnalysisReference ";
    return query;
  }

  public String getReferenceLabel() { return name + " (" + date_run + ")"; }
  
  private boolean processResults( DBconnection conn, String query ) throws SQLException {
    ResultSet results = null;
    boolean found = false;

    conn.setQuery( query );
    results = conn.getResultSet();	       
    found = results.next();
    if ( found ) {
      this.analysis_reference_id = new Long( results.getLong( "analysis_reference_id" ) );
      long id = results.getLong( "analysis_software_id" );
      if ( !results.wasNull() ) {
	this.analysis_software_id = new Long( id );
      }
      
      this.name = results.getString( "name" );
      this.parameters = results.getString( "parameters" );
      this.output_definition_criteria = results.getString( "output_definition_criteria" );
      this.date_run =  results.getDate( "date_run" );
      this.is_nucleotide = TextConverter.stringToBoolean( results.getString( "is_nucleotide" ) );
      this.is_peptide = TextConverter.stringToBoolean( results.getString( "is_peptide" ) );
    }
    conn.releaseResources();
    return found;
  }
  

  /**
   * Retrieves reference id for submitted analysis reference name
   *
   * @param conn An active connection to the database
   * @param name Name to retrieve reference id for
   * @return Reference id of submitted name, or <code>null</cod> if name not
   * found in AnalysisReference table
   * @exception SQLException thrown if a database error occurs
   */
  public static Long get_super_id( DBconnection conn, String name ) throws SQLException {
    Long referenceID = null;
    String query = null;
    ResultSet results = null;

    if ( name != null ) {
      query =
	"SELECT reference_id "+
	"FROM AnalysisReference "+
	"WHERE name = " + TextConverter.dbQuote( name );
      conn.setQuery( query );
      results = conn.getResultSet();	       
      if ( results.next() ) {
	referenceID = new Long( results.getLong( "reference_id" ) );
      }
      conn.releaseResources();
    }
    return referenceID;
  }

  public void set_analysis_reference_id( Long id ) { this.analysis_reference_id = id; }
  public Long get_analysis_reference_id() { return analysis_reference_id; }

  public void set_analysis_software_id( Long id ) { this.analysis_software_id = id; }
  public Long get_analysis_software_id() { return analysis_software_id; }

  public void set_name( String name ) { this.name = name; }
  public String get_name() { return name;  }

  public void set_parameters( String params ) { this.parameters = params; }
  public String get_parameters() { return parameters; }

  public void set_output_definition_criteria( String criteria ) { this.output_definition_criteria = criteria; }
  public String get_output_definition_criteria() { return output_definition_criteria; }

  public void set_date_run( java.util.Date date ) { this.date_run = date; }
  public java.util.Date get_date_run() { return date_run; }

  public void set_is_nucleotide( Boolean is_nucleotide ) { this.is_nucleotide = is_nucleotide; }
  public Boolean get_is_nucleotide() { return is_nucleotide; }

  public void set_is_peptide( Boolean is_peptide ) { this.is_peptide = is_peptide; }
  public Boolean get_is_peptide() { return is_peptide; }

  public void set_evidence_id ( Long id ) { this.evidence_id = id; }
  public Long get_evidence_id() { return evidence_id; }

  /**
   * For unit testing only
   */
  public void test() {
    super.test();
    System.out.println( "****** TfcAnaylysisReference content test ******" );
    System.out.println( "analysis_reference_id: " + get_analysis_reference_id() );
    System.out.println( "analysis_software_id: " + get_analysis_software_id() );
    System.out.println( "evidence_id: " + get_evidence_id() );
    System.out.println( "name: " + get_name() );
    System.out.println( "parameters: " + get_parameters() );
    System.out.println( "output_definition_criteria: " + get_output_definition_criteria() );
    System.out.println( "run: " + get_date_run() );
    System.out.println( "is_nucleotide: " + get_is_nucleotide() );
    System.out.println( "is_peptide: " + get_is_peptide() );
    System.out.println( "reference_id: " + get_reference_id() );
    System.out.println( "**** TfcAnalysisReference content test end ****" );
  }
}
