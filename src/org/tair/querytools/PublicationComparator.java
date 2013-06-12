//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.4 $
// $Date: 2004/04/26 19:27:34 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import org.tair.tfc.*;
import org.tair.utilities.*;
import java.util.Comparator;

/**
 * Comparator to sort publication objects by year
 */

public class PublicationComparator implements Comparator {

    /**
     * Compares two PublicationObjects and sorts them by 
     * publication year.  If year is the same, sorts by publication
     * title.
     *
     * @param obj1 Publication object to compare to obj2
     * @param obj2 Publication object to compare to obj1
     * @return -1 if obj1 should be sorted before obj2, 0 if items
     * are equal and 1 if obj2 should be sorted before obj1
     */
    public int compare( Object obj1, Object obj2 ) {
        int result = 0;

	if ( obj1 != null && obj2 != null ) {
	    PublicationObject pubObj1 = (PublicationObject) obj1;
	    PublicationObject pubObj2 = (PublicationObject) obj2;

	    Integer year1 = pubObj1.get_year();
	    Integer year2 = pubObj2.get_year();

	    // if same years, sort by name; else return difference
	    // between two values as reversed value of Integer compareTo
	    // (reverse to get most recent year first)
	    if ( year1.equals( year2 ) ) {
		result = pubObj1.get_title().compareTo( pubObj2.get_title() );
	    } else {
		result = -( year1.compareTo( year2 ) );
	    }
	}
        
        return result;
    }



}

