//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2004/07/06 16:27:43 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.excel;

import jxl.Sheet;

import org.tair.utilities.InvalidCellException;
import org.tair.utilities.TextConverter;


/**
 * BooleanDataCell extends ExcelDataCell to retrieve data submitted in 
 * an Excel column as a Boolean value.
 */

public class BooleanDataCell extends ExcelDataCell {


    /**
     * Creates an instance of BooleanDataCell cell to represent the cell at
     * submitted column index.
     *
     * @param name Display name of column represented by this object
     * @param columnIndex Numeric index of column within data sheet
     * @param required If <code>true</code> column is a required field
     * that must have data; if <code>false</code> column is not a required
     * field
     */
    public BooleanDataCell( String name, int columnIndex, boolean required ) {
	super( name, columnIndex, required );
    }

    /**
     * Retrieves and validates data submitted for this column in 
     * submitted row of data and returns value as a Boolean object.
     *
     * <p>
     * This method uses the TAIR convention for translating character data
     * into a Boolean - T = a true, F = false, no data = NULL instance.
     *
     * @param sheet Sheet object representing Excel data sheet being parsed
     * @param row Row to get column data for
     * @return Data in cell as a Boolean object
     * @throws InvalidCellException if any validation errors occur
     */
    public Object getData( Sheet sheet, int row ) throws InvalidCellException {

	// use superclass to get String data to take advantage of 
	// validation for required data and illegal characters
	String contents = (String) super.getData( sheet, row );
	
	Boolean booleanVal = TextConverter.stringToBoolean( contents );

	return booleanVal;
    }



}
