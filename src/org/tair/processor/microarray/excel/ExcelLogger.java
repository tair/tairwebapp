//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2004/07/06 16:27:44 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.excel;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


/**
 * ExcelLogger is used to store and retrieve errors and warnings encountered as
 * a microarray Excel file is parsed to populate data objects.  These messages
 * are stored as they occur, then can be retrieved on a JSP to give user 
 * feedback on results of parsing.
 */

public class ExcelLogger {

    // top level structure to hold all messages for all sheets. Each entry
    // contains sheet name as string key referencing a SheetMessages object,
    // which contains messages as Row objects, which contain messages for 
    // individual fields within that row (yikes...)
    private Map sheetMessages;

    /**
     * Creates a new instance of ExcelLogger
     */
    public ExcelLogger() {
	sheetMessages = new HashMap();
    }
    
    /**
     * Determines if logger contains any error messages. Absence or presence 
     * of any messages is used to determine whether an expression set populated
     * by parsing an Excel file can be stored to the database. In general,
     * the presence of any error messages will prevent the expression set
     * from being stored.
     *
     * @return <code>true</code> if logger contains error messages for any
     * data sheet, <code>false</code> if no error messages found.
     */
    public boolean hasErrors() {

	boolean hasErrors = false;

	Iterator iter = sheetMessages.values().iterator();
	SheetMessages sheet = null;
	while ( iter.hasNext() ) {
	    sheet = (SheetMessages) iter.next();
	    if ( sheet.hasErrors() ) {
		hasErrors = true;
		break;
	    }
	}
	return hasErrors;
    }


    /**
     * Retrieves all error messages for all sheets. This method is mostly
     * used for testing logging mechanism.
     *
     * @return All error messages contained by logger as an 
     * <code>Iterator</code> of <code>String</code> objects, or 
     * <code>null</code> if no errors contained by logger
     */
    public Iterator getAllErrors() {
	// quick 'n' dirty - add all messages for all sheets to list
	// and return iterator
	List errors = null;
	Iterator returnIter = null;

	// add sheet name, row number and field name to message for
	// auditing
	SheetMessages sheet = null;
	String sheetName = null;

	Iterator iter = sheetMessages.keySet().iterator();
	while ( iter.hasNext() ) {
	    sheetName = (String) iter.next();
	    sheet = (SheetMessages) sheetMessages.get( sheetName );
	    if ( sheet.hasErrors() ) {
		if ( errors == null ) {
		    errors = new ArrayList();
		}
		
		Iterator msgIter = sheet.getAllErrors();
		while ( msgIter.hasNext() ) {
		    errors.add( sheetName + "-" + (String) msgIter.next() );
		}
	    }
	}

	if ( errors != null ) {
	    returnIter = errors.iterator();
	}

	return returnIter;
    }


    /**
     * Adds an error message for a data field within a single row of a
     * single data sheet. Row number will be submitted as row index (i.e.
     * zero based).
     * 
     * @param sheetName Name of data sheet with error
     * @param row Index of row within sheet
     * @param fieldName Field or column name within row
     * @param message Error message to set
     */
    public void addError( String sheetName,
			  int row,
			  String fieldName,
			  String message ) {
	
	SheetMessages sheet = getSheet( sheetName );
	
	boolean isWarning = false;
	sheet.addMessage( row, fieldName, message, isWarning );
    }

    /**
     * Adds a warning message for a data field within a single row of a
     * single data sheet. Row number will be submitted as row index (i.e.
     * zero based).
     *
     * <p>
     * Warning messages are used for notifying user of an issue encountered
     * while parsing data field, but when message is more informational than
     * an absolute error.
     * 
     * @param sheetName Name of data sheet with error
     * @param row Index of row within sheet
     * @param fieldName Field or column name within row
     * @param message Warning message to set
     */   
    public void addWarning( String sheetName,
			    int row,
			    String fieldName,
			    String message ) {
	
	SheetMessages sheet = getSheet( sheetName );
	
	boolean isWarning = true;
	sheet.addMessage( row, fieldName, message, isWarning );
    }
    
    
    /**
     * Retrieves all error and warning messages for a single field within
     * a row of a data sheet. This method serves to make life as simple as
     * possible at the JSP level by concatenating all messages into a single
     * string, complete with HTML formatting for different kinds of messages.
     *
     * <p>
     * Row number will be submitted as row index (i.e. zero based).
     *
     * @param sheetName Name of data sheet with error
     * @param row Index of row within sheet
     * @param fieldName Field or column name within row
     * @return String containing any errors for field, followed by warning
     * messages, or an empty string if no errors recorded for field.
     */
    public String getMessages( String sheetName,
			       int row,
			       String fieldName ) {
	
	StringBuffer buffer = new StringBuffer();
	
	SheetMessages sheet = getSheet( sheetName );
	
	String message = null;
	
	Iterator iter = sheet.getMessages( row, fieldName, false );
	
	if ( iter != null ) {
	    appendMessages( buffer, iter, "parse_error" );
	}

	iter = sheet.getMessages( row, fieldName, true );

	if ( iter != null ) {
	    appendMessages( buffer, iter, "parse_warning" );
	}

	return buffer.toString();
    }
    
    /**
     * Retrieves all error messages for a single field within a row of 
     * a data sheet. This method allows client code to deal with each
     * individual message separately, as opposed to the getMessages
     * method which returns a single string including HTML formatting
     *
     * <p>
     * Row number will be submitted as row index (i.e. zero based).
     *
     * @param sheetName Name of data sheet with error
     * @param row Index of row data within sheet
     * @param fieldName Field or column name within row
     * @return Error messages for field as an <code>Iterator</code>
     * of <code>String</code> messages, or <code>null</code> if no
     * error messages for field
     */    
    public Iterator getErrors( String sheetName,
			       int row,
			       String fieldName ) {
	
	SheetMessages sheet = getSheet( sheetName );

	return sheet.getMessages( row, fieldName, false );
    }
    
    /**
     * Retrieves all warning messages for a single field within a row of 
     * a data sheet. This method allows client code to deal with each
     * individual message separately, as opposed to the getMessages
     * method which returns a single string including HTML formatting
     *
     * <p>
     * Row number will be submitted as row index (i.e. zero based).
     *
     * @param sheetName Name of data sheet with error
     * @param row Index of row within sheet
     * @param fieldName Field or column name within row
     * @return Warning messages for field as an <code>Iterator</code>
     * of <code>String</code> messages, or <code>null</code> if no
     * error messages for field
     */    
    public Iterator getWarnings( String sheetName,
				 int row,
				 String fieldName ) {
	
	SheetMessages sheet = getSheet( sheetName );
	
	return sheet.getMessages( row, fieldName, true );
    }


    /** 
     * Utility method to add all messages within iterator to submitted buffer.
     * This is used for creating a single string with HTML formatting to
     * display all messages for a field. Buffer will add an HTML FONT tag
     * using submitted font class value so that all messages following
     * will use font class. This is an easy way to allow for different
     * formatting for error vs. warning messages
     *
     * @param buffer Message buffer to append messages to
     * @param iter Iterator of messages as Strings
     * @param fontClass HTML font class attribute to use for messages
     */
    private void appendMessages( StringBuffer buffer, 
				 Iterator iter,
				 String fontClass ) {
	
	buffer.append( "<font class=\"" + fontClass + "\">" );
	
	String message = null;
	while ( iter.hasNext() ) {
	    message = (String) iter.next();
	    buffer.append( message + "<br>" );
	}

	buffer.append( "</font>" );
    }



    /**
     * Utility method to retrieve SheetMessages object representing all
     * error and warning messages for a single data sheet. Method will 
     * return existing object, or create a new one if one does not yet
     * exist for sheet name
     *
     * @param sheetName Name of data sheet to retrieve messages for
     * @return SheetMessages object containing any messages already set
     * for data sheet with submitted name
     */
    private SheetMessages getSheet( String sheetName ) {
	SheetMessages sheet = (SheetMessages) sheetMessages.get( sheetName );

	if ( sheet == null ) {
	    sheet = new SheetMessages();

	    sheetMessages.put( sheetName, sheet );
	}

	return sheet;
    }
   

		       
    /**
     * Utility class to represent all messages for a single data
     * sheet.  Contains a simple Map containing individual rows in
     * sheet with any errors for that row.
     */
    private class SheetMessages {

	// collection of errors for each row of data in sheet,
	// stored with identifying name for data referencing
	// a Row object that contains all errors for that row
	// in this sheet
	Map rows = new HashMap();

	/**
	 * Adds submitted message for field name to row within sheet
	 *
	 * @param row Index of row within sheet
	 * @param fieldName Column that produced the error
	 * @message Error message
	 * @isWarning If <code>true</code> message is a warning message,
	 * if <code>false</code> message is an error message
	 */
	private void addMessage( int rowIndex, 
				 String fieldName, 
				 String message, 
				 boolean isWarning ) {
	    
	    // make Integer object to use as key
	    Integer rowObj = new Integer( rowIndex );

	    Row row = (Row) rows.get( rowObj );
	    if ( row == null ) {
		row = new Row( rowIndex );
		rows.put( rowObj, row );
	    }
	    row.addMessage( fieldName, message, isWarning );
	}
	
	/**
	 * Returns any messages for field name in row within sheet
	 *
	 * @param row Index of row sheet
	 * @param fieldName Column that produced the error
	 * @isWarning If <code>true</code> retrieve warning messages,
	 * if <code>false</code> retrieve error messages
	 * @return Messages for field within row of sheet as an 
	 * <code>Iterator</code> of <code>String</code> objects, or 
	 * <code>null</code> if no messages for field.
	 */
	private Iterator getMessages( int rowIndex, 
				      String fieldName, 
				      boolean isWarning ) {
	    Iterator messageIter = null;

	    // make Integer object to use as key
	    Integer rowObj = new Integer( rowIndex );

	    Row row = (Row) rows.get( rowObj );
	    
	    // if row null, no messages for it at all, if not null,
	    // get any messages that may have been placed for requested
	    // field
	    if ( row != null ) {
		messageIter = row.getMessages( fieldName, isWarning );
	    }
	    return messageIter;
	}
	

	/**
	 * Returns all error messages for sheet. Each message will have
	 * row number and field name pre-pended to it. This method should 
	 * only normally be used for auditing and testing of logging mechanism.
	 *
	 * @return All error messages for sheet as an <code>Iterator</code> of
	 * <code>String</code> objects, or <code>null</code> if no errors
	 * for row
	 */
	private Iterator getAllErrors() {
	    // collect all errors from all rows and add to list
	    List errorList = null;
	    Iterator returnIter = null;
	    
	    if ( hasErrors() ) {
		errorList = new ArrayList();
		
		Iterator iter = rows.values().iterator();
		Row row = null;
		Iterator rowMsgIter = null;
		while ( iter.hasNext() ) {
		    row = (Row) iter.next();
		    if ( row.hasErrors() ) {
			rowMsgIter = row.getAllErrors();
			while ( rowMsgIter.hasNext() ) {
			    errorList.add( (String) rowMsgIter.next() );
			}
		    }
		}

		returnIter = errorList.iterator();
	    }
	    return returnIter;
	}
			    
	

	/**
	 * Determines if sheet has any error messages for any of its rows
	 *
	 * @return <code>true</code if at least one of rows in sheet
	 * has error message(s) set for it, <code>false</code> if no rows
	 * in sheet have errors
	 */
	private boolean hasErrors() {
	    boolean hasErrors = false;
	    
	    Row row = null;
	    for ( Iterator iter = rows.values().iterator(); iter.hasNext(); ) {
		row = (Row) iter.next();
		if ( row.hasErrors() ) {
		    hasErrors = true;
		    break;
		}
	    }

	    return hasErrors;
	}		  
    }


    /**
     * Utility class to contain all warning and error messages for all
     * fields within a single row of a data sheet
     */
    private class Row {

	// error messages for this row of data - stored with
	// field/column name as key referencing List of errors
	// for that field in this row
	Map errors;

	// warning messages for this row of data - stored with
	// field/column name as key referencing List of warnings
	// for that field in this row
	Map warnings;

	// index of row in sheet this object represents
	int rowIndex;

	/**
	 * Initializes collections of messages and saves reference to
	 * row index this object represents.
	 *
	 * @param rowIndex Index of row in sheet this object represents.
	 */
	private Row( int rowIndex ) {
	    errors = new HashMap();
	    warnings = new HashMap();

	    this.rowIndex = rowIndex;
	}


	/**
	 * Adds submitted message for field name within row
	 *
	 * @param fieldName Column that produced the error
	 * @message Error message
	 * @isWarning If <code>true</code> message is a warning message,
	 * if <code>false</code> message is an error message
	 */
	private void addMessage( String fieldName,
				 String message,
				 boolean isWarning ) {

	    Map messageMap = isWarning ? warnings : errors;

	    List messages = (List) messageMap.get( fieldName );
	    if ( messages == null ) {
		messages = new ArrayList();
		messageMap.put( fieldName, messages );
	    }

	    messages.add( message );
	}


	/**
	 * Returns any messages for field name within row
	 *
	 * @param fieldName Column that produced the error
	 * @isWarning If <code>true</code> retrieve warning messages,
	 * if <code>false</code> retrieve error messages
	 * @return Messages for field within row of sheet as an 
	 * <code>Iterator</code> of <code>String</code> objects, or 
	 * <code>null</code> if no messages for field.
	 */
	private Iterator getMessages( String fieldName, boolean isWarning ) {
	    Iterator messageIter = null;

	    Map messageMap = isWarning ? warnings : errors;
    
	    List messages = (List) messageMap.get( fieldName );
	    
	    if ( messages != null && !messages.isEmpty() ) {
		messageIter = messages.iterator();
	    }
	    
	    return messageIter;
	}


	/**
	 * Returns all error messages for row. Each message will have
	 * row number and field name pre-pended to it. This method should 
	 * only normally be used for auditing and testing of logging mechanism.
	 *
	 * @return All error messages for row as an <code>Iterator</code> of
	 * <code>String</code> objects, or <code>null</code> if no errors
	 * for row
	 */
	private Iterator getAllErrors() {
	    List errorList = null;
	    Iterator returnIter = null;

	    if ( hasErrors() ) {
		errorList = new ArrayList();

		List rowErrors = null;
		Iterator msgIter = null;
		String field = null;
		String message = null;

		Iterator iter = errors.keySet().iterator();
		while ( iter.hasNext() ) {
		    
		    field = (String) iter.next();
		    rowErrors = (List) errors.get( field );
		    for ( msgIter = rowErrors.iterator(); msgIter.hasNext(); ) {
			message = (String) msgIter.next();
			errorList.add( rowIndex + "-" + field + ": " + message );
		    }
		}

		returnIter = errorList.iterator();
	    }
	    return returnIter;
	}


	/**
	 * Determines if row has any error messages for any fields within
	 * row.
	 *
	 * @return <code>true</code> if at least one field within row has an
	 * error message set for it; <code>false</code> if no fields have
	 * error messages
	 */
	private boolean hasErrors() {
	    // if errors map is not empty, at least one error has been set
	    
	    return !errors.isEmpty();
	}
   }


}
 
