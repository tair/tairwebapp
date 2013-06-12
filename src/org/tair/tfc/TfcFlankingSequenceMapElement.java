/**
 * This class map to the table FlankingSequenceMapElement in the tair 
 * database. Each instance maps one row of data in FlankingSequenceMapElement 
 * table. Each data object maps to one field of a row in the table. Each 
 * field has one set method and one get method for accessing from outside of 
 * class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;
import org.tair.utilities.*;
import java.sql.*;

public class TfcFlankingSequenceMapElement {   

  private Long map_element_id;
  private Long flank_sequences_id;

  /**
   * Creates an empty instance of TfcFlankingSequenceMapElement
   */
  public TfcFlankingSequenceMapElement() { }
  
  /**
   * TfcFlankingSequenceMapElement constructor initializes each field according to the value
   * of the object id in the database.  The DBconnection instance is
   * required for database access.  If no row is found corresponding to this
   * object, the instance of TfcFlankingSequenceMapElement is null
   * @param connection An active connection to the database
   * @param flank_sequences_id the object id of a row in the FlankingSequenceMapElement table
   * @param map_element_id the object id of a row in the FlankingSequenceMapElement table
   * @throws SQLException in the case of an invalid operation or database error
   */
  public TfcFlankingSequenceMapElement( DBconnection connection, Long flank_sequences_id, Long map_element_id ) throws SQLException {
    String query = null;

    if ( flank_sequences_id != null && map_element_id != null ) {
	query =
	  "select flank_sequences_id, "+
	  "map_element_id "+
	  "from FlankingSequence_MapElement "+
	  "where map_element_id = " + map_element_id.toString() + " " +
	  "and flank_sequences_id = " + flank_sequences_id.toString();
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
	}
	connection.releaseResources();
    }
  }


  public void set_map_element_id ( Long value ) { map_element_id = value; }
  public Long get_map_element_id() { return map_element_id; }

  public void set_flank_sequences_id ( Long value ) { flank_sequences_id = value; }
  public Long get_flank_sequences_id() { return flank_sequences_id; }

  /**
   * test TfcFlankingSequenceMapElement content
   */
  public void test() {
    System.out.println( "****** TfcFlankingSequenceMapElement content test ******" );
    System.out.println( "map_element_id is " + this.get_map_element_id() );
    System.out.println( "flank_sequences_id is " + this.get_flank_sequences_id() );
    System.out.println( "**** TfcFlankingSequenceMapElement content test end ****" );

  }
  
  /**
   * main function is used to for testing only 
    */
  public static void main( String[] args ) {
    
    try{
      DBconnection connection = new DBconnection();
      Long map_element_id = new Long( 1012944 );
      Long flank_id = new Long( 14 );
      TfcFlankingSequenceMapElement species_poly_state = new TfcFlankingSequenceMapElement( connection, flank_id, map_element_id );
      species_poly_state.test();
      System.out.println( "**********************************************" );
    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }

}
