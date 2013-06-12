//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.26 $
// $Date: 2005/02/10 20:28:05 $
//------------------------------------------------------------------------------ 

package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;

/**
 * This class maps to the Transposon table in the tair database. Each instance
 * maps one row of data in the Transposon table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method 
 * for accessing from outside of class.
 */

public class TfcTransposon extends TfcMapElement {

    private Long transposon_id;
    private String name;
    private String chromosome;
    private Long family_id;
    private Long map_element_id;
    private Boolean is_obsolete;
    private java.util.Date date_entered;
    private java.util.Date date_last_updated;
    
    /**
     * Creates an empty instance of TfcTransposon
     */
    public TfcTransposon() { 
        super();
    }

    /**
     * Creates an instance of TfcTransposon that reflects the data referenced
     * by submitted transposon_id
     *
     * @param conn An active connection to the database
     * @param transposon_id Transposon id to retrieve data for
     * @throws RecordNotFoundException if no row found for transposon_id
     * @throws SQLException if a database error occurs
     */
    public TfcTransposon( DBconnection conn, Long transposon_id ) 
	throws RecordNotFoundException, SQLException {

        super( conn, transposon_id);   
    }

    /**
     * Implements abstract method in superclass to return "Transposon"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "Transposon";
    }
    
    /**
    * Implements abstract method in superclass to return full list of all
    * Transposon specific columns to be included in the SQL SELECT statement
    * when populating an object
    *
    * @return String array of all Transposon specific columns to include in
    * SELECT statement when populating object.
    */
    public final String[] getColumns() {
        String[] localClassColumns = new String[] { 
        "transposon_id", 
        "name", 
        "chromosome", 
        "transposon_family_id",
        "map_element_id", 
        "is_obsolete", 
        "date_entered", 
        "date_last_updated"
        };
        return localClassColumns;
    }
   
    /**
    * Implements abstract method in superclass to return "transposon_id"
    * as name of primary key column to use when creating SQL statement for 
    * object population.
    *
    * @return Name of primary key column to use in SQL SELECT statement
    */
    public final String getKeyColumn() {
        return "transposon_id";
    }

    /**
    * Retrieves Transposon specific data from result set and stores in member
    * variables.
    *
    * @param results ResultSet to populate member variables with
    * @throws SQLException if a database error occurs
    */
    public final void populate( ResultSet results) throws SQLException {
        set_transposon_id( new Long(results.getLong( "transposon_id") ) );
        set_chromosome( results.getString( "chromosome" ) );
        set_date_entered( results.getDate("date_entered"));
        set_date_last_updated( results.getDate("date_last_updated") );
        set_family_id( new Long(results.getLong("transposon_family_id") ) );
        set_name( results.getString( "name") );
        set_is_obsolete(TextConverter.stringToBoolean(results.getString("is_obsolete")));
    }

    /**
    * Retrieve transposon id for submitted transposon name
    *
    * @param conn An active connection to the database
    * @param name Name to retrieve transposon id for
    * @return Transposon id for the submitted transposon name
    * @throws SQLException if a database error occurs
    */
    public static Long retrieveTransposonID( DBconnection conn, String name)
    throws SQLException {
        Long id = null;
        String query = "SELECT transposon_id " +
            "FROM Transposon "+
            "WHERE UPPER(name) = " + TextConverter.dbQuote( name );
        conn.setQuery(query);
        ResultSet results = conn.getResultSet();
        if (results.next() ){
            id = new Long(results.getLong("transposon_id") );
        }   
        conn.releaseResources();
        return id;
    }

    /**
    * Get 'em and set 'em
    *
    */
    public void set_transposon_id(Long id) {
        this.transposon_id = id;
    }
    public Long get_transposon_id(){
        return transposon_id;
    }
    public void set_chromosome(String chromosome) {
        this.chromosome = chromosome;
    }
    public String get_chromosome(){
        return chromosome;
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
    public void set_family_id(Long id){
        this.family_id = id;
    }
    public Long get_family_id(){
        return family_id;
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
        System.out.println( "****** TfcTransposon content test ******" );
        System.out.println("transposon_id: " + get_transposon_id() );    
        System.out.println("name: " + get_name() );    
        System.out.println("chromosome: " + get_chromosome() );    
        System.out.println("family_id: " + get_family_id() );    
        System.out.println("is_obsolete: " + get_is_obsolete() );    
        System.out.println("date_entered: " + get_date_entered() );    
        System.out.println("date_last_updated: " + get_date_last_updated() );    
        System.out.println( "**** TfcTransposon content test end ****" );
        
    }
    
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{
            DBconnection conn = new DBconnection();
            Long test_id = new Long( 1 );

            TfcTransposon gene = new TfcTransposon( conn, test_id );
            gene.test();

        }  catch( Exception e ) {
            e.printStackTrace();
        }
    }
}
