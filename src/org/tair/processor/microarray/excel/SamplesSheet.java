//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.4 $
// $Date: 2006/03/02 19:54:39 $
//------------------------------------------------------------------------------

package org.tair.processor.microarray.excel;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;

import org.tair.bs.community.BsUrl;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.UrlDelegate;
import org.tair.processor.microarray.data.factory.GermplasmFactory;
import org.tair.processor.microarray.data.factory.KeywordFactory;
import org.tair.processor.microarray.data.factory.ProtocolFactory;
import org.tair.processor.microarray.data.LoadableBioSample;
import org.tair.processor.microarray.data.LoadableBioSampleKeyword;
import org.tair.processor.microarray.data.LoadableReferenceKeyword;
import org.tair.processor.microarray.data.LoadableGermplasm;
import org.tair.processor.microarray.data.LoadableLabeledSample;
import org.tair.processor.microarray.data.LoadableProtocol;
import org.tair.querytools.ReferenceURL;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcTaxon;
import org.tair.utilities.TextConverter;

/**
 * SamplesSheet is a concrete implementation of DataSheet that is used
 * to parse and validate data from the "Samples" (bio samples) sheet of the 
 * microarray data loading Excel sheet.  SamplesSheet parses data entered in 
 * this sheet, transforms values from sheet into database objects, and 
 * populates an instance of LoadableExpressionSet with data.
 */

public class SamplesSheet extends DataSheet {

    // delimiter used for columns with multiple entries
    private final String DELIMITER = "|";
    
    // columns in Samples sheet
    private final int EXPRESSIONSET_EXTERNAL_ID = 0;
    private final int REPLICATE_SET_NAME = 1;

    // bio sample
    private final int BIOSAMPLE_NAME = 2;
    private final int BIOMATERIAL_TYPE = 3;
    private final int GERMPLASM_ACCESSION = 4;
    private final int GERMPLASM_NAME = 5;
    private final int GERMPLASM_STOCK_NUMBER = 6;
    private final int BIOMATERIAL_DESCRIPTION = 7;
    private final int IS_CONTROL = 8;
    private final int GROWTH_DESCRIPTION = 9;
    private final int TREATMENT_DESCRIPTION = 10;
    private final int ANATOMY_DESCRIPTION = 11;
    private final int DEVELOPMENT_DESCRIPTION = 12;
    private final int PROBE_TYPE = 13;

    // labeled sample
    private final int LABELEDSAMPLE_NAME = 14;
    private final int LABEL = 15;
    private final int CHANNEL_NUMBER = 16;
    
    // labeling protocol
    private final int LABELING_PROTOCOL_TITLE = 17;
    private final int LABELING_PROTOCOL_PUBMED_ID = 18;
    private final int LABELING_PROTOCOL_DESCRIPTION = 19;
    private final int LABELING_PROTOCOL_AUTHORS = 20;
    private final int LABELING_PROTOCOL_URL = 21;

    // extraction protocol
    private final int RNA_ISOLATION_PROTOCOL_TITLE = 22;
    private final int RNA_ISOLATION_PROTOCOL_PUBMED_ID = 23;
    private final int RNA_ISOLATION_PROTOCOL_DESCRIPTION = 24;
    private final int RNA_ISOLATION_PROTOCOL_AUTHORS = 25;
    private final int RNA_ISOLATION_PROTOCOL_URL = 26;

    // keywords for biosample
    private final int STRUCTURE = 27;
    private final int DEVELOPMENT = 28;

    // probe_quantity 
    private final int PROBE_QUANTITY = 29 ; 

    // list of acceptable bio material types
    private List bioMaterialTypes;

    // Taxon data to use for each bio sample created - will be A. thaliana
    // for all
    private TfcTaxon taxon;

    
    /**
     * Creates an instance of SamplesSheet that can be used to parse
     * the "Samples" data sheet of microarray Excel file.  
     *
     * @param sheetName Literal name of Samples sheet as it appears in 
     * Excel data file. This name is used to retrieve Sheet object that 
     * contains all data as it appears in Excel file.
     */
    public SamplesSheet( String sheetName ) {
	super( sheetName );
	initializeBioMaterialTypes();
    }


    /**
     * Initializes list for validating bio material types with all
     * acceptable values from database rule.
     */
    private void initializeBioMaterialTypes() {
	bioMaterialTypes = new ArrayList();
	bioMaterialTypes.add( "seed" );
	bioMaterialTypes.add( "cell_culture" );
	bioMaterialTypes.add( "tissue_culture" );
    }


    /**
     * Parses Samples data sheet from Excel file and populates expression
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
    public void parseSheet( DBconnection conn ) throws SQLException {

	// Create data cell objects for retrieving data for this
	// sheet and doing basic validation for each cell.
	ExcelDataCell[] dataCells = createDataCells();

	// data retrieved for current row with field name referencing
	// submitted value
	Map rowData = null;

	// BioSample object for each row 
	LoadableBioSample bioSample = null;

	// initialize taxon data to be used for all biosamples
	initializeTaxon( conn );

	// ignore first row (index 0) - column headers
	for ( int i = 1; i < sheet.getRows(); i++ ) {

	    // Set current row of data in superclass
	    setCurrentRow( i );

	    // retrieve and validate current row of data using
	    // validation method defined in superclas
	    rowData = validateDataCells( dataCells );

	    bioSample = populateBioSample( rowData );
	    populateGermplasm( conn, rowData, bioSample );

	    // need labeled sample to add entry for row tracker
	    String labeledSampleName =
		populateLabeledSample( conn, rowData, bioSample );

	    populateExtractionProtocol( conn, rowData, bioSample );
	    populateKeywords( conn, rowData, bioSample );
	    	    
	    // add bio sample to expression set
	    expressionSet.addBioSample( bioSample );

	    // record name of bio sample and labeled sample submitted
	    // on this row of data for presenting results back to 
	    // curator in the order it was received
	    rowTracker.setSampleRow( i, 
				     bioSample.get_name(),
				     labeledSampleName );
	}
    }




    /**
     * Creates list of data cell objects used for retrieving and
     * validating data from Samples Excel data sheet.  Each cell object
     * is populated with its field name, the column index it exists at
     * in the datasheet, and whether it is a required field or not
     *
     * @return Array of ExcelDataCell objects that can be used to retrieve
     * and validate data from Samples data sheet
     */
    private ExcelDataCell[] createDataCells() {
	ExcelDataCell[] cells = new ExcelDataCell[ 30 ];

	// not used currently
	cells[ 0 ] = new ExcelDataCell( "external id", 
					EXPRESSIONSET_EXTERNAL_ID, 
					true );
	
	// replicate sets this sample/labeled sample is used in
	cells[ 1 ] = new DelimitedDataCell( "replicate set name",
					    REPLICATE_SET_NAME, 
					    true,
					    DELIMITER );

	// bio sample data
	cells[ 2 ] = new ExcelDataCell( "sample name", BIOSAMPLE_NAME, true );

	cells[ 3 ] = new ExcelDataCell( "bio material type", 
					BIOMATERIAL_TYPE, 
					true );

	cells[ 4 ] = new LongDataCell( "germplasm accession", 
				       GERMPLASM_ACCESSION,
				       false );

	cells[ 5 ] = new ExcelDataCell( "germplasm name",
					GERMPLASM_NAME, 
					false );

	cells[ 6 ] = new ExcelDataCell( "germplasm stock number",
					GERMPLASM_STOCK_NUMBER, 
					false );

	cells[ 7 ] = new ExcelDataCell( "bio material description", 
					BIOMATERIAL_DESCRIPTION, 
					false );

	cells[ 8 ] = new BooleanDataCell( "is control", IS_CONTROL, false );

	cells[ 9 ] = new ExcelDataCell( "growth description", 
					GROWTH_DESCRIPTION, 
					true );

	cells[ 10 ] = new ExcelDataCell( "treatment description", 
					 TREATMENT_DESCRIPTION,
					 true );

	cells[ 11 ] = new ExcelDataCell( "anatomy description", 
					 ANATOMY_DESCRIPTION, 
					 true );

	cells[ 12 ] = new ExcelDataCell( "development description", 
					 DEVELOPMENT_DESCRIPTION, 
					 true );

	cells[ 13 ] = new ExcelDataCell( "probe type", PROBE_TYPE, false );

	// labeled sample
	cells[ 14 ] = new ExcelDataCell( "labeled sample name", 
					 LABELEDSAMPLE_NAME,
					 true );

	cells[ 15 ] = new ExcelDataCell( "label", LABEL, true );

	cells[ 16 ] = new ExcelDataCell( "channel number", 
					 CHANNEL_NUMBER, 
					 false );
    
	// labeling protocol
	cells[ 17 ] = new ExcelDataCell( "labeling protocol title", 
					 LABELING_PROTOCOL_TITLE,
					 false );

	cells[ 18 ] = new IntegerDataCell( "labeling protocol pub med id", 
					   LABELING_PROTOCOL_PUBMED_ID,
					   false );

	cells[ 19 ] = new ExcelDataCell( "labeling protocol description", 
					 LABELING_PROTOCOL_DESCRIPTION, 
					 false );

	cells[ 20 ] = new ExcelDataCell( "labeling protocol authors",
					 LABELING_PROTOCOL_AUTHORS, 
					 false );

	cells[ 21 ] = new ExcelDataCell( "labeling protocol url", 
					 LABELING_PROTOCOL_URL, 
					 false );

	// extraction protocol
	cells[ 22 ] = new ExcelDataCell( "isolation protocol title",
					 RNA_ISOLATION_PROTOCOL_TITLE,
					 false );

	cells[ 23 ] = new IntegerDataCell( "isolation protocol pub med id", 
					   RNA_ISOLATION_PROTOCOL_PUBMED_ID,
					   false );
	
	cells[ 24 ] = new ExcelDataCell( "isolation protocol description", 
					 RNA_ISOLATION_PROTOCOL_DESCRIPTION, 
					 false );

	cells[ 25 ] = new ExcelDataCell( "isolation protocol authors", 
					 RNA_ISOLATION_PROTOCOL_AUTHORS,
					 false );

	cells[ 26 ] = new ExcelDataCell( "isolation protocol url", 
					 RNA_ISOLATION_PROTOCOL_URL, 
					 false );

	// keywords for biosample
	cells[ 27 ] = new DelimitedDataCell( "structure", 
					     STRUCTURE, 
					     false,
					     DELIMITER );

	cells[ 28 ] = new DelimitedDataCell( "development", 
					     DEVELOPMENT,
					     false, 
					     DELIMITER );

        cells[ 29 ] = new ExcelDataCell( "probe quantity", 
					 PROBE_QUANTITY,  
					 false );

	return cells;
    }

    /**
     * Creates a taxon object to be used for all new bio samples created
     * here.  Taxon will be A. thaliana for all bio samples created with
     * this tool. Taxon object stored as member variable so all objects
     * can use same instance.
     *
     * @param conn An active connection to the database
     * @return TfcTaxon object representing data for A. thaliana that can
     * be used for all bio samples created from data file data
     * @throws SQLException if a database error occurs
     */
    private void initializeTaxon( DBconnection conn )
	throws SQLException {

	Long taxonID = 
	    TfcTaxon.translateScientificName( conn, "Arabidopsis thaliana" );

	this.taxon = new TfcTaxon( conn, taxonID );
    }


    /**
     * Retrieves populated bio sample object for current row of data. Returned
     * object may have been populated from a previous row of data - this
     * can happen if multiple labeled samples are submitted for same bio sample.
     *
     * @param rowData Map of column data for single row of Excel file
     * @return Bio sample populated with data
     */
    private LoadableBioSample populateBioSample( Map rowData) {

	// see if a bio sample has already been created for this name,
	// if not, create one now and populate with current row of data
	LoadableBioSample bioSample = null;

	String name = (String) rowData.get( "sample name" );
	bioSample = expressionSet.getBioSample( name );

	if ( bioSample == null ) {
	    bioSample = new LoadableBioSample();
	    bioSample.set_name( name );
	    
	    // ensure submitted value for bio material type is acceptable
	    // value for database rule
	    String bioType = (String) rowData.get( "bio material type" );
	    bioSample.set_biomaterial_type( bioType );
	    if ( !bioMaterialTypes.contains( bioType ) ) {
		addError( "bio material type", "Invalid bio material type" );
	    }

	    
	    String descr = (String) rowData.get( "bio material description" );
	    bioSample.set_biomaterial_description( descr );
	    
	    bioSample.set_is_control( (Boolean) rowData.get( "is control" ) );
	    
	    String growthDescr = (String) rowData.get( "growth description" );
	    bioSample.set_growth_description( growthDescr );
	    
	    String treatDescr = (String) rowData.get( "treatment description" );
	    bioSample.set_treatment_description( treatDescr );
	    
	    String anatDescr = (String) rowData.get( "anatomy description" );
	    bioSample.set_anatomy_description( anatDescr );
	    
	    String devDescr = (String) rowData.get( "development description" );
	    bioSample.set_development_description( devDescr );
	    
	    bioSample.set_probe_type( (String) rowData.get( "probe type" ) );
            bioSample.set_measurement( (String) rowData.get( "probe quantity" ) );
	    // set taxon data - A. thaliana for all new entries
	    bioSample.setTaxon( this.taxon );
	}

	return bioSample;
    }


    /**
     * Populates germplasm info. for bio sample by looking up submitted
     * TAIR accession, name or stock number of germplasm.  If found,
     * germplasm data is set here.  If not found, error messages are
     * logged. If Germplasms sheet contains data for a germplasm here,
     * new record should be created through processing there and
     * association to bio sample should be taken care of.
     *
     * @param conn An active connection to the database
     * @param rowData Map of column data for single row of Excel file
     * @param bioSample Bio sample to populate
     * @throws SQLException if a database error occurs
     */
    private void populateGermplasm( DBconnection conn,
				    Map rowData, 
				    LoadableBioSample bioSample ) 

	throws SQLException {


	// try to get germplasm with submitted criteria - try id, name
	// and stock number in that order
	Long tairObjectID = (Long) rowData.get( "germplasm accession" );
	String name = (String) rowData.get( "germplasm name" );
	String stockNumber = (String) rowData.get( "germplasm stock number" );

	// get factory for creating germplasm objects from 
	// masterFactory in super class
	GermplasmFactory germplasmFactory = masterFactory.getGermplasmFactory();

	LoadableGermplasm germplasm = null;

	if ( tairObjectID != null ) {
	    germplasm = germplasmFactory.getGermplasmAccession( conn, 
								tairObjectID );
	}		
		
	if ( germplasm == null && name != null ) {
	    germplasm = 
		germplasmFactory.getGermplasmName( conn, name );
	}

	if ( germplasm == null && stockNumber != null ) {
	    germplasm =
		germplasmFactory.getGermplasmStock( conn, stockNumber );
	}


	// if still null, log not found notices for each field that was
	// tried as well as additional notice that germplasm record may be
	// added through germplasm sheet
	if ( germplasm == null ) {

	    String newMsg = 
		"New germplasm will be added if included " +
		"in Germplasms data sheet";

	    String err = null;
	    if ( tairObjectID != null ) {
		err = "TAIR accession " + tairObjectID + " not found.";
		addWarning( "germplasm accession", err );
		addWarning( "germplasm accession", newMsg );
	    } 

	    if ( name != null ) {
		err = "Germplasm name " + name + " not found.";
		addWarning( "germplasm name", err );
		addWarning( "germplasm name", newMsg );
	    }

	    if ( stockNumber != null ) {
		err = "No germplasm for stock number " + stockNumber;
		addWarning( "germplasm stock number", err );
		addWarning( "germplasm stock number", newMsg );
	    }

	    // else if found, add to bio sample
	} else {
	    bioSample.setGermplasm( germplasm );

	    // if stock number submitted, add it to germplasm since
	    // it won't be available for display otherwise (not
	    // part of Germplasm table)
	    if ( stockNumber != null ) {
		germplasm.setStockNumber( stockNumber );
	    }
					
	}
    }
	

    /**
     * Populates labeled sample for bio sample and hyb description, including
     * labeling protocol data
     *
     * @param conn An active connection to the database
     * @param rowData Map of column data for single row of Excel file
     * @param bioSample Bio sample used in labeled sample
     * @return Name of labeled sample; this value is needed for recording
     * data submitted on each row of data sheet
     * @throws SQLException if a database error occurs
     */
    private String populateLabeledSample( DBconnection conn,
					  Map rowData,
					  LoadableBioSample bioSample )
	throws SQLException {

	// get names of replicate sets (hyb descriptions) this sample
	// is used in and make one labeled sample for each
	String[] hybDescrNames = (String[]) rowData.get( "replicate set name" );
	
	LoadableLabeledSample labeledSample = null;

	String labeledSampleName = null;
	for ( int i = 0; i < hybDescrNames.length; i++ ) {
	    labeledSample = new LoadableLabeledSample();

	    labeledSampleName = (String) rowData.get( "labeled sample name" );
	    labeledSample.set_name( labeledSampleName );
	    labeledSample.set_label( (String) rowData.get( "label") );
	    
	    String channelNum = (String) rowData.get( "channel number" );
	    labeledSample.set_channel_number( channelNum );

	    // set bio sample and hyb description name for labeled sample
	    // so they can be identified when primary keys are null
	    labeledSample.setBioSampleName( bioSample.get_name() );
	    labeledSample.setHybDescriptionName( hybDescrNames[ i ] );
	    
	    // populate protocol data for sample
	    populateLabelingProtocol( conn, rowData, labeledSample );

	    // add labeled sample to expression set's collection
	    expressionSet.addLabeledSample( labeledSample );
	}

	return labeledSampleName;
    }


    /**
     * Populates labeling protocol for labeled sample using data in
     * Excel sheet. Created object will reference an existing row in the
     * database if protocol name was found in database; if not, primary key 
     * of object will be null and object will be populated with data from
     * submitted row of Excel sheet. New protocol row will be inserted when
     * store is  called on BioSample.
     *
     * @param conn An active connection to the database
     * @param rowData Map of column data for single row of Excel file
     * @param labeledSample Labeled sample to populate protocol data for
     * @throws SQLException if a database error occurs
     */
    private void populateLabelingProtocol( DBconnection conn,
					   Map rowData,
					   LoadableLabeledSample labeledSample )
	throws SQLException {
	
	String name = (String) rowData.get( "labeling protocol title" );

	Integer pubMedID = 
	    (Integer) rowData.get( "labeling protocol pub med id" );

	String descr = (String) rowData.get( "labeling protocol description" );
	String authors = (String) rowData.get( "labeling protocol authors" );
	String url = (String) rowData.get( "labeling protocol url" );

	// get factory for creating protocol objects from 
	// masterFactory in super class
	ProtocolFactory protocolFactory = masterFactory.getProtocolFactory();

	if ( name != null ) {
            if (descr == null){ descr=""; } 
	    // lookup title to see if row already exists -- factory will return
	    // an object populated with db data or with protocol data from a 
	    // previous row of excel sheet		
	    LoadableProtocol protocol = 
		protocolFactory.getProtocol( conn, name , descr);

	    // if not found, populate instance with submitted values --
	    // new record will be created when data is stored to db
	    if ( protocol == null ) {
		protocol = new LoadableProtocol();
		protocol.set_title( name );
		protocol.set_description( descr );
		protocol.set_authors( authors );
		protocol.set_pubmed_id( pubMedID );

		// set status to active for all new protocols - per Marga
		protocol.set_status( "active" );

		// add warning message to flag that new entry will be added
		// when storing data to db
		String message = name + " not found.  WILL BE ADDED";
		addWarning( "labeling protocol title", message );

		// add new protocol object to factory's cache for
		// reuse in all bio samples that use new record
		protocolFactory.addNewProtocol( protocol );
	    }

	    // set URL for new and existing records if submitted
	    if ( !TextConverter.isEmpty( url ) ) {
		ReferenceURL refUrl = createRefUrl(name, url);
		protocol.addURL( refUrl );
	    }

            // set protocol_keywords 
            populateProtocolKeywords( conn, "labeling protocol", protocol );
           
	    // set protocol reference for labeled sample
	    labeledSample.setLabelingProtocol( protocol );
	}
    }


    /**
     * Create a ReferenceURL object from a name and url. The method queries
     * a BsUrl object from the database, and if one doesn't exist for that
     * URL, it creates a new URL.
     * @param name the protocol name
     * @param url the URL string
     * @return a ReferenceURL object with embedded BsUrl object
     */
    private ReferenceURL createRefUrl(String name, String url) {
      ReferenceURL refUrl = new ReferenceURL();
          // Query the BsUrl for the url.
          UrlDelegate delegate = CommunityDelegateFactory.getUrlDelegate();
          BsUrl urlObject = delegate.getUrlByUrl(url);
          if (urlObject == null) {
            Timestamp dateLastVerified = new Timestamp(System.currentTimeMillis());
            // Create URL using null to generate id.
            urlObject = delegate.createUrl(null, url, name, dateLastVerified);
          }
      refUrl.setUrl( urlObject );
      return refUrl;
    }

    /**
     * Populates RNA isolation (extraction) protocol data for bio sample 
     * using data in Excel sheet. Created object will reference an existing 
     * row in the database if protocol name was found in database; if not,
     * primary key of object will be null and object will be populated with
     * data from submitted row of Excel sheet. New protocol row will be 
     * inserted when store is called on BioSample.
     *
     * @param conn An active connection to the database
     * @param rowData Map of column data for single row of Excel file
     * @param bioSample Bio sample to populate protocol data for
     * @throws SQLException if a database error occurs
     */
    private void populateExtractionProtocol( DBconnection conn,
					     Map rowData,
					     LoadableBioSample bioSample )
	throws SQLException {
	
	String name = (String) rowData.get( "isolation protocol title" );

	Integer pubMedID = 
	    (Integer) rowData.get( "isolation protocol pub med id" );

	String descr = (String) rowData.get( "isolation protocol description" );
	String authors = (String) rowData.get( "isolation protocol authors" );
	String url = (String) rowData.get( "isolation protocol url" );

	if ( name != null ) {
            if (descr == null){ descr=""; } 
	    // get factory for creating protocol objects from 
	    // masterFactory in super class
	    ProtocolFactory protocolFactory = masterFactory.getProtocolFactory();

	    // get populated protocol object for submitted name -- factory will
	    // return an object populated with db data or with protocol data from
	    // a previous row of excel sheet
	    LoadableProtocol protocol = 
		protocolFactory.getProtocol( conn, name, descr );

	    // if not found, populate instance with submitted values --
	    // new record will be created when data is stored to db
	    if ( protocol == null ) {
		protocol = new LoadableProtocol();
		protocol.set_title( name );
		protocol.set_description( descr );
		protocol.set_authors( authors );
		protocol.set_pubmed_id( pubMedID );

		// set status to active for all new protocols - per Marga
		protocol.set_status( "active" );

		// add warning message to flag that new entry will be added
		// when storing data to db
		String message = name + " not found.  WILL BE ADDED";
		addWarning( "isolation protocol title", message );

		// add new protocol object to factory's cache for
		// reuse in all bio samples that use new record
		protocolFactory.addNewProtocol( protocol );
	    }
	
	    // set URL for new and existing records if submitted
	    if ( !TextConverter.isEmpty( url ) ) {
        ReferenceURL refUrl = createRefUrl(name, url);
		protocol.addURL( refUrl );
	    }
            // set protocol_keywords 
            populateProtocolKeywords(conn, "isolation protocol", protocol );
       
	    // set extraction protocol reference for bio sample
	    bioSample.setExtractionProtocol( protocol );
	}
    }
    private void  populateProtocolKeywords( DBconnection conn,
                                            String protocol_type, 
                                            LoadableProtocol protocol)
      throws SQLException {
        // get factory for creating keyword objects from 
	// masterFactory in super class
     
        HashMap protocol_keyword =  new HashMap();
        protocol_keyword.put ("isolation protocol", "mRNA isolation" );
        protocol_keyword.put ("labeling protocol", "probe labeling" );
        
        KeywordFactory keywordFactory = masterFactory.getKeywordFactory();

        List keywords =  new ArrayList();
        keywords.add ("microarray");
        keywords.add ((String)protocol_keyword.get( protocol_type ));
    
        for (int i = 0; i <keywords.size(); i++ ){  
	    String this_keyword = (String)keywords.get(i); 
            LoadableReferenceKeyword  keyword = keywordFactory.getReferenceKeyword( conn, this_keyword, "meth" );
	    if ( keyword != null ) {
		protocol.addKeyword( keyword );
        	// log error if not found
	    } else {
		String errorMessage = "keyword not found or multiple keywords found: " + this_keyword ;
		addError( "protocol", errorMessage );
	    }
	}
    }
    
    /**
     * Creates keyword objects for values entered for strcuture and development
     * keywords and adds them to bio sample
     *
     * <p>
     * If a keyword is not found, error message is added to collection of
     * messages
     *
     * @param conn An active connection to the database
     * @param rowData Map of column data for single row of Excel file
     * @param bioSample Bio sample to add keywords for
     * @throws SQLException if a database error occurs while retrieving
     * keyword data
     */
    private void populateKeywords( DBconnection conn, 
				   Map rowData, 
				   LoadableBioSample bioSample ) 
	throws SQLException {

	// get factory for creating keyword objects from 
	// masterFactory in super class
	KeywordFactory keywordFactory = masterFactory.getKeywordFactory();
        // will need to talk to Marga what format the excel will use 
	String[] structure = (String[]) rowData.get( "structure" );
	if ( structure != null ) {
	    populateStructure( conn, keywordFactory, structure, bioSample );
	}

	String[] developmentalStages = (String[]) rowData.get( "development" );
	if ( developmentalStages != null ) {
	    populateDevelopmentalStages( conn, 
					 keywordFactory, 
					 developmentalStages, 
					 bioSample );
	}

    }


    /**
     * Translates all keywords in submitted list into keyword objects
     * using KeywordFactory and adds to bio sample as structure keywords.
     * If any keyword is not found or mutiple keyword found for the same name 
     * and type in the database, an error message is added to error list.
     *
     * @param conn An active connection to the database
     * @param keywordFactory Keyword factory to handle population of 
     * keyword objects
     * @param structure Structure keywords
     * @param bioSample Bio sample to populate
     * @throws SQLException if a database error occurs
     */
    private void populateStructure( DBconnection conn,
				  KeywordFactory keywordFactory,
				  String[] structure,
				  LoadableBioSample bioSample ) 
	throws SQLException {

	LoadableBioSampleKeyword keyword = null;
        
        String [] types =  {"stru", "grow", "user"} ; 
        List possibleKeywordTypes = Arrays.asList( types);
	
        for ( int i = 0; i < structure.length; i++ ) {
            
	    keyword = keywordFactory.getBioSampleKeyword( conn, 
							  structure[ i ], 
                                                          possibleKeywordTypes );
	    if ( keyword != null ) {
		bioSample.addStructureKeyword( keyword );

		// log error if not found
	    } else {
		String errorMessage = "keyword not found or multiple keywords found: " + structure[ i ];
		addError( "structure", errorMessage );
	    }
	}
    }


    /**
     * Translates all keywords in submitted list into keyword objects
     * using KeywordFactory and adds to bio sample as developmental stage 
     * keywords. If any keyword is not found in the database, an error message 
     * is added to error list.
     *
     * @param conn An active connection to the database
     * @param keywordFactory Keyword factory to handle population of 
     * keyword objects
     * @param developmentalStages Developmental stage keywords
     * @param bioSample Bio sample to populate
     * @throws SQLException if a database error occurs
     */
    private void populateDevelopmentalStages( DBconnection conn, 
					      KeywordFactory keywordFactory,
					      String[] developmentalStages,
					      LoadableBioSample bioSample ) 
	throws SQLException {

	LoadableBioSampleKeyword keyword = null; 
        String [] types =  {"stru", "grow", "user"} ; 
        List possibleKeywordTypes = Arrays.asList( types);
	
	for ( int i = 0; i < developmentalStages.length; i++ ) {
	    keyword = 
		keywordFactory.getBioSampleKeyword( conn, 
						    developmentalStages[ i ],  possibleKeywordTypes);
	    if ( keyword != null ) {
		bioSample.addDevelopmentalStage( keyword );

		// log error if not found
	    } else {
		String errorMessage = 
		    "keyword not found or multiple kwywords found : " + developmentalStages[ i ];

		addError( "development", errorMessage );
	    }
	}
    }

}
