//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2003/12/17 19:33:27 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.util.Comparator;

import org.tair.tfc.*;
import org.tair.utilities.*;


public class CommunityPublicationObjectComparator implements Comparator {

    /**
     * Compares two CommunityPublication objects and sorts them in reverse
     * order by year
     * 
     * @param obj1 Publication object to compare to obj2
     * @param obj2 Publication object to compare to obj1
     * @return -1 if obj1 should be sorted before obj2, 0 if items
     * are equal and 1 if obj2 should be sorted before obj1
     */
    public int compare( Object obj1, Object obj2 ) {
        int result = 0;

	if ( obj1 != null && obj2 != null ) {
            CommunityPublicationObject pub1 = (CommunityPublicationObject) obj1;
            CommunityPublicationObject pub2 = (CommunityPublicationObject) obj2;
            
            // if ref ids are equal, objects are the same
            if ( !pub1.get_reference_id().equals( pub2.get_reference_id() ) ) {
                Integer year1 = pub1.get_year();
                
                Integer year2 = pub2.get_year();
                result = -( year1.compareTo( year2 ) );
            }
            
        }

        return result;
    }



}

