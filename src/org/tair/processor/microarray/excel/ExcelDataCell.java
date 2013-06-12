//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2004/07/06 16:27:44 $
//------------------------------------------------------------------------------

package org.tair.processor.microarray.excel;

import jxl.Cell;
import jxl.Sheet;

import org.tair.utilities.InvalidCellException;
import org.tair.utilities.TextConverter;

/**
 * ExcelDataCell is a template class for creating objects that can be
 * used for retrieving and validating data from an Excel file.
 * Object instances are created to represent a single cell of data; 
 * several objects can be used in combination to define the data in a 
 * single excel data sheet by using one object for each column.  A list
 * of these can then be used to validate a row of data.
 *
 * <p>
 * ExcelDataCell handles all validation through the getData method. This
 * default implementation of getData returns cell data as a String, though
 * sub-classes exist for transforming raw character data into Integer, Long
 * Float and Date.
 *
 * <p>
 * These classes are similar the WebFormField classes in org.tair.utilities, but
 * use an Excel Sheet object instead of a ServletRequest to get individual
 * fields.
 */

public class ExcelDataCell {

    // display name of column this object represents
    private String name;

    // numeric index of column within sheet
    private int columnIndex;

    // tracks whether this field is a required field
    private boolean required;

    /**
     * Creates an instance of ExcelData cell to represent the cell at
     * submitted column index.
     *
     * @param name Display name of column represented by this object
     * @param columnIndex Numeric index of column within data sheet
     * @param required If <code>true</code> column is a required field
     * that must have data; if <code>false</code> column is not a required
     * field
     */
    public ExcelDataCell( String name, int columnIndex, boolean required ) {
	this.name = name;
	this.columnIndex = columnIndex;
	this.required = required;
    }

    /**
     * Retrieves display name of column represented by this object
     */
    public String getCellName() {
	return name;
    }

    /**
     * Retrieves numeric index column within data sheet
     */
    public int getColumnIndex() {
	return columnIndex;
    }

    /**
     * Determines if this field is required for data submission
     *
     * @return code>true</code> column is a required field; 
     * <code>false</code> column is not a required field
     */
    public boolean getRequired() {
	return required;
    }
    

    /**
     * Retrieves and validates data submitted for this column in 
     * submitted row of data.  Each cell's contents are checked to 
     * make sure that illegal characters are not included in data
     * and to make sure that required fields have data. Any validation
     * errors result in InvalidCellException being thrown.
     *
     * <p>
     * If no errors occur, data is returned as a String.  Method signature
     * is left as Object, however, to allow for sub-classes to override
     * this method to return differently typed data (such as a string array,
     * or numeric value).
     *
     * <p>
     * Even if sub-classes override this method, it is recommended that
     * raw data for cell first be retrieved through this super class
     * implementation to take advantage of the checks for required data 
     * and for special characters.
     *
     * @param sheet Sheet object representing Excel data sheet being parsed
     * @param row Row to get column data for
     * @return Data in cell as a String
     * @throws InvalidCellException if any validation errors occur
     */
    public Object getData( Sheet sheet, int row ) throws InvalidCellException {

	Cell cell = sheet.getCell( columnIndex, row );

	String contents = cell.getContents();
	if ( contents != null ) {

	    contents = contents.trim();

	    // if cell contents are empty string, return null value
	    if ( TextConverter.isEmpty( contents ) ) {
		contents = null;
	    }
	}

	checkRequired( contents );
	
	return contents;
    }

    /**
     * Ensure that cell has data if this object represents a required
     * field
     *
     * @param contents Cell data to validate
     * @throws InvalidCellException if contents is empty and field is
     * required
     */
    private void checkRequired( String contents ) 
	throws InvalidCellException {
    
	if ( TextConverter.isEmpty( contents ) && getRequired() ) {
	    throw new InvalidCellException( getCellName() + 
					    " is a required field and " +
					    "cannot be empty" );
	}
    }
}
