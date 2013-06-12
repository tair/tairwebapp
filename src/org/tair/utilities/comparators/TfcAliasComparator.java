/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities.comparators;


import java.util.*;
import org.tair.tfc.*; 


/**
 * A class for comparing TfcAlias objects
 */
public class TfcAliasComparator implements Comparator {

    public int compare(Object o1, Object o2) {
	TfcAlias a1 = (TfcAlias) o1;
	TfcAlias a2 = (TfcAlias) o2;

	int result = 0;

	// order by alias
	result = a1.get_alias().compareTo(a2.get_alias());

	// order by type
	if (result == 0) {
	    result = a1.get_type().compareTo(a2.get_type());
	}

	// order by original alias
	if (result == 0) {
	    result = a1.get_original_alias().compareTo(a2.get_original_alias());
	}

	// if they share an alias id then they are equal no matter what
	if (a1.get_alias_id().equals(a2.get_alias_id())) {
	    result = 0;
	}
	
	return result;
    }

    public boolean equals(Object o) {
	if (o instanceof TfcAliasComparator) 
	    return true;

	return false;
    }

}
