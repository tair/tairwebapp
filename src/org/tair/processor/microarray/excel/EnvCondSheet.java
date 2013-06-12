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

import org.tair.processor.microarray.data.LoadableBioSample;
import org.tair.querytools.BioSamEnvConObject;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcEnvironmentalCondition;

/**
 * EnvCondSheet is a concrete implementation of DataSheet that is used
 * to parse and validate data from the "Environmental Conditions" sheet of the 
 * microarray data loading Excel sheet.  EnvCondSheet parses data entered in 
 * this sheet, transforms values from sheet into database objects, and 
 * populates related BioSample with data.
 */

public class EnvCondSheet extends DataSheet {

    // columns in Environmental Conditions sheet
    private final int EXPRESSIONSET_EXTERNAL_ID = 0;
    private final int BIOSAMPLE_NAME = 1;

    // environmental condition
    private final int CONDITION_TYPE = 2;
    private final int CONDITION_NAME = 3;
    private final int CONDITION_VALUE = 4;
    private final int CONDITION_DESCRIPTION = 5;
    private final int CONDITION_DURATION = 6;
    private final int CONDITION_DURATION_UNITS = 7;
    private final int APPLICATION_FREQUENCY = 8;

    // bio sample/env cond. join specific data
    private final int IS_EXPT_VARIABLE = 9;
    private final int ORDER = 10;


    // list of acceptable values for environmental condition
    // duration units
    private List durationUnits;


    /**
     * Creates an instance of EnvCondSheet that can be used to parse
     * the "Environmental Conditions" data sheet of microarray Excel file.  
     *
     * @param sheetName Literal name of Environmental Conditions sheet as it
     * appears in Excel data file. This name is used to retrieve Sheet object 
     * that contains all data as it appears in Excel file.
     */
    public EnvCondSheet( String sheetName ) {
	super( sheetName );
	initializeDurationUnits();
    }


    /**
     * Initializes list for validating duration units values against all
     * acceptable values from database rule.
     */
    private void initializeDurationUnits() {
	durationUnits = new ArrayList();
	durationUnits.add( "seconds" ); 
	durationUnits.add( "minutes" ); 
	durationUnits.add( "hours" );
	durationUnits.add( "days" ); 
	durationUnits.add( "weeks" ); 
	durationUnits.add( "months" );
	durationUnits.add( "years" );
    }

    /**
     * Parses Environmental Conditions data sheet from Excel file and populates
     * expression set object with data from sheet.  As data is parsed, it is 
     * validated and transformed into database objects that can be used to store 
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

	// environmental condition to populate
	BioSamEnvConObject envCond = null;

	// name of bio sample to add env. condition to
	String bioSampleName = null;

	// ignore first row (index 0) - column headers
	for ( int i = 1; i < sheet.getRows(); i++ ) {
	    
	    // Set current row of data in superclass
	    setCurrentRow( i );

	    // retrieve and validate current row of data using
	    // validation method defined in superclas
	    rowData = validateDataCells( dataCells );
	    
	    envCond = populateEnvCondition( conn, rowData );
	    
	    // add env. condition to bio sample in expression set; get
	    // name of bio sample condition was added to for adding
	    // entry to row tracker
	    bioSampleName = addEnvCondition( rowData, envCond );

	    // record name of bio sample and env. condition submitted on
	    // on this row of data for presenting results back to 
	    // curator in the order it was received
	    rowTracker.setEnvCondRow( i, 
				      envCond.get_condition_name(), 
				      bioSampleName );
	}
    }

    /**
     * Creates list of data cell objects used for retrieving and
     * validating data from Environmental Conditions Excel data sheet.  
     * Each cell object is populated with its field name, the column index
     * it exists at in the datasheet, and whether it is a required field 
     * or not
     *
     * @return Array of ExcelDataCell objects that can be used to retrieve
     * and validate data from Enviromental Conditionss data sheet
     */
    private ExcelDataCell[] createDataCells() {
	ExcelDataCell[] cells = new ExcelDataCell[ 11 ];

	// not used currently
	cells[ 0 ] = new ExcelDataCell( "external id", 
					EXPRESSIONSET_EXTERNAL_ID, 
					true );
	
	cells[ 1 ] = new ExcelDataCell( "sample name", BIOSAMPLE_NAME, true );

	// environmental condition
	cells[ 2 ] = new ExcelDataCell( "condition type", 
					CONDITION_TYPE, 
					false );

	cells[ 3 ] = new ExcelDataCell( "condition name", 
					CONDITION_NAME,
					false );

	cells[ 4 ] = new ExcelDataCell( "condition value", 
					CONDITION_VALUE, 
					false );

	cells[ 5 ] = new ExcelDataCell( "condition description",
					CONDITION_DESCRIPTION,
					false );

	cells[ 6 ] = new ExcelDataCell( "condition duration", 
					CONDITION_DURATION, 
					false );

	cells[ 7 ] = new ExcelDataCell( "condition duration units", 
					CONDITION_DURATION_UNITS, 
					false );

	cells[ 8 ] = new ExcelDataCell( "application frequency", 
					APPLICATION_FREQUENCY, 
					false );
	
	// bio sample/env cond. join specific data
	cells[ 9 ] = new BooleanDataCell( "is experiment variable", 
					  IS_EXPT_VARIABLE, 
					  false );
	
	cells[ 10 ] = new IntegerDataCell( "order", ORDER, false );
	
	return cells;
    }


    /**
     * Creates new environmental condition object populated with 
     * environmental condition data entered in Excel spreadsheet
     *
     * @param conn An active connection to the database
     * @param rowData Map of column data for single row of Excel file
     * @return Environmental condition object populated with data from
     * Excel file
     */
    private BioSamEnvConObject populateEnvCondition( DBconnection conn,
						     Map rowData ) 
	throws SQLException {

	BioSamEnvConObject envCond = new BioSamEnvConObject();

	envCond.set_condition_type( (String) rowData.get( "condition type" ) );
	envCond.set_condition_name( (String) rowData.get( "condition name" ) );

	String value = (String) rowData.get( "condition value" );
	envCond.set_condition_value( value ); 

	String descr = (String) rowData.get( "condition description" );
	envCond.set_condition_description( descr );
	
	String duration = (String) rowData.get( "condition duration" );
	envCond.set_condition_duration( duration ); 

	// ensure submitted value for condition duration units is acceptable
	// value for database rule
	String units = (String) rowData.get( "condition duration units" );
	envCond.set_duration_units( units ); 
	if ( units != null && !durationUnits.contains( units ) ) {
	    addError( "condition duration units", "Invalid duration units" );
	}

	String freq = (String) rowData.get( "application frequency" );
	envCond.set_application_frequency( freq ); 

	// Check to see if environmental condition record already
	// exists with this combination of values before creating
	// a new record
	lookupEnvironmentalCondition( conn, envCond );
	
	// join specific data
	Boolean isExpVar = (Boolean) rowData.get( "is experiment variable" );
	envCond.set_is_experimental_variable( isExpVar ); 
	
	envCond.set_order_number( (Integer) rowData.get( "order" ) );

	return envCond;
    }

    /**
     * Looks in database for an existing environmental condition record that
     * matches submitted object's values.  All values in EnvironmentalCondition
     * except for condition description are used to identify a condition record.
     * If an existing record is found, set environmental condition id for
     * submitted object to avoid creating a new record when storing association
     * between bio sample and environmental condition
     *
     * @param conn An active connection to the database
     * @param envCond Environmental condition record populated with data from
     * data file
     * @throws SQLException if a database error occurs
     */
    private void lookupEnvironmentalCondition( DBconnection conn, 
					       BioSamEnvConObject envCond )
	throws SQLException {

	// at least name and type must be submitted for record to be
	// valid
	if ( envCond.get_condition_name() != null && 
	     envCond.get_condition_type() != null ) {

	    Long envConditionID =
		TfcEnvironmentalCondition.retrieveID( conn, envCond );

	    if ( envConditionID != null ) {
		envCond.set_environmental_condition_id( envConditionID );
	    }
	}
    }


    /**
     * Adds submitted environmental condition record to bio sample
     * record with submitted sample name.
     *
     * @param rowData Map of column data for single row of Excel file
     * @param envCond Environmental condition object populated with data from
     * Excel file to add to bio sample
     * @return Bio sample name env. condition was associated to
     */
    private String addEnvCondition( Map rowData, BioSamEnvConObject envCond ) {
	String bioSampleName = (String) rowData.get( "sample name" );

	// get bio sample from expression set
	LoadableBioSample bioSample = 
	    expressionSet.getBioSample( bioSampleName );

	// if no bio sample found, log error that association
	// couldn't be made
	if ( bioSample == null ) {
	    addError( "sample name",
		      "Could not associate environmental condition. " +
		      "No bio sample found with name: " + bioSampleName );
	} else {
	    bioSample.addEnvironmentalCondition( envCond );
	}

	return bioSampleName;
    }

}
