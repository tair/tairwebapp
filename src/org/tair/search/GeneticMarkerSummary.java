//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.22 $
// $Date: 2004/07/29 21:57:17 $
//------------------------------------------------------------------------------ 

package org.tair.search;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

import org.tair.querytools.AliasVector;
import org.tair.querytools.FlankingSequenceVector;
import org.tair.querytools.GlobalAssignmentCollection;
import org.tair.querytools.LocusCollection;
import org.tair.querytools.PolymorphismObject;
import org.tair.querytools.PolymorphismObjectCollection;
import org.tair.querytools.PolymorphismRestrictionEnzyme;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcFlankingSequence;
import org.tair.tfc.TfcGlobalAssignment;
import org.tair.tfc.TfcLocus;
import org.tair.tfc.TfcMapElement;
import org.tair.tfc.TfcSpeciesVariant;
import org.tair.utilities.Accessible;
import org.tair.utilities.AccessionManager;
import org.tair.utilities.EmptyTextConverter;
import org.tair.utilities.TextConverter;


/**
 * GeneticMarkerSummary represents the information needed to display one 
 * genetic marker record as part of the genetic marker search results returned
 * by <code>GeneticMarkerSearcher</code>. GeneticMarkerSummary contains all fields
 * from the temp table used to hold genetic marker search results as well as 
 * collections of additional information (such as aliases & assignments).
 *
 * <p>
 * GeneticMarkerSummary also holds collections of flanking sequences and polymorphisms
 * for the marker. These collections are only populated when downloading the marker 
 * information
 *
 * <p>
 * GeneticMarkerSummary implements Accessible interface to facilitate creation of
 * the object' TAIR accession number through <code>AccessionManager</code>
 */

public class GeneticMarkerSummary implements Accessible {   
    private Long tair_object_id;
    private Long map_element_id;
    private Long genetic_marker_id;
    private String name;
    private String geneticmarker_type;
    private String units;
    private String chromosome;

    // will only be populated when downloading marker info.
    private String special_conditions;

    // assignments for marker - stored as TfcGlobalAssignment
    private GlobalAssignmentCollection assignments;

    // aliases for marker - stored as TfcAlias
    private AliasVector aliases;

    // flanking sequences for marker - stored as TfcFlankingSequence.
    // only populated when downloading
    private FlankingSequenceVector flankingSequences;

    // polymorphisms for marker - stored as PolymorphismObject - 
    // only populated when downloading
    PolymorphismObjectCollection polymorphisms;

    // loci associated to marker - stored as Locus - 
    // only populated when downloading
    private LocusCollection loci;

    // flag to determine if link to map viewer can be made for this marker
    private boolean showMapViewerLink = false;

    // chromosome values from AGI map assignments -- needed for creating
    // valid links to seq viewer
    private String[] agiChromosomes;


    /**
     * Creates an empty instance of GeneticMarkerSummary
     */
    public GeneticMarkerSummary() {  }


    /**
     * Creates an instance of GeneticMarkerSummary to represent the marker with submitted name
     *
     * @param conn An active connection to the database
     * @param name Genetic marker name to retrieve information for
     * @throws SQLException in the case of an invalid operation or database error
     */    
    public  GeneticMarkerSummary( DBconnection conn, String name ) throws SQLException {   
        if ( name != null ) {
            String query =
                "SELECT g.map_element_id, "+
                "g.tair_object_id, "+
                "g.name, "+
                "g.geneticmarker_type, "+                    
                "g.units,"+
                "g.chromosome, "+
                "g.special_conditions, " +
                "g.genetic_marker_id "+
                "FROM GeneticMarker g "+
                "WHERE g.name LIKE " + TextConverter.dbQuote( name.toUpperCase() ) + 
                " ESCAPE '\\\'";
            conn.setQuery( query );
            ResultSet results = conn.getResultSet();         
            if ( results.next() ) {
                this.map_element_id = new Long( results.getLong( "map_element_id" ) );
                this.tair_object_id = new Long( results.getLong( "tair_object_id" ) );
                this.name = results.getString( "name" );
                this.geneticmarker_type = results.getString( "geneticmarker_type" );
                this.units = results.getString( "units" );                     
                this.chromosome = results.getString( "chromosome" );
                this.genetic_marker_id = new Long( results.getLong( "genetic_marker_id" ) );
                this.special_conditions = results.getString( "special_conditions" );
            }
            conn.releaseResources();
            retrieve_information( conn, true );
        }
    }
  
    public void set_tair_object_id ( Long value ) { tair_object_id = value; }
    public void set_map_element_id ( Long value ) { map_element_id = value; }
    public void set_genetic_marker_id ( Long value ) { genetic_marker_id = value; }
    public void set_name ( String value ){ name = value; }
    public void set_chromosome ( String value ){ chromosome = value; }
    public void set_geneticmarker_type ( String value ){ geneticmarker_type = value; }
    public void set_units ( String value ) { units = value; }
    public void set_special_conditions( String conditions ) { this.special_conditions = conditions; }

    public Long get_tair_object_id() { return tair_object_id; }
    public Long get_map_element_id() { return map_element_id; }
    public Long get_genetic_marker_id() { return genetic_marker_id; }
    public String get_name() { return name; }
    public String get_geneticmarker_type() { return geneticmarker_type; }
    public String get_chromosome() { return chromosome; }
    public String get_units() { return units; }
    public String get_special_conditions() { return special_conditions; }


    /**
     * Determines whether a link to map viewer can be made for this marker. This 
     * is done according to logic in TfcMapElement.showMapViewerLink()
     * which examines map element's assignment data to make determination.
     *
     * @return <code>true</code> if a link to map viewer can be made, or 
     * <code>false</code> if no link to map viewer can be made
     */
    public boolean showMapViewerLink() {
        return showMapViewerLink;
    }

    /**
     * Determines if genetic marker is mapped onto the AGI map by checking
     * whether object contains any chromosome values from AGI assignments
     *
     * @return <code>true</code> if marker has an assignment on AGI map,
     * or <code>false</code> if no assignment exists for marker on AGI map
     */
    public boolean isAGIMap() {
        return ( agiChromosomes != null && agiChromosomes.length > 0 );
    }


    /**
     * Retrieves list of chromosomes from marker's assignments onto
     * AGI map. This list is needed for creating hyperlinks to display element
     * in seq viewer, which can only display elements w/AGI map assignments, and
     * which can only display sequences on a single chromosome at a time. This list
     * should be used to create multiple links to seq viewer if marker has multiple
     * chromosomes (see utility method HTMLFactory.createSeqViewerLinks() for more
     * info on how this list is used to create hyperlinks
     *
     * @return List of chromosomes from clone's assignments onto AGI map as
     * a String array, or <code>null</code> if no assignments onto AGI map found
     * for clone
     */
    public String[] getAGIChromosomes() {
        return agiChromosomes;
    }


    /**
     * Retrieve aliases for marker.
     *
     * @return Aliases for this genetic marker as an <code>Iterator</code>
     * of <code>TfcAlias</code> objects, or <code>null</code> if no aliases
     * exist.
     */
    public Iterator get_aliases() {
        return ( hasAliases() ) ? aliases.iterator() : null;
    }
  
    /**
     * Determines if marker has aliases
     * 
     * @return <code>true</code> if marker has aliases or <code>false</code>
     * if no aliases exist for marker
     */
    public boolean hasAliases() {
        return ( aliases != null && !aliases.isEmpty() );
    }

    /**
     * Retrieve genetic marker's aliases as delimited string
     *
     * @return Aliases for genetic marker as a delimited string, or <code>null</code>
     * if no aliases exist for marker
     */
    public String get_alias_string() {
        return ( hasAliases() ) ? aliases.get_alias_string() : null;
    }

  
    /**
     * Retrieve assignments for marker
     *
     * @return GlobalAssignments for this genetic marker as an <code>Iterator</code>
     * of <code>TfcGlobalAssignment</code> objects, or <code>null</code> if no assignments
     * exist.
     */
    public Iterator get_assignments() {
        return ( hasAssignments() ) ? assignments.iterator() : null;
    }

    /**
     * Retrieves unique assignments for genetic marker. Assignments are considered 
     * duplicate if they have the same top_map_id, map_start_position, and map_end 
     * position as another assignment for marker.
     *
     * @return Unique assignments for genetic marker as an <code>Iterator</code> of 
     * <code>TfcGlobalAssignment</code> objects, or <code>null</code> if no assignments for 
     * marker.
     */
    public Iterator getUniqueAssignments() {
        return ( hasAssignments() ) ? assignments.uniqueIterator() : null;
    }
  

    /**
     * Determines if marker has assignments
     *
     * @return <code>true</code> if marker has assignments or <code>false</code> if no
     * assignments for marker
     */
    public boolean hasAssignments() {
        return ( assignments != null && !assignments.isEmpty() );
    }


    /** 
     * Retrieves information associated with genetic marker including assignments and aliases
     *
     * @param conn An active connection to the database
     * @param getFullInfo If <code>true</code> special conditions, flanking sequences, 
     * and polymorphisms for marker will be retrieved (this is usually only done when 
     * downloading marker, since this info. doesn't display on search results page); 
     * if <code>false</code> this data is not retrieved
     */
    public void retrieve_information( DBconnection conn, boolean getFullInfo ) throws SQLException {
        if ( tair_object_id != null ) {
            aliases = new AliasVector( conn,tair_object_id );
        }
    
        if ( map_element_id != null ) {
            assignments = new GlobalAssignmentCollection( conn, map_element_id );
        }

        this.agiChromosomes = TfcMapElement.getAGIChromosomes( conn, map_element_id );
        this.showMapViewerLink = TfcMapElement.showMapViewerLink( conn, map_element_id, "genetic_marker" );

        if ( getFullInfo ) {
            flankingSequences = new FlankingSequenceVector( conn, get_map_element_id() );
            polymorphisms = new PolymorphismObjectCollection( conn, get_genetic_marker_id(), "marker" );
            polymorphisms.populateRestrictionEnzymes( conn );
            polymorphisms.populateSpeciesVariants( conn );

            loci = new LocusCollection( conn, get_map_element_id() );
        }
    }
  
    /** 
     * Retrieves information associated w/genetic marker -- restricts assignments to those
     * on submitted map and chromosome
     *
     * @param conn An active connection to the database
     * @param map_type Map type to restrict marker assignments to
     * @param chromosome Chromosome to restrict marker assignments to
     * @param getFullInfo If <code>true</code> special conditions, flanking sequences, 
     * and polymorphisms for marker will be retrieved (this is usually only done when 
     * downloading marker, since this info. doesn't display on search results page); 
     * if <code>false</code> this data is not retrieved
     */
    public void retrieve_information( DBconnection conn,
                                      String map_type, 
                                      String chromosome, 
                                      boolean getFullInfo ) 
        throws SQLException {

        if ( tair_object_id != null ) {
            aliases = new AliasVector( conn, tair_object_id );
        }

        if ( map_element_id != null ) {
            assignments = new GlobalAssignmentCollection( conn, map_element_id, map_type, chromosome );
        }

        this.agiChromosomes = TfcMapElement.getAGIChromosomes( conn, map_element_id );
        this.showMapViewerLink = TfcMapElement.showMapViewerLink( conn, map_element_id, "genetic_marker" );

        if ( getFullInfo ) {
            flankingSequences = new FlankingSequenceVector( conn, get_map_element_id() );
            polymorphisms = new PolymorphismObjectCollection( conn, get_genetic_marker_id(), "marker" );
            polymorphisms.populateRestrictionEnzymes( conn );
            polymorphisms.populateSpeciesVariants( conn );

            loci = new LocusCollection( conn, get_map_element_id() );
            populateSpecialConditions( conn );
        }
    }

    // get special conditions from genetic marker - done separately from constructor since 
    // this is only needed when downloading
    private void populateSpecialConditions( DBconnection conn ) throws SQLException {
        String query =  
            "SELECT special_conditions " +
            "FROM GeneticMarker " +
            "WHERE genetic_marker_id = " + get_genetic_marker_id();

        conn.setQuery( query );
        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            this.special_conditions = results.getString( "special_conditions" );
        }
        conn.releaseResources();
    }

  
    private void appendSequenceVariation( StringBuffer export ) {
        Iterator iter = null;
        PolymorphismObject poly = null;

        if ( polymorphisms != null && !polymorphisms.isEmpty() ) {
            String[] seqVarTypes = new String[] { "SNP", "substitution", "INDEL" };
            iter = polymorphisms.get_polymorphisms( seqVarTypes );

            if ( iter != null ) {
                boolean first = true;
                while ( iter.hasNext() ) {
                    if ( !first ) {
                        export.append( "; " );
                    } else {
                        first = false;
                    }
                    poly = (PolymorphismObject) iter.next();

                    Iterator subIter = poly.get_species_variants();
                    if ( subIter != null ) {
                        boolean subFirst = true;
                        while ( subIter.hasNext() ) {
                            if ( !subFirst ) {
                                export.append( ", " );
                            } else {
                                subFirst = false;
                            }
                            TfcSpeciesVariant variant = (TfcSpeciesVariant) subIter.next();
                            export.append( EmptyTextConverter.convert( variant.get_abbrev_name() ) );
                        }
                    }
                    export.append( "  " + 
                                   EmptyTextConverter.convert( poly.get_lengths() ) + " " +  
                                   EmptyTextConverter.convert( poly.get_units() ) + " " +  
                                   EmptyTextConverter.convert( poly.get_polymorphic_sequence() ) );
                }
            }
        }
        export.append( "\t" );
    }

    private void appendDigestPattern( StringBuffer export ) {
        Iterator iter = null;
        PolymorphismObject poly = null;

        if ( polymorphisms != null && !polymorphisms.isEmpty() ) {
            iter = polymorphisms.get_polymorphisms( "digest_pattern" );
            if ( iter != null ) {
                boolean first = true;
                while ( iter.hasNext() ) {
                    if ( !first ) {
                        export.append( "; " );
                    } else {
                        first = false;
                    }
                    poly = (PolymorphismObject) iter.next();  
          
                    Iterator subIter = poly.get_species_variants();
                    if ( subIter != null ) {
                        boolean subFirst = true;
                        while ( subIter.hasNext() ) {
                            if ( !subFirst ) {
                                export.append( ", " );
                            } else {
                                subFirst = false;
                            }
                                
                            TfcSpeciesVariant variant = (TfcSpeciesVariant) subIter.next();
                            export.append( EmptyTextConverter.convert( variant.get_abbrev_name() ) );
                        }
                    }

                    export.append( " " );

                    subIter = poly.get_restriction_enzymes();
                    if ( subIter != null ) {
                        boolean subFirst = true;
                        while ( subIter.hasNext() ) {
                            if ( !subFirst ) {
                                export.append( ", " );
                            } else {
                                subFirst = false;
                            }
              
                            PolymorphismRestrictionEnzyme enzyme = (PolymorphismRestrictionEnzyme) subIter.next();
                            export.append( EmptyTextConverter.convert( enzyme.get_name() )  );
                        }
                    }
                    export.append( " " + EmptyTextConverter.convert( poly.get_lengths() ) + " " +  
                                   EmptyTextConverter.convert( poly.get_units() ) );
                }
            }
        }
        export.append( "\t" );
    }

    private void appendPCRProductLength( StringBuffer export ) {
        Iterator iter = null;
        PolymorphismObject poly = null;
        boolean first = true;

        if ( polymorphisms != null && !polymorphisms.isEmpty() ) {
            iter = polymorphisms.get_polymorphisms( "PCR_product_length" );
            if ( iter != null ) {

                while ( iter.hasNext() ) {
                    if ( !first ) {
                        export.append( "; " );
                    } else {
                        first = false;
                    }
                    poly = (PolymorphismObject) iter.next();  
          
                    Iterator subIter = poly.get_species_variants();
                    if ( subIter != null ) {
                        boolean subFirst = true;
                        while ( subIter.hasNext() ) {
                            if ( !subFirst ) {
                                export.append( ", " );
                            } else {
                                subFirst = false;
                            }
                                
                            TfcSpeciesVariant variant = (TfcSpeciesVariant) subIter.next();
                            export.append( EmptyTextConverter.convert( variant.get_abbrev_name() ) );
                        }
                    }
                    export.append( " " + EmptyTextConverter.convert( poly.get_lengths() ) + " " + 
                                   EmptyTextConverter.convert( poly.get_units() ) );
                }
            }
        }
        export.append( "\t" );
    }


    // split sequences up by type and append to export in separate columns
    private void appendFlankingSequences( StringBuffer export ) {
        Iterator iter = null;
        TfcFlankingSequence sequence = null;
        String[] types = new String[] { "PCR_primer", "allele_probe", "flank" };
    
        if ( flankingSequences != null && !flankingSequences.isEmpty() ) {
            for ( int i = 0; i < types.length; i++ ) {
                iter = flankingSequences.get_flanking_sequences( types[ i ] );
                if ( iter != null ) {
                    boolean first = true;
                    while ( iter.hasNext() ) {
                        sequence = (TfcFlankingSequence) iter.next();
                        if ( !first ) {
                            export.append( "; " );
                        }
                        if ( sequence.get_sequence1() != null ) {
                            export.append( sequence.get_sequence1() );
                        }
                        if ( sequence.get_sequence2() != null ) {
                            export.append( "; " + sequence.get_sequence2() );
                        }
                        first = false;
                    }
                }
                export.append( "\t" );
            }
        } else {
            export.append( "\t\t\t" );
        }
    }
  
    // returns all associated locus names as a comma delimited string
    private String getLocusNameString() {
        Iterator iter = null;
        TfcLocus locus = null;
        StringBuffer names = new StringBuffer();
        boolean first = true;

        if ( this.loci != null && !this.loci.isEmpty() ) {
            iter = loci.iterator();
            while ( iter.hasNext() ) {
                if ( !first ) {
                    names.append( ", " );
                }
                locus = (TfcLocus) iter.next();
                names.append( locus.get_original_name() );
                first = false;
            }
        }
        return names.toString();// will be empty string if no loci 
    }


    /**
     * Retrieves TAIR accession number for this object.  Implemented here
     * to satisfy the <code>Accessible</code> interface
     * 
     * @return TAIR accession number for this object
     */
    public final String getAccession() { return AccessionManager.getAccession( this ); }

    /**
     * Retrieves element type of this object for use in creating TAIR accession 
     * number. Implemented here to satisfy the <code>Accessible</code> interface
     *
     * @return Object's element type (marker) for use in creating TAIR accession
     */
    public final String getElementType() { return "marker"; }

    /**
     * Retrieves object's super id (tair_object_id) for use in creating TAIR accession
     * number. Implemented here to satisfy the <code>Accessible</code> interface
     *
     * @return ID to use for creating TAIR accession number for this object
     */
    public final Long getSuperID() { return get_tair_object_id(); }

  

    /**
     * Creates a tab-delimited string of this genetic marker's data for downloading.
     * The data is returned in the following column order:
     * <ul>
     * <li>TAIR Accession</li>
     * <li>Name</li>
     * <li>Aliases, as delimited string</li>
     * <li>Type</li>
     * <li>Loci</li>
     * <li>Chromosome</li>
     * <li>Start positions as delimited string</li>
     * <li>Special conditions</li>
     * <li>PCR Primer sequence</li>
     * <li>Allele Probe sequence</li>
     * <li>Flank sequence</li>
     * <li>Sequence Variations</li>
     * <li>Digest patterns</li>
     * <li>PCR Product Length</li>
     * </ul>
     *
     * @return Tab-delimited string of genetic marker data
     */  
    public String createExport() {
        StringBuffer export = new StringBuffer();
        export.append( getAccession() + "\t" );
        export.append( EmptyTextConverter.convert( get_name() ) + "\t" );
        export.append( EmptyTextConverter.convert( get_alias_string() ) + "\t" );
        export.append( EmptyTextConverter.convert( get_geneticmarker_type() ) + "\t" );
        export.append( getLocusNameString() + "\t" );

        // translate C or M to chloroplast/mitochondria
        export.append( EmptyTextConverter.convert( Units.translateChromosome( get_chromosome() ) ) + "\t" );
        export.append( EmptyTextConverter.convert( get_position_string() ) + "\t" );
        export.append( EmptyTextConverter.convert( get_special_conditions() ) + "\t" );
        appendFlankingSequences( export );
        appendSequenceVariation( export );
        appendDigestPattern( export );
        appendPCRProductLength( export );
        export.append( "\n" );
        return export.toString();
    }


    /**
     * Retrieve column order used for tab-delimited export
     *
     * @return Column order used when creating export as a tab-delimited string
     */  
    public String getExportHeader() {
        String header = 
            "TAIR Accession\t" +
            "Name\t" +
            "Alias Name\t" +
            "Type\t" +
            "Loci\t" +
            "Chromosome\t" +
            "Position\t" +
            "Special Conditions\t" +
            "PCR Primer\t" +
            "Allele Probe\t" +
            "Flank\t" +
            "Sequence Variations\t" +
            "Digest Patterns\t" +
            "PCR Product Length\n";
        return header;
    }



    /**
     * Retrieve marker's assignment start positions as delimited string
     *
     * @return Assignment start positions and units as a semicolon ( ";" )
     * delimited string, or <code>null</code> if no assignments for this object
     */
    public String get_position_string() {
        Iterator iter = get_assignments();
        TfcGlobalAssignment tmpAssign = null;
        StringBuffer buffer = null;
        String positionStr = null;
        String mapName = null;
        boolean first = true;

        if ( iter != null ) {
            buffer = new StringBuffer();
            while ( iter.hasNext() ) {
                tmpAssign = (TfcGlobalAssignment) iter.next();
                mapName = assignments.getMap( tmpAssign );

                if ( !first ) {
                    buffer.append( "; " );
                }
                buffer.append( mapName + ": " + 
                               tmpAssign.getFormatStartPosition() + "-" +
                               tmpAssign.getFormatEndPosition() + " " + 
                               tmpAssign.getUnits() );
                first = false;
            }
            positionStr = buffer.toString();
        }
        return positionStr;
    }
  



    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** GeneticMarker content test ******" );
        System.out.println( "tair_object_id: " + get_tair_object_id() );
        System.out.println( "map_element_id: " + get_map_element_id() );
        System.out.println( "name: " + get_name() );
        System.out.println( "geneticmarker_type: " + get_geneticmarker_type() );
        System.out.println( "chromosome: " + get_chromosome() );
        System.out.println( "units: " + get_units() );
        System.out.println( "special conditions: " + get_special_conditions() );
        
        if ( hasAliases() ) {
            aliases.test();
        }
        
        if ( hasAssignments() ) {
            assignments.test();
        }
    
        if ( flankingSequences != null ) {
            flankingSequences.test();
        }

        if ( polymorphisms != null ) {
            polymorphisms.test();
        }
                                  
        System.out.println( "**** GeneticMarker content test end ****" );
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{
            DBconnection conn = new DBconnection();
            String test_name = "NGA6";

            GeneticMarkerSummary genetic_marker = new GeneticMarkerSummary( conn, test_name );
            genetic_marker.test();
          
        } catch( Exception e ) {
            e.printStackTrace();
        }
      
    }
}
