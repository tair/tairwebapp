//-----------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2004/07/28 20:00:38 $
//-----------------------------------------------------------------------------

package org.tair.querytools;

import org.tair.tfc.*;
import java.util.Comparator;

public class AssignmentFeatureTypeComparator implements Comparator {

    public int compare( Object lh, Object rh ) {
	String left = ( ( TfcAssignmentFeature ) lh ).getType();
	String right = ( ( TfcAssignmentFeature ) rh ).getType();
	int result = left.compareTo( right );
	return result;
    }
    
    public boolean equals( Object obj ) {
	return true; // will not use this method for sorting, well, don't care.
    }

}

