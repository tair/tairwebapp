/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * CommunicationDetail is a composite class to represent all information
 * associated with an entry in the Communication table for display
 * on the communication detail page. CommunicationDetail contains
 * an instance of <code>TfcCommunication</code> in addition to all 
 * information in  super class <code>ReferenceDetail</code>
 *
 * <p>
 * CommunicationDetail overrides the getElementType() method implemented
 * in ReferenceDetail to satisfy Accessible interface so that a type specific
 * element type can be returned.
 */

public class CommunicationDetail extends ReferenceDetail {
  private TfcCommunication communication;

  /**
   * Creates an empty instance of CommunicationDetail
   */
  public CommunicationDetail() {  }

  /**
   * Creates an instance of CommunicationDetail to represent the data for the 
   * communication with the submitted reference id
   *
   * @param conn An active connection to the database
   * @param reference_id Reference id to retrieve data for
   * @exception SQLException thrown if a database error occurs
   */
  public CommunicationDetail( DBconnection conn, Long reference_id ) throws SQLException {
    if ( reference_id != null ) {
      get_information( conn, reference_id );
    }
  }


  /**
   * Creates an instance of CommunicationDetail to represent the data for the 
   * communication with the submitted name
   *
   * @param conn An active connection to the database
   * @param name Name to retrieve data for
   * @exception SQLException thrown if a database error occurs
   */
  public CommunicationDetail( DBconnection conn, String name ) throws SQLException {
    if ( name != null ) {
      get_information( conn, name );
    }
  }

  /**
   * Populates object with all data for communication with submitted name
   * @param conn An active connection to the database
   * @param name Name to retrieve data for
   * @exception SQLException thrown if a database error occurs
   */
  public void get_information( DBconnection conn, String name ) throws SQLException {
    if ( name != null ) {
      get_information( conn, TfcCommunication.get_super_id( conn, name ) );
    }
  }

  /*
   * Populates object with all data for communication with the submitted reference id
   *
   * @param conn An active connection to the database
   * @param reference_id Reference id to retrieve data for
   * @exception SQLException thrown if a database error occurs
   */
  public void get_information( DBconnection conn, Long reference_id ) throws SQLException {
    if ( reference_id != null ) {
      communication = new TfcCommunication( conn, reference_id );
      super.populateBaseObject( communication );
      super.get_information( conn, reference_id );
    }
  }


  // TfcCommunication wrappers
  public void set_communication_id ( Long value) { communication.set_communication_id( value ); }
  public Long get_communication_id() { return communication.get_communication_id(); }

  public void set_name ( String value) { communication.set_name( value ); }
  public String get_name() { return communication.get_name(); }

  public void set_author_name ( String value) { communication.set_author_name( value ); }
  public String get_author_name() { return communication.get_author_name(); }

  public void set_communication ( String value) { communication.set_communication( value ); }
  public String get_communication() { return communication.get_communication(); }

  public void set_date ( java.util.Date value) { communication.set_date( value ); }
  public java.util.Date get_date() { return communication.get_date(); }

  /**
   * For unit testing only
   */
  public void test() {
    super.test();

    System.out.println( "******** CommunicationDetail content **********" );
    System.out.println( "communication_id: " + get_communication_id() );
    System.out.println( "name: " + get_name() );
    System.out.println( "author_name: " + get_author_name() );
    System.out.println( "communication: " + get_communication() );
    System.out.println( "date: " + get_date() );
    System.out.println( "******** End CommunicationDetail content **********" );
  }


  /** 
   * For unit testing only
   */
  public static void main( String[] args ) {
    try {
      DBconnection conn = new DBconnection();
      Long test_id = new Long( 1545903 );
      CommunicationDetail communication = new CommunicationDetail( conn, test_id );
      communication.test();
    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }
			     



      
}

