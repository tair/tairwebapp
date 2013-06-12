//**********************************************************
// Java Class Name : TfcNucleotideTranscript 
// ---------------------------------------------------------
// Filetype: (SOURCE)
// Filepath: /home/yw/code//TfcNucleotideTranscript.java 
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
 * This class map to the table NucleoSeqTranscript in the tair database. Each instance
 * maps one row of data in NucleoSeqTranscript table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;

public class TfcNucleoSeqTranscript 
{   
// Member Variables 

      /**
       * the nucleotide_seq_id value of a specific row in table NucleoSeqTranscript <code>Long</code>
       */
   protected Long nucleotide_seq_id;


      /**
       * the transcript_id value of a specific row in table NucleoSeqTranscript <code>Long</code>
       */
   protected Long transcript_id;


      /**
       * the cds_is_full_length value of a specific row in table NucleoSeqTranscript <code>Boolean</code>
       */
   protected Boolean cds_is_full_length;


      /**
       * the cds_is_transpliced value of a specific row in table NucleoSeqTranscript <code>Boolean</code>
       */
   protected Boolean cds_is_transpliced;


      /**
       * the cds_is_est value of a specific row in table NucleoSeqTranscript <code>Boolean</code>
       */
   protected Boolean cds_is_est;

   

// Constructor/Destructor
     /**
     * TfcNucleoSeqTranscript default constructor.  It instantiate an instance with all
     * fields as null.
     */
   public TfcNucleoSeqTranscript()
   {
   }

     /**
     * TfcNucleoSeqTranscript constructor initializes each field according to the value
     * of the object id in the database.  The DBconnection instance is
     * required for database access.  If no row is found corresponding to this
     * object, the instance of TfcNucleoSeqTranscript is null
     * @param connection the instance of DBconnection
     * @param value the object id of a row in the NucleoSeqTranscript table
     * @throws SQLException in the case of an invalid operation or database error
     */
   public TfcNucleoSeqTranscript( DBconnection connection, Long value)throws SQLException
   {
    boolean more = false;

    try{
	if(value != null){
	    String query = "select nucleotide_seq_id, "+
		"transcript_id, "+
		"cds_is_full_length, "+
		"cds_is_transpliced, "+
		"cds_is_est "+
		"from NucleoSeq_Transcript "+
		"where transcript_id = ?";
	    synchronized(this){
		if(value != null){
		    connection.setQuery(query);
		    connection.setQueryVariable(value);
		    ResultSet results = connection.getResultSet();	       
		    more = results.next();
		    if(more){
			long id = results.getLong(1);
			if(!results.wasNull()){
			    nucleotide_seq_id = new Long(id);
			}
			
			id = results.getLong(2);
			if(!results.wasNull()){
			    transcript_id = new Long(id);
			}
			
			String s = results.getString(3);
			if (s != null){
			    if(s.equals("T")){     
				cds_is_full_length = new Boolean(true);
			    }
			    else{
				cds_is_full_length = new Boolean(false);
			    }
			}   	

			s = results.getString(4);
			if (s != null){
			    if(s.equals("T")){     
				cds_is_transpliced = new Boolean(true);
			    }
			    else{
				cds_is_transpliced = new Boolean(false);
			    }
			}

			s = results.getString(5);
			if (s != null){
			    if(s.equals("T")){     
				cds_is_est = new Boolean(true);
			    }
			    else{
				cds_is_est = new Boolean(false);
			    }
			}
   	
		    }
		}
	    }
	}
    }
    catch (SQLException ex) {      
	// Print description of the exception.
	System.out.println( "** Error on Nucleotide_Trascript data select. **" );
	throw ex;
	//ex.printStackTrace ();      
    }       
   }

   protected void finalize()
   {
   }

// Get/Set Methods For Member Variables


    /**
     * Sets the nucleotide_seq_id
     * @param value the nucleotide_seq_id
     */
   public void set_nucleotide_seq_id ( Long value )
   {
      nucleotide_seq_id = value;
   }

    /**
     * Gets the nucleotide_seq_id
     * @return a <code>Long</code> value specifying the nucleotide_seq_id
     */
   public Long get_nucleotide_seq_id() 
   {
      return nucleotide_seq_id;
   }

    /**
     * Sets the transcript_id
     * @param value the transcript_id
     */
   public void set_transcript_id ( Long value )
   {
      transcript_id = value;
   }

    /**
     * Gets the transcript_id
     * @return a <code>Long</code> value specifying the transcript_id
     */
   public Long get_transcript_id() 
   {
      return transcript_id;
   }

    /**
     * Sets the cds_is_full_length
     * @param value the cds_is_full_length
     */
   public void set_cds_is_full_length ( Boolean value )
   {
      cds_is_full_length = value;
   }

    /**
     * Gets the cds_is_full_length
     * @return a <code>Boolean</code> value specifying the cds_is_full_length
     */
   public Boolean get_cds_is_full_length() 
   {
      return cds_is_full_length;
   }

    /**
     * Sets the cds_is_transpliced
     * @param value the cds_is_transpliced
     */
   public void set_cds_is_transpliced ( Boolean value )
   {
      cds_is_transpliced = value;
   }

    /**
     * Gets the cds_is_transpliced
     * @return a <code>Boolean</code> value specifying the cds_is_transpliced
     */
   public Boolean get_cds_is_transpliced() 
   {
      return cds_is_transpliced;
   }

    /**
     * Sets the cds_is_est
     * @param value the cds_is_est
     */
   public void set_cds_is_est ( Boolean value )
   {
      cds_is_est = value;
   }

    /**
     * Gets the cds_is_est
     * @return a <code>Boolean</code> value specifying the cds_is_est
     */
   public Boolean get_cds_is_est() 
   {
      return cds_is_est;
   }
    /****************************************************************/
    // this part is for test basic functions
    
    /**
     * main function is used to for testing only 
    */
    public static void main(String[] args){
	try{
	    DBconnection connection = new DBconnection();
	    Long test_id = new Long(3);

	    //Thread.sleep(20000);
	    //connection.reConnect();	
	    
	    TfcNucleoSeqTranscript nucleotide_transcript = new TfcNucleoSeqTranscript(connection, test_id);
	    System.out.println("nucleotide_seq_id is " + nucleotide_transcript.get_nucleotide_seq_id());
	    System.out.println("transcript_id is " + nucleotide_transcript.get_transcript_id());
	    
	    System.out.println("cds_is_full_length is " + nucleotide_transcript.get_cds_is_full_length());
	    
	    System.out.println("cds_is_transpliced is " + nucleotide_transcript.get_cds_is_transpliced());
	    
	    
	    System.out.println("cds_is_est is " + nucleotide_transcript.get_cds_is_est());
	    
	    long id = 1;
	    
	    nucleotide_transcript.set_nucleotide_seq_id(new Long(id));
	    System.out.println("nucleotide_seq_id is " + nucleotide_transcript.get_nucleotide_seq_id());
	    id++;
	    nucleotide_transcript.set_transcript_id(new Long(id));
	    System.out.println("transcript_id is " + nucleotide_transcript.get_transcript_id());
	    
	    nucleotide_transcript.set_cds_is_full_length(new Boolean(true));
	    System.out.println("cds_is_full_length is " + nucleotide_transcript.get_cds_is_full_length());
	    
	    nucleotide_transcript.set_cds_is_transpliced(new Boolean(true));
	    System.out.println("cds_is_transpliced is " + nucleotide_transcript.get_cds_is_transpliced());
	    
	    nucleotide_transcript.set_cds_is_est(new Boolean(true));
	    System.out.println("cds_is_est is " + nucleotide_transcript.get_cds_is_est());
	}

	catch(SQLException e){
	    if (e instanceof DataBaseConnectionException){
		System.out.println( "** Error code: **"+e.getClass().getName() );
		System.out.println( "** Error code: **"+Integer.toString(e.hashCode()) );
	    }
	    else{
    /**
     * main function is used to for testing only 
    */
		System.out.println("main function error !"); 
	    }
	}	
	
  }
  /************************************************************************/

}
