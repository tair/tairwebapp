//**********************************************************
// Java Class Name : TfcProcessedData 
// ---------------------------------------------------------
// Filetype: (SOURCE)
// Filepath: /home/yw/code//TfcProcessedData.java 
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
 * This class map to the table ProcessedData in the tair database. Each 
 * instance maps one row of data in ProcessedData table. Each data object 
 * maps to one field of a row in the table. Each field has one set method 
 * and one get method for accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;
import org.tair.utilities.*;
import java.sql.*;

public class TfcProcessedData extends TfcEvidence
{   
// Member Variables 

      /**
       * the processed_data_id value of a specific row in table ProcessedData <code>Long</code>
       */
   protected Long processed_data_id;

      /**
       * the expr_hybridization_id value of a specific row in table ProcessedData <code>Long</code>
       */
   protected Long expr_hybridization_id;


      /**
       * the summary_id value of a specific row in table ProcessedData <code>Long</code>
       */
   protected Long summary_id;


      /**
       * the map_element_id value of a specific row in table ProcessedData <code>Long</code>
       */
   protected Long map_element_id;


      /**
       * the avg_diff_change value of a specific row in table ProcessedData <code>Float</code>
       */
   protected Float avg_diff_change;


      /**
       * the image_flag value of a specific row in table ProcessedData <code>Integer</code>
       */
   protected Integer image_flag;


      /**
       * the log_avg_ratio value of a specific row in table ProcessedData <code>Float</code>
       */
   protected Float log_avg_ratio;


      /**
       * the rat1N_mean value of a specific row in table ProcessedData <code>Float</code>
       */
   protected Float rat1N_mean;


      /**
       * the rat2N_mean value of a specific row in table ProcessedData <code>Float</code>
       */
   protected Float rat2N_mean;


      /**
       * the regression_ratio value of a specific row in table ProcessedData <code>Float</code>
       */
   protected Float regression_ratio;


      /**
       * the log_avg_ratio_change value of a specific row in table ProcessedData <code>Float</code>
       */
   protected Float log_avg_ratio_change;


      /**
       * the regression_conelation value of a specific row in table ProcessedData <code>Float</code>
       */
   protected Float regression_conelation;


      /**
       * the avg_difference value of a specific row in table ProcessedData <code>Integer</code>
       */
   protected Integer avg_difference;


      /**
       * the spot_number value of a specific row in table ProcessedData <code>Integer</code>
       */
   protected Integer spot_number;


      /**
       * the dna_flag value of a specific row in table ProcessedData <code>Integer</code>
       */
   protected Integer dna_flag;

      /**
     * the util value of a specific row in table Vector 
     *<code>java.util.Date</code>
     */
    protected java.util.Date date_last_modified; 


// Constructor/Destructor
     /**
     * TfcProcessedData default constructor.  It instantiate an instance with all
     * fields as null.
     */
   public TfcProcessedData()
   {
   }

     /**
     * TfcProcessedData constructor initializes each field according to the 
     * value of the object id in the database.  The DBconnection instance is
     * required for database access.  If no row is found corresponding to this
     * object, the instance of TfcProcessedData is null
     * @param connection the instance of DBconnection
     * @param value the object id of a row in the ProcessedData table
     * @throws SQLException in the case of an invalid operation or database error
     */
   public TfcProcessedData( DBconnection connection, Long value)throws SQLException
   {
       super(connection,get_super_id(connection, value));      
       boolean more = false;
       String query = null;
       try{
	   if(value != null){
	       synchronized(this) {
		  query = "select processed_data_id, "+ 
		       "map_element_id, "+
		       "expr_hybridization_id, "+ 
		       "summary_id, "+
		       "avg_diff_change, "+
		       "regression_ratio, "+
		       "log_avg_ratio_change, "+
		       "regression_conelation, "+
		       "rat1N_mean, "+
		       "rat2N_mean, "+
		       "image_flag, "+
		       "log_avg_ratio, "+
		       "avg_difference, "+
		       "spot_number, "+
		       "dna_flag "+
		       "from ProcessedData "+ 
		       "where processed_data_id = ?";
		   
		   connection.setQuery(query);
		   connection.setQueryVariable(value);
		   ResultSet results = connection.getResultSet();	       
		   more = results.next();
		   if(more){
		       
		       long id = results.getLong("processed_data_id");
		       if(!results.wasNull()){
			   processed_data_id = new Long(id);
		       }
		       id = results.getLong("map_element_id");
		       if(!results.wasNull()){
			   map_element_id = new Long(id);
		       }
		       id = results.getLong("expr_hybridization_id");
		       if(!results.wasNull()){
			   expr_hybridization_id = new Long(id);
		       }
		       
		       id = results.getLong("summary_id");
		       if(!results.wasNull()){
			   summary_id = new Long(id);
		       }
		       
		       float f = results.getFloat(5);
		       if(!results.wasNull()){
			   avg_diff_change = new Float(f);
		       }
		       
		       f = results.getFloat(6);
		       if(!results.wasNull()){
			   regression_ratio = new Float(f);
		       }

		       
		       f = results.getFloat(7);
		       if(!results.wasNull()){
			   log_avg_ratio_change = new Float(f);
		       }
		       
		       f = results.getFloat(8);
		       if(!results.wasNull()){
			   regression_conelation = new Float(f);
		       }
		       
		       
		       f  = results.getFloat(9);
		       if(!results.wasNull()){
			   rat1N_mean = new Float(f);
		       }
		       
		       f  = results.getFloat(10);
		       if(!results.wasNull()){
			   rat2N_mean = new Float(f);
		       }
		       
		       int i  = results.getInt(11);
		       if(!results.wasNull()){
			   image_flag = new Integer(i);
		       }
		       
		       f  = results.getFloat(12);
		       if(!results.wasNull()){
			   log_avg_ratio = new Float(f);
		       }
		       
		       i  = results.getInt(13);
		       if(!results.wasNull()){
			   avg_difference = new Integer(i);
		       }
		       
		       i  = results.getInt(14);
		       if(!results.wasNull()){
			   spot_number = new Integer(i);
		       }
		       
		       i  = results.getInt(15);
		       if(!results.wasNull()){
			   dna_flag = new Integer(i);
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
	   throw new InvalidSQLParameterException("Error on ProcessedData data select",query+value);
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
		          "from ProcessedData "+
		          "where processed_data_id = ?";
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
	   throw new InvalidSQLParameterException("Error on evidence_id data select for ProcessedData",query+value);
       }
	return retval;
    }

    /**
     * Sets the processed_data_id
     * @param value the processed_data_id
     */
   public void set_processed_data_id ( Long value )
   {
      processed_data_id = value;
   }

    /**
     * Gets the processed_data_id
     * @return a <code>Long</code> value specifying the processed_data_id
     */
   public Long get_processed_data_id() 
   {
      return processed_data_id;
   }

    /**
     * Sets the expr_hybridization_id
     * @param value the expr_hybridization_id
     */
   public void set_expr_hybridization_id ( Long value )
   {
      expr_hybridization_id = value;
   }

    /**
     * Gets the expr_hybridization_id
     * @return a <code>Long</code> value specifying the expr_hybridization_id
     */
   public Long get_expr_hybridization_id() 
   {
      return expr_hybridization_id;
   }

    /**
     * Sets the summary_id
     * @param value the summary_id
     */
   public void set_summary_id ( Long value )
   {
      summary_id = value;
   }

    /**
     * Gets the summary_id
     * @return a <code>Long</code> value specifying the summary_id
     */
   public Long get_summary_id() 
   {
      return summary_id;
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
     * Sets the avg_diff_change
     * @param value the avg_diff_change
     */
   public void set_avg_diff_change ( Float value )
   {
      avg_diff_change = value;
   }

    /**
     * Gets the avg_diff_change
     * @return a <code>Float</code> value specifying the avg_diff_change
     */
   public Float get_avg_diff_change() 
   {
      return avg_diff_change;
   }

    /**
     * Sets the image_flag
     * @param value the image_flag
     */
   public void set_image_flag ( Integer value )
   {
      image_flag = value;
   }

    /**
     * Gets the image_flag
     * @return a <code>Integer</code> value specifying the image_flag
     */
   public Integer get_image_flag() 
   {
      return image_flag;
   }

    /**
     * Sets the log_avg_ratio
     * @param value the log_avg_ratio
     */
   public void set_log_avg_ratio ( Float value )
   {
      log_avg_ratio = value;
   }

    /**
     * Gets the log_avg_ratio
     * @return a <code>Float</code> value specifying the log_avg_ratio
     */
   public Float get_log_avg_ratio() 
   {
      return log_avg_ratio;
   }

    /**
     * Sets the rat1N_mean
     * @param value the rat1N_mean
     */
   public void set_rat1N_mean ( Float value )
   {
      rat1N_mean = value;
   }

    /**
     * Gets the rat1N_mean
     * @return a <code>Float</code> value specifying the rat1N_mean
     */
   public Float get_rat1N_mean() 
   {
      return rat1N_mean;
   }

    /**
     * Sets the rat2N_mean
     * @param value the rat2N_mean
     */
   public void set_rat2N_mean ( Float value )
   {
      rat2N_mean = value;
   }

    /**
     * Gets the rat2N_mean
     * @return a <code>Float</code> value specifying the rat2N_mean
     */
   public Float get_rat2N_mean() 
   {
      return rat2N_mean;
   }

    /**
     * Sets the regression_ratio
     * @param value the regression_ratio
     */
   public void set_regression_ratio ( Float value )
   {
      regression_ratio = value;
   }

    /**
     * Gets the regression_ratio
     * @return a <code>Float</code> value specifying the regression_ratio
     */
   public Float get_regression_ratio() 
   {
      return regression_ratio;
   }

    /**
     * Sets the log_avg_ratio_change
     * @param value the log_avg_ratio_change
     */
   public void set_log_avg_ratio_change ( Float value )
   {
      log_avg_ratio_change = value;
   }

    /**
     * Gets the log_avg_ratio_change
     * @return a <code>Float</code> value specifying the log_avg_ratio_change
     */
   public Float get_log_avg_ratio_change() 
   {
      return log_avg_ratio_change;
   }

    /**
     * Sets the regression_conelation
     * @param value the regression_conelation
     */
   public void set_regression_conelation ( Float value )
   {
      regression_conelation = value;
   }

    /**
     * Gets the regression_conelation
     * @return a <code>Float</code> value specifying the regression_conelation
     */
   public Float get_regression_conelation() 
   {
      return regression_conelation;
   }

    /**
     * Sets the avg_difference
     * @param value the avg_difference
     */
   public void set_avg_difference ( Integer value )
   {
      avg_difference = value;
   }

    /**
     * Gets the avg_difference
     * @return a <code>Integer</code> value specifying the avg_difference
     */
   public Integer get_avg_difference() 
   {
      return avg_difference;
   }

    /**
     * Sets the spot_number
     * @param value the spot_number
     */
   public void set_spot_number ( Integer value )
   {
      spot_number = value;
   }

    /**
     * Gets the spot_number
     * @return a <code>Integer</code> value specifying the spot_number
     */
   public Integer get_spot_number() 
   {
      return spot_number;
   }

    /**
     * Sets the dna_flag
     * @param value the dna_flag
     */
   public void set_dna_flag ( Integer value )
   {
      dna_flag = value;
   }

    /**
     * Gets the dna_flag
     * @return a <code>Integer</code> value specifying the dna_flag
     */
   public Integer get_dna_flag() 
   {
      return dna_flag;
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
     * test TfcProcessedData content
     */
    public void test(){
	super.test();
	System.out.println("****** TfcProcessedData content test ******");
	System.out.println("processed_data_id is " + this.get_processed_data_id());
	System.out.println("expr_hybridization_id is " + this.get_expr_hybridization_id());
	System.out.println("map_element_id is " + this.get_map_element_id());
	System.out.println("summary_id is " + this.get_summary_id());
	System.out.println("avg_diff_change is " + this.get_avg_diff_change());
	System.out.println("regression_ratio is " + this.get_regression_ratio());
	System.out.println("log_avg_ratio_change is " + this.get_log_avg_ratio_change());
	System.out.println("regression_conelation is " + this.get_regression_conelation());
	System.out.println("rat1N_mean is " + this.get_rat1N_mean());
	System.out.println("rat2N_mean is " + this.get_rat2N_mean());
	System.out.println("image_flag is " + this.get_image_flag());
	System.out.println("log_avg_ratio " + this.get_log_avg_ratio());
	System.out.println("is_avg_difference is " + this.get_avg_difference());
	System.out.println("is_spot_number is " + this.get_spot_number());
	System.out.println("is_dna_flag is " + this.get_dna_flag());
	System.out.println("date_last_modiefied is " + this.get_date_last_modified());
	System.out.println("**** TfcProcessedData content test end ****");
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
	  TfcProcessedData sequence_match = new TfcProcessedData(connection, test_id); 
	  long id = 1;
	  String t = "labda";
	  String n = "phage"; 
	  boolean test = true;
	  
	  //sequence_match	  
	  id++;
	  sequence_match.set_processed_data_id(new Long(id));
	  id++;
	  sequence_match.set_expr_hybridization_id(new Long(id));
	  id++;
	  sequence_match.set_map_element_id(new Long(id));
	  id++;
	  sequence_match.set_summary_id(new Long(id));
	  id++;
	  sequence_match.set_avg_diff_change(new Float(66));
	  sequence_match.set_regression_ratio(new Float(66));
	  int size = 66;
	  sequence_match.set_log_avg_ratio_change(new Float(size));
	  sequence_match.set_regression_conelation(new Float(size+10));
	  sequence_match.set_rat1N_mean(new Float(size + 15));
	  sequence_match.set_rat2N_mean(new Float(size +20));
	  sequence_match.set_image_flag(new Integer(120));
	  sequence_match.set_log_avg_ratio(new Float(100));
	  sequence_match.set_avg_difference(new Integer(150));
	  sequence_match.set_spot_number(new Integer(150));
	  sequence_match.set_dna_flag(new Integer(150));
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

