//-----------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2004/07/28 19:18:18 $
//-----------------------------------------------------------------------------

package org.tair.querytools;

import org.tair.tfc.*;
import java.util.Comparator;

public class LocalAssignmentComparator implements Comparator {

    public int compare( Object lh, Object rh ) {
	Double left = ( ( TfcLocalAssignment ) lh ).getStartPosition();
	Double right = ( ( TfcLocalAssignment ) rh ).getStartPosition();
	int result = left.compareTo( right );
	return result;
    }
    
    public boolean equals( Object obj ) {
	return true; // will not use this method for sorting, well, don't care.
    }

}

