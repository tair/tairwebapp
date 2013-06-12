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
 * CloneSummary represents the information needed to display one clone record
 * as part of the clone search results returned by a clone subtype search of
 * <code>DNASearcher</code>. CloneSummary contains all fields from the temp
 * table used to hold clone search results as well as collections of additional
 * information (such as aliases & assignments). CloneSummary implements the 
 * <code>DNASummary</code> interface so that it can be used by 
 * <code>DNASearchHandler</code> to create downloads generically (regardless 
 * of dna sub type)
 *
 * <p>
 * CloneEndSummary implements Accessible interface to facilitate creation of 
 * the object's TAIR accession number through <code>AccessionManager</code
 */

public class CloneSummary implements DNASummary, Accessible {

    private Long tair_object_id;
    private Long map_element_id;
    private Long clone_id;
    private String name;
    private String vector_type;
    private String units;
    private String chromosome;

    // stocks for clone - stored as StockObject
    private StockCollection stocks;

    // aliases for clone - stored as TfcAlias
    private AliasVector aliases;

    // assignments for clone - stored as TfcGlobalAssignment
    private GlobalAssignmentCollection assignments;

    // loci associated to clone - stored as TfcLocus 
    private LocusCollection loci;

    // chromosome values from AGI map assignments -- needed for creating
    // valid links to seq viewer
    private String[] agiChromosomes;

    // flag to determine if link to map viewer can be made for this clone
    private boolean showMapViewerLink = false;

    // GenBank accession number(s) for this clone - stored as string
    private ArrayList accessions;


    /**
     * Creates an empty instance of CloneSummary
     */
    public CloneSummary() {  }


    public void set_clone_id( Long value ) { 
	clone_id = value; 
    }

    public void set_map_element_id( Long value ) { 
	map_element_id = value;
    }

    public void set_tair_object_id( Long value ) {
	tair_object_id = value; 
    }

    public void set_name( String value ) {
	name = value; 
    }

    public void set_vector_type( String value ) {
	vector_type = value;
    }

    public void set_chromosome( String value ) {
	chromosome = value;  
    }

    public void set_units( String value ) {
	units = value;
    }

    public Long get_clone_id() {
	return clone_id; 
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

    public String get_vector_type() {
	return vector_type; 
    }

    public String get_chromosome() {
	return chromosome; 
    }

    public String get_units() { 
	return units;
    }


    /**
     * Determines if clone is mapped onto the AGI map by checking
     * whether object contains any chromosome values from AGI assignments
     *
     * @return <code>true</code> if clone has an assignment on AGI map,
     * or <code>false</code> if no assignment exists for clone on AGI map
     */
    public boolean get_is_agi_map() {
        return ( agiChromosomes != null && agiChromosomes.length > 0 );
    }

    /**
     * Retrieves list of chromosomes from clone's assignments onto
     * AGI map. This list is needed for creating hyperlinks to display element
     * in seq viewer, which can only display elements w/AGI map assignments, 
     * and which can only display sequences on a single chromosome at a time.
     * This list should be used to create multiple links to seq viewer if clone
     * has multiple chromosomes (see utility method 
     * HTMLFactory.createSeqViewerLinks() for more info on how this list is used
     * to create hyperlinks
     *
     * @return List of chromosomes from clone's assignments onto AGI map as
     * a String array, or <code>null</code> if no assignments onto AGI map 
     * found for clone
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
     * Retrieve stocks for clone
     *
     * @return Stocks associated with this clone as an <code>iterator</code>
     * of <code>TfcStock</code> objects, or <code>null</code> if no stocks
     * for this clone
     */
    public Iterator get_stocks() {
        return ( hasStocks() ) ? stocks.iterator() : null;
    }

    /**
     * Determines if clone has associated stocks
     *
     * @return <code>true</code> if clone has associated stocks or 
     * <code>false</code> if no stocks associated to clone
     */
    public boolean hasStocks() {
        return ( stocks != null && !stocks.isEmpty() );
    }


    /**
     * Retrieve aliases for clone
     *
     * @return Aliases for this clone as an <code>Iterator</code> of 
     * <code>TfcAlias</code> objects, or <code>null</code> if no aliases
     * exists for clone
     */
    public Iterator get_aliases() {
        return ( hasAliases() ) ? aliases.iterator() : null;
    }


    /**
     * Determines if clone has associated aliases
     *
     * @return <code>true</code> if clone has associated aliases or
     * <code>false</code> if no aliases associated to clone
     */
    public boolean hasAliases() {
        return ( aliases != null && !aliases.isEmpty() );
    }


    /**
     * Retrieve clone's aliases as a delimited string
     *
     * @return Aliases for this clone as a semicolon delimited string, or 
     * <code>null</code> if no aliases exist for this clone
     */
    public String get_alias_string() { 
	return hasAliases() ? aliases.get_alias_string() : null; 
    }


    /**
     * Retrieves clone's assignment start positions as a delimited string
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
     * Determines if clone has associated assignments
     *
     * @return <code>true</code> if clone has associated assignments or 
     * <code>false</code> if no assignments associated to clone
     */
    public boolean hasAssignments() {
        return ( assignments != null && !assignments.isEmpty() );
    }

  
    /**
     * Retrieve clone's assignments
     *
     * @return Assignments for this clone as an <code>Iterator</code> of 
     * <code>TfcGlobalAssignment</code> objects, or <code>null</code> if no 
     * assignments for this clone
     */
    public Iterator get_assignments() {
        return ( hasAssignments() ) ? assignments.iterator() : null;
    }

  
    /** 
     * Retrieve assignments, aliases and stocks for clone
     *
     * @param conn An active connection to the database
     * @exception SQLException thrown if a database error occurs
     */
    public void get_information( DBconnection conn ) throws SQLException {
        if ( map_element_id != null ) {
            assignments = new GlobalAssignmentCollection( conn, 
                                                          map_element_id );
            aliases = new AliasVector( conn, tair_object_id );
            stocks = new StockCollection( conn, tair_object_id );

            this.agiChromosomes = 
		TfcMapElement.getAGIChromosomes( conn, map_element_id );
	    
            this.showMapViewerLink = 
		TfcMapElement.showMapViewerLink( conn, 
						 map_element_id, 
						 "clone" );

            populateGenBankAccessions( conn );
            populateLocus( conn );
        }
    }

    /**
     * Retrieve GenBank accession number(s) for clone NT sequence
     */
    private void populateGenBankAccessions( DBconnection conn )
	throws SQLException {

	String query = 
	    "SELECT n.ic_accession " +
	    "FROM NucleotideSequence n, NucleotideSequence_MapElement nm " +
	    "WHERE nm.nucleotide_seq_id = n.nucleotide_seq_id " +
	    "AND nm.map_element_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( get_map_element_id() );
	
	ResultSet results = conn.getResultSet();
	while ( results.next() ) {
	    if ( this.accessions == null ) {
		accessions = new ArrayList();
	    }
	    accessions.add( results.getString( "ic_accession" ) );
	}
	conn.releaseResources();
    }


    /**
     * Determines if clone has GenBank accession numbers
     *
     * @return <code>true</code> if clone has GenBank accession numbers, or
     * <code>false</code> if no accession numbers associated to clone
     */
    public boolean hasGenBankAccessions() {
        return ( accessions != null && !accessions.isEmpty() );
    }

    /**
     * Retrieves GenBank accession numbers for clone
     *
     * @return GenBank accession numbers for clone as an <code>Iterator</code>
     * of <code>String</code> objects, or <code>null</code> if no accession 
     * numbers associated to this clone
     */
    public Iterator getGenBankAccessions() {
        return ( hasGenBankAccessions() ) ? accessions.iterator() : null;
    }


    /**
     * Populates clone's collection of associated loci. This
     * method assumes that basic clone data has already been populated
     *
     * @param conn An active connection to the database
     * @exception SQLException thrown if a database error occurs
     */
    private void populateLocus( DBconnection conn ) throws SQLException {
        this.loci = new LocusCollection( conn, get_map_element_id() );
    }

    /**
     * Determines if clone has associated loci
     *
     * @return <code>true</code> if clone has associated loci
     * or <code>false</code> if no loci associated to clone
     */
    public boolean hasLocus() {
        return ( loci != null && !loci.isEmpty() );
    }

    /**
     * Retrieves all loci associated to clone
     *
     * @return Loci associated to clone as an <code>Iterator</code>
     * of <code>Locus</code> objects, or <code>null</code> if no loci
     * associated to clone
     */
    public Iterator getLocus() {
        return hasLocus() ? loci.iterator() : null;
    }


    /**
     * Returns all associated locus names as a comma delimited string
     */
    private String getLocusNameString() {

        StringBuffer names = new StringBuffer();

        if ( hasLocus() ) {

	    TfcLocus locus = null;
	    boolean first = true;
	    
            Iterator iter = getLocus();
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
    public final String getAccession() {
	return AccessionManager.getAccession( this ); 
    }

    /**
     * Retrieves element type of this object for use in creating TAIR accession 
     * number. Implemented here to satisfy the <code>Accessible</code> interface
     *
     * @return Object's element type (clone) for use in creating TAIR accession
     */
    public final String getElementType() {
	return "clone";
    }

    /**
     * Retrieves object's super id (tair_object_id) for use in creating TAIR 
     * accession number. Implemented here to satisfy the <code>Accessible</code>
     * interface
     *
     * @return ID to use for creating TAIR accession number for this object
     */
    public final Long getSuperID() { 
	return get_tair_object_id(); 
    }



    /**
     * Creates a tab-delimited string of this clone's data for downloading.
     * The data is returned in the following column order:
     * <ul>
     * <li>TAIR Accession</li>
     * <li>Name</li>
     * <li>Aliases, as delimited string</li>
     * <li>Vector type</li>
     * <li>Chromosome</li>
     * <li>Start positions as delimited string</li>
     * <li>Associated locus name(s)</li> 
     * <li>Stock numbers as delimited string</li>
     * </ul>
     *
     * @return Tab-delimited string of clone data
     */
    public String createExport() {
        StringBuffer export = new StringBuffer();
        export.append( getAccession() + "\t" );
        export.append( EmptyTextConverter.convert( get_name() ) + "\t" );

        export.append( EmptyTextConverter.convert( get_alias_string() ) + 
		       "\t" );

        export.append( EmptyTextConverter.convert( get_vector_type() ) + 
		       "\t" );

        export.append( EmptyTextConverter.convert( get_chromosome() ) + 
		       "\t" );

        export.append( EmptyTextConverter.convert( get_position_string() ) + 
		       "\t" );

        export.append( getLocusNameString() + "\t" );

        if ( stocks != null ) {
            export.append( EmptyTextConverter.convert( 
			       stocks.getStockNumberString() ) + 
			   "\n" );
        } else {
            export.append( "\n" );
        }
        return export.toString();
    }

    /**
     * Retrieve column order of tab-delimited export
     *
     * @return Column order used when creating export as a tab-delimited 
     * string
     */
    public String getExportHeader() {
        String header = 
            "TAIR Accession\t" +
            "Name\t" +
            "Aliases\t" +
            "Vector Type\t" +
            "Chromosome\t" +
            "Position\t" +
            "Loci\t" +
            "ABRC Stocks\n";
        return header;
    }

    /** 
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** CloneSummary content test ******" );
        System.out.println( "tair_object_id is " + get_tair_object_id() );
        System.out.println( "map_element_id is " + get_map_element_id() );
        System.out.println( "name is " + get_name() );
        System.out.println( "vector_type is " + get_vector_type() );
        System.out.println( "chromosome is " + get_chromosome() );
        System.out.println( "units is " + get_units() );
        System.out.println( "clone is " + get_clone_id() );

        if ( hasAliases() ) {
            aliases.test();
        }

        if ( hasAssignments() ) {
            assignments.test();
        }

        if ( hasStocks() ) {
            stocks.test();
        }
        System.out.println( "**** CloneSummary content test end ****" );
        
    }
}
