/* 
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import javax.servlet.http.*;


/**
  * LongWebFormField is a specific subclass of WebFormField that translates 
  * the submitted <code>String</code> value into a <code>Long</code> object. 
  * If a submitted value cannot be converted into a Long,  <code>InvalidParameterException</code>
  * is thrown.  Other than this, LongWebFormField  will validate values and 
  * return them identically to WebFormField
  *
  * @see WebFormField
  */


public class LongWebFormField extends WebFormField {

  /**
    * Creates an instance of LongWebFormField with the supplied field name and
    * required status.
    *
    * @param fieldName Name to use for retrieving field value from <code>HttpServletRequest</code>
    * @required If <code>true</code>, this field is a required field and must have 
    * value when validate() is called; if <code>false</code>, field is not required 
    * and may have blank or null value.
    */
  public LongWebFormField( String fieldName, boolean required ) {
    super( fieldName, required );
  }


  /**
    * Retrieves field from value from request according to rules in <code>WebFormField</code>.
    * Any valid value is then converted into a Long object. <code>InvalidParameterException</code>
    * is thrown if  value cannot be converted to a Long.
    *
    * @param request <code>HttpServletRequest</code> to retrieve form field value from
    * @return Long representing submitted value, or <code>null</code> if value not found in 
    * request
    * @exception InvalidParameterException thrown if field is required and does not have value 
    * in request, or if submitted value cannot be translated to Long
    */
  public Object validate( HttpServletRequest request ) throws InvalidParameterException {
    
    String value = (String) super.validate( request );
    Long convertValue = null;

    try {
      if ( value != null ) {
	convertValue = new Long( value );
      }
    } catch ( NumberFormatException e ) {
      throw new InvalidParameterException( "Invalid Number: " + e.getMessage() );
    }
    return convertValue;
  }

}
