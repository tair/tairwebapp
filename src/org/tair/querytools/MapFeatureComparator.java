/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import org.tair.tfc.*;
import java.util.Comparator;

public class MapFeatureComparator implements Comparator {

    public int compare( Object lh, Object rh ) {

        GlobalAssignment left = (GlobalAssignment) lh;
        GlobalAssignment right = (GlobalAssignment) rh;

        String leftType = left.getLinkType();
        String rightType = right.getLinkType();
    
        int result = 0;
    
        if ( leftType != null && rightType != null ) {

            // if equal sort by start position

            if ( leftType.equals( rightType ) ) {
                if ( left.getStartPosition() != null ) {
                    result = 
                        left.getStartPosition().
                        compareTo( right.getStartPosition() );
                } 
                else {
                    result = -1;
                }
            } 

            // gene should always sort first

            else if ( leftType.equals( "gene" ) ) {
                result = -1;
            }

            // marker after gene, before everything else

            else if ( leftType.equals( "marker" ) ) { 

                if ( rightType.equals( "gene" ) ) {
                    result = 1;
                } 
                else {
                    result = -1;
                }
            } 

            // clone end after gene & marker

            else if ( leftType.equals( "cloneend" ) && 
                      ( rightType.equals( "gene" ) || 
                        rightType.equals( "marker" ) ) ) {
                result = 1;
            }

            // otherwise, sort alphabetically according to whatever 
            // String.compareTo returns

            else {
                result = leftType.compareTo( rightType );
            }
        } 

        // if null sort first

        else { 
            result = -1;
        }

        return result;
    }
    
}

