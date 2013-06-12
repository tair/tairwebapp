/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.text.*;
import javax.servlet.http.*;


/**
  * DateWebFormField is a specific subclass of WebFormField that translates the
  * submitted <code>String</code> value into a <code>java.util.Date</code> object.
  * If a submitted value cannot be converted into a date of format "mm/dd/yyyy",
  * <code>InvalidParameterException</code> is thrown.  Other than this, DateWebFormField 
  * will validate values and return them identically to WebFormField
  *
  *
  * @see WebFormField
  */


public class DateWebFormField extends WebFormField {
  private static java.util.Date maxAllowableDate;
  private static java.util.Date minAllowableDate;
  
  static {
    try {
      // Sybase smalldatetime limit is 6/6/2079 - use this value to head off values 
      // that are valid Java dates but that exceed this limit.
      maxAllowableDate = DateFormat.getDateInstance( DateFormat.SHORT ).parse( "12/31/2078" );
      
      // do same for minimum date - Sybase limit is January 1, 1900
      minAllowableDate = DateFormat.getDateInstance( DateFormat.SHORT ).parse( "01/01/1900" );
      
    } catch (ParseException e) { // shouldn't ever happen, but just in case...
      e.printStackTrace();
    }
  }

    
  /**
    * Creates an instance of DateWebFormField with the supplied field name and required status.
    *
    * @param fieldName Name to use for retrieving field value from <code>HttpServletRequest</code>
    * @required If <code>true</code>, this field is a required field and must have value when validate()
    * is called; if <code>false</code>, field is not required and may have blank or null value.
    */
  public DateWebFormField( String fieldName, boolean required ) {
    super( fieldName, required );
  }


  /**
    * Retrieves field from value from request according to rules in <code>WebFormField</code>.  Any valid
    * value is then converted into a java.util.Date object of format "mm/dd/yyyy".  
    * <code>InvalidParameterException</code> is thrown if value cannot be converted to a 
    * Date object with this format.
    *
    * @param request <code>HttpServletRequest</code> to retrieve form field value from
    * @return java.util.Date representing submitted value, or <code>null</code> if value not found in 
    * request
    * @exception InvalidParameterException thrown if field is required and does not have value in request, 
    * or if submitted value cannot be translated to java.util.Date
    */
  public Object validate( HttpServletRequest request ) throws InvalidParameterException {
    
    String value = (String) super.validate( request );
    java.util.Date convertDate = null;

    try {
      if ( value != null ) {
	convertDate = DateFormat.getDateInstance( DateFormat.SHORT ).parse( value );
      }
      if ( convertDate != null && convertDate.after( maxAllowableDate ) ) {
	throw new InvalidParameterException( "Invalid date: " + 
					     TextConverter.dateToString( convertDate ) + 
					     " exceeds maximum allowable date" );
      }

      if ( convertDate != null && convertDate.before( minAllowableDate ) ) {
	throw new InvalidParameterException( "Invalid date: " + 
					     TextConverter.dateToString( convertDate ) + 
					     " is less than minimum allowable date" );
      }

      
    } catch ( ParseException e ) {
      throw new InvalidParameterException( "Invalid date: " + e.getMessage() );
    }
    
    return convertDate;
  }


  /**
   * Converts fieldName's value in request to a Date object.  This method is provided as
   * a static utility method as an easy way to convert values without creating an instance
   * of the object.
   *
   * @param request <code>HttpServletRequest</code> to retrieve form field value from
   * @return java.util.Date representing submitted value, or <code>null</code> if value not found in 
   * request
   * @exception InvalidParameterException thrown if submitted value cannot be translated to java.util.Date,
   * or if data value exceeds max or min allowable dates
   */
  public static java.util.Date retrieveDate( HttpServletRequest request, String fieldName ) throws InvalidParameterException {
    java.util.Date convertDate = null;
    String value = request.getParameter( fieldName );

    try {
      if ( value != null ) {
	convertDate = DateFormat.getDateInstance( DateFormat.SHORT ).parse( value );
      }
      if ( convertDate != null && convertDate.after( maxAllowableDate ) ) {
	throw new InvalidParameterException( "Invalid date: " + 
					     TextConverter.dateToString( convertDate ) + 
					     " exceeds maximum allowable date" );
      }
      
      if ( convertDate != null && convertDate.before( minAllowableDate ) ) {
	throw new InvalidParameterException( "Invalid date: " + 
					     TextConverter.dateToString( convertDate ) + 
					     " is less than minimum allowable date" );
      }

      
    } catch ( ParseException e ) {
      throw new InvalidParameterException( "Invalid date: " + e.getMessage() );
    }
    
    return convertDate;
  }



  /**
   * Converts submitted simple date value as String (mm/dd/yyyy) to a Date object.  This method is 
   * provided as a static utility method as an easy way to convert values without creating an instance
   * of the object.
   *
   * @param submitDate String version of date to be parsed
   * @return java.util.Date representing submitted value
   * @exception InvalidParameterException thrown if submitted value cannot be translated to java.util.Date,
   * or if data value exceeds max or min allowable dates
   */
  public static java.util.Date parseDate( String submitDate ) throws InvalidParameterException {
    java.util.Date convertDate = null;

    try {
      if ( submitDate != null ) {
	convertDate = DateFormat.getDateInstance( DateFormat.SHORT ).parse( submitDate );
      }
      if ( convertDate != null && convertDate.after( maxAllowableDate ) ) {
	throw new InvalidParameterException( "Invalid date: " + 
					     TextConverter.dateToString( convertDate ) + 
					     " exceeds maximum allowable date" );
      }
      
      if ( convertDate != null && convertDate.before( minAllowableDate ) ) {
	throw new InvalidParameterException( "Invalid date: " + 
					     TextConverter.dateToString( convertDate ) + 
					     " is less than minimum allowable date" );
      }

      
    } catch ( ParseException e ) {
      throw new InvalidParameterException( "Invalid date: " + e.getMessage() );
    }
    
    return convertDate;
  }




}
