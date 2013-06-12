//**********************************************************
// Java Class Name : TfcTairObjectImage 
// ---------------------------------------------------------
// Filetype: (SOURCE)
// Filepath: /home/yw/gcode/TfcTairObjectImage.java 
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
 * This class map to the table TairObjectImage in the tair database. Each instance
 * maps one row of data in TairObjectImage table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;
import org.tair.utilities.*;
import java.sql.*;

public class TfcTairObjectImage 
{   
// Member Variables 

      /**
       * the tair_object_id value of a specific row in table TairObjectImage <code>Long</code>
       */
   protected Long tair_object_id;


      /**
       * the image_id value of a specific row in table TairObjectImage <code>Long</code>
       */
   protected Long image_id;

   

// Constructor/Destructor
     /**
     * TfcTairObjectImage default constructor.  It instantiate an instance with all
     * fields as null.
     */
   public TfcTairObjectImage()
   {
   }

     /**
     * TfcTairObjectImage constructor initializes each field according to the value
     * of the object id in the database.  The DBconnection instance is
     * required for database access.  If no row is found corresponding to this
     * object, the instance of TfcTairObjectImage is null
     * @param connection the instance of DBconnection
     * @param value the object id of a row in the TairObjectImage table
     * @throws SQLException in the case of an invalid operation or database error
     */
   public TfcTairObjectImage( DBconnection connection, Long value )throws SQLException
   {
    boolean more = false;
    String query = null;
       try{
	   if(value != null){
	       query ="select image_id, "+
		   "tair_object_id "+
		   "from TairObject_Image "+
		   "where tair_object_id = ?";
	       synchronized(this) { 
		   connection.setQuery(query);
		   connection.setQueryVariable(value);
		   ResultSet results = connection.getResultSet();
		   more = results.next();
		   if(more){
		       long id = results.getLong(1);
		       if(!results.wasNull()){
			   image_id = new Long(id);
		       }
		       
		       id = results.getLong(2);
		       if(!results.wasNull()){
			   tair_object_id = new Long(id);
		       }
		       connection.releaseResources();
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
	   throw new InvalidSQLParameterException("Error on TairObject_Image data select ",query+value);
       }

   }

   protected void finalize()
   {
   }

// Get/Set Methods For Member Variables


    /**
     * Sets the tair_object_id
     * @param value the tair_object_id
     */
   public void set_tair_object_id ( Long value )
   {
      tair_object_id = value;
   }

    /**
     * Gets the tair_object_id
     * @return a <code>Long</code> value specifying the tair_object_id
     */
   public Long get_tair_object_id() 
   {
      return tair_object_id;
   }

    /**
     * Sets the image_id
     * @param value the image_id
     */
   public void set_image_id ( Long value )
   {
      image_id = value;
   }

    /**
     * Gets the image_id
     * @return a <code>Long</code> value specifying the image_id
     */
   public Long get_image_id() 
   {
      return image_id;
   }


    /****************************************************************/
  // this part is for test basic functions

    /**
     * main function is used to for testing only 
    */
  public static void main(String[] args){
      try{
	  DBconnection connection = new DBconnection();
	  Long test_id = new Long(53900);
	  //Thread.sleep(20000);
	  //connection.reConnect();  
    
	  TfcTairObjectImage reference = new TfcTairObjectImage(connection, test_id);
	  
	  System.out.println("tair_object_id is " + reference.get_tair_object_id());
	  System.out.println("image_id is " + reference.get_image_id());
	  
	  long id = 1;
	  
	  reference.set_tair_object_id(new Long(id));
	  System.out.println("tair_object_id is " + reference.get_tair_object_id());
	  
	  id++;
	  reference.set_image_id(new Long(id));
	  System.out.println("tairobj_ref_id is " + reference.get_image_id());
	  
      }

      catch(SQLException e){
	  Debugger.println(e.getSQLState());
	  Debugger.println(e.getMessage());
	  e.printStackTrace();
      }

  }
  /**************************************************************/  

}
