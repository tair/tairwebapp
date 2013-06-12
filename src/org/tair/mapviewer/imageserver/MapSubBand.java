/*
 * $Id: MapSubBand.java,v 1.27 2005/12/06 00:28:24 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.imageserver;

import java.awt.*;
import org.tair.mapviewer.shared.*;
import org.tair.utilities.InvalidDisplayRangeException;

import java.util.*;
import org.ncgr.util.*;


/**
 * MapSubBand is a component of MapBand. It could display different kind 
 * of things such as markers, genes, etc. The most import is to implement 
 * public Dimension draw()function. Draw whatever you want.
 *
 */
public abstract class MapSubBand {

    protected final int LBL_MARGIN = 10;
    protected boolean hasLabel = true;
    protected Logger logger; 

    /**
     * default only show three rows in the sub band. 
     * equals -1 if show all the rows.
     */
    protected int rowsToDisplay = 3; 
    protected boolean showAllRows = false;

    private final int ARROW_TAIL_WIDTH = 4;
    private final int LABEL_WIDTH = 20;
    
    private Color mapColor;
    private Color textColor;
    private boolean reporting;
    private boolean visible = true;



    public MapSubBand( Color map, Color text, boolean reporting, Logger logger ) {
        mapColor = map;
        textColor = text;
        this.reporting = reporting;
        this.logger = logger;
    }

    //
    // Abstract methods to be implemented by concrete sub-classes
    // for type-specific display rules
    //
    public abstract String getBandLabel();
    public abstract Color getLabelTextColor();
    public abstract Color getLabelBackColor();
    public abstract ArrayList getMapFeatures();
    

    /**
     * These variables are used by the MapFeatures of the 
     * MapSubBand to track various drawing characteristics,
     * Mostly so they do not draw over themselves 
     */
    
    public void setVisibility( boolean visible ) {
        this.visible = visible;
    }
    

    public void setShowAllRows( boolean showAllRows ) {
        this.showAllRows = showAllRows;
        
    }
   

    public void sortMapFeatures() {
        MapFeatureComparator comparator = new MapFeatureComparator();
        Collections.sort( getMapFeatures(), comparator );
    }

    /**
     * used toe search mapelement by tair accession
     */
    public void searchByAccession( String accession, Hashtable ht ) {

        int tair_object_id = Integer.parseInt( accession.substring( accession.indexOf( ":" ) + 1 ) );

        ArrayList features = getMapFeatures();
        int size = features.size();
        for ( int i = 0; i < size; ++ i ) {
            MapFeature mf = ( MapFeature ) features.get( i );
            if ( tair_object_id == mf.ID() ) {
                ht.put( mf, mf );
            }
        }
    }

    
    public void search( String name, Hashtable ht ) {
        ArrayList features = getMapFeatures();
        int size = features.size();

        for ( int i = 0; i < size; ++ i ) {
            MapFeature mf = ( MapFeature ) features.get( i );
            String name2 = mf.getName();
            // search name first 
            if ( WildCardCompare.isMatch( name.toLowerCase(), name2.toLowerCase() ) ) {
                ht.put( mf, mf );
            }
            // then check the alias list of that MapFeature, 
            // see if there is a match.
            else {
                
                ArrayList list = mf.getAliasList();
                if ( list != null ) {
                    Iterator iter = list.iterator();
                    while ( iter.hasNext() ) {
                        String alias = ( String )iter.next();
                        // alias in flat file and database are upper case. 
                        // could be a problem if it is not the case
                        if ( WildCardCompare.isMatch( name.toUpperCase(), alias ) ) {
                            ht.put( mf, mf );
                            break;
                        }                           
                    }
                }
            }
        }
    }
    

    
    
    

    public void reportFeature( long elementId, 
                               FeatureType ft, 
                               Rectangle rect, 
                               String detailText,
                               FeatureDescriptorCallback callback, // MapBand
                               FeatureDescriptorCallback parentCallback )  // BandDrawer
    {
        rect.x += LABEL_WIDTH;
        
        if ( reporting == true && callback != null ) {
            callback.featureDescription( elementId, ft, rect, detailText, parentCallback );
        }
    }
    
    public Color getMapColor() {
        return mapColor;
    }
    
    public Color getTextColor() {
        return textColor;
    }
    
    public boolean getVisibility() {
        return visible;
    }
    
    public ArrayList extractTilesInRange( ArrayList source, 
                                          double start, 
                                          double end,
                                          double pixelsPerUnit,
                                          double zoomLevel ) {


        
        // list to hold tiles in range
        ArrayList tilesInRange = new ArrayList();

        // binary search to find the region start index from the source
        int low = 0;
        int high = source.size() - 1;

        
        //find start index
        while ( low < high ) {
            int mid = ( low + high ) / 2;
            MapFeature annotation = (MapFeature) source.get( mid );

            double aEnd = annotation.getEnd();

            if ( aEnd < start ) {
                low = mid + 1;
            } else {
                high = mid - 1;
            }

        }
        
        for ( int i = low; i < source.size(); i++  ) {          
            MapFeature mf = (MapFeature) source.get( i );
               

            // features should be sorted by start position - if
            // current feature's start position is greater than
            // display zone's end position, can quit loop since
            // we should have already gotten features to display
            if ( mf.getStart() > end ) { 
                break; 
            }
            
            if ( mf.getEnd() < start ) {
                continue;
            }

            if ( mf.getPriority() > zoomLevel ) {
                continue; 
            }

            // determine which will not be displayed. 
            // such as less than 200 x, gene will not be displayed. 
            //System.out.println( "name "+mf.getName()+ " start " +mf.getStart()+" end "+mf.getEnd() );
            tilesInRange.add( new TileableFeature( mf, pixelsPerUnit ) );
        }

        if ( tilesInRange.size() == 0 ) {
            return tilesInRange;
        }
       
        
        ArrayList tiled = Tiler.simpleTiling( tilesInRange, .001, false );
        
        // Convert the TileableFeature back to MapFeature. 
        for ( int a = 0; a < tiled.size(); ++a ) {
            ArrayList row = ( ArrayList ) tiled.get( a );
            for ( int b = 0; b < row.size(); ++ b ) {
                TileableFeature tf = ( TileableFeature ) row.get( b );
                MapFeature fm = tf.getFeature();
                row.set( b, fm );
            }
        }
        
        return tiled;
    }
    

    /**
     * This function is called by the other draw function. As implemented
     * here, this method will determine which map features in sub band should
     * be displayed (using extractTilesInRange), then will call the draw 
     * methods of each map feature for feature type specific rendering
     * of each feature.
     *
     * <p>
     * This method is overridden in ScaleMapSubBand and RulerMapSubBand for
     * custom drawing of those sub-bands, since they will never have features
     * to draw and have their own logic for creating contents of sub band
     */
    protected Dimension draw( Graphics g,
                           double start,
                           double end,
                           double pixelsPerUnit,
                           int zoomLevel,
                           Hashtable highlightedFeatures,
                           int w, 
                           int drawingStart, 
                           int drawingEnd,
                           FeatureDescriptorCallback callback,
                           FeatureDescriptorCallback parentCallback )
    {
        
        ArrayList features = extractTilesInRange( getMapFeatures(), 
                                                  start, 
                                                  end,
                                                  pixelsPerUnit, 
                                                  zoomLevel );

        int featuresSize = features.size();

        if ( featuresSize == 0 ) {
            return new Dimension( w, 0 );
        }
        
        int requiredHeight = 0;
                
        g.translate( -drawingStart + getLabelWidth(), 0 );
        g.setFont( MapFont.get().getLabelFont() );
        

        // default display 3 rows
        int displayedRowsNumber = rowsToDisplay; // = 3
        // if user wants display all rows or the actual rows is less than 3
        if ( showAllRows || featuresSize < rowsToDisplay ) {
            displayedRowsNumber = featuresSize; 
        }

        for ( int i = 0; i < displayedRowsNumber; i++ ) { 
                ArrayList thisRow = ( ArrayList ) features.get( i );
                
                int rowHeight = 0;
                int rowSize =  thisRow.size();

                
                for ( int j = 0; j < rowSize; ++ j ) {
                    MapFeature mf = ( MapFeature ) thisRow.get( j );
                    rowHeight = Math.max( rowHeight, mf.getThickness() );
                }
                
                requiredHeight += ( rowHeight + 4 );
                
                for ( int j = 0; j < rowSize; j++ ) {
                    MapFeature mf = ( MapFeature ) thisRow.get( j );
                    
                    mf.draw( g, 
                             0.0, 0.0, //usused start and end
                             drawingStart, drawingEnd, 
                             pixelsPerUnit, 
                             zoomLevel, 
                             this,
                             callback,
                             parentCallback, 
                             highlightedFeatures, 
                             requiredHeight - rowHeight - 4 );
                }
        } 
        requiredHeight += 8;
        
        requiredHeight = Math.max( requiredHeight, getMinLabelHeight() );
        
        // draw the ticks ( representing each map feature )
        for ( int i = 0; i < featuresSize; i++ ) { 
            ArrayList thisRow = ( ArrayList ) features.get( i );
            
            int rowSize =  thisRow.size();
            
            g.setColor( Color.red );
            int tickTop = requiredHeight - 8;
            int tickBottom = requiredHeight - 4;
            
            if ( !showAllRows && i >= rowsToDisplay ) {
                g.setColor( Color.black );
                tickTop = requiredHeight - 6;
                tickBottom = requiredHeight - 4;
                
            }
            
            for ( int j = 0; j < rowSize; j++ ) {
                MapFeature mf = ( MapFeature ) thisRow.get( j );
                int tickStart = ( int )( mf.getStart()*pixelsPerUnit );
                g.drawLine( tickStart,  tickTop, tickStart, tickBottom );
            }
        } 
        
        //Testing drawing the bottom horizontal bar
        g.setColor( getMapColor() );
        g.fillRect( ( int )drawingStart, requiredHeight - 4, drawingEnd - drawingStart, 3 );
        
        g.translate( drawingStart - getLabelWidth(), 0 );
        
        Dimension usedExtents = new Dimension( w, requiredHeight );

        return usedExtents;
    }
    
    /**
     * draw function is called by its container, the MapBand. 
     */
    public Dimension draw( Graphics g, 
                           Dimension extents, 
                           double start,//unit
                           double end,//unit 
                           double pixelsPerUnit, 
                           int zoomLevel, 
                           FeatureDescriptorCallback callback, // MapBand
                           FeatureDescriptorCallback parentCallback, // BandDrawer
                           Hashtable highlightedFeatures )
        throws MapNotFoundException, InvalidDisplayRangeException
    {

        if ( start > end ) {
            throw new InvalidDisplayRangeException( "MapSubBand: start( "+start+" is larger than end( "+end+" )" );
        }

        int drawingStart = (int) ( start * pixelsPerUnit );
        int drawingEnd = (int) ( end * pixelsPerUnit );
        int w = (int) ( ( end - start ) * pixelsPerUnit ) + LABEL_WIDTH;


        // calls locally implemented version of draw method unless
        // overridden by sub-class (as in case of ScaleMapSubBand and 
        // RangeMapSubBand which have no features to draw)
        Dimension e2 = draw( g, 
                             start, 
                             end, 
                             pixelsPerUnit, 
                             zoomLevel, 
                             highlightedFeatures, 
                             w, 
                             drawingStart, 
                             drawingEnd,
                             callback,
                             parentCallback );
        

        // draw the vertical label here
        int labelHeight = drawLabel( e2.height, g, callback, parentCallback );
        
        e2.height = Math.max( e2.height, labelHeight );
        
        if ( e2.width > extents.width || e2.height > extents.height ) {
            //logger.logError( "Map drawn larger than image boundaries in band " + this  );
        }
        
        return e2;
    }
    
    
    
    public int getLabelWidth() {
        return LABEL_WIDTH;
    }
    
    
    
    int drawLabel( int bandHeight, 
                   Graphics g, 
                   FeatureDescriptorCallback callback, 
                   FeatureDescriptorCallback parentCallback )
    {
        
        if ( bandHeight == 0 || hasLabel == false ) {
            return 0;
        }
        
         Color bkgrdColor = getLabelBackColor();
        
        // clear background
        g.setColor( Color.white );
        g.fillRect( 0, 0,  LABEL_WIDTH, bandHeight + 1 );
        
        String elidedLabel = getBandLabel(); // modified by gc, 

        int lblWidth = MapFont.get().getVerticalFontTextWidth( elidedLabel );   
        int minimumHeight = lblWidth + LBL_MARGIN;
        
        g.setColor( bkgrdColor );
        int xC = LABEL_WIDTH / 2;
        int x1 = xC - ARROW_TAIL_WIDTH / 2;
        int x2 = xC + ARROW_TAIL_WIDTH / 2;
        int yTextStart = 0;
        int yTextEnd = 0;
        
        int height = Math.max( minimumHeight, bandHeight );
        
        
        yTextStart =  height - Math.max( 0, ( height - lblWidth ) / 2 );
        yTextEnd = Math.max( 0, ( height - lblWidth ) / 2 );
        g.fillRect( x1, 0, ARROW_TAIL_WIDTH, yTextEnd - 1 );
        g.fillRect( x1, yTextStart + 2, ARROW_TAIL_WIDTH, height - ( yTextStart + 2 ) - 1 );
        
        int x = LABEL_WIDTH - ( LABEL_WIDTH - MapFont.get().getVerticalFontAscent() ) / 2 - 1;

        Font labelFont = MapFont.get().getVerticalFont();

        g.setFont( labelFont );

        g.setColor( Color.black );
        
        g.drawString( elidedLabel, x - 1, yTextStart + 1 );             
        
        g.setColor( bkgrdColor );
        g.drawLine( x1 - 2, 0, x2 + 2, 0 );
        g.drawLine( x1 - 2, height - 1, x2 + 2, height - 1 ); 
        
        if ( callback != null ) {
            callback.labelExtents( elidedLabel,
                                   new Rectangle( 0, 0, LABEL_WIDTH, height ),
                                   parentCallback );
        }
        return minimumHeight;
    }
  
    int getMinLabelHeight() {
        String elidedLabel = getBandLabel(); // modified by gc,
        int lblWidth = MapFont.get().getVerticalFontTextWidth( elidedLabel );
        
        return lblWidth + LBL_MARGIN;
    }
  
} 
