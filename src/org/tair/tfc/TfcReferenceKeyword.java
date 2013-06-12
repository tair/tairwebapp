//**********************************************************
// Java Class Name : TfcReferenceKeyword 
// ---------------------------------------------------------
// Filetype: (SOURCE)
// Filepath: /home/yw/gcode/TfcReferenceKeyword.java 
// 
// 
// GDPro Properties 
// ---------------------------------------------------
//  - GD Symbol Type    : CLD_Class 
//  - GD Method         : UML ( 3.2 ) 
//  - GD System Name    : TFCSYSTEM 
//  - GD View Type      : Class Diagram 
//  - GD View Name      : Class Diagram 
// ---------------------------------------------------  
//  Author         : yw 
//  Creation Date  : Mon - Oct 2, 2000 
// 
// 
//  Description: 
// 
//  Change Log: 
// 
//**********************************************************

/**
 * This class map to the table Reference_Keyword in the tair 
 * database. Each instance maps one row of data in 
 * ReferenceKeyword table. Each data object 
 * maps to one field of a row in the table. Each field has one set method and 
 * one get method for accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;
import org.tair.utilities.*;
import java.sql.*;

public class TfcReferenceKeyword 
{   
// Member Variables 

      /**
       * the keyword_id value of a specific row in table 
       * Reference_Keyword <code>Long</code>
       */
   protected Long keyword_id;


    /**
     * the reference_id value of a specific row in table ReferenceKeyword 
     * <code>Long</code>
     */
    protected Long reference_id;

    private Long relationship_type_id;
    private Long annotation_type_id;

// Constructor/Destructor
     /**
     * TfcReferenceKeyword default constructor.  It instantiate 
     * an instance with all fields as null.
     */
   public TfcReferenceKeyword()
   {
   }

     /**
     * TfcReferenceKeyword constructor initializes each field 
     * according to the value of the keyword_id in the database.  
     * The DBconnection instance is required for database access.  If no row 
     * is found corresponding to this keyword_id, the instance of 
     * TfcReferenceKeyword is null
     * @param connection the instance of DBconnection
     * @param value the keyword_id of a row in the 
     * ReferenceKeyword table
     * @throws SQLException in the case of an invalid operation or database error
     */
   public  TfcReferenceKeyword( DBconnection connection, Long value )throws SQLException
   {
    boolean more = false;
    String query = null;
       try{
	   if(value != null){
	       query ="select keyword_id, "+
		   "reference_id, "+
                   
		   "from Reference_Keyword "+
		   "where keyword_id = ?";
	       synchronized(this) { 
		   connection.setQuery(query);
		   connection.setQueryVariable(value);
		   ResultSet results = connection.getResultSet();
		   more = results.next();
		   if(more){
		       long id = results.getLong(1);
		       if(!results.wasNull()){
			   keyword_id = new Long(id);
		       }
		       
		       id = results.getLong(2);
		       if(!results.wasNull()){
			   reference_id = new Long(id);
		       }
		       
		   }
		   connection.releaseResources();
	       }
	   }
       }
       catch (DataBaseConnectionException ex) {      
	   throw ex;
       }
       catch (InvalidSQLParameterException ex) {      
	   throw ex;
       }
       catch (SQLException ex) {      
	   throw new InvalidSQLParameterException("Error on Reference_Keyword data select ",query+value);
       }
   }
     /**
     * TfcReferenceKeyword constructor initializes each field 
     * according to the value of the keyword_id/reference_id/relationship_type_id 
     * in the database.  
     * The DBconnection instance is required for database access.  If no row 
     * is found corresponding to these ids, the instance of 
     * TfcReferenceKeyword is null
     * @param connection the instance of DBconnection
     * @param reference_id the reference_id of a row in the ReferenceKeyword table
     * @param keyword_id the keyword_id of a row in the ReferenceKeyword table
     * @param relationship_type_id the relationship_type_id of a row in the ReferenceKeyword table
     * @throws SQLException in the case of an invalid operation or database error
     */
    public  TfcReferenceKeyword( DBconnection conn, 
                                Long reference_id, 
				Long keyword_id, 
				Long relationship_type_id  )
	throws SQLException{
        boolean found = false;

	// annotation type id is only field in table not
	// included in primary key, so only need to select it
	// to get all data for row in table
	String query =
	    "SELECT annotation_type_id " +
	    "FROM Reference_Keyword " +
	    "WHERE reference_id = ? " +
	    "AND keyword_id = ? " +
	    "AND relationship_type_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( 1, reference_id );
	conn.setQueryVariable( 2, keyword_id );
	conn.setQueryVariable( 3, relationship_type_id );

	ResultSet results = conn.getResultSet();
	found = results.next();
	if ( found ) {
	    set_reference_id( reference_id );
	    set_keyword_id( keyword_id );
	    set_relationship_type_id( relationship_type_id );
           
	    long id = results.getLong( "annotation_type_id" );
	    if ( !results.wasNull() ) {
		set_annotation_type_id( new Long( id ) );
	    }
	}
	conn.releaseResources();

	if ( !found ) {
	    throw new RecordNotFoundException( "No entry found in " +
					       "Reference_Keyword " +
					       "for reference id: " + 
					       reference_id + 
					       " keyword id: " + keyword_id +
					       " relationship_type_id: " + 
					       relationship_type_id );
	}

    }    
    
    protected void finalize()
    {
    }
    
    /**
     * Sets the keyword_id
     * @param value the keyword_id
     */
    public void set_keyword_id ( Long value )
    {
	keyword_id = value;
    }
    
    /**
     * Gets the keyword_id
     * @return a <code>Long</code> value specifying the keyword_id
     */
    public Long get_keyword_id() 
    {
	return keyword_id;
    }
    
    /**
     * Sets the reference_id
     * @param value the reference_id
     */
    public void set_reference_id ( Long value )
    {
	reference_id = value;
    }
    
    /**
     * Gets the reference_id
     * @return a <code>Long</code> value specifying the reference_id
     */
    public Long get_reference_id() 
    {
	return reference_id;
    }
    public void set_relationship_type_id( Long id ) { 
	this.relationship_type_id = id;
    }

    public Long get_relationship_type_id() {
	return relationship_type_id;
    }

    public void set_annotation_type_id( Long id ) { 
	this.annotation_type_id = id; 
    }

    public Long get_annotation_type_id() {
	return annotation_type_id;
    }
    
    /**
     * Stores a row into Reference_Keyword with current member variable values.
     * This operation is always done as an INSERT and is usually called by
     * a collection class that manages all keyword associations for a Reference.
     * When updating, the collection class should usually DELETE all prior rows
     * in this table, then re-INSERT rows to represent only those associations
     * remaining in the collection.
     *
     * @param conn A connection with INSERT privileges 
     * @throws SQLException if a database error occurs
     * @throws InvalidActionException if store is called when any one of member
     * variables are NULL
     */
    public void store( DBconnection conn ) 
	throws SQLException, InvalidActionException {
	
	validate();
	if ( !exists( conn ) ) {
	    insert( conn );
	} 
    } 

     /** 
     * Determines if a row exists in Reference_Keyword with this combination
     * of reference_id/keyword_id/annotationtype_id/relatinship_type_id
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @return <code>true</code> if a row found with this combination of ids,
     * <code>false</code> if no row found with this combination of ids
     * @throws SQLException if a database error occurs
     */
    private boolean exists( DBconnection conn )throws SQLException {
	boolean exists = false;

	String query = 
	    "SELECT COUNT(*) " +
	    "FROM Reference_Keyword " +
	    "WHERE reference_id = ? " +
	    "AND keyword_id = ? " + 
            "AND relationship_type_id = ? " +
            "AND annotation_type_id = ? ";
	
	conn.setQuery( query );
	conn.setQueryVariable( 1, get_reference_id() );
	conn.setQueryVariable( 2, get_keyword_id() );
        conn.setQueryVariable( 3, get_relationship_type_id() );
    	conn.setQueryVariable( 4,get_annotation_type_id());
 	
	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    if ( results.getInt( 1 ) > 0 ) {
		exists = true;
	    }
	}
	conn.releaseResources();

	return exists;
    }

    /** 
     * Inserts a new row into Reference_Keyword containing contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    private void insert( DBconnection conn ) throws SQLException {
        String query =
	    "INSERT Reference_Keyword (" +
	    "reference_id, " +
	    "keyword_id, " +
	    "relationship_type_id, " +
	    "annotation_type_id) " +
	    "VALUES ( ?, ?, ?, ? )";

	conn.setQuery( query );
	conn.setQueryVariable( 1, get_reference_id() );
	conn.setQueryVariable( 2, get_keyword_id() );
	conn.setQueryVariable( 3, get_relationship_type_id() );
	conn.setQueryVariable( 4, get_annotation_type_id() );

	conn.executeUpdate();
	conn.releaseResources();	
    }



    /**
     * Validates object to ensure that data required for INSERT to the 
     * database has been properly set.  
     *
     * @throws InvalidActionException if any ids required for storing to db
     * have not been set
     */
    private void validate() throws InvalidActionException {

	if ( get_reference_id() == null ||
	     get_keyword_id() == null ||
	     get_relationship_type_id() == null ||
	     get_annotation_type_id() == null ) {
	    
	    String msg = 
		"Cannot store TfcReferenceKeyword with: " +
		"reference id: " + get_reference_id() +
		" keyword id: " + get_keyword_id() +
		" relationship type id: " + get_relationship_type_id() +
		" annotation type id: " + get_annotation_type_id();
	    
	    throw new InvalidActionException( msg );
	}
    }


    /**
     *  test TfcReferenceKeyword content
     */
    public void test(){	
	System.out.println("****** TfcReferenceKeyword content test *******");
	System.out.println("reference_id  is " + this.get_reference_id());
	System.out.println("keyword_id is " + this.get_keyword_id());
	System.out.println("**** TfcReferenceKeyword content test end *****");
    }
    
    /****************************************************************/
    // this part is for test basic functions
    
    /**
     * main function is used to for testing only 
     */
    public static void main(String[] args){
	
	try{
	    DBconnection connection = new DBconnection();
	    Long test_id = new Long(11466);
	    //Thread.sleep(20000);
	    //connection.reConnect();      
	    TfcReferenceKeyword reference_keyword = new TfcReferenceKeyword(connection, test_id);
	    reference_keyword.test();
	    
	    long id = 1;
	    
	    id++;
	    reference_keyword.set_reference_id(new Long(id));
	    id++;
	    reference_keyword.set_keyword_id(new Long(id));
	    reference_keyword.test();
	    System.out.println("**********************************************");
	    
	}
      catch(SQLException e){
	  Debugger.println(e.getSQLState());
	  Debugger.println(e.getMessage());
	  e.printStackTrace();
      }
    }
    /**************************************************************/  
}
