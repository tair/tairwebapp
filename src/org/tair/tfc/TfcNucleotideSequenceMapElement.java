//**********************************************************
// Java Class Name : TfcNucleotideSequenceMapElement 
// ---------------------------------------------------------
// Filetype: (SOURCE)
// Filepath: /home/yw/gcode/TfcNucleotideSequenceMapElement.java 
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
 * This class map to the table NucleotideSequence_MapElement in the tair 
 * database. Each instance maps one row of data in 
 * NucleotideSequenceMapElement table. Each data object 
 * maps to one field of a row in the table. Each field has one set method and 
 * one get method for accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;
import org.tair.utilities.*;
import java.sql.*;

public class TfcNucleotideSequenceMapElement 
{   
// Member Variables 

      /**
       * the nucleotide_seq_id value of a specific row in table 
       * NucleotideSequence_MapElement <code>Long</code>
       */
   protected Long nucleotide_seq_id;


    /**
     * the map_element_id value of a specific row in table NucleotideSequenceMapElement 
     * <code>Long</code>
     */
    protected Long map_element_id;

   

// Constructor/Destructor
     /**
     * TfcNucleotideSequenceMapElement default constructor.  It instantiate 
     * an instance with all fields as null.
     */
   public TfcNucleotideSequenceMapElement()
   {
   }

     /**
     * TfcNucleotideSequenceMapElement constructor initializes each field 
     * according to the value of the nucleotide_seq_id in the database.  
     * The DBconnection instance is required for database access.  If no row 
     * is found corresponding to this nucleotide_seq_id, the instance of 
     * TfcNucleotideSequenceMapElement is null
     * @param connection the instance of DBconnection
     * @param value the nucleotide_seq_id of a row in the 
     * NucleotideSequenceMapElement table
     * @throws SQLException in the case of an invalid operation or database error
     */
   public  TfcNucleotideSequenceMapElement( DBconnection connection, Long value )throws SQLException
   {
    boolean more = false;
    String query = null;
       try{
	   if(value != null){
	       query ="select nucleotide_seq_id, "+
		   "map_element_id "+
		   "from NucleotideSequence_MapElement "+
		   "where map_element_id = ?";
	       synchronized(this) { 
		   connection.setQuery(query);
		   connection.setQueryVariable(value);
		   ResultSet results = connection.getResultSet();
		   more = results.next();
		   if(more){
		       long id = results.getLong(1);
		       if(!results.wasNull()){
			   nucleotide_seq_id = new Long(id);
		       }
		       
		       id = results.getLong(2);
		       if(!results.wasNull()){
			   map_element_id = new Long(id);
		       }
		       
		   }
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
	   throw new InvalidSQLParameterException("Error on NucleotideSequence_MapElement data select ",query+value);
       }
   }
    
    protected void finalize()
    {
    }
    
    /**
     * Sets the nucleotide_seq_id
     * @param value the nucleotide_seq_id
     */
    public void set_nucleotide_seq_id ( Long value )
    {
	nucleotide_seq_id = value;
    }
    
    /**
     * Gets the nucleotide_seq_id
     * @return a <code>Long</code> value specifying the nucleotide_seq_id
     */
    public Long get_nucleotide_seq_id() 
    {
	return nucleotide_seq_id;
    }
    
    /**
     * Sets the map_element_id
     * @param value the map_element_id
     */
    public void set_map_element_id ( Long value )
    {
	map_element_id = value;
    }
    
    /**
     * Gets the map_element_id
     * @return a <code>Long</code> value specifying the map_element_id
     */
    public Long get_map_element_id() 
    {
	return map_element_id;
    }

    /**
     *  test TfcNucleotideSequenceMapElement content
     */
    public void test(){	
	System.out.println("****** TfcNucleotideSequenceMapElement content test *******");
	System.out.println("map_element_id  is " + this.get_map_element_id());
	System.out.println("nucleotide_seq_id is " + this.get_nucleotide_seq_id());
	System.out.println("**** TfcNucleotideSequenceMapElement content test end *****");
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
	    TfcNucleotideSequenceMapElement map_seq = new TfcNucleotideSequenceMapElement(connection, test_id);
	    map_seq.test();
	    
	    long id = 1;
	    
	    id++;
	    map_seq.set_map_element_id(new Long(id));
	    id++;
	    map_seq.set_nucleotide_seq_id(new Long(id));
	    map_seq.test();
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
