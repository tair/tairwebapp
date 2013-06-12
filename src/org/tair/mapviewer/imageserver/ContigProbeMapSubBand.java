/*
 * $Id: ContigProbeMapSubBand.java,v 1.14 2005/12/06 00:28:22 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.imageserver;

import org.tair.mapviewer.shared.*;
import java.util.*;
import java.awt.*;
import org.ncgr.util.*;

/**
 * Horizontal and vertical extents affected by scale. A ContigProbeMapSubBand
 * draws Contigs on upper rows over Probes.
 */
public class ContigProbeMapSubBand extends MapSubBand {
    private static final String MAP_LABEL = "Probes/Contigs";

    /**
     * this min height necessary to accomodate the map label w/o truncating it
     */
    private static final int MIN_MAP_HEIGHT = 
        MapFont.get().getVerticalFontTextWidth( MAP_LABEL ) + 20;
    
 
    /**
     * We want the probeMapBand to line up vertically with
     * the top of the contig rectangle ( without have probeMapBand to
     * worry about our contig label ), so we'll give the probeMapBand
     * a yOffset that has already been adjusted for the contig label
     * we also need to add one more pixel to the yOffset so that probes
     * do not overlap top border of contig rectangle; the 2nd "+1" is
     * to accommodate the single pixel spacing between the contig label
     * and the contig rectangle
     */
    private static final int PROBE_BAND_Y_OFFSET = 
        MapFont.get().getLabelFontHeight() + 1 + 1;

    public final int height;
        
    private ArrayList contigs; // as ContigStub

    private ArrayList probes; // as RangeProbeStub
   
    private ArrayList mapFeatures; // as both ContigStub and RangeProbeStub
    
    public ArrayList getMapFeatures() {
        return mapFeatures;
    }
    
    public ContigProbeMapSubBand( ArrayList contig, 
                                  ArrayList probes, // CoordinateLocation
                                  Color mapColor , 
                                  boolean reporting,
                                  Logger logger )
    {
        super( mapColor , Color.black , reporting , logger );

        this.probes = new ArrayList();

        contigs = new ArrayList();
        mapFeatures = new ArrayList();
       
        for ( int i = 0; i < contig.size(); i++ ) {
                ContigStub cs = new ContigStub( (IntervalLocation) contig.get( i ) );
                contigs.add( cs );
                mapFeatures.add( cs );
            } 
        
        for ( int i = 0 ; i < probes.size() ; ++ i ) {
            CoordinateLocation cl = (CoordinateLocation) probes.get( i );
                RangeProbeStub ps = new RangeProbeStub( cl );
                mapFeatures.add( ps );

                this.probes.add( ps );
            }
        
        height = Math.max( MIN_MAP_HEIGHT, 
                           10 + PROBE_BAND_Y_OFFSET );
    } // constructor


    public void sortMapFeatures(){
        MapFeatureComparator comparator = new MapFeatureComparator();
        Collections.sort( probes, comparator );
        Collections.sort( contigs, comparator );
    }

    public Dimension draw( Graphics g,
                           double start,
                           double end,
                           double pixelsPerUnit,
                           int zoomLevel,
                           Hashtable highlightedFeatures,
                           int w, 
                           int xStart, 
                           int xEnd,
                           FeatureDescriptorCallback callback ,
                           FeatureDescriptorCallback parentCallback )
    { 

        ArrayList features1 = extractTilesInRange( contigs, 
                                                   start, end,
                                                   pixelsPerUnit, zoomLevel );

        ArrayList features2 = extractTilesInRange( probes, 
                                                  start, end,
                                                  pixelsPerUnit, zoomLevel );     

        int featuresSize1 = features1.size() ;
        int featuresSize2 = features2.size() ;

        if ( featuresSize1 == 0 && featuresSize2 == 0 ) {
                return new Dimension( w , 0 );
        }
        
        int requiredHeight = 0;
                
        g.translate( -xStart + getLabelWidth(), 0 );
        g.setFont( MapFont.get().getLabelFont() );
        

        // default display 3 rows
        int displayedRowsNumber1 = rowsToDisplay; // = 3
        int displayedRowsNumber2 = rowsToDisplay; // = 3

        // if user wants display all rows or the actual rows is less than 3
        if ( showAllRows || featuresSize1 < rowsToDisplay ) {
            displayedRowsNumber1 = featuresSize1;       
        }

        if ( showAllRows || featuresSize2 < rowsToDisplay ) {
            displayedRowsNumber2 = featuresSize2;
        }

        for ( int i = 0; i < displayedRowsNumber1; i++ ) { 
                ArrayList thisRow = ( ArrayList ) features1.get( i );
                
                int rowSize =  thisRow.size() ;
                int rowHeight = 0;
                
                for ( int j = 0 ; j < rowSize ; ++ j ) {
                        MapFeature mf = (MapFeature) thisRow.get( j );
                        rowHeight = Math.max( rowHeight , mf.getThickness() );
                    }
                
                requiredHeight += ( rowHeight + 4 );
                
                for ( int j = 0; j < rowSize ; j++ ) {
                        MapFeature mf = (MapFeature) thisRow.get( j );
                        
                        mf.draw( g, 
                                 0.0, 0.0, //usused start and end
                                 xStart, xEnd, 
                                 pixelsPerUnit, 
                                 zoomLevel, 
                                 this, 
                                 callback,
                                 parentCallback, 
                                 highlightedFeatures, 
                                 requiredHeight - rowHeight - 4 
                                 );
                    }
            }



        for ( int i = 0; i < displayedRowsNumber2; i++ ) { 
                ArrayList thisRow = (ArrayList) features2.get( i );
                
                int rowSize = thisRow.size();
                int rowHeight = 0;
                for( int j = 0; j < rowSize; ++j ) {
                        MapFeature mf = (MapFeature) thisRow.get( j );
                        rowHeight = Math.max( rowHeight, mf.getThickness() );
                    }
                
                requiredHeight += ( rowHeight + 4 );
                
                for ( int j = 0; j < rowSize; j++ ) {
                        MapFeature mf = (MapFeature) thisRow.get( j );
                        
                        mf.draw( g, 
                                 0.0, 0.0, //usused start and end
                                 xStart, xEnd, 
                                 pixelsPerUnit, 
                                 zoomLevel, 
                                 this,
                                 callback,
                                 parentCallback, 
                                 highlightedFeatures, 
                                 requiredHeight - rowHeight - 4 
                                 );
                    }
            }

 
        requiredHeight += 8;
        requiredHeight = Math.max( requiredHeight, getMinLabelHeight() );
        
        // draw the ticks ( representing each map feature )
        for ( int i = 0; i < featuresSize1; i++ ) 
            { 
                ArrayList thisRow = (ArrayList) features1.get( i );
                
                int rowSize =  thisRow.size() ;
                
                g.setColor( Color.red );
                int tickTop = requiredHeight - 8;
                int tickBottom = requiredHeight - 4;

                if ( !showAllRows && i >= rowsToDisplay ) {
                    g.setColor( Color.black );
                    tickTop = requiredHeight - 6;
                    tickBottom = requiredHeight - 4;

                }

                for ( int j = 0; j < rowSize; j++ ) {
                        MapFeature mf = (MapFeature) thisRow.get( j );
                        int tickStart = (int) (mf.getStart() * pixelsPerUnit);
                        g.drawLine( tickStart, tickTop, tickStart, tickBottom );
                }
            } 

        for ( int i = 0; i < featuresSize2; i++ ) { 
                ArrayList thisRow = (ArrayList) features2.get( i );
                
                int rowSize =  thisRow.size() ;
                
                g.setColor( Color.red );
                int tickTop = requiredHeight - 8;
                int tickBottom = requiredHeight - 4;

                if ( !showAllRows && i >= rowsToDisplay ) {
                    g.setColor( Color.black );
                    tickTop = requiredHeight - 6;
                    tickBottom = requiredHeight - 4;
                }

                for ( int j = 0; j < rowSize ; j++ ) {
                        MapFeature mf = (MapFeature) thisRow.get( j );
                        int tickStart = (int) (mf.getStart() * pixelsPerUnit);
                        g.drawLine( tickStart, tickTop, tickStart, tickBottom );
                    }
            } 
        
        //Testing drawing the bottom horizontal bar
        g.setColor( getMapColor() );
        g.fillRect( (int) xStart, requiredHeight - 4, xEnd - xStart, 3 );
        g.translate( xStart - getLabelWidth(), 0 );
        
        Dimension usedExtents = new Dimension( w, requiredHeight );

        return usedExtents;
        
    } // draw()
    
    public String getBandLabel() {
        return MAP_LABEL;
    }
    
    public Color getLabelTextColor() {
        return Color.white;
    }
    
    public Color getLabelBackColor() {
        return getMapColor();
    }
    
} // class ContigProbeMapSubBand
