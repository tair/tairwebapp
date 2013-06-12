/**
 * $Id: MapFeatureComparator.java,v 1.3 2003/09/29 15:36:09 nam Exp $
 *
 * Created: Wed Sep 11 08:51:42 2002
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */


package org.tair.mapviewer.imageserver;

import java.util.Comparator;

/**
 * Comparator to sort map features by start position 
 */


public class MapFeatureComparator implements Comparator{


    /**
     * Compares two MapFeature objects by start position. If
     * objects other than MapFeature are submitted, a ClassCastException
     * will be thrown.  This comparator is used by MapSubBand classes
     * to sort the features found within a particular band. Sorting is
     * done as each MapSubBand is added to a MapBand object.
     *
     * @param lh MapFeature to compare to rh
     * @param rh MapFeature to compare to lh
     * @return -1 if lh object has a lower start position than rh
     0 if two objects have same start position
     1 if lh object has a greater start position than rh
    */
    public int compare( Object lh, Object rh ) {

        double left = ((MapFeature)lh).getStart();
        double right = ((MapFeature)rh).getStart();

        if ( left - right > 0 ) {
            return 1;

        } else if ( left - right < 0 ) {
            return -1;

        } else {
            return 0;
        }
    }

}
    
