/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.goslim;

import java.awt.*;

/**  static Class to hold a set of 55 colors used for the piecharts - right now 55 works out
 *   since there are at most 53 goslim terms per category - will probably want to make this more dymanic in the future
  */

public class GOSlimPieColor {

    private static Color[] colors = new Color[] {


            new Color( 240, 240, 240 ), // i, i, i where i = 245 
            new Color( 240,  15,  15 ), // i, 0, 0 
            new Color(  15, 240,  15 ), // 0, i, 0
            new Color(  15,  15, 240 ), // 0, 0, i
            new Color( 240, 240,  15 ), // i, i, 0
            new Color(  15, 240, 240 ), // 0, i, i
            new Color( 240,  15, 240 ), // i, 0, i
            new Color( 192, 192, 192 ), // i, i, i where i = 192 
            new Color( 192,  15,  15 ), // i, 0, 0 
            new Color(  15, 192,  15 ), // 0, i, 0
            new Color(  15,  15, 192 ), // 0, 0, i
            new Color( 192, 192,  15 ), // i, i, 0
            new Color(  15, 192, 192 ), // 0, i, i
            new Color( 192,  15, 192 ), // i, 0, i
            new Color( 176, 176, 176 ), // i, i, i where i = 176 
            new Color( 176,  45,  45 ), // i, 0, 0 where 0 = 15 + 30
            new Color(  45, 176,  45 ), // 0, i, 0
            new Color(  45,  45, 176 ), // 0, 0, i
            new Color( 176, 176,  45 ), // i, i, 0
            new Color(  45, 176, 176 ), // 0, i, i
            new Color( 176,  45, 176 ), // i, 0, i
            new Color( 188, 188, 188 ), // i, i, i where i = 188 
            new Color( 188,  45,  45 ), // i, 0, 0 where 0 = 15 + 30
            new Color(  45, 188,  45 ), // 0, i, 0
            new Color(  45,  45, 188 ), // 0, 0, i
            new Color( 188, 188,  45 ), // i, i, 0
            new Color(  45, 188, 188 ), // 0, i, i
            new Color( 188,  45, 188 ), // i, 0, i
            new Color( 224, 224, 224 ), // i, i, i where i = 224
            new Color( 224,  15,  15 ), // i, 0, 0 
            new Color(  15, 224,  15 ), // 0, i, 0
            new Color(  15,  15, 224 ), // 0, 0, i
            new Color( 224, 224,  15 ), // i, i, 0
            new Color(  15, 224, 224 ), // 0, i, i
            new Color( 224,  15, 224 ), // i, 0, i
            new Color( 160, 160, 160 ), // i, i, i where i = 160 
            new Color( 160,  15,  15 ), // i, 0, 0 
            new Color(  15, 160,  15 ), // 0, i, 0
            new Color(  15,  15, 160 ), // 0, 0, i
            new Color( 160, 160,  15 ), // i, i, 0
            new Color(  15, 160, 160 ), // 0, i, i
            new Color( 160,  15, 160 ), // i, 0, i
            new Color( 134, 134, 134 ), // i, i, i where i = 134 
            new Color( 134,  45,  45 ), // i, 0, 0 where 0 = 15 + 30
            new Color(  45, 134,  15 ), // 0, i, 0
            new Color(  45,  45, 134 ), // 0, 0, i
            new Color( 134, 134,  45 ), // i, i, 0
            new Color(  45, 134, 134 ), // 0, i, i
            new Color( 134,  45, 134 ), // i, 0, i
            new Color( 102, 102, 102 ), // i, i, i where i = 102 
            new Color( 102,  45,  45 ), // i, 0, 0 where 0 = 15 + 30
            new Color(  45, 102,  45 ), // 0, i, 0
            new Color(  45,  45,  32 ), // 0, 0, i
            new Color( 102, 102,  45 ), // i, i, 0
            new Color(  45, 102, 102 ), // 0, i, i
            new Color( 102,  45, 102 ), // i, 0, i
            new Color(  15,  15,  15 )  // blackish	


            };

    /**
     * @return Color at requested index of the color array 
     */  
    public static Color getColor( int index ) {  
        Color color = null;
        if ( index < colors.length ) color = colors[ index ];
        return color;
    }


    public static void main( String[] args ) {
        System.out.println( "total # of colors in this pallette = " + colors.length ); 
    }


}
