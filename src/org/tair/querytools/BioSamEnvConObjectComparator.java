/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.util.Comparator;

public class BioSamEnvConObjectComparator implements Comparator {


  /**
   * Compares two BioSamEnvConObjects. This comparator is used to sort
   * the contents of BioSamEnvConObjectCollection for display on the 
   * expression set detail page.  Objects are first sorted so that
   * objects where the "is_experimental_variable" property is "true" 
   * display first; objects are then sub-sorted alphabetically according 
   * to condition type and name
   *
   * @return -1 if object 1 should sort before obj2, 1 if obj2 should sort
   * before obj1, or 0 if objects are equivalent, or if objects are
   * null, or not instances of BioSamEnvConObject
   */
  public int compare( Object obj1, Object obj2 ) {
    int returnCode = 0;

    if ( obj1 != null && obj2 != null ) {
      
      if ( obj1 instanceof BioSamEnvConObject && obj2 instanceof BioSamEnvConObject ) {
	BioSamEnvConObject envCon1 = (BioSamEnvConObject) obj1;
	BioSamEnvConObject envCon2 = (BioSamEnvConObject) obj2;
	
	// sort experimental variable first
	if ( envCon1.get_is_experimental_variable() != null && envCon1.get_is_experimental_variable().booleanValue() ) {
	  if ( envCon2.get_is_experimental_variable() == null || !envCon2.get_is_experimental_variable().booleanValue() ) {
	    returnCode = -1;
	  }
	} else if ( envCon2.get_is_experimental_variable() != null && envCon2.get_is_experimental_variable().booleanValue() ) {
	  returnCode = 1;
	}

	// if still equal, sort by condition type
	if ( returnCode == 0 ) {
	  if ( envCon1.get_condition_type() != null ) {
	    returnCode = ( envCon1.get_condition_type().compareTo( envCon2.get_condition_type() ) );
	  } else { // list nulls first
	    returnCode = -1;
	  }
	}

	// if still equal sort by condition name
	if ( returnCode == 0 ) {
	  if ( envCon1.get_condition_name() != null ) {
	    returnCode = ( envCon1.get_condition_name().compareTo( envCon2.get_condition_name() ) );
	  } else {
	    returnCode = -1;
	  }
	}
      } 
    }
    return returnCode;
  }
}
