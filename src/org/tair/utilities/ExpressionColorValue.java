/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

public class ExpressionColorValue { 

/**
* Converts <code>double</code> value to a String representing a color for 
* display on a jsp page.  The color varies according to predetermined
* display preferences based on the expression value passed in 
*
* @param double expression value to be converted into a color value
* @return String containing RBG string assembled for jsp display
*/
    private static final String getColor( double dValue, String myColorCombo ) {
        String r = "ff";
        String g = "ff";
        String b = "ff";
        String tmp = null;
        String color = "cccccc";
        double absDv = Math.abs(dValue);
        String colorCombo = null;

        if ( myColorCombo != null ) {
            colorCombo = myColorCombo;
        } else { // default color combo
            colorCombo = "RG";
        }

        //if value < 2 return grey (cccccc)
        if ( absDv < 2 ) {
        return color;
        }

        //set different color intensities based on value
        if ( ( int )absDv >= 6 ) {
            tmp = "00";
        } else if ( ( int )absDv >= 5 ) {
            tmp = "33";
        } else if ( ( int )absDv >= 4 ) {
            tmp = "66";
        } else if ( ( int )absDv >= 3 ) {
            tmp = "99";
        } else {
            tmp = "cc";
        }

        // base on chosen color combo and sign of the value, set the r, g, b that make up the color
        if ( colorCombo.equalsIgnoreCase( "RB" ) ) {
            if ( dValue > 0 ) { // red for positive values
                g = tmp;
                b = tmp; 
            } else if ( dValue < 0 ) { // blue for negative
                r = tmp;
                g = tmp;
            }
        } else if ( colorCombo.equalsIgnoreCase( "YB" ) ) {
            if ( dValue > 0 ) { // yellow for positive values
                b = tmp; 
            } else if ( dValue < 0 ) { // blue for negative
                r = tmp;
                g = tmp;
            }
        } else { // default is red/green
            if ( dValue > 0 ) { // red for positive values
                g = tmp;
                b = tmp; 
            } else if ( dValue < 0 ) { // green for negative
                r = tmp;
                b = tmp;
            }
        }

        //make a color string
        color = r + g + b;

        return color;
    }
/**
* Converts <code>Stringe</code> value to a String representing a color for 
* display on a jsp page.  The color varies according to predetermined
* display preferences based on the expression value passed in 
*
* @param String expression value to be converted into a color value
* @param String myColorCombo represnting user choice of RG(red/green), RB(red/blue), YB(yellow/blue) - will default to RG
* @return String containing RBG string assembled for jsp display
*/
    public static final String getColor( String expressionValue, String myColorCombo ) {
        if ( expressionValue != null && !expressionValue.equals( " " ) ) {
            String validColorCombo = "RG";
            // check for valid color combo, default to RG, red/green if other than RB or YB
            if ( myColorCombo.equalsIgnoreCase( "RB" ) || myColorCombo.equalsIgnoreCase( "YB" ) ) {
                validColorCombo = myColorCombo;
            } 
             // convert string to a double
            Double value = new Double( expressionValue );
            return getColor( value.doubleValue(), validColorCombo );      
        } else return "cccccc"; // return gray
    }
}
