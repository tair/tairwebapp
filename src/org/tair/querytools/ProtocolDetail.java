/**
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 * 
 * ProtocolDetail extends <code>TfcProtocol</code> to present
 * detailed information on a protocol, including data on
 * the protocol's associated publication and communication
 */

package org.tair.querytools;

import java.sql.*;

import org.tair.tfc.*;


public class ProtocolDetail extends ReferenceDetail {

  private TfcProtocol protocol;
  private PublicationObject publication;
  private TfcCommunication communication;

  /**
   * Creates an empty instance of ProtocolDetail
   */
  public ProtocolDetail() {
    super();
  }


  /**
   * Creates an instance of ProtocolDetail that reflects the data referenced
   * by the submitted reference_id
   *
   * @param conn An active connection to the database
   * @param reference_id ProtocolDetail reference id to retrieve data for
   * @exception SQLException thrown if a database error occurs
   */
  public ProtocolDetail( DBconnection conn, Long reference_id ) throws SQLException {
    if ( reference_id != null ) {
      get_information( conn, reference_id );
    }
  }

  
  /**
   * Retrieves all data for the submitted reference id.
   *
   * @param conn An active connection to the database
   * @param reference_id Reference id to retrieve data for
   * @exception SQLException in the case of an invalid operation or database error
   */
  public void get_information( DBconnection conn, Long reference_id ) throws SQLException {
    this.protocol = new TfcProtocol( conn, reference_id );
    super.populateBaseObject( protocol );

    Long refID = null;
    if ( protocol.get_publication_id() != null ) {
      refID = TfcPublication.get_super_id( conn, protocol.get_publication_id() );
      publication = new PublicationObject( conn, refID );
    }

    if ( protocol.get_communication_id() != null ) {
      refID = TfcCommunication.get_super_id( conn, protocol.get_communication_id() );
      communication = new TfcCommunication( conn, refID );
    }

    super.get_information( conn, reference_id );
  }


  // TfcProtocol wrappers
  public Long get_protocol_id() { return protocol.get_protocol_id(); }
  public String get_protocol_title() { return protocol.get_title(); }
  public Integer get_protocol_pubmed_id() { return protocol.get_pubmed_id(); }
  public String get_protocol_description() { return protocol.get_description(); }
  public String get_protocol_authors() { return protocol.get_authors(); }
  public String get_protocol_usage() { return protocol.get_usage(); }
  public String get_protocol_methods() { return protocol.get_methods(); }
  public String get_protocol_status() { return protocol.get_status(); }
  public java.util.Date get_date_last_modified() { return protocol.get_date_last_modified(); }


  /**
   * Determines if protocol has associated publication data
   *
   * @return <code>true</code> if protocol has associated publication data,
   * or <code>false</code> if no publication data for protocol
   */
  public boolean hasPublication() {
    return ( publication != null && publication.get_reference_id() != null );
  }

  /**
   * Determines if protocol has associated communication data
   *
   * @return <code>true</code> if protocol has associated communication data,
   * or <code>false</code> if no communication data for protocol
   */
  public boolean hasCommunication() {
    return ( communication != null && communication.get_reference_id() != null );
  }


  // TfcCommunication wrappers
  public Long get_communication_reference_id() { return ( communication != null ) ? communication.get_reference_id() : null; }
  public Long get_communication_id() { return ( communication != null ) ? communication.get_communication_id() : null; }
  public String get_communication_name() { return ( communication != null ) ? communication.get_name() : null; }
  public String get_communication_author_name() { return ( communication != null ) ? communication.get_author_name() : null; }
  public String get_communication() { return ( communication != null ) ? communication.get_communication() : null; }
  public java.util.Date get_communication_date() { return ( communication != null ) ? communication.get_date() : null; }

  // PublicationObject wrappers
  public Long get_publication_id() { return ( publication != null ) ? publication.get_publication_id() : null; }
  public Long get_publication_reference_id() { return ( publication != null ) ? publication.get_reference_id() : null; }
  public Long get_pub_source_id() { return ( publication != null ) ? publication.get_pub_source_id() : null; }
  public String get_pub_source_name() { return ( publication != null ) ? publication.get_pub_source_name() : null; }
  public String get_publication_medline_id() { return ( publication != null ) ? publication.get_medline_id() : null; }
  public String get_publication_biosis_id() { return ( publication != null ) ? publication.get_biosis_id() : null; }
  public String get_publication_agricola_id() { return ( publication != null ) ? publication.get_agricola_id() : null; }
  public String get_publication_pubmed_id() { return ( publication != null ) ? publication.get_pubmed_id() : null; }
  public String get_publication_pubmed_central_id() { return ( publication != null ) ? publication.get_pubmed_central_id() : null; }
  public Integer get_publication_year() { return ( publication != null ) ? publication.get_year() : null; }
  public String get_publication_authors() { return ( publication != null ) ? publication.get_authors() : null; }
  public String get_publication_type() { return ( publication != null ) ? publication.get_type() : null; }
  public String get_publication_display_type() { return ( publication != null ) ? publication.getDisplayType() : null; }
  public String get_publication_title() { return ( publication != null ) ? publication.get_title() : null; }
  public String get_publication_issue() { return ( publication != null ) ? publication.get_issue() : null; }
  public String get_publication_volume() { return ( publication != null ) ? publication.get_volume() : null; }
  public String get_publication_ref_text() { return ( publication != null ) ? publication.get_ref_text() : null; }
  public String get_publication_page_start() { return ( publication != null ) ? publication.get_page_start() : null; }
  public String get_publication_abstract_text() { return ( publication != null ) ? publication.get_abstract_text() : null; }
  public Boolean get_publication_is_print_reference() { return ( publication != null ) ? publication.get_is_print_reference() : null; }
  public Boolean get_publication_is_electronic_reference() { return ( publication != null ) ? publication.get_is_electronic_reference() : null; }
  public Boolean get_publication_is_peer_reviewed() { return ( publication != null ) ? publication.get_is_peer_reviewed() : null; }
  public Long get_publication_evidence_id() { return ( publication != null ) ? publication.get_evidence_id() : null; }

 



  /**
   * For unit testing only
   */
  public void test() {
    System.out.println( "****** ProtocolDetail content test ******" );   
    super.test();

    if ( protocol != null ) {
      protocol.test();
    }

    if ( hasPublication() ) {
      publication.test();
    }

    if ( hasCommunication() ) {
      communication.test();
    }

    System.out.println( "****** ProtocolDetail content end ******" );   
  }

  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
    try {

      DBconnection conn = new DBconnection();
      Long referenceID = new Long( 501703091 );
      ProtocolDetail protocol = new ProtocolDetail( conn, referenceID );
      protocol.test();

    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }

}
