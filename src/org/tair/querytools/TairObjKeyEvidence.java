/*-----------------------------------------------------------------------
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved 
*-----------------------------------------------------------------------
 */
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.utilities.*;
import org.tair.tfc.*;
import org.tair.community.*;


/**
 * TairObjectKeyEvidence is a composite class that extends 
 * <code>TfcTairObjKeyEvidence</code> to present detailed 
 * information about a tair object key evidence. 
 */

public class TairObjKeyEvidence extends TfcTairObjKeyEvidence {

    private String reference_type;
    private String reference_label;
    private String tair_object_name;
    private String tair_object_type;
    private Long map_element_id;
     // Community record  organization who made the annotation
    private ListCommunity community;

    // Loci associated to gene - stored as Locus
    private LocusCollection loci;

    private TfcEvidenceDescription evidenceDescription;
    private TfcKeyword keyword;
    private TfcRelationshipType relationshipType;

    /**
     * Creates an empty instance of TairObjectKeyEvidence
     */         
    public TairObjKeyEvidence() { 
        super();
        community = new ListCommunity();
    }
    
    /**
     * Creates an instance of TairObjectKeyEvidence to reflect data
     * referenced by submitted tairobj_evidence_id.
     *
     * @param db An active connection to the database
     * @param tair_object_evidence_id TairObjectKeyEvidence id to retrieve data for
     * @throws SQLException in the case of an invalid operation or database error
     */      
    public TairObjKeyEvidence( DBconnection db, Long tairobj_key_evidence_id ) throws SQLException {
        super( db, tairobj_key_evidence_id );
        if ( tairobj_key_evidence_id != null ) {
            setReferenceInfo( db, get_reference_id() );
            setTairObjectInfo( db );
            
            if ( getMapElementId() != null ) {
                loci = new LocusCollection( db, getMapElementId() );
            }
            
            this.evidenceDescription = new TfcEvidenceDescription( db, super.get_evidence_description_id() );
            this.keyword = new TfcKeyword( db, super.get_keyword_id() );
            this.relationshipType = new TfcRelationshipType( db, super.get_relationship_type_id() );
            if (  get_annotated_by_id() != null ){
		this.community = new ListCommunity( get_annotated_by_id() );
            }
        } 
    }
    
    
    // sets reference info needed to create the reference link
    private void setReferenceInfo( DBconnection conn, Long reference_id ) throws SQLException { 
        TfcReference reference = null;
        if ( reference_id != null ) {
            reference = new TfcReference( conn, reference_id );
            reference_type = reference.get_reference_type();
            setReferenceLabel( conn, reference.get_reference_type(), reference_id );
        }
    }
    
    // sets reference label needed for the reference link based on the reference type   
    private void setReferenceLabel( DBconnection conn, String reference_type, Long reference_id ) 
        throws SQLException { 
        
        if ( reference_type != null ) {
            StringBuffer ref_buffer = new StringBuffer();
            
            if ( reference_type.equalsIgnoreCase( "publication" ) ) {
                TfcPublication tfc_ref = new TfcPublication( conn, reference_id );
                ref_buffer.append( tfc_ref.getReferenceLabel() );
                
            } else if ( reference_type.equalsIgnoreCase( "communication" ) ) {
                TfcCommunication tfc_ref = new TfcCommunication( conn, reference_id );
                ref_buffer.append( tfc_ref.get_author_name() );
		if ( tfc_ref.get_date() != null ) {
		    ref_buffer.append( " (" + tfc_ref.get_date().toString() + ") " );
		}
                
            } else if ( reference_type.equalsIgnoreCase( "analysis_reference" ) ) { 
                TfcAnalysisReference tfc_ref = new TfcAnalysisReference( conn, reference_id );
                ref_buffer.append( reference_type + " : " + tfc_ref.get_name() );
		if ( tfc_ref.get_date_run() != null ) {
		    ref_buffer.append( " (" + tfc_ref.get_date_run().toString() + ") " );
		}
                
            } else if ( reference_type.equalsIgnoreCase( "database_reference" ) ) { 
                TfcDatabaseReference tfc_ref = new TfcDatabaseReference( conn, reference_id );
                ref_buffer.append( reference_type + " : " + tfc_ref.get_name() );
		if ( tfc_ref.get_date_last_updated() != null ) {
		    ref_buffer.append( " (" + tfc_ref.get_date_last_updated().toString() + ") " );
		}
                
            } else {
                ref_buffer.append( reference_type );  
            }
            reference_label = ref_buffer.toString();
        }
    }
    
    // return first author from the String returned by tfc_ref.get_authors().  
    // Look for comma, if none found return first 100 char 
    public String getFirstAuthor( String author_text ) { 
        String first_author = null;
        if ( author_text != null ) {
            if ( author_text.indexOf( "," ) > 0 ) {
                first_author = author_text.substring( 0, author_text.indexOf( "," ) );  
            } else {
                first_author = author_text.substring( 0, 100 );  
            }
        }
        return first_author;
    }
    
    /**
     * @return <code>type</code> of Reference this is
     */ 
    public String getReferenceType() { return reference_type; }
    
    /**
     * @return <code>label</code> for displaying the url
     */ 
    public String getReferenceLabel() { return reference_label; }
    
    /**
     * @return <code>reference_id</code> for this TairObjectKeyEvidence 
     */ 
    public Long getReferenceID() { return super.get_reference_id(); }
    
    // sets tair object info
    private void setTairObjectInfo( DBconnection conn ) throws SQLException {
        if ( get_tair_object_id() != null ) {  
            String query = 
                "SELECT name, map_element_id " +
                "FROM Gene " +
                "WHERE tair_object_id = " + get_tair_object_id().toString();
            
            conn.setQuery( query );
            
            ResultSet results = conn.getResultSet();
            if ( results.next() ) {
                tair_object_name = results.getString( "name" );         
                map_element_id = new Long( results.getLong( "map_element_id" ) );
		tair_object_type = "gene";
            }
	    conn.releaseResources();
        }

        if ( tair_object_name == null && get_tair_object_id() != null ) {  
            String query = 
                "SELECT name, map_element_id " +
                "FROM Locus " +
                "WHERE tair_object_id = " + get_tair_object_id().toString();
            
            conn.setQuery( query );
            
            ResultSet results = conn.getResultSet();
            if ( results.next() ) {
                tair_object_name = results.getString( "name" );         
                map_element_id = new Long( results.getLong( "map_element_id" ) );
		tair_object_type = "locus";
            }
	    conn.releaseResources();
        }
    }
    
    /**
     * @return <code>tair_object_name</code> for this TairObjectKeyEvidence 
     */ 
    public String get_tair_object_name() { return tair_object_name; }

    /**
     * @return <code>tair_object_type</code> for this TairObjectKeyEvidence 
     */ 
    public String get_tair_object_type() { return tair_object_type; }
    
    /**
     * @return <code>map_element_id</code> for this TairObjectKeyEvidence 
     */ 
    private Long getMapElementId() { return map_element_id; }
    
    /**
     * Determines whether gene has any associated loci
     *
     * @return <code>true</code> if gene has associated loci, or <code>false</code>
     * if no loci associated to gene
     */
    public boolean hasLocus() {
        return ( loci != null && !loci.isEmpty() );
    }
    
    
    /**
     * Retrieves loci associated to gene
     * 
     * @return Loci associated to gene as an <code>Iterator</code> of <code>TfcLocus</code>
     * objects, or <code>null</code> if no loci associated to gene
     */
    public Iterator get_locus() {
        return( hasLocus() ) ? loci.iterator() : null;
    }

    /**
     * Get annotated_by name of the annotation entry
     * @return  organization name
     */
    public String get_annotated_by_name() { 
        return community.getDisplayName() != null ? community.getDisplayName():"" ; 

    }
    /**
     * Get annotated_by link, which is the commmunity_detail url
     * @return  community_detail url as String
     */
    public String get_annotated_by_link(){
        return  "/servlets/TairObject?type="+community.getCommunityType()+"&id="+community.getCommunityID();
    }
    //
    // TfcEvidenceDescription wrappers
    //
    public void set_evidence_description_id( Long id ) { 
        super.set_evidence_description_id( id );
        evidenceDescription.set_evidence_description_id( id );
    }
    
    public Long get_evidence_description_id() { return evidenceDescription.get_evidence_description_id(); }
    
    public void set_evidence_code( String code ) { evidenceDescription.set_evidence_code( code ); }
    public String get_evidence_code() { return evidenceDescription.get_evidence_code(); }
    
    public void set_evidence_code_full( String code ) { evidenceDescription.set_evidence_code_full( code ); }
    public String get_evidence_code_full() { return evidenceDescription.get_evidence_code_full(); }
    
    public void set_evidence_description( String description ) { 
        evidenceDescription.set_description( description ); 
    }

    public String get_evidence_description() { 
        return evidenceDescription.get_description(); 
    }
    
    public void set_evidence_description_pub_id( Long id ) { evidenceDescription.set_pub_id( id ); }
    public Long get_evidence_description_pub_id() { return evidenceDescription.get_pub_id(); }
    
    //
    // TfcRelationshipType wrappers
    //
    public void set_relationship_type_id ( Long id ) { 
        super.set_relationship_type_id( id );
        relationshipType.set_relationship_type_id( id ); 
    }

    public Long get_relationship_type_id() { return relationshipType.get_relationship_type_id(); }
    
    public void set_relationship_type( String type ) { relationshipType.set_type( type ); }
    public String get_relationship_type() { return relationshipType.get_type(); }
    
    public void set_relationship_type_description( String description ) { 
        relationshipType.set_description( description ); 
    }

    public String set_relationship_type_description() { 
        return relationshipType.get_description(); 
    }
    
    public void set_table_name( String name ) { relationshipType.set_table_name( name ); }
    public String get_table_name() { return relationshipType.get_table_name(); }
    
    public void set_relationship_type_pub_id( Long id ) { relationshipType.set_pub_id( id ); }
    public Long get_relationship_type_pub_id() { return relationshipType.get_pub_id(); }

    //
    // TfcKeyword wrappers
    //
    public void set_keyword_id ( Long id ) { 
        super.set_keyword_id( id );
        keyword.set_keyword_id( id ); 
    }

    public Long get_keyword_id() { return keyword.get_keyword_id(); }

    public void set_keyword_type_id( String id ) { keyword.set_keyword_type_id( id ); }
    public String get_keyword_type_id() { return keyword.get_keyword_type_id(); }
    
    public void set_keyword( String word ) { keyword.set_keyword( word ); }
    public String get_keyword() { return keyword.get_keyword(); }
    
    public void set_definition( String definition ) { keyword.set_definition( definition ); }
    public String get_definition() { return keyword.get_definition(); }

    public void set_note( String note ) { keyword.set_note( note ); }
    public String get_note() { return keyword.get_note(); }

    public void set_def_source( String source ) { keyword.set_def_source( source ); }
    public String get_def_source() { return keyword.get_def_source(); }
    
    public void set_extdb_id( String id ) { keyword.set_extdb_id( id ); }
    public String get_extdb_id() { return keyword.get_extdb_id(); }
    
    public void set_has_direct_links( String links ) { keyword.set_has_direct_links( links ); }
    public String get_has_direct_links() { return keyword.get_has_direct_links(); }
    
    public void set_has_child_links( String links ) { keyword.set_has_child_links( links ); }
    public String get_has_child_links() { return keyword.get_has_child_links(); }
    
    public void set_keyword_pub_id( Long id ) { keyword.set_pub_id( id ); }
    public Long get_keyword_pub_id() { return keyword.get_pub_id(); }
    
    public void set_keyword_type( String type ) { keyword.set_keyword_type( type ); }
    public String get_keyword_type() { return keyword.get_keyword_type(); }
    
    public void set_keyword_type_display( String display ) { keyword.set_keyword_type_display( display ); }
    public String get_keyword_type_display() { return keyword.get_keyword_type_display(); }
    
    public void set_type_definition( String definition ) { keyword.set_type_definition( definition ); }
    public String get_type_definition() { return keyword.get_type_definition(); } 


    /**
     * test TairObjectKeyEvidence content
     */
    public void test() {

        System.out.println( "****** TairObjectKeyEvidence content test ******" );
        super.test();
        System.out.println( " reference type = " + getReferenceType() ); 
        System.out.println( " reference id = " + getReferenceID() ); 
        System.out.println( " reference label = " + getReferenceLabel() ); 
        System.out.println( " tair object name = " + get_tair_object_name() );

        keyword.test();
        relationshipType.test();
        evidenceDescription.test();

        if ( hasLocus() ) {
            Iterator locusIter = get_locus();
            Locus locus = null; 
            if ( locusIter != null ) {
                while ( locusIter.hasNext() ) {
                    locus = (Locus) locusIter.next();
                    System.out.println( " locus name = " + locus.get_name() );
                }
            }  
        }
        System.out.println( "**** TairObjectKeyEvidence content test end ****" );
    }

    /**
     * this method is used for testing.
     */
    public static void main( String[] args ) {
        try {
            DBconnection connection = new DBconnection();
            Long test_id = new Long( 59123 );
            TairObjKeyEvidence object = new TairObjKeyEvidence( connection,test_id );
            object.test();

        } catch( Exception e ) {
            e.printStackTrace();
        }
    }

}
  








