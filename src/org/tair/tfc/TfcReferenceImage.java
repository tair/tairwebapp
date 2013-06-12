//**********************************************************
// Java Class Name : TfcReferenceImage 
// ---------------------------------------------------------
// Filetype: (SOURCE)
// Filepath: /home/yw/gcode/TfcReferenceImage.java 
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
 * This class map to the table ReferenceImage in the tair database. Each instance
 * maps one row of data in ReferenceImage table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;
import org.tair.utilities.*;
import java.sql.*;

public class TfcReferenceImage 
{   
// Member Variables 

      /**
       * the reference_id value of a specific row in table ReferenceImage <code>Long</code>
       */
   protected Long reference_id;


      /**
       * the image_id value of a specific row in table ReferenceImage <code>Long</code>
       */
   protected Long image_id;

   

// Constructor/Destructor
     /**
     * TfcReferenceImage default constructor.  It instantiate an instance with all
     * fields as null.
     */
   public TfcReferenceImage()
   {
   }

     /**
     * TfcReferenceImage constructor initializes each field according to the value
     * of the object id in the database.  The DBconnection instance is
     * required for database access.  If no row is found corresponding to this
     * object, the instance of TfcReferenceImage is null
     * @param connection the instance of DBconnection
     * @param value the object id of a row in the ReferenceImage table
     * @throws SQLException in the case of an invalid operation or database error
     */
   public  TfcReferenceImage( DBconnection connection, Long value )throws SQLException
   {
       boolean more = false;
       String query = null;
       try{
	   if(value != null){	       
	       query = "select reference_id, "+
		   "image_id "+
		   "from Reference_Image "+
		   "where reference_id = ?";
	       synchronized(this){       
		   connection.setQuery(query);
		   connection.setQueryVariable(value);
		   ResultSet results = connection.getResultSet();	       
		   more = results.next();
		   if(more){
		       long id = results.getLong(1);
		       if(!results.wasNull()){
			   reference_id = new Long(id);
		       }
		       
		       id = results.getLong(2);
		       if(!results.wasNull()){
			   image_id = new Long(id);
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
	   throw new InvalidSQLParameterException("Error on Reference_Image data select ",query+value);
       }
   }


   protected void finalize()
   {
   }

// Get/Set Methods For Member Variables


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

    /**
     * test TfcReferenceImage content
     */
    public void test(){
	System.out.println("****** TfcReferenceImage content test ******");
	System.out.println("reference_id is " + this.get_reference_id());
	System.out.println("image_id is " + this.get_image_id());   
	System.out.println("**** TfcReferenceImage content test end ****");
    }


    /****************************************************************/
    // this part is for test basic functions
    
    /**
     * main function is used to for testing only 
    */
    public static void main(String[] args){
	try{
	    DBconnection connection = new DBconnection();
	    Long test_id = new Long(35626);
	    //Thread.sleep(20000);
	    //connection.reConnect();	    
	    TfcReferenceImage reference_image = new TfcReferenceImage(connection, test_id);
	    reference_image.test();

	    long id = 1;	    
	    reference_image.set_reference_id(new Long(id));
	    id++;
	    reference_image.set_image_id(new Long(id));
	    reference_image.test();
	}
	catch(SQLException e){
	    Debugger.println(e.getSQLState());
	    Debugger.println(e.getMessage());
	    e.printStackTrace();
	}
    }
    
  /***********************************************************************/

}
