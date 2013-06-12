/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.math.BigInteger;
import java.sql.*;
import org.tair.community.*;
import org.tair.tfc.*;

/**
 * Definition extends TfcDefinitions to include information on 
 * the person who last updated the definitions record as well as
 * all basic definition info. contained in superclass
 */

public class Definitions extends TfcDefinitions {
  
  private ListCommunity community;

  public Definitions( DBconnection conn, Long definitions_id ) throws SQLException {
    super( conn, definitions_id );
    if ( get_community_id() != null ) {
      community = new ListCommunity(get_community_id() );
    }
  }


  // ListCommunity wrappers

  /**
   * Retrieves community record's type specific id (i.e.
   * person_id or organization_id)
   *
   * @return Person or organization ID for community record
   */
  public BigInteger getCommunitySpecificID() { return ( community != null ) ? community.getSpecificID() : null;}

  /**
   * Retrieves organization name, or combination of person's first and last name
   *
   * @return Organization name, or combination of person's first & last name
   */
  public String getCommunityDisplayName() { return ( community != null ) ? community.getDisplayName() : null;}

  /**
   * Retrieves organization type, or "person"
   */
  public String getCommunityDisplayType() { return ( community != null ) ? community.getDisplayType() : null;}

  public String getCommunityCountry() { return ( community != null ) ? community.getCountry() : null;}
  public String getCommunityRegion() { return ( community != null ) ? community.getRegion() : null;}
  public String getCommunityPostalCode() { return ( community != null ) ? community.getPostalCode() : null;}
  public String getCommunityAddress() { return ( community != null ) ? community.getAddress() : null;}
  public String getCommunityCity() { return ( community != null ) ? community.getCity() : null;}
  public String getFirstName() { return ( community != null ) ? community.getFirstName() : null;}
  public String getLastName() { return ( community != null ) ? community.getLastName() : null;}
  public String getCommunityEmail() { return ( community != null ) ? community.getEmail() : null;}

  /**
   * Returns community type (person/organization) this object represents
   *
   * @return Community type for object
   */
  public String getCommunityType() { return ( community != null ) ? community.getCommunityType() : null;}

  /**
   * Returns type needed for creating links to Community servlet for displaying
   * community record (organization or person) 
   *
   * @return type to use as param when creating link to Community servlet for displaying
   * detail page for community
   */
  public String getCommunityLinkType() { return ( community != null ) ? community.getLinkType() : null;}

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
      Definitions definition = new Definitions( conn, new Long( 2 ) );
      definition.test();

    } catch ( Exception e ) {
      e.printStackTrace();
    }

  }

}
