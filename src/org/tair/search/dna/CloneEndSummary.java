//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.12 $
// $Date: 2004/07/29 21:57:18 $
//------------------------------------------------------------------------------
package org.tair.search.dna;

import java.sql.*;
import java.util.*;

import org.tair.querytools.*; 
import org.tair.tfc.*;
import org.tair.utilities.*;
 

/**
 * CloneEndSummary represents the information needed to display one clone end
 * record as part of the clone end search results returned by a clone end 
 * subtype search of <code>DNASearcher</code>. CloneEndSummary contains all 
 * fields from the temp table used to hold clone end search results as well 
 * as collections of additional information (such as stocks associated w/clone,
 * aliases & assignments). CloneEndSummary implements the 
 * <code>DNASummary</code> interface so that it can be used by 
 * <code>DNASearchHandler</code> to create downloads generically (regardless 
 * of dna sub type)
 *
 * <p>
 * CloneEndSummary implements Accessible interface to facilitate creation of
 * the object's TAIR accession number through <code>AccessionManager</code
 */


public class CloneEndSummary implements DNASummary, Accessible {

    private Long tair_object_id;
    private Long map_element_id;
    private Long clone_end_id;
    private String name;
    private String type;
    private String chromosome;

    // clone info associated w/clone end
    private Long clone_id;
    private Long clone_tair_object_id;
    private String clone_name;
  
    // stocks associated w/clone - stored as TfcStock
    private StockCollection stocks;

    // aliases for clone end - stored as TfcAlias
    private AliasVector aliases;

    // assignments for clone end - stored as TfcGlobalAssignment
    private GlobalAssignmentCollection assignments;

    // loci associated to clone end - stored as TfcLocus 
    private LocusCollection loci;

    // chromosome values from AGI map assignments -- needed for creating
    // valid links to seq viewer
    private String[] agiChromosomes;

    // flag to determine if link to map viewer can be made for this clone end
    private boolean showMapViewerLink = false;


    // GenBank accession number(s) for this clone end - stored as string
    private ArrayList accessions;

    /**
     * Creates an empty instance of CloneEndSummary
     */
    public CloneEndSummary() {  }


    public void set_map_element_id( Long id ) {
	this.map_element_id = id;
    }

    public void set_tair_object_id( Long id ) {
	this.tair_object_id = id;
    }

    public void set_clone_end_id( Long id ) { 
	this.clone_end_id = id; 
    }

    public void set_name( String value ) { 
	this.name = value;
    }

    public void set_type( String value ) {
	this.type = value; 
    }

    public void set_chromosome ( String value ) {
	this.chromosome = value; 
    }

    public void set_stocks( StockCollection value ) {
	stocks = value; 
    }

    public void set_aliases( AliasVector value ) {
	aliases = value;
    }

    public void set_clone_id ( Long id ) {
	this.clone_id = id;
    }

    public void set_clone_tair_object_id( Long id ) {
	this.clone_tair_object_id = id;
    }

    public void set_clone_name( String name ) { 
	this.clone_name = name;
    }

    public Long get_clone_end_id() { 
	return clone_end_id;
    }

    public Long get_map_element_id() {
	return map_element_id;
    }

    public Long get_tair_object_id() { 
	return tair_object_id;
    }

    public String get_name() { 
	return name;
    }

    public String get_type() {
	return type; 
    }

    public String get_chromosome() { 
	return chromosome; 
    }

    public Long get_clone_id() { 
	return clone_id;
    }

    public Long get_clone_tair_object_id() {
	return clone_tair_object_id; 
    }

    public String get_clone_name() { 
	return clone_name;
    }

    /**
     * Determines if clone end is mapped onto the AGI map by checking
     * whether object contains any chromosome values from AGI assignments
     *
     * @return <code>true</code> if clone end has an assignment on AGI map,
     * or <code>false</code> if no assignment exists for clone end on AGI map
     */
    public boolean get_is_agi_map() {
        return ( agiChromosomes != null && agiChromosomes.length > 0 );
    }

    /**
     * Retrieves list of chromosomes from clone end's assignments onto
     * AGI map. This list is needed for creating hyperlinks to display element
     * in seq viewer, which can only display elements w/AGI map assignments, 
     * and which can only display sequences on a single chromosome at a time. 
     * This list should be used to create multiple links to seq viewer if clone
     * end has multiple chromosomes (see utility method 
     * HTMLFactory.createSeqViewerLinks() for more info on how this list is used
     * to create hyperlinks
     *
     * @return List of chromosomes from clone end's assignments onto AGI map as
     * a String array, or <code>null</code> if no assignments onto AGI map found
     * for clone end
     */
    public String[] getAGIChromosomes() {
        return agiChromosomes;
    }


    /**
     * Determines whether a link to map viewer can be made for this clone end.
     * This is done according to logic in TfcMapElement.showMapViewerLink()
     * which examines map element's assignment data to make determination.
     *
     * @return <code>true</code> if a link to map viewer can be made, or 
     * <code>false</code> if no link to map viewer can be made
     */
    public boolean showMapViewerLink() {
        return showMapViewerLink;
    }


    /**
     * Determines if clone end's clone has associated stocks
     *
     * @return <code>true</code> if clone end's clone has associated stocks or 
     * <code>false</code> if no stocks associated to clone end's clone
     */
    public boolean hasStocks() {
        return ( stocks != null && !stocks.isEmpty() );
    }


    /**
     * Retrieves stocks for clone associated to this clone end
     *
     * @return Stocks associated with clone for this clone end
     * as an <code>Iterator</code> of <code>TfcStock</code> objects
     * or <code>null</code> if clone has no stocks
     */
    public Iterator get_stocks() {
        return ( hasStocks() ) ? stocks.iterator() : null;
    }

    /**
     * Determines if clone end has aliases
     *
     * @return <code>true</code> if clone end has aliases or
     * <code>false</code> if no aliases associated to clone end
     */
    public boolean hasAliases() {
        return ( aliases != null && !aliases.isEmpty() );
    }


    /**
     * Retrieves clone end's aliases
     *
     * @return Aliases for this clone end as an <code>Iterator</code> of 
     * <code>TfcAlias</code> objects, or <code>null</code> if no aliases
     * exists for clone end
     */
    public Iterator get_aliases() {
        return ( hasAliases() ) ? aliases.iterator() : null;
    }


    /**
     * Retrieves aliases for clone end as a delimited string
     *
     * @return Aliases for this clone end as a semicolon delimited string, or 
     * <code>null</code> if no aliases exist for this clone end
     */
    public String get_alias_string() { 
	return hasAliases() ? aliases.get_alias_string() : null; 
    }


    /**
     * Retrieves clone end's assignment start positions as a delimited string
     *
     * @return Assignment start positions and units as a semicolon ( ";" )
     * delimited string, or <code>null</code> if no assignments for this object
     */
    public String get_position_string() {

        Iterator iter = get_assignments();

        TfcGlobalAssignment tmpAssign = null;
        StringBuffer buffer = null;
        String positionStr = null;
        boolean first = true;

        if ( iter != null ) {
            buffer = new StringBuffer();
            while ( iter.hasNext() ) {
                tmpAssign = (TfcGlobalAssignment) iter.next();
                if ( !first ) {
                    buffer.append( "; " );
                }
                buffer.append( tmpAssign.getFormatStartPosition() + " " + 
			       tmpAssign.getUnits() );
                first = false;
            }
            positionStr = buffer.toString();
        }
        return positionStr;
    }
  
    /**
     * Determines if clone end has assignments
     *
     * @return <code>true</code> if clone end has assignments or
     * <code>false</code> if no assignments associated to clone end
     */
    public boolean hasAssignments() {
        return ( assignments != null && !assignments.isEmpty() );
    }



    /**
     * Retrieve assignments for clone end
     *
     * @return Assignments for this clone end as an <code>Iterator</code> of 
     * <code>TfcGlobalAssignment</code> objects, or <code>null</code> if no 
     * assignments for this clone end
     */
    public Iterator get_assignments() {
        return ( hasAssignments() ) ? assignments.iterator() : null;
    }

  
    /**
     * Retrieves assignment, alias, locus and stock information for this 
     & clone end
     *
     * @param conn An active connection to the database
     */
    public void get_information( DBconnection conn ) throws SQLException {
        if ( map_element_id != null ) {
            assignments = new GlobalAssignmentCollection( conn, 
                                                          map_element_id );
            aliases = new AliasVector( conn, tair_object_id );
      
            if ( clone_tair_object_id != null ) {
                stocks = new StockCollection( conn, clone_tair_object_id );
            }
      
            this.agiChromosomes = 
		TfcMapElement.getAGIChromosomes( conn, map_element_id );

            this.showMapViewerLink =
		TfcMapElement.showMapViewerLink( conn, 
						 map_element_id,
						 "clone_end" );
      
            if ( get_chromosome() == null ) {
                retrieveChromosome( conn );
            }

            populateGenBankAccessions( conn );
            populateLocus( conn );
        }
    }

    /**
     * Many clone ends don't have chromosome populated in CloneEnd table - 
     * retrieve from Map assignment is made onto
     */
    private void retrieveChromosome( DBconnection conn ) throws SQLException {
        String query = 
            "SELECT mp.chromosome " +
            "FROM Map mp, GlobalAssignment a " +
            "WHERE a.map_id = mp.map_id " +
            "AND a.is_obsolete = 'F' " +
            "AND a.map_element_id = ?";

        conn.setQuery( query );
	conn.setQueryVariable( map_element_id );
	
        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            this.chromosome = results.getString( "chromosome" );
        }
        conn.releaseResources();
    }


    /**
     * Populates clone end's collection of associated loci. This
     * method assumes that basic clone end data has already been populated
     *
     * @param conn An active connection to the database
     * @throws SQLException thrown if a database error occurs
     */
    private void populateLocus( DBconnection conn ) throws SQLException {
        this.loci = new LocusCollection( conn, get_map_element_id() );
    }

    /**
     * Determines if clone end has associated loci
     *
     * @return <code>true</code> if clone end has associated loci
     * or <code>false</code> if no loci associated to clone
     */
    public boolean hasLocus() {
        return ( loci != null && !loci.isEmpty() );
    }

    /**
     * Retrieves all loci associated to clone end
     *
     * @return Loci associated to clone end as an <code>Iterator</code>
     * of <code>Locus</code> objects, or <code>null</code> if no loci
     * associated to clone end
     */
    public Iterator getLocus() {
        return hasLocus() ? loci.iterator() : null;
    }


    /**
     * Returns all associated locus names as a comma delimited string
     */
    private String getLocusNameString() {
        Iterator iter = null;
        TfcLocus locus = null;
        StringBuffer names = new StringBuffer();
        boolean first = true;

        if ( hasLocus() ) {
            iter = getLocus();
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
     * Retrieve GenBank accession number(s) for clone end NT sequence
     */
    private void populateGenBankAccessions( DBconnection conn ) 
	throws SQLException {

        ResultSet results = null;
    
        if ( get_map_element_id() != null ) {
            String query = 
                "SELECT n.ic_accession " +
                "FROM NucleotideSequence n, " +
		"NucleotideSequence_MapElement nm " +
                "WHERE nm.nucleotide_seq_id = n.nucleotide_seq_id " +
                "AND nm.map_element_id = ?";

            conn.setQuery( query );
	    conn.setQueryVariable( get_map_element_id() );

            results = conn.getResultSet();
            while ( results.next() ) {
                if ( this.accessions == null ) {
                    accessions = new ArrayList();
                }
                accessions.add( results.getString( "ic_accession" ) );
            }
            conn.releaseResources();
        }
    }


    /**
     * Determines if clone end has GenBank accession numbers
     *
     * @return <code>true</code> if clone end has GenBank accession numbers, or 
     * <code>false</code> if no accession numbers associated to clone end
     */
    public boolean hasGenBankAccessions() {
        return ( accessions != null && !accessions.isEmpty() );
    }

    /**
     * Retrieves GenBank accession numbers for clone end
     *
     * @return GenBank accession numbers for clone end as an 
     * <code>Iterator</code> of <code>String</code> objects, or
     * <code>null</code> if no accession numbers associated to this clone end
     */
    public Iterator getGenBankAccessions() {
        return hasGenBankAccessions() ? accessions.iterator() : null;
    }
  
  
    /**
     * Retrieves TAIR accession number for this object.  Implemented here
     * to satisfy the <code>Accessible</code> interface
     * 
     * @return TAIR accession number for this object
     */
    public final String getAccession() { 
	return AccessionManager.getAccession( this ); 
    }
  
    /**
     * Retrieves element type of this object for use in creating TAIR accession 
     * number. Implemented here to satisfy the <code>Accessible</code> interface
     *
     * @return Object's element type (cloneend) for use in creating TAIR 
     * accession
     */
    public final String getElementType() { 
	return "cloneend"; 
    }
  
    /**
     * Retrieves object's super id (tair_object_id) for use in creating TAIR
     * accession number. Implemented here to satisfy the <code>Accessible</code> 
     * interface
     *
     * @return ID to use for creating TAIR accession number for this object
     */
    public final Long getSuperID() { return get_tair_object_id(); }

    /**
     * Creates a tab-delimited string of this clone end's data for downloading.
     * The data is returned in the following column order:
     * <ul>
     * <li>TAIR Accession</li>
     * <li>Name</li>
     * <li>Aliases as delimited string</li>
     * <li>Type</li>
     * <li>Chromosome</li>
     * <li>Mapped start positions as delimited string</li>
     * <li>Associated clone name</li>
     * <li>Associated locus name(s)</li>
     * <li>Stock numbers as delimited string</li>
     * </ul>
     *
     * @return Tab-delimited string of clone end data
     */     
    public String createExport() {
        StringBuffer export = new StringBuffer();
        export.append( getAccession() + "\t" );
        export.append( EmptyTextConverter.convert( get_name() ) + "\t" );
        export.append( EmptyTextConverter.convert( get_alias_string() ) + 
		       "\t" );

        export.append( EmptyTextConverter.convert( get_type() ) + "\t" );

        export.append( EmptyTextConverter.convert( get_chromosome() ) + 
		       "\t" );

        export.append( EmptyTextConverter.convert( get_position_string() ) + 
		       "\t" );

        export.append( EmptyTextConverter.convert( get_clone_name() ) + "\t" );
        export.append( getLocusNameString() + "\t" );

        if ( stocks != null ) {
            export.append( EmptyTextConverter.convert( 
			       stocks.getStockNumberString() ) + "\n" );
        } else {
            export.append( "\n" );
        }

        return export.toString();
    }

    /**
     * Retrieve column order of tab-delimited export
     *
     * @return Column order used when creating export as a tab-delimited string
     */
    public String getExportHeader() {
        String header = 
            "TAIR Accession\t" +
            "Name\t" +
            "Aliases\t" +
            "Type\t" +
            "Chromosome\t" +
            "Position\t" +
            "Clone Name\t" +
            "Loci\t" +
            "ABRC Stocks\n";
        return header;
    }
  
    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** CloneEndSummary content test ******" );
        System.out.println( "tair_object_id: " + get_tair_object_id() );
        System.out.println( "map_element_id: " + get_map_element_id() );
        System.out.println( "clone end id: " + get_clone_end_id() );
        System.out.println( "name: " + get_name() );
        System.out.println( "type: " + get_type() );
        System.out.println( "chromosome: " + get_chromosome() );
        System.out.println( "clone id: " + get_clone_id() );
        System.out.println( "clone name: " + get_clone_name() );

        if ( hasAliases() ) {
            aliases.test();
        }

        if ( hasAssignments() ) {
            assignments.test();
        }

        if ( hasStocks() ) {
            stocks.test();
        }
        System.out.println( "**** CloneEndSummary content test end ****" );
        
    }

}
