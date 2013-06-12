//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2004/07/06 16:27:43 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.excel;

import java.text.DateFormat;
import java.text.ParseException;

import jxl.Sheet;

import org.tair.utilities.InvalidCellException;
import org.tair.utilities.TextConverter;

/**
 * DateDataCell extends ExcelDataCell to retrieve data submitted in 
 * an Excel column as a java.util.Date value.
 */

public class DateDataCell extends ExcelDataCell {

    private java.util.Date maxAllowableDate;
    private java.util.Date minAllowableDate;
  

    /**
     * Creates an instance of DateDataCell cell to represent the cell at
     * submitted column index.
     *
     * @param name Display name of column represented by this object
     * @param columnIndex Numeric index of column within data sheet
     * @param required If <code>true</code> column is a required field
     * that must have data; if <code>false</code> column is not a required
     * field
     */
    public DateDataCell( String name, 
			 int columnIndex,
			 boolean required ) 
    {
	super( name, columnIndex, required );

	getDateLimits();
    }

    /**
     * Set allowable maximum and minimum date limits that Sybase will accept
     */
    private void getDateLimits() {
	try {
	    // Sybase smalldatetime limit is 6/6/2079 - use this value to 
	    // head off values that are valid Java dates but that exceed this 
	    // limit.
	    maxAllowableDate = 
		DateFormat.getDateInstance(
		    DateFormat.SHORT ).parse( "12/31/2078" );
      
	    // do same for minimum date - Sybase limit is January 1, 1900
	    minAllowableDate = 
		DateFormat.getDateInstance( 
		    DateFormat.SHORT ).parse( "01/01/1900" );
      
	} catch (ParseException e) { // shouldn't ever happen, but just in case...
	    e.printStackTrace();
	}
    }


    /**
     * Retrieves and validates data submitted for this column in 
     * submitted row of data and returns value as a java.util.Date object.
     *
     * <p>
     * InvalidCellException will be thrown if submitted data fails superclass
     * validation or if data cannot be transformed into a Date (including if 
     * Date created exceeds minimum or maximum date values allowable by Sybase).
     *
     * <p>
     * Date format should be "MMM DD YYYY", though variants such as "MM/DD/YYYY"
     * should also be acceptable.
     * 
     * @param sheet Sheet object representing Excel data sheet being parsed
     * @param row Row to get column data for
     * @return Data in cell as a java.util.Date object
     * @throws InvalidCellException if any validation errors occur
     */
    public Object getData( Sheet sheet, int row ) throws InvalidCellException {
	java.util.Date convertDate = null;	


	// use superclass to get String data to take advantage of 
	// validation for required data and illegal characters
	String data = (String) super.getData( sheet, row );

	String errorMessage = null;
	DateFormat formatter = null;
	if ( data != null ) {

	    // try to parse date using MEDIUM date format (Mar 3, 1999)
	    try {
		
		formatter = DateFormat.getDateInstance( DateFormat.MEDIUM );
		
		convertDate = formatter.parse( data );
	    } catch ( ParseException e ) {
		// try SHORT format before logging error
	    }


	    // if MEDIUM format failed, try SHORT format (3/3/1999)
	    if ( convertDate == null ) {
		try {
		    formatter = DateFormat.getDateInstance( DateFormat.SHORT );
		    convertDate = formatter.parse( data );
		} catch ( ParseException e ) {
		    // if still no results, log error
		    errorMessage = e.getMessage();
		}
	    }

	    // if parsing succeeded, make sure date is within allowable
	    // range for SYBASE
	    if ( convertDate != null ) {
		if ( convertDate.after( maxAllowableDate ) ) {
		    errorMessage = 
			TextConverter.dateToString( convertDate ) + 
			" exceeds maximum allowable date";
		    
		} else if ( convertDate.before( minAllowableDate ) ) {
		    errorMessage =  
			TextConverter.dateToString( convertDate ) + 
			" is less than minimum allowable date";
		}
	    }
	    
	}
	
	if ( errorMessage != null ) {
	    throw new InvalidCellException( errorMessage );
	}
	
	return convertDate;
    }

}
    
    
