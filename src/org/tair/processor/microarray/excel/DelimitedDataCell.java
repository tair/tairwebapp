//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2004/07/06 16:27:44 $
//------------------------------------------------------------------------------

package org.tair.processor.microarray.excel;

import java.util.ArrayList;
import java.util.StringTokenizer;

import jxl.Sheet;

import org.tair.utilities.InvalidCellException;
import org.tair.utilities.TextConverter;


/**
 * DelimitedDataCell extends ExcelDataCell to retrieve delimited data submitted
 * in an Excel column as an array of String values
 */

public class DelimitedDataCell extends ExcelDataCell {

    // delimiter used to separate multiple entries in cell
    private String delimiter;

    
    /**
     * Creates an instance of DelimitedDataCell cell to represent the cell at
     * submitted column index.
     *
     * @param name Display name of column represented by this object
     * @param columnIndex Numeric index of column within data sheet
     * @param required If <code>true</code> column is a required field
     * that must have data; if <code>false</code> column is not a required
     * field
     * @param delimiter Delimiter used to separate multiple entries in
     * cell
     */
    public DelimitedDataCell( String name, 
			      int columnIndex,
			      boolean required,
			      String delimiter ) 
    {
	super( name, columnIndex, required );

	this.delimiter = delimiter;
    }


    /**
     * Retrieves and validates data submitted for this column in submitted 
     * row of data and returns value as an array of String objects.
     *
     * <p>
     * Method expects multiple items to be separated with delimiter submitted
     * to constructor. If a single item is found, it will be returned as a
     * one element array.
     *
     * <p>
     * InvalidCellException will be thrown if submitted data fails superclass
     * validation.
     *
     * @param sheet Sheet object representing Excel data sheet being parsed
     * @param row Row to get column data for
     * @return Data in cell as a String array
     * @throws InvalidCellException if any validation errors occur
     */
    public Object getData( Sheet sheet, int row ) throws InvalidCellException {
	String[] arrayData = null;

	String data = (String) super.getData( sheet, row );

 	if ( data != null ) {
	    if ( data.indexOf( delimiter ) > -1 ) {
		ArrayList parsed = new ArrayList();
		
		StringTokenizer st = new StringTokenizer( data.trim(), delimiter );
		while ( st.hasMoreTokens() ) { 
		    String next = st.nextToken();
		    if ( !TextConverter.isEmpty( next ) ) {
			parsed.add( next.trim() );
		    }
		}
		
		arrayData = new String[ parsed.size() ];
		arrayData = (String[]) parsed.toArray( arrayData );
		
	    } else {
		arrayData = new String[] { data.trim() };
	    }
	}

	return arrayData;
    }


}
