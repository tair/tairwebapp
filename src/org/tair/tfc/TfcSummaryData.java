//**********************************************************
// Java Class Name : TfcSummaryData 
// ---------------------------------------------------------
// Filetype: (SOURCE)
// Filepath: /home/yw/code//TfcSummaryData.java 
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
 * This class map to the table SummaryData in the tair database. Each 
 * instance maps one row of data in SummaryData table. Each data object 
 * maps to one field of a row in the table. Each field has one set method 
 * and one get method for accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;
import org.tair.utilities.*;
import java.sql.*;

public class TfcSummaryData extends TfcEvidence
{   
// Member Variables 

      /**
       * the summary_data_id value of a specific row in table SummaryData <code>Long</code>
       */
   protected Long summary_data_id;

      /**
       * the expression_set_id value of a specific row in table SummaryData <code>Long</code>
       */
   protected Long expression_set_id;


      /**
       * the analysis_reference_id value of a specific row in table SummaryData <code>Long</code>
       */
   protected Long analysis_reference_id;


      /**
       * the map_element_id value of a specific row in table SummaryData <code>Long</code>
       */
   protected Long map_element_id;


      /**
       * the score value of a specific row in table SummaryData <code>String</code>
       */
   protected String score;


      /**
       * the value value of a specific row in table SummaryData <code>String</code>
       */
   protected String value;


      /**
       * the measurement value of a specific row in table SummaryData <code>String</code>
       */
   protected String measurement;


      /**
       * the units value of a specific row in table SummaryData <code>String</code>
       */
   protected String units;


      /**
       * the quality_score_type value of a specific row in table SummaryData <code>String</code>
       */
   protected String quality_score_type;


      /**
       * the quality_score_units value of a specific row in table SummaryData <code>String</code>
       */
   protected String quality_score_units;

      /**
     * the util value of a specific row in table Vector 
     *<code>java.util.Date</code>
     */
    protected java.util.Date date_last_modified; 


// Constructor/Destructor
     /**
     * TfcSummaryData default constructor.  It instantiate an instance with all
     * fields as null.
     */
   public TfcSummaryData()
   {
   }

     /**
     * TfcSummaryData constructor initializes each field according to the 
     * value of the object id in the database.  The DBconnection instance is
     * required for database access.  If no row is found corresponding to this
     * object, the instance of TfcSummaryData is null
     * @param connection the instance of DBconnection
     * @param value the object id of a row in the SummaryData table
     * @throws SQLException in the case of an invalid operation or database error
     */
   public TfcSummaryData( DBconnection connection, Long value)throws SQLException
   {
       super(connection,get_super_id(connection, value));      
       boolean more = false;
       String query = null;
       try{
	   if(value != null){
	       synchronized(this) {
		   query = "select summary_data_id, "+ 
		      "map_element_id, "+
		      "expression_set_id, "+ 
		      "analysis_reference_id, "+
		      "score, "+
		      "quality_score_units, "+
		      "units, "+
		      "quality_score_type, "+
		      "value, "+
		      "measurement, "+
		      "date_last_modified "+
		       "from SummaryData "+ 
		       "where summary_data_id = ?";
		   
		   connection.setQuery(query);
		   connection.setQueryVariable(value);
		   ResultSet results = connection.getResultSet();	       
		   more = results.next();
		   if(more){
		       
		       long id = results.getLong("summary_data_id");
		       if(!results.wasNull()){
			   summary_data_id = new Long(id);
		       }
		       id = results.getLong("map_element_id");
		       if(!results.wasNull()){
			   map_element_id = new Long(id);
		       }
		       id = results.getLong("expression_set_id");
		       if(!results.wasNull()){
			   expression_set_id = new Long(id);
		       }
		       
		       id = results.getLong("analysis_reference_id");
		       if(!results.wasNull()){
			   analysis_reference_id = new Long(id);
		       }
		       
		       score = results.getString("score");
		       
		       quality_score_units = results.getString("quality_score_units");
		       units = results.getString("units");
		       
		       quality_score_type = results.getString("quality_score_type");
		       this.value = results.getString("value");

		       measurement = results.getString("measurement");

		       date_last_modified = results.getDate("date_last_modified");
		       
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
	   throw new InvalidSQLParameterException("Error on SummaryData data select",query+value);
       }
   }

   protected void finalize()
   {
   }

// Get/Set Methods For Member Variables
    /**
     * Gets the its parent object id from database
     * @param value the current object id
     * @param connetion an instance of DBconnection
     * @throw SQLException in the case of an invalid operation or database error
     * @return a <code>Long</code> value specifying the parent id of this object
     */
    public static Long get_super_id(DBconnection connection, Long value)throws SQLException{
	boolean more = false;
	Long retval = new Long(0);
	String query = null;
	try{
	    query ="select evidence_id "+
		          "from SummaryData "+
		          "where summary_data_id = ?";
	    if(value != null){
		connection.setQuery(query);
		connection.setQueryVariable(value);
		ResultSet results = connection.getResultSet();	       
		more = results.next();	    	    
		if(more){
		    retval = new Long(results.getLong(1));
		}
		connection.releaseResources();
	    }
	}

       catch (DataBaseConnectionException ex) {      
	   throw ex;
       }
       catch (InvalidSQLParameterException ex) {      
	   throw ex;
       }
       catch (SQLException ex) {      
	   throw new InvalidSQLParameterException("Error on evidence_id data select for SummaryData",query+value);
       }
	return retval;
    }

    /**
     * Sets the summary_data_id
     * @param value the summary_data_id
     */
   public void set_summary_data_id ( Long value )
   {
      summary_data_id = value;
   }

    /**
     * Gets the summary_data_id
     * @return a <code>Long</code> value specifying the summary_data_id
     */
   public Long get_summary_data_id() 
   {
      return summary_data_id;
   }

    /**
     * Sets the expression_set_id
     * @param value the expression_set_id
     */
   public void set_expression_set_id ( Long value )
   {
      expression_set_id = value;
   }

    /**
     * Gets the expression_set_id
     * @return a <code>Long</code> value specifying the expression_set_id
     */
   public Long get_expression_set_id() 
   {
      return expression_set_id;
   }

    /**
     * Sets the analysis_reference_id
     * @param value the analysis_reference_id
     */
   public void set_analysis_reference_id ( Long value )
   {
      analysis_reference_id = value;
   }

    /**
     * Gets the analysis_reference_id
     * @return a <code>Long</code> value specifying the analysis_reference_id
     */
   public Long get_analysis_reference_id() 
   {
      return analysis_reference_id;
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
     * Sets the score
     * @param value the score
     */
   public void set_score (String value )
   {
      score = value;
   }

    /**
     * Gets the score
     * @return a <code>String</code> value specifying the score
     */
   public String get_score() 
   {
      return score;
   }

    /**
     * Sets the value
     * @param value the value
     */
   public void set_value ( String value )
   {
      this.value = value;
   }

    /**
     * Gets the value
     * @return a <code>String</code> value specifying the value
     */
   public String get_value() 
   {
      return value;
   }

    /**
     * Sets the measurement
     * @param value the measurement
     */
   public void set_measurement ( String value )
   {
      measurement = value;
   }

    /**
     * Gets the measurement
     * @return a <code>String</code> value specifying the measurement
     */
   public String get_measurement() 
   {
      return measurement;
   }

    /**
     * Sets the units
     * @param value the units
     */
   public void set_units ( String value )
   {
      units = value;
   }

    /**
     * Gets the units
     * @return a <code>String</code> value specifying the units
     */
   public String get_units() 
   {
      return units;
   }

    /**
     * Sets the quality_score_type
     * @param value the quality_score_type
     */
   public void set_quality_score_type ( String value )
   {
      quality_score_type = value;
   }

    /**
     * Gets the quality_score_type
     * @return a <code>String</code> value specifying the quality_score_type
     */
   public String get_quality_score_type() 
   {
      return quality_score_type;
   }

    /**
     * Sets the quality_score_units
     * @param value the quality_score_units
     */
   public void set_quality_score_units ( String value )
   {
      quality_score_units = value;
   }

    /**
     * Gets the quality_score_units
     * @return a <code>String</code> value specifying the quality_score_units
     */
   public String get_quality_score_units() 
   {
      return quality_score_units;
   }

   /**
     * Sets the date_last_modified
     * @param value the date_last_modified
     */
   public void set_date_last_modified ( java.util.Date value )
   {
      date_last_modified = value;
   }

    /**
     * Gets the java.util.Date
     * @return a <code>java.util.Date</code> value specifying the util
     */
    public java.util.Date get_date_last_modified() 
    {
	return date_last_modified;
    }

    /**
     * test TfcSummaryData content
     */
    public void test(){
	super.test();
	System.out.println("****** TfcSummaryData content test ******");
	System.out.println("summary_data_id is " + this.get_summary_data_id());
	System.out.println("expression_set_id is " + this.get_expression_set_id());
	System.out.println("map_element_id is " + this.get_map_element_id());
	System.out.println("analysis_reference_id is " + this.get_analysis_reference_id());
	System.out.println("score is " + this.get_score());
	System.out.println("quality_score_units is " + this.get_quality_score_units());
	System.out.println("units is " + this.get_units());
	System.out.println("quality_score_type is " + this.get_quality_score_type());
	System.out.println("value is " + this.get_value());
	System.out.println("measurement " + this.get_measurement());
	System.out.println("date_last_modiefied is " + this.get_date_last_modified());
	System.out.println("**** TfcSummaryData content test end ****");
    }

    /****************************************************************/
  // this part is for test basic functions
    /**
     * main function is used to for testing only 
    */
  public static void main(String[] args){

      try{
	  DBconnection connection = new DBconnection();
	  Long test_id = new Long(666);
	  TfcSummaryData sequence_match = new TfcSummaryData(connection, test_id); 
	  long id = 1;
	  String t = "labda";
	  String n = "phage"; 
	  boolean test = true;
	  
	  //sequence_match	  
	  id++;
	  sequence_match.set_summary_data_id(new Long(id));
	  id++;
	  sequence_match.set_expression_set_id(new Long(id));
	  id++;
	  sequence_match.set_map_element_id(new Long(id));
	  id++;
	  sequence_match.set_analysis_reference_id(new Long(id));
	  id++;
	  sequence_match.set_score("score test");
	  sequence_match.set_quality_score_units("quality_score_units test");
	  int size = 66;
	  sequence_match.set_units("units test");
	  sequence_match.set_quality_score_type("quality_score_type test");
	  sequence_match.set_value("value test");
	  sequence_match.set_measurement("measurement test");
	  
	  sequence_match.test();
	  System.out.println("test completed ");
      }
      catch(SQLException e){
	  Debugger.println(e.getSQLState());
	  Debugger.println(e.getMessage());
	  e.printStackTrace();
      }
  }
  /*************************************************************************/
}

