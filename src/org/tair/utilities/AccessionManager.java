//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.8 $
// $Date: 2004/07/06 16:34:16 $
//------------------------------------------------------------------------------ 

package org.tair.utilities;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.Map;

import org.tair.tfc.DBconnection;


/**
 * AccessionManager serves as a central class to handle functions related to
 * TAIR accession numbers for different object types in the TAIR database. 
 * These functions are collected here to allow maximum flexibility in case the
 * definition of accession numbers changes. Currently, TAIR accession numbers 
 * are created using a formatted version of the object type, for example 
 * "GeneticMarker", followed by a colon (":") and the object's super id  
 * (tair object id, reference id or community id). Detail pages for these 
 * objects can be retrieved through the TairObject servlet using the 
 * following syntax:
 *
 * <p>
 * http://www.arabidopsis.org/servlets/TairObject?accession=GeneticMarker:123345
 *
 * <p>
 * AccessionManager handles the creation of TAIR accession numbers by either 
 * taking a reference to an object that implements the <code>Accessible</code>
 * interface, which guarantees accessor methods for the object properties used 
 * to create the accession number, or through a method where both the object 
 * type and super id are manually passed in (this is to allow compatibility for
 * situations where accession numbers are needed but it would be awkward to 
 * package the information into a single Accessible object).
 * 
 * <p>
 * AccessionManager also handles the translation of accession types into simple 
 * object types, used by <code>DetailFactory</code> to generically create Detail 
 * objects for display on detail pages.  AccessionManager also translates 
 * numeric accession ids into table specific ids (i.e. tair_object_id into 
 * gene_id) if needed.  This is necessary since some Detail objects take the 
 * specific id instead of the super id for their constructor.
 *
 * <p>
 * AccessionManager contains a collection of simple object types that reference
 * the formatted TAIR accession type.  This collection is populated by 
 * ObjectInfoCollection, which reads the data from the detail config file.  This
 * is done to simplify deployment of AccessionManager across multiple 
 * environments (test, production, stanford etc.) so that a separate version 
 * of AccessionManager (with a different list of accession keys and types)does 
 * not need to be compiled for each environment. The location of the detail 
 * config file is stored in the WebApp object as the DETAIL_CONF_FILE 
 * property, which should be $HOME/conf/detail.conf
 *
 * @see ObjectInfoCollection
 */


public class AccessionManager {

    private static Map accessionTypes;

    // get list of accession types & prefixes from ObjectInfoCollection, 
    // which reads the data from the detail config file, which should be at 
    // $HOME/conf/detail.conf
    static {
	try {
      
	    if ( accessionTypes == null || accessionTypes.isEmpty() ) {
		ObjectInfoCollection info = new ObjectInfoCollection();
		info.loadDetailFile();
		accessionTypes = info.getAccessionPrefixes();
	    }
      
	    // print any errors to STDERR - not much else to do in 
	    // static initializer
	} catch ( Exception e ) {
	    System.err.println( "Error populating accession types: " + 
				e.getMessage() );
	}
    }


    /**
     * Adds the submitted simple object type and corresponding formatted 
     * accession type to the internal collection of accession types
     *
     * @param type Simple object type ("marker")
     * @param accessionType Formatted object type used to make TAIR accession
     * numbers ("GeneticMarker")
     */
    public static void setAccession( String type, String accessionType ) {
	accessionTypes.put( type, accessionType );
    }


    /**
     * Creates the TAIR accession number for element.
     *
     * @param element Object to create accession number for
     * @return TAIR accession number for element, or <code>null</code>
     * if element is <code>null</code> or is an unknown object type
     */
    public static String getAccession( Accessible element ) {
	String elementType = null;
	String accessionNumber = null;
	String accessionType = null;

	if ( element != null ) {
	    elementType = element.getElementType();
	    if ( accessionTypes.containsKey( elementType ) ) {
		accessionType = (String) accessionTypes.get( elementType );
		accessionNumber = accessionType + ":" + element.getSuperID();
	    }
	}
	return accessionNumber;
    }

    /**
     * Creates the TAIR accession number for an external object that is of
     * submitted elementType with submitted superID.  This method is here to
     * allow compatibility with situations where accession numbers are desired, 
     * but it's impractical to package the object into an Accessible object
     *
     * @param elementType Simple object type (i.e. marker) of object to create 
     * accession number for
     * @param superID ID to use when creating accession number for object.  
     * Should be object's top-most id (i.e. tair_object_id, community_id or
     * reference_id)
     * @return TAIR accession number for element, or <code>null</code>
     * if element is <code>null</code> or is an unknown object type
     */
    public static String getAccession( String elementType, Long superID ) {
	String accessionType = null;
	String accessionNumber = null;

	if ( elementType != null ) {
	    if ( accessionTypes.containsKey( elementType ) ) {
		accessionType = (String) accessionTypes.get( elementType );
		accessionNumber = accessionType + ":" + superID;
	    }
	}
	return accessionNumber;
    }


    /**
     * Translates submitted TAIR accession type into simple object type
     * that is used by <code>DetailFactory</code> to create Detail objects
     * for display. This value is often identical to accessionType,
     * with the exception that all simple types are entirely lowercase.
     *
     * @param accessionType Formatted TAIR accession type (i.e. GeneticMarker)
     * to be translated into simple object type ("marker")
     * @return Simple object type corresponding to submitted accesssionType, or
     * <code>null</code> if accessionType is not found in internal collection
     * of object types
     */
    public static String translateType( String accessionType ) {
	String translatedType = null;
	Iterator iter = null;
	String key = null;

	if ( accessionType != null ) {
	    // if already stored as a key, no further translation 
	    // is necessary
	    if ( accessionTypes.containsKey( accessionType ) ) { 
		translatedType = accessionType;

		// otherwise, search for value matching submitted 
		// type & return key
	    } else { 
		iter = accessionTypes.keySet().iterator();
		while ( iter.hasNext() ) {
		    key = (String) iter.next();
		    if ( accessionType.equalsIgnoreCase( 
			    (String) accessionTypes.get( key ) ) ) {

			translatedType = key;
			break;
		    }
		}
	    }
	}
	return translatedType;
    }                                                                


    /**
     * Retrieves the specific object id needed for creating a Detail or Tfc 
     * object, given the object id supplied when using TairAccession syntax. 
     * This translation is necessary, since Tair accession numbers are created
     * using the "super" id (tair_object_id, reference_id, community_id), 
     * whereas all Tfc & Detail objects inheriting from MapElement are created
     * using the specific id (clone_id, gene_id etc.).  If submitted type 
     * requires translation, a table specific database lookup is performed 
     * to retrieve the necessary id; if translation is not required for type,
     * submitted value will simply be returned
     *
     * @param conn An active connection to the database
     * @param type Object type to translate
     * @param id ID to translate, if necessary
     */
    public static Long translateID( DBconnection conn, String type, Long id ) 
	throws SQLException {
      
      if (type == null) {
        throw new RuntimeException("Null object type while trying to get id");
      }

	Long translatedID = null;
	if ( type.equalsIgnoreCase( "clone" ) ) {
	    translatedID = getSpecificID( conn, 
					  "Clone", 
					  "clone_id", 
					  "tair_object_id", 
					  id );
	    
	} else if ( type.equalsIgnoreCase( "assignment" ) ) {
	    translatedID = getSpecificID( conn, 
					  "Assignment", 
					  "assignment_id", 
					  "tair_object_id", 
					  id );
        
	} else if ( type.equalsIgnoreCase( "gene" ) ){
	    translatedID = getSpecificID( conn, 
					  "Gene", 
					  "gene_id", 
					  "tair_object_id",
					  id );

	} else if ( type.equalsIgnoreCase( "assemblyunit" ) || 
		    type.equalsIgnoreCase( "assembly_unit" ) ){

	    translatedID = getSpecificID( conn, 
					  "AssemblyUnit", 
					  "assembly_unit_id", 
					  "tair_object_id", 
					  id );

	} else if ( type.equalsIgnoreCase( "marker" ) ||
		    type.equalsIgnoreCase( "genetic_marker" ) ){

	    translatedID = getSpecificID( conn, 
					  "GeneticMarker", 
					  "genetic_marker_id", 
					  "tair_object_id", 
					  id );
        
	} else if ( type.equalsIgnoreCase( "locus" ) ){
	    translatedID = getSpecificID( conn, 
					  "Locus", 
					  "locus_id", 
					  "tair_object_id", 
					  id );

	} else if ( type.equalsIgnoreCase( "contig" ) ){
	    translatedID = getSpecificID( conn, 
					  "Contig", 
					  "contig_id", 
					  "tair_object_id", 
					  id );

	} else if ( type.equalsIgnoreCase( "cloneend" ) || 
		    type.equals( "clone_end" ) ) {

	    translatedID = getSpecificID( conn, 
					  "CloneEnd", 
					  "clone_end_id", 
					  "tair_object_id", 
					  id );
        
	} else if ( type.equalsIgnoreCase( "map" ) ) {
	    translatedID = getSpecificID( conn, 
					  "Map", 
					  "map_id", 
					  "tair_object_id", 
					  id );

	} else if ( type.equalsIgnoreCase( "polyallele" ) || 
		    type.equals( "polymorphism" ) ) {

	    translatedID = getSpecificID( conn, 
					  "Polymorphism", 
					  "polymorphism_id", 
					  "tair_object_id",
					  id );

	} else if ( type.equalsIgnoreCase( "library" ) ) {
	    translatedID = getSpecificID( conn, 
					  "Library",
					  "library_id", 
					  "tair_object_id", 
					  id );

	} else if ( type.equalsIgnoreCase( "vector" ) ) {
	    translatedID = getSpecificID( conn, 
					  "Vector", 
					  "vector_id", 
					  "tair_object_id", 
					  id );

	} else if ( type.equalsIgnoreCase( "restrictionenzyme" ) ) {
	    translatedID = getSpecificID( conn, 
					  "RestrictionEnzyme", 
					  "restriction_enzyme_id", 
					  "tair_object_id", 
					  id );

	} else if ( type.equalsIgnoreCase( "stock" ) ) {
	    translatedID = getSpecificID( conn, 
					  "Stock", 
					  "stock_id",
					  "tair_object_id", 
					  id );

	} else if ( type.equalsIgnoreCase( "sequence" ) ) {
	    translatedID = getSpecificID( conn, 
					  "NucleotideSequence", 
					  "nucleotide_seq_id",
					  "tair_object_id", 
					  id );

	} else if ( type.equalsIgnoreCase( "species_variant" ) ) {
	    translatedID = getSpecificID( conn, 
					  "SpeciesVariant", 
					  "species_variant_id", 
					  "tair_object_id", 
					  id );

	} else if ( type.equalsIgnoreCase( "host_strain" ) ) {
	    translatedID = getSpecificID( conn,
					  "HostStrain",
					  "host_strain_id",
					  "tair_object_id",
					  id );

	} else { // else return submitted id
	    /* 
	       No translation needed if type is:

	       publication, 
	       analysisreference
	       person
	       organization
	       communication
	       aa_sequence

	       or unknown type
           
	    */

	    translatedID = id;
	}
        
	return translatedID;
    }

    /**
     * Utility method to get specific ids given super id - this operation is
     * the same for every type, all that changes is the string params 
     * submitted
     *
     * @param conn An active connection to the database
     * @param table Database table to select from
     * @param specificColumn ID column to translate super id into
     * @param superID SuperID column name to retrieve
     * @throws SQLException if a database error occurs
     */
    private static Long getSpecificID( DBconnection conn, 
				       String table, 
				       String specificColumn, 
				       String superColumn, 
				       Long superID )
	throws SQLException {

	Long id = null;

	String query = 
	    "SELECT " + specificColumn + " AS specific_id " +
	    "FROM " + table + " " +
	    "WHERE " + superColumn + " = " + superID;

	conn.setQuery( query );
	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    id = new Long( results.getLong( "specific_id" ) );
	}
	conn.releaseResources();

	return id;
    }
}
