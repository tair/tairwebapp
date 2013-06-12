/*
 * $Id: GeneStub.java,v 1.1 2003/09/30 18:38:07 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */

package org.tair.mapviewer.imageserver;

import org.tair.mapviewer.shared.*;
import java.awt.*;



/**
 * GeneStub is a concrete sub-class of MapFeature that
 * handles the type-specific drawing tasks of each gene
 * feature on the Gene sub band on the SequenceMap.  Individual 
 * gene features are drawn by overriding the drawFeature 
 * method in superclass
 */


public class GeneStub extends MapFeature {

    public static final Color FILL_COLOR = Color.orange;
    public static final int GAP = 4;

    private static final int ARROW_WIDTH = 10;

    private Direction direction;
    
    /**
     * constructor
     */
    public GeneStub( int id,
                     String name,
                     int start,
                     int end,
                     Direction direction )
    {

        // 200 is the priority and only show at 200x and higher level
        super( name , ( double ) start , ( double ) ( end - start ), 200 , id ); 

        this.direction = direction;
    }
    

    /**
     * constructor
     */
    public GeneStub( IntervalLocation loc ) {
        super( loc );
        GeneFeature gene = ( GeneFeature ) loc.getMappableEntity();       
        setAliasList( gene.getAliases() );
        this.direction = gene.getDirection();
    }
    
    //
    // implementations of abstract methods in MapFeature superclass
    //
    public int getThickness() {
        return 18 + GAP ;       // = 24
    }
    
    public String getDisplayName() {
        return getName();
    }
    
    public Color getLabelColor() {
        return Color.black;
    }
    
    public Color getFeatureColor() {
        return FILL_COLOR;
    }
    
    public FeatureType getFeatureType() {
        return FeatureType.gene;
    }



    //
    // class specific methods
    //

    public Direction getDirection() {
        return direction;
    }


    
    // override the MapFeature's drawFeature() method
    public void drawFeature( Graphics g, 
                             int x, 
                             int y, 
                             int codingRegionW, 
                             int featureH, 
                             int zoomLevel ) 
    {

        int lArrowWidth = 0;
        int rArrowWidth = 0;
        Polygon arrow = null;
        
        Direction direction = getDirection();
        
        if ( direction == Direction.LEFT && codingRegionW >= ARROW_WIDTH  ) {
            lArrowWidth = ARROW_WIDTH;
            int[] xPts = new int[] { x, x + ARROW_WIDTH, x + ARROW_WIDTH };
            int[] yPts = new int[] { y + featureH / 2, y, y + featureH - 1 };
            arrow = new Polygon( xPts, yPts, xPts.length );
            g.setColor( FILL_COLOR );
            g.fillPolygon( arrow );
            
            g.setColor( Color.black );
            g.drawLine( xPts[0], yPts[0], xPts[1], yPts[1] );
            g.drawLine( xPts[0], yPts[0], xPts[2], yPts[2] );

        } else if ( direction == Direction.RIGHT && codingRegionW >= ARROW_WIDTH ) {
            rArrowWidth = ARROW_WIDTH;
            int[] xPts = 
                new int[] { x + codingRegionW,
                                x + ( codingRegionW - ARROW_WIDTH ), 
                                x + ( codingRegionW - ARROW_WIDTH ) };

            int[] yPts = new int[] { y + featureH / 2, y, y + featureH - 1 };

            arrow = new Polygon( xPts, yPts, xPts.length );
            g.setColor( FILL_COLOR );
            g.fillPolygon( arrow );
            g.setColor( Color.black );
            
            g.drawLine( xPts[0], yPts[0], xPts[1], yPts[1] );
            g.drawLine( xPts[0], yPts[0], xPts[2], yPts[2] );
        } 
        
        // fill coding region interior
        g.setColor( FILL_COLOR );
        
        g.fillRect( x + lArrowWidth, 
                    y, 
                    codingRegionW - ( lArrowWidth + rArrowWidth ), 
                    featureH - 1 );
        
        // draw coding region outline
        g.setColor( Color.black );

        if ( arrow != null ) {
            g.drawLine( x + lArrowWidth, 
                        y, 
                        x + ( codingRegionW - rArrowWidth ), 
                        y );

            g.drawLine( x + lArrowWidth, 
                        y + featureH - 1, 
                        x + ( codingRegionW - rArrowWidth ), 
                        y + featureH - 1 );

            if ( direction == Direction.RIGHT ) {
                g.drawLine( x, y, 
                            x, y + featureH - 1 );

            } else {
                g.drawLine( x + codingRegionW, y,
                            x + codingRegionW, y + featureH - 1 );
            }

        } else {
            g.drawRect( x + lArrowWidth, y,
                        codingRegionW - rArrowWidth, featureH - 1 );
            
        }
    }
    
    
} 
