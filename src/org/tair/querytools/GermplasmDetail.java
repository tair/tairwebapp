//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.20 $
// $Date: 2006/01/26 23:49:28 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import org.tair.bs.community.BsAttribution;
import org.tair.search.GeneModelLite;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAlias;
import org.tair.tfc.TfcGermplasm;
import org.tair.tfc.TfcSpeciesVariant;
import org.tair.tfc.TfcSymbol;
import org.tair.tfc.TfcTaxon;
import org.tair.utilities.EmptyTextConverter;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.Utils;
import org.tair.utilities.comparators.TfcAliasComparator;

/**
 * GermplasmDetail is a composite class to represent all information
 * associated with an entry in the Germplasm table for display on the
 * germplasm detail page. GermplasmDetail contains germplasm info,
 * data on the germplasm's associated taxon, species variant, collections
 * of associated polymorphisms, clones, stocks and other germplasms
 * in addition to all information in the <code>TairObjectDetail</code>
 * superclass.
 */

public class GermplasmDetail extends TairObjectDetail {

    private TfcGermplasm germplasm;

    private TfcTaxon taxon;

    private TfcSpeciesVariant speciesVariant;

    // associated polymorphisms - stored as GermplasmPolymorphism, which
    // inherits from PolymorphismObject.  This extended class is used so that
    // join data between polymorphism & germplasm can be displayed along
    // with polymorphism's associated locus info.
    private PolymorphismObjectCollection polymorphisms;

    // collection of parents for this germplasm - stored as Pedigree objects
    private PedigreeCollection parents;

    // collection of children for this germplasm - stored as Pedigree objects.
    // This collection will always be limited to contain only the maximum number
    // of children to display on the page - see docs in PedigreeCollection for
    // details
    private PedigreeCollection children;

    // collection of clones for germplasm - stored as Clone objects -
    // clones in collection will be created to contain associated locus info.
    private CloneCollection clones;

    // Collection of stocks directly associated to germplasm - each stock
    // in collection will have collections of member stocks (if stock is itself
    // a stock pool or set) and any stock pools or sets stock is a member of
    // Objects stored as StockObject
    private StockCollection stocks;

    // Phenotypes for a given germplasm (the relationship is many-to-many).
    // Note that we will be storing Phenotype 'band' objects which derive
    // from the 'core' TfcPhenotype class.
    // When there are no phenotypes we have an empty collection
    // rather than a null one (just like e.g. stocks).
    private PhenotypeCollection phenotypes;


    public GermplasmDetailLite det;

    /**
     * Creates an empty instance of GermplasmDetail
     */
    public GermplasmDetail() {
        germplasm = new TfcGermplasm();
    }



    /**
     * Creates an instance of GermplasmDetail that represents the data
     * associated to the submitted tair_object_id.
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id to retrieve data
     * @throws RecordNotFoundException if no entry found for tair_object_id.
     * @throws SQLException if a database error occurs
     */
    public GermplasmDetail( DBconnection conn, Long tair_object_id )
     throws SQLException {

     get_information( conn, tair_object_id );
    }


    /**
     * Creates an instance of GermplasmDetail that represents the data
     * associated to the submitted germplasm name.
     *
     * @param conn An active connection to the database
     * @param name Germplasm name to retrieve data for
     * @throws RecordNotFoundException if no entry found for name
     * @throws SQLException if a database error occurs
     */
    public GermplasmDetail( DBconnection conn, String name )
     throws RecordNotFoundException, SQLException {

     get_information( conn, name );
    }


    /**
     * Retrieves data for submitted germplasm name and stores in member objects
     *
     * @param conn An active connection to the database
     * @param name Name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name )
     throws RecordNotFoundException, SQLException {

     Long id = TfcGermplasm.retrieveTairObjectID( conn, name );

     if ( id == null ) {
         throw new RecordNotFoundException( "No germplasm found " +
                                "with name: " + name );
     }

     get_information( conn, id );
    }



    /**
     * Retrieves data for submitted tair object id and stores in member objects
     *
     * @param conn An active connection to the database
     * @param tair_object_id ID to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, Long tair_object_id )
     throws RecordNotFoundException, SQLException {

	this.det = 
	    new GermplasmDetailLite(conn, tair_object_id);


     // will throw exception if invalid id
        germplasm =
         new TfcGermplasm( conn, tair_object_id );
        super.populateBaseObject( germplasm );

     // populate super class data
        getTairObjectInformation( conn );

        if ( get_germplasm_id() != null ) {
         // polymorphisms will be created as GermplasmPolymorphism objects
         // (which inherit from PolymorphismObject to show join, gene &
         // locus info.
            polymorphisms =
          new PolymorphismObjectCollection( conn,
                                get_germplasm_id(),
                                "germplasm" );


            // get associated loci for clones using germplasm specific logic
            // that uses clone's associated genes to get loci
            clones = new CloneCollection( conn,
                           get_germplasm_id(),
                           "germplasm" );
            clones.populateLocus( conn, "germplasm_clone" );


            // get parents of this germplasm along w/associated locus
            // data for each
            boolean getParents = true;
            parents = new PedigreeCollection( conn,
                               get_germplasm_id(),
                               getParents );
            parents.populateLocus( conn );
	    parents.populatePedigreeSpeciesVariants( conn );

            // get children of this germplasm along w/ associated locus
            // data for each
            getParents = false;
            children = new PedigreeCollection( conn,
                                get_germplasm_id(),
                                getParents );
            children.populateLocus( conn );
	    children.populatePedigreeSpeciesVariants( conn );
        }

        if ( get_taxon_id() != null ) {
            taxon = new TfcTaxon( conn, get_taxon_id() );
        }

        if ( get_species_variant_id() != null ) {
            speciesVariant = new TfcSpeciesVariant( conn,
                                  get_species_variant_id() );
        }

        // get stocks directly associated to germplasm
        stocks = new StockCollection( conn, get_tair_object_id() );

        // get member stocks for each stock in collection
        stocks.populateMemberStocks( conn );

        // get parent stocks for each stock in collection
        stocks.populateParentStocks( conn );

        // get stock donors for each stock in collection
        stocks.populateDonors( conn );

	// populate the detail information for each stock in collection
	stocks.populateDetails( conn );



	// populate the detail information for the member and parent stocks
	Iterator stockIter = getStocks();
	while (stockIter != null && stockIter.hasNext()) {
	    StockObject stock = (StockObject) stockIter.next();
	    Map stockInfo = new HashMap();

	    if ( stock.hasMemberStocks() ) {
		Iterator memberIter = stock.getMemberStocks();
		while (memberIter.hasNext()) {
		    StockObject member = (StockObject) memberIter.next();
		    member.populateDetails( conn );
		}
	    }

	    if ( stock.hasParentStocks() ) {
		Iterator parentIter = stock.getParentStocks();
		while ( parentIter.hasNext() ) { 
		    StockObject parent = (StockObject) parentIter.next();
		    parent.populateDetails( conn );
		}
	    }
		    
	}




        // get phenotypes, if any, for given germplasm.
        phenotypes = new PhenotypeCollection( conn, get_germplasm_id() );
    }

    //
    // TfcGermplasm wrappers
    //

    public Long get_germplasm_id() {
     return germplasm.get_germplasm_id();
    }

    public Long get_species_variant_id() {
     return germplasm.get_species_variant_id();
    }

    public String get_name() {
     return germplasm.get_name();
    }

    public String get_germplasm_type() {
     return germplasm.get_germplasm_type();
    }

    public Boolean get_has_foreign_dna() {
     return germplasm.get_has_foreign_dna();
    }

    public Boolean get_is_mutant() {
     return germplasm.get_is_mutant();
    }

    public Boolean get_has_polymorphisms() {
     return germplasm.get_has_polymorphisms();
    }

    public Boolean get_is_natural_variant() {
     return germplasm.get_is_natural_variant();
    }

    public Boolean get_is_mapping_strain() {
     return germplasm.get_is_mapping_strain();
    }

    public String get_special_growth_conditions() {
     return germplasm.get_special_growth_conditions();
    }

    public String get_ploidy() {
     return germplasm.get_ploidy();
    }

    public String get_mutagen() {
     return germplasm.get_mutagen();
    }

    public String get_description() {
     return germplasm.get_description();
    }

    public Boolean get_is_aneuploid() {
     return germplasm.get_is_aneuploid();
    }

    public Integer get_aneuploid_chromosome() {
     return germplasm.get_aneuploid_chromosome();
    }

    public Boolean get_is_obsolete() {
     return germplasm.get_is_obsolete();
    }

    public java.util.Date get_date_last_modified() {
     return germplasm.get_date_last_modified();
    }

    public Long get_taxon_id() {
     return germplasm.get_taxon_id();
    }

    public java.util.Date get_date_entered() {
     return germplasm.get_date_entered();
    }

    public String get_original_name() {
     return germplasm.get_original_name();
    }


    //
    // TfcTaxon wrappers
    //

    public String get_genus() {
     return ( taxon != null ) ? taxon.get_genus() : null;
    }

    public String get_species() {
     return ( taxon != null ) ? taxon.get_species() : null;
    }

    public String get_division_code() {
     return ( taxon != null ) ? taxon.get_division_code() : null;
    }

    public String get_scientific_name() {
     return ( taxon != null ) ? taxon.get_scientific_name() : null;
    }

    public String get_common_name() {
     return ( taxon != null ) ? taxon.get_common_name() : null;
    }

    public String get_taxonomy() {
     return ( taxon != null ) ? taxon.get_taxonomy() : null;
    }

    public String get_genbank_taxonomy_id() {
     return ( taxon != null ) ? taxon.get_genbank_taxonomy_id() : null;
    }

    //
    // TfcSpeciesVariant wrappers
    //
    public String get_species_variant_type() {
     return ( speciesVariant != null ) ? speciesVariant.get_speciesvariant_type() : null;
    }

    public String get_species_variant_name() {
     return ( speciesVariant != null ) ? speciesVariant.get_name() : null;
    }

    public String get_species_variant_original_name() {
     return ( speciesVariant != null ) ?
         speciesVariant.get_original_name() : null;
    }

    public String get_species_variant_abbrev_name() {
     return ( speciesVariant != null ) ?
         speciesVariant.get_abbrev_name() : null;
    }

    public String get_species_variant_accession_number() {
     return ( speciesVariant != null ) ?
         speciesVariant.get_accession_number() : null;
    }

    public String get_species_variant_base_name() {
     return ( speciesVariant != null ) ?
         speciesVariant.get_base_name() : null;
    }

    public String get_species_variant_location() {
     return ( speciesVariant != null ) ?
         speciesVariant.get_location() : null;
    }

    public String get_species_variant_country() {
     return ( speciesVariant != null ) ?
         speciesVariant.get_country() : null;
    }

    public String get_species_variant_habitat() {
     return ( speciesVariant != null ) ?
         speciesVariant.get_habitat() : null;
    }

    public String get_min_altitude() {
     return ( speciesVariant != null ) ?
         speciesVariant.get_min_altitude() : null;
    }

    public String get_max_altitude() {
     return ( speciesVariant != null ) ?
         speciesVariant.get_max_altitude() : null;
    }

    public String get_min_longitude() {
     return ( speciesVariant != null ) ?
         speciesVariant.get_min_longitude() : null;
    }

    public String get_max_longitude() {
     return ( speciesVariant != null ) ?
         speciesVariant.get_max_longitude() : null;
    }

    public String get_min_latitude() {
     return ( speciesVariant != null ) ?
         speciesVariant.get_min_latitude() : null;
    }

    public String get_max_latitude() {
     return ( speciesVariant != null ) ?
         speciesVariant.get_max_latitude() : null;
    }

    public java.util.Date get_species_variant_date_collected() {
     return ( speciesVariant != null ) ?
         speciesVariant.get_date_collected() : null;
    }

    public String get_monthly_precipitation() {
     return ( speciesVariant != null ) ?
         speciesVariant.get_monthly_precipitation() : null;
    }

    public String get_daily_temperature() {
     return ( speciesVariant != null ) ?
         speciesVariant.get_daily_temperature() : null;
    }

    public String get_num_plants() {
     return ( speciesVariant != null ) ?
         speciesVariant.get_num_plants() : null;
    }

    public String get_species_variant_format_name() {
     return ( speciesVariant != null ) ?
         speciesVariant.get_format_name() : null;
    }


    /**
     * Determines whether germplasm has any stocks associated directly to it
     *
     * @return <code>true</code> if germplasm has stocks directly associated
     * to it or <code>false</code> if no stocks associated, or if object has
     * not yet been populated
     */
    public boolean hasStocks() {
        return ( stocks != null && !stocks.isEmpty() );
    }


    /**
     * Retrieve stocks directly associated to germplasm
     *
     * @return Stocks associated to germplasm as an <code>Iterator</code>
     * of <code>StockObject</code> objects, or <code>null</code> if no
     * stocks associated to germplasm
     */
    public Iterator getStocks() {
        return ( hasStocks() ) ? stocks.iterator() : null;
    }


    /**
     * Determines whether germplasm record has parent germplasms associated
     * to it
     *
     * @return <code>true</code> if germplasm has parents, <code>false</code>
     * if no parents associated to germplasm
     */
    public boolean hasParents() {
        return ( parents != null && !parents.isEmpty() );
    }

    /**
     * Retrieves parents of this germplasm
     *
     * @return Parents of germplasm as an <code>Iterator</code> of
     * <code>Pedigree</code> objects, or <code>null</code> if no parents for
     * this germplasm
     */
    public Iterator getParents() {
        return ( hasParents() ) ? parents.iterator() : null;
    }


    /**
     * Determines whether germplasm record has child germplasms associated
     * to it
     *
     * @return <code>true</code> if germplasm has children, <code>false</code>
     * if no children associated to germplasm
     */
    public boolean hasChildren() {
        return ( children != null && !children.isEmpty() );
    }

    /**
     * Retrieves children of this germplasm.  Children collection will never
     * contain more items than the maximum number allowed for display on the
     * germplasm detail page.  This is done to allow for the large number of
     * children for some parents. If the collection has been abbreviated due
     * to a large number of children, the childrenAbbreviated method will return
     * <code>true</code>.  The total number of children associated to this
     * germplasm can always be retrieved using the getTotalNumberChildren
     * method.
     *
     * @return Children of germplasm as an <code>Iterator</code> of
     * <code>Pedigree</code> objects, or <code>null</code> if no children for
     * this germplasm
     */
    public Iterator getChildren() {
        return ( hasChildren() ) ? children.iterator() : null;
    }

    /**
     * Determines whether the collection of children for this germplasm has been
     * abbreviated. This will be true if the number of children exceeds the
     * maximum number allowed for display (as determined in PedigreeCollection).
     * If this is true, the total number of children associated to this
     * germplasm can be retrieved using the getTotalNumberChildren method
     *
     * @return <code>true</code> if collection of child germplasms has been
     * abbreviated due to a large number of children; <code>false</code> if the
     * collection contains all children for the germplasm.
     */
    public boolean childrenAbbreviated() {
        return ( hasChildren() && children.isAbbreviated() );
    }

    /**
     * Retrieves the total number of children associated to this germplasm. This
     * number will be greater than the number of children objects actually
     * contained in germplasm's collection of children if the number exceeds
     * the maximum number allowed for display (as determined in
     * PedigreeCollection).
     *
     * @return Number of child germplasms associated to this germplasm.
     */
    public int getTotalNumberChildren() {
        return hasChildren() ? children.getTotalNumberChildren() : 0;
    }

    /**
     * Retrieves the number of children associated to this germplasm that
     * actually are contained as Pedigree objects in germplasms collection of
     * children.  If children collection has been abbreviated, this value
     * should always equal the maximum number allowed for display (as determined
     * in PedigreeCollection)
     *
     * @return The number of children actually in germplasm's collection of
     * children. This number may be different than the value from
     * getTotalNumberChildren is childrenAbbreviated is <code>true</code>
     */
    public int getChildrenSize() {
        return hasChildren() ? children.size() : 0;
    }

    /**
     * Determines if any clone object has data for the "Locus Name"
     * field. This info. can be used at the JSP level to determine whether to
     * show the "Locus Name" column when displaying the entire collection.
     * 
     * @return <code>true</code> if at least one element in collection has a
     *         non-null value for Locus Name
     */
    public boolean clonesHaveLocusNameColumn() {
        return hasClones() ? clones.hasLocusName() : false;
    }

    /**
     * Determines if any clone object has data for the "Construct Type"
     * field. This info. can be used at the JSP level to determine whether to
     * show the "Construct Type" column when displaying the entire collection.
     * 
     * @return <code>true</code> if at least one element in collection has a
     *         non-null value for Construct Type
     */
    public boolean clonesHaveConstructTypeColumn() {
        return hasClones() ? clones.hasConstructType() : false;
    }

    /**
     * Determines if any clone object has data for the "Vector Name"
     * field. This info. can be used at the JSP level to determine whether to
     * show the "Vector Name" column when displaying the entire collection.
     * 
     * @return <code>true</code> if at least one element in collection has a
     *         non-null value for Vector Name
     */
    public boolean clonesHaveVectorNameColumn() {
        return hasClones() ? clones.hasVectorName() : false;
    }


    /**
     * Determines if any of parents associated to germplasm have data for the
     * "parent_gender" field.  This info. can be used at the JSP level to
     * determine whether to show the gender column when displaying parents
     *
     * @return <code>true</code> if at least one parent has a non-null value
     *  for parent gender
     */
    public boolean parentsHaveParentGenderData() {
        return hasParents() ? parents.hasParentGenderData() : false;
    }

    /**
     * Determines if any of parents associated to germplasm have data for the
     * "generation" field.  This info. can be used at the JSP level to determine
     * whether to show the generation column when displaying parents
     *
     * @return <code>true</code> if at least one parent has a non-null value
     *  for generation
     */
    public boolean parentsHaveGenerationData() {
        return hasParents() ? parents.hasGenerationData() : false;
    }


    /**
     * Determines if any of parents associated to germplasm have data for the
     * "generative_method" field.  This info. can be used at the JSP level to
     * determine whether to show the generative method column when displaying
     * parents
     *
     * @return <code>true</code> if at least one parent has a non-null value for
     *  generative method
     */
    public boolean parentsHaveGenerativeMethodData() {
        return hasParents() ? parents.hasGenerativeMethodData() : false;
    }

    /**
     * Determines if any of the parents associated to germplasm have data for the
     * "background" field.  This info. can be used at the JSP level to
     * determine whether to show the generative method column when displaying
     * children
     *
     * @return <code>true</code> if at least one parent has a non-null value
     * for its PedigreeSpeciesVariant
     */
    public boolean parentsHavePedigreeSpeciesVariants() {
        return hasParents() ? parents.hasPedigreeSpeciesVariants() : false;
    }


    /**
     * Determines if any of the parents associated to germplasm have data for the
     * "Locus Associations" field.  This info. can be used at the JSP level to
     * determine whether to show the generative method column when displaying
     * parents
     *
     * @return <code>true</code> if at least one parent has a non-null value
     * for its LocusAssociations
     */
    public boolean parentsHaveLocusAssociations () {
        return hasParents() ? parents.hasLocusAssociations() : false;
    }



    /**
     * Determines if any of children associated to germplasm have data for the
     * "parent_gender" field.  This info. can be used at the JSP level to
     * determine whether to show the gender column when displaying children
     *
     * @return <code>true</code> if at least one parent has a non-null value
     *  for parent gender
     */
    public boolean childrenHaveParentGenderData() {
        return hasChildren() ? children.hasParentGenderData() : false;
    }

    /**
     * Determines if any of children associated to germplasm have data for the
     * "generation" field.  This info. can be used at the JSP level to determine
     * whether to show the generation column when displaying children
     *
     * @return <code>true</code> if at least one parent has a non-null value
     *  for generation
     */
    public boolean childrenHaveGenerationData() {
        return hasChildren() ? children.hasGenerationData() : false;
    }


    /**
     * Determines if any of children associated to germplasm have data for the
     * "generative_method" field.  This info. can be used at the JSP level to
     * determine whether to show the generative method column when displaying
     * children
     *
     * @return <code>true</code> if at least one parent has a non-null value
     * for generative method
     */
    public boolean childrenHaveGenerativeMethodData() {
        return hasChildren() ? children.hasGenerativeMethodData() : false;
    }


    /**
     * Determines if any of children associated to germplasm have data for the
     * "background" field.  This info. can be used at the JSP level to
     * determine whether to show the generative method column when displaying
     * children
     *
     * @return <code>true</code> if at least one parent has a non-null value
     * for its PedigreeSpeciesVariant
     */
    public boolean childrenHavePedigreeSpeciesVariants() {
        return hasChildren() ? children.hasPedigreeSpeciesVariants() : false;
    }

    /**
     * Determines if any of the children associated to germplasm have data for the
     * "Locus Associations" field.  This info. can be used at the JSP level to
     * determine whether to show the generative method column when displaying
     * children
     *
     * @return <code>true</code> if at least one parent has a non-null value
     * for its LocusAssociations
     */
    public boolean childrenHaveLocusAssociations() {
        return hasChildren() ? children.hasLocusAssociations() : false;
    }


    /**
     * Determines if germplasm has associated polymorphisms
     *
     * @return <code>true</code> if germplasm has associated polymorphisms, or
     * <code>false</code> if no polymorphisms associated to germplasm
     */
    public boolean hasPolymorphisms() {
        return ( polymorphisms != null && !polymorphisms.isEmpty() );
    }

    /**
     * Retrieves polymorphisms associated to germplasm
     *
     * @return Polymorphisms associated to germplasm as an <code>Iterator</code>
     * of <code>GermplasmPolymorphism</code> objects, or <code>null</code> if no
     * polymorphisms associated to germplasm
     */
    public Iterator getPolymorphisms() {
        return ( hasPolymorphisms() ) ? polymorphisms.iterator() : null;
    }

    /**
     * Determines if germplasm has associated clones
     *
     * @return <code>true</code> if germplasm has associated clones, or
     * <code>false</code> if no clones associated to germplasm
     */
    public boolean hasClones() {
        return ( clones != null && !clones.isEmpty() );
    }


    /**
     * Retrieves clones associated to germplasm.  Each Clone object will
     * contain a collection of loci associated to the clone
     *
     * @return Clones associated to germplasm as an <code>Iterator</code>
     * of <code>Clone</code> objects, or <code>null</code> if no clones
     * associated to germplasm
     */
    public Iterator getClones() {
        return ( hasClones() ) ? clones.iterator() : null;
    }

    /**
     * Determines if germplasm has associated phenotypes
     *
     * @return <code>true</code> if germplasm has one or more associated phenotypes,
     * <code>false</code> otherwise.
     */
    public boolean hasPhenotypes()
    {
        boolean has = false;

        // empty constructor doesn't call get_information(), thus null test.
        if( this.phenotypes != null &&
            this.phenotypes.isEmpty() == false )
        {
            has = true;
        }

        return( has );
    }

    /**
     * Retrieves phenotypes associated to germplasm.
     *
     * @return Phenotypes associated to germplasm as an <code>Iterator</code>
     * of <code>Phenotype</code> objects, or <code>null</code> if no phenotypes
     * associated to germplasm.
     */
    public Iterator getPhenotypes()
    {
        Iterator iter = null;

        if( hasPhenotypes() )
        {
            iter = this.phenotypes.iterator();
        }

        return( iter );
    }

    /**
     * Gets the data model which is used when rendering the display page.
     *
     * @return a map of attributes to values.
     * @throws SQLException when can't lazily load community for attribution
     */
    public Map getModel() throws SQLException {
	Map model = new HashMap();

	// name
	String name = "Germplasm: " + get_name();
	String germplasm_name = get_name();
	Collection stock_names = stocks.getNames();

	if ( stock_names.contains(germplasm_name) ) {
	    stock_names.remove(germplasm_name);
	    name = "Germplasm / Stock: " + germplasm_name;
	}
	if ( stock_names.size() > 0 ) {
	    name = name + " / Stock: " + Utils.join(stock_names, ", ");
	}
	model.put("name", name);
	
	// aliases
	Collection aliases = new TreeSet(new TfcAliasComparator());
	Iterator iter = get_aliases();
	while ( iter != null && iter.hasNext()) {
	    TfcAlias alias = (TfcAlias) iter.next();
	    aliases.add(alias);
	}

	iter = stocks.iterator();
	while ( iter != null && iter.hasNext() ) {
	    StockObject stock = (StockObject) iter.next();
	    if ( stock.hasDetails() && stock.getDetails().hasAliases() ) {
		Iterator sIter = stock.getDetails().get_aliases();
		while ( sIter != null && sIter.hasNext() ) {
		    TfcAlias alias = (TfcAlias) sIter.next();
		    aliases.add(alias);
		}
	    }
	}
	model.put("aliases", aliases);

	// accessions
	Collection accessions = new TreeSet();
	accessions.add(getAccession());
	
	iter = stocks.iterator();
	while ( iter != null && iter.hasNext() ) {
	    StockObject stock = (StockObject) iter.next();
	    if ( stock.hasDetails() ) {
		accessions.add(stock.getDetails().getAccession());
	    }
	}
	model.put("accessions", accessions);

	
	// stock descriptions
	Collection stockDescriptions = new TreeSet(new Comparator () {
		public int compare(Object o1, Object o2) { 
		    HashMap a1 = (HashMap) o1;
		    HashMap a2 = (HashMap) o2;
		    return ((String)a1.get("name")).compareTo((String)a2.get("name"));
		}
	    });
	iter = stocks.iterator();
	while ( iter != null && iter.hasNext() ) {
	    StockObject stock = (StockObject) iter.next();
	    if ( stock.hasDetails() ) {
		String sName = stock.getDetails().get_name();
		String description = stock.getDetails().get_description();
		if (sName != null && description != null) {
		    HashMap stockDescription = new HashMap();
		    stockDescription.put("name",  sName);
		    stockDescription.put("description", description);
		    stockDescriptions.add(stockDescription);
		}
	    }
	}
	model.put("stockDescriptions", stockDescriptions);

	// publications
	Collection publications = new TreeSet();
	Boolean publicationTitle = Boolean.FALSE;
	Boolean publicationSource = Boolean.FALSE;
	Boolean publicationDate = Boolean.FALSE;
	Iterator pubIter = get_publications();
	while (pubIter != null && pubIter.hasNext()) {
	    PublicationObject publication = (PublicationObject) pubIter.next(); 
	    publications.add(publication);
	    if (!EmptyTextConverter.convert(publication.get_title()).equals("")) {
		publicationTitle = Boolean.TRUE;
	    }
	    if (!EmptyTextConverter.convert( publication.get_pub_source_name() ).equals("")) {
		publicationSource = Boolean.TRUE;
	    }
	    if (!EmptyTextConverter.convert( publication.get_year() ).equals("")) {
		publicationDate = Boolean.TRUE;
	    }
	}

	iter = stocks.iterator();
	while ( iter != null && iter.hasNext() ) {
	    StockObject stock = (StockObject) iter.next();
	    if (stock.hasDetails() && stock.getDetails().get_publications() != null) {
		pubIter = stock.getDetails().get_publications();
		while (pubIter.hasNext()) {
		    PublicationObject publication = (PublicationObject) pubIter.next(); 
		    publications.add(publication);

		    if (!EmptyTextConverter.convert(publication.get_title()).equals("")) {
			publicationTitle = Boolean.TRUE;
		    }
		    if (!EmptyTextConverter.convert(publication.get_pub_source_name() ).equals("")) {
			publicationSource = Boolean.TRUE;
		    }
		    if (!EmptyTextConverter.convert(publication.get_year() ).equals("")) {
			publicationDate = Boolean.TRUE;
		    }
		}
	    }
	}
	model.put("publications", publications);
	model.put("publicationTitle", publicationTitle);
	model.put("publicationSource", publicationSource);
	model.put("publicationDate", publicationDate);

	// abrc comments
	Collection abrcComments = new TreeSet();
	iter = stocks.iterator();
	while ( iter != null && iter.hasNext() ) {
	    StockObject stock = (StockObject) iter.next();
	    if ( stock.hasDetails() && stock.getDetails().get_ABRC_comments() != null) {
		String comment  = stock.getDetails().get_ABRC_comments();
		abrcComments.add(comment);
	    }
	}
	model.put("abrcComments", abrcComments);
	
	// type
	String type = null;
	if ( get_is_mapping_strain() != null && get_is_mapping_strain().booleanValue() ) {
	    type = get_germplasm_type();
	}
	model.put("type", type);

	// display and meta data for stock types
	HashMap molecular_mapping = new HashMap();
	molecular_mapping.put("type", "is_molecular_mapping");
	molecular_mapping.put("display", "Molecular mapping line");

	HashMap classical_mapping = new HashMap();
	classical_mapping.put("type", "is_classical_mapping");
	classical_mapping.put("display", "Classical mapping line");

	// get the stock types
	Collection stockTypes = new TreeSet(new Comparator () {
		public int compare(Object o1, Object o2) { 
		    HashMap a1 = (HashMap) o1;
		    HashMap a2 = (HashMap) o2;
		    return ((String)a1.get("type")).compareTo((String)a2.get("type"));
		}
	    });
	iter = stocks.iterator();
	while ( iter != null && iter.hasNext() ) {
	    StockObject stock = (StockObject) iter.next();
	    if ( stock.hasDetails() && stock.getDetails().get_is_molecular_mapping() != null
		 && stock.getDetails().get_is_molecular_mapping().booleanValue() ) {
		stockTypes.add(molecular_mapping);
	    }
	    if ( stock.hasDetails() && stock.getDetails().get_is_classical_mapping() != null
		 && stock.getDetails().get_is_classical_mapping().booleanValue() ) {
		stockTypes.add(classical_mapping);
	    }
	}
	model.put("stockTypes", stockTypes);
	
	// release date
	Collection releaseDates = new TreeSet();
	iter = stocks.iterator();
	while ( iter != null && iter.hasNext() ) {
	    StockObject stock = (StockObject) iter.next();
	     if ( stock.hasDetails() && stock.getDetails().get_release_date() != null) {
		 java.util.Date date = (java.util.Date) stock.getDetails().get_release_date();
		 releaseDates.add(date);
	    }
	}
	model.put("releaseDates", releaseDates);
	
	// order info
	// name, academic, commercial, express_charge, express_required, signature_required, restricted
	// format_shipped, number_in_set, num_line
	Collection stockOrderInfo = new TreeSet(new Comparator () {
		public int compare(Object o1, Object o2) { 
		    HashMap a1 = (HashMap) o1;
		    HashMap a2 = (HashMap) o2;
		    return ((String)a1.get("name")).compareTo((String)a2.get("name"));
		}
	    });
	String formatShipped = "-";
	Long numInSet = new Long(0);
	Integer numLines = new Integer(0);
	Boolean isRestricted = Boolean.FALSE;
	Boolean expressShippingRequired = Boolean.FALSE;
	iter = stocks.iterator();
	while ( iter != null && iter.hasNext() ) {
	    StockObject stock = (StockObject) iter.next();
	    if ( stock.hasDetails() ) {
		StockDetail details = stock.getDetails();
		HashMap info = new HashMap();
		info.put("name", details.get_name());
		info.put("academic", details.get_format_base_price());
		info.put("commercial", details.get_format_commercial_price());
		if (details.get_express_shipping_required() != null && 
		    details.get_express_shipping_required().booleanValue()) {
		    
		    info.put("express_required", Boolean.TRUE);
		    info.put("express_charge", details.get_format_express_shipping_charge());
		    expressShippingRequired = Boolean.TRUE;
		} else {
		    info.put("express_required", Boolean.FALSE);
		    info.put("express_charge", details.get_format_express_shipping_charge());
		}
		if (details.get_MTA_signature() != null && 
		    details.get_MTA_signature().booleanValue() ) {
		    
		    info.put("signature_required", Boolean.TRUE);
		} else {
		    info.put("signature_required", Boolean.FALSE);
		}

		if (details.get_is_restricted() != null && 
		    details.get_is_restricted().booleanValue()) {
		    info.put("restricted", Boolean.TRUE);
		    isRestricted = Boolean.TRUE;
		} else {
		    info.put("restricted", Boolean.FALSE);
		}

		if( details.get_format_shipped() != null ){
		    info.put("format_shipped", details.get_format_shipped());
		    formatShipped = details.get_format_shipped();
		} else {
		    info.put("format_shipped", "-");
		}

		if ( details.get_number_in_set() != null && details.get_number_in_set() > 0) {
		    info.put("number_in_set", details.get_number_in_set() );
		    numInSet = details.get_number_in_set();
		} else {
		    info.put("number_in_set", "-");
		}
		
		if ( details.get_num_lines() != null && details.get_num_lines().intValue() > 0) {
		    info.put("num_lines", details.get_num_lines());
		    numLines = details.get_num_lines();
		} else {
		    info.put("num_lines", "-");
		}

		stockOrderInfo.add(info);
	    }
	}
	model.put("stockOrderInfo", stockOrderInfo);
	model.put("expressShippingRequired", expressShippingRequired);
	model.put("isRestricted", isRestricted);
	model.put("formatShipped", formatShipped);
	model.put("numInSet", numInSet);
	model.put("numLines", numLines);

	// attributions
	Collection attributions = new TreeSet(new Comparator () {
		public int compare(Object o1, Object o2) { 
		    HashMap a1 = (HashMap) o1;
		    HashMap a2 = (HashMap) o2;
		    return ((String)a1.get("name")).compareTo((String)a2.get("name"));
		}
	    });
	iter = stocks.iterator();
	while ( iter != null && iter.hasNext() ) {
	    StockObject stock = (StockObject) iter.next();
	    if ( stock.hasDetails() && stock.getDetails().get_attributions()  != null) {
		List<BsAttribution> list = stock.getDetails().get_attributions();
		for (BsAttribution attr : list) {
		    HashMap attribution = new HashMap();
		    attribution.put("name", stock.getDetails().get_name());
		    attribution.put("obj", attr);
		    attributions.add(attribution);
		}
	    }
	}
	model.put("attributions", attributions);


	addStockInfo(model);
	addAssociatedPolymorphismsInfo(model);
	addAttributions(model);
	addAnnotations(model);
	addCommunications(model);

	return model;
    }


    /**
     * Adds stock information to the model
     * LAYOUT:
     * stock_info - Map
     *   [ has_availability - Boolean
     *     has_donor - Boolean
     *     has_donor_number - Boolean
     *     pools - List - StockObject
     *     has_abbreviated_pools - Boolean
     *     has_pool_name - Boolean
     *     has_pool_relationship - Boolean
     *     has_pool_type - Boolean
     *     has_pool_description - Boolean
     *     parentStocks - List - <Map>
     *       [ id -
     *         name - String
     *         type - String
     *         description - String
     *       ]
     *     has_parent_name - Boolean
     *     has_parent_type - Boolean
     *     has_parent_description - Boolen
     *     stocks - List <Map>
     *       [ availability - String
     *         name - String
     *         donors - List <Map>
     *           [ community_type - String
     *             community_id - Long?
     *             name - String
     *             donor_number - String
     *           ]
     *       ]
     *   ]
     */
    private void addStockInfo(Map model) {
	Map stock_info = new HashMap();
	model.put("stock_info", stock_info);

	Boolean has_availability = Boolean.FALSE;
	Boolean has_donor = Boolean.FALSE;
	Boolean has_donor_number = Boolean.FALSE;

	List pools = new ArrayList();
	stock_info.put("pools", pools);
	Boolean has_abbreviated_pools = Boolean.FALSE;
	Boolean has_pool_name = Boolean.FALSE;
	Boolean has_pool_relationship = Boolean.FALSE;
	Boolean has_pool_type = Boolean.FALSE;
	Boolean has_pool_description = Boolean.FALSE;

	List parentStocks = new ArrayList();
	stock_info.put("parents", parentStocks);
	Boolean has_parent_name = Boolean.FALSE;
	Boolean has_parent_type = Boolean.FALSE;
	Boolean has_parent_description = Boolean.FALSE;

	List stocks = new ArrayList();
	stock_info.put("stocks", stocks);

	Iterator stockIter = getStocks();
	while (stockIter != null && stockIter.hasNext()) {
	    StockObject stock = (StockObject) stockIter.next();
	    Map stockInfo = new HashMap();

	    stocks.add(stockInfo);

	    if ( stock.hasMemberStocks() ) {
		pools.add( stock );
		if ( !has_abbreviated_pools && stock.memberStocksAbbreviated() ) { 
		    has_abbreviated_pools = Boolean.TRUE;
		}

		Iterator memberIter = stock.getMemberStocks();
		while (memberIter.hasNext()) {
		    StockObject member = (StockObject) memberIter.next();

		    if (!EmptyTextConverter.convert(member.get_name()).equals("")) {
			has_pool_name = Boolean.TRUE;
		    }

		    if (!EmptyTextConverter.convert(member.get_relationship_type()).equals("")) {
			has_pool_relationship = Boolean.TRUE;
		    }

		    if (!EmptyTextConverter.convert(member.get_stock_type()).equals("")) {
			has_pool_type = Boolean.TRUE;
		    }
		    
		    Iterator gIter = member.getGermplasms();
		    while (gIter != null && gIter.hasNext()) {
			Germplasm memberGerm = (Germplasm) gIter.next();
			if(!EmptyTextConverter.convert(memberGerm.get_description()).equals("")) {
			    has_pool_description = Boolean.TRUE; 
			}
		    }

		    //if (!EmptyTextConverter.convert(member.get_description()).equals(""))
		    //has_pool_description = Boolean.TRUE;
		}
	    }                                                                                                                                                                    
	    if ( stock.hasParentStocks() ) {
		Iterator parentIter = stock.getParentStocks();
		while ( parentIter.hasNext() ) { 
		    Map parentMap = new HashMap();
		    StockObject parent = (StockObject) parentIter.next();
		    if (!EmptyTextConverter.convert(parent.get_name()).equals("")) {
			parentMap.put("id",  parent.get_stock_id());
			parentMap.put("name", parent.get_name());
			has_parent_name = Boolean.TRUE;
		    }
		    if (!EmptyTextConverter.convert(parent.get_stock_type()).equals("")) {
			parentMap.put("type", EmptyTextConverter.convert(parent.get_stock_type()));
			has_parent_type = Boolean.TRUE;
		    }

		    Iterator gIter = parent.getGermplasms();
		    while (gIter != null && gIter.hasNext()) {
			Germplasm parentGerm = (Germplasm) gIter.next();
			if(!EmptyTextConverter.convert(parentGerm.get_description()).equals("")) {
			    parentMap.put("description", EmptyTextConverter.convert(parentGerm.get_description()));
			    has_parent_description = Boolean.TRUE;
			}
		    }

		    parentStocks.add(parentMap);
		}
	    }

	    String availability = stock.get_stock_availability_type();
	    stockInfo.put("availability", availability);
	    has_availability = Boolean.TRUE;


	    stockInfo.put("name", stock.get_name());
	    
	    List donors = new ArrayList();
	    stockInfo.put("donors", donors);

	    Set distinct = new TreeSet();
	    Iterator donorIter = stock.getDonors();
	    while (donorIter != null && donorIter.hasNext()) {
		Donor donor = (Donor) donorIter.next();
		Map donorInfo = new HashMap();

		donors.add(donorInfo);

		donorInfo.put("community_type", donor.getCommunityType());
		donorInfo.put("community_id", donor.getCommunityID());
		donorInfo.put("name", donor.getDisplayName());
		has_donor = Boolean.TRUE;

		String donorNumber = donor.getDonorStockNumber(); 

		if (donorInfo.get("donor_number") == null) {
		    donorInfo.put("donor_number", "");
		}


		if (donorNumber != null && !distinct.contains(donorNumber)) {
		    has_donor_number = Boolean.TRUE;
		    distinct.add(donorNumber);
		    donorInfo.put("donor_number", donorNumber);
		}

	    }

	}

	stock_info.put("has_availability", has_availability);
	stock_info.put("has_donor", has_donor);
	stock_info.put("has_donor_number", has_donor_number);	

	stock_info.put("has_abbreviated_pools", has_abbreviated_pools);

	stock_info.put("has_pool_name", has_pool_name);
	stock_info.put("has_pool_relationship", has_pool_relationship);
	stock_info.put("has_pool_type", has_pool_type);
	stock_info.put("has_pool_description", has_pool_description);

	stock_info.put("has_parent_name", has_parent_name);
	stock_info.put("has_parent_type", has_parent_type);
	stock_info.put("has_parent_description", has_parent_description);
    }




    /**
     * Adds associated polymorphism information to the model as polys.
     * LAYOUT:
     * associated_polymorphisms - Map
     *     [ has_name - Boolean, 
     *       has_locus_names - Boolean, 
     *       has_gene_names - Boolean, 
     *       has_genotype - Boolean, 
     *       has_mutagen - Boolean,
     *       has_inheritance - Boolean,
     *       polys - List <Map>
     *           [ id - Long
     *             name - String,
     *             genotype - String,
     *             mutagen - String,
     *             inheritance = String,
     *             loci - List <Map>
     *                 [ id - String,
     *                   name - String
     *                 ]
     *             genes - List <Map>
     *                 [ id - String,
     *                   names - Set <String>
     *                 ]
     *           ]
     *     ]
     *            
     *
     */
    private void addAssociatedPolymorphismsInfo(Map model) {
	Map associatedPolymorphisms = new HashMap();
	model.put("associated_polymorphisms", associatedPolymorphisms);

	Boolean has_name = Boolean.FALSE; 
	Boolean has_locus_names = Boolean.FALSE; 
	Boolean has_gene_names = Boolean.FALSE;
	Boolean has_genotype = Boolean.FALSE; 
	Boolean has_mutagen = Boolean.FALSE; 
	Boolean has_inheritance = Boolean.FALSE; 
	List polys = new ArrayList();

	associatedPolymorphisms.put("polys", polys);

	Iterator iter = getPolymorphisms();
	while (hasPolymorphisms() && iter.hasNext()) {
	    Map gp = new HashMap();
	    List loci = new ArrayList();
	    List genes = new ArrayList();
		
	    GermplasmPolymorphism pol = (GermplasmPolymorphism) iter.next(); 

	    polys.add(gp);
	    
	    gp.put("id", pol.get_ref_polymorphism_id());
	    gp.put("name", pol.get_original_name());
	    if (pol.get_original_name() != null &&
		pol.get_ref_polymorphism_id() != null) {
		has_name = Boolean.TRUE;
	    }

	    // Locus info
	    gp.put("loci", loci);
	    Iterator locusIter = pol.getLocus();
	    while (pol.hasLocus() && locusIter.hasNext()) {
		Locus locus = (Locus) locusIter.next();

		Map locusInfo = new HashMap();

		locusInfo.put("id", locus.get_locus_id());
		locusInfo.put("name", locus.get_name());

		loci.add(locusInfo);
		has_locus_names = Boolean.TRUE;
	    }
	    
	    // Gene info
	    gp.put("genes", genes);
	    Iterator geneIter = pol.getGenes();
	    while (pol.hasGenes() && geneIter.hasNext()) {
		GeneModelLite gene = (GeneModelLite) geneIter.next();
		Set<String> names = new TreeSet<String>();

		Map geneInfo = new HashMap();

		if (!gene.getIsObsolete()) {
		    genes.add(geneInfo);
		}

		geneInfo.put("id", gene.getGeneID());
		geneInfo.put("names", names);
		
		if (gene.getName() != null) {
		    names.add(gene.getName());
		    has_gene_names = Boolean.TRUE;
		}

		if (gene.hasSymbols()) {
		    Collection<TfcSymbol> symbols = gene.getSymbols(); 

		    for (TfcSymbol symbol : symbols) {
			if (symbol.get_full_name() != null) {
			    names.add(symbol.get_full_name());
			    has_gene_names = Boolean.TRUE;
			}
		    }
		}
	    }

	    // Genotype
	    gp.put("genotype", pol.get_genotype());
	    if (pol.get_genotype() != null) {
		has_genotype = Boolean.TRUE;
	    }
	    
	    // Mutagen
	    gp.put("mutagen", pol.get_mutagen());
	    if (pol.get_mutagen() != null) {
		has_mutagen = Boolean.TRUE;
	    }

	    // Inheritance
	    gp.put("inheritance", pol.get_inheritance());
	    if (pol.get_inheritance() != null) {
		has_inheritance = Boolean.TRUE;
	    }
	    
	}

	associatedPolymorphisms.put("has_name", has_name);
	associatedPolymorphisms.put("has_locus_names", has_locus_names); 
	associatedPolymorphisms.put("has_gene_names", has_gene_names);
	associatedPolymorphisms.put("has_genotype", has_genotype);
	associatedPolymorphisms.put("has_mutagen", has_mutagen);
	associatedPolymorphisms.put("has_inheritance", has_inheritance);
    }


    private void addAttributions(Map model) throws SQLException {
	Map attribution_info = new HashMap();
	model.put("attribution_info", attribution_info);

	Boolean has_type = Boolean.FALSE;
	Boolean has_name = Boolean.FALSE;
	Boolean has_date = Boolean.FALSE;

	List<BsAttribution> iter = get_attributions();
	for (BsAttribution attribution : get_attributions()) {
	    Map obj = new HashMap();

	    if (!EmptyTextConverter.convert(attribution.getType().getAttributionType()).equals("")) {
		has_type = Boolean.TRUE;
	    }

	    if (!EmptyTextConverter.convert(attribution.getCommunity().getName()).equals("")) {
		has_name = Boolean.TRUE;
	    }

	    if (!EmptyTextConverter.convert(attribution.getAttributionDate()).equals("")) {
		has_date = Boolean.TRUE;
	    }
	}

	attribution_info.put("has_type", has_type);
	attribution_info.put("has_name", has_name);
	attribution_info.put("has_date", has_date);
    }

    private void addAnnotations(Map model) {
	Map annotation_info = new HashMap();
	model.put("annotation_info", annotation_info);

	Boolean has_date = Boolean.FALSE;
	Boolean has_source = Boolean.FALSE;
	Boolean has_annotation = Boolean.FALSE;

	Iterator iter = get_annotations();
	while (iter != null && iter.hasNext()) {
	    AnnotationObject annotation = (AnnotationObject) iter.next();
	    Map obj = new HashMap();

	    if (!EmptyTextConverter.convert(annotation.get_date_entered()).equals("")) {
		has_date = Boolean.TRUE;
	    }

	    if (!EmptyTextConverter.convert(annotation.get_annotation_source()).equals("")) {
		has_source = Boolean.TRUE;
	    }

	    if (!EmptyTextConverter.convert(annotation.get_short_annotation()).equals("") ||
		!EmptyTextConverter.convert(annotation.get_long_annotation()).equals("")) {
		has_annotation = Boolean.TRUE;
	    }
	}

	annotation_info.put("has_date", has_date);
	annotation_info.put("has_source", has_source);
	annotation_info.put("has_annotation", has_annotation);
    }


    private void addCommunications(Map model) {
	Map communication_info = new HashMap();
	model.put("communication_info", communication_info);

	Boolean has_name = Boolean.FALSE;
	Boolean has_author = Boolean.FALSE;
	Boolean has_date = Boolean.FALSE;

	Iterator iter = get_communication_references();
	while (iter != null && iter.hasNext()) {
	    CommunicationObject communication = (CommunicationObject) iter.next();
	    Map obj = new HashMap();

	    if (!EmptyTextConverter.convert(communication.get_name()).equals("")) {
		has_name = Boolean.TRUE;
	    }

	    if (!EmptyTextConverter.convert(communication.get_author_name()).equals("")) {
		has_author = Boolean.TRUE;
	    }

	    if (!EmptyTextConverter.convert(communication.get_date()).equals("")) {
		has_date = Boolean.TRUE;
	    }
	}

	communication_info.put("has_name", has_name);
	communication_info.put("has_author", has_author);
	communication_info.put("has_date", has_date);
    }


    /**
     * For unit testing only
     */
    public void test() {

        System.out.println( "****** GermplasmDetail content test ******" );
        super.test();
        germplasm.test();

        if ( hasPolymorphisms() ) {
            polymorphisms.test();
        }

        if ( hasStocks() ) {
            Iterator iter = getStocks();
            while ( iter.hasNext() ) {
                StockObject stock = (StockObject) iter.next();
                stock.test();
            }
        }

        if ( taxon != null ) {
            taxon.test();
        }

        if ( speciesVariant != null ) {
            speciesVariant.test();
        }

        if ( hasClones() ) {
            clones.test();
        }

        if( hasPhenotypes() ) {
            Iterator iter = getPhenotypes();
            while ( iter.hasNext() ) {
                Phenotype phenotype = (Phenotype) iter.next();
                phenotype.test();
            }
        }

        System.out.println( "**** GermplasmDetail content test end ****" );
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try {

            DBconnection conn = new DBconnection();
            Long id = new Long( 4472021 );
            GermplasmDetail germplasm = new GermplasmDetail( conn, id );
            germplasm.test();

        } catch ( Exception e) {
            e.printStackTrace();
        }
    }

}
