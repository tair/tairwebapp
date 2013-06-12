/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import javax.servlet.http.*;

/**
  * BooleanWebFormField is a specific subclass of WebFormField that translates a form
  * submission into a true/false value. BooleanWebFormField is created with a value to
  * consider a "true" value; if this value is found in the <code>HttpServletRequest</code>
  * referenced by form field's assigned name, a <code>Boolean</code> object with a value
  * of <code>true</code> will be returned.  If no form field with BooleanWebFormField's
  * name is found in request, or if field value is not the same as "true value", then
  * a <code>Boolean</code> object with value of <code>false</code> will be returned;
  *
  * <p>
  * Since this field will translate any submission into either a true or false value, 
  * <code>InvalidParameterException</code> should never be thrown when validate() is called
  */


public class BooleanWebFormField extends WebFormField {
  private String trueValue; 
  
  /**
    * Creates an instance of BooleanWebFormField with the supplied field name, and value to use as a 
    * true value. When validate() is called, if a field with submitted fieldName is found in request
    * with value of trueValue, a Boolean object with a value of <code>true</code> will be returned; 
    * if a nullor empty value is found for this field in the HttpServletRequest, or if field's value 
    * is not trueValue, then a Boolean object with a value of <code>false</code> will be returned.  
    * BooleanWebFormField will use the super( String, boolean ) constructor of WebFormField to create
    * a field that is not a required field
    *
    * @param fieldName Name of HTML form field
    * @param trueValue Value to consider a "true" value when retrieving fieldName 
    */
  public BooleanWebFormField( String fieldName, String trueValue ) {
    super( fieldName, false );
    this.trueValue = trueValue;

  }


  /**
    * Retrieves and validates submitted form field and translates value into a <code>Boolean</code>
    * object.  If fieldName is found in request with trueValue, <code>Boolean</code> object will have
    * a <code>true</code> value; if no field is found for fieldName, or if any value is found besides
    * trueValue, <code>Boolean</code> object will have a value of <code>false</code>
    *
    * @param request HttpServletRequest containing submitted value of form field
    * @return Submitted <code>String</code> value found in request, or defaultValue for field if submitted
    * value is null or empty.
    */
  public Object validate( HttpServletRequest request ) {
    Boolean translatedValue = null;

    String value = request.getParameter( super.getFieldName() );
    if ( !TextConverter.isEmpty( value ) && value.equals( trueValue ) ) {
      translatedValue = new Boolean( true );
    } else { 
      translatedValue = new Boolean( false );
    }
    return translatedValue;
  }
   
  

}
