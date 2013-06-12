/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

import org.tair.community.ListCommunity;
import org.tair.querytools.ListCommunityCollection;
import org.tair.tfc.DBconnection;
import org.tair.utilities.Accessible;
import org.tair.utilities.AccessionManager;
import org.tair.utilities.EmptyTextConverter;
import org.tair.utilities.TextConverter;

/**
 * CommunitySummary represents the information needed to display one community
 * record as part of the community search results returned by
 * <code>CommunityFullSearcher</code>. CommunitySummary can either represent
 * a person or organization and is the object responsible for creating community
 * downloads from the search results.
 * 
 * <p>
 * If an instance of CommunitySummary represents a Person record, object will
 * contain a collection of organizations the person is affiliated to. This
 * collection will not be populated for organization records.
 * 
 * <p>
 * CommunitySummary implements Accessible interface to facilitate creation of
 * the object's TAIR accession number through <code>AccessionManager</code>
 */

public class CommunitySummary implements Accessible {

    private Long community_id;

    // table specific ID - either Person.person_id or
    // Organization.organization_id
    private Long table_id;
    private String type;

    // either organization type, or person primary job title
    private String subType;
    
    private String last_name;
    private String first_name;

    // should only be displayed on results page for
    // curators to avoid spammage
    private String email;
    
    private String country;
    private String region;

    // person's affiliated orgs - stored as ListCommunity - this collection will
    // only be populated if object represents a person record
    private ListCommunityCollection affiliateOrgs;

    /**
     * Creates an empty instance of CommunitySummary for population externally
     */
    public CommunitySummary() {
    }

    /**
     * Creates an instance of CommunitySummary to represent the community
     * submitted community id
     * 
     * @param conn
     *            An active connection to the database
     * @param community_id
     *            Community id to retrieve community info. for
     */
    public CommunitySummary( DBconnection conn, Long community_id ) throws SQLException {
        if ( community_id != null ) {
            String query = "select c.community_id, "
                           + "c.community_type, "
                           + "c.email "
                           + "from Community c "
                           + "where c.community_id = "
                           + community_id;

            conn.setQuery( query );
            ResultSet results = conn.getResultSet();
            if ( results.next() ) {
                this.community_id = new Long( results.getLong( "community_id" ) );
                this.type = results.getString( "community_type" );
                this.email = results.getString( "email" );
            }
            conn.releaseResources();
            retrieveSpecificInfo( conn );
            populate( conn ); // get other info. beyond basic community data
        }
    }

    // retrieve type specific data for person or organization
    private void retrieveSpecificInfo( DBconnection conn ) throws SQLException {
        String query = null;
        ResultSet results = null;

        if ( get_type() != null ) {
            if ( get_type().equals( "person" ) ) {
                query = "SELECT last_name, first_name, primary_job_title AS subType "
                        + "FROM Person  "
                        + "WHERE community_id = "
                        + get_community_id().toString();
            } else {
                query = "SELECT name AS last_name, null AS 'first_name', type AS subType "
                        + "FROM Organization "
                        + "WHERE community_id = "
                        + get_community_id().toString();
            }

            conn.setQuery( query );
            results = conn.getResultSet();
            if ( results.next() ) {
                this.last_name = results.getString( "last_name" );
                this.first_name = results.getString( "first_name" );
                this.subType = results.getString( "subType" );
            }
            conn.releaseResources();
        }
    }

    /**
     * Retrieves ancillary info. on community record, such as address and
     * affiliated organizations (for persons), that is needed for display on
     * search results page
     * 
     * @param conn
     *            An active connection to the database
     * @exception SQLException
     *                thrown if a database error occurs
     */
    public void populate( DBconnection conn ) throws SQLException {
        retrieveAddressInfo( conn );
        if ( get_type() != null && get_type().equals( "person" ) ) {
            affiliateOrgs = new ListCommunityCollection( conn,
                                                         get_community_id(),
                                                         "affiliate_org" );
        }
    }

    /*
     * Retrieves community address information (country + region) from database &
     * stores in member variables. This retrieval is done through this method to
     * allow for the future incorporation of multiple addresses for each
     * community record
     */
    private void retrieveAddressInfo( DBconnection conn ) throws SQLException {
        String query = null;
        ResultSet results = null;

        if ( get_community_id() != null ) {
            query = "SELECT ct.name AS country, a.region " +
                    "FROM Address a, Country ct " +
                    "WHERE a.country_id = ct.country_id " +
                    "AND a.community_id = ?";

            conn.setQuery( query );
            conn.setQueryVariable( get_community_id() );
            
            results = conn.getResultSet();
            if ( results.next() ) {
                this.country = results.getString( "country" );
                this.region = results.getString( "region" );
            }
            conn.releaseResources();
        }
    }

    public void set_community_id( Long id ) {
        this.community_id = id;
    }

    public Long get_community_id() {
        return community_id;
    }

    public void set_table_id( Long id ) {
        this.table_id = id;
    }

    public Long get_table_id() {
        return table_id;
    }

    public void set_type( String type ) {
        this.type = type;
    }

    public String get_type() {
        return type;
    }

    public void set_sub_type( String type ) {
        this.subType = type;
    }

    public String get_sub_type() {
        return subType;
    }

    public void set_last_name( String name ) {
        this.last_name = name;
    }

    public String get_last_name() {
        return last_name;
    }

    public void set_email( String email ) {
        this.email = email;
    }

    public String get_email() {
        return email;
    }

    public void set_first_name( String name ) {
        this.first_name = name;
    }

    public String get_first_name() {
        return first_name;
    }

    public void set_country( String country ) {
        this.country = country;
    }

    public String get_country() {
        return country;
    }

    public void set_region( String region ) {
        this.region = region;
    }

    public String get_region() {
        return region;
    }

    /**
     * Returns region and country as "region, country" if both are not
     * <code>null</code>, else returns whichever single value is not
     * <code>null</code>.
     * 
     * @return Region and country separated by a comma
     */
    public String get_format_address() {
        String address = null;

        if ( get_region() != null ) {
            if ( get_country() != null ) {
                address = get_region() + ", " + get_country();
            } else {
                address = get_region();
            }
        } else {
            address = get_country();
        }

        return address;
    }

    /**
     * Retrieve custom type to pass as param to CommunityServlet for detail
     * display of this record. NOTE: Linking this way is deprecated - the
     * preferred method is to display using links to TairObject where type =
     * community_type value and id = communityID
     * 
     * @return Type to pass to CommunityServlet for correct display of this
     *         record. Will be either "person" or "organization"
     */
    public String get_link_type() {
        String linkType = ( get_type() != null && get_type().equals( "person" ) ) ? "person"
                                                                                 : "organization";
        return linkType;
    }

    /**
     * Retrieves community name
     * 
     * @return Simple value of community name - for organization's this is
     *         organization name, for persons, this is last name and first name.
     */
    public String get_name() {
        String returnName = null;
        if ( !TextConverter.isEmpty( get_first_name() ) ) {
            returnName = EmptyTextConverter.convert( get_last_name() )
                         + ", "
                         + EmptyTextConverter.convert( get_first_name() );
        } else {
            returnName = EmptyTextConverter.convert( get_last_name() );
        }
        return returnName;
    }

    /**
     * Determines whether community record has affiliated organizations. This
     * should only return true if community record represents a person record,
     * since collection of affiliate orgs is not populated for organizations.
     * 
     * @return <code>true</code> if community has affiliated organizations, or
     *         <code>
     * <code>false</code> if no organizations affiliated to community record (this will always
     * be the case if community record represents an organization)
     */
    public boolean hasAffiliateOrganizations() {
        return ( affiliateOrgs != null && !affiliateOrgs.isEmpty() );
    }

    /**
     * Retrieves affiliated organizations for community record. This collection
     * is only populated for person records; this method will always return
     * <code>null</code> for organizations.
     * 
     * @return Affiliated organizations for community record as an
     *         <code>Iterator</code> of <code>ListCommunity</code> objects,
     *         or <code>null</code> if no organizations affiliated to
     *         community record (this will always be the case if community
     *         represents an organization)
     */
    public Iterator getAffiliateOrganizations() {
        return ( hasAffiliateOrganizations() ) ? affiliateOrgs.iterator()
                                              : null;
    }

    /**
     * Retrieves TAIR accession number for this object. Implemented here to
     * satisfy the <code>Accessible</code> interface
     * 
     * @return TAIR accession number for this object
     */
    public final String getAccession() {
        return AccessionManager.getAccession( this );
    }

    /**
     * Retrieves element type of this object for use in creating TAIR accession
     * number. Implemented here to satisfy the <code>Accessible</code>
     * interface
     * 
     * @return Object's element type (person/organization) for use in creating
     *         TAIR accession
     */
    public final String getElementType() {
        return get_type();
    }

    /**
     * Retrieves object's super id (community_id) for use in creating TAIR
     * accession number. Implemented here to satisfy the <code>Accessible</code>
     * interface
     * 
     * @return ID to use for creating TAIR accession number for this object
     */
    public final Long getSuperID() {
        return get_community_id();
    }

    /**
     * Creates a tab-delimited string of this community record's data for
     * downloading. The data is returned in the following column order:
     * <ul>
     * <li>TAIR Accession</li>
     * <li>Community type:Subtype</li>
     * <li>Community name (first/last or organization name)</li>
     * <li>Region, Country</li>
     * <li>Affiliated Organizations (for person records only)</li>
     * </ul>
     * 
     * @return Tab-delimited string of community record's data
     */
    public String createExport() {
        StringBuffer export = new StringBuffer();
        export.append( getAccession() + "\t" );
        export.append( EmptyTextConverter.convert( get_type() ) );
        if ( get_sub_type() != null ) {
            export.append( ":" + get_sub_type() );
        }
        export.append( "\t" );

        export.append( get_name() + "\t" );
        export.append( EmptyTextConverter.convert( get_format_address() )
                       + "\t" );
        export.append( getAffiliateOrgNames() );
        export.append( "\n" );
        return export.toString();
    }

    // creates comma delimited string of all affiliated organization names for
    // use in tab-delimited export -- will return empty string instead of null
    // if no affiliate orgs exist for object
    private String getAffiliateOrgNames() {
        Iterator iter = null;
        ListCommunity org = null;
        boolean first = true;
        StringBuffer names = new StringBuffer();

        if ( hasAffiliateOrganizations() ) {
            iter = getAffiliateOrganizations();
            while ( iter.hasNext() ) {
                if ( !first ) {
                    names.append( ", " );
                }

                org = (ListCommunity) iter.next();
                names.append( org.getDisplayName() );
                first = false;
            }
        }
        return names.toString();
    }

    /**
     * Retrieves column order of tab-delimited exports
     * 
     * @return Column order used when creating export as a tab-delimited string
     */
    public String getExportHeader() {
        String header = "TAIR Accession\t"
                        + "Community Type:SubType\t"
                        + "Name\t"
                        + "Region, Country\t"
                        + "Affiliated Organization(s)\n";
        return header;
    }

    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** Community content test ******" );
        System.out.println( "community_id: " + get_community_id() );
        System.out.println( "type: " + get_type() );
        System.out.println( "email: " + get_email() );
        System.out.println( "sub type: " + get_sub_type() );
        System.out.println( "country: " + get_country() );
        System.out.println( "region: " + get_region() );

        /*if ( hasAffiliateOrganizations() ) {
            affiliateOrgs.test();
        }*/

        System.out.println( "**** Community content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try {

            DBconnection conn = new DBconnection();
            Long id = new Long( 11550 ); // person record
            CommunitySummary community = new CommunitySummary( conn, id );
            community.test();

            id = new Long( 8065 ); // organization record
            community = new CommunitySummary( conn, id );
            community.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }
}
