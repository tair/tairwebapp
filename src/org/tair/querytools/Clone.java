//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.18 $
// $Date: 2004/04/05 22:43:43 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import org.tair.abrc.catalog.category.MutantSeedGeneAliasComparator;
import org.tair.bs.community.BsAttribution;
import org.tair.search.GeneModelLiteCollection;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcClone;
import org.tair.tfc.TfcTaxon;
import org.tair.tfc.TfcVector;

import com.poesys.bs.delegate.DelegateException;

/**
 * Clone extends <code>TfcClone</code> to present complete information
 * about a given clone. In addition to clone data, Clone contains associated
 * vector information,
 *
 * <p>
 * Clone also contains a collection of any loci, NT sequences and attributions 
 * clone is associated to. These collections are not populated through the 
 * constructor, but must be populated explicitly through the populateXXX 
 * methods.  This is done to avoid populating the collections when data is not
 * needed for display
 */

public class Clone extends TfcClone {
  
    // Vector associated w/clone
    private TfcVector vector;

    //Taxon associatd w/clone
    private TfcTaxon taxon;
    
    // Loci associated to clone - stored as Locus - this collection must 
    // be populated explicitly through the populateLocus() method
    private LocusCollection loci;


    // Nucleotide sequences associated w/Clone - 
    // stored as <code>TfcNucleotideSequence</code>. This collection
    // must be populated explicitly through the populateNTSequences method
    private NucleotideSeqCollection sequences;
  
    // Attributions associated w/clone - stored as AttributionObject objects
    // Collection must be populated explicitly through populateAttributions 
    // method
    private AttributionObjectCollection attributions;


    // Stocks associated w/clone - stored as StockObjects.
    // Collection must be populated explicitly through populateStocks method
    private StockCollection stocks;


    // genes for clone - stored as GeneModelLite
    private GeneModelLiteCollection genes;

    
    
    /**
     * Creates an empty instance of Clone
     */ 
    public Clone() {
        super();
        vector = new TfcVector();
	    taxon = new TfcTaxon();
    genes = null;
    }

  
    /**
     * Creates an instance of Clone to represent the data referenced by 
     * submitted clone id
     *
     * @param conn An active connection to the database
     * @param clone_id Clone id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public Clone( DBconnection conn, Long clone_id ) throws SQLException {
        super( conn, clone_id );
        populate( conn );
    }

    /**
     * Retrieve associated elements
     */
    private void populate( DBconnection conn ) throws SQLException {
        if ( super.get_vector_id() != null ) {
            vector = new TfcVector( conn, super.get_vector_id() );
        }
        if (super.get_taxon_id() != null ) {
            taxon = new TfcTaxon(conn, super.get_taxon_id() );
        }
    }

    /**
     * Populates clone's collection of NT sequences.  This is done separately
     * from constructor to avoid creating collection when it's not needed for 
     * display. This method assumes basic clone information has already been 
     * populated. NT sequence objects are created to contain all data on 
     * sequence except sequence text itself
     *
     * @param conn An active connection to the database
     * @throws SQLException thrown if a database error occurs
     */
    public void populateNTSequences( DBconnection conn ) throws SQLException {
        sequences = new NucleotideSeqCollection( conn, 
						 get_map_element_id(), 
						 false );
    }

    /**
     * Retrieves nucleotide sequences for clone
     *
     * @return Sequences associated with this clone as an <code>Iterator</code> 
     * of <code>TfcNucleotideSequence</code> objects, or <code>null</code> if 
     * no sequences for this clone
     */ 
    public Iterator get_sequences() {
        return hasNTSequences() ? sequences.iterator() : null;
    }

    /**
     * Determines if clone has NT sequences
     *
     * @return <code>true</code> if clone has NT sequences, or 
     * <code>false</code> if no NT sequences for clone
     */
    public boolean hasNTSequences() {
        return ( sequences != null && !sequences.isEmpty() );
    }


    /**
     * Retrieves attributions for clone
     *
     * @return Attributions for this clone as an <code>Iterator</code> of
     * <code>BsAttribution</code>s, or <code>null</code> if no attributions
     * for clone.
     */ 
    public List<BsAttribution> get_attributions() {
      List<BsAttribution> list = null;
        if ( attributions != null && !attributions.isEmpty() ) {
            list = attributions.getAttributions();
        }
        return list;
    }

    /**
     * Determines if clone has attributions
     *
     * @return <code>true</code> if clone has attributions, or 
     * <code>false</code> if no attributions for clone
     */
    public boolean hasAttributions() {
        return ( attributions != null && !attributions.isEmpty() );
    }

    /**
     * Populates clone's collection of attributions.  This is done separately
     * from constructor to avoid creating collection when it's not needed for 
     * display. This method assumes basic clone information has already been 
     * populated.
     *
     * @param conn An active connection to the database
     * @throws SQLException thrown if a database error occurs
     */
    public void populateAttributions( DBconnection conn ) throws SQLException {
        attributions = new AttributionObjectCollection( conn, 
							get_tair_object_id() );
    }


    /**
     * Populates clone's collection of associated loci.  This is done separately
     * from constructor to avoid creating collection when it's not needed for 
     * display. This method assumes basic clone information has already been
     * populated. Method to retrieve clone's loci should be specified by 
     * populationType (see LocusCollection for description of values for this
     * type param)
     *
     * @param conn An active connection to the database
     * @param populationType Population mode to use for getting clone's loci.
     * @throws SQLException thrown if a database error occurs
     */
    public void populateLocus( DBconnection conn, String populationType ) 
        throws SQLException {

        if ( get_map_element_id() != null ) {
            loci = new LocusCollection( conn, 
					get_map_element_id(), 
					populationType );
        }
    }


    /**
     * Determines if clone has associated loci.
     *
     * @return <code>true</code> if clone has associated loci, or 
     * <code>false</code> if no loci associated to clone
     */
    public boolean hasLocus() {
        return ( loci != null && !loci.isEmpty() );
    }

    /**
     * Retrieves all loci associated to clone
     *
     * @return Loci associated to clone as an <code>Iterator</code> of
     * <code>Locus</code> objects, or <code>null</code> if no loci associated
     * to clone
     */
    public Iterator getLocus() {
        return hasLocus() ? loci.iterator() : null;
    }


  /**
   * Retrieves attribution sources for clone as a single string
   * 
   * @return All sources for attributions in collection as a semicolon delimited
   *         string
   */
  public String get_attribution_source_string() {
    try {
      return attributions != null ? attributions.get_attribution_source_string()
          : null;
    } catch (SQLException e) {
      throw new DelegateException("Can't lazily load community for attribution",
                                  e);
    }
  }

    /**
     * Populates clone's collection of stocks
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs.
     */
    public void populateStocks( DBconnection conn ) throws SQLException {
        this.stocks = new StockCollection( conn, get_tair_object_id() );
    }

    /**
     * Determines if clone has associated stocks
     *
     * @return <code>true</code> if clone has associated stocks, or 
     * <code>false</code> if no stocks associated to clone
     */
    public boolean hasStocks() {
        return ( stocks != null && !stocks.isEmpty() );
    }

    /**
     * Retrieves stocks associated to clone
     *
     * @return Stocks associated to clone as an <code>Iterator</code> of 
     *  <code>StockObject</code>s, or <code>null</code> if no stocks associated
     *  to clone
     */
    public Iterator getStocks() {
        return hasStocks() ? stocks.iterator() : null;
    }


    /**
     * Determines if clone has associated genes.
     * 
     * @return <code>true</code> if clone has associated genes, or
     *         <code>false</code> if no loci associated to clone
     */
    public boolean hasGenes() {
        return ( genes != null && !genes.isEmpty() );
    }

    /**
     * Retrieves all genes associated to clone
     * 
     * @return Genes associated to clone as an <code>Iterator</code> of
     *         <code>GeneModelLite</code> objects, or <code>null</code> if
     *         no genes associated to clone
     */
    public Iterator getGenes() {
        return hasGenes() ? genes.iterator() : null;
    }
    
    public void populateGenes( DBconnection conn ) throws SQLException {
        // get genes for clone -- get full name gene aliases for display
        // of gene on germplasm detail page
        genes = new GeneModelLiteCollection( conn,
                                             get_map_element_id(),
                                             "map_element" );
        genes.populateGeneAliases( conn, new String[] { "full_name",
                                                       "alt_fullname" } );
        // sort gene aliases using custom comparator that sorts all "full name"
        // aliases before "alt full name" aliases - comparator written for
        // mutant seed category should already do this
        genes.sortGeneAliases(new MutantSeedGeneAliasComparator());
    }

    //
    // TfcVector wrappers
    //
    public Long get_vector_id() { 
        return ( vector != null ) ? vector.get_vector_id() : null;
    }

    public String get_vector_original_name() {
        return ( vector != null ) ? vector.get_original_name() : null;
    }

    public String get_vector_name() {
        return ( vector != null ) ? vector.get_name() : null;
    }

    public String get_vector_type() { 
        return ( vector != null ) ? vector.get_vector_type() : null;
    }

    public Float get_vector_length() { 
        return ( vector != null ) ? vector.get_length() : null;
    }

    public String get_vector_units() {
        return ( vector != null ) ? vector.get_units() : null;
    }

    public String get_vector_description() {
        return ( vector != null ) ? vector.get_description() : null;
    }

    public String get_vector_ic_accession() { 
        return ( vector != null ) ? vector.get_ic_accession() : null;
    }

    public String get_vector_origin_replication() {
        return ( vector != null ) ? vector.get_origin_replication() : null;
    }

    public String get_vector_polylinker() {
        return ( vector != null ) ? vector.get_polylinker() : null;
    }

    public String get_vector_selectable_markers() { 
        return ( vector != null ) ? vector.get_selectable_markers() : null;
    }

    public String get_vector_usage_type() { 
        return ( vector != null ) ? vector.get_usage_type() : null;
    }

    public String get_vector_promoter_info() { 
        return ( vector != null ) ? vector.get_promoter_info() : null;
    }

    public String get_vector_reporter_info() {
        return ( vector != null ) ? vector.get_reporter_info() : null;
    }

    public String get_vector_antibiotic_resistance() {
        return ( vector != null ) ? vector.get_antibiotic_resistance() : null;
    }

    /**
     * Retrieves all associated vector info. as a TfcVector object
     */
    public TfcVector getVector() {
        return vector;
    }
    
    /**
    * Retrives the taxon scientific name
    */
    public String get_scientific_name() {
        return ( taxon != null ) ? taxon.get_scientific_name() : null;
    }


    /**
     * For unit testing only
     */
    public void test() {
        super.test();
        System.out.println( "******* Clone content test ******" );
	System.out.println( "map_element_id: " + get_map_element_id() );
        if ( sequences != null && !sequences.isEmpty() ) {
            sequences.test();
        }

        if ( attributions != null && !attributions.isEmpty() ) {
            // attributions.test();
        }

        if ( vector != null ) {
            vector.test();
        }

        if ( hasLocus() ) {
            loci.test();
        }

	if ( hasGenes() ) {
	    genes.test();
	}
        System.out.println( "***** Clone content test end ****" );
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long id = new Long( 1001085192 );
            Clone clone = new Clone( conn, id );
	    clone.populateGenes(conn);
            clone.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }     
    }

}
  








