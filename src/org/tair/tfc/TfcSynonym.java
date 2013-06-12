//**********************************************************
// Java Class Name : TfcSynonym 
// ---------------------------------------------------------
// Filetype: (SOURCE)
// Filepath: /home/yw/code//TfcSynonym.java 
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
 * This class map to the table Synonym in the tair database. Each instance
 * maps one row of data in Synonym table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;
import org.tair.utilities.*;
import java.sql.*;

public class TfcSynonym 
{   
// Member Variables 

      /**
       * the synonym_id value of a specific row in table Synonym <code>Long</code>
       */
   protected Long synonym_id;

      /**
       * the keyword_id value of a specific row in table Synonym <code>Long</code>
       */
   protected Long keyword_id;

      /**
       * the term_synonym value of a specific row in table Synonym <code>String</code>
       */
   protected String term_synonym;

      /**
       * the extdb_id value of a specific row in table Synonym <code>String</code>
       */
   protected String extdb_id;

      /**
       * the term_synonym_uc value of a specific row in table Synonym <code>String</code>
       */
   protected String term_synonym_uc;

      /**
       * the pub_id value of a specific row in table Synonym <code>Long</code>
       */
   protected Long pub_id;

// Constructor/Destructor
     /**
     * TfcSynonym default constructor.  It instantiate an instance with all
     * fields as null.
     */
   public TfcSynonym()
   {
   }

     /**
     * TfcSynonym constructor initializes each field according to the value
     * of the object id in the database.  The DBconnection instance is
     * required for database access.  If no row is found corresponding to this
     * object, the instance of TfcSynonym is null
     * @param connection the instance of DBconnection
     * @param value the object id of a row in the Synonym table
     * @throws SQLException in the case of an invalid operation or database error
     */
   public TfcSynonym( DBconnection connection, Long value )throws SQLException
   {
       boolean more = false;
       String query = null;
	try{
	    if(value != null){
		synchronized(this){
		    
		    query = "select synonym_id, "+
			"keyword_id, "+
			"term_synonym, "+
			"extdb_id, "+
			"term_synonym_uc, "+
			"pub_id "+
			"from TAIR_Synonym "+
			"where synonym_id = ?";
		    connection.setQuery(query);
		    connection.setQueryVariable(value);
		    ResultSet results = connection.getResultSet();	       
		    more = results.next();
		    if(more){
			long id = results.getLong("synonym_id");
			if(!results.wasNull()){
			    synonym_id = new Long(id);
			}
			
			id = results.getLong("keyword_id");
			if(!results.wasNull()){
			    keyword_id = new Long(id);
			}			
			term_synonym = results.getString("term_synonym");
			extdb_id = results.getString("extdb_id");
			term_synonym_uc = results.getString("term_synonym_uc");
			id = results.getLong("pub_id");
			if(!results.wasNull()){
			    pub_id = new Long(id);
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
	   throw new InvalidSQLParameterException("Error on Synonym data select",query+value);
       }


   }


   protected void finalize()
   {
   }

// Get/Set Methods For Member Variables


    /**
     * Sets the synonym_id
     * @param value the synonym_id
     */
   public void set_synonym_id ( Long value )
   {
      synonym_id = value;
   }

    /**
     * Gets the synonym_id
     * @return a <code>Long</code> value specifying the synonym_id
     */
   public Long get_synonym_id() 
   {
      return synonym_id;
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
     * Sets the term_synonym
     * @param value the term_synonym
     */
   public void set_term_synonym ( String value )
   {
      term_synonym = value;
   }

    /**
     * Gets the term_synonym
     * @return a <code>String</code> value specifying the term_synonym
     */
   public String get_term_synonym() 
   {
      return term_synonym;
   }

    /**
     * Sets the extdb_id
     * @param value the extdb_id
     */
   public void set_extdb_id ( String value )
   {
      extdb_id = value;
   }

    /**
     * Gets the extdb_id
     * @return a <code>String</code> value specifying the extdb_id
     */
   public String get_extdb_id() 
   {
      return extdb_id;
   }

    /**
     * Sets the term_synonym_uc
     * @param value the term_synonym_uc
     */
   public void set_term_synonym_uc ( String value )
   {
      term_synonym_uc = value;
   }

    /**
     * Gets the term_synonym_uc
     * @return a <code>String</code> value specifying the term_synonym_uc
     */
   public String get_term_synonym_uc() 
   {
      return term_synonym_uc;
   }

    /**
     * Sets the pub_id
     * @param value the pub_id
     */
   public void set_pub_id ( Long value )
   {
      pub_id = value;
   }

    /**
     * Gets the pub_id
     * @return a <code>Long</code> value specifying the pub_id
     */
   public Long get_pub_id() 
   {
      return pub_id;
   }

    /**
     * test TfcSynonym content
     */
    public void test(){
	System.out.println("****** TfcSynonym content test ******");
	System.out.println("synonym_id is " + this.get_synonym_id());
	System.out.println("keyword_id is " + this.get_keyword_id());
	System.out.println("term_synonym is " + this.get_term_synonym());
	System.out.println("extdb_id is " + this.get_extdb_id());
	System.out.println("term_synonym_uc is " + this.get_term_synonym_uc());
	System.out.println("pub_id is " + this.get_pub_id());
	System.out.println("**** TfcSynonym content test end ****");
    }



    /****************************************************************/
    // this part is for test basic functions
    
    /**
     * main function is used to for testing only 
    */
    public static void main(String[] args){
	try{
	    DBconnection connection = new DBconnection();
	    Long test_id = new Long(780);

	    //Thread.sleep(20000);
	    //connection.reConnect();	    

	    TfcSynonym term_synonym = new TfcSynonym(connection, test_id);
	    term_synonym.test();
	    
	    /*long id = 1;
	    
	    term_synonym.set_synonym_id(new Long(id));

	    id++;
	    term_synonym.set_keyword_id(new Long(id));
	    term_synonym.set_term_synonym("test term_synonym");
	    term_synonym.set_extdb_id("test extdb_id");
	    term_synonym.test();*/
	}
      catch(SQLException e){
	  Debugger.println(e.getSQLState());
	  Debugger.println(e.getMessage());
	  e.printStackTrace();
      }

    }
  /************************************************************************/
}
