//**********************************************************
// Java Class Name : TfcTermRelationship 
// ---------------------------------------------------------
// Filetype: (SOURCE)
// Filepath: /home/yw/gcode/TfcTermRelationship.java 
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
 * This class map to the table TermRelationship in the tair database. Each instance
 * maps one row of data in TermRelationship table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;
import org.tair.utilities.*;
import java.sql.*;

public class TfcTermRelationship 
{   
// Member Variables 

      /**
       * the term_relationship_id value of a specific row in table TermRelationship <code>Long</code>
       */
   protected Long term_relationship_id;


      /**
       * the parent_term_id value of a specific row in table TermRelationship <code>Long</code>
       */
   protected Long parent_term_id;


      /**
       * the child_term_id value of a specific row in table TermRelationship <code>Long</code>
       */
   protected Long child_term_id;


      /**
       * the relationship_type_id value of a specific row in table TermRelationship <code>Long</code>
       */
   protected Long relationship_type_id;

   
    /**
     * the is_obsolete value of a specific row in table Vector 
     * <code>Boolean</code>
     */
    protected Boolean is_obsolete;


// Constructor/Destructor
     /**
     * TfcTermRelationship default constructor.  It instantiate an instance with all
     * fields as null.
     */
   public TfcTermRelationship()
   {
   }

     /**
     * TfcTermRelationship constructor initializes each field according to the value
     * of the object id in the database.  The DBconnection instance is
     * required for database access.  If no row is found corresponding to this
     * object, the instance of TfcTermRelationship is null
     * @param connection the instance of DBconnection
     * @param value the object id of a row in the TermRelationship table
     * @throws SQLException in the case of an invalid operation or database error
     */
   public  TfcTermRelationship( DBconnection connection, Long value )throws SQLException
   {
    boolean more = false;
    String query = null;
       try{
	   if(value != null){
	       query ="select distinct child_term_id, "+
		   "term_relationship_id, "+
		   "relationship_type_id, "+
		   "parent_term_id, "+
		   "is_obsolete "+
		   "from TairObj_Ref "+
		   "where parent_term_id = ?";
	       synchronized(this) { 
		   connection.setQuery(query);
		   connection.setQueryVariable(value);
		   ResultSet results = connection.getResultSet();
		   more = results.next();
		   if(more){
		       long id = results.getLong(1);
		       if(!results.wasNull()){
			   child_term_id = new Long(id);
		       }
		       
		       id = results.getLong(2);
		       if(!results.wasNull()){
			   term_relationship_id = new Long(id);
		       }
		       
		       id = results.getLong(3);
		       if(!results.wasNull()){
			   relationship_type_id = new Long(id);
		       }
		       
		       id = results.getLong(4);
		       if(!results.wasNull()){
			   parent_term_id = new Long(id);
		       }

		       is_obsolete = TextConverter.stringToBoolean(results.getString(5));
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
	   throw new InvalidSQLParameterException("Error on  TermRelationship data select ",query+value);
       }
   }
    
    protected void finalize()
    {
    }
    
// Get/Set Methods For Member Variables


    /**
     * Sets the term_relationship_id
     * @param value the term_relationship_id
     */
   public void set_term_relationship_id ( Long value )
   {
      term_relationship_id = value;
   }

    /**
     * Gets the term_relationship_id
     * @return a <code>Long</code> value specifying the term_relationship_id
     */
   public Long get_term_relationship_id() 
   {
      return term_relationship_id;
   }

    /**
     * Sets the parent_term_id
     * @param value the parent_term_id
     */
   public void set_parent_term_id ( Long value )
   {
      parent_term_id = value;
   }

    /**
     * Gets the parent_term_id
     * @return a <code>Long</code> value specifying the parent_term_id
     */
   public Long get_parent_term_id() 
   {
      return parent_term_id;
   }

    /**
     * Sets the child_term_id
     * @param value the child_term_id
     */
   public void set_child_term_id ( Long value )
   {
      child_term_id = value;
   }

    /**
     * Gets the child_term_id
     * @return a <code>Long</code> value specifying the child_term_id
     */
   public Long get_child_term_id() 
   {
      return child_term_id;
   }

    /**
     * Sets the relationship_type_id
     * @param value the relationship_type_id
     */
   public void set_relationship_type_id ( Long value )
   {
      relationship_type_id = value;
   }

    /**
     * Gets the relationship_type_id
     * @return a <code>Long</code> value specifying the relationship_type_id
     */
   public Long get_relationship_type_id() 
   {
      return relationship_type_id;
   }

    /**
     * Sets the is_obsolete
     * @param value the is_obsolete
     */
   public void set_is_obsolete ( Boolean value )
   {
      is_obsolete = value;
   }

    /**
     * Gets the is_obsolete
     * @return a <code>Boolean</code> value specifying the is_obsolete
     */
   public Boolean get_is_obsolete() 
   {
      return is_obsolete;
   }

    /**
     * test TfcTermRelationship content
     */
    public void test(){
	System.out.println("****** TfcTermRelationship content test ******");

	System.out.println("child_term_id is " + this.get_child_term_id());
	System.out.println("relationship_type_id  is " + this.get_relationship_type_id());
	System.out.println("parent_term_id is " + this.get_parent_term_id());
	System.out.println("term_relationship_id is " + this.get_term_relationship_id());	
	System.out.println("is_obsolete is " + this.get_is_obsolete());	System.out.println("**** TfcTermRelationship content test end ****");
    }

 
    /****************************************************************/
  // this part is for test basic functions

    /**
     * main function is used to for testing only 
    */
  public static void main(String[] args){

      try{
	  DBconnection connection = new DBconnection();
	  Long test_id = new Long(1950854);
	  //Thread.sleep(20000);
	  //connection.reConnect();      
	  TfcTermRelationship reference = new TfcTermRelationship(connection, test_id);
	  reference.test();

	  long id = 1;	  
	  reference.set_child_term_id(new Long(id));
	  id++;
	  reference.set_relationship_type_id(new Long(id));
	  id++;
	  reference.set_parent_term_id(new Long(id));
	  id++;
	  reference.set_term_relationship_id(new Long(id));
	  reference.test();
	  System.out.println("****************************************");
      }
      catch(SQLException e){
	  Debugger.println(e.getSQLState());
	  Debugger.println(e.getMessage());
	  e.printStackTrace();
      }
  }
  /**************************************************************/  
}
