//**********************************************************
// Java Class Name : TfcTranslationTables 
// ---------------------------------------------------------
// Filetype: (SOURCE)
// Filepath: /home/yw/code//TfcTranslationTables.java 
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
 * This class map to the table TranslationTables in the tair database. Each instance
 * maps one row of data in TranslationTables table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;
import org.tair.utilities.*;
import java.sql.*;

public class TfcTranslationTables 
{   
// Member Variables 

      /**
       * the translation_tables_id value of a specific row in table TranslationTables <code>Long</code>
       */
   protected Long translation_tables_id;


      /**
       * the start_translation value of a specific row in table TranslationTables <code>String</code>
       */
   protected String start_translation;


      /**
       * the stop_translation value of a specific row in table TranslationTables <code>String</code>
       */
   protected String stop_translation;


      /**
       * the internal_translation value of a specific row in table TranslationTables <code>String</code>
       */
   protected String internal_translation;


      /**
       * the name value of a specific row in table TranslationTables <code>String</code>
       */
   protected String name;

   

// Constructor/Destructor
     /**
     * TfcTranslationTables default constructor.  It instantiate an instance with all
     * fields as null.
     */
   public TfcTranslationTables()
   {
   }

     /**
     * TfcTranslationTables constructor initializes each field according to the value
     * of the object id in the database.  The DBconnection instance is
     * required for database access.  If no row is found corresponding to this
     * object, the instance of TfcTranslationTables is null
     * @param connection the instance of DBconnection
     * @param value the object id of a row in the TranslationTables table
     * @throws SQLException in the case of an invalid operation or database error
     */
   public TfcTranslationTables( DBconnection connection, Long value)throws SQLException
   {
       boolean more = false;
       String query = null;
       try{
	   if(value != null){
	       query ="select translation_tables_id, "+
		   "name, "+
		   "start_translation, "+
		   "stop_translation, "+
		   "internal_translation "+
		   "from TranslationTables "+
		   "where translation_tables_id = ?";
	       synchronized(this){
		   connection.setQuery(query);
		   connection.setQueryVariable(value);
		   ResultSet results = connection.getResultSet();
		   more = results.next();
		   if(more){
		       
		       long id = results.getLong(1);
		       if(!results.wasNull()){
			   translation_tables_id = new Long(id);
		       }
		       
		       name = results.getString(2);
		       
		       start_translation = results.getString(3);
		       
		       stop_translation = results.getString(4);
		       
		       internal_translation = results.getString(5);
		       
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
	   throw new InvalidSQLParameterException("Error on TraslationTables data select ",query+value);
       }
   }


     /**
     * TfcTranslationTables constructor initializes each field according to the value
     * of the object name in the database.  The DBconnection instance is
     * required for database access.  If no row is found corresponding to this
     * object, the instance of TfcTranslationTables is null
     * @param connection the instance of DBconnection
     * @param value the object name of a row in the TranslationTables table
     * @throws SQLException in the case of an invalid operation or database error
     */
   public  TfcTranslationTables( DBconnection connection, String value)throws SQLException
   {
       boolean more = false;
       String query = null;
       try{
	   if(value != null){
	      query ="select translation_tables_id, "+
		   "name, "+
		   "start_translation, "+
		   "stop_translation, "+
		   "internal_translation "+
		   "from TranslationTables "+
		   "where name = ?";
	       synchronized(this){
		   connection.setQuery(query);
		   connection.setQueryVariable(value);
		   ResultSet results = connection.getResultSet();
		   more = results.next();
		   if(more){
		       
		       long id = results.getLong(1);
		       if(!results.wasNull()){
			   translation_tables_id = new Long(id);
		       }
		       
		       name = results.getString(2);
		       
		       start_translation = results.getString(3);
		       
		       stop_translation = results.getString(4);
		       
		       internal_translation = results.getString(5);
		       
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
	   throw new InvalidSQLParameterException("Error on TraslationTables data select ",query+value);
       }
   }
    

   protected void finalize()
   {
   }

// Get/Set Methods For Member Variables


    /**
     * Sets the translation_tables_id
     * @param value the translation_tables_id
     */
   public void set_translation_tables_id ( Long value )
   {
      translation_tables_id = value;
   }

    /**
     * Gets the translation_tables_id
     * @return a <code>Long</code> value specifying the translation_tables_id
     */
   public Long get_translation_tables_id() 
   {
      return translation_tables_id;
   }


    /**
     * Sets the start_translation
     * @param value the start_translation
     */
   public void set_start_translation ( String value )
   {
      start_translation = value;
   }

    /**
     * Gets the start_translation
     * @return a <code>String</code> value specifying the start_translation
     */
   public String get_start_translation() 
   {
      return start_translation;
   }


    /**
     * Sets the stop_translation
     * @param value the stop_translation
     */
   public void set_stop_translation ( String value )
   {
      stop_translation = value;
   }

    /**
     * Gets the stop_translation
     * @return a <code>String</code> value specifying the stop_translation
     */
   public String get_stop_translation() 
   {
      return stop_translation;
   }

    /**
     * Sets the internal_translation
     * @param value the internal_translation
     */
   public void set_internal_translation ( String value )
   {
      internal_translation = value;
   }

    /**
     * Gets the internal_translation
     * @return a <code>String</code> value specifying the internal_translation
     */
   public String get_internal_translation() 
   {
      return internal_translation;
   }

    /**
     * Sets the name
     * @param value the name
     */
   public void set_name ( String value )
   {
      name = value;
   }

    /**
     * Gets the name
     * @return a <code>String</code> value specifying the name
     */
   public String get_name() 
   {
      return name;
   }

    /**
     * test TfcTranslationTables content
     */
    public void test(){
	System.out.println("****** TfcTranslationTables content test ******");
	System.out.println("translation_tables_id is " + this.get_translation_tables_id());
	System.out.println("name is" + this.get_name());
	System.out.println("start_translation is" + this.get_start_translation());
	System.out.println("stop_translation is " + this.get_stop_translation());
	System.out.println("internal_translation is " + this.get_internal_translation());
	
	System.out.println("**** TfcTranslationTables content test end ****");
    }

    /****************************************************************/
  // this part is for test basic functions

    /**
     * main function is used to for testing only 
    */
  public static void main(String[] args){

      try{

	  DBconnection connection = new DBconnection();
	  Long test_id = new Long(1);

	  //Thread.sleep(20000);
	  //connection.reConnect();

	  //Translation_Tables
	  TfcTranslationTables translation_tables = new TfcTranslationTables(connection, test_id);
	  translation_tables.test();
	  	  
	  long id = 1;
	  String t = "alpha";
	  char c = 'c';
	  
	  //Translation_Tables
	  id++;
	  translation_tables.set_translation_tables_id(new Long(id));
	  translation_tables.set_name(new String(t));
	  translation_tables.set_start_translation(new String(t));
	  translation_tables.set_stop_translation(new String(t));
	  translation_tables.set_internal_translation(new String(t));
	  translation_tables.test();
      }
       catch(SQLException e){
	  Debugger.println(e.getSQLState());
	  Debugger.println(e.getMessage());
	  e.printStackTrace();
      }

  }
  /**************************************************************/
}
