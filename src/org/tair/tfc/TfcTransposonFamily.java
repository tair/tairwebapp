//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.26 $
// $Date: 2005/02/10 20:28:05 $
//------------------------------------------------------------------------------ 

package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;

/**
 * This class maps to the TransposonFamily table in the tair database. Each instance
 * maps one row of data in TransposonFamily table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method 
 * for accessing from outside of class.
 */

public class TfcTransposonFamily extends TfcTairObject{

    private Long transposon_family_id;
    private String name;
    private String super_family_name;
    private Boolean is_obsolete;
    private java.util.Date date_entered;
    private java.util.Date date_last_updated;
    
    /**
     * Creates an empty instance of TfcTransposonFamily
     */
    public TfcTransposonFamily() { 
        super();
    }

    /**
     * Creates an instance of TfcTransposonFamily that reflects the data referenced
     * by submitted transposon_family_id
     *
     * @param conn An active connection to the database
     * @param transposon_family_id Transposon Family id to retrieve data for
     * @throws RecordNotFoundException if no row found for gene_id
     * @throws SQLException if a database error occurs
     */
    public TfcTransposonFamily( DBconnection conn, Long transposon_family_id ) 
	throws RecordNotFoundException, SQLException {

        super( conn, transposon_family_id);   
    }

    /**
     * Implements abstract method in superclass to return "TransposonFamily"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "TransposonFamily";
    }
    
    /**
    * Implements abstract method in superclass to return full list of
    * all TransposonFamily specific columns to be included in SQL SELECT statement 
    * when populating object.
    *
    * @return String array of all TransposonFamily specific columns to include in 
    * SELECT statement when populating object.
    */
    public final String[] getColumns() {
        String[] localClassColumns = new String[] { 
        "transposon_family_id", 
        "name", 
        "super_family_name",
        "is_obsolete", 
        "date_entered", 
        "date_last_updated"
        };
        return localClassColumns;
    }
   
    /**
    * Implements abstract method in superclass to return "transposon_family_id" as 
    * name of primary key column to use when creating SQL statement 
    * for object population.
    *
    * @return Name of primary key column to use in SQL SELECT statement
    */
    public final String getKeyColumn() {
        return "transposon_family_id";
    }

    /**
    * Retrieves TransposonFamily specific data from result set and stores in member 
    * variables.
    *
    * @param results ResultSet to populate member variables with
    * @throws SQLException if a database error occurs
    */
    public final void populate( ResultSet results) throws SQLException {
        set_transposon_family_id( new Long(results.getLong( "transposon_family_id") ) );
        set_date_entered( results.getDate("date_entered"));
        set_date_last_updated( results.getDate("date_last_updated") );
        set_super_family_name( results.getString("super_family_name") );
        set_name( results.getString( "name") );
        set_is_obsolete(TextConverter.stringToBoolean(results.getString("is_obsolete")));
    }
    
    public static int getAssocTransposons( DBconnection conn, Long family_id) 
    throws SQLException {
        int count = 0;
        String query = "SELECT count(*) as transposon_count FROM Transposon " +
            "WHERE transposon_family_id = " + String.valueOf(family_id );
        conn.setQuery( query );
        ResultSet results = conn.getResultSet();
        if (results.next() ){
            count = results.getInt("transposon_count");
        }
        conn.releaseResources();
        return count;
    }
    
    /**
    * Retrieve transposon_family id for submitted transposon_family name
    *
    * @param conn An active connection to the database
    * @param name Name to retrieve transposon_family id for
    * @return TransposonFamily id for the submitted transposon name
    * @throws SQLException if a database error occurs
    */
    public static Long retrieveFamilyID( DBconnection conn, String name)
    throws SQLException {
        Long id = null;
        String query = "SELECT transposon_family_id " +
            "FROM TransposonFamily "+
            "WHERE UPPER(name) = " + TextConverter.dbQuote( name );
        conn.setQuery(query);
        ResultSet results = conn.getResultSet();
        if (results.next() ){
            id = new Long(results.getLong("transposon_family_id") );
        }
        conn.releaseResources();
        return id;
    }
    
    /**
    * Get 'em and set 'em
    *
    */
    public void set_transposon_family_id(Long id) {
        this.transposon_family_id = id;
    }
    public Long get_transposon_family_id(){
        return transposon_family_id;
    }
    public void set_date_last_updated(java.util.Date value){
        this.date_last_updated = value;
    }
    public java.util.Date get_date_last_updated(){
        return date_last_updated;
    }
    public void set_date_entered(java.util.Date value){
        this.date_entered = value;
    }
    public java.util.Date get_date_entered(){
        return date_entered;
    }
    public void set_super_family_name(String name){
        this.super_family_name = name;
    }
    public String get_super_family_name(){
        return super_family_name;
    }
    public void set_name(String name){
        this.name = name;
    }
    public String get_name(){
        return name;
    }
    public void set_is_obsolete(Boolean is_obsolete){
        this.is_obsolete = is_obsolete;
    }
    public Boolean get_is_obsolete(){
        return is_obsolete;
    }

    /**
     * For unit testing only
     */
    public void test() {
        super.test();
        System.out.println( "****** TfcTransposonFamily content test ******" );
        System.out.println("family_id: " + get_transposon_family_id() );
        System.out.println("name: " + get_name() );
        System.out.println("is_obsolete: " + get_is_obsolete() );
        System.out.println("date_entered: " + get_date_entered() );
        System.out.println("super_family_name: " + get_super_family_name() );
        System.out.println("date_last_updated: " + get_date_last_updated() );
        System.out.println( "**** TfcTransposonFamily content test end ****" );
        
    }
    
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{
            DBconnection conn = new DBconnection();
            Long test_id = new Long( 122 );

            TfcTransposonFamily transposon_family = new TfcTransposonFamily( conn, test_id );
            transposon_family.test();

        }  catch( Exception e ) {
            e.printStackTrace();
        }
    }
}
