//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.3 $
// $Date: 2004/10/20 23:07:16 $
//------------------------------------------------------------------------------

package org.tair.processor.microarray.excel;

import jxl.Sheet;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.tair.processor.genesymbol.TairObjectPublication;
import org.tair.processor.microarray.data.LoadableBioSample;
import org.tair.processor.microarray.data.LoadableClone;
import org.tair.processor.microarray.data.LoadableGermplasm;
import org.tair.processor.microarray.data.factory.CloneFactory;
import org.tair.processor.microarray.data.factory.GermplasmFactory;
import org.tair.processor.microarray.data.factory.PolymorphismFactory;
import org.tair.processor.microarray.data.factory.SpeciesVariantFactory;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcGene;
import org.tair.tfc.TfcPolymorphism;
import org.tair.tfc.TfcPublication;
import org.tair.tfc.TfcSpeciesVariant;
import org.tair.tfc.TfcTaxon;


/**
 * GermplasmSheet is a concrete implementation of DataSheet that is used
 * to parse and validate data from the "Germplasm" sheet of the microarray
 * data loading Excel sheet.  GermplasmSheet parses data entered in this
 * sheet, transforms values from sheet into database objects, and populates
 * an instance of LoadableExpressionSet with data.
 */


public class GermplasmSheet extends DataSheet {

    // delimiter used for columns with multiple entries
    private final String DELIMITER = "|";
    
    // columns in Germplasm sheet
    private final int SAMPLE_NAME = 0;
    private final int NAME = 1;
    private final int SPECIES_VARIANT = 2;
    private final int SPECIAL_GROWTH_CONDITIONS = 3;
    private final int DESCRIPTION = 4;
    private final int IS_NATURAL_VARIANT = 5;
    private final int IS_MUTANT = 6;
    private final int MUTAGEN = 7;
    private final int ALLELE = 8;
    private final int HAS_FOREIGN_DNA = 9;

    // clone
    private final int CLONE_NAME = 10;
    private final int CLONE_INSERT_TYPE = 11;
    private final int CLONE_CONSTRUCT_TYPE = 12;
    private final int CLONE_GENE_NAME = 13;
    private final int GENE_TAXON = 14;
    private final int CLONE_PROMOTER = 15;
    private final int CLONE_REPORTER = 16;

    // germplasm pub
    private final int PUBMED_ID = 17;

    // list of acceptable germplasm mutagen values
    private List mutagenList;


    // map of clone insert types with value expected from Excel sheet
    // referencing rule value to use for db insert
    private Map insertTypesMap;

    // map of clone construct types with value expected from Excel sheet
    // referencing rule value to use for db insert
    private Map constructTypesMap;

    /**
     * Creates an instance of GermplasmSheet that can be used to parse
     * the "Germplasm" data sheet of microarray Excel file.  
     *
     * @param sheetName Literal name of Germplasm sheet as it appears in 
     * Excel data file. This name is used to retrieve Sheet object that 
     * contains all data as it appears in Excel file.
     */
    public GermplasmSheet( String sheetName ) {
	super( sheetName );
	initializeMutagens();
	initializeInsertTypes();
	initializeConstructTypes();
    }


    /**
     * Initializes list for validating germplasm mutagen values with all
     * acceptable values from database rule.
     */
    private void initializeMutagens() {
	mutagenList = new ArrayList();
	mutagenList.add( "transposon insertion" ); 
	mutagenList.add( "T-DNA insertion" ); 
	mutagenList.add( "Agrobacterium transformation" ); 
	mutagenList.add( "5-bromouracil" );
	mutagenList.add( "diepoxybutane" ); 
	mutagenList.add( "ethylmethane sulfonate" ); 
	mutagenList.add( "ethyl-nitrosourea" ); 
	mutagenList.add( "gamma rays" ); 
	mutagenList.add( "HZE C" ); 
	mutagenList.add( "HZE Kr" ); 
	mutagenList.add( "HZE Ne" );
	mutagenList.add( "HZE U" ); 
	mutagenList.add( "ionizing radiation" ); 
	mutagenList.add( "fast neutrons" ); 
	mutagenList.add( "nitroguanidine" ); 
	mutagenList.add( "nitrosomethyl biuret" );
	mutagenList.add( "nitrosomethyl urea" );
	mutagenList.add( "spontaneous" ); 
	mutagenList.add( "tissue culture" ); 
	mutagenList.add( "X-rays" ); 
	mutagenList.add( "sodium ascorbate" ); 
	mutagenList.add( "unknown" ); 
	mutagenList.add( "dsRNA silencing" );
    }


    /**
     * Initializes map for validating and translating clone insert types
     * with values expected from Excel sheet referencing database
     * rule values
     */
    private void initializeInsertTypes() {
	insertTypesMap = new HashMap();
	insertTypesMap.put( "cDNA", "cDNA" );
	insertTypesMap.put( "genomic", "genomic" );
	insertTypesMap.put( "construct", "construct" );
	insertTypesMap.put( "transposon", "transposon" );
	insertTypesMap.put( "T-DNA", "T-DNA" );
	insertTypesMap.put( "transposase", "transposase"  );
	insertTypesMap.put( "unknown", "unknown" );
	insertTypesMap.put( "inverted_repeat", "inverted_repeat" );
    }


    /**
     * Initializes map for validating and translating clone construct types
     * with values expected from Excel sheet referencing database
     * rule values
     */
    private void initializeConstructTypes() {
	constructTypesMap = new HashMap();
	constructTypesMap.put( "activation tag", "activation_tag" );
	constructTypesMap.put( "antisense", "antisense" );

	constructTypesMap.put( "cre-lox recombination", 
			       "cre-lox_recombination" );

	constructTypesMap.put( "enhancer trap", "enhancer_trap" );
	constructTypesMap.put( "gene trap", "gene_trap" );
	constructTypesMap.put( "over-expression", "over-expression" );
	constructTypesMap.put( "promoter fusion", "promoter_fusion" );
	constructTypesMap.put( "promoter reporter", "promoter_reporter" );
	constructTypesMap.put( "promoter trap", "promoter_trap" );
	constructTypesMap.put( "RNAi", "RNAi" );
	constructTypesMap.put( "simple insert", "simple_insert" );
    }


    /**
     * Parses Germplasm data sheet from Excel file and populates expression
     * set object with data from sheet.  As data is parsed, it is validated 
     * and transformed into database objects that can be used to store 
     * newly created expression set to the database.
     *
     * <p>
     * References to member variables in super class (such as Sheet and
     * expression set) must have already been set before this method is
     * called.
     *
     * @param conn An active connection to the database for translating
     * submitted sheet values to database values
     * @throws SQLException if a database error occurs
     */
    public void parseSheet( DBconnection conn ) throws SQLException{
	
	// Create data cell objects for retrieving data for this
	// sheet and doing basic validation for each cell.
	ExcelDataCell[] dataCells = createDataCells();

	// data retrieved for current row with field name referencing
	// submitted value
	Map rowData = null;

	// bio sample to associate germplasm to
	LoadableBioSample bioSample = null;

	// names of bio samples germplasm will be associated to
	String[] bioSampleNames = null;

	// germplasm name as submitted in row of file
	String germplasmName = null;

	// ignore first row (index 0) - column headers
	for ( int i = 1; i < sheet.getRows(); i++ ) {

	    // Set current row of data in superclass
	    setCurrentRow( i );

	    // retrieve and validate current row of data using
	    // validation method defined in superclas
	    rowData = validateDataCells( dataCells );

	    // get names of all biosamples germplasm is used in
	    bioSampleNames = getBioSampleNames( rowData );

	    // get germplasm object for this row of data
	    LoadableGermplasm germplasm = 
		lookupGermplasm( conn, rowData );
	    
	    germplasmName = getGermplasmName( rowData );

	    // for each bio sample requested, set reference to
	    // germplasm if no germplasm data previously set for sample.
	    for ( int j = 0; j < bioSampleNames.length; j++ ) {
		bioSample = getBioSample( bioSampleNames[ j ] );

		// if bio sample is null, it was either not found in
		// expression set or already had a valid germplasm
		// set for it
		if ( bioSample != null ) {
		    
		    // add germplasm record to bio sample
		    bioSample.setGermplasm( germplasm );

		    // add biosample name to germplasm so germplasm can
		    // display list of biosamples its associated to on
		    // confirmation page
		    germplasm.addBioSampleName( bioSampleNames[ j ] );
		}
	    }

	    // record name of germplasm submitted on on this row of data 
	    // along with a bio sample name for presenting results back to 
	    // curator in the order it was received. Use first bio sample
	    // in array -- doesn't matter which one, just need a single bio
	    // sample to get access to germplasm from expression set
	    rowTracker.setGermplasmRow( i, germplasmName, bioSampleNames[ 0 ] ); 
	}
    }

    /**
     * Creates list of data cell objects used for retrieving and
     * validating data from Germplasm Excel data sheet.  Each cell 
     * object is populated with its field name, the column index
     * it exists at in the datasheet, and whether it is a required
     * field or not
     *
     * @return Array of ExcelDataCell objects that can be used to retrieve
     * and validate data from Germplasm data sheet
     */
    private ExcelDataCell[] createDataCells() {
	ExcelDataCell[] cells = new ExcelDataCell[ 18 ];

	cells[ 0 ] = new DelimitedDataCell( "sample name", 
					    SAMPLE_NAME, 
					    true,
					    DELIMITER );

	cells[ 1 ] = new ExcelDataCell( "germplasm name", NAME, true );
	
	cells[ 2 ] = new ExcelDataCell( "species variant", 
					SPECIES_VARIANT,
					false );

	cells[ 3 ] = new ExcelDataCell( "growth conditions", 
					SPECIAL_GROWTH_CONDITIONS, 
					false );

	cells[ 4 ] = new ExcelDataCell( "description", DESCRIPTION, false );

	cells[ 5 ] = new BooleanDataCell( "is natural variant", 
					  IS_NATURAL_VARIANT, 
					  false );

	cells[ 6 ] = new BooleanDataCell( "is mutant", IS_MUTANT, false );
	cells[ 7 ] = new ExcelDataCell( "mutagen", MUTAGEN, false );

	// allele name(s) germplasm is associated to
	cells[ 8 ] = new DelimitedDataCell( "allele", 
					    ALLELE, 
					    false,
					    DELIMITER );

	cells[ 9 ] = new BooleanDataCell( "has foreign dna", 
					  HAS_FOREIGN_DNA, 
					  false );

	// clone
	cells[ 10 ] = new ExcelDataCell( "clone name", CLONE_NAME, false );

	cells[ 11 ] = new ExcelDataCell( "clone insert type", 
					 CLONE_INSERT_TYPE, 
					 false );

	cells[ 12 ] = new ExcelDataCell( "clone construct type", 
					 CLONE_CONSTRUCT_TYPE,
					 false );

	cells[ 13 ] = new ExcelDataCell( "clone gene name", 
					 CLONE_GENE_NAME, 
					 false );

	cells[ 14 ] = new ExcelDataCell( "gene taxon",
					 GENE_TAXON,
					 false );

	cells[ 15 ] = new ExcelDataCell( "clone promoter", 
					 CLONE_PROMOTER,
					 false );

	cells[ 16 ] = new ExcelDataCell( "clone reporter", 
					 CLONE_REPORTER, 
					 false );

	// germplasm pub
	cells[ 17 ] = new DelimitedDataCell( "pub med id", 
					     PUBMED_ID, 
					     false, 
					     DELIMITER );
	return cells;
    }

    /**
     * Utility method to get bio sample names from submitted row
     * of data
     *
     * @param rowData Map of column data for single row of Excel file
     * @return Values submitted in current row for bio sample name
     */
    private String[] getBioSampleNames( Map rowData ) {
	String[] bioSampleNames = (String[]) rowData.get( "sample name" );

	if ( bioSampleNames == null ) {
	    addError( "sample name",
		      "No bio sample names submitted for germplasm" );
	}

	return bioSampleNames;
    }

    /**
     * Utility method to get germplasm name from submitted row
     * of data
     *
     * @param rowData Map of column data for single row of Excel file
     * @return Value submitted in current row for germplasm name
     */
    private String getGermplasmName( Map rowData ) {
	String germplasmName = (String) rowData.get( "germplasm name" );

	return germplasmName;
    }


   
    /**
    * Populates germplasm data for submitted germplasm name. Created object
    * will reference an existing row in the database if germplasm name was
    * found in database; if not, primary key of object will be null and
    * object will be populated from submitted row of Excel data. New 
    * germplasm data will be inserted when store is called on BioSample.
    *
    * @param conn An active connection to the database
    * @param rowData Map of column data for single row of Excel file
    * @return Germplasm object populated with basic germplasm data
    * from excel sheet.
    * @throws SQLException if a database error occurs
    */
    private LoadableGermplasm lookupGermplasm( DBconnection conn,
					       Map rowData )
	throws SQLException {

	String germplasmName = (String) rowData.get( "germplasm name" );

	// get factory for creating germplasm objects from 
	// masterFactory in super class
	GermplasmFactory germplasmFactory = masterFactory.getGermplasmFactory();

	// get populated germplasm object for submitted name -- factory will
	// return an object populated with db data or with germplasm data from
	// a previous row of excel sheet
	LoadableGermplasm germplasm = 
	    germplasmFactory.getGermplasmName( conn, germplasmName );

	// if not found, create new record from excel data
	if ( germplasm == null ) {
	    germplasm = populateGermplasm( conn, rowData );

	    // clone data should only be present if germplasm 
	    // has foreign dna
	    if ( germplasm.get_has_foreign_dna() != null &&
		 germplasm.get_has_foreign_dna().booleanValue() ) {

		populateClone( conn, rowData, germplasm );
	    }
	    
	    // if germplasm is natural variant, find species variant
	    // id to link to
	    if ( germplasm.get_is_natural_variant() != null &&
		 germplasm.get_is_natural_variant().booleanValue() ) {
		populateSpeciesVariant( conn, rowData, germplasm );
	    }


	    // if germplasm is mutant, populate polymorphism/allele data
	    if ( germplasm.get_is_mutant() != null &&
		 germplasm.get_is_mutant().booleanValue() ) {

		populateAllele( conn, rowData, germplasm );
	    }

	    populatePublications( conn, rowData, germplasm );


	    // add new germplasm object to factory's cache for
	    // reuse in all bio samples that use new record
	    germplasmFactory.addNewGermplasm( germplasm );
	}

	return germplasm;
    }



    /**
     * Retrieves bio sample object from expression set using submitted
     * sample name from current row of Germplasm sheet.  Bio sample should
     * have already been created in Samples sheet. Processing of new germplasm
     * record will only continue if bio sample is found without a germplasm
     * record set for it.  If record set, then a valid germplasm has already
     * been found for bio sample and insertion of germplasm is not necessary.
     * If bio sample itself cannot be found, there is some error between
     * Samples sheet and this sheet. Record messages in either case.
     *
     * @param rowData Map of column data for single row of Excel file
     * @param bioSampleName Name of bio sample to retrieve (submitted in file)
     * @return Bio sample object previously added to expression set that
     * has name submitted in current row of germplasm data. If bio sample
     * was not found, or if already has germplasm record set for it, 
     * return <code>null</code> to let calling code know that processing
     * of germplasm row should NOT proceed
     */
    private LoadableBioSample getBioSample( String bioSampleName ) {


	LoadableBioSample bioSample = 
	    expressionSet.getBioSample( bioSampleName );

	if ( bioSample == null ) {
	    addError( "sample name",
		      "Could not associate germplasm to biosample. " +
		      "No bio sample found with name: " + bioSampleName );

	    // if bio sample has germplasm, it means that a record
	    // was found for data submitted in Samples sheet. Record
	    // warning to let curator know
	} else if ( bioSample.hasGermplasm() ) {

	    addWarning( "germplasm name",
		      "Germplasm already set for bio sample. " +
		      "No new germplasm record will be created" );

	    // set reference to null to signal error to calling code
	    bioSample = null;
	}

	return bioSample;
    }


    /**
     * Creates germplasm object populated with germplasm data from 
     * excel file. This method assumes that checks have already been
     * made to ensure that germplasm does not already exist in the 
     * database. New row will be INSERTed when expression set data is 
     * stored to the database 
     *
     * @param conn An active connection to the database
     * @param rowData Map of column data for single row of Excel file
     * @return Germplasm object populated with basic germplasm data
     * from excel sheet.
     * @throws SQLException if a database error occurs
     */
    private LoadableGermplasm populateGermplasm( DBconnection conn,
						 Map rowData )
	throws SQLException {

	LoadableGermplasm germplasm = new LoadableGermplasm();
	String name = (String) rowData.get( "germplasm name" );
	germplasm.set_original_name( name );
	germplasm.set_name( name.toUpperCase() );

	String growthCond = (String) rowData.get( "growth conditions" );
	germplasm.set_special_growth_conditions( growthCond );
	germplasm.set_description( (String) rowData.get( "description" ) );

	Boolean isVariant = (Boolean) rowData.get( "is natural variant" );
	germplasm.set_is_natural_variant( isVariant );

	Boolean isMutant = (Boolean) rowData.get( "is mutant" );
	germplasm.set_is_mutant( isMutant );

	// validate submitted mutagen value against acceptable rule
	// values
	String mutagen = (String) rowData.get( "mutagen" );
	if ( mutagen != null && !mutagenList.contains( mutagen ) ) {
	    addError( "mutagen", "Invalid mutagen submitted" );
	    germplasm.set_mutagen( mutagen );
	}

	Boolean hasForeignDNA = (Boolean) rowData.get( "has foreign dna" );
	germplasm.set_has_foreign_dna( hasForeignDNA );

	// set type for new germplasms as individual line
	germplasm.set_germplasm_type( "individual_line" );

	return germplasm;
	
    }

    /**
     * Populates clone data for germplasm using data in Excel sheet. Created
     * object will reference an existing row in the database if combination of
     * clone name, insert type and vector type was found in database; if not,
     * primary key of object will be null and object will be populated with
     * data from submitted row of Excel sheet. New clone row will be
     * inserted when store is called on germplasm (through BioSample)
     *
     * @param conn An active connection to the database
     * @param rowData Map of column data for single row of Excel file
     * @param germplasm Germplasm object to populate with clone data
     * @throws SQLException if a database error occurs
     */
    private void populateClone( DBconnection conn,
				Map rowData,
				LoadableGermplasm germplasm ) 
	throws SQLException {
	    
	String name = (String) rowData.get( "clone name" );
	String insertType = (String) rowData.get( "clone insert type" );

	// translate insert type to rule value
	String translatedInsertType = translateInsertType( insertType );
	
	// make sure minimum clone data was submitted 
	if ( validCloneData( name, insertType ) &&
	     translatedInsertType != null ) {

	    // search db for clone
	    LoadableClone clone = 
		lookupClone( conn, name, translatedInsertType );
	    
	    // If not found, populate instance with submitted values.
	    if ( clone == null ) {
		clone = createNewClone( conn, 
					rowData, 
					name, 
					translatedInsertType );
	    }
	    
	    // set clone info. for germplasm
	    germplasm.setClone( clone );
	}
    }
    
    /**
     * Searches for clone with submitted name and insert type. Clone search will
     * first be executed using default vector type of "plasmid"; if no clones 
     * found with combination of name, insert type and vector type, another 
     * search will be made for name and insert type with a NULL vector type. 
     * If no matches found after that, method will return null and a new clone
     * record will be created
     *
     * <p>
     * This method uses CloneFactory to look up clone records. CloneFactory 
     * caches all clone data that has been previously retrieved from the 
     * database as well as all clone objects that are to be newly created. Clone
     * object returned from this method may represent either database data, or
     * data that will be inserted when expression set data is stored
     *
     * @param conn An active connection to the database
     * @param name Clone name to search for
     * @param insertType Insert type to search for
     * @return Clone populated with data from the database if combination of
     * name, insert type and vector type of NULL or "plasmid" were found in the
     * database, or <code>null</code> if no matching record found
     * @throws SQLException if a database error occurs
     */
    private LoadableClone lookupClone( DBconnection conn,
				  String name,
				  String insertType )
	throws SQLException {

	
	// get factory for creating clone objects from 
	// masterFactory in super class
	CloneFactory cloneFactory = masterFactory.getCloneFactory();
	
	// first look for vector type of "plasmid" 
	String vectorType = "plasmid";

	LoadableClone clone = 
	    cloneFactory.getClone( conn, name, insertType, vectorType );

	// if not found, search again for NULL vector type
	if ( clone == null ) {
	    vectorType = null;
	    clone = cloneFactory.getClone( conn, name, insertType, vectorType );
	}
	
	return clone;
    }


    /**
     * Creates clone object and populates with data from data file.  This 
     * method is called to create a clone entry that will be inserted
     * into the database when expression set data is stored. Method assumes
     * that a search has already been made to make sure that clone does
     * not already exist.
     *
     * @param conn An active connection to the database
     * @param rowData Map of column data for single row of Excel file
     * @param name Name of clone from data file
     * @param insertType Insert type as submitted from data file; value
     * should already have been translated to value for insert type
     * rule.
     * @return Clone object populated with submitted data that can be
     * used to create a new clone record in the database
     * @throws SQLException if a database error occurs
     */
    private LoadableClone createNewClone( DBconnection conn,
					  Map rowData, 
					  String name, 
					  String insertType ) 
	throws SQLException {

	LoadableClone clone = new LoadableClone();
	
	// set name as ucase version of original name
	clone.set_original_name( name );
	clone.set_name( name.toUpperCase() );
	
	clone.set_insert_type( insertType );

	// default vector type to plasmid for all new entries per Marga
	clone.set_vector_type( "plasmid" );

	// get taxon to use for clone
	lookupCloneTaxon( conn, rowData, clone );

	// lookup gene new clone should be linked to
	lookupCloneGene( conn, rowData, clone );

	// validate construct type and translate to
	// acceptable rule value
	String constructType =
	    (String) rowData.get( "clone construct type" );
	
	constructType = translateConstructType( constructType );
	clone.set_construct_type( constructType );
	
	String promoter = (String) rowData.get( "clone promoter" );
	clone.set_promoter( promoter );
	
	String reporter = (String) rowData.get( "clone reporter" );
	clone.set_reporter( reporter );

	// add message to flag that new entry will be added
	// when storing data to db
	String message = 
	    "No clone found with name: " + name + ", " +
	    "insert type: " + insertType + ". " +
	    "WILL BE ADDED";
	
	addWarning( "clone name", message );

	// get reference to factory for creating clone objects from 
	// masterFactory in super class and add new clone object to 
	// factory's cache for reuse in all germplasms that use new record
	CloneFactory cloneFactory = masterFactory.getCloneFactory();
	cloneFactory.addNewClone( clone );

	return clone;
    }

    /**
     * Retrieves taxon data submitted for new clone. If found, taxon data
     * will be added to submitted clone.  If not found, a warning message
     * will be logged
     *
     * @param conn An active connection to the database
     * @param rowData Map of column data for single row of Excel file
     * @param clone Clone to add taxon data to.
     * @throws SQLException if a database error occurs
     */
    private void lookupCloneTaxon( DBconnection conn, 
				   Map rowData,
				   LoadableClone clone )
	throws SQLException {

	String taxonName = (String) rowData.get( "gene taxon" );

	if ( taxonName != null ) {
	    Long taxonID = TfcTaxon.translateScientificName( conn, taxonName );
	    
	    if ( taxonID != null ) {
		TfcTaxon taxon = new TfcTaxon( conn, taxonID );
		clone.setTaxon( taxon );
	    } else {
		addWarning( "gene taxon",
			    "Taxon " + taxonName + " not found." );
	    }
	}
    }
    
    /**
     * Retrieves gene data to associate new clone to. If found, gene
     * data will be added to submitted clone. If not found a warning 
     * message will be logged
     *
     * @param conn An active connection to the database
     * @param clone Clone to add gene data to
     * @param geneName Gene name to look up
     * @return Gene data as a TfcGene object, or <code>null</code> if
     * no gene found for submitted name
     * @throws SQLException if a database error occurs
     */
    private void lookupCloneGene( DBconnection conn, 
				  Map rowData,
				  LoadableClone clone )
	throws SQLException {

	String geneName = (String) rowData.get( "clone gene name" );

	if ( geneName != null ) {
	
	    Long geneID = TfcGene.retrieveGeneID( conn, geneName );
	    
	    if ( geneID != null ) {
		TfcGene gene = new TfcGene( conn, geneID );
		clone.setGene( gene );
		
	    } else {
		addWarning( "clone gene name",
			    "Gene " + geneName + " not found." );
	    }
	}
    }
    


    /**
     * Utility method to validate and translate submitted clone construct 
     * type value into version acceptable to construct type rule on Clone 
     * table.  If submitted value is not a valid construct type, warning message
     * is logged and null value will be returned
     *
     * @param constructType Construct type value to validate and translate
     * @return Translated version of construct type that is acceptable
     * to construct type rule in database, or <code>null</code> if
     * construct type is not valid
     */
    private String translateConstructType( String constructType ) {

	String translatedType = (String) constructTypesMap.get( constructType );

	if ( translatedType == null ) {
	    addError( "clone construct type",
		      "Invalid construct type: " + constructType );
	}

	return translatedType;
    }

    /**
     * Utility method to validate and translate submitted clone insert
     * type value into version acceptable to insert type rule on Clone 
     * table.  If submitted value is not a valid insert type, error message
     * is logged and null value will be returned.
     *
     * @param insertType Insert type value to validate and translate
     * @return Translated version of insert type that is acceptable
     * to insert type rule in database, or submitted value unchanged if
     * not valid. 
     */
    private String translateInsertType( String insertType ) {
	
	String translatedType = null;

	if ( insertType != null ) {
	    translatedType = (String) insertTypesMap.get( insertType );
	    
	    if ( translatedType == null ) {
		addError( "clone insert type", 
			  "Invalid insert type: " + insertType );
	    }
	}

	return translatedType;
    }


    /**
     * Validates submitted clone data to make sure that bare minimum
     * identifying info. for clone has been submitted.  If any of
     * submitted values is null, an error message will be logged
     * and method will return false.
     *
     * <p>
     * NOTE: Although vector type is part of clone's identifying data,
     * its value is not checked since it will never be submitted
     * by users.
     *
     * <p>
     * Insert type values must conform to insert type rule in the database.
     * Submitted value will be translated if possible, or an error message
     * will be added and clone data will be considered invalid.
     *
     * @param name Clone name to validate
     * @param insertType Insert type of clone
     * @return <code>true</code> if sufficient data has been submitted,
     * <code>false</code> if insufficient clone data has been submitted
     */
    private boolean validCloneData( String name, String insertType ) {
	boolean valid = true;
	
	// only check clone data if any of fields are non-null; if
	// null, don't bother validating
	if ( name == null && insertType == null ) {
	    valid = false;

	} else {
	    
	    if ( name == null ) {
		valid = false;
		addError( "clone name", "Clone name cannot be null" );
	    }
	    
	    if ( insertType == null ) {
		valid = false;
		addError( "clone insert type", 
			  "Clone insert type cannot be null" );
		
	    }
	}
	return valid;
    }

    /**
     * Populates species variant data for germplasm. This method
     * should only be called when germplasm.is_natural_variant is
     * true. Species variant record is looked up by abbreviated
     * name and set within germplasm
     *
     * @param conn An active connection to the database
     * @param rowData Map of column data for single row of Excel file
     * @param germplasm Germplasm object to populate with species variant data
     * @throws SQLException if a database error occurs
     */
    private void populateSpeciesVariant( DBconnection conn, 
					 Map rowData, 					 
					 LoadableGermplasm germplasm )
	throws SQLException {

	String abbrevName = (String) rowData.get( "species variant" );

	if ( abbrevName != null ) {

	    // get factory for creating species variant objects from 
	    // masterFactory in super class
	    SpeciesVariantFactory speciesVariantFactory = 
		masterFactory.getSpeciesVariantFactory();

	    // get populated species variant for abbreviated name
	    TfcSpeciesVariant variant = 
		speciesVariantFactory.getSpeciesVariant( conn, abbrevName );

	    // if not found, log error message
	    if ( variant == null ) {
		addError( "species variant",
			  "species variant: " + abbrevName + " not found" );
	    } else {
		germplasm.setSpeciesVariant( variant );
	    }

	    // should only be here if germplasm is natural variant,
	    // in which case lack of species variant name is an error
	} else {
	    addError( "species variant",
		      "No species variant name submitted" );
	}
    }



    /**
     * Populates allele (polymorphism) data for germplasm using data in Excel 
     * sheet. Created objects will reference an existing row in the database if 
     * name found in the database; if an allele name is not found, a warning
     * message is logged.
     *
     * @param conn An active connection to the database
     * @param rowData Map of column data for single row of Excel file
     * @param germplasm Germplasm object to populate with allele data
     * @throws SQLException if a database error occurs
     */
    private void populateAllele( DBconnection conn, 
				 Map rowData, 
				 LoadableGermplasm germplasm )
	throws SQLException {
	
	String[] alleleNames = (String[]) rowData.get( "allele" );
	
	// should only be here if germplasm is mutant,
	// in which case lack of allele name is an error
	if ( alleleNames == null ) {
	    addError( "allele", "allele name cannot be null" );
	} else {

	    // get factory for creating polymorphism objects from 
	    // masterFactory in super class
	    PolymorphismFactory polymorphismFactory = 
		masterFactory.getPolymorphismFactory();

	    // Get populated polymorphism object for each name and
	    // add to germplasm to create association
	    TfcPolymorphism poly = null;
	    
	    for ( int i = 0; i < alleleNames.length; i++ ) {
		poly = 
		    polymorphismFactory.getPolymorphism( conn,
							 alleleNames[ i ],
							 true ); // alleles only
		
		// if not found, log warning message
		if ( poly == null ) {
		    addWarning( "allele",
				"allele name: " + alleleNames[ i ] + 
				" not found" );
		} else {
		
		    // set polymorphism info. for germplasm
		    germplasm.addPolymorphism( poly );

		    // set shortcut flag to record that germplasm has
		    // associated polymorphisms
		    germplasm.set_has_polymorphisms( new Boolean( true ) );
		}
	    }
	}
	
    }

    /**
     * Creates publication objects from submitted pub med ids for germplasm.
     * If pub med id is found in database, a new TairObjectPublication
     * object will be created and added to germplasm.
     *
     * <p>
     * If pub med id is not found, error message is added to collection of
     * messages
     *
     * @param conn An active connection to the database
     * @param rowData Map of column data for single row of Excel file
     * @param germplasm Germplasm to add publications to
     * @throws SQLException if a database error occurs while retrieving
     * publication data
     */
    private void populatePublications( DBconnection conn, 
				      Map rowData,
				      LoadableGermplasm germplasm )
	throws SQLException {
	
	String[] ids = (String[]) rowData.get( "pub med id" );
	
	if ( ids != null ) {
	    
	    // translate pub med ids into reference ids and
	    // create publication objects for each reference id
	    // found for pub med id (should always only be one,
	    // but allow for mutliples just in case)
	    Long[] referenceIDs = null;
	    for ( int i = 0; i < ids.length; i++ ) {
		referenceIDs = 
		    TfcPublication.pubMedToReferenceID( conn, ids[ i ] );


		if ( referenceIDs != null ) {
		    for ( int j = 0; j < referenceIDs.length; j++ ) {
			TairObjectPublication pub = 
			    new TairObjectPublication( conn, 
						       referenceIDs[ j ] );
			
			germplasm.addPublication( pub );
		    }

		    // add error message if pub med id not found
		} else {
		    addError( "pub med id",
			      "pub med id: " + ids[ i ] + " not found" );
		}
	    }
	}
    }
}
