//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.27 $
// $Date: 2004/01/07 19:12:06 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * PublicationDetail is a composite class to represent all information
 * associated with an entry in the publication table. PublicationDetail 
 * contains an instance of <code>TfcPublication</code> and an instance of
 * <code>TfcPubSource in addition to all information in <code>ReferenceDetail</code>
 * superclass.
 */

public class PublicationDetail extends ReferenceDetail {

    private TfcPublication publication;
    private TfcPubSource pubSource;
    private LocusCollection loci;
    
    /**
     * Creates an empty instance of PublicationDetail
     */ 
    public PublicationDetail() { 
        super();
    }

  
    /**
     * Creates an instance of PublicationDetail that represents
     * data referenced by submitted reference id
     *
     * @param conn An active connection to the database
     * @param reference_id Reference id to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error
     */
    public PublicationDetail( DBconnection conn, Long reference_id ) throws SQLException {
        if ( reference_id != null ) {
            get_information( conn, reference_id );
        }
    }


    /**
     * Retrieves information for supplied reference id and stores in member objects
     * 
     * @param conn An active connection to the database
     * @param reference_id Reference id to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error
     */
    public void get_information( DBconnection conn, Long reference_id ) throws SQLException {
        if ( reference_id != null ) {
            publication = new TfcPublication( conn, reference_id );
            if ( publication.get_pub_source_id() != null ) {
                pubSource = new TfcPubSource( conn, publication.get_pub_source_id() );
            }

            // super quick temporary fix... don't get annotations for
            // publication w/ref id 1345963 - there are too many to display. Will
            // work on scrolling mechanism ASAP
            //
            // NM 12.3.2003
            /*if ( reference_id.longValue() != 1345963 ) {
                setAnnotations( conn, reference_id );
                }*/
        }
        if ( publication != null && publication.get_publication_id() != null ) {
            super.populateBaseObject( publication );
            super.get_information( conn, reference_id );
        }
        loci = new LocusCollection(conn, get_publication_id(), "publication");
    }
    public String get_abstract_text_with_urls() {
        String text = publication.get_abstract_text();
        String words[] = text.split(" ");
        for (int i=0; i< words.length; i++){
            if (words[i].startsWith("&url;") && words[i].endsWith("&url;") ){
                String replacement_text = words[i].replaceAll("&url;", "");
                replacement_text = "<a href=\"" + replacement_text + "\">" + replacement_text + "</a>";
                text = text.replaceAll(words[i], replacement_text); 
                System.out.println("words : " + words[i] + " and replacement text : " + replacement_text);
            }
        }
        System.out.println("text : " + text);
        return text;
    }

    // TfcPublication wrappers
    public final String get_title() { return publication.get_title(); }
    public final String get_volume() { return publication.get_volume(); }
    public final String get_page_start() { return publication.get_page_start(); }
    public final String get_abstract_text() { return publication.get_abstract_text(); }
    public final Integer get_year() { return publication.get_year(); }
    public final String get_pubmed_id() { return publication.get_pubmed_id(); }
    public final Long get_publication_id() { return publication.get_publication_id(); }
    public final String get_medline_id() { return publication.get_medline_id(); }
    public final String get_biosis_id() { return publication.get_biosis_id(); }
    public final String get_agricola_id() { return publication.get_agricola_id(); }
    public final String get_pubmed_central_id() { return publication.get_pubmed_central_id(); }
    public final String get_type() { return publication.get_type(); }
    public final String get_issue() { return publication.get_issue(); }
    public final String get_ref_text() { return publication.get_ref_text(); }
    public final Boolean get_is_print_reference() { return publication.get_is_print_reference(); }
    public final Boolean get_is_electronic_reference() { return publication.get_is_electronic_reference(); }
    public final Boolean get_is_peer_reviewed() { return publication.get_is_peer_reviewed(); }
    public final Long get_evidence_id() { return publication.get_evidence_id(); }
    public final String getDisplayType() { return publication.getDisplayType(); }


    // TfcPubSource wrappers
    public final Long get_pub_source_id() { return ( pubSource != null ) ? pubSource.get_pub_source_id() : null; }
    public final String get_pub_source_name() { return ( pubSource != null ) ? pubSource.get_name() : null; }
    public final String get_pub_source_type() { return ( pubSource != null ) ? pubSource.get_type() : null; }
    public final String get_publisher() { return ( pubSource != null ) ? pubSource.get_publisher() : null; }
    public final String get_editors() { return ( pubSource != null ) ? pubSource.get_editors() : null; }
    public final String get_isbn_number() { return ( pubSource != null ) ? pubSource.get_isbn_number() : null; }
    public final String get_issn_number() { return ( pubSource != null ) ? pubSource.get_issn_number() : null; }

    //LocusCollection
    public final boolean has_associated_loci() { return (loci != null ) ? loci.isEmpty() : false; }
    public final Iterator get_associated_loci() { return (loci != null ) ? loci.iterator() : null; }

    /**
     * Returns the authors of this publication as a string. 
     * 
     * @return All authors of publication as a string
     */
    public final String get_author_string() { return publication.get_authors(); }

    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** PublicationDetail content test ******" );
        super.test();
        if ( publication != null ) {
            publication.test();
        }
        if ( pubSource != null ) {
            pubSource.test();
        }
        System.out.println( "**** PublicationDetail content test end ****" );
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

        try{
            DBconnection conn = new DBconnection();
            Long id = new Long( 501683761 );
            PublicationDetail pub = new PublicationDetail( conn, id );
            pub.test();
            //id = new Long( 1644 );
            // pub = new PublicationDetail( conn, id );
            //pub.test();
        } catch( Exception e ) {
            e.printStackTrace();
        }
    }

}
  








