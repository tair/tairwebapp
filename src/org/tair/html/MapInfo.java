/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.html;

import java.util.*;
import java.awt.*;

import org.tair.servlet.*;
import org.tair.mapviewer.shared.*;


/**
 * MapInfo is used to store the HTML IMAGE MAP informations. So
 * that when user's mouse over image map, the server know what to do.
 */
public class MapInfo extends Html {

    private Vector traits;
    private String imageName;

    /**
     * Empties list of image mappings
     */
    public void reset() {
        traits = new Vector();
    }
    
    /**
     * Retrieves image name this instance contains image map info for.
     */
    public String getImageName() {
	return imageName;
    }

    /**
     * Sets image name for image mapping
     */
    public void setImageName( String s ) {
	imageName = s;
    }
    
    /**
     * Retrieves all image mapping elements as
     * an Enumeration of String objects
     */
    public Enumeration elements() {
	return traits.elements();
    }
    
    /**
     * Adds a single image mapping element to list of 
     * mappings
     */
    private void addElement( String element ) {
        traits.addElement( element );
    }
    

    /**
     * Creates HTML for mapping a single region of image to be displayed. 
     * Coordinates to be mapped are defined by submitted rectangle.  Feature
     * type being mapped is specified by featureType. If featureType is 
     * equal to either the LEFT_ARROW, or RIGHT_ARROW constants in BandDrawer,
     * the resulting image mapping will create a link for scrolling the image
     * left or right; all other feature types will result in a link that
     * calls the javascript function showFeatureID that will show the feature's
     * detail page in a new window. showFeatureID and other javascript functions
     * are defined & written to browser in the MapHtml class
     *
     * @param myRect Rectangle defining feature within band image
     * @param text Display name of feature to be shown in browser status bar onMouseOver
     * @param index Index number of Band drawn in image on HTML page
     * @param featureType Type of feature to be mapped (should ultimately either be
     * left arrow, right arrow or map feature type
     * @param imageName Name of image being mapped
     * @param mapType Map type of map zone drawn in image
     * @param type FeatureType object that represents map feature type being mapped.
     * FeatureType contains literal values to use for element types when creating 
     * links to detail pages
     */
    public void addInfo( Rectangle myRect , 
			 String text , 
			 long id , 
			 int index ,
			 int featureType , 
			 String imageName  ,
			 String mapType ,
			 FeatureType type )
    {	
	setImageName( imageName );
	
	StringBuffer info = new StringBuffer();
        info.append( "<area shape=\"rect\" coords=\"" );

	info.append( myRect.x + "," + 
                     myRect.y + "," );

	info.append( (myRect.x+myRect.width) + "," + (myRect.y+myRect.height) + "\" " );
	
	
	if (featureType == BandDrawer.LEFT_ARROW) {
            info.append( "href=\"" + makeServletURL(  "action=left&band=" + index ) + "\" " );

        } else if (featureType == BandDrawer.RIGHT_ARROW)  {
            info.append( "href=\"" + makeServletURL( "action=right&band=" + index ) 
                         + "\" " );

        } else {
            info.append( "href=\"javascript:{}\" onclick=\"showFeatureID('" + 
                         id + "','" + type.typeString() + "')\" " );
        }
	
        
	info.append( "onMouseOver='window.status=\"" + text + 
                     "\"; return true' onMouseOut='window.status=\"\"; return true'>" );

	this.addElement( info.toString() );
    }
}
