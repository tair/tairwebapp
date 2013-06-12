/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.bs.community.BsAttribution;
import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * Sequence extends TfcNucleotideSequence to present complete
 * data about a nucleotide sequence including attributions for
 * the sequence. Sequence offers constructs that allow client code
 * to optionally include NT sequence text itself or not when
 * retrieving data.  This is done so that sequence data is only
 * retrieved when absolutely necessary for display.
 */

public class Sequence extends TfcNucleotideSequence {
    

  /**
   * Serial version UID for serializable object
   */
  private static final long serialVersionUID = 5993100211519546340L;
  // Attributions for this sequence - stored as BsAttributions
  private AttributionObjectCollection attributions;

  /**
   * Creates an empty instance of Sequence
   */ 
  public Sequence() { 
    super();
  }


  /**
   * Creates an instance of Sequence to represent all data referenced by supplied 
   * sequence id except for the nucleotide sequence text itself. This version
   * of the constructor should be used when information is needed about the sequence, 
   * but the actual sequence is not required.
   *
   * @param conn An active connection to the database
   * @param sequence_id Nucleotide sequence id to retrieve data for
   * @exception SQLException thrown in the case of an invalid operation or database error
   */
  public Sequence( DBconnection conn, Long sequence_id ) throws SQLException {
    super( conn, sequence_id, false ); // don't get sequence text
    if ( sequence_id != null && get_tair_object_id() != null ) {
      populate( conn ); 
    }
  }


  /**
   * Creates an instance of Sequence that contains all data for the submitted 
   * nucleotide sequence id, optionally including the NT sequence text itself.
   *
   * @param conn An active conn to the database
   * @param sequence_id Nucleotide sequence id to retrieve data for
   * @param getSequence If <code>true</code>, full sequence will be retrieved; if 
   * <code>false</code> sequence will not be retrieved
   * @throws SQLException in the case of an invalid operation or database error
   */
  public Sequence( DBconnection conn, Long sequence_id, boolean getSequence ) throws SQLException {
    super( conn, sequence_id, getSequence );
    if ( sequence_id != null ) {
      populate( conn );
    }
  }


  private void populate( DBconnection conn ) throws SQLException {
    if ( get_tair_object_id() != null ) {
      attributions = new AttributionObjectCollection( conn, get_tair_object_id() );
    }
  }



  /**
   * Returns attributions as a colon delimited String
   *
   * @return a <code>String</code> value specifying the attribution sources,
   * or <code>null</code> if no attributions for sequence
   * @throws SQLException when can't lazily load attributions
   */ 
  public String get_source_string() throws SQLException {
    String source = null;
    StringBuffer buffer = null;
    boolean first = true;
    List<BsAttribution> list = get_attributions();

    if ( list != null ) {
      buffer = new StringBuffer();
      for ( BsAttribution attribution : list ) {
	if ( !first ) {
	  buffer.append( ":" );
	}
	buffer.append( attribution.getCommunity().getName() );
	first = false;
      } 
      source = buffer.toString();
    }
    return source;
  }

  /**
   * Returns source of "submitted by" attribution
   *
   * @return a <code>String</code> value specifying the submission source,
   * or <code>null</code> if no submitted by attribution for sequence
   * @throws SQLException when can't lazily load community
   */ 
  public String get_submission_source() throws SQLException {
    String submittedBy = null;
    List<BsAttribution> list = get_attributions();

    if ( list != null ) {
      for ( BsAttribution attribution : list ) {
	if ( attribution.getType() != null && 
             attribution.getType().getAttributionType().equals( "submitted_by" ) ) {
	  submittedBy = attribution.getCommunity().getName();
	  break;
	}
      }
    }
    return submittedBy;
  }

  /**
   * Returns date of "submitted by" attribution
   *
   * @return a <code>Date</code> value specifying the submission date
   * or <code>null</code> if no submitted by attribution for sequence
   */ 
  public java.util.Date get_submission_date() {
    java.util.Date submissionDate = null;
    List<BsAttribution> list = get_attributions();

    if ( list != null ) {
      for ( BsAttribution attribution : list ) {
	if ( attribution.getType() != null && 
             attribution.getType().getAttributionType().equals( "submitted_by" ) ) {
	  submissionDate = attribution.getAttributionDate();
	  break;
	}
      }
    }
    return submissionDate;
  }


  
  /**
   * Retrieves attributions for sequence
   *
   * @return Attributions of this sequence as an <code>Iterator</code>
   * of <code>BsAttribution</code>s, or <code>null</code> if no
   * attributions stored for this sequence
   */
  public List<BsAttribution> get_attributions() {
    return ( attributions != null && !attributions.isEmpty() ) ? attributions.getAttributions() : null;
  }
  
  


  /**
   * Retrieves formatted value to use for displaying sequence type. 
   *
   * @return sequence type as a formatted string for display
   */
  public String get_format_type() {
    String returnType = get_nucleotidesequence_type();
    
    if ( returnType != null && returnType.equalsIgnoreCase("mrna") ) {
      returnType = "mRNA";
    }
    return returnType;
  }

  /**
   * Retrieves display value for sequence.  This value will be the
   * value of sequence class with a prefix if "full length" if the 
   * cd_is_full_length flag for sequence is true
   *
   * @return String for displaying sequence
   */
  public String get_format_sequence_name() {
    StringBuffer buffer = new StringBuffer();

    if ( get_sequence_class() != null ) {
      if ( get_cds_is_full_length() != null && get_cds_is_full_length().booleanValue() ) {
        buffer.append( "full length " );
      }
      
      buffer.append( TextConverter.uscoreToSpace( get_sequence_class() ) );
    } else {
      buffer.append( "unknown_sequence" );
    }
    
    return buffer.toString();

    /*
      Save old logic for a while just in case -- NM 7.8.2003

    String sequence_name = null;
    boolean full_length = ( get_cds_is_full_length() != null && get_cds_is_full_length().booleanValue() );
    boolean is_cds =  ( get_is_cds() != null && get_is_cds().booleanValue() );
    boolean is_est = ( get_cds_is_est() != null && get_cds_is_est().booleanValue() );

    if ( get_type() != null && get_type().equals( "genomic" ) ) {
      if ( is_cds ) {
      sequence_name = "CDS";
      } else {
	sequence_name = "genomic";
      }
    } else if ( get_type() != null && get_type().equals( "mrna" ) ) {
      if ( full_length ) {
	sequence_name = "full-length cDNA";
      } else if ( is_est ) {
	sequence_name = "EST";
      } else {
	sequence_name = "cDNA";
      }
    } else {
      sequence_name = "unknown_sequence";
    }
    return sequence_name;
    }
    */
  }
  
  /**
   * For unit testing only
   */
  public void test() {
    System.out.println( "****** Sequence content test ******" );
    super.test();
    //attributions.test();
    try {
      System.out.println( "source is "+ get_source_string() );
    } catch (SQLException e) {
      e.printStackTrace();
    }
    System.out.println( "formatted name: " + get_format_sequence_name() );
    System.out.println( "**** Sequence content test end ****" );
  }


  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
    try{

      DBconnection conn = new DBconnection();
      Long id = new Long( 18 );
      Sequence sequence = new Sequence( conn, id );
      sequence.test();

    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }
}
  








