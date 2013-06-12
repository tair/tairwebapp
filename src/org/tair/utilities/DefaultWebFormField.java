/* 
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import javax.servlet.http.*;

/**
  * DefaultWebFormField is a specific subclass of WebFormField that substitutes a default value if 
  * a null or empty value for this field is submitted in <code>HttpServletRequest</code>.  This field
  * is especially useful for HTML checkboxes that represent a boolean value. Only positive values will
  * be included in the request for these fields, so it is useful to use DefaultWebFormField so that a 
  * negative, or absent, value is still recorded. DefaultWebFormFields will never throw 
  * <code>InvalidParameterException</code> for empty values, since default value will be returned instead.
  * Other than this, DefaultWebFormField will validate values and return them identically to WebFormField
  *
  */


public class DefaultWebFormField extends WebFormField {
  private String defaultValue;
  
  /**
    * Creates an instance of DefaultWebFormField with the supplied field name, and value to use as a 
    * default value if a null or empty value is found for this field in the HttpServletRequest.  
    * DefaultWebFormField will use the super( String, boolean ) constructor of WebFormField to create
    * a field that is not a required field, since the default value will be used is value is missing
    *
    * @param fieldName Name of HTML form field
    * @param defaultValue Value to use if form submission has no value
    */
  public DefaultWebFormField( String fieldName, String defaultValue ) {
    super( fieldName, false );
    this.defaultValue = defaultValue;

  }


  /**
    * Retrieves and validates submitted form field value according to rules in WebFormField, with the 
    * exception that receipt of an empty value will cause defaultValue to be returned.
    *
    * @param request HttpServletRequest containing submitted value of form field
    * @return Submitted <code>String</code> value found in request, or defaultValue for field if submitted
    * value is null or empty.
    * @exception InvalidParameterException if value content length exceeds the maximum limit for this field
    */
  public Object validate( HttpServletRequest request ) throws InvalidParameterException {
    
    String value = (String) super.validate( request );

    if ( value == null ) {
      value = defaultValue;
    }
    return value;
  }
   
  

}
