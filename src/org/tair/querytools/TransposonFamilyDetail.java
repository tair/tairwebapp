//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.30 $
// $Date: 2006/09/26 21:58:33 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * TransposonFamilyDetail is a composite class to represent all information associated 
 * with an entry in the TransposonFamily table for display on the transposon_family detail page. 
 * TransposonFamilyDetail contains instances of <code>TfcTransposonFamily</code>, and collections 
 * associated transposons for a particular TransposonFamily and also all mapping 
 * to all information in <code>MapElementDetail</code> and 
 * <code>TairObjectDetail</code> superclasses.
 */


public class TransposonFamilyDetail extends TairObjectDetail {

    private TfcTransposonFamily transposon_family;
    private TransposonCollection assoc_transposon;

    /**
     * Creates an empty instance of TransposonFamilyDetail
     */
    public TransposonFamilyDetail() {  
        transposon_family = new TfcTransposonFamily();
    }
  
  
    /**
     * Creates an instance of TransposonFamilyDetail to reflect the data 
     * referenced by submitted transposon_family id.  
     *
     * @param conn An active connection to the database
     * @param family_id TransposonFamily id to retrieve data for
     * @throws RecordNotFoundException if no entry found for id
     * @throws SQLException if a database error occurs
     */
    public TransposonFamilyDetail( DBconnection conn, Long family_id ) 
	throws RecordNotFoundException, SQLException {
	get_information( conn, family_id );
    }
  
  
    /**
     * Creates an instance of TransposonFamilyDetail to reflect the data
     * referenced by submitted transposon_family name.
     * 
     * @param conn An active connection to the database
     * @param name TransposonFamily name to retrieve data for
     * @throws RecordNotFoundException if no entry found for name
     * @throws SQLException if a database error occurs
     */
    public TransposonFamilyDetail( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, name );
    }

    //Tfc wrapper functions
    public String get_name() {
        return transposon_family.get_name(); 
    }
   
    public String get_super_family_name() {
        return transposon_family.get_super_family_name();
    }

    public java.util.Date get_date_last_updated() {
        return transposon_family.get_date_last_updated();
    }
   
    public boolean hasAssocTransposon(){
        return (assoc_transposon != null && !assoc_transposon.isEmpty() );
    }

    public Iterator getAssocTransposon() {
        System.out.println("SIZE : "  + assoc_transposon.size() );
        return (hasAssocTransposon() ) ? assoc_transposon.iterator() : null;
    }
    
    /**
    * Retrieves all data for submitted transposon_family name & populates member
    * objects
    *
    * @param conn An active conneciton to the database
    * @param name TransposonFamily name to retrieve data for
    * @throws RecordNotFoundException if now row is found for submitted name
    * @throws SQLException if a database error occurs
    */
    public void get_information ( DBconnection conn, String name ) 
    throws RecordNotFoundException, SQLException { 
        Long id = TfcTransposonFamily.retrieveFamilyID(conn, name);
        if (id == null){
            throw new RecordNotFoundException("No transposon family found with name: " + name);
        }
        get_information(conn, id);
    }
   
    /**
    * Retrieves all data for submitted transposon_family id & populates member
    * objects
    *
    * @param conn An active conneciton to the database
    * @param id TransposonFamily id to retrieve data for
    * @throws SQLException if a database error occurs
    */
    public void get_information (DBconnection conn, Long family_id )
    throws RecordNotFoundException, SQLException {
        transposon_family = new TfcTransposonFamily(conn, family_id);
        super.populateBaseObject( transposon_family );
        
        getTairObjectInformation(conn);
         
        //populate canonical active elements
        assoc_transposon = new TransposonCollection(conn, family_id, "family");
    }

    /**
     * For unit testing only
     */    
    public void test() {
        super.test();
        System.out.println( "****** TransposonFamilyDetail content test ******" );
        
        if (transposon_family != null){
            transposon_family.test();
        }
        
        if (!assoc_transposon.isEmpty() ){
            assoc_transposon.test();
        }

        System.out.println( "**** TransposonFamilyDetail content test end ****" );
    }


    /**
     * For unit testing only
     */

    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long id = new Long( 157 );
            TransposonFamilyDetail transposon_family = new TransposonFamilyDetail( conn, id );
            transposon_family.test();
        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }


}
