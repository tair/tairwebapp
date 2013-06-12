/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import javax.servlet.http.*;
import java.util.*;

/**
  * CompoundWebFormField is used to easily retrieve a set of values from form fields that
  * use the name of the form field to pass information along with the field value.  An 
  * example is when several Affiliation job titles can be submitted in the same form post
  * by naming each field with a given prefix followed by community ID ( i.e. title_1235 
  * where 1235 is the community ID that should receive the job title submitted as the field's
  * value ). CompoundWebFormField can represent multiple values for each key, so it returns
  * key/value pairs as a CompoundVector that can be iterated through to get each key & value 
  * pair. Key values will either be a <code>Long</code> or <code>String</code>, as determined
  * by the value of the constructor parameter <code>numeric</code>.
  *
  * @see CompoundVector
  * @see OrderFormValidator
  */


public class CompoundWebFormField extends WebFormField {
  private String prefix;
  private boolean numeric;

  /**
    * Creates an instance of CompoundWebFormField with the submitted field name, required status,
    * maximum content length, field prefix to use while parsing, and whether parsed key should
    * be a <code>Long</code> or <code>String</code> This constructor will use the 
    * super(String, boolean, int) constructor of WebFormField to create a field that will 
    * automatically validated for content length
    * 
    * @param fieldName Name of HTML form fields as a group
    * @param required If <code>true</code> this field must have value, or an exception will be thrown
    * @param length Maximum character length of each token in full submission
    * @param prefix String prefix used in form field name
    * @param numeric If <code>true</code> then parsed value from field name will be stored as 
    * a <code>Long</code> otherwise as a <code>String</code>
    *
    */
  public CompoundWebFormField( String fieldName, boolean required, int length, String prefix, boolean numeric ) {
    super( fieldName, required, length );
    this.prefix = prefix;
    this.numeric = numeric;
  }

  /**
    * Creates an instance of CompoundWebFormField with the submitted field name, required status,
    * field prefix to use while parsing, and whether parsed key should be a <code>Long</code> or 
    * <code>String</code> This constructor will use the  super(String, boolean ) constructor 
    * of WebFormField to create a field that is not automatically validated for content length
    * 
    * @param fieldName Name of HTML form fields as a group
    * @param required If <code>true</code> this field must have value, or an exception will be thrown
    * @param prefix String prefix used in form field name
    * @param numeric If <code>true</code> then parsed value from field name will be stored as 
    * a <code>Long</code> otherwise as a <code>String</code>
    *
    */
  public CompoundWebFormField( String fieldName, boolean required, String prefix, boolean numeric ) {
    super( fieldName, required );
    this.prefix = prefix;
    this.numeric = numeric;
  }


  /**
    * Retrieves multiple values by parsing all request fields that begin with prefix.  
    * 
    * @param request HttpServletRequest containing values from form submission
    * @return CompoundVector of parsed values in field with parsed value from field name as 
    * <code>Long</code> or <code>String</code> key (depending on value of numeric in constructor)
    * referencing field value, or null if no value was submitted
    * @exception InvalidParameterException thrown if field is required and is submitted with no value, or
    * if any parsed values exceed the stated maximum character length for this field, or if numeric
    * key is requested and parsed property cannot be translated into a <code>Long</code>.
    */
  public Object validate( HttpServletRequest request ) throws InvalidParameterException {
    CompoundVector values = null;
    StringBuffer errorMessage = new StringBuffer();
    Enumeration itr = null;
    String field = null;
    String value = null;

    // declare as Object so can be either Long or String at runtime
    Object property = null;

    if ( isMultiple() ) {
      return validateMultiple( request );
    } else {

      // iterate through all parameters in request and process those with prefix
      itr = request.getParameterNames();
      while ( itr.hasMoreElements() ) {
	try {
	  field = (String) itr.nextElement();
	  if ( field.startsWith( prefix ) ) {
	    if ( request.getParameter( field ) != null ) {
	      property = null;
	      
	      // if property after prefix is String "null", let property key stay null
	      if ( !field.substring( prefix.length() ).equalsIgnoreCase( "null" ) ) {
		// translate to Long for IDs, String for all others
		if ( numeric ) {
		  property = new Long( field.substring( prefix.length() ) );
		} else {
		  property = field.substring( prefix.length() );
		}
	      }
	      
	      value = request.getParameter( field ).trim(); // get value for this field

	      if ( restrictLength && value.length() > length ) { // validate length of value if required
		errorMessage.append( fieldName + " values cannot be greater than " + length + " characters long." );
	      } else {
		if ( value.equals( "" ) ) { // translate empty string to null value
		  value = null;
		}   
		if ( values == null ) {
		  values = new CompoundVector();
		}
		values.put( property, value );
	      }
	    } else if ( isRequired() ) {
	      errorMessage.append( fieldName + " cannot be blank." );
	    }     
	  }   
	  
	  field = null;
	  
	  // use string buffer to collect messages before throwing exception
	} catch ( NumberFormatException nfe ) {
	  errorMessage.append( "Invalid number: " + nfe.getMessage() );
	}
	
      }
      
      if ( errorMessage.length() > 0 ) {
	throw new InvalidParameterException( errorMessage.toString() );
      }    
      return values;
    }
  }
  


  // if same key can have multiple values, use this method to retrieve from request
  private Object validateMultiple( HttpServletRequest request ) throws InvalidParameterException {
    CompoundVector values = null;
    StringBuffer errorMessage = new StringBuffer();
    Enumeration itr = null;
    String field = null;
    String[] formValues = null;

    // declare as Object so can be either Long or String at runtime
    Object property = null;

    if ( multiple ) {

      // iterate through all parameters in request and process those with prefix
      itr = request.getParameterNames();
      while ( itr.hasMoreElements() ) {
	try {
	  field = (String) itr.nextElement();
	  if ( field.startsWith( prefix ) ) {
	    if ( request.getParameter( field ) != null ) {
	      property = null;
	      
	      // if property after prefix is null, let property key stay null
	      if ( !field.substring( prefix.length() ).equalsIgnoreCase( "null" ) ) {
		// translate to Long for IDs, String for all others
		if ( numeric ) {
		  property = new Long( field.substring( prefix.length() ) );
		} else {
		  property = field.substring( prefix.length() );
		}
	      }
	      
	      formValues = request.getParameterValues( field ); // get all values for this field as String[]
	      boolean found = false;

	      if ( formValues != null ) {	
		for ( int i = 0; i < formValues.length; i++ ) {
		  if ( formValues[ i ] != null && !formValues[ i ].trim().equals( "" ) ) {
		    found = true;
		    if ( restrictLength && formValues[ i ].length() > length ) { // validate length 
		      errorMessage.append( fieldName + " must not be more than " + length + " characters long. " );
		    }
		    if ( values == null ) {
		      values = new CompoundVector();
		    }
		    values.put( property, formValues[ i ] );
		  }
		}
	      }
	      
	      if ( required  && !found ) {
		errorMessage.append( fieldName + " must not be blank. " );
	      }
	    }
	  }

	  field = null;

	} catch ( NumberFormatException nfe ) {
	  errorMessage.append( "Invalid number: " + nfe.getMessage() );
	}
      }
      
      if ( errorMessage.length() > 0 ) {
	throw new InvalidParameterException( errorMessage.toString() );
      }    
    }
    return values;
  }

}
