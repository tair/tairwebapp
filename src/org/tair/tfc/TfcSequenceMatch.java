//**********************************************************
// Java Class Name : TfcSequenceMatch 
// ---------------------------------------------------------
// Filetype: (SOURCE)
// Filepath: /home/yw/code//TfcSequenceMatch.java 
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
 * This class map to the table SequenceMatch in the tair database. Each 
 * instance maps one row of data in SequenceMatch table. Each data object 
 * maps to one field of a row in the table. Each field has one set method 
 * and one get method for accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;
import org.tair.utilities.*;
import java.sql.*;

public class TfcSequenceMatch extends TfcEvidence
{   
// Member Variables 

      /**
       * the sequence_match_id value of a specific row in table SequenceMatch <code>Long</code>
       */
   protected Long sequence_match_id;

      /**
       * the evidence_id value of a specific row in table SequenceMatch <code>Long</code>
       */
   protected Long evidence_id;

      /**
       * the query_id value of a specific row in table SequenceMatch <code>Long</code>
       */
   protected Long query_id;


      /**
       * the subject_id value of a specific row in table SequenceMatch <code>Long</code>
       */
   protected Long subject_id;


      /**
       * the assignment_id value of a specific row in table SequenceMatch <code>Long</code>
       */
   protected Long assignment_id;


      /**
       * the type value of a specific row in table SequenceMatch <code>String</code>
       */
   protected String type;


      /**
       * the query_start value of a specific row in table SequenceMatch <code>Integer</code>
       */
   protected Integer query_start;


      /**
       * the query_end value of a specific row in table SequenceMatch <code>Integer</code>
       */
   protected Integer query_end;


      /**
       * the subject_start value of a specific row in table SequenceMatch <code>Integer</code>
       */
   protected Integer subject_start;


      /**
       * the subject_end value of a specific row in table SequenceMatch <code>Integer</code>
       */
   protected Integer subject_end;


      /**
       * the alignment_detail value of a specific row in table SequenceMatch <code>String</code>
       */
   protected String alignment_detail;


      /**
       * the seq_match_score value of a specific row in table SequenceMatch <code>Float</code>
       */
   protected Float seq_match_score;


      /**
       * the expect value of a specific row in table SequenceMatch <code>Float</code>
       */
   protected Float expect;


      /**
       * the identities value of a specific row in table SequenceMatch <code>Integer</code>
       */
   protected Integer identities;


      /**
       * the positives value of a specific row in table SequenceMatch <code>Integer</code>
       */
   protected Integer positives;


      /**
       * the gaps value of a specific row in table SequenceMatch <code>Integer</code>
       */
   protected Integer gaps;

      /**
     * the util value of a specific row in table Vector 
     *<code>java.util.Date</code>
     */
    protected java.util.Date date_last_modified; 


// Constructor/Destructor
     /**
     * TfcSequenceMatch default constructor.  It instantiate an instance with all
     * fields as null.
     */
   public TfcSequenceMatch()
   {
   }

     /**
     * TfcSequenceMatch constructor initializes each field according to the 
     * value of the object id in the database.  The DBconnection instance is
     * required for database access.  If no row is found corresponding to this
     * object, the instance of TfcSequenceMatch is null
     * @param connection the instance of DBconnection
     * @param value the object id of a row in the SequenceMatch table
     * @throws SQLException in the case of an invalid operation or database error
     */
   public TfcSequenceMatch( DBconnection connection, Long value)throws SQLException
   {
       super(connection,get_super_id(connection, value));      
       boolean more = false;
       String query = null;
       try{
	   if(value != null){
	       synchronized(this) {
		  query = "select sequence_match_id, "+ 
		       "assignment_id, "+
		       "query_id, "+ 
		       "subject_id, "+
		       "type, "+
		       "alignment_detail, "+
		       "seq_match_score, "+
		       "expect, "+
		       "subject_start, "+
		       "subject_end, "+
		       "query_start, "+
		       "query_end, "+
		       "identities, "+
		       "positives, "+
		       "gaps "+
		       "from SequenceMatch "+ 
		       "where sequence_match_id = ?";
		   
		   connection.setQuery(query);
		   connection.setQueryVariable(value);
		   ResultSet results = connection.getResultSet();	       
		   more = results.next();
		   if(more){
		       
		       long id = results.getLong(1);
		       if(!results.wasNull()){
			   sequence_match_id = new Long(id);
		       }
		       id = results.getLong(2);
		       if(!results.wasNull()){
			   assignment_id = new Long(id);
		       }
		       id = results.getLong(3);
		       if(!results.wasNull()){
			   query_id = new Long(id);
		       }
		       
		       id = results.getLong(4);
		       if(!results.wasNull()){
			   subject_id = new Long(id);
		       }
		       
		       type = results.getString(5);
		       
		       alignment_detail = results.getString(6);
		       
		       float f = results.getFloat(7);
		       if(!results.wasNull()){
			   seq_match_score = new Float(f);
		       }
		       
		       f = results.getFloat(8);
		       if(!results.wasNull()){
			   expect = new Float(f);
		       }
		       
		       
		       int i  = results.getInt(9);
		       if(!results.wasNull()){
			   subject_start = new Integer(i);
		       }
		       
		       i  = results.getInt(10);
		       if(!results.wasNull()){
			   subject_end = new Integer(i);
		       }
		       
		       i  = results.getInt(11);
		       if(!results.wasNull()){
			   query_start = new Integer(i);
		       }
		       
		       i  = results.getInt(12);
		       if(!results.wasNull()){
			   query_end = new Integer(i);
		       }
		       
		       i  = results.getInt(13);
		       if(!results.wasNull()){
			   identities = new Integer(i);
		       }
		       
		       i  = results.getInt(14);
		       if(!results.wasNull()){
			   positives = new Integer(i);
		       }
		       
		       i  = results.getInt(15);
		       if(!results.wasNull()){
			   gaps = new Integer(i);
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
	   throw new InvalidSQLParameterException("Error on SequenceMatch data select",query+value);
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
		          "from SequenceMatch "+
		          "where sequence_match_id = ?";
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
	   throw new InvalidSQLParameterException("Error on evidence_id data select for sequence_match",query+value);
       }
	return retval;
    }

    /**
     * Sets the sequence_match_id
     * @param value the sequence_match_id
     */
   public void set_sequence_match_id ( Long value )
   {
      sequence_match_id = value;
   }

    /**
     * Gets the sequence_match_id
     * @return a <code>Long</code> value specifying the sequence_match_id
     */
   public Long get_sequence_match_id() 
   {
      return sequence_match_id;
   }

    /**
     * Sets the query_id
     * @param value the query_id
     */
   public void set_query_id ( Long value )
   {
      query_id = value;
   }

    /**
     * Gets the query_id
     * @return a <code>Long</code> value specifying the query_id
     */
   public Long get_query_id() 
   {
      return query_id;
   }

    /**
     * Sets the subject_id
     * @param value the subject_id
     */
   public void set_subject_id ( Long value )
   {
      subject_id = value;
   }

    /**
     * Gets the subject_id
     * @return a <code>Long</code> value specifying the subject_id
     */
   public Long get_subject_id() 
   {
      return subject_id;
   }

    /**
     * Sets the assignment_id
     * @param value the assignment_id
     */
   public void set_assignment_id ( Long value )
   {
      assignment_id = value;
   }

    /**
     * Gets the assignment_id
     * @return a <code>Long</code> value specifying the assignment_id
     */
   public Long get_assignment_id() 
   {
      return assignment_id;
   }

    /**
     * Sets the type
     * @param value the type
     */
   public void set_type ( String value )
   {
      type = value;
   }

    /**
     * Gets the type
     * @return a <code>String</code> value specifying the type
     */
   public String get_type() 
   {
      return type;
   }

    /**
     * Sets the query_start
     * @param value the query_start
     */
   public void set_query_start ( Integer value )
   {
      query_start = value;
   }

    /**
     * Gets the query_start
     * @return a <code>Integer</code> value specifying the query_start
     */
   public Integer get_query_start() 
   {
      return query_start;
   }

    /**
     * Sets the query_end
     * @param value the query_end
     */
   public void set_query_end ( Integer value )
   {
      query_end = value;
   }

    /**
     * Gets the query_end
     * @return a <code>Integer</code> value specifying the query_end
     */
   public Integer get_query_end() 
   {
      return query_end;
   }

    /**
     * Sets the subject_start
     * @param value the subject_start
     */
   public void set_subject_start ( Integer value )
   {
      subject_start = value;
   }

    /**
     * Gets the subject_start
     * @return a <code>Integer</code> value specifying the subject_start
     */
   public Integer get_subject_start() 
   {
      return subject_start;
   }

    /**
     * Sets the subject_end
     * @param value the subject_end
     */
   public void set_subject_end ( Integer value )
   {
      subject_end = value;
   }

    /**
     * Gets the subject_end
     * @return a <code>Integer</code> value specifying the subject_end
     */
   public Integer get_subject_end() 
   {
      return subject_end;
   }

    /**
     * Sets the alignment_detail
     * @param value the alignment_detail
     */
   public void set_alignment_detail ( String value )
   {
      alignment_detail = value;
   }

    /**
     * Gets the alignment_detail
     * @return a <code>String</code> value specifying the alignment_detail
     */
   public String get_alignment_detail() 
   {
      return alignment_detail;
   }

    /**
     * Sets the seq_match_score
     * @param value the seq_match_score
     */
   public void set_seq_match_score ( Float value )
   {
      seq_match_score = value;
   }

    /**
     * Gets the seq_match_score
     * @return a <code>Float</code> value specifying the seq_match_score
     */
   public Float get_seq_match_score() 
   {
      return seq_match_score;
   }

    /**
     * Sets the expect
     * @param value the expect
     */
   public void set_expect ( Float value )
   {
      expect = value;
   }

    /**
     * Gets the expect
     * @return a <code>Float</code> value specifying the expect
     */
   public Float get_expect() 
   {
      return expect;
   }

    /**
     * Sets the identities
     * @param value the identities
     */
   public void set_identities ( Integer value )
   {
      identities = value;
   }

    /**
     * Gets the identities
     * @return a <code>Integer</code> value specifying the identities
     */
   public Integer get_identities() 
   {
      return identities;
   }

    /**
     * Sets the positives
     * @param value the positives
     */
   public void set_positives ( Integer value )
   {
      positives = value;
   }

    /**
     * Gets the positives
     * @return a <code>Integer</code> value specifying the positives
     */
   public Integer get_positives() 
   {
      return positives;
   }

    /**
     * Sets the gaps
     * @param value the gaps
     */
   public void set_gaps ( Integer value )
   {
      gaps = value;
   }

    /**
     * Gets the gaps
     * @return a <code>Integer</code> value specifying the gaps
     */
   public Integer get_gaps() 
   {
      return gaps;
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
     * test TfcSequenceMatch content
     */
    public void test(){
	super.test();
	System.out.println("****** TfcSequenceMatch content test ******");
	System.out.println("sequence_match_id is " + this.get_sequence_match_id());
	System.out.println("query_id is " + this.get_query_id());
	System.out.println("assignment_id is " + this.get_assignment_id());
	System.out.println("subject_id is " + this.get_subject_id());
	System.out.println("type is " + this.get_type());
	System.out.println("alignment_detail is " + this.get_alignment_detail());
	System.out.println("seq_match_score is " + this.get_seq_match_score());
	System.out.println("expect is " + this.get_expect());
	System.out.println("subject_start is " + this.get_subject_start());
	System.out.println("subject_end is " + this.get_subject_end());
	System.out.println("query_start is " + this.get_query_start());
	System.out.println("query_end " + this.get_query_end());
	System.out.println("is_identities is " + this.get_identities());
	System.out.println("is_positives is " + this.get_positives());
	System.out.println("is_gaps is " + this.get_gaps());
	System.out.println("date_last_modiefied is " + this.get_date_last_modified());
	System.out.println("**** TfcSequenceMatch content test end ****");
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
	  TfcSequenceMatch sequence_match = new TfcSequenceMatch(connection, test_id); 
	  long id = 1;
	  String t = "labda";
	  String n = "phage"; 
	  boolean test = true;
	  
	  //sequence_match	  
	  id++;
	  sequence_match.set_sequence_match_id(new Long(id));
	  id++;
	  sequence_match.set_query_id(new Long(id));
	  id++;
	  sequence_match.set_assignment_id(new Long(id));
	  id++;
	  sequence_match.set_subject_id(new Long(id));
	  id++;
	  sequence_match.set_type("type test");
	  sequence_match.set_alignment_detail("alignment_detail");
	  int size = 66;
	  sequence_match.set_seq_match_score(new Float(size));
	  sequence_match.set_expect(new Float(size+10));
	  sequence_match.set_subject_start(new Integer(size + 15));
	  sequence_match.set_subject_end(new Integer(size +20));
	  sequence_match.set_query_start(new Integer(120));
	  sequence_match.set_query_end(new Integer(100));
	  sequence_match.set_identities(new Integer(150));
	  sequence_match.set_positives(new Integer(150));
	  sequence_match.set_gaps(new Integer(150));
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
