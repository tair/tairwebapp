//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2003/12/08 21:35:24 $
//------------------------------------------------------------------------------

package org.tair.utilities;

import javax.servlet.http.*;


/**
  * IntegerWebFormField is a specific subclass of WebFormField that translates 
  * the submitted <code>String</code> value into a <code>Integer</code> object. 
  * If a submitted value cannot be converted into a Integer,  
  * <code>InvalidParameterException</code> is thrown.  Other than this, 
  * IntegerWebFormField  will validate values and return them identically to 
  * WebFormField
  *
  * @see WebFormField
  */


public class IntegerWebFormField extends WebFormField {

    /**
     * Creates an instance of IntegerWebFormField with the supplied field name and
     * required status.
     *
     * @param fieldName Name to use for retrieving field value from 
     *  <code>HttpServletRequest</code>
     * @required If <code>true</code>, this field is a required field and must have 
     * value when validate() is called; if <code>false</code>, field is not required 
     * and may have blank or null value.
     */
    public IntegerWebFormField( String fieldName, boolean required ) {
        super( fieldName, required );
    }


    /**
     * Retrieves field from value from request according to rules in <code>WebFormField</code>.
     * Any valid value is then converted into a Integer object. 
     * <code>InvalidParameterException</code> is thrown if  value cannot be converted 
     * to a Integer.
     *
     * @param request <code>HttpServletRequest</code> to retrieve form field value from
     * @return Integer representing submitted value, or <code>null</code> if value 
     * not found in request
     * @exception InvalidParameterException thrown if field is required and does not have 
     * value in request, or if submitted value cannot be translated to Integer
     */
    public Object validate( HttpServletRequest request ) throws InvalidParameterException {
    
        String value = (String) super.validate( request );
        Integer convertValue = null;

        try {
            if ( value != null ) {
                convertValue = new Integer( value );
            }
        } catch ( NumberFormatException e ) {
            throw new InvalidParameterException( "Invalid Number: " + e.getMessage() );
        }
        return convertValue;
    }

}
