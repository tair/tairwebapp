/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.tfc;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.jboss.logging.Logger;

/**
 * This class maps to the Alias table in the tair database. Each instance
 * maps one row of data in Alias table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 *
 * <p>
 * Implements Serializable so object data can be written to file for
 * stock catalog data files
 */


public class TfcAlias implements Serializable {   
  private static final Logger logger = Logger.getLogger(TfcAlias.class);

    private Long alias_id;
    private Long tair_object_id;
    private String alias;
    private String original_alias;
    private String alias_type;
    private String note;

    /**
     * Creates an empty instance of TfcAlias
     */
    public TfcAlias() { }

  
    /**
     * Creates an instance of TfcAlias that reflects the data referenced
     * by submitted alias_id
     *
     * @param conn An active connection to the database
     * @param alias_id Alias id to retrieve data for
     * @throws SQLException in the case of an invalid operation or database error
     */
    public  TfcAlias( DBconnection conn, Long alias_id ) throws SQLException {
        String query = null;

        if ( alias_id != null ) {
            query = 
                "SELECT tair_object_id, "+
                "alias_id, "+
                "alias, "+
                "original_alias," +
                "alias_type, "+
                "note  "+
                "FROM Alias "+
                "WHERE alias_id = " + alias_id.toString();
            processResults( conn, query );
        }
    }

    private void processResults( DBconnection conn, String query ) throws SQLException {
        try {
          conn.setQuery( query );
          ResultSet results = conn.getResultSet();
          if ( results.next() ) {
              this.tair_object_id = new Long( results.getLong( "tair_object_id" ) );
              this.alias_id = new Long( results.getLong( "alias_id" ) );
              this.alias = results.getString( "alias" );
              this.original_alias = results.getString( "original_alias" );
              this.alias_type = results.getString( "alias_type" );
              this.note = results.getString( "note" );
          }
        } finally {
          conn.releaseResources();
        }
    }


    public void set_alias_id ( Long value ) { alias_id = value; }
    public Long get_alias_id() { return alias_id; }

    public void set_tair_object_id ( Long value ) { tair_object_id = value; }
    public Long get_tair_object_id() { return tair_object_id; }

    public void set_alias ( String value ) { alias = value; }
    public String get_alias() { return alias; }

    public void set_original_alias ( String value ) { original_alias = value; }
    public String get_original_alias() { return original_alias; }

    public void set_type ( String value ) {  alias_type = value; }
    public String get_type() { return alias_type; }

    public void set_note ( String value ) {  note = value; }
    public String get_note() { return note; }

    /**
     * For unit testing only
     */
    public void test() {
      logger.debug( "****** TfcAlias content test ******" );
      logger.debug( "tair_object_id is " + this.get_tair_object_id() );
      logger.debug( "alias_id is " + this.get_alias_id() );
      logger.debug( "alias is " + this.get_alias() );
      logger.debug( "original_alias is " + this.get_original_alias() );
      logger.debug( "alias_type is " + this.get_type() );
      logger.debug( "note is " + this.get_note() );
      logger.debug( "**** TfcAlias content test end ****" );
    }

  
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

        try{
            DBconnection conn = new DBconnection();
            Long test_id = new Long( 572 );
            TfcAlias alias = new TfcAlias( conn, test_id );
            alias.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
