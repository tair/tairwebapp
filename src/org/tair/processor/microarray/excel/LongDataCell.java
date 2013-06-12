//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2004/07/06 16:27:46 $
//------------------------------------------------------------------------------

package org.tair.processor.microarray.excel;

import jxl.Sheet;

import org.tair.utilities.InvalidCellException;


/**
 * LongDataCell extends ExcelDataCell to retrieve data submitted in 
 * an Excel column as a Long value.
 */


public class LongDataCell extends ExcelDataCell {

    /**
     * Creates an instance of LongDataCell cell to represent the cell at
     * submitted column index.
     *
     * @param name Display name of column represented by this object
     * @param columnIndex Numeric index of column within data sheet
     * @param required If <code>true</code> column is a required field
     * that must have data; if <code>false</code> column is not a required
     * field
     */
    public LongDataCell( String name, int columnIndex, boolean required ) {
	super( name, columnIndex, required );
    }

    /**
     * Retrieves and validates data submitted for this column in 
     * submitted row of data and returns value as a Long object.
     *
     * <p>
     * InvalidCellException will be thrown if submitted data fails superclass
     * validation or if data cannot be transformed into a Long value.
     *
     * @param sheet Sheet object representing Excel data sheet being parsed
     * @param row Row to get column data for
     * @return Data in cell as a Long object
     * @throws InvalidCellException if any validation errors occur
     */
    public Object getData( Sheet sheet, int row ) throws InvalidCellException {

	// use superclass to get String data to take advantage of 
	// validation for required data and illegal characters
	String contents = (String) super.getData( sheet, row );

	Long longValue = null;
	if ( contents != null ) {
	    try { 
		longValue = new Long( contents );
	    } catch ( NumberFormatException nfe ) {
		throw new InvalidCellException( "Invalid number: " + contents );
	    }
	}
	
	return longValue;
    }



}
