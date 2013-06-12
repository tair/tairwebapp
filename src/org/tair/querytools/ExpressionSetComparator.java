//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.3 $
// $Date: 2004/06/15 21:50:12 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import org.tair.tfc.*;
import org.tair.utilities.*;
import java.util.Comparator;

/**
 * Comparator to sort publication objects by year
 */

public class ExpressionSetComparator implements Comparator {

    /**
     * Compares two ExpressionSet and sorts them by 
     * experiment catagory
     *
     * @param obj1 ExpressionSet object to compare to obj2
     * @param obj2 Expression object to compare to obj1
     * @return -1 if obj1 should be sorted before obj2, 0 if items
     * are equal and 1 if obj2 should be sorted before obj1
     */
    public int compare( Object obj1, Object obj2 ) {
        int result = 0;

	if ( obj1 != null && obj2 != null ) {
	    String  kw1 =  ((ArrayElementExpressionSet)obj1).getFirstCategoryKeywordName();
            String  kw2 =  ((ArrayElementExpressionSet)obj2).getFirstCategoryKeywordName();
            if ( kw1.length() < 1 ){ 
                result = 1;
            }else if (  kw2.length() < 1) {
	        result = -1 ; 
	    }else{  
		result = kw1.compareTo( kw2 );
            }
	}
        
        return result;
    }
  }

