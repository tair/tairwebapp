//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2004/07/06 16:27:46 $
//------------------------------------------------------------------------------

package org.tair.processor.microarray.excel;

import jxl.Sheet;

import org.tair.utilities.InvalidCellException;

/**
 * IntegerDataCell extends ExcelDataCell to retrieve data submitted in 
 * an Excel column as an Integer value.
 */


public class IntegerDataCell extends ExcelDataCell {


    /**
     * Creates an instance of IntegerDataCell cell to represent the cell at
     * submitted column index.
     *
     * @param name Display name of column represented by this object
     * @param columnIndex Numeric index of column within data sheet
     * @param required If <code>true</code> column is a required field
     * that must have data; if <code>false</code> column is not a required
     * field
     */
    public IntegerDataCell( String name, int columnIndex, boolean required ) {
	super( name, columnIndex, required );
    }

    /**
     * Retrieves and validates data submitted for this column in 
     * submitted row of data and returns value as an Integer object.
     *
     * <p>
     * InvalidCellException will be thrown if submitted data fails superclass
     * validation or if data cannot be transformed into an Integer value.
     *
     * @param sheet Sheet object representing Excel data sheet being parsed
     * @param row Row to get column data for
     * @return Data in cell as an Integer object
     * @throws InvalidCellException if any validation errors occur
     */
    public Object getData( Sheet sheet, int row ) throws InvalidCellException {

	// use superclass to get String data to take advantage of 
	// validation for required data and illegal characters
	String contents = (String) super.getData( sheet, row );

	Integer intValue = null;

	if ( contents != null ) {
	    try { 
		intValue = new Integer( contents );
	    } catch ( NumberFormatException nfe ) {
		throw new InvalidCellException( "Invalid number: " + contents );
	    }
	}
	
	return intValue;
    }



}
