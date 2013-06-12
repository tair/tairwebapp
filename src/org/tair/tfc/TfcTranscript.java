//**********************************************************
// Java Class Name : TfcTranscript 
// ---------------------------------------------------------
// Filetype: (SOURCE)
// Filepath: /home/yw/code//TfcTranscript.java 
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
 * This class map to the table Transcript in the tair database. Each instance
 * maps one row of data in Transcript table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.tfc;
import org.tair.utilities.*;
import java.sql.*;

public class TfcTranscript 
{   
// Member Variables 

      /**
       * the transcript_id value of a specific row in table Transcript <code>Long</code>
       */
   protected Long transcript_id;


      /**
       * the is_edited value of a specific row in table Transcript <code>Boolean</code>
       */
   protected Boolean is_edited;


      /**
       * the orientation value of a specific row in table Transcript <code>Character</code>
       */
   protected Character orientation;


   

// Constructor/Destructor
     /**
     * TfcTranscript default constructor.  It instantiate an instance with all
     * fields as null.
     */
   public TfcTranscript()
   {
   }

     /**
     * TfcTranscript constructor initializes each field according to the value
     * of the object id in the database.  The DBconnection instance is
     * required for database access.  If no row is found corresponding to this
     * object, the instance of TfcTranscript is null
     * @param connection the instance of DBconnection
     * @param value the object id of a row in the Transcript table
     * @throws SQLException in the case of an invalid operation or database error
     */
   public TfcTranscript( DBconnection connection, Long value )throws SQLException
   {
    boolean more = false;

    try{
	if(value != null){
	    String query = "select transcript_id, "+
		"is_edited, "+
		"orientation "+
		"from Transcript "+
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
			    transcript_id = new Long(id);
			}
			
			String s = results.getString(2);
			if (s != null){
			    if(s.equals("T")){     
				is_edited = new Boolean(true);
			    }
			    else{
				is_edited = new Boolean(false);
			    }
			}

			s = results.getString(3);
			if(s != null){
			   orientation = new Character(s.charAt(0));
		       }
		    }
		}
	    }
	}
    }
    catch (SQLException ex) {      
	// Print description of the exception.
	System.out.println( "** Error on Transcript data select. **" );
	throw ex;
	//ex.printStackTrace ();      
    }       
   }       

   protected void finalize()
   {
   }

// Get/Set Methods For Member Variables


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
     * Sets the is_edited
     * @param value the is_edited
     */
   public void set_is_edited ( Boolean value )
   {
      is_edited = value;
   }

    /**
     * Gets the is_edited
     * @return a <code>Boolean</code> value specifying the is_edited
     */
   public Boolean get_is_edited() 
   {
      return is_edited;
   }

    /**
     * Sets the orientation
     * @param value the orientation
     */
   public void set_orientation ( Character value )
   {
      orientation = value;
   }

    /**
     * Gets the orientation
     * @return a <code>Character</code> value specifying the orientation
     */
   public Character get_orientation() 
   {
      return orientation;
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

	    TfcTranscript transcript = new TfcTranscript(connection, test_id);
	    System.out.println("transcript_id is " + transcript.get_transcript_id());
	    System.out.println("is_edited is " + transcript.get_is_edited());
	    
	    System.out.println("orientation is " + transcript.get_orientation());
	    
	    long id = 1;
	    
	    transcript.set_transcript_id(new Long(id));
	    System.out.println("transcript_id is " + transcript.get_transcript_id());
	    id++;
	    transcript.set_is_edited(new Boolean(false));
	    System.out.println("is_edited is " + transcript.get_is_edited());
	    
	    transcript.set_orientation(new Character('a'));
	    System.out.println("orientation is " + transcript.get_orientation());
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
