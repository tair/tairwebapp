//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.2 $
// $Date: 2004/10/12 21:26:56 $
//------------------------------------------------------------------------------

package org.tair.processor.microarray.excel;

import jxl.Sheet;

import java.sql.SQLException;
import java.util.Map;
import java.util.HashMap;

import org.tair.processor.microarray.data.LoadableHybDescription;
import org.tair.querytools.HybData;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAffyMetrics;

/**
 * SlidesSheet is a concrete implementation of DataSheet that is used
 * to parse and validate data from the "Slides"  (hyb data) sheet of the 
 * microarray data loading Excel sheet.  SlidesSheet parses data entered in 
 * this sheet, transforms values from sheet into database objects, and 
 * populates an instance of LoadableExpressionSet with data.
 */

public class SlidesSheet extends DataSheet {
    
    // columns in Slides sheet

    // not used currently
    private final int EXPRESSIONSET_EXTERNAL_ID = 0;

    private final int REPLICATE_SET_NAME = 1;

    // HybData fields
    private final int SLIDE_NAME = 2;
    private final int IS_TECH_REPLICATE = 3;
    private final int IS_BIO_REPLICATE = 4;
    private final int SCAN_PARAMETERS = 5;
    private final int NORMALIZATION_FACTOR = 6;
    private final int SCALING_FACTOR = 7;
    private final int TXT_FILE_NAME = 8;
    private final int CEL_NAME = 9;
    private final int DAT_NAME = 10;

    // Affymetrix fields
    private final int SDTM = 11;
    private final int SRT = 12;
    private final int FC_INTENSITY = 13;
    private final int ABS_DEC_MATRIX = 14;
    private final int CENTRAL_MINUS_COUNT = 15;
    private final int CENTRAL_MINUS_AVG = 16;
    private final int CORNER_PLUS_COUNT = 17;
    private final int CORNER_PLUS_AVG = 18;
    private final int CORNER_MINUS_COUNT = 19;
    private final int CORNER_MINUS_AVG = 20;
    private final int BACKGROUND_AVG = 21;
    private final int BACKGROUND_STDEV = 22;
    private final int NOISE = 23;
    private final int ALPHA1 = 24;
    private final int ALPHA2 = 25;
    private final int TAU = 26;
    private final int TGT_VALUE = 27;
    private final int GAMMA1H = 28;
    private final int GAMMA1L = 29;
    private final int GAMMA2H = 30;
    private final int GAMMA2L = 31;
    private final int PERTURBATION = 32;
    private final int NOISE_RAW_Q = 33;
    private final int BASELINE_SF = 34;


    /**
     * Creates an instance of SlidesSheet that can be used to parse
     * the "Slides" data sheet of microarray Excel file.  
     *
     * @param sheetName Literal name of Slides sheet as it appears in 
     * Excel data file. This name is used to retrieve Sheet object that 
     * contains all data as it appears in Excel file.
     */
    public SlidesSheet( String sheetName ) {
	super( sheetName );
    }


    /**
     * Parses Slides data sheet from Excel file and populates expression
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

	// create HybData object for each row and populate with
	// data -- add any validation error messages to object for
	// display
	HybData hybData = null;
	
	// replicate set hyb data slide is added to
	LoadableHybDescription hybDescription;
	
	// ignore first row (index 0) - column headers
	for ( int i = 1; i < sheet.getRows(); i++ ) {

	    // Set current row of data in superclass
	    setCurrentRow( i );

	    // retrieve and validate current row of data using
	    // validation method defined in superclas
	    rowData = validateDataCells( dataCells );

	    hybData = new HybData();
	    populateHybData( rowData, hybData );

	    // get replicate set to add hyb data slide to
	    hybDescription = getHybDescription( rowData );
	    hybDescription.addHybData( hybData );

	    // validate array design specific data for slide - 
	    // populate affymetrix data if needed
	    checkArrayDesign( rowData, hybDescription, hybData );

	    // record name of slide and replicate set submitted
	    // on this row of data for presenting results back to 
	    // curator in the order it was received
	    rowTracker.setSlideRow( i, 
				    hybData.get_name(), 
				    hybDescription.get_name() );
	}
    }	

    /**
     * Creates list of data cell objects used for retrieving and
     * validating data from Slides Excel data sheet.  Each cell object
     * is populated with its field name, the column index it exists at
     * in the datasheet, and whether it is a required field or not
     *
     * @return Array of ExcelDataCell objects that can be used to retrieve
     * and validate data from Slides data sheet
     */
    private ExcelDataCell[] createDataCells() {
	ExcelDataCell[] cells = new ExcelDataCell[ 35 ];

	cells[ 0 ] = new ExcelDataCell( "external id", 
					EXPRESSIONSET_EXTERNAL_ID,
					true );

	cells[ 1 ] = new ExcelDataCell( "replicate set name", 
					REPLICATE_SET_NAME, 
					false );
	
	// HybData 
	cells[ 2 ] = new ExcelDataCell( "slide name", 
					SLIDE_NAME, 
					true );

	cells[ 3 ] = new BooleanDataCell( "is tech replicate",
					  IS_TECH_REPLICATE, 
					  false );

	cells[ 4 ] = new BooleanDataCell( "is bio replicate", 
					  IS_BIO_REPLICATE, 
					  false );

	cells[ 5 ] = new ExcelDataCell( "scan parameters", 
					SCAN_PARAMETERS, 
					false );

	cells[ 6 ] = new FloatDataCell( "normalization factor",
					NORMALIZATION_FACTOR,
					false );

	cells[ 7 ] = new FloatDataCell( "scaling factor", 
					SCALING_FACTOR, 
					false );

	cells[ 8 ] = new ExcelDataCell( "txt file name", TXT_FILE_NAME, true );
	cells[ 9 ] = new ExcelDataCell( "cel name", CEL_NAME, false );
	cells[ 10 ] = new ExcelDataCell( "dat name", DAT_NAME, false );
    
	// Affymetrix
	cells[ 11 ] = new IntegerDataCell( "SDTm", SDTM, false );
	cells[ 12 ] = new FloatDataCell( "SRT", SRT, false );

	cells[ 13 ] = new FloatDataCell( "FC intensity threshold", 
					 FC_INTENSITY, 
					 false );

	cells[ 14 ] = new ExcelDataCell( "abs dec matrix", 
					 ABS_DEC_MATRIX,
					 false );

	cells[ 15 ] = new IntegerDataCell( "central minus count", 
					   CENTRAL_MINUS_COUNT,
					   false );

	cells[ 16 ] = new FloatDataCell( "central minus average", 
					 CENTRAL_MINUS_AVG, 
					 false );

	cells[ 17 ] = new IntegerDataCell( "corner plus count", 
					   CORNER_PLUS_COUNT,
					   false );

	cells[ 18 ] = new FloatDataCell( "corner plus average", 
					 CORNER_PLUS_AVG,
					 false );

	cells[ 19 ] = new IntegerDataCell( "corner minus count", 
					   CORNER_MINUS_COUNT, 
					   false );

	cells[ 20 ] = new FloatDataCell( "corner minus average", 
					 CORNER_MINUS_AVG, 
					 false );

	cells[ 21 ] = new FloatDataCell( "background average", 
					 BACKGROUND_AVG, 
					 false );

	cells[ 22 ] = new FloatDataCell( "background stdev", 
					 BACKGROUND_STDEV, 
					 false );

	cells[ 23 ] = new FloatDataCell( "noise", NOISE, false );
	cells[ 24 ] = new FloatDataCell( "alpha1", ALPHA1, false );
	cells[ 25 ] = new FloatDataCell( "alpha2", ALPHA2, false );
	cells[ 26 ] = new FloatDataCell( "tau", TAU, false );
	cells[ 27 ] = new FloatDataCell( "TGT value", TGT_VALUE, false );
	cells[ 28 ] = new FloatDataCell( "gamma1h", GAMMA1H, false );
	cells[ 29 ] = new FloatDataCell( "gamma1l", GAMMA1L, false );
	cells[ 30 ] = new FloatDataCell( "gamma2h", GAMMA2H, false );
	cells[ 31 ] = new FloatDataCell( "gamma2l", GAMMA2L, false );
	cells[ 32 ] = new FloatDataCell( "perturbation", PERTURBATION, false );
	cells[ 33 ] = new FloatDataCell( "baseline noise", NOISE_RAW_Q, false );
	cells[ 34 ] = new FloatDataCell( "baseline sf", BASELINE_SF, false );

	return cells;
    }


    /**
     * Populates hyb data slide object with HybData specific data
     * entered in Excel spreadsheet
     *
     * @param rowData Map of column data for single row of Excel file
     * @param hybData Hyb data object to populate
     */
    private void populateHybData( Map rowData, HybData hybData ) {

	// set formatted name as original name and ucase version for
	// name
	String name = (String) rowData.get( "slide name" );
	hybData.set_original_name( name );
	hybData.set_name( name.toUpperCase() );

	Boolean isTechRep = (Boolean) rowData.get( "is tech replicate" );
	hybData.set_is_tech_replicate( isTechRep );

	Boolean isBioRep = (Boolean) rowData.get( "is bio replicate" );
	hybData.set_is_bio_replicate( isBioRep );

	String scanParams = (String) rowData.get( "scan parameters" );
	hybData.set_scan_parameters( scanParams );

	Float normFactor = (Float) rowData.get( "normalization factor" );
	hybData.set_normalization_factor( normFactor );

	hybData.set_scaling_factor( (Float) rowData.get( "scaling factor" ) );
	hybData.set_txt_file_name( (String) rowData.get( "txt file name" ) );
	hybData.set_cel_name( (String) rowData.get( "cel name" ) );
	hybData.set_dat_name( (String) rowData.get( "dat name" ) );

	// set now as date entered
	hybData.set_date_entered( new java.util.Date() );
	
    }

    /**
     * Checks array design name for submitted replicate set and does data
     * validation or retrieval for array design. If array design is Affymetrix,
     * affy specific data will be retrieved from rowData and set for hybData.
     *
     * @param rowData Map of column data for single row of Excel file
     * @param hybDescription Replicate set containing hyb data slide; needed 
     * for determining whether slide uses Affymetrix array design
     * @param hybData Hyb data object to validate and populate
     */
    private void checkArrayDesign( Map rowData, 
				   LoadableHybDescription hybDescription, 
				   HybData hybData ) 
    {
	// if replicate set uses affymetrix, do special validation
	// and data retrieval
	if ( isAffy( hybDescription ) ) {
	    
	    if ( hybData.get_normalization_factor() == null &&
		 hybData.get_scaling_factor() == null ) {

		String errMsg = 
		    "Normalization factor or scale factor must be submitted " +
		    "for array design " + 
		    hybDescription.get_array_design_name();
		
		addError( "normalization factor", errMsg );
		addError( "scale_factor", errMsg );
	    }

	    if ( hybData.get_cel_name() == null ) {
		String errMsg = 
		    "Cel name must be submitted for array design " + 
		    hybDescription.get_array_design_name();
	    }
	    
	    // retrieve affy specific data and add to slide object
	    TfcAffyMetrics affy = populateAffymetrix( rowData );
	    hybData.setAffyMetrics( affy );
	    
	    // make sure data slide has proper data for non-affy slide
	} else {
	    // non-Affy data requires normalization factor
	    if ( hybData.get_normalization_factor() == null ) {
		addError( "normalization factor",
			  "Normalization factor must be submitted for " +
			  "array design " + 
			  hybDescription.get_array_design_name() );
	    }
	}
    }


    /**
     * Determines if submitted replicate set uses Affymetrix chips or not
     * by checking array design name.
     *
     * @param hybDescription Replicate set to check array design for.
     * @return <code>true</code> if replicate set uses Affymetrix array design,
     * or <code>false</code> if array design is not Affymetrix
     */
    private boolean isAffy( LoadableHybDescription hybDescription ) {
	String arrayName = hybDescription.get_array_design_name();
	
	return ( arrayName != null && arrayName.startsWith( "Affy" ) );
    }


    /**
     * Creates TfcAffyMetrics object that contains Affymetrix specific data 
     * entered in Excel spreadsheet. This method assumes that array design of
     * replicate set has already been determined to be affy, in which case
     * affy specific data should be present.
     *
     * @param rowData Map of column data for single row of Excel file
     * @return TfcAffyMetrics object containing all data submitted Affymetrix
     * data for a particular row.
     */
    private TfcAffyMetrics populateAffymetrix( Map rowData ) {

	TfcAffyMetrics affy = new TfcAffyMetrics();

	affy.set_SDTm( (Integer) rowData.get( "SDTm" ) );
	affy.set_SRT( (Float) rowData.get( "SRT" ) );
	
	Float intensThresh = (Float) rowData.get( "FC intensity threshold" );
	affy.set_FC_intensity_threshold( intensThresh );

	affy.set_abs_dec_matrix( (String) rowData.get( "abs dec matrix" ) );

	Integer centMinCount = (Integer) rowData.get( "central minus count" );
	affy.set_central_minus_count( centMinCount );

	Float centMinAvg = (Float) rowData.get( "central minus average" );
	affy.set_central_minus_avg( centMinAvg );
	
	Integer cornPlusCount = (Integer) rowData.get( "corner plus count" );
	affy.set_corner_plus_count( cornPlusCount );
	
	Float cornPlusAvg = (Float) rowData.get( "corner plus average" );
	affy.set_corner_plus_avr( cornPlusAvg );

	Integer cornMinCount = (Integer) rowData.get( "corner minus count" );
	affy.set_corner_minus_count( cornMinCount );
	
	Float cornMinAvg = (Float) rowData.get( "corner minus average" );
	affy.set_corner_minus_avg( cornMinAvg );
	
	affy.set_background_avg( (Float) rowData.get( "background average" ) );

	Float backStdev = (Float) rowData.get( "background stdev" );
	affy.set_background_stdev( backStdev);
	
	affy.set_noise( (Float) rowData.get( "noise" ) );
	affy.set_alpha1( (Float) rowData.get( "alpha1" ) );
	affy.set_alpha2( (Float) rowData.get( "alpha2" ) );
	affy.set_tau( (Float) rowData.get( "tau" ) );
	affy.set_TGT_value( (Float) rowData.get( "TGT value" ) );
	affy.set_gamma1h( (Float) rowData.get( "gamma1h" ) );
	affy.set_gamma1l( (Float) rowData.get( "gamma1l" ) );
	affy.set_gamma2h( (Float) rowData.get( "gamma2h" ) );
	affy.set_gamma2l( (Float) rowData.get( "gamma2l" ) );
	affy.set_perturbation( (Float) rowData.get( "perturbation" ) );
	affy.set_baseline_noise( (Float) rowData.get( "baseline noise" ) );
	affy.set_baseline_sf( (Float) rowData.get( "baseline sf" ) );

	return affy;
    }
    
    /**
     * Retrieves replicate set (hyb description) with submitted replicate
     * set name from expression set.  Newly populated hyb data slide object
     * will be added to replicate set's collection of hyb data slides. Array
     * design info. for replicate set is also needed for validating affymetrix
     * data.
     *
     * <p>
     * If expression set does not contain replicate set with requested name,
     * an error message will be logged and method will return null.
     * 
     * @param rowData Map of column data for single row of Excel file
     * @param hybData Hyb data object to add to expression set.
     * @return Replicate set (hyb description) hyb data slide was added to, or
     * <code>null</code> if no replicate set found with requested name.
     */
    private LoadableHybDescription getHybDescription( Map rowData ) {
	String name = (String) rowData.get( "replicate set name" );

	LoadableHybDescription hybDescription = 
	    expressionSet.getHybDescription( name );
	
	// if no hyb description found, log error that no
	// association could be made for slide
	if ( hybDescription == null ) {
	    String errorMessage = 
		"Could not associate HybData slide to replicate set. " +
		"No replicate found with name: " + name;

	    addError( "replicate set name", errorMessage );

	}

	return hybDescription;
    }
}

