//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2003/09/30 17:12:29 $
//------------------------------------------------------------------------------ 


package org.tair.tfc;

import java.sql.*;

import org.tair.utilities.*;

/**
 * This class maps to the StructuralClassType table in the tair database. 
 * Each instance maps one row of data in the table. Each data object maps to 
 * one field of a row in the table. Each field has one set method and one get 
 * method for accessing from outside of class.
 */

public class TfcStructuralClassType implements java.io.Serializable {

    private String structural_class_type_id;
    private String description;


    /**
     * Creates an empty instance of TfcStructuralClassType
     */
    public TfcStructuralClassType() { }

  
    /**
     * Creates an instance of TfcStructuralClassType that reflects the data referenced
     * by submitted structural_class_type_id
     *
     * @param conn An active connection to the database
     * @param structural_class_type_id Id to retrieve data for
     * @throws SQLException in the case of an invalid operation or database error
     */
    public  TfcStructuralClassType( DBconnection conn, 
                                    String structural_class_type_id) throws SQLException 
    {

        String query = 
            "SELECT structural_class_type_id, " +
            "description " +
            "FROM StructuralClassType " +
            "WHERE structural_class_type_id = " + TextConverter.dbQuote( structural_class_type_id );
        boolean found = processResults( conn, query );

        if ( !found ) {
            throw new RecordNotFoundException( "No structural class type found for " +
                                               "structural class type id: " + 
                                               structural_class_type_id );
        }
    }

    private boolean processResults( DBconnection conn, String query ) throws SQLException {
        boolean found = false;

        conn.setQuery( query );
        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            found = true;
            this.structural_class_type_id = results.getString( "structural_class_type_id" );
            this.description = results.getString( "description" );
        }
        conn.releaseResources();

        return found;
    }

    public void set_structural_class_type_id( String id ) {
        this.structural_class_type_id = id;
    }

    public String get_structural_class_type_id() {
        return structural_class_type_id;
    }

    public void set_description( String description ) {
        this.description = description;
    }

    public String get_description() {
        return description;
    }
    

    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** TfcStructuralClassType content test ******" );
        System.out.println( "structural class type id: " + get_structural_class_type_id() );
        System.out.println( "description: " + get_description() );
        System.out.println( "**** TfcStructuralClassType content test end ****" );
    }

  
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

        try{
            DBconnection conn = new DBconnection();
            String id = "a";
            TfcStructuralClassType classType = new TfcStructuralClassType( conn, id );
            classType.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
