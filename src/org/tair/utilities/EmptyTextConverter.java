/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.util.*;
import java.lang.*;

public class EmptyTextConverter {
    
    public static String convert( String value ) {
      String converted = "";
      if( value != null && !value.trim().equalsIgnoreCase("NULL")) {
	converted = value;
      }
      return converted;
    }

    public static String convert( String value, boolean encode ) {
      String converted = "";
      if ( value != null && encode && value.indexOf( '<' ) > -1 ) {
	char[] temp = value.toCharArray();
	StringBuffer buffer = new StringBuffer();
	for ( int i = 0; i < temp.length; i++ ) {
	  if ( temp[ i ] == '<' ) {
	    buffer.append( "&#60" );
	  } else {
	    buffer.append( temp[ i ] );
	  }
	}
	converted = buffer.toString();	    
      } 
      else if(value != null){
	converted = value;	    
      }
      return converted;
    }

    public static String convert( Character c ) {
	String converted = "";
	if(c != null){
	    converted = c.toString();
	}
	return converted;
    }
    
    public static String convert( Boolean b ) {
	String converted = "";
	if(b != null){
	    if(b.booleanValue()){
		converted = "yes";
	    }
	    else{
		converted = "no";
	    }
	}
	return converted;
    }
    
    public  static String convert( Integer i ) {
	String converted = "";
	if(i != null){
	    converted = i.toString();
	}
	return converted;
    }
    
    public  static String convert( Long l) {
	String converted = "";
	if(l != null){
	    converted = l.toString();
	}
	return converted;
    }
    
    public static String convert(Float f ) {
	String converted = "";
	if(f != null){
	    converted = f.toString();
	}
	return converted;
    }
    
    public static String convert( java.util.Date d ) {
	String converted = "";
	if(d != null){
	    converted = d.toString();
	}
	return converted;
    }
    
    public  static String convert( Double d ) {
	String converted = "";
	if(d != null){
	    converted = d.toString();
	}
	return converted;
    }
    
}
