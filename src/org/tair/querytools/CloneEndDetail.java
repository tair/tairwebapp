//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.12 $
// $Date: 2004/04/06 18:30:26 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import org.tair.tfc.*;
import org.tair.utilities.*;

import java.sql.*;
import java.util.*;

/**
 * CloneEndDetail is a composite class to represent all information
 * associated with an entry in the CloneEnd table for display on the
 * clone end detail page. CloneEndDetail contains instances of 
 * <code>TfcCloneEnd</code>, <code>TfcClone</code>, and a collection
 * of any loci the clone end is associated to in addition to all 
 * information in <code>MapElementDetail</code> and 
 * <code>TairObjectDetail</code> superclasses.
 */

public class CloneEndDetail extends MapElementDetail {

    private TfcCloneEnd clone_end;
    private TfcClone clone;

    // Stocks associated with clone - stored as TfcStock
    private StockCollection stocks = null;

    // Loci associated with clone end - stored as Locus
    private LocusCollection loci = null;


    /**
     * Creates an empty instance of CloneEndDetail
     */
    public CloneEndDetail() { }


    /**
     * Creates an instance of CloneEndDetail that reflects the data
     * referenced by the submitted clone end id.
     *
     * @param conn An active connection to the database
     * @param clone_end_id Clone end id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public CloneEndDetail( DBconnection conn, Long clone_end_id ) 
	throws RecordNotFoundException, SQLException {
	
	get_information( conn, clone_end_id );
    }


    /**
     * Creates an instance of CloneEndDetail that reflects the data
     * referenced by the submitted clone end name
     *
     * @param conn An active connection to the database
     * @param name Clone end name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public CloneEndDetail( DBconnection conn, String name )
	throws RecordNotFoundException, SQLException {
	
	get_information( conn, name );
    }

    /**
     * Retrieves information for the clone end with supplied name.
     *
     * @param conn An active connection to the database
     * @param name Clone end name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {

	Long id = TfcCloneEnd.retrieveCloneEndID( conn, name );

	if ( id == null ) {
	    throw new RecordNotFoundException( "No clone end found " +
					       "with name: " + name );
	}
        get_information( conn, id );
    }


    /**
     * Retrieves all information for supplied clone end id
     *
     * @param conn An active connection to the database
     * @param clone_end_id Clone end id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, Long clone_end_id ) 
	throws RecordNotFoundException, SQLException {

        clone_end = new TfcCloneEnd( conn, clone_end_id );
        super.populateBaseObject( clone_end );

        Long clone_id = clone_end.get_clone_id();
    
        if ( clone_id != null ) {
            clone = new TfcClone( conn, clone_id );
            if ( clone.get_tair_object_id() != null ) {
                stocks = new StockCollection( conn, 
					      clone.get_tair_object_id() );
            }
        }

        loci = new LocusCollection( conn, clone_end.get_map_element_id() );

	// populate superclass data
        getMapElementInformation( conn );
        getTairObjectInformation( conn );
    }


    /**
     * Retrieve stocks associated to clone end's clone
     *
     * @return Stocks associated with clone associated with this clone end as
     * an <code>Iterator</code> of <code>TfcStock</code> objects, or 
     * <code>null</code> if no stocks for associated clone
     */
    public Iterator get_stocks() {
        return ( hasStocks() ) ? stocks.iterator() : null;
    }

    /**
     * Determines if clone end's clone has associated stocks
     *
     * @return <code>true</code> if clone end's clone has associated stocks
     * or <code>false</code> if no stocks associated to clone end's clone
     */
    public boolean hasStocks() {
        return ( stocks != null && !stocks.isEmpty() );
    }

    /**
     * Determines if clone end has associated loci
     *
     * @return <code>true</code> if clone end has associated loci
     * or <code>false</code> if no loci associated to clone end
     */
    public boolean hasLocus() {
        return ( loci != null && !loci.isEmpty() );
    }

    /**
     * Retrieves loci associated to clone end
     *
     * @return Loci associated to clone end as an <code>Iterator</code>
     * of <code>Locus</code> objects, or <code>null</code> if no loci
     * associated to clone end
     */
    public Iterator getLocus() {
        return ( hasLocus() ) ? loci.iterator() : null;
    }

    //
    // TfcCloneEnd wrappers
    //
    public String get_clone_end_name() { 
	return clone_end.get_name(); 
    }

    public String get_clone_end_type() { 
	return clone_end.get_type(); 
    }

    public Long get_clone_end_id() { 
	return clone_end.get_clone_end_id(); 
    }

    public String get_chromosome() {
	return clone_end.get_chromosome(); 
    }

    public java.util.Date get_date_last_modified() {
	return clone_end.get_date_last_modified(); 
    }

    public java.util.Date get_date_entered() { 
        return clone_end.get_date_entered();
    }
    
    public String get_original_name() { 
        return clone_end.get_original_name();
    }

    //
    // TfcClone wrappers
    //

    public Float get_clone_insert_size() { 
        return ( clone != null ) ? clone.get_insert_size() : null;
    }

    public String get_clone_insert_type() { 
        return ( clone != null ) ? clone.get_insert_type() : null;
    }

    public String get_clone_vector_type() { 
        return ( clone != null ) ? clone.get_vector_type() : null;
    }
  
    public Long get_clone_id() { 
        return ( clone != null ) ? clone.get_clone_id() : null;
    }

    public String get_clone_name() {
        return ( clone != null ) ? clone.get_name() : null;
    }
      

    /**
     * For unit testing only
     */
    public void test() {
       
        System.out.println( "****** CloneEndDetail content test ******" );
        super.test();
       
        if ( clone_end != null ) {
            clone_end.test();
        }

        if ( clone != null ) {
            clone.test();
        }

        if ( hasStocks() ) {
            stocks.test();
        }
    
        if ( hasLocus() ) {
            loci.test();
        }

        System.out.println( "**** CloneEndDetail content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long id = new Long( 34304 );
            CloneEndDetail clone_end = new CloneEndDetail( conn, id );
            clone_end.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }  
    }
        
}
