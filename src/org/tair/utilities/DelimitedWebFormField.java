/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import javax.servlet.http.*;
import java.util.*;

/**
  * DelimitedWebFormField is a specific subclass of WebFormField that retrieves multiple values from 
  * a single form field submission by parsing the value and separating into multiple elements along a 
  * set delimiter.  DelimitedWebFormField is useful for getting multiple values entered into an
  * HTML textarea separated by a hard return.  Validate method will automatically parse the submission
  * along the delimiter and return an array of values. DelimitedWebFormField uses same validation
  * rules as WebFormField, with the exception that each tokenized result will be the value tested for
  * length instead of the total submission of the field
  *
  */


public class DelimitedWebFormField extends WebFormField {
  private String delimiter;

  /**
    * Creates an instance of DelimitedWebFormField with the submitted field name, required status, maximum content
    * length and delimiter to user while parsing out multiple entries.
    * This constructor will use the super(String, boolean, int) constructor of WebFormField to create a field that
    * will automatically validated for content length, and will be treated as a multiple field that returns an
    * array of results
    * 
    * @param fieldName Name of HTML form field
    * @param required If <code>true</code> this field must have value, or an exception will be thrown
    * @param length Maximum character length of each token in full submission
    * @param delimiter Character delimiter separating multiple values in full submission
    *
    */
  public DelimitedWebFormField( String fieldName, boolean required, int length, String delimiter ) {
    super( fieldName, required, length );
    super.setMultiple( true );
    this.delimiter = delimiter;
  }

  /**
    * Retrieves and validates submission by passing processing to validateMultiple( HttpServletRequest )
    * 
    * @param request HttpServletRequest containing values from form submission
    * @return String Array of parsed values in field, or null if no value was submitted
    * @exception InvalidParameterException thrown if field is required and is submitted with no value, or
    * if any parsed values exceed the stated maximum character length for this field
    */
  public Object validate( HttpServletRequest request ) throws InvalidParameterException {
    return validateMultiple( request );
  }

  /**
    * Retrieves and validates submitted value in HttpServletRequest.  Field is retrieved and is 
    * split into multiple values using any presence of delimiter in the field to tokenize into multiple values.
    * If delimiter is not found in submitted value, return value will be a one element String array
    * that contains the full submitted value.  If there a size restrictions on this field, each tokenized
    * value will be examined and <code>InvalidParameterException</code> will be thrown if any element 
    * exceeds the maximum character length for this field
    *
    * @param request HttpServletRequest containing values from form submission
    * @return String Array of parsed values in field, or null if no value was submitted
    * @exception InvalidParameterException thrown if field is required and is submitted with no value, or
    * if any parsed values exceed the stated maximum character length for this field
    */
  private String[] validateMultiple( HttpServletRequest request ) throws InvalidParameterException {
    String[] values = null;
    ArrayList tmpValues = null;
    String submitted = null;
    StringBuffer errorMessage = new StringBuffer();

    if ( request.getParameter( fieldName ) != null && !request.getParameter( fieldName ).trim().equals( "" ) ) {
      submitted = request.getParameter( fieldName ).trim();
    }

    if ( submitted != null ) {
      // if delimiter in string, parse individ. elements, otherwise return values as regular multiple field 
      if ( submitted.indexOf( delimiter ) > -1 ) {
	StringTokenizer t = new StringTokenizer( submitted, delimiter );
	while ( t.hasMoreTokens() ) {
	  String next = t.nextToken();
	  if ( restrictLength && next.length() > length ) {
	    errorMessage.append( fieldName + " values cannot be greater than " + length + " characters long." );
	  } else {

	    if ( !TextConverter.isEmpty( next ) ) {
	      if ( tmpValues == null ) {
		tmpValues = new ArrayList();
	      }
	      tmpValues.add( next.trim() );
	    }
	  }
	}
	if ( tmpValues != null && !tmpValues.isEmpty() ) {
	  values = new String[ tmpValues.size() ];
	  values = (String[]) tmpValues.toArray( values );
	}
      } else {
	values = request.getParameterValues( fieldName );
      }

    } else {

      if ( isRequired() ) {
	errorMessage.append( fieldName + " cannot be blank." );
      }     
    }

    if ( errorMessage.length() > 0 ) {
	throw new InvalidParameterException( errorMessage.toString() );
    }    
    return values;
  }

}
