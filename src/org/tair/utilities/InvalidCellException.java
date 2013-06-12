//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2004/07/06 16:34:17 $
//------------------------------------------------------------------------------
package org.tair.utilities;


/**
 * InvalidCellException is used in the microarray Excel to database loading
 * tool (org.tair.processor.microarray). This exception is thrown if a data cell
 * in the Excel sheet is invalid in some way, whether because it's blank and
 * is a required field, or if it contains invalid data.
 */

public class InvalidCellException extends Exception {

    /**
     * Creates an instance of InvalidCellException with the supplied error 
     * message
     * 
     * @param errMsg Error message for this exception
     */
    public InvalidCellException( String errMsg ) {
        super( errMsg );
    }
  
  
    /**
     * Creates an empty instance of InvalidCellException
     */
    public InvalidCellException( ) {
        super();
    }
}
