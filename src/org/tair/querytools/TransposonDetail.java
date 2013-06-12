//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
//------------------------------------------------------------------------------
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * TransposonDetail is a composite class to represent all information associated 
 * with an entry in the Transposon table for display on the transposon detail page. 
 * TransposonDetail contains instances of <code>TfcTransposon</code>, and collections 
 * of all loci that are associated with the transposon, in addition to all information 
 * in <code>MapElementDetail</code> and <code>TairObjectDetail</code> superclasses.
 */


public class TransposonDetail extends MapElementDetail {

    private TfcTransposon transposon;
    private TfcTransposonFamily transposon_family;
    private LocusCollection canon_loci;

    /**
     * Creates an empty instance of TransposonDetail
     */
    public TransposonDetail() {  
        super();
    }
  
  
    /**
     * Creates an instance of TransposonDetail to reflect the data 
     * referenced by submitted transposon id.  
     *
     * @param conn An active connection to the database
     * @param transposon_id Transposon id to retrieve data for
     * @throws RecordNotFoundException if no entry found for id
     * @throws SQLException if a database error occurs
     */
    public TransposonDetail( DBconnection conn, Long t_id ) 
	throws RecordNotFoundException, SQLException {
	    get_information( conn, t_id );
    }
  
    /**
     * Creates an instance of TransposonDetail to reflect the data
     * referenced by submitted transposon name.
     * 
     * @param conn An active connection to the database
     * @param name Transpson name to retrieve data for
     * @throws RecordNotFoundException if no entry found for name
     * @throws SQLException if a database error occurs
     */
    public TransposonDetail( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {
	    get_information( conn, name );
    }

    // TFC wrappers
    public Long get_transposon_id(){
        return transposon.get_transposon_id();
    }
    
    public String get_transposon_name() {
        return transposon.get_name(); 
    }
   
    public String get_chromosome() {
        return transposon.get_chromosome();
    }

    public java.util.Date get_date_last_updated() {
        return transposon.get_date_last_updated();
    }
   
    public String get_family_name() {
        if (transposon_family != null ){
            return transposon_family.get_name();
        }else{
            return null;
        }
    }

    public String get_super_family_name() {
        return transposon_family.get_super_family_name();
    }

    public Long get_family_id() {
        return transposon_family.get_transposon_family_id();
    }
    
    public boolean hasCanon(){
        return (canon_loci != null && !canon_loci.isEmpty() );
    }

    public Iterator getCanon() {
        return (hasCanon() ) ? canon_loci.iterator() : null;
    }
    
    /**
    * Retrieves all data for submitted transposon name & populates member objects
    *
    * @param conn An active connection to the database
    * @param name Transposon name to retrieve data for
    * @throws RecordNotFoundException if no row is found for submitted name
    * @throws SQLException if a database error occurs
    */
    public void get_information ( DBconnection conn, String name ) 
    throws RecordNotFoundException, SQLException { 
        Long id = TfcTransposon.retrieveTransposonID(conn, name);
        if (id == null){
            throw new RecordNotFoundException("No transposon found with name: " + name);
        }
        get_information(conn, id);
    }
    
    /**
    * Retrieves all data for submitted transposon id & populates member objects
    *
    * @param conn An active connection to the database
    * @param id Transposon id to retrieve data for
    * @throws SQLException if a database error occurs
    */
    public void get_information (DBconnection conn, Long transposon_id )
    throws RecordNotFoundException, SQLException {
        transposon = new TfcTransposon(conn, transposon_id);
        Long family_id = transposon.get_family_id();
        if (family_id > 0){
            transposon_family = new TfcTransposonFamily(conn, family_id);
        }else{
            transposon_family = null;
        }
        super.populateBaseObject( transposon );
        
        getMapElementInformation(conn);
        getTairObjectInformation(conn);
        
        //populate w/full sequence text
        populateNTSequences( conn, get_map_element_id(), true);
    
        //populate canonical active elements
        canon_loci = new LocusCollection(conn, get_map_element_id() );
    }

    /**
     * For unit testing only
     */    
    public void test() {
        super.test();
        System.out.println( "****** TransposonDetail content test ******" );
        
        if (transposon != null) {
            transposon.test();
        }
        
        if (!canon_loci.isEmpty() ){
            canon_loci.test();
        }
        
        if (transposon_family != null){
            transposon_family.test();
        }

        System.out.println( "**** TransposonDetail content test end ****" );
    }



    /**
     * For unit testing only
     */

    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long id = new Long( 1 );
            TransposonDetail t_detail = new TransposonDetail( conn, id );
            t_detail.test();
        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }


}
