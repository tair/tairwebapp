//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.24 $
// $Date: 2006/09/26 20:11:46 $
//------------------------------------------------------------------------------

package org.tair.tfc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.io.Serializable;

import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;


/**
 * This class maps to the Publication table in the tair database. Each instance
 * maps one row of data in Publication table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 */

public class TfcPublication extends TfcReference implements Serializable {

    private Long publication_id;
    private Long evidence_id;
    private Long pub_source_id;
    private String medline_id;
    private String biosis_id;
    private String agricola_id;
    private String pubmed_id;
    private String pubmed_central_id;
    private Integer year;
    private String authors;
    private String type;
    private String title;
    private String issue;
    private String volume;
    private String ref_text;
    private String page_start;
    private String abstract_text;
    private Boolean is_print_reference;
    private Boolean is_electronic_reference;
    private Boolean is_peer_reviewed;

    // takes the first author in authors and concatenates it
    // with et al. and the year
    private String reference_label;


    /**
     * Creates an empty instance of TfcPublication
     */
    public TfcPublication() {
     super();
    }

    /**
     * Creates an instance of TfcPublication to reflect the data referenced by
     * the submitted reference_id
     *
     * @param conn An active connection to the database
     * @param reference_id Reference id to retrieve data for
     * @throws RecordNotFoundException if no row found with reference id
     * @throws SQLException if a database error occurs
     */
    public TfcPublication( DBconnection connection, Long reference_id )
     throws RecordNotFoundException, SQLException {

     super( connection, reference_id );

     String query =
         "SELECT publication_id, "+
         "pub_source_id, "+
         "reference_id, "+
         "medline_id, "+
         "biosis_id, "+
         "agricola_id, "+
         "pubmed_id, "+
         "pubmed_central_id, "+
         "publication_year, "+
         "authors, "+
         "publication_type, "+
         "title, "+
         "issue, "+
         "volume, "+
         "page_start, "+
         "abstract, "+
         "ref_text, "+
         "is_peer_reviewed, "+
         "is_print_reference, "+
         "is_electronic_reference "+
         "FROM Publication "+
         "WHERE reference_id = ?";

     connection.setQuery( query );
     connection.setQueryVariable( reference_id );

     ResultSet results = connection.getResultSet();
     if ( results.next() ) {
         long id = results.getLong( "publication_id" );
         if ( !results.wasNull() ) {
          this.publication_id = new Long( id );
         }

         id = results.getLong( "pub_source_id" );
         if ( !results.wasNull() ) {
          this.pub_source_id = new Long( id );
         }

         this.medline_id = results.getString( "medline_id" );
         this.biosis_id = results.getString( "biosis_id" );
         this.agricola_id = results.getString( "agricola_id" );
         this.pubmed_id = results.getString( "pubmed_id" );
         this.pubmed_central_id = results.getString( "pubmed_central_id" );

         int i = results.getInt( "publication_year" );
         if ( !results.wasNull() ) {
          this.year = new Integer( i );
         }

         this.authors = results.getString( "authors" );
         this.type = results.getString( "publication_type" );
         this.title = results.getString( "title" );
         this.issue = results.getString( "issue" );
         this.volume = results.getString( "volume" );
         this.page_start = results.getString( "page_start" );
         this.abstract_text = results.getString( "abstract" );
         this.ref_text = results.getString( "ref_text" );

         this.is_peer_reviewed =
          TextConverter.stringToBoolean(
              results.getString( "is_peer_reviewed" ) );


         this.is_print_reference =
          TextConverter.stringToBoolean(
              results.getString( "is_print_reference" ) );

         this.is_electronic_reference =
          TextConverter.stringToBoolean(
              results.getString( "is_electronic_reference" ) );

         setReferenceLabel();
     }

     connection.releaseResources();

     if ( get_publication_id() == null ) {
         throw new RecordNotFoundException( "No publication found " +
                                "for reference id: " +
                                reference_id );
     }
    }

    /**
     * Retrieves the reference id for a given publication id
     *
     * @param connection An active connection to the database
     * @param publication_id the current object id
     * @throws SQLException throws if a database error occurs
     * @return a <code>Long</code> value specifying the reference id of
     * submitted publication id
     */
    public static Long get_super_id( DBconnection connection,
                         Long publication_id )
     throws SQLException {

     Long retval = null;
     String query = null;

     if ( publication_id != null ) {
         query =
          "select reference_id "+
          "from Publication "+
          "where publication_id = " + publication_id.toString();

         connection.setQuery( query );
         ResultSet results = connection.getResultSet();
         if ( results.next() ) {
          retval = new Long( results.getLong( "reference_id" ) );
         }
     }
     connection.releaseResources();
     return retval;
    }


    public void set_publication_id ( Long value ) { publication_id = value; }
    public Long get_publication_id() { return publication_id; }

    public void set_pub_source_id ( Long value ) { pub_source_id = value; }
    public Long get_pub_source_id() { return pub_source_id; }

    public void set_medline_id ( String value ) { medline_id = value; }
    public String get_medline_id() { return medline_id; }

    public void set_biosis_id ( String value ) { biosis_id = value; }
    public String get_biosis_id() { return biosis_id; }

    public void set_agricola_id ( String value ) { agricola_id = value; }
    public String get_agricola_id() { return agricola_id; }

    public void set_pubmed_id ( String value ) { pubmed_id = value; }
    public String get_pubmed_id() { return pubmed_id; }

    public void set_pubmed_central_id ( String value ) { pubmed_central_id = value; }
    public String get_pubmed_central_id() { return pubmed_central_id; }

    public void set_year ( Integer value ) { year = value; }
    public Integer get_year() { return year; }

    public void set_authors ( String value ) { authors = value; }
    public String get_authors() { return authors; }

    public void set_type ( String value ) { type = value; }
    public String get_type() { return type; }

    public void set_title ( String value ) { title = value; }
    public String get_title() { return title; }

    public void set_issue ( String value ) { issue = value; }
    public String get_issue() { return issue; }

    public void set_volume ( String value ) { volume = value; }
    public String get_volume() { return volume; }

    public void set_ref_text ( String value ) { ref_text = value; }
    public String get_ref_text() { return ref_text; }

    public void set_page_start ( String value ) { page_start = value; }
    public String get_page_start() { return page_start; }

    public void set_abstract_text ( String value ) { abstract_text = value; }
    public String get_abstract_text() { return abstract_text; }

    public void set_is_print_reference ( Boolean value ) { is_print_reference = value; }
    public Boolean get_is_print_reference() { return is_print_reference; }

    public void set_is_electronic_reference ( Boolean value ) { is_electronic_reference = value; }
    public Boolean get_is_electronic_reference() { return is_electronic_reference; }

    public void set_is_peer_reviewed ( Boolean value ) { is_peer_reviewed = value; }
    public Boolean get_is_peer_reviewed() { return is_peer_reviewed; }

    public void set_evidence_id ( Long value ) { evidence_id = value; }
    public Long get_evidence_id() { return evidence_id; }

    private void setReferenceLabel() {
        // NOTE: if you change the formatting here,
        // you must update org.tair.utilities.ReferenceSorter.
     String first_author = null;
     if ( get_authors() != null ) {
         if ( get_authors().indexOf( "," ) > 0 ) {
          first_author = get_authors().substring( 0, get_authors().indexOf( "," ) );
         } else {
          //was indefOutOfBound for gene : 26904
          first_author = TextConverter.safeSubstring( get_authors(), 0, 100 );
         }
         reference_label = first_author + ", et al." + " (" + get_year().toString() + ") ";
     }
    }

    public String getReferenceLabel() { return reference_label; }

    /**
     * Creates a display version of publication type by capitalizing the first letter
     * of the type. This value is used on JSPs when displaying pub source info.
     *
     * @return Display version of publication type, or "Unknown" if type is <code>null</code>
     */
    public String getDisplayType() {
     String displayType = null;

     if ( !TextConverter.isEmpty( get_type() ) ) {
         char firstLetter = Character.toUpperCase( type.charAt( 0 ) );

         displayType =
          (new Character( firstLetter) ).toString() +
          get_type().substring( 1, type.length() );
     } else {
         displayType = "Unknown";
     }
     return displayType;
    }

    /**
     * Utility method to retrieve reference id for submitted pub med id
     *
     * @param conn An active connection to the database
     * @param pubMedID Pub med id to retrieve reference id for
     * @return Reference id(s) for pub med id, or <code>null</code>
     * if pub med id not found.  Pub med id should usually only
     * refer to a single reference id, however since the field
     * is not bound by a UNIQUE constraint, code should allow for
     * the possibility of multiple entries.
     */
    public static Long[] pubMedToReferenceID( DBconnection conn,
                               String pubMedID )
        throws SQLException {

        String query =
            "SELECT reference_id " +
            "FROM Publication " +
            "WHERE pubmed_id = " +
         TextConverter.dbQuote( pubMedID );

        conn.setQuery( query );

        ArrayList ids = null;
        ResultSet results = conn.getResultSet();
        while ( results.next() ) {
            if ( ids == null ) {
                ids = new ArrayList();
            }
            ids.add( new Long( results.getLong( "reference_id" ) ) );
        }
        conn.releaseResources();

        Long[] referenceIDs = null;
        if ( ids != null ) {
            referenceIDs = new Long[ ids.size() ];
            referenceIDs = (Long[]) ids.toArray( referenceIDs );
        }

        return referenceIDs;
    }


    /**
     * For unit testing only
     */
    public void test() {
     super.test();
     System.out.println( "****** TfcPublication content test ******" );
     System.out.println( "reference_id: " + get_reference_id() );
     System.out.println( "type " + get_reference_type() );
     System.out.println( "publication_id: " + get_publication_id() );
     System.out.println( "evidence_id: " + get_evidence_id() );
     System.out.println( "pub_source_id: " + get_pub_source_id() );
     System.out.println( "medline_id: " + get_medline_id() );
     System.out.println( "biosis_id: " + get_biosis_id() );
     System.out.println( "agricola_id: " + get_agricola_id() );
     System.out.println( "pubmed_id: " + get_pubmed_id() );
     System.out.println( "pubmed_central_id: " + get_pubmed_central_id() );
     System.out.println( "year: " + get_year() );
     System.out.println( "authors: " + get_authors() );
     System.out.println( "type: " + get_type() );
     System.out.println( "title: " + get_title() );
     System.out.println( "issue: " + get_issue() );
     System.out.println( "volume: " + get_volume() );
     System.out.println( "ref_text: " + get_ref_text() );
     System.out.println( "page_start: " + get_page_start() );
     System.out.println( "abstract_text: " + get_abstract_text() );
     System.out.println( "is_print_reference " + get_is_print_reference() );
     System.out.println( "is_electronic_reference " + get_is_electronic_reference() );
     System.out.println( "is_peer_reviewed " + get_is_peer_reviewed() );
     System.out.println( "reference label " + getReferenceLabel() );
     System.out.println( "**** TfcPublication content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

     try{
         DBconnection conn = new DBconnection();
         Long id = new Long( 1323 );
         TfcPublication publication = new TfcPublication( conn, id );
         publication.test();

     } catch ( Exception e ) {
         e.printStackTrace();
     }

    }

}
