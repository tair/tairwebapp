/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import org.tair.tfc.*;


/**
 * CommunicationObject is an extended version of TfcCommunication that
 * presents more detailed information about a communication.  CommunicationObject
 * implements the <code>Comparable</code> interface so that groups of
 * them can be stored as keys in a TreeMap in order by date.
 */

public class CommunicationObject extends TfcCommunication implements Comparable {

  public CommunicationObject() {
    super();
  }

  public CommunicationObject( DBconnection conn, Long reference_id ) throws SQLException {
    super( conn, reference_id );
  }



  /**
   * Implementation of compareTo() to satisfy Comparable interface. This
   * interface is necessary to implement to store CommunicationObjects in a
   * TreeMap. This is done is LocusDetail so that communications can be displayed
   * in order by date. This implementation returns the int results of comparing
   * this object's date with the date of the submitted CommunicationObject.
   * If submitted object is not an instance of CommunicationObject, a ClassCastException
   * will be thrown.
   *
   * @param o Object to compare this CommunicationObject to.
   * @return A value less than 0 if submitted object's date is greater than this 
   * communciation's date, or if this communication's date is null; and a value greater 
   * than 0 if the submitted object's date is less than this communication's date.
   * If dates are equal, communication names are compared and the result is
   * returned.  This means that a value of zero (or equality) will only be returned
   * if submitted communication has an identical reference id or date and name of this 
   * object
   */
  public int compareTo( Object o ) {
    CommunicationObject comm = (CommunicationObject) o;
    java.util.Date compareDate = comm.get_date();
    java.util.Date thisDate = get_date();
    
    // if same reference id, same object value
    if ( get_reference_id() != null && get_reference_id().equals( comm.get_reference_id() ) ) {
      return 0;
      
      // else compare by date
    } else if ( thisDate != null ) {
      int result = thisDate.compareTo( compareDate );
      
      // if dates match, compare by name
      if ( result == 0 ) {
	String name = get_name();
	if ( name != null ) {
	  result = name.compareTo( comm.get_name() );
	} else {
	  result = -1;
	}
      }
      return result;
    } else {
      return -1;
    }
  }
    
  /**
   * For unit testing only
   */
  public void test() {
    super.test();
  }


  /**
   * For unit testing only
   */
  public static void main( String[] args ) {

    try {

      DBconnection conn = new DBconnection();
      Long testID = new Long( 1144929 );
      CommunicationObject communication = new CommunicationObject( conn, testID );
      communication.test();

    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }






}
