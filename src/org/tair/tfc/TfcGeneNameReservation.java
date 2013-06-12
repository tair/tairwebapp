//**********************************************************
// Java Class Name : TfcGeneNameReservation 
// ---------------------------------------------------------
// Filetype: (SOURCE)
// Filepath: /home/yw/code//TfcGeneNameReservation.java 
// 
// 
// GDPro Properties 
// ---------------------------------------------------
//  - GD Symbol Type    : CLD_Class 
//  - GD Method         : UML ( 3.2 ) 
//  - GD System Name    : TFCSYSTEM_Copy.gdsys 
//  - GD View Type      : Class Diagram 
//  - GD View Name      : Class Diagram 
// ---------------------------------------------------  
//  Author         : yw 
//  Creation Date  : Fri - Oct 27, 2000 
// 
//  Change Log: 
// 
//**********************************************************

/**
 * This class map to the table GeneNameReservation in the tair database. Each instance
 * maps one row of data in GeneNameReservation table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;
import java.util.*;

public class TfcGeneNameReservation 
{   
// Member Variables 

      /**
       * the gene_name_res_id value of a specific row in table GeneNameReservation <code>Long</code>
       */
   protected Long gene_name_res_id;


      /**
       * the person_id value of a specific row in table GeneNameReservation <code>Long</code>
       */
   protected Long person_id;


      /**
       * the gene_id value of a specific row in table GeneNameReservation <code>Long</code>
       */
   protected Long gene_id;


      /**
       * the reserved_name value of a specific row in table GeneNameReservation <code>String</code>
       */
   protected String reserved_name;


      /**
       * the reserved_full_name value of a specific row in table GeneNameReservation <code>String</code>
       */
   protected String reserved_full_name;


      /**
       * the util value of a specific row in table GeneNameReservation <code>java</code>
       */
   protected java.util.Date reservation_date;


      /**
       * the util value of a specific row in table GeneNameReservation <code>java</code>
       */
   protected java.util.Date reserved_expiration_date;

   

// Constructor/Destructor
     /**
     * TfcGeneNameReservation default constructor.  It instantiate an instance with all
     * fields as null.
     */
   public TfcGeneNameReservation()
   {
   }



     /**
     * TfcGeneNameReservation constructor initializes each field according to the value
     * of the object id in the database.  The DBconnection instance is
     * required for database access.  If no row is found corresponding to this
     * object, the instance of TfcGeneNameReservation is null
     * @param connection the instance of DBconnection
     * @param value the object id of a row in the GeneNameReservation table
     * @throws SQLException in the case of an invalid operation or database error
     */
   public TfcGeneNameReservation( DBconnection connection, Long value )throws SQLException
   {
       String query = null;
       try{
	   if(value != null){
	       boolean more = false; 
	       query ="select gene_name_res_id, "+
		   "person_id, "+
		   "gene_id, "+
		   "reserved_name, "+
		   "reserved_full_name, "+
		   "reservation_date, "+
		   "reserved_expiration_date "+
		   "from GeneNameReservation "+
		   "where gene_name_res_id = ?";
	       synchronized(this){
		   connection.setQuery(query);
		   connection.setQueryVariable(value);
		   ResultSet results = connection.getResultSet();	       
		   more = results.next();
		   if(more){
		       
		       long id = results.getLong(1);
		       if(!results.wasNull()){
			   gene_name_res_id = new Long(id);
		       }
		       
		       id = results.getLong(2);
		       if(!results.wasNull()){
			   person_id = new Long(id);
		       }
		       
		       id = results.getLong(3);
		       if(!results.wasNull()){
			   gene_id = new Long(id);
		       }
		       
		       reserved_name = results.getString(4);
		       
		       reserved_full_name = results.getString(5);
		       
		       reservation_date = results.getDate(6);

		       reserved_expiration_date = results.getDate(7);
		       
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
	   throw new InvalidSQLParameterException("Error on GeneNameReservation data select ",query+value);
       }

   }


   protected void finalize()
   {
   }

// Get/Set Methods For Member Variables


    /**
     * Sets the gene_name_res_id
     * @param value the gene_name_res_id
     */
   public void set_gene_name_res_id ( Long value )
   {
      gene_name_res_id = value;
   }

    /**
     * Gets the gene_name_res_id
     * @return a <code>Long</code> value specifying the gene_name_res_id
     */
   public Long get_gene_name_res_id() 
   {
      return gene_name_res_id;
   }

    /**
     * Sets the person_id
     * @param value the person_id
     */
   public void set_person_id ( Long value )
   {
      person_id = value;
   }

    /**
     * Gets the person_id
     * @return a <code>Long</code> value specifying the person_id
     */
   public Long get_person_id() 
   {
      return person_id;
   }

    /**
     * Sets the gene_id
     * @param value the gene_id
     */
   public void set_gene_id ( Long value )
   {
      gene_id = value;
   }

    /**
     * Gets the gene_id
     * @return a <code>Long</code> value specifying the gene_id
     */
   public Long get_gene_id() 
   {
      return gene_id;
   }

    /**
     * Sets the reserved_name
     * @param value the reserved_name
     */
   public void set_reserved_name ( String value )
   {
      reserved_name = value;
   }

    /**
     * Gets the reserved_name
     * @return a <code>String</code> value specifying the reserved_name
     */
   public String get_reserved_name() 
   {
      return reserved_name;
   }

    /**
     * Sets the reserved_full_name
     * @param value the reserved_full_name
     */
   public void set_reserved_full_name ( String value )
   {
      reserved_full_name = value;
   }

    /**
     * Gets the reserved_full_name
     * @return a <code>String</code> value specifying the reserved_full_name
     */
   public String get_reserved_full_name() 
   {
      return reserved_full_name;
   }

    /**
     * Sets the reservation_date
     * @param value the reservation_date
     */
   public void set_reservation_date ( java.util.Date value )
   {
      reservation_date = value;
   }

    /**
     * Gets the util
     * @return a <code>java</code> value specifying the util
     */
   public java.util.Date get_reservation_date() 
   {
      return reservation_date;
   }

    /**
     * Sets the reserved_expiration_date
     * @param value the reserved_expiration_date
     */
   public void set_reserved_expiration_date ( java.util.Date value )
   {
      reserved_expiration_date = value;
   }

    /**
     * Gets the util
     * @return a <code>java</code> value specifying the util
     */
   public java.util.Date get_reserved_expiration_date() 
   {
      return reserved_expiration_date;
   }

    /**
     * test TfcGeneNameReservation content
     */
    public void test(){
	System.out.println("****** TfcGeneNameReservation content test ******");
	System.out.println("gene_name_res_id is " + this.get_gene_name_res_id()); 
	System.out.println("gene_id is " + this.get_gene_id());
	System.out.println("person_id is " + this.get_person_id());
	System.out.println("reserved_name is " + this.get_reserved_name());
	System.out.println("reserved_full_name is " +this.get_reserved_full_name());
	System.out.println("reservation_date is " + this.get_reservation_date());
	System.out.println("reserved_expiration_date is " + this.get_reserved_expiration_date());
	
	System.out.println("**** TfcGeneNameReservation content test end ****");	
    }

    /****************************************************************/
  // this part is for test basic functions
    /**
     * main function is used to for testing only 
    */
  public static void main(String[] args){

      try{
	  DBconnection connection = new DBconnection();
	  Long test_id = new Long(518);
	  
	  //Thread.sleep(20000);
	  //connection.reConnect();

	  TfcGeneNameReservation gene_name_reservation = new TfcGeneNameReservation(connection, test_id);
	  
	  gene_name_reservation.test();
	  
	  
	  long id = 1;
	  String t = "labda";
	  String n = "phage"; 
	  boolean test = true;
	  java.util.Date date = new java.util.Date("July 19 1999");
	  
	  id++;
	  gene_name_reservation.set_gene_name_res_id(new Long(id));
	  id++;
	  gene_name_reservation.set_gene_id(new Long(id));
	  id++; 
	  gene_name_reservation.set_person_id(new Long(id));
	  gene_name_reservation.set_reserved_name(n);
	  gene_name_reservation.set_reserved_full_name(n);
	  gene_name_reservation.set_reservation_date(date);
	  gene_name_reservation.set_reserved_expiration_date(date);
	  gene_name_reservation.test();
      }
      catch(SQLException e){
	  Debugger.println(e.getSQLState());
	  Debugger.println(e.getMessage());
	  e.printStackTrace();
      }

  }
    /*******************************************************************/
}
