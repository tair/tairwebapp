/*
 * $Id: BandMaster.java,v 1.23 2006/06/30 22:16:20 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/
package org.tair.servlet;

import org.tair.mapviewer.imageserver.*;
import org.tair.utilities.WebApp;
import org.tair.utilities.GifFactory;

import java.awt.*;
import java.awt.image.*;
import java.io.*;
import java.util.*;

import org.tair.html.MapInfo;

import org.ncgr.util.*;

/**
 * This class encapsulates zooming data, logic, and a few other items which are
 * closely tied to zooming. One BandMaster for each MapBand.
 */
public class BandMaster extends PositionMinder implements Cloneable, Colors {

    public boolean isPhysical() {
        return ( descriptorWrapper.getCategory() == 
                    DescriptorWrapper.PhysicalCategory );
    }

    public boolean isAGI() {
        return descriptorWrapper.isAGI();
    }

    /**
     * the state of the bands, shown, deleted, or notpicked
     */
    private boolean visible = false;

    /**
     * name of this band.
     */
    private String imageName;

    /**
     * the background color of the band
     */
    private Color backgroundColor = Color.white;

    /**
     * the marker which is currently highlighted
     */
    private Hashtable highlighted = new Hashtable();

    private boolean displayAllRows;

    private boolean isMChromoView = false;

    /**
     * The wrapped descriptor, used for viewing
     */
    private DescriptorWrapper descriptorWrapper;

    /**
     * <MAP> ....</MAP> element in close up page
     */
    private MapInfo mapInfo;

    /**
     * constructor
     */
    public BandMaster( DescriptorWrapper dw ) throws Exception {
        super( dw.getLength(), dw.getLevels(), 3 );
        this.descriptorWrapper = dw;
        mapInfo = new MapInfo();
    }

    /**
     * 
     */
    public MapInfo getMapInfo() {
        return mapInfo;
    }

    /**
     * the Map.reset() function is like the constructor
     */
    public void resetMapInfo() {
        getMapInfo().reset();

    }

    void setCV( boolean ismc ) {
        this.isMChromoView = ismc;
    }

    int getChromosome() {
        return descriptorWrapper.getChromosome();
    }

    /**
     * tell the outside world of the names of the bands
     */
    public String[] getLevelNames() {
        return descriptorWrapper.getLevelNames();
    }

    /**
     * Bascially, return the number of zoom levels
     */
    int getNumberOfLevels() {
        return descriptorWrapper.getLevelNames().length;
    }

    /**
     * get the wrapped descriptor this master contains
     */
    public DescriptorWrapper getDescriptorWrapper() {
        return descriptorWrapper;
    }

    /**
     * Set the visibility state of this band
     */
    void setVisible( boolean vis ) {
        visible = vis;
    }

    /**
     * get the visibility state of this band
     */
    public boolean isVisible() {
        return visible;
    }

    public void displayAllRows( boolean displayAllRows ) {
        this.displayAllRows = displayAllRows;
        descriptorWrapper.displayAllRows( displayAllRows );

    }

    public boolean getDisplayAllRows() {

        return displayAllRows;
    }

    /**
     * Get the display name, the name the user needs to see
     */
    public String getDisplayName() {
        String n;
        if ( isMChromoView == false ) {
            n = descriptorWrapper.getTypeName();
        } else {
            n = "Chromosome " + ( 1 + descriptorWrapper.getChromosome() );
        }
        return n;
    }

    /**
     * compute the filtering level of this band
     */
    public int getFilterLevel() {
        int[] levels = getLevels();
        int i = getZoomLevel().intValue();
        if ( i >= levels.length ) {
            i = levels.length - 1;
        }
        return levels[i];
    }

    /**
     * return the integer default zoom levels
     */
    int[] getLevels() {
        return descriptorWrapper.getLevels();
    }

    /**
     * get the filtering level for a zoom level
     */
    public int getFilterLevelFor( int i ) {
        int[] levels = getLevels();
        return levels[i];
    }

    /**
     * set name of the band's current image
     */
    void setImageName( String name ) {
        imageName = name;
    }

    /**
     * get the name of the band's current image
     */
    public String getImageName() {
        return imageName;
    }

    /**
     * set the current soom level
     */
    void setZoomIndex( int zIndex ) {
        setZoomLevel( new Integer( zIndex ) );
    }

    /**
     * get the zoom level as an int, rounding it if it's a float
     */
    int getIntZoomLevel() {
        if ( getZoomLevel() instanceof Integer ) {
            return getZoomLevel().intValue();
        }
        return -1;
    }

    /**
     * Zone stuff
     */
    private static int zoneWidth = 150;
    private static int zoneHeight = 16;
    private static Dimension zoneSize = new Dimension( zoneWidth, zoneHeight );

    /**
     * get the area of the zone image gif
     */
    public static Dimension getZoneSize() {
        return zoneSize;
    }

    /**
     * return the image which is the appropriate template for this zone band
     */
    Color getTypeColor() {
        int type = descriptorWrapper.getCategory();
        switch ( type ) {
        case DescriptorWrapper.GeneticCategory:
            return GENETIC_MAP_COLOR;
        case DescriptorWrapper.SequenceCategory:
            return SEQUENCE_MAP_COLOR;
        case DescriptorWrapper.PhysicalCategory:
            return PHYSICAL_MAP_COLOR;
        }
        return null;
    }

    /**
     * get the filename for a zone image gif, generating it if need be.
     */

    private BufferedImage getZoneImage() {
        Color mapColor = getTypeColor();

        BufferedImage image = ImagePooler.getImage( zoneSize );
        Graphics g = image.getGraphics();

        try {

            double lp = zoneWidth * ( getLeft() / getMapLength() );
            double rp = zoneWidth * ( getRight() / getMapLength() );
            g.setColor( Color.white );
            g.fillRect( 0, 0, zoneWidth, zoneHeight );

            g.setColor( mapColor );
            g.fillRect( 0, 5, zoneSize.width, zoneSize.height - 10 );
            g.fillRect( 0, 6, zoneSize.width + 1, zoneSize.height - 12 );

            g.setColor( ZoneBoxColor );

            int leftedge = (int) lp;
            int rightedge = Math.max( (int) ( rp - lp ), 1 );

            g.drawRect( leftedge, 0, rightedge, zoneHeight - 1 );
            g.drawRect( leftedge + 1, 1, rightedge - 2, zoneHeight - 3 );

            return image;
        } catch ( Exception e ) {

        } finally {
            // very important! need to release the resources after drawing
            if ( g != null )
                g.dispose();
        }

        return null;
    }

    public String getZoneImageName() {
        String name = WebApp.getAbsDynImageDir()
                      + "zone"
                      + this
                      + ","
                      + descriptorWrapper.getCategory()
                      + ".gif";

        synchronized ( zoneSize ) {

            File f = new File( WebApp.getWebRoot() + name );
            if ( f.exists() == false ) {

                BufferedImage image = getZoneImage();
                BufferedImage crop = ImagePooler.cropImage( image,
                                                            0,
                                                            0,
                                                            zoneWidth,
                                                            zoneHeight );
                GifFactory.createGIF( crop, name, zoneWidth, zoneHeight );

                ImagePooler.recycle( crop );

                ImagePooler.recycle( image );
            }
        }

        return name;
    }

    /**
     * get the type of the thing we are mastering
     */
    public int getTypeNumber() {
        return descriptorWrapper.getTypeNumber();
    }

    /**
     * get the bame of the highlighted map entity
     */
    public Hashtable getHighlighted() {
        return highlighted;
    }

    /**
     * search for a map entity in this band
     */
    public boolean searchByAccession( String accession ) {
        highlighted = new Hashtable();

        Hashtable ht = descriptorWrapper.searchByAccession( accession );
        if ( ht.size() == 0 ) {
            return false;
        }

        // if lot of matches found, might find the range to diplay.
        // TODO list

        snapToIntZoomLevel();
        Enumeration e = ht.elements();
        MapFeature mf = (MapFeature) e.nextElement();
        double location = mf.getStart();
        int zl = mf.getPriority();
        setLocationAndMinLevel( location, zl );
        highlighted = ht;

        return true;
    }

    /**
     * search for a map entity in this band
     */
    public boolean search( String searchingFor ) {
        highlighted = new Hashtable();
        Hashtable ht = descriptorWrapper.search( searchingFor );
        if ( ht.size() == 0 ) {
            return false;
        }

        // if lot of matches found, might find the range to diplay.
        // TODO list

        snapToIntZoomLevel();
        Enumeration e = ht.elements();
        MapFeature mf = (MapFeature) e.nextElement();
        double location = mf.getStart();
        int zl = mf.getPriority();
        setLocationAndMinLevel( location, zl );
        highlighted = ht;

        return true;
    }

    /**
     * Get the name of the zoom level
     */
    public String getNameOfZoomLevel() {
        String[] levelNames = descriptorWrapper.getLevelNames();
        if ( getZoomLevel() instanceof Integer ) {
            return levelNames[getZoomLevel().intValue()];
        } else {
            return "Custom";
        }
    }

    /**
     * set this band's background color
     */
    void setBackgroundColor( Color c ) {
        backgroundColor = c;
    }

    /**
     * Get the background color
     */
    Color getBackgroundColor() {
        return backgroundColor;
    }

    /**
     * Generate a string which is representative of the band. This is used to
     * name the GIF, which is cached and saved.
     */
    public String toString() {

        String s = "_"
                   + Misc.trimmedDouble( getLeft(), 5 )
                   + "_"
                   + Misc.trimmedDouble( getRight(), 5 )
                   + "_";

        Enumeration e = highlighted.elements();

        int i = 0;
        while ( e.hasMoreElements() ) {

            // only output two highted feature names,
            // otherwise, it could be extremely long
            if ( i > 2 )
                break;
            s += trimSlash( ( (MapFeature) e.nextElement() ).getName() );
            i++;
        }

        return s;
    }

    /**
     * for some map element name like JV75/76 and JV26/27 need to remove the
     * "/76" part
     */
    private String trimSlash( String input ) {
        int index = input.indexOf( "/" );
        if ( index > 0 ) {
            return input.substring( 0, index );
        } else
            return input;
    }

    /**
     * This clone method is used so that the server state need not be updated,
     * making the back button work. So, this object is cloned instead of
     * modified.
     */
    public Object clone() {
        try {
            return super.clone();
        } catch ( Exception e ) {
            return null;
        }
    }
}
