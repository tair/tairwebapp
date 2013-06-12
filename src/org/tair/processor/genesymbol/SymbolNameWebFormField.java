// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.genesymbol;

import java.sql.*;
import java.util.*;
import javax.servlet.http.*;

import org.tair.utilities.*;

/**
 * SymbolNameWebFormField is used for GeneClassSymbol's name field  
 */

public class SymbolNameWebFormField extends WebFormField {
    public SymbolNameWebFormField (  String fieldName, boolean required, int length ){
	super (fieldName, required, length);
    }
    /**
    * Retrieves submitted value for this form field from <code>HttpServletRequest</code>,
    * validates submitted value, and returns field value if validation succeeds. 
    *
    * @param request <code>HttpServletRequest</code> containing form field parameters
    * @return Value of field as Object 
    * @exception InvalidParameterException thrown if field is required and has no submitted
    * value, or if length of field should be restricted and submitted value exceeds this limit.
    * or the name is not in the right format ( all upper case, not starts with "at")
    */
    public Object validate( HttpServletRequest request )
        throws InvalidParameterException   {
        
       String value = (String) super.validate( request );
       if (value == null){ return null; }
       if (value.length() < 2 ){
           throw new InvalidParameterException("Gene Class Symbol name should be at least 2 letters long.");
       }
       if ( ! allLetters( value) ){
	   throw new InvalidParameterException("Gene Class Symbol name should only contain letters.");
       }
       value =  value.toUpperCase();
       
       return value;

    }
   
    /**
     * To check a string has only characters
     * @param String 
     * @return true if the string only  character, false otherwise
     */ 
    private boolean allLetters( String checkThis){
	for (int i=0; i<checkThis.length();i++){
	    if ( ! Character.isLetter(checkThis.charAt(i))){
		return false;
	    }
     
	} 
	return true;
    }
    
}
