/**
 * This class map to the table FlankingSequence in the tair database. Each 
 * instance maps one row of data in FlankingSequence table. Each data object 
 * maps to one field of a row in the table. Each field has one set method 
 * and one get method for accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;

public class TfcFlankingSequence {   

  private Long flank_sequences_id;
  private Long map_element_id;
  private String flankingsequence_type;
  private String sequence1;
  private String sequence2;


  /**
   * Creates an empty instance of TfcFlankingSequence
   */
  public TfcFlankingSequence() {  }

  /**
   * TfcFlankingSequence constructor initializes each field according to the value
   * of the object id in the database.  The DBconnection instance is
   * required for database access.  If no row is found corresponding to this
   * object, the instance of TfcFlankingSequence is null
   * @param connection the instance of DBconnection
   * @param flank_sequences_id the object id of a row in the FlankingSequence table
   * @throws SQLException in the case of an invalid operation or database error
   */
  public TfcFlankingSequence( DBconnection connection, Long flank_sequences_id ) throws SQLException  {
    String query = null;
    if ( flank_sequences_id != null ) {
      query ="select flank_sequences_id, "+
	"map_element_id, "+
	"flankingsequence_type, "+
	"sequence1, "+
	"sequence2 "+
	"from FlankingSequence "+
	"where flank_sequences_id = " + flank_sequences_id.toString();
      connection.setQuery( query );
      ResultSet results = connection.getResultSet();
      if ( results.next() ) {
	long id = results.getLong( "flank_sequences_id" );
	if ( !results.wasNull() ) {
	  this.flank_sequences_id = new Long( id );
	}
		       
	id = results.getLong( "map_element_id" );
	if ( !results.wasNull() ) {
	  this.map_element_id = new Long( id );
	}
		       
	this.flankingsequence_type = results.getString( "flankingsequence_type" );
	this.sequence1 = results.getString( "sequence1" );
	this.sequence2 = results.getString( "sequence2" );		   
      }
      connection.releaseResources();
    }
  }

  public void set_flank_sequences_id ( Long value ) { flank_sequences_id = value; }
  public Long get_flank_sequences_id() { return flank_sequences_id; }

  public void set_map_element_id ( Long value ) { map_element_id = value; }
  public Long get_map_element_id() { return map_element_id; }

  public void set_flankingsequence_type ( String value ) { flankingsequence_type = value; }
  public String get_flankingsequence_type() { return flankingsequence_type; }

  public void set_sequence1 ( String value ) { sequence1 = value; }
  public String get_sequence1() { return sequence1; }

   /**
   * gets sequence1 with line breaks.
   * @param br the html string to use as a line break, either "<br>" or "<br/>"
   */
  public String get_sequence1_with_breaks(String br) { return format_sequence(sequence1,br); }

  public void set_sequence2 ( String value ) { sequence2 = value; }
  public String get_sequence2() { return sequence2; }	

   /**
   * gets sequence2 with line breaks.
   * @param br the html string to use as a line break, either "<br>" or "<br/>"
   */
  public String get_sequence2_with_breaks(String br) { return format_sequence(sequence2,br); }	

   /**
   * Breaks up the given sequence using the given br string.
   * @param seq the sequence in which to insert line breaks"
   * @param br the html string to use as a line break, either "<br>" or "<br/>"
   */
  public static String format_sequence(String seq, String br)
  {
    if(seq == null || seq.equals(""))
      return "";
    StringBuffer sb = new StringBuffer();
    int row_len = 60, seq_len = seq.length();
    int s = 0, e = java.lang.Math.min(row_len,seq_len);
    sb.append(seq.substring(s,e));
    while(e < seq_len) {
      s = e;
      e += java.lang.Math.min(row_len,seq_len-e);
      sb.append(br+seq.substring(s,e));
    }
    return sb.toString();
  }

  /**
   * test TfcFlankingSequence content
   */
  public void test() {
    System.out.println( "****** TfcFlankingSequence content test ******" );
    System.out.println( "map_element_id is " + this.get_map_element_id() );
    System.out.println( "flank_sequences_id is " + this.get_flank_sequences_id() );
    System.out.println( "flankingsequence_type is " + this.get_flankingsequence_type() );
    System.out.println( "sequence1 is " + this.get_sequence1() );
    System.out.println( "sequence2 is " + this.get_sequence2() );
    System.out.println( "**** TfcFlankingSequence content test end ****" );
  }

  /**
   * main function is used to for testing only 
   */
  public static void main( String[] args ) {
    
    try{
      DBconnection connection = new DBconnection();
      Long test_id = new Long( 526 );
      TfcFlankingSequence sequence = new TfcFlankingSequence( connection,test_id );
      sequence.test();
      System.out.println( "**********************************************" );
    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }
}
