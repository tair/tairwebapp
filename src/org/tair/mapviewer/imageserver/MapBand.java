/*
 * $Id: MapBand.java,v 1.15 2005/12/06 00:28:23 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.imageserver;

import java.awt.*;
import java.util.*;

import org.ncgr.util.*;

import org.tair.utilities.InvalidDisplayRangeException;
import org.tair.mapviewer.shared.*;

/**
 * MapBand is an abstract parent class that defines common actions
 * needed to draw a zone image for a particular map type and chromosome
 * (for example, chromosome 3 of Sequence/AGI map will have its own
 * MapBand instance).  Sub-classes of MapBand override and implement
 * features necessary for map-specific drawing tasks.  Each MapBand
 * will contain a specific set of MapSubBand classes that handle
 * the drawing of map features on the map band (clones, genes etc.).
 * Subclasses of MapBand will add the MapSubBand classes needed for
 * displaying the band.
 */

public abstract class MapBand implements FeatureDescriptorCallback {

    protected Logger logger;

    // type specific sub bands for this map
    private ArrayList subBands = new ArrayList();
    

    // chromosome this map instance represents
    private int chromosome;

    // total length of chromosome map (might be bp, kb or cM depending on map type)
    private double length; 
    
    // keeps track of band image height as sub bands are 
    // drawn onto band image
    private int heightSum = 0;


    /**
     * Creates an instance of MapBand for submitted chromosome
     *
     * @param chromosome Chromosome this MapBand represents
     * @param length Length of chromosome map (units depend on map type)
     * @param logger Logs exceptions
     */
    public MapBand( int chromosome , double length , Logger logger ) {
        this.logger = logger;
        this.length = length;
    }

    

    /**
     * Retrieves zoom level settings a particular type of map band can handle
     * as simple int array. Each map type specific sub-class overrides this
     * method to define what zoom levels map offers
     */
    public abstract int [] getLevels();


    /**
     * Adds a sub band to map for displaying map features of a particular
     * type (i.e. clones, genes etc.).  Each concrete sub-class of MapSubBand
     * defines drawing functions that draw the band onto the map band image.
     * This method will automatically sort the map features of each sub-band
     * by calling the sortMapFeatures method.
     *
     * @param msb MapSubBand to add to map band
     */
    public final void addSubBand( MapSubBand msb ) {
        subBands.add( msb );
        msb.sortMapFeatures();
    }
    
    
    /**
     * Retrieves length of map chromosome.
     */
    public double getLength() {
        return length;
    }
    
    /**
     * Retrieves chromosome this MapBand instance represents
     */
    public int getChromosome() {
        return chromosome;
    }
    

    
    /**
     * Draws image for this MapBand by drawing each MapSubBand's data
     * onto submitted graphics object.
     *
     * @param g Graphics object to draw map band data onto
     * @param d Dimensions of map band image
     * @param mapStart Start coordinates of zone of map to draw
     * @param mapEnd End coordinates of zone of map to draw
     * @param ppu 
     * @param zoomLevel Requested zoom level
     * @param callback Object to notify when drawing is complete
     * @param highlighted Search results to highlight when drawing map features
     */
    public Dimension draw( Graphics g ,
                           Dimension d , 
                           double mapStart , 
                           double mapEnd , 
                           double ppu , 
                           int zoomLevel , 
                           FeatureDescriptorCallback callback ,
                           Hashtable highlighted )
        throws MapNotFoundException, InvalidDisplayRangeException 
    {

        heightSum = 0;
        
        int maxWidth = 580; 
        
        for( int a = 0 ; a < subBands.size() ; ++ a ){
            
            MapSubBand msb = (MapSubBand) subBands.get( a ); 
            g.translate( 0 , heightSum );
                
            Dimension extents = d;

            // hardcode dimensions for scale sub band that always
            // appears first
            if ( a == 0 ) {
                extents = new Dimension ( 580 , 300 ); 
            }
            
            Dimension d2 = msb.draw( g , 
                                     extents , 
                                     mapStart , 
                                     mapEnd , 
                                     ppu , 
                                     zoomLevel , 
                                     this , 
                                     callback ,
                                     highlighted );
            g.translate(0, -heightSum); // added by gc
            heightSum += d2.height;
            maxWidth = Math.max( maxWidth , d2.width );
        }
        return new Dimension( maxWidth , heightSum ); 
    }
    
    // newly added to ask sub band to show all rows or just default rows
    public void displayAllRows(boolean displayAllRows){
        for( int a = 0 ; a < subBands.size() ; ++ a ){      
            MapSubBand msb = (MapSubBand) subBands.get( a ); 
            msb.setShowAllRows(displayAllRows);
        }
        
    }

    public void featureDescription( long i, 
                                    FeatureType ft, 
                                    Rectangle r, 
                                    String s,
                                    FeatureDescriptorCallback parent) 
    {
        r.y += heightSum;
        parent.featureDescription( i , ft , r , s, null );
    }
    
    public void arrowExtents( int i , Rectangle r, FeatureDescriptorCallback parent ) {
        r.y += heightSum;
        parent.arrowExtents( i , r, null );
    }
    
    public void labelExtents( String s, Rectangle r, FeatureDescriptorCallback parent ) {
        r.y += heightSum;
        parent.labelExtents( s , r, null );
    }
    

    public Hashtable findByAccession( String accession ) {
        Hashtable ht = new Hashtable();
        for( int a = 0 ; a < subBands.size() ; ++ a ) {
            MapSubBand msb = (MapSubBand) subBands.get( a );
            if ( msb.getVisibility() == true ) {
                msb.searchByAccession( accession , ht );
            }
        }
        return ht;
    }
    

    public Hashtable find( String name ) {
        Hashtable ht = new Hashtable();
        for( int a = 0 ; a < subBands.size() ; ++ a ) {
            MapSubBand msb = (MapSubBand) subBands.get( a );
            if ( msb.getVisibility() == true ) {
                msb.search( name , ht );
            }
        }
        return ht;
    }
} 


