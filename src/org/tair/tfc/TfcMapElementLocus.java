//**********************************************************
// Java Class Name : TfcMapElementLocus 
// ---------------------------------------------------------
// Filetype: (SOURCE)
// Filepath: /home/yw/gcode/TfcMapElementLocus.java 
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
 * This class map to the table MapElementLocus in the tair 
 * database. Each instance maps one row of data in MapElementLocus 
 * table. Each data object maps to one field of a row in the table. Each 
 * field has one set method and one get method for accessing from outside of 
 * class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;
import org.tair.utilities.*;
import java.sql.*;

public class TfcMapElementLocus 
{   
// Member Variables 

      /**
       * the map_element_id value of a specific row in table MapElementLocus <code>Long</code>
       */
   protected Long map_element_id;


      /**
       * the locus_id value of a specific row in table MapElementLocus <code>Long</code>
       */
   protected Long locus_id;

   

// Constructor/Destructor
     /**
     * TfcMapElementLocus default constructor.  It instantiate an instance with all
     * fields as null.
     */
   public TfcMapElementLocus()
   {
   }

     /**
     * TfcMapElementLocus constructor initializes each field according to the value
     * of the object id in the database.  The DBconnection instance is
     * required for database access.  If no row is found corresponding to this
     * object, the instance of TfcMapElementLocus is null
     * @param connection the instance of DBconnection
     * @param value the object id of a row in the MapElementLocus table
     * @throws SQLException in the case of an invalid operation or database error
     */
   public TfcMapElementLocus( DBconnection connection, Long value )throws SQLException
   {
       boolean more = false;
       String query = null;
       try{
	   if(value != null){
	   query ="select  locus_id, "+
	     "map_element_id "+
	     "from MapElement_Locus "+
	     "where map_element_id = ?";
	   synchronized(this) {
	     connection.setQuery(query);
	     connection.setQueryVariable(value);
	     ResultSet results = connection.getResultSet();
	     
	     more = results.next();
	     if(more){
	       long id = results.getLong(1);
	       if(!results.wasNull()){
		 locus_id = new Long(id);
	       }
	       
	       id = results.getLong(2);
	       if(!results.wasNull()){
		 map_element_id = new Long(id);
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
	    throw new InvalidSQLParameterException("Error on MapElement_Locus data select ",query+value);
	}
   }
    
   protected void finalize()
    {
    }
    
    // Get/Set Methods For Member Variables

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
     * Sets the locus_id
     * @param value the locus_id
     */
   public void set_locus_id ( Long value )
   {
      locus_id = value;
   }

    /**
     * Gets the locus_id
     * @return a <code>Long</code> value specifying the locus_id
     */
   public Long get_locus_id() 
   {
      return locus_id;
   }

    /**
     * test TfcMapElementLocus content
     */
    public void test(){
	System.out.println("****** TfcMapElementLocus content test ******");
	System.out.println("map_element_id is " + this.get_map_element_id());
	System.out.println("locus_id is " + this.get_locus_id());

	System.out.println("**** TfcMapElementLocus content test end ****");

    }

    /****************************************************************/
  // this part is for test basic functions

    /**
     * main function is used to for testing only 
    */
  public static void main(String[] args){

      try{
	  DBconnection connection = new DBconnection();
	  Long test_id = new Long(1011766);
	  
	  //Thread.sleep(20000);
	  //connection.reConnect();
	  
	  TfcMapElementLocus species_poly_state = new TfcMapElementLocus(connection, test_id);
	  species_poly_state.test();
	  long id = 1;
	  String test = "test";
	  
	  species_poly_state.set_map_element_id(new Long(id));
	  species_poly_state.set_locus_id(new Long(id));
	  species_poly_state.test();
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
