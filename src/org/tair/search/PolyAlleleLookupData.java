//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $RCSfile: PolyAlleleLookupData.java,v $
// $Revision: 1.29 $
// $Date: 2006/03/18 01:54:30 $
//------------------------------------------------------------------------------


package org.tair.search;

import java.sql.SQLException;
import java.util.Iterator;

import org.tair.querytools.AliasVector;
import org.tair.querytools.ElementCount;
import org.tair.querytools.ElementCountCollection;
import org.tair.querytools.FlankingSequenceVector;
import org.tair.querytools.GlobalAssignmentCollection;
import org.tair.querytools.LocusCollection;
import org.tair.querytools.PolymorphismObject;
import org.tair.querytools.PolymorphismObjectCollection;
import org.tair.querytools.PolymorphismRestrictionEnzyme;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAlias;
import org.tair.tfc.TfcFlankingSequence;
import org.tair.tfc.TfcGlobalAssignment;
import org.tair.tfc.TfcLocus;
import org.tair.tfc.TfcMapElement;
import org.tair.tfc.TfcPolymorphism;
import org.tair.tfc.TfcSpeciesVariant;
import org.tair.utilities.EmptyTextConverter;
import org.tair.utilities.HTMLFactory;
import org.tair.utilities.LookupDataModel;
import org.tair.utilities.SearchType;

/**
 * PolyAlleleLookupData is used by <code>ResultsFetcher</code> through
 * polymorphism as a <code>LookupDataModel</code> object.
 * PolyAlleleLookupData implements the methods defined by
 * <code>LookupDataModel</code> in a search type specific manner.
 * PolyAlleleLookupData uses <code>SearchType</code> to identify
 * columns for lookup for this particular search type.
 * PolyAlleleLookupData uses <code>TfcAlias</code> to retrieve
 * a list of aliases for the specified cell
 * PolyAlleleLookupData uses <code>TfcLocus</code> to retrieve a
 * list of loci for the specified cell
 * PolAlleleLookupData retieves the cell's description since it is
 * a large data item and is best retieved as needed, also
 * special formatting for description is done here for the
 * download option
 * PolyAlleleLookupData uses <code>PolymorphismObjectCollection</code>
 * to retrieve sequence variants, digest patterns and
 * pcr product length information for the specified cell
 * PolyAlleleLookupData uses <code>FlankingSequenceVector</code>
 * to retrieve pcr_primer, allele oligo and flank type
 * sequence information for the specified cell
 */

public class PolyAlleleLookupData implements LookupDataModel {

    private String search_type = "polyallele";
    private String[][] results_table;
    private int results_length;
    private String[] lookup_data;
    private DBReadManager connectionPool;
    private boolean download;
    private String[][] aliases;

    // various aliases associated with a given entry
    // [row num][one for each alias found]

    private String[][] loci;

    // various loci associated
    // with a given entry [row num][one for each loci found]

    private String[][] loci_ids;

    // various loci ids associated with a given
    // entry [row num][one for each loci found]

    private String[] seqviewer;

    // only one entry per row - spaces if no agi
    // map info, otherwise, tair_object_id in [row num]

    private String[] seqviewer_type;

    // translate insertion_type to a seqviewer_type [row num]

    private String[][] position;

    // various positions associated with a given entry for each map type it is
    // found on [row num][one for each assignment found],
    //  if only map type agi is specified only
    // one position per row will be populated

    private String[] description;

    // only one entry per row - potentially long
    // string in [row num], truncated for a download request

    private String[] original_name;

    // only one entry per row

    private String[] chromosome;

    // only one entry per row
    //the following will only be populated upon a download request

    private String[] pcr_primer;

    // only one entry per row - comma-delimited string

    private String[] allele_oligo;

    // only one entry per row - comma-delimited string

    private String[] flank_seq;

    // only one entry per row - comma-delimited string in

    private String[] seq_variants;

    // only one entry per row - comma-delimited string

    private String[] dig_patterns;

    // only one entry per row - comma-delimited string

    private String[] pcr_prod_length;

    // only one entry per row - comma-delimited string


    // (one per row) reports if there is one or more germplasm associated to the poly/allele.
    private Boolean[] hasGermplasms;
    // (one per row) further, if there is one or more phenotype for that germplasm.
    private Boolean[] hasPhenotypes;


    /**
     * constructor invoked from SearchType for use
     * from the <code>ResultsFetcher</code> for the requested search type
     **/

    public PolyAlleleLookupData() { }

    // gets a pooled connection to the database

    private DBconnection getConnection()
        throws SQLException {

        connectionPool = DBReadManager.getInstance();
        return connectionPool.get_connection();
    }

    // releases a connection back to the database pool

    private void returnConnection( DBconnection conn )
        throws SQLException {

        connectionPool.return_connection( conn );
    }

    // returns a list of column names that require a db
    // lookup -- db lookup functionality provided by this class

    private String[] getLookupColumns() {
        return SearchType.getLookupColumns( this.getType() );
    }

    // returns the correspnding index for a temp table
    // column name -- to be used to access the lookup ID
    // from the in memory results table

    private int getIndex(String column_name) {

        int column_index = 0;

        for ( int i = 0;
              i < SearchType.getTempTableColumns( getType() ).length;
              i ++ ) {
            if ( SearchType.getTempTableColumns( getType() )[i].
                 equals( column_name ) ){
                column_index = i;
            }
        }

        return column_index;
    }

    // returns this search type

    private String getType() {
        return search_type;
    }

    /**
     * provides to the object a subset (a page worth for display on the
     * summary page) of the temp table results as a two
     * dimensional string array.  The columns are the temp table columns
     *  and the rows are the result set rows -
     * the rows for a particular pages display. Lookup keys can be
     * accessed via the arrays contents for columns that
     * have been identified as lookup columns.
     * @param summary_table The table of one page of data from a summary page
     **/

    public void setSummaryData( String[][] summary_table )
        throws SQLException {

        results_table = summary_table;
        results_length = summary_table.length;
        DBconnection conn = null;

        try {
            conn = getConnection();
            // set the data items that are for display to the summary page
            setAliasArray( conn );
            setLociData( conn );
            setPolymorphismData( conn );
            setAssignmentData( conn );
            setChromosome();
            setSeqViewer( conn );
        }
        finally {
            if ( conn != null ) returnConnection( conn );
        }
    }

    /**
     * provides to the object a subset (user-selected rows of data from
     * the summary page) of the temp table results
     * as a two dimensional string array.  The columns are the temp
     * table columns and the rows are the user-selected
     * rows from the summary page. Lookup keys can be accessed via
     * the arrays contents for columns that
     * have been identified as lookup columns.
     * @param download_table The table of user-selected rows
     * from summary pages
     **/

    public void setDownloadData( String[][] download_table )
        throws SQLException {

        results_table = download_table;
        results_length = download_table.length;
        download = true;
        DBconnection conn = null;

        try {
            conn = getConnection();
            // set the data items that are needed for download page
            setAliasArray( conn );
            setLociData( conn );
            setPolymorphismData( conn );
            setAssignmentData( conn );
            setChromosome();
            // for each id build the polyObjCollection and FlankSeqVector,
            // add values into the various arrays, checking for duplicates
            // repeat this for each row in the results table
            setAssocPolyData( conn );
        }
        finally {
            if ( conn != null ) returnConnection( conn );
        }
    }

    // populates an array of string arrays that contain the aliases,
    // aliases[row in results ][ list of aliases ]

    private void setAliasArray( DBconnection conn )
        throws SQLException {

        aliases = new String[results_length][];

        for ( int i = 0; i < results_table.length; i ++ ) {
            if ( ( results_table[i][getIndex( "tair_object_id" )] )!=null ) {
                AliasVector alias_vector =
                    new AliasVector
                    ( conn,
                      new Long
                      ( results_table[i][getIndex( "tair_object_id" )] ) );
                aliases[i] = new String[alias_vector.size()];

                for ( int j = 0 ; j < alias_vector.size(); j ++ ) {
                    aliases[i][j] = ( ( TfcAlias )alias_vector.
                                      elementAt( j ) ).get_original_alias();
                }
            }
        }
    }

    private String[] getAliases( int row )  {
        return aliases[row];
    }

    private void setLociData( DBconnection conn )
        throws SQLException {
        loci = new String[results_length][];
        loci_ids = new String[results_length][];
        for ( int i = 0; i < results_table.length; i ++ ) {
            if ( ( results_table[i][getIndex( "map_element_id" ) ] )!= null ) {
                LocusCollection locus_collection =
                    new LocusCollection
                    ( conn,
                      new Long
                      ( results_table[i][getIndex( "map_element_id" )] ) );
                loci[i] = new String[locus_collection.size()];
                loci_ids[i] = new String[locus_collection.size()];
                for ( int j = 0 ; j < locus_collection.size(); j ++ ) {
                    loci[i][j] =
                        ( ( TfcLocus )locus_collection.elementAt( j ) ).
                        get_name();
                    loci_ids[i][j] =
                        ( ( ( TfcLocus )locus_collection.elementAt( j ) ).
                          get_locus_id() ).toString();
                }
            }
        }
    }

    private String[] getLoci( int row )  {
        return loci[row];
    }

    private String[] getLociIDs( int row )  {
        return loci_ids[row];
    }

    // populates an array of strings that contain the desctription,
    // description[row in results ] - also populate
    // seqviewer_type[] to be used if needed, derived from insertion_type
    // retreiving description as a lookup because it is potentially so big,
    // eliminates retrieving them all
    // but rather retreives them based on page request
    // also retreive original name
    // all from TfcPolymorphism

    private void setPolymorphismData( DBconnection conn )
        throws SQLException {

        description = new String[results_length];
        seqviewer_type = new String[results_length];
        // seqviewer_type derived from a polymorphism's
        // insertion_type -- for use if needed, used for seqviewer link
        // on summary page
        original_name = new String[results_length];

        this.hasGermplasms = new Boolean[results_length];
        this.hasPhenotypes = new Boolean[results_length];

        TfcPolymorphism poly = null;

        for ( int i = 0; i < results_table.length; i ++ ) {
            if ( ( results_table[i][getIndex( "id" )] )!= null ) {
                // check to make sure the key isn't spaces
                poly = new TfcPolymorphism
                    ( conn, new Long( results_table[i][getIndex( "id" )] ) );

                if ( poly != null ) {
                    if ( poly.get_description() == null ) {
                        description[i] = " ";
                    }
                    else {
                        if ( download ) {
                            if ( poly.get_description().
                                 length() > 40 ) {
                                // truncate if its longer than 40 characters
                                description[i] = poly.get_description().
                                    substring( 0,40 );
                            }
                            else {
                                description[i] = poly.get_description();
                            }
                        }
                        else {
                            description[i] = poly.get_description().trim();
                        }
                    }

                    if ( poly.get_insertion_type() == null ) {
                        seqviewer_type[i] = "polymorphism";
                    }
                    else if ( poly.get_insertion_type().
                                equalsIgnoreCase( "T-DNA" ) ) {
                        seqviewer_type[i] = "tdna";
                    }
                    else if ( poly.get_insertion_type().
                                equalsIgnoreCase( "transposant" ) ) {
                        seqviewer_type[i] = "tdna";
                    }
                    else {
                        seqviewer_type[i] = "polymorphism";
                    }

                    if ( poly.get_original_name() != null ) {
                        original_name[i] = poly.get_original_name();
                    }
                    else {
                        original_name[i] = " ";
                    }

                    checkForGermplasmsAndPhenotypes( i, conn, poly );
                }
            }
        }
    }

    private void checkForGermplasmsAndPhenotypes( int row, DBconnection conn, TfcPolymorphism poly )
    {
        this.hasGermplasms[row] = Boolean.FALSE;
        this.hasPhenotypes[row] = Boolean.FALSE;

        try
        {
            ElementCountCollection germplasmPhenotypeCounts =
                new ElementCountCollection( conn,
                                            poly.get_polymorphism_id(),
                                            ElementCountCollection.kPolymorphismParentType );

            ElementCount germplasmCount = germplasmPhenotypeCounts.get( ElementCountCollection.kGermplasmSearchType );
            if( germplasmCount != null && germplasmCount.getCount() > 0 )
            {
                this.hasGermplasms[row] = Boolean.TRUE;

                ElementCount phenotypeCount = germplasmPhenotypeCounts.get( ElementCountCollection.kPhenotypeSearchType );
                if( phenotypeCount != null && phenotypeCount.getCount() > 0 )
                {
                    this.hasPhenotypes[row] = Boolean.TRUE;
                }
            }
        }
        catch( SQLException exc )
        {
            ;
        }
    }

    private Boolean getHasGermplasms( int row )
    {
        return( this.hasGermplasms[row] );
    }

    private Boolean getHasPhenotypes( int row )
    {
        return( this.hasPhenotypes[row] );
    }

    private String getDescription( int row )  {
        return description[row];
    }

    private String getOriginalName( int row )  {
        return original_name[row];
    }

    // populates an array of strings that contain the formatted
    // chromosme value for display
    // chromo_ui[row in results ]
    // formats based on page request

    private void setChromosome() {

        chromosome = new String[results_length];

        for ( int i = 0; i < results_table.length; i ++ ) {
            if ( ( results_table[i][getIndex( "chromosome" )] ) != null ) {
                chromosome[i] =
                    Units.translateChromosome
                    ( results_table[i][getIndex( "chromosome" )] );
            }
        }
    }

    private String getChromosome( int row )  {
        return chromosome[row];
    }

    // populates an array of strings that contains the html link to seqviewer
    // for this map element if there is an AGI map or " "
    // if there isn't; seqviewer[row in results set ]
    // the string may conatin multiple links if multiple AGI chromosomes
    // exist for the element

    private void setSeqViewer( DBconnection conn )
        throws SQLException {

        seqviewer = new String[results_length];

        for ( int i = 0; i < results_table.length; i ++ ) {
            if ( ( results_table[i][getIndex( "map_element_id" )] )!=null ) {
                seqviewer[i] = HTMLFactory.createSeqViewerLinks
                    ( "seqview", getSeqViewerType( i ),
                      new Long
                      ( results_table[i][getIndex( "tair_object_id" )] ),
                      TfcMapElement.getAGIChromosomes
                      ( conn,
                        new Long
                        ( results_table[i][getIndex( "map_element_id" )] ) ),
                      "&nbsp;" );
            }
        }
    }

    private String getSeqViewer( int row )  {
        return seqviewer[row];
    }

    private String getSeqViewerType( int row )  {
        return seqviewer_type[row];
    }

    // populates an array of string arrays that contain the position + units
    // for a map
    // element id if assignment data is available
    // also, sets the seqviewer array with the tair object id needed for the
    // seqviewer link
    // include end position in the position string if this is for download
    // purposes

    private void setAssignmentData( DBconnection conn )
        throws SQLException {

        position = new String[results_length][];

        for ( int i = 0; i < results_table.length; i ++ ) {
            if ( ( results_table[i][getIndex( "map_element_id" )] )!= null ) {
                GlobalAssignmentCollection ac = new GlobalAssignmentCollection
                    ( conn, new Long
                      ( results_table[i][getIndex("map_element_id")] ) );
                position[i] = new String[ac.size()];
                Iterator iter = null;
                iter = ac.uniqueIterator();
                int counter = 0;
                String mapName = null;

                if ( iter != null ) {
                    while ( iter.hasNext() ) {
                        TfcGlobalAssignment assignment =
                            ( TfcGlobalAssignment ) iter.next();
                        mapName = ac.getMap( assignment );

                        if ( download ) {
                            position[i][counter] = mapName + ": " +
                                assignment.getFormatStartPosition() +
                                "-" +
                                assignment.getFormatEndPosition() +
                                " " + assignment.getUnits();
                        }
                        else {
                            position[i][counter] =
                                assignment.getFormatStartPosition() +
                                " " + assignment.getUnits();
                        }

                        counter ++;
                    }
                }
            }
        }
    }

    private String[] getPosition( int row )  {
        return position[row]; }

    // for each id build the polyObjCollection and FlankSeqVector,
    // add values into the various arrays,
    // repeat this for each row in the results table

    private void setAssocPolyData( DBconnection conn )
        throws SQLException {

        PolymorphismObjectCollection polymorphisms = null;
        FlankingSequenceVector flanking_sequences = null;
        pcr_primer = new String[results_length];
        allele_oligo = new String[results_length];
        flank_seq = new String[results_length];
        seq_variants = new String[results_length];
        dig_patterns = new String[results_length];
        pcr_prod_length = new String[results_length];

        for ( int i = 0; i < results_table.length; i ++ ) {
            String result = results_table[i][getIndex( "id" )];
            if ( result != null && !result.equals(" ") ) {
                // get polymorphismobjectcollection for each polymorphism id,
                // stored in the row data under seq_variant, dig_pattern,
                //  pcr_prod_length as lookup keys
                polymorphisms = new PolymorphismObjectCollection
                    ( conn,
                      new Long( results_table[i][getIndex( "id" )] ) ,
                      "poly" );
                polymorphisms.populateRestrictionEnzymes( conn );
                polymorphisms.populateSpeciesVariants( conn );

                setSeqVariantArray( i, polymorphisms );
                setDigPatternArray( i, polymorphisms );
                setPCRProdLengthArray( i,  polymorphisms );
            }
            else {
                // polulate the various arrays with an empty row since the
                // poly id was missing
                seq_variants[i] = " " ;
                dig_patterns[i] = " " ;
                pcr_prod_length[i] = " " ;
            }

            if ( !( results_table[i][getIndex( "map_element_id" )] ).
                 equals(" ") ) {
                // get flankingsequencevector for each poly's map_element_id,
                // stored in the row data under pcr_primer, allele_oligo,
                // and flank_seq as lookup keys
                flanking_sequences = new FlankingSequenceVector
                    ( conn,
                      new Long
                      (results_table[i][getIndex( "map_element_id" )] ) );
                setPCRPrimerArray ( i, flanking_sequences );
                setAlleleOligoArray ( i, flanking_sequences );
                setFlankSeqArray ( i, flanking_sequences );
            }
            else {
                // polulate the various arrays with an empty row since the
                //  map element id was missing
                pcr_primer[i] = " " ;
                allele_oligo[i] = " " ;
                flank_seq[i] = " " ;
            }
        }
    }

    // populates an array of string arrays that contain the pcr_primer,
    // [row in results ][ one list of semicolon delimited primers ]

    private void setPCRPrimerArray( int row,
                                    FlankingSequenceVector flankingSequences )
        throws SQLException {

        Iterator iter = null;
        TfcFlankingSequence sequence = null;
        StringBuffer pcr_primer_buffer = new StringBuffer( " " );

        if ( flankingSequences != null && flankingSequences.size() > 0 ) {
            iter = flankingSequences.get_flanking_sequences( "PCR_primer" );
            if ( iter != null ) {
                boolean first = true;

                while ( iter.hasNext() ) {
                    sequence = (TfcFlankingSequence) iter.next();

                    if ( !first ) {
                        pcr_primer_buffer.append( "; " );
                    }

                    if ( sequence.get_sequence1() != null ) {
                        pcr_primer_buffer.append( sequence.get_sequence1() );
                    }

                    if ( sequence.get_sequence2() != null ) {
                        pcr_primer_buffer.append( "; " +
                                                  sequence.get_sequence2() );
                    }

                    first = false;
                }
            }
        }

        pcr_primer[row] = pcr_primer_buffer.toString();
    }

    private String getPCRPrimers( int row )  {
        return pcr_primer[row]; }

    // populates an array of string arrays that contain the allele oligo,
    // [row in results ][ one list of semicolon delimitedallele oligos ]

    private void setAlleleOligoArray( int row,
                                      FlankingSequenceVector flankingSequences )
        throws SQLException {

        Iterator iter = null;
        TfcFlankingSequence sequence = null;
        StringBuffer oligo_buffer = new StringBuffer( " " );

        if ( flankingSequences != null && flankingSequences.size() > 0 ) {
            iter = flankingSequences.get_flanking_sequences( "allele_probe" );
            if ( iter != null ) {
                boolean first = true;

                while ( iter.hasNext() ) {
                    sequence = ( TfcFlankingSequence ) iter.next();

                    if ( !first ) {
                        oligo_buffer.append( "; " );
                    }

                    if ( sequence.get_sequence1() != null ) {
                        oligo_buffer.append( sequence.get_sequence1() );
                    }

                    if ( sequence.get_sequence2() != null ) {
                        oligo_buffer.append( "; " + sequence.get_sequence2() );
                    }

                    first = false;
                }
            }
        }

        allele_oligo[row] = oligo_buffer.toString();
    }

    private String getAlleleOligos( int row )  {
        return allele_oligo[row]; }

    // populates an array of string arrays that contain the flank sequences,
    // [row in results ][ one list of semicolon delimited flank sequences ]

    private void setFlankSeqArray( int row,
                                   FlankingSequenceVector flankingSequences )
        throws SQLException {

        Iterator iter = null;
        TfcFlankingSequence sequence = null;
        StringBuffer flank_seq_buffer = new StringBuffer( " " );

        if ( flankingSequences != null && flankingSequences.size() > 0 ) {
            iter = flankingSequences.get_flanking_sequences( "flank" );
            if ( iter != null ) {
                boolean first = true;

                while ( iter.hasNext() ) {
                    sequence = (TfcFlankingSequence) iter.next();

                    if ( !first ) {
                        flank_seq_buffer.append( "; " );
                    }

                    if ( sequence.get_sequence1() != null ) {
                        flank_seq_buffer.append( sequence.get_sequence1() );
                    }

                    if ( sequence.get_sequence2() != null ) {
                        flank_seq_buffer.append( "; " +
                                                 sequence.get_sequence2() );
                    }

                    first = false;
                }
            }
        }

        flank_seq[row] = flank_seq_buffer.toString();
    }

    private String getFlankSeqs( int row )  {
        return flank_seq[row]; }

    // populates an array of string arrays that contain the sequence variants,
    // [row in results ][ one list of semicolon delimited sequence variants ]

    private void setSeqVariantArray( int row,
                                     PolymorphismObjectCollection polymorphisms )
        throws SQLException {

        Iterator iter = null;
        PolymorphismObject poly = null;
        StringBuffer seq_var_buffer = new StringBuffer( " " );

        if ( polymorphisms != null && !polymorphisms.isEmpty() ) {
            iter = polymorphisms.iterator();

            if ( iter != null ) {
                boolean first = true;

                while ( iter.hasNext() ) {
                    if ( !first ) {
                        seq_var_buffer.append( "; " );
                    }
                    else {
                        first = false;
                    }
                    poly = (PolymorphismObject) iter.next();
                    Iterator subIter = poly.get_species_variants();

                    if ( subIter != null ) {
                        boolean subFirst = true;

                        while ( subIter.hasNext() ) {
                            if ( !subFirst ) {
                                seq_var_buffer.append( ", " );
                            }
                            else {
                                subFirst = false;
                            }

                            TfcSpeciesVariant variant =
                                ( TfcSpeciesVariant ) subIter.next();
                            seq_var_buffer.append
                                ( EmptyTextConverter.convert
                                  ( variant.get_abbrev_name() ) );
                        }
                    }

                    seq_var_buffer.
                        append( " " + " " + EmptyTextConverter.
                                convert( poly.get_lengths() ) +
                                " " +  EmptyTextConverter.convert
                                ( poly.get_units() ) + " " +
                                EmptyTextConverter.convert
                                ( poly.get_polymorphic_sequence() ) );
                }
            }
        }

        seq_variants[row] = seq_var_buffer.toString();
    }

    private String getSeqVariants( int row )  {
        return seq_variants[row]; }

    // populates an array of string arrays that contain the digest patterns,
    // [row in results ][ one list of semicolon delimited digest patterns ]

    private void setDigPatternArray( int row,
                                     PolymorphismObjectCollection polymorphisms )
        throws SQLException {

        Iterator iter = null;
        PolymorphismObject poly = null;
        StringBuffer dig_pattern_buffer = new StringBuffer( " " );

        if ( polymorphisms != null && !polymorphisms.isEmpty() ) {
            iter = polymorphisms.get_polymorphisms( "digest_pattern" );

            if ( iter != null ) {
                boolean first = true;

                while ( iter.hasNext() ) {
                    if ( !first ) {
                        dig_pattern_buffer.append( "; " );
                    }
                    else {
                        first = false;
                    }

                    poly = (PolymorphismObject) iter.next();

                    Iterator subIter = poly.get_species_variants();

                    if ( subIter != null ) {
                        boolean subFirst = true;

                        while ( subIter.hasNext() ) {
                            if ( !subFirst ) {
                                dig_pattern_buffer.append( ", " );
                            }
                            else {
                                subFirst = false;
                            }

                            TfcSpeciesVariant variant =
                                ( TfcSpeciesVariant ) subIter.next();
                            dig_pattern_buffer.append
                                ( EmptyTextConverter.convert
                                  ( variant.get_abbrev_name() ) );
                        }
                    }

                    dig_pattern_buffer.append( " " );

                    subIter = poly.get_restriction_enzymes();

                    if ( subIter != null ) {
                        boolean subFirst = true;

                        while ( subIter.hasNext() ) {
                            if ( !subFirst ) {
                                dig_pattern_buffer.append( ", " );
                            }
                            else {
                                subFirst = false;
                            }

                            PolymorphismRestrictionEnzyme enzyme =
                                ( PolymorphismRestrictionEnzyme )
                                subIter.next();
                            dig_pattern_buffer.append
                                ( EmptyTextConverter.convert
                                  ( enzyme.get_name() )  );
                        }
                    }

                    dig_pattern_buffer.append
                        ( " " +
                          EmptyTextConverter.convert( poly.get_lengths() ) +
                          " " +
                          EmptyTextConverter.convert( poly.get_units() ) );
                }
            }
        }

        dig_patterns[row] = dig_pattern_buffer.toString();
    }

    private String getDigPatterns( int row )  {
        return dig_patterns[row];
    }

    // populates an array of string arrays that contain the
    //  pcr_prod_length, [row in results ][ one list of semicolon
    // delimited pcr prod lengths ]

    private void setPCRProdLengthArray ( int row,
                                         PolymorphismObjectCollection polymorphisms )
        throws SQLException {

        Iterator iter = null;
        PolymorphismObject poly = null;
        boolean first = true;
        StringBuffer pcr_length_buffer = new StringBuffer( " " );

        if ( polymorphisms != null && !polymorphisms.isEmpty() ) {
            iter = polymorphisms.get_polymorphisms( "PCR_product_length" );

            if ( iter != null ) {
                while ( iter.hasNext() ) {
                    if ( !first ) {
                        pcr_length_buffer.append( "; " );
                    }
                    else {
                        first = false;
                    }

                    poly = (PolymorphismObject) iter.next();

                    Iterator subIter = poly.get_species_variants();

                    if ( subIter != null ) {
                        boolean subFirst = true;

                        while ( subIter.hasNext() ) {
                            if ( !subFirst ) {
                                pcr_length_buffer.append( ", " );
                            }
                            else {
                                subFirst = false;
                            }

                            TfcSpeciesVariant variant = ( TfcSpeciesVariant )
                                subIter.next();
                            pcr_length_buffer.append
                                ( EmptyTextConverter.convert
                                  ( variant.get_abbrev_name() ) );
                        }
                    }

                    pcr_length_buffer.append
                        ( " " +
                          EmptyTextConverter.convert( poly.get_lengths() ) +
                          " " +
                          EmptyTextConverter.convert( poly.get_units() ) );
                }
            }
        }

        pcr_prod_length[row] = pcr_length_buffer.toString();
    }

    private String getPCRProdLengths( int row )  {
        return pcr_prod_length[row];
    }

    /**
     * @param column_name The column name of the temp table to be checked
     * @return boolean representation of check for lookup column
     */

    public boolean isLookupColumn( String column_name ) {

        boolean is_lookup = false;

        for (int i = 0; i < getLookupColumns().length; i ++) {
            if (column_name.equals(getLookupColumns()[i])) is_lookup = true;
        }

        return is_lookup;
    }

    /**
     * @param row The integer representing the row of the table of data
     * @param column_name The String representing the column name of the
     * table of data
     * @param DBformat boolean representing whether we want data exactly how it is in the database
     * @return String representation of the compound data for the requested
     * cell as a comma-delimited string
     */

    public String getDataAsString( int row, String column_name, boolean DBformat) {

        StringBuffer data_string = new StringBuffer();

        if ( column_name.equals( "aliases" ) ) {
            for ( int i = 0; i < getAliases( row ).length; i ++ ) {
                if ( i > 0 ) {
                    data_string.append( ", " );
                }
                data_string.append(getAliases( row )[i] );
            }
        }

        if ( column_name.equals( "locus" ) ) {
            for ( int i = 0; i < getLoci(row).length; i ++ ) {
                if ( i > 0 ) {
                    data_string.append( ", " );
                }
                data_string.append( getLoci( row )[i] );
            }
        }

        if ( column_name.equals( "locus_id" ) ) {
            for ( int i = 0; i < getLociIDs( row ).length; i ++ ) {
                if ( i > 0) {
                    data_string.append( ", " );
                }
                data_string.append( getLociIDs( row )[i] );
            }
        }

        if( column_name.equals( "has_germplasms" ) )
        {
            data_string.append( getHasGermplasms(row) );
        }
        if( column_name.equals( "has_phenotypes" ) )
        {
            data_string.append( getHasPhenotypes(row) );
        }

        if ( column_name.equals( "description" ) ) {
            data_string.append( getDescription( row ) );
        }

        if ( column_name.equals( "original_name" ) ) {
            data_string.append( getOriginalName( row ) );
        }

        if ( column_name.equals( "chromo_ui" ) ) {
            data_string.append( getChromosome( row ) );
        }

        if ( column_name.equals( "seqviewer" ) ) {
            data_string.append( getSeqViewer( row ) );
        }

        if ( column_name.equals( "position" ) ) {
            for ( int i = 0; i < getPosition( row ).length; i ++ ) {
                if ( i > 0 ) {
                    data_string.append( ", " );
                }
                data_string.append( getPosition( row )[i] );
            }
        }

        if ( column_name.equals( "pcr_primer" ) ) {
            data_string.append( getPCRPrimers( row ) );
        }

        if ( column_name.equals( "allele_oligo" ) ) {
            data_string.append( getAlleleOligos( row ) );
        }

        if ( column_name.equals( "flank_seq" ) ) {
            data_string.append( getFlankSeqs( row ) );
        }

        if ( column_name.equals( "seq_variant" ) ) {
            data_string.append( getSeqVariants( row ) );
        }

        if ( column_name.equals( "dig_pattern" ) ) {
            data_string.append( getDigPatterns( row ) );
        }

        if ( column_name.equals( "pcr_prod_length" ) ) {
            data_string.append( getPCRProdLengths( row ) );
        }

        return  new String( data_string );
    }

    /**
     * @param row The integer representing the row of the table of data
     * @param column_name The String representing the column name of the
     * table of data
     * @return String array of the compound data for the requested cell,
     * row in sub-result set
     */

    public String[] getDataAsArray( int row, String column_name ) {

        if ( column_name.equals( "aliases" ) ) {
            lookup_data = getAliases( row );
        }

        if ( column_name.equals( "locus" ) ) {
            lookup_data = getLoci( row );
        }

        if ( column_name.equals( "locus_id" ) ) {
            lookup_data = getLociIDs( row );
        }

        if( column_name.equals( "has_germplasms" ) )
        {
            lookup_data = new String[1];
            lookup_data[0] = getHasGermplasms(row).toString();
        }
        if( column_name.equals( "has_phenotypes" ) )
        {
            lookup_data = new String[1];
            lookup_data[0] = getHasPhenotypes(row).toString();
        }

        if ( column_name.equals( "description" ) ) {
            lookup_data = new String[1];
            lookup_data[0] = getDescription( row );
        }

        if ( column_name.equals( "original_name" ) ) {
            lookup_data = new String[1];
            lookup_data[0] = getOriginalName( row );
        }

        if ( column_name.equals( "chromo_ui" ) ) {
            lookup_data = new String[1];
            lookup_data[0] = getChromosome( row );
        }

        if ( column_name.equals( "seqviewer" ) ) {
            lookup_data = new String[1];
            lookup_data[0] = getSeqViewer( row );
        }

        if ( column_name.equals( "pcr_primer" ) ) {
            lookup_data = new String[1];
            lookup_data[0] = getPCRPrimers( row );
        }

        if ( column_name.equals( "position" ) ) {
            lookup_data = getPosition( row );
        }

        if ( column_name.equals( "allele_oligo" ) ) {
            lookup_data = new String[1];
            lookup_data[0] = getAlleleOligos( row );
        }

        if ( column_name.equals( "flank_seq" ) ) {
            lookup_data = new String[1];
            lookup_data[0] = getFlankSeqs( row );
        }

        if ( column_name.equals( "seq_variant" ) ) {
            lookup_data = new String[1];
            lookup_data[0] = getSeqVariants( row );
        }

        if ( column_name.equals( "dig_pattern" ) ) {
            lookup_data = new String[1];
            lookup_data[0] = getDigPatterns( row );
        }

        if ( column_name.equals( "pcr_prod_length" ) ) {
            lookup_data = new String[1];
            lookup_data[0] = getPCRProdLengths( row );
        }

        return lookup_data;
    }

}
