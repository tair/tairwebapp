//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.30 $
// $Date: 2006/09/26 21:58:33 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * GeneDetail is a composite class to represent all information associated 
 * with an entry in the Gene table for display on the gene detail page. 
 * GeneDetail contains instances of <code>TfcGene</code>, and collections 
 * of all genetic markers, and gene aliases associated with gene, in addition
 * to all information in <code>MapElementDetail</code> and 
 * <code>TairObjectDetail</code> superclasses.
 */


public class GeneDetail extends MapElementDetail {

    //taxon_id of Arabidopsis thaliana as opposed to any other species we might store genes for, we need just this one, becaure ATH is the only one we 
    //show additional information for, such as MapViewer links and SALK snp viewer links
    public static final long ATH_TAXON_ID=1;
    public static final long ALY_TAXON_ID = 500500021;
    private Long gene_id;

    private TfcGene gene;

    // Genetic markers associated with gene - stored as GeneticMarker
    private GeneticMarkerCollection markers;

    // Gene aliases - stored as TfcGeneAlias
    private GeneAliasCollection geneAliases;

    // Amino acid sequences for this gene - stored as AASequence objects
    private AASequenceCollection aaSequences;

    // Polymorphisms associated to loci for this gene - 
    // stored as PolymorphismObject
    private List polymorphisms;

    // Germplasms associated with this gene
    private Collection germplasms;

    // Loci associated to gene - stored as Locus
    private LocusCollection loci;

    //Collection of transposons associatd to the locus associated to the gene
    private TransposonCollection transposons;
    
    // Keywords associated to this gene - stored as KeywordType objects
    private KeywordTypeCollection keywords;

    // count of entries in TairObjKeyEvidence table for this tair_object_id
    private int annotationCount;

    // Symbols - stored as TfcSymbol
	private Collection<TfcSymbol> symbols;
	// a maps a polymorphism map_element_id to a gene_feature_site
    private Map gene_feature_sites;

    private DBconnection connection;
  
	private long total_germ_count;

	private long total_poly_count;

	private boolean loaded = false;

    /**
     * Creates an empty instance of GeneDetail
     */
    public GeneDetail() {  }
  
  
    /**
     * Creates an instance of GeneDetail to reflect the data 
     * referenced by submitted gene id.  
     *
     * @param conn An active connection to the database
     * @param gene_id Gene id to retrieve data for
     * @throws RecordNotFoundException if no entry found for id
     * @throws SQLException if a database error occurs
     */
    public GeneDetail( DBconnection conn, Long gene_id ) 
	throws RecordNotFoundException, SQLException {
	get_information( conn, gene_id );
    }
  
  
    /**
     * Creates an instance of GeneDetail to reflect the data
     * referenced by submitted gene name.
     * 
     * @param conn An active connection to the database
     * @param name Gene name to retrieve data for
     * @throws RecordNotFoundException if no entry found for name
     * @throws SQLException if a database error occurs
     */
    public GeneDetail( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, name );
    }

    /**
     * Determines whether gene has any associated symbols
     *
     * @return <code>true</code> if gene has associated symbol or 
     * <code>false</code> if no symbol is associated to this gene
     */
    public boolean hasSymbols() { 
        return ( symbols != null && !symbols.isEmpty() );
    }

   
    /**
     * Gets the symbols for this gene as an <code>Collection</code>
     * of <code>TfcSymbol</code> objects.
     *
     * @return a <code>Collection</code> of <code>TfcSymbol</code> objects
     */ 
    public Collection<TfcSymbol> get_symbols() {
        return ( hasSymbols() ) ? symbols : null;
    }

    /**
     * Determines whether gene has any associated gene aliases
     *
     * @return <code>true</code> if gene has associated gene aliases or 
     * <code>false</code> if no gene aliases associated to gene
     */
    public boolean hasGeneAliases() { 
        return ( geneAliases != null && !geneAliases.isEmpty() );
    }

   
    /**
     * Gets the gene aliases for this gene as an <code>Iterator</code>
     * of <code>TfcGeneAlias</code> objects.
     *
     * @return an <code>Iterator</code> of <code>TfcGeneAlias</code> objects
     */ 
    public Iterator get_gene_aliases() {
        return ( hasGeneAliases() ) ? geneAliases.iterator() : null;
    }
  
    /**
     * Retrieves all genes aliases for gene as a delimited string
     * 
     * @return All gene aliases for this gene as a semi-colon (";") delimited
     * string, or <code>null</code> if no gene aliases for this gene
     */
    public String get_gene_alias_string() {
        StringBuffer buffer = null;
        String aliases = null;
        Iterator iter = get_gene_aliases();
        boolean first = true;

        if ( iter != null ) {
            while ( iter.hasNext() ) {
                TfcGeneAlias gene_alias = (TfcGeneAlias) iter.next();
                String type = gene_alias.get_alias_type(); 
                if ( !( type.equals( "gene" ) || type.equals( "orf" ) ) ) {
                    continue;
                }
                String new_alias = gene_alias.get_original_alias();
                if ( new_alias != null && 
		     !new_alias.equals( gene.get_name() ) ) {

                    if ( buffer == null ) {
                        buffer = new StringBuffer();
                    }
                    if ( !first ) {
                        buffer.append( "; " );
                    }
                    buffer.append( new_alias );
                    first = false;
                }
            }
            if ( buffer != null ) {
                aliases = buffer.toString();
            }
        }
        return aliases;
    }

    //
    // TfcGene wrappers
    //
    public String get_gene_name() { 
	return gene.get_name(); 
    }
    //Lyrata gene names in Gbrowse are the Locus name. need to remove the ".1" version 
    // to get a Gbrowse to work.
    public String getGbrowseGeneName() { 
      String geneName = gene.get_name();
      if(is_ALY_taxon())
      {
    	  geneName = geneName.substring( 0, geneName.lastIndexOf('.'));
      }
      return geneName;   
    }
    
    public Boolean get_is_obsolete() { 
    	return gene.get_is_obsolete(); 
    }

    public String get_name_type() {
	return gene.get_name_type(); 
    }

    public String get_gene_model_type() {
	return gene.get_gene_model_type(); 
    }

    public String get_description() { 
	return gene.get_description(); 
    }
    
    public String getGbrowseChromosome() { 
	  String chromo =  gene.get_chromosome(); 
	  if(is_ALY_taxon())
	  {
		//just need the number at the end (i.e scaffold_8)
		chromo = chromo.substring(9);
	  }
	  else if(is_ATH_taxon())
	  {
	    chromo = "Chr" + chromo;
	  }
      return chromo;
    }

    public String get_chromosome() { 
	return gene.get_chromosome(); 
    }

    public java.util.Date get_date_last_modified() {
	return gene.get_date_last_modified(); 
    }

    public java.util.Date get_date_entered() { 
        return gene.get_date_entered();
    }
    
    public String get_original_name() { 
        return gene.get_original_name();
    } 

    public Long get_taxon_id()
    {
	    return gene.get_taxon_id();
    }

    public boolean is_ATH_taxon()
    {
      return isTaxon(this.ATH_TAXON_ID);
    }
    
    public boolean is_ALY_taxon()
    {
      return isTaxon(this.ALY_TAXON_ID);
    }
    
    public boolean isTaxon(Long taxonId)
    {
	  if (this.get_taxon_id() == null ) { 
	    return false;
	  } else { 
	    return this.get_taxon_id().longValue() == taxonId;
	  }	
    }
    
    public String getGbrowseSource() 
    {
     String source = "";
	 if(get_is_agi_map()) source = "arabidopsis"; 
	 if(get_is_aly_map()) source = "gb_ensembl_alyrata";
	 return source;
	}

    /*
     * Determines whether gene has any associated genetic markers
     *
     * @return <code>true</code> if gene has associated genetic markers or 
     * <code>false</code> if no genetic markers associated to gene
     */
    public boolean hasGeneticMarkers() { 
        return ( markers != null && !markers.isEmpty() ); 
    }

  

    /**
     * Retrieves all genetic markers associated with this gene
     *
     * @return Genetic_markers associated with this gene as an
     * <code>Iterator</code> of <code>GeneticMarker</code> objects
     * or <code>null</code> if no genetic markers for this gene
     */ 
    public Iterator get_genetic_markers() {
        return ( hasGeneticMarkers() ) ? markers.iterator() : null;
    }

    /*
     * Determines whether gene has any associated amino acid sequences
     *
     * @return <code>true</code> if gene has associated amino acid sequences or 
     * <code>false</code> if no amino acid sequences associated to gene
     */
    public boolean hasAASequences() { 
        return ( aaSequences != null && !aaSequences.isEmpty() ); 
    }

  

    /**
     * Retrieves all amino acid sequences for this gene
     *
     * @return Amino acid sequences for this gene as an <code>Iterator</code> of 
     * <code>AASequence</code> objects, or <code>null</code> if aa sequences 
     * have not been initialized or if no aa sequences exist for gene
     */
    public Iterator getAASequences() {
        return ( hasAASequences() ) ? aaSequences.iterator() : null;
    }


    /**
     * Determines whether gene has any polymorphisms associated through loci of
     * gene
     *
     * @return <code>true</code> if gene has associated polymorphisms, 
     * associated through loci of gene or <code>false</code> if no polymophisms 
     * associated to gene's loci
     */
    public boolean hasPolymorphisms() { 
        return ( polymorphisms != null && !polymorphisms.isEmpty() );
    }

	public List getPolymorphisms(){
		return polymorphisms;
	}

    /**
     * Determines whether gene has any germplasms associated with this gene
     *
     * @return <code>true</code> if gene has associated germplasms,
     * <code>false</code> if no germplasms are
     * associated with this gene
     */
    public boolean hasGermplasms() {
        return ( germplasms != null && !germplasms.isEmpty() );
    }

    /**
     * Retrieves germplasms associated with this gene
     *
     * @return Germplasms associated with this gene as as an
     * <code>Iterator</code> of <code>GermplasmDetail</code>s or
     * <code>null</code> if no germplasms are associated with this gene
     */
    public Iterator getGermplasmsIterator() {
        return ( hasGermplasms() ) ? germplasms.iterator() : null;
    }

    /**
     * Retrieves germplasms associated with this gene 
     *
     * @return Germplasms associated with this gene as as an
     * <code>Vector</code> of <code>GermplasmDetail</code>s or an empty
     * <code>Vector</code> if no germplasms are associated with this gene 
     */
    public Collection getGermplasms() {
        return ( hasGermplasms() ) ? germplasms : new Vector();
    }

    /**
    * Determines whether there are any transposons associated with the loci
    * associated with this gene
    *
    * @return <code>true</code> if there are transposons
    */
    public boolean hasTransposons() {
        return (transposons != null && !transposons.isEmpty() );
    }
    
    /**
    * Retrieves an Iterator of the transposons associted with the loci 
    * asssociatd with this gene
    *
    * @return an Iterator over the Transposons associted with the loci that are
    * associated with the gene as an <code>Iterator</code> of <code>TransposonDetail</code>
    * or <code>null</code> if no transposons are associated
    */
    public Iterator getTransposonsIterator() {
        return (hasTransposons() ) ? transposons.iterator() : null;
    }
    
    
    /**
     * Retrieves all keywords associated to locus via associated gene models
     *
     * @return All keywords grouped by keyword type associated to this locus 
     * as an <code>Iterator</code> of <code>KeywordType</code> objects, or 
     * <code>null</code> if no keywords associated with locus.
     *
     * @see KeywordType
     */ 
    public Iterator getKeywords() {
        return ( hasKeywords() ) ? keywords.iterator() : null;
    }

    /**
     * @return <code>true</code> if gene has keywords 
     * or <code>false</code> if no keywords exist
     */
    public boolean hasKeywords() { 
        return ( keywords != null && !keywords.isEmpty() );
    }

    /**
     * Determines whether gene has any associated loci
     *
     * @return <code>true</code> if gene has associated loci, or
     * <code>false</code> if no loci associated to gene
     */
    public boolean hasLocus() {
        return ( loci != null && !loci.isEmpty() );
    }


    /**
     * Retrieves loci associated to gene
     * 
     * @return Loci associated to gene as an <code>Iterator</code> of 
     * <code>Locus</code> objects, or <code>null</code> if no loci associated
     * to gene
     */
    public Iterator get_locus() {
        return( hasLocus() ) ? loci.iterator() : null;
    }
    
    public Long getSpan_start_position() {
	Iterator it = get_locus();
		if(it == null)
			return null;
	Locus locus = (Locus) it.next();
    	return locus.getSpan_start_position();
	}
	
	public Long getSpan_end_position() {
	Iterator it = get_locus();
		if(it == null)
			return null;
	Locus locus = (Locus) it.next();
    	return locus.getSpan_end_position();
	}
   
    /**
     * calculates span for all gene models at the locus
     *
     */
/*    public void populateSpan(DBconnection connection) throws SQLException
    {
	Iterator it = get_locus();
		if(it == null)
			return;
	Locus locus = (Locus) it.next();
    	locus.populateSpan(this.connection, locus.get_locus_id());  	
    }*/

	public void get_information(DBconnection conn, String name) throws RecordNotFoundException, SQLException {
		this.gene_id = TfcGene.retrieveGeneID( conn, name );
	    if (this.gene_id == null ) { throw new RecordNotFoundException ( name  + " is not found " ); } 
    }

	public void get_information(DBconnection conn, Long gene_id) throws RecordNotFoundException, SQLException {
		this.gene_id = gene_id;
	    if (this.gene_id == null ) { throw new RecordNotFoundException ( "geneID : " + gene_id  + " is not found " ); } 
	}

	public void load(DBconnection conn, long germLimit, long polyLimit ) throws RecordNotFoundException, SQLException {

        gene = new TfcGene( conn, gene_id );
        super.populateBaseObject( gene );
    
        // get gene aliases, protein sequences and polymorphisms
        if ( gene.get_gene_id() != null ) {
	    symbols = TfcGeneSymbolReference.symbols_for_gene( conn,
							       gene.get_gene_id() );
	    
            geneAliases = new GeneAliasCollection( conn, 
						   gene.get_gene_id() );
	    
            aaSequences = new AASequenceCollection( conn, 
						    gene.get_gene_id(), 
						    false ); 
	    

        //This is pretty hacky.  Deal with it.
        List poly_set = PolymorphismInfo.getGenePolymorphisms(conn, gene_id, polyLimit);
        polymorphisms = (List)poly_set.get(0);
        this.total_poly_count = ((Long)poly_set.get(1)).longValue();

            gene_feature_sites = getFeatureSites(conn, gene_id);
        }

        germplasms = getGermplasmCollection(conn, gene_id, germLimit);
 
	// get genetic marker & locus
	markers = new GeneticMarkerCollection( conn, 
					       gene.get_map_element_id() );

	loci = new LocusCollection( conn, get_map_element_id() );

    //populate the transposons associated with
    transposons = new TransposonCollection( conn, gene_id, "gene");
    
    // get annotation count to know whether to display a link to 
	// annotation summary page
        if ( gene.get_tair_object_id() != null ) {
            keywords = new KeywordTypeCollection( conn, 
						  gene.get_tair_object_id(), 
						  "Gene" );
        } 
    
	// populate superclass data
	getMapElementInformation( conn );
	getTairObjectInformation( conn );

		if(get_is_agi_map()){
			Iterator it = get_locus();
			Locus locus = it == null ? null : (Locus) it.next();
			if(locus != null)
				locus.populateSpan(conn, locus.get_locus_id());
		}

		loaded = true;
    }

	public boolean hasLoaded(){
		return loaded;
	}

    /**
     * Finds the gene_feature_site for all the polymorphisms linked to
     * every gene that is linked to this locus
     *
     * @return A Map of the gene_feature_sites with the polymorphism's
     *         map_element_id as keys
     */
    private Map getFeatureSites(DBconnection conn, Long gene_id) throws SQLException
    {
        String query = "SELECT map_element_id, gene_feature_site FROM Gene_MapElement WHERE gene_id = " + gene_id.toString();
        conn.setQuery( query );
        HashMap m = new HashMap();
        ResultSet rs = conn.getResultSet();
        while(rs.next())
           m.put(new Long(rs.getLong(1)),rs.getString(2));

        return m;
    }

    /**
     * Get the gene_feature_site of a polymorphism associated with this locus
     *
     * @param poly_id The id of the polymorphism 
     *
     * @return Return the gene_feature_site, as a String, of the polymorphism
     *         with id <code>poly_id</code>
     */
    public String get_gene_feature_site(Long poly_id)
    {
        return gene_feature_sites != null ? (String) gene_feature_sites.get(poly_id) : null;
    }

    /**
     * Overrides method in superclass so that only first 10 of publications
     * associated to gene are retrieved. This is done to avoid displaying
     * the full list of publications when so many are associated to gene
     * as to make display unwieldly.
     * 
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id of gene to retrieve publications
     * for
     * @throws SQLException if a database error occurs
     */
    protected void populatePublications( DBconnection conn, 
					 Long tair_object_id )
	throws SQLException {

	publications = new PublicationObjectCollection( conn,
							tair_object_id,
							"tair_object",
							true );
    }

     /**
     * Finds the germplasms that are linked to this gene through the
     * Germplasm_MapElement table.
     * 
     * @param conn An active connection to the database
     * @param map_element_id The map element id of this gene
     * @throws SQLException if a database error occurs
     */
    private Collection getGermplasmCollection( DBconnection conn, Long gene_id, long germLimit ) throws SQLException
    {
		List germs = new ArrayList();
		Collection ids = new TairObjIdCollection(conn, gene_id, TairObjIdCollection.GERMPLASM_GENE_ALL);
		Iterator itr = ids.iterator();
		while (itr.hasNext() && this.total_germ_count++ < germLimit)
			germs.add(new GermplasmInfo(conn,((Long) itr.next())));
		this.total_germ_count = ids.size();
		return germs;
    }

	public long getPolymorphismCount() {
		return total_poly_count;
	}

	public long getGermplasmCount() {
		return total_germ_count;
	}

    /**
     * For unit testing only
     */    
    public void test() {
        super.test();
        System.out.println( "****** GeneDetail content test ******" );

        if ( gene != null ) {
            gene.test();
        }

        if ( hasGeneticMarkers() ) {
            markers.test();
        }

	System.out.println( "****** Symbol content test ******" );
	for ( TfcSymbol symbol : symbols ) {
	    System.out.println( "symbol: " + symbol );
	}
	System.out.println( "****** Symbol content test end ******" );

        if ( hasGeneAliases() ) {
            geneAliases.test();
        }
    
        if ( hasAASequences() ) {
            aaSequences.test();
        }

        if ( hasPolymorphisms() ) {
            //polymorphisms.test();
        }

        if ( hasLocus() ) {
            loci.test();
        }

        if ( hasTransposons() ){
            transposons.test();
        }
        System.out.println( "**** GeneDetail content test end ****" );
    }



    /**
     * For unit testing only
     */

    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();

            Long id = new Long( 138512 );

            GeneDetail gene = new GeneDetail( conn, id );
            gene.test();
            id = new Long( 430247 );
            gene = new GeneDetail( conn, id );
            gene.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
        
    }

}
