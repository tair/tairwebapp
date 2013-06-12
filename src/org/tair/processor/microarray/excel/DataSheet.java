//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2004/07/06 16:27:43 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.excel;

import java.util.HashMap;
import java.util.Map;
import java.sql.SQLException;

import jxl.Sheet;

import org.tair.processor.microarray.data.LoadableExpressionSet;
import org.tair.processor.microarray.data.factory.MasterFactory;
import org.tair.tfc.DBconnection;
import org.tair.utilities.InvalidCellException;


/**
 * DataSheet is an abstract template class for classes that handle parsing
 * of microarray Excel data.  Each concrete sub-class is created to handle
 * the parsing of a specific data sheet in the microarray workbook.  
 *
 * <p>
 * Parsing of data is done through the abstract parseSheet method, which is
 * implemented by each sub-class to carry out the data sheet specific 
 * actions needed for each data sheet.
 *
 * <p>
 * DataSheet contains references to objects used by all sub-classes,
 * such as a Sheet object representing Excel data sheet being parsed,
 * expression set being populated, and data population factories.
 */

public abstract class DataSheet {

    // name of Excel data sheet concrete sub-class handles
    private String sheetName;

    // row index of data currently being processed; this is helpful to
    // record here for logging and adding new data records as parsing
    // proceeds.
    private int currentRow;

    // logging object to track all parsing and validation 
    // errors for each sheet
    private ExcelLogger logger;



    //
    // items used throughout sub-classes; kept here for universal
    // visibility
    //
    
    // Excel data sheet being parsed 
    protected Sheet sheet;

    // expression set being populated with Sheet data
    protected LoadableExpressionSet expressionSet;

    // data population and validation factories (array design,
    // community, keyword etc.)
    protected MasterFactory masterFactory;

    // row tracker object to record data objects in the order they
    // were submitted in excel sheet - used to present data back to
    // user on confirmation sheet
    protected ExcelRowTracker rowTracker;    

    
    /**
     * Creates an instance of DataSheet with the literal name of Excel
     * data sheet each particular sub-class handles.  This name is
     * used to retrieve the appropriate Sheet object from a Workbook
     * object that represents the entire Excel file.
     *
     * @param name Name of data sheet this class handles parsing duties
     * for.
     */
    public DataSheet( String name ) { 
	this.sheetName = name;
    }

    /**
     * Retrieves name of data sheet in Excel file that this DataSheet
     * class represents
     *
     * @return Literal name of data sheet in Excel file represented by this 
     * object.  This name can be used to retrieve Sheet from Workbook.
     */
    public String getSheetName() {
	return sheetName;
    }


    /**
     * Parses data sheet and populates expression set with data retrieved
     * from that sheet. Each concrete sub-class will implement this method
     * to handle the type specific actions needed for parsing the specific
     * data sheet sub-class is responsible for parsing. 
     *
     * <p>
     * Each sub-class will directly access member variables of super class
     * while parsing. These must all be explicitly set by client code
     * before calling parseSheet.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public abstract void parseSheet( DBconnection conn ) throws SQLException;


    /**
     * Sets Sheet object that represents a single data sheet from Excel
     * file being parsed. Each sub-class of DataSheet will handle the parsing
     * of a specific sheet.  This method must be called to set reference
     * to sheet before parseSheet is called.
     *
     * @param sheet Data sheet to be parsed by DataSheet object.
     */
    public final void setSheet( Sheet sheet ) {
	this.sheet = sheet;
    }

    /**
     * Sets reference to expression set being populated through the
     * parsing of Excel file.  Each sub-class of DataSheet references this
     * object directly to populate expression set with data from a specific
     * data sheet. This method must be called to set reference to expression
     * set before parseSheet is called
     *
     * @param set Expression set to be populated with data from data sheet
     * handled by concrete sub-class
     */
    public final void setExpressionSet( LoadableExpressionSet set ) {
	this.expressionSet = set;
    }

    /**
     * Sets reference to master factory, which allows access to all type 
     * specific data population factories used by sub-classes when parsing
     * data sheets. Sub-classes will reference master factory directly to get
     * access to any type specific factory needed for parsing a particular data
     * sheet. 
     *
     * <p>
     * Each sub-class instance should have a reference to the same instance of
     * master factory to take advantage of data caching used by each type 
     * specific factory.
     *
     * <p>
     * This method must be called to set reference to validation factories
     * before parseSheet is called
     *
     * @param factory Master factory instance containing all type specific
     * data object factories used in data file parsing.
     */
    public final void setMasterFactory( MasterFactory factory ) {
	this.masterFactory = factory;
    }

    /**
     * Sets reference to logging object to use for tracking all errors
     * and warnings encountered during the parsing of Excel file. Each 
     * sub-class of DataSheet references this object directly to add
     * messages as necessary while parsing a specific data sheet. This
     * method must be called to set reference to logging object before
     * parseSheet is called.
     *
     * @param logger Logging object to contain error and warning messages
     * from parsing of data sheet handled by concrete sub-class
     */
    public final void setLogger( ExcelLogger logger ) {
	this.logger = logger;
    }

    /**
     * Sets reference to row tracker object used to record order that
     * data objects were submitted in on each of different data sheets.
     * Each sub-class of DataSheet references this object directly
     * to add newly created data objects for each row of data parsed
     * from sheet.  Row tracker is used on the parsing results page to
     * present data back to curator in the order it was entered in the
     * excel sheet.
     *
     * <p>
     * This method must be called to set reference to row tracker object
     * before parseSheet is called.
     *
     * @param rowTracker Row tracker object to record data objects and
     * the row they were submitted on for each data sheet handled by
     * concrete sub-class.
     */
    public final void setRowTracker( ExcelRowTracker rowTracker ) {
	this.rowTracker = rowTracker;
    }


    /**
     * Sets index of row of data that is being currently processed.
     * This data is tracked here in the superclass because current
     * row is needed throughout parsing for recording errors and
     * adding data to collections for display on data confirmation
     * JSP
     *
     * @param row Index of row of data currently being parsed (zero-based)
     */
    protected final void setCurrentRow( int row ) {
	this.currentRow = row;
    }

    /**
     * Retrieves index of row of data that is currently being processed.
     * This data is tracked here in the superclass because current
     * row is needed throughout parsing for recording errors and
     * adding data to collections for display on data confirmation
     * JSP
     *
     * @return Index of row of data currently being parsed (zero-based)
     */
    protected final int getCurrentRow() {
	return currentRow;
    }


    /**
     * Logs an error message for field name within current row of
     * data sheet. This method is a wrapper method that adds a 
     * message to contained ExcelLogger object. This is useful
     * in sub-classes since it allows sub-class to just submit
     * field name and message, and lets method here add sheet
     * name and row information that logger needs
     *
     * @param fieldName Field or column within current row that
     * error message is for
     * @param message Error message for field within current row
     */
    protected final void addError( String fieldName, String message ) {
	
	logger.addError( getSheetName(),
			 getCurrentRow(),
			 fieldName,
			 message );
    }

    /**
     * Logs a warning message for field name within current row of
     * data sheet. This method is a wrapper method that adds a 
     * message to contained ExcelLogger object. This is useful
     * in sub-classes since it allows sub-class to just submit
     * field name and message, and lets method here add sheet
     * name and row information that logger needs
     *
     * <p>
     * Warnings are recorded for informational purposes; they generally
     * are used to notify curator that a new row of data will be
     * inserted if parsed data is stored to the db as is.
     *
     * @param fieldName Field or column within current row that
     * error message is for
     * @param message Warning message for field within current row
     */
    protected final void addWarning( String fieldName, String message ) {
	
	logger.addWarning( getSheetName(),
			   getCurrentRow(),
			   fieldName,
			   message );
    }


    /**
     * Loads data from requested row of data sheet into a Map containing 
     * data sheet field name as String key referencing data from that cell
     * (typed as String, Boolean, Date, Integer etc. depending on field).
     *
     * <p>
     * Data retrieval and basic validation for required fields and format
     * errors is done using submitted array of ExcelDataCell objects; each
     * sub-class is responsible for defining the list of data cells and
     * their requirements to match the data sheet sub-class handles.
     *
     * <p>
     * Any validation errors will be added to logging object's collection
     * of parsing errors. At this stage, only raw data validation errors
     * are recorded. Type specific errors (such as element name not being
     * found in the database when it should be) are logged as type-specific
     * processing is done in sub-class.
     *
     * <p>
     * Implementation here should work for all sub-classes, but can be
     * overridden if necessary.
     *
     * @param dataCells Array of ExcelDataCell objects created by each 
     * sub-class to define specific cells within each data sheet.
     * @return Map of data from requested row of data sheet. Data stored
     * map with field name as String key referencing data for that field.
     */
    protected Map validateDataCells( ExcelDataCell[] cells ) {

	Map data = new HashMap();

	for ( int i = 0; i < cells.length; i++ ) {
	    try {
		
		data.put( cells[ i ].getCellName(), 
			  cells[ i ].getData( sheet, getCurrentRow() ) );
		
	    } catch ( InvalidCellException ice ) {

		// if cell is required field, set message as error, otherwise
		// as warning
		if ( cells[ i ].getRequired() ) {
		    addError( cells[ i ].getCellName(), ice.getMessage() );
		} else {
		    addWarning( cells[ i ].getCellName(), ice.getMessage() );
		}
	    }
	}

	return data;
    }

}
