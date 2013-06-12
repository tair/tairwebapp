//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.18 $
// $Date: 2004/04/06 18:30:27 $
//------------------------------------------------------------------------------ 

package org.tair.querytools;

import org.tair.tfc.*;
import org.tair.utilities.*;
import java.sql.*;
import java.util.*;
import java.io.*;


/**
 * GeneticMarkerDetail is a composite class to represent all information
 * associated with an entry in the GeneticMarker table for display on the 
 * genetic marker detail page. GeneMarkerDetail contains instances of 
 * <code>TfcGeneticMarker</code>, an instance of <code>TfcMapElement</code>
 * to reference the map element this marker is made from, and a collection 
 * of all polymorphisms, associated with genetic marker in addition to all
 * information in <code>MapElementDetail</code> and <code>TairObjectDetail</code>
 * superclasses.
 */


public class GeneticMarkerDetail extends MapElementDetail {

    private TfcGeneticMarker geneticMarker;

    // map element data representing the "made from map element" 
    // for genetic marker
    private String madeFromName;
    private String madeFromMapElementType;
    private String madeFromAccession;


    // polymorphisms associated to marker - stored as PolymorphismObjects
    private PolymorphismObjectCollection polymorphisms;

    // genes associated to marker - stored as GeneModels
    private GeneModelCollection genes;

    // loci associated directly to marker (in addition to any in gene 
    // collection) stored as Locus
    private LocusCollection loci;


    /**
     * Creates an empty instance of GeneticMarkerDetail
     */
    public GeneticMarkerDetail() {
	super();
    }

    /**
     * Creates an instance of GeneticMarkerDetail that represents
     * all data referenced by submitted genetic marker id.
     *
     * @param conn An active connection to the database
     * @param genetic_marker_id Genetic marker id to retrieve data for
     * @throws RecordNotFoundException if no entry found for id
     * @throws SQLException if a database error occurs
     */
    public GeneticMarkerDetail( DBconnection conn, Long genetic_marker_id )
	throws RecordNotFoundException, SQLException {

	get_information( conn, genetic_marker_id );
    }

    /**
     * Creates an instance of GeneticMarkerDetail that represents
     * all data referenced by submitted genetic marker name.
     *
     * @param conn An active connection to the database
     * @param name Genetic marker name to retrieve data for
     * @throws RecordNotFoundException if no entry found for name
     * @throws SQLException if a database error occurs
     */
    public GeneticMarkerDetail( DBconnection conn, String name )
	throws RecordNotFoundException, SQLException {

	get_information( conn, name );
    }
 


    /** 
     * Populates object with data referenced by submitted genetic marker name
     *
     * @param conn An active connection to the database
     * @param genetic_marker_id Genetic marker id to retrieve data for
     * @throws RecordNotFoundException if no entry found for name
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {

	Long id = TfcGeneticMarker.retrieveGeneticMarkerID( conn, name );

	if ( id == null ) {
	    throw new RecordNotFoundException( "No genetic marker found " +
					       "with name: " + name );
	}

	get_information( conn, id );
    }
  

    /**
     * Populates object with data referenced by submitted genetic marker id
     *
     * @param conn An active connection to the database
     * @param genetic_marker_id Genetic marker id to retrieve data for
     * @throws RecordNotFoundException if no entry found for id
     * @throws SQLException if a database error occurs
     */
    public  void get_information( DBconnection conn, Long genetic_marker_id ) 
	throws RecordNotFoundException, SQLException {               

	geneticMarker = new TfcGeneticMarker( conn, genetic_marker_id );
	super.populateBaseObject( geneticMarker );

	polymorphisms = new PolymorphismObjectCollection( conn, 
							  genetic_marker_id,
							  "marker" );

	polymorphisms.populateRestrictionEnzymes( conn );
	polymorphisms.populateSpeciesVariants( conn );
	polymorphisms.populateHasAttributions( conn );

	// populate basic data for map element this marker is made from
	if ( geneticMarker.get_made_from_id() != null ) {
	    populateMadeFromInformation( conn,
					 geneticMarker.get_made_from_id() );
	}	

	genes = new GeneModelCollection( conn, get_map_element_id() );
	
	genes.populateLocus( conn ); // get loci associated to each gene

	// get any loci directly associated to marker
	loci = new LocusCollection( conn, get_map_element_id() ); 
	
	// populate superclass data
	getMapElementInformation( conn );
	getTairObjectInformation( conn );
    }

    /**
     * Retrieves basic data for map element this marker is made from, 
     * including name and TAIR accession for displaying a hyperlink to
     * map element's type specific detail page on genetic marker detail
     * page
     *
     * @param conn An active connection to the database
     * @param map_element_id Map element id to retrieve data for
     * @throws RecordNotFoundException if no data found for map_element_id
     * @throws SQLException if a database error occurs
     */
    private void populateMadeFromInformation( DBconnection conn,
					      Long map_element_id )
	throws RecordNotFoundException, SQLException {

	// determine what MapElement child table map_element_id is
	// from using ObjectTyper
	String tableName = 
	    ObjectTyper.getMapElementTable( conn,
					    map_element_id,
					    false );

	// throw exception if couldn't find an entry for id
	if ( tableName == null ) {
	    throw new RecordNotFoundException( "No row found for " +
					       "made from map element id: " +
					       map_element_id );
	}
					       

	// get original name of map element from child table
	this.madeFromName = ObjectTyper.getMapElementName( conn,
							   tableName,
							   map_element_id,
							   false );


	// use table name to determine map element type 
	this.madeFromMapElementType = 
	    TfcMapElementType.typeForTable( tableName );

	// get tair object id of element for use in creating 
	// TAIR accession number
	Long tairObjectID = TfcMapElement.get_super_id( conn, map_element_id );

	// get TAIR accession number from AccessionManager using 
	// element type and tair object id to determine correct 
	// accession prefix
	this.madeFromAccession = 
	    AccessionManager.getAccession( madeFromMapElementType, 
					   tairObjectID );

    }


    //
    // TfcGeneticMarker wrappers
    //
    public Long get_genetic_marker_id() {
	return geneticMarker.get_genetic_marker_id();
    }

    public Long get_taxon_id() { 
	return geneticMarker.get_taxon_id();
    }

    public Long get_species_variant_id() {
	return geneticMarker.get_species_variant_id();
    }

    public String get_genetic_marker_name() {
	return geneticMarker.get_name();
    }

    public String get_chromosome() {
	return geneticMarker.get_chromosome();
    }

    public Float get_length() { 
	return geneticMarker.get_length();
    }

    public String get_units() {
	return geneticMarker.get_units(); 
    }

    public Boolean get_has_flank_sequence() {
	return geneticMarker.get_has_flank_sequence();
    }

    public Boolean get_is_sequenced() { 
	return geneticMarker.get_is_sequenced(); 
    }

    public Boolean get_is_pcr_marker() {
	return geneticMarker.get_is_pcr_marker(); 
    }

    public String get_special_conditions() { 
	return geneticMarker.get_special_conditions(); 
    } 

    public java.util.Date get_date_last_modified() { 
	return geneticMarker.get_date_last_modified();
    }

    public String get_genetic_marker_type() {
	return geneticMarker.get_type(); 
    }

    public java.util.Date get_date_entered() { 
        return geneticMarker.get_date_entered();
    }
    
    public String get_original_name() { 
        return geneticMarker.get_original_name();
    }


    /**
     * Retrieves a formatted value for marker type instead of 
     * database literal value
     *
     * @return formatted marker type value
     */
    public String getDisplayMarkerType() {
        String type = get_genetic_marker_type();
        return ( type != null && type.equals( "hyb_based" ) ) ? 
	    "hybridization based" : type;
    }


    /**
     * Gets the map element id of the map element this marker made from
     *
     * @return Long map element id of map element this marker made from
     */
    public Long get_made_from_id() {
	return geneticMarker.get_made_from_id();
    }
      

    /**
     * Gets the name of the map element this marker made from
     *
     * @return String Name of map element this marker made from
     */
    public String get_made_from_name() {
        return madeFromName;
    }

    /**
     * Gets the map element type of the map element this marker made from
     *
     * @return String map element type of map element this marker made from
     */
    public String get_made_from_type() {
        return madeFromMapElementType;
    }
    
    /**
     * Retrieves the TAIR accession number for the map element this marker
     * is made from. This value can be used to make hyperlinks to any of
     * the possible detail pages that made from map element might ultimately be
     *
     * @return TAIR accession number for map element this marker is made from
     */
    public String get_made_from_accession() {
	return madeFromAccession;
    }
    


    /**
     * Determines if marker has associated polymorphisms
     *
     * @return <code>true</code> if genetic marker has polymorphisms 
     * associated with it, or <code>false</code> if no polymorphisms for marker
     */
    public boolean has_polymorphisms() { 
	return ( polymorphisms != null && !polymorphisms.isEmpty() ); 
    }


    /**
     * Gets the polymorphisms as an <code>Iterator</code>
     * of <code>PolymorphismObject</code>s.
     *
     * @return an <code>Iterator</code> of <code>PolymorphismObject</code>s 
     * value specifying the polymorphisms associated with this genetic marker, 
     * or <code>null</code> if no polymorphisms for this marker
     */ 
    public Iterator get_polymorphisms() {
        return ( has_polymorphisms() ) ? polymorphisms.iterator() : null;
    }

    /**
     * Returns an <code>Iterator</code> of <code>PolymorphismObject</code>s 
     * where polymorphism type equals the requested type.
     *
     * @param type Type of Polymorphism to return
     * @return <code>Iterator</code> of <code>PolymorphismObject</code>s with 
     * the requested type, or <code>null</code> if no objects in collection have 
     * the requested type. If submitted type is <code>null</code>, all 
     * polymorphisms in the collection will be returned
     */
    public Iterator get_polymorphisms( String type ) {
        return has_polymorphisms() ? 
	    polymorphisms.get_polymorphisms( type ) : null;
    }


    /**
     * Returns an <code>Iterator</code> of <code>PolymorphismObject</code>s 
     * where polymorphism type equals of the requested types
     * 
     * @param types Types of Polymorphism to return
     * @return <code>Iterator</code> of <code>PolymorphismObject</code>s with 
     * the requested types, or <code>null</code> if no objects in collection 
     * have the requested types. If submitted types list is <code>null</code>,
     * all polymorphisms in the collection will be returned
     */
    public Iterator get_polymorphisms( String[] types ) {
        return( polymorphisms != null ) ? 
	    polymorphisms.get_polymorphisms( types ) : null;
    }


    /**
     * Determines if marker has associated genes
     *
     * @return <code>true</code> if marker has associated genes, or 
     * <code>false</code> if no genes associated to marker
     */
    public boolean hasGenes() {
        return ( genes != null && !genes.isEmpty() );
    }


    /**
     * Retrieves genes associated to genetic marker
     *
     * @return Gene models associated to genetic marker as an 
     * <code>Iterator</code> of <code>GeneModel</code> objects, or 
     * <code>null</code> if no genes associated to marker
     */
    public Iterator getGenes() {
        return ( hasGenes() ) ? genes.iterator() : null;
    }

    /**
     * Determines whether genetic marker has associated loci
     *
     * @return <code>true</code> if genetic marker has associated loci
     * or <code>false</code> if genetic marker has no associated loci
     */
    public boolean hasLocus() {
        return ( loci != null && !loci.isEmpty() );
    }

    /**
     * Retrieves loci associated to genetic marker
     *
     * @return Loci associated with this genetic marker as an 
     * <code>Iterator</code> of <code>Locus</code> objects, or 
     * <code>null</code> if no loci directly associated to genetic marker
     */
    public Iterator getLocus() {
        return ( hasLocus() ) ? loci.iterator() : null;
    }


  

    /**
     * For unit testing only
     */
    public void test() {
        super.test();
        System.out.println( "****** GeneticMarkerDetail content test ******" );

        if ( geneticMarker != null ) {
            geneticMarker.test();
        }

	// made from map element info.
	if ( get_made_from_id() != null ) {
	    System.out.println( "Made from type: " + get_made_from_type() );
	    System.out.println( "Made from name: " + get_made_from_name() );
	    System.out.println( "Made from accession: " + 
				get_made_from_accession() );
	}



        if ( has_polymorphisms() ) {
            polymorphisms.test();
        }
    
        if ( hasGenes() ) {
            genes.test();
        }

        if ( hasLocus() ) {
            loci.test();
        }
                       
    	System.out.println( "**** GeneticMarkerDetail content test end ****" );
    }
            
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{
      
            DBconnection conn = new DBconnection();
            Long id = new Long( 189 );
            GeneticMarkerDetail marker = null;
            marker = new GeneticMarkerDetail( conn, id );
            marker.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}



