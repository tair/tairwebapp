/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.tfc;

import java.io.Serializable;
import java.sql.*;

import org.tair.utilities.*;


/**
 * This class maps to the GeneAlias table in the tair database. Each instance
 * maps one row of data in GeneAlias table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 *
 * <p>
 * Implements Serializable so object data can be written to file for
 * stock catalog data files
 */


public class TfcGeneAlias implements Serializable {   

    private Long gene_alias_id;
    private Long gene_id;
    private Long reference_id;
    private Long community_id;
    private String alias;
    private String original_alias;
    private String alias_type;

    /**
     * Creates an empty instance of TfcGeneAlias
     */
    public TfcGeneAlias() {  }

    /**
     * Creates an instance of TfcGeneAlias that reflects data referenced by
     * submitted gene_alias_id
     *
     * @param conn An active connection to the database
     * @param gene_alias_id ID to retrieve data for
     * @exception SQLException if a database error occurs or if no row found for submitted
     * gene_alias_id
     */
    public  TfcGeneAlias( DBconnection conn, Long gene_alias_id ) throws SQLException {
        String query = null;
        boolean found = false;

        if ( gene_alias_id != null ) {
            query = getSelect() + "WHERE gene_alias_id = " + gene_alias_id.toString();
            found = processResults( conn, query );
        }
    
        if ( !found ) {
            throw new RecordNotFoundException( "No gene alias found for gene alias id: " + gene_alias_id );
        }
    
    }
  
    private String getSelect() {
        String query = 
            "SELECT gene_id, " +
            "gene_alias_id, " +
            "alias, " +
            "original_alias," +
            "alias_type, " +
            "community_id, " +
            "reference_id " +
            "FROM GeneAlias ";
        return query;
    }
    

    private boolean processResults( DBconnection conn, String query ) throws SQLException {
        boolean found = false;
        ResultSet results = null;

        conn.setQuery( query );
        results = conn.getResultSet();
        if ( results.next() ) {
            found = true;
            long id = results.getLong( "gene_id" );
            if ( !results.wasNull() ) {
                set_gene_id( new Long( id ) );
            }
      
            id = results.getLong( "gene_alias_id" );
            if ( !results.wasNull() ) {
                set_gene_alias_id( new Long( id ) );
            }
      
            set_alias( results.getString( "alias" ) );
            set_original_alias( results.getString( "original_alias" ) );
            set_alias_type( results.getString( "alias_type" ) );
      
            id = results.getLong( "community_id" );
            if ( !results.wasNull() ) {
                set_community_id( new Long( id ) );
            }
      
            id = results.getLong( "reference_id" );
            if ( !results.wasNull() ) {
                set_reference_id( new Long( id ) );
            }
        }
        conn.releaseResources();

        return found;
    }


    public void set_gene_alias_id ( Long id ) { this.gene_alias_id = id; }
    public Long get_gene_alias_id() { return gene_alias_id; }

    public void set_gene_id ( Long id ) { this.gene_id = id; }
    public Long get_gene_id() { return gene_id; }

    public void set_alias ( String alias ) { this.alias = alias; }
    public String get_alias() { return alias; }

    public void set_original_alias ( String alias ) { this.original_alias = alias; }
    public String get_original_alias() { return original_alias; }

    public void set_alias_type ( String type ) { this.alias_type = type; }
    public String get_alias_type() { return alias_type; }

    public void set_community_id ( Long id ) { this.community_id = id; }
    public Long get_community_id() { return community_id; }

    public void set_reference_id ( Long id ) { this.reference_id = id; }
    public Long get_reference_id() { return reference_id; }

    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** GeneAlias content test ****** " );
        System.out.println( "gene_id: " + get_gene_id() );
        System.out.println( "gene_alias_id: " + get_gene_alias_id() );
        System.out.println( "alias: " + get_alias() );
        System.out.println( "original_alias: " + get_original_alias() );
        System.out.println( "alias_type: " + get_alias_type() );
        System.out.println( "community_id: " + get_community_id() );
        System.out.println( "reference_id: " + get_reference_id() );
        System.out.println( "**** GeneAlias content test end **** " );      
    }
  
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long id = new Long( 1001147762 );
            TfcGeneAlias alias = new TfcGeneAlias( conn, id );
            alias.test();

        } catch (Exception e ) {
            e.printStackTrace();
        }
    }
}
