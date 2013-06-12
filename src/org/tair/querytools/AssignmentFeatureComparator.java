//-----------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2004/07/28 20:00:38 $
//-----------------------------------------------------------------------------

package org.tair.querytools;

import org.tair.tfc.*;
import java.util.Comparator;

public class AssignmentFeatureComparator implements Comparator{

    public int compare( Object lh, Object rh ) {
	String leftType = ( ( TfcAssignmentFeature ) lh ).getType();
	String rightType = ( ( TfcAssignmentFeature ) rh ).getType();

	if( leftType.compareTo( rightType ) == 0 ){
            int left = 
                ( ( TfcAssignmentFeature )lh ).getStartPosition().intValue();
            int right =
                ( ( TfcAssignmentFeature )rh ).getStartPosition().intValue();
            return left-right;
	}
	else{
	    return 0;
	}
    }
    
    public boolean equals( Object obj ){
	return true; // will not use this method for sorting, well, don't care.
    }

}

