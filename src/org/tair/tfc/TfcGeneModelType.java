//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.7 $
// $Date: 2004/04/05 22:40:52 $
//------------------------------------------------------------------------------

package org.tair.tfc;

import java.sql.*;
import java.util.Map;
import java.util.HashMap;

import org.tair.utilities.RecordNotFoundException;


/**
 * This class maps to the GeneModelType table in the tair database. Each 
 * instance maps one row of data in GeneModelType table. Each data object 
 * maps to one field of a row in the table. Each field has one set method
 * and one get method for accessing from outside of class.
 * 
 * <p>
 * Unlike other Tfc classes, TfcGeneModelType will not always execute a SQL 
 * query to get data from the database.  Since gene model type data does not
 * change very often and is required by every instance of TfcStock, lookup 
 * data is stored in a static member variable so that once retrieved a value 
 * does not need to be retrieved again. When the constructor for this class 
 * is called, member variables are populated from the static collection instead
 * of from the database.
 * 
 * <p>
 * This is a litle convoluted, but is done to facilitate the quick translation
 * of the stock type id to literal value of stock type without incurring another
 * database query. The convention of instantiating the class using its 
 * constructor is kept for consistency; for ID to type translation, the utility 
 * method typeForID can be used with the same effect
 */

public class TfcGeneModelType {   

    /**
     * Collection of gene model type data, stored with gene model type ID as 
     * Long key referencing literal value of gene model type. New entries will 
     * be retrieved from the database and added to collection as new values of 
     * gene model type id are encountered through constructor
     */
    private static Map geneModelTypes = new HashMap();


    /**
     * Primary key value for a single gene model type
     */
    private Long gene_model_type_id;

    /**
     * Literal type value for a single gene model type
     */
    private String gene_model_type;


    /**
     * Creates an empty instance of TfcGeneModelType
     */
    public TfcGeneModelType() {  }


    /**
     * Creates an instance of TfcGeneModelType that reflects the data 
     * referenced by submitted gene model type id
     *
     * @param gene_model_type_id  Gene model type id to retrieve data for
     * @throws RecordNotFoundException if no row found for gene_model_type_id
     * @throws SQLException if a database error occurs
     */
    public TfcGeneModelType( Long gene_model_type_id ) 
	throws RecordNotFoundException, SQLException {

	
	// Get type value using typeForID utility method that 
	// accesses static collection of all possible types. 
	// RecordNotFoundException will be thrown if no row found for
	// gene model id
	this.gene_model_type = typeForID( gene_model_type_id );
	this.gene_model_type_id = gene_model_type_id;
    }


    /**
     * Utility method to retrieve the gene model type literal value for
     * submitted gene model type id. This is equivalent to creating an 
     * instance of TfcGeneModelType getting the type value through 
     * get_gene_model_type
     *
     * @param gene_model_type_id Gene model type id to retrieve data for
     * @return Gene model type for submitted gene model type id
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public static String typeForID( Long gene_model_type_id )
	throws RecordNotFoundException, SQLException {

	// get entry for this gene model type id if necessary -- will throw
	// exception if no row found for id
	if ( !geneModelTypes.containsKey( gene_model_type_id ) ) {
	    loadRow( gene_model_type_id );
	}

	String type = (String) geneModelTypes.get( gene_model_type_id );
	
	return type;
    }

    /**
     * Get row from database table for gene model type id and store data in
     * geneModelTypes collection. This method should only be called once 
     * for each element child table. RecordNotFoundException will be thrown
     * if no row found for gene model type id
     *
     * @param gene_model_type_id Gene model type id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    private static void loadRow( Long gene_model_type_id ) 
	throws RecordNotFoundException, SQLException {
	
	DBconnection conn = null;
	DBReadManager connectionPool = null;
	boolean found = false;

	try {
	    connectionPool = DBReadManager.getInstance();
	    conn = connectionPool.get_connection();

	    String query =
		"SELECT gene_model_type " +
		"FROM GeneModelType " +
		"WHERE gene_model_type_id = ?";

	    conn.setQuery( query );
	    conn.setQueryVariable( gene_model_type_id );

	    // save data with gene model type id as key referencing type
	    ResultSet results = conn.getResultSet();
	    found = results.next();

	    if ( found ) {
		geneModelTypes.put( gene_model_type_id,
				    results.getString( "gene_model_type" ) );
	    }
	    conn.releaseResources();

	} finally {
	    connectionPool.return_connection( conn );
	}
	    
        if ( !found ) {
            throw new RecordNotFoundException( "No gene model type found " +
					       "for gene model type id: " + 
                                               gene_model_type_id );
        }
    }

    public void set_gene_model_type_id ( Long id ) { 
	this.gene_model_type_id = id; 
    }

    public Long get_gene_model_type_id() { 
	return gene_model_type_id; 
    }

    public void set_gene_model_type( String type ) { 
	this.gene_model_type = type; 
    }

    public String get_gene_model_type() { 
	return gene_model_type; 
    }

    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** TfcGeneModelType content test ******" );
        System.out.println( "gene_model_type_id: " + get_gene_model_type_id() );
        System.out.println( "gene_model_type: " + get_gene_model_type() ); 
        System.out.println( "**** TfcGeneModelType content test end ****" );
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try {
            Long test_id = new Long( 2 );

            TfcGeneModelType gene_model_type = new TfcGeneModelType( test_id );
            gene_model_type.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
