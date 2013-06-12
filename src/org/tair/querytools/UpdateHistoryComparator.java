//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
//$Revision: 1.1 $
//$Date: 2004/06/16 17:30:53 $
//------------------------------------------------------------------------------


package org.tair.querytools;

import java.util.Comparator;

/**
 * For comparing the UpdateHistory objects , order them by date, descending
 */

public class UpdateHistoryComparator implements Comparator {

    public int compare( Object left, Object right ) {
        UpdateHistory leftUH = ( UpdateHistory ) left;
        UpdateHistory rightUH = ( UpdateHistory ) right;
        java.util.Date leftDate = leftUH.get_date();
        java.util.Date rightDate = rightUH.get_date();
        int result = 0;
        if ( leftDate!= null && rightDate!= null ) {
            result = rightDate.compareTo( leftDate );
        } else { // nulls
            result = -1;
        }
        return result;
    }
}

