/**
 * This class map to the table GeneClassSymbol_Locus in the tair database. Each instance
 * maps one row of data in TairObjRef table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;
import org.tair.utilities.*;
import java.sql.*;

public class TfcGeneClassSymbolLocus{   

    private Long gene_class_symbol_id;
    private Long locus_id;
    private String symbol;
    /**
     * TfcGeneSymbolLocus default constructor.  It instantiate an instance of  with all
     * fields as null.
     */
    public TfcGeneClassSymbolLocus() {}

    /**
     * TfcGeneClassSymbolLocus constructor initializes each field according to the value
     * of the object id in the database.  The DBconnection instance is
     * required for database access.  If no row is found corresponding to this
     * object, the instance of TfcGeneClassSymbolLocus is null
     * @param connection the instance of DBconnection
     * @param Long gene_class_symbol_id
     * @param Long locus_id 
     * @throws SQLException in the case of an invalid operation or database error
     *  or if no row found for submitted id
     */
    public TfcGeneClassSymbolLocus( DBconnection conn, Long gene_class_symbol_id, 
        Long locus_id )throws SQLException{
	String query = null;
	if ( gene_class_symbol_id != null && locus_id != null ) {
	    query =  
		"SELECT GL.gene_class_symbol_id as gene_class_symbol_id ," +
		"locus_id , symbol " +
		"FROM  GeneClassSymbol_Locus  GL, GeneClassSymbol "  +
		"WHERE GL.gene_class_symbol_id= " + gene_class_symbol_id.toString() + " " +
		"AND locus_id = "+ locus_id.toString() +
		" AND  GL.gene_class_symbol_id =GeneClassSymbol.gene_class_symbol_id " ;
      
	    conn.setQuery( query );
	    try {
		ResultSet results = conn.getResultSet();
		if ( results.next() ) { 
		    this.symbol = results.getString( "symbol" );
		    long id = results.getLong( "gene_class_symbol_id" );
		    if ( !results.wasNull() ) {
			this.gene_class_symbol_id = new Long( id );
		    }
	  
		    id = results.getLong( "locus_id" );
		    if ( !results.wasNull() ) {
			this.locus_id = new Long( id );
		    }
	 
		} else {
		    throw new RecordNotFoundException( "No Linking found between gene_class_symbol_id: " + 
						       gene_class_symbol_id + " and locus id " + locus_id );
		}
	    } finally {
		conn.releaseResources();
	    }
	}
    }
    
    public void set_gene_class_symbol_id ( Long value ){ gene_class_symbol_id = value; }
    public Long get_gene_class_symbol_id (){return gene_class_symbol_id ; }

    public void set_locus_id ( Long value ){ locus_id = value; }
    public Long get_locus_id (){return locus_id ; }
  
    public String get_symbol() { return symbol;} 
    public void set_symbol ( String value ){ symbol=value ;}

    /**
     * Stores contents of object to database.
     * @param conn An active connection to the database.  Connection must have INSERT
     * and UPDATE permissions on the GeneClassSymbolLocus table, or an exception will be thrown
     * @exception SQLException thrown if an error occurs while updating the database
     * @exception InvalidActionException thrown if the required parameters is missing 
     */
    public void store( DBconnection conn ) 
	throws SQLException, InvalidActionException {
	String query =  new String();

	if ( get_gene_class_symbol_id() == null || get_locus_id() == null ) {
	    throw new InvalidActionException( "db storage failed for gene_class_symbol " 
					      + get_gene_class_symbol_id() + ", " +
					      "locus_id " + get_locus_id() + " - one or more ids is null" );
   
	}
	boolean exists = rowExists( conn );    
	if ( !exists ) {
	    query =
		"INSERT INTO GeneClassSymbol_Locus ( " +
		"gene_class_symbol_id, " +
		"locus_id "+
		" ) " +
		"VALUES ( " + get_gene_class_symbol_id()+ ", " +
		get_locus_id() + ")";
               
	    conn.setQuery( query );
	    ResultSet  results = conn.getResultSet();
	    conn.releaseResources();
	}
    }

    /**
     * To check if the gene class symbol is already has a hit to this locus_is
     * in GeneClassSymbolLocus table
     * @param conn An active connection to the database.
     * @return a boolean value true /false 
     */
    private boolean rowExists( DBconnection conn ) throws SQLException {
	String query = null;
	ResultSet results = null;
	int count = 0;
	query = 
	    "SELECT count(*) AS row_count " +
	    "FROM GeneClassSymbol_Locus " +
	    "WHERE gene_class_symbol_id = " + get_gene_class_symbol_id() + " " +
	    "AND locus_id = " + get_locus_id();
     
	conn.setQuery( query );
	results = conn.getResultSet();
	if ( results.next() ) {
	    count = results.getInt( "row_count" );
	}
	conn.releaseResources();
	return ( count > 0 );
    }
 
    public void test(){
	System.out.println("****** TfcGeneClassSymbolLocus content test ******");
    }

    public static void main(String[] args){

	try{
	    DBconnection connection = new DBconnection();
	    // Long test_id = new Long(1950854,12345);
	}
	catch(SQLException e){
	    Debugger.println(e.getSQLState());
	    Debugger.println(e.getMessage());
	    e.printStackTrace();
	}
    }
 
}
