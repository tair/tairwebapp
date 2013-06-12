/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.util.*;
import javax.servlet.http.*;

/**
  * WebFormField is an abstract representation of an HTML form field
  * that can be used for retrieving and validating parameters from an 
  * <code>HttpServletRequest</code>.  WebFormField can be used by creating
  * one instance for every form field to be retrieved and setting characteristics
  * for validation and parameter retrieval.  For instance, if a certain field is
  * required for submission, the required field can be set true in WebFormField.
  * When a request is received, it can be passed to the fields validate() method
  * - if the field is empty an <code>InvalidParameterException</code> is thrown, 
  * if not, the field's value is retrieved and returned.  In this way, a collection
  * of  WebFormFields can be set up for a particular page and iterated through by 
  * calling the validate() method on each field.  Individual fields can also be 
  * subclassed from WebFormField to override the validate method for implementing
  * specific validation rules.
  *
  * @see org.tair.community.CommunityFormValidator
  * @see org.tair.abrc.OrderFormValidator
  */

public class WebFormField {

  /**
    * Determines whether field may have multiple values or not.  If multiple is 
    * <code>true</code>, values will be retrieved from the request using the
    * getParameterValues( String ) method, and validate method will return a String
    * array of values for this field. If multiple is <code>false</code>, a single
    * value will be returned from validate.
    */
  protected boolean multiple;

  /**
    * Determines whether field is required for submission.  If field is required,
    * but is empty when validate is called, <code>InvalidParameterException</code>
    * will be thrown
    */
  protected boolean required;

  /**
    * Determines whether field should be restricted to a specific number of characters.
    * If restrictLength is  <code>true</code> and field value is greater than length for
    * field, <code>InvalidParameterException</code> will be thrown by validate
    */
  protected boolean restrictLength;

  /**
    * The maximum number of characters field value can be. Exceeding this limit will 
    * throw <code>InvalidParameterException</code>
    * if restrictLength is <code>true</code>
    */
  protected int length;


  /**
    * Name of parameter to use when retrieving value from <code>HttpServletRequest</code>
    */
  protected String fieldName;



  /**
    * Creates an instance of WebFormField with submitted field name and required status.
    * Using this constructor will default multiple, and restrictLength to <code>false</code>
    */
  public WebFormField( String fieldName, boolean required  ) {
    this.fieldName = fieldName;
    this.required = required;
    multiple = false;
    restrictLength = false;
  }


  /**
    * Creates an instance of WebFormField with submitted field name, required status and
    * maximum character length of value.  Using this constructor will automatically set 
    * restrictLength to <code>true</code> while defaulting multiple to <code>false</code>
    */
  public WebFormField( String fieldName, boolean required, int length ) {
    this.fieldName = fieldName;
    this.required = required;
    multiple = false;
    restrictLength = true;
    this.length = length;
  }


  /**
    * Retrieves submitted value for this form field from <code>HttpServletRequest</code>,
    * validates submitted value, and returns field value if validation succeeds.  If 
    * field is multiple, processing is passed to validateMultiple(), and an array of String
    * values is returned.  
    *
    * @param request <code>HttpServletRequest</code> containing form field parameters
    * @return Value of field as Object, to allow for return of Array of <code>String</code> 
    * values if field is a multiple value field, or a single <code>String</code> if field is 
    * not a multiple value field.  Will return null if no value submitted for this field
    * @exception InvalidParameterException thrown if field is required and has no submitted
    * value, or if length of field should be restricted and submitted value exceeds this limit.
    */
  public Object validate( HttpServletRequest request ) throws InvalidParameterException {
    StringBuffer errorMessage = new StringBuffer();
    String value = null;

    if ( multiple ) {
      return validateMultiple( request );

    } else {

      if ( request.getParameter( fieldName ) != null && !request.getParameter( fieldName ).trim().equals( "" ) ) {
	value = request.getParameter( fieldName ).trim();
      }
      
      if ( required ) {
	if ( value == null || value.equals( "" ) ) {
	  errorMessage.append( fieldName + " must not be blank. " );
	}
      }

      if ( value != null && restrictLength && value.length() > length ) {
	errorMessage.append( fieldName + " must not be more than " + length + " characters long. " );
      }
          
      if ( errorMessage.length() > 0 ) {
	throw new InvalidParameterException( errorMessage.toString() );
      }
    } 
    return value;
  }


  /**
    * Retrieves multiple submitted values for this form field from <code>HttpServletRequest</code>,
    * validates submitted values, and returns field values if validation succeeds.  If field is
    * multiple, but has only a single value submitted, return value will contain a 
    * <code>String</code> array with one element in it.
    *
    * @param request <code>HttpServletRequest</code> containing form field parameters
    * @return Array of <code>String</code> values, or null if no value submitted for this field
    * @exception InvalidParameterException thrown if field is required and has no submitted value,
    * or if length of field should be restricted and any submitted value exceeds this limit.
    */
  private String[] validateMultiple( HttpServletRequest request ) throws InvalidParameterException {
    StringBuffer errorMessage = new StringBuffer();
    
    String[] values = null;

    if ( multiple ) {
      if ( request.getParameter( fieldName ) != null ) {
	values = request.getParameterValues( fieldName );
      }

      boolean found = false;
      if ( values != null ) {	
	for ( int i = 0; i < values.length; i++ ) {
	  if ( values[ i ] != null && !values[ i ].trim().equals( "" ) ) {
	    found = true;
	    if ( restrictLength && values[ i ].length() > length ) {
	      errorMessage.append( fieldName + " must not be more than " + length + " characters long. " );
	    }
	  }
	}
      }

      if ( required  && !found ) {
	errorMessage.append( fieldName + " must not be blank. " );
      }
     
      if ( errorMessage.length() > 0 ) {
	throw new InvalidParameterException( errorMessage.toString() );
      }
    }
    return values;
      
  }
  
  public boolean isMultiple() { return multiple; }
  public boolean isRequired() { return required; }
  public int getLength() { return length; }
  public String getFieldName() { return fieldName; }

  public void setMultiple( boolean multiple ) { this.multiple = multiple; }
  public void setRequired( boolean required ) { this.required = required; }
  public void setFieldName( String fieldName ) { this.fieldName = fieldName; }
 
  /**
    * Sets maximum length for this form field.  Using this method automatically
    * set restrictLength to <code>true</code>
    */
  public void setLength( int length ) { 
    restrictLength = true;
    this.length = length; 
  }

}
