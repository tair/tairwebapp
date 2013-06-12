/*
 * $Id: MutantGeneStub.java,v 1.2 2003/09/30 18:38:08 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */

package org.tair.mapviewer.imageserver;

import java.awt.*;
import java.util.*;

import org.tair.mapviewer.shared.*;


/**
 * MutantGeneStub is a concrete sub-class of MapFeature that
 * handles the type-specific drawing tasks of each mutant gene
 * feature on the Mutant Gene sub band on the SequenceMap.  
 * Individual mutant gene features are drawn by overriding the 
 * drawFeature method in superclass
 */


public class MutantGeneStub extends MapFeature {
    
    public static final Color FILL_COLOR = Color.blue;
    public static final int GAP = 4;

    private static final int ARROW_WIDTH = 10;
    
    private Direction direction;

    // locus id of gene --- different from id field in superclass
    // which is tair object id of gene; locus id is needed for
    // creating links to locus detail page, whereas gene id is
    // needed for finding elements by TAIR accession which uses
    // tair object id
    private long locusTairObjectID; 
    
    
    /**
     * constructor
     */
    public MutantGeneStub( IntervalLocation loc ) {
        super( loc );
        MutantGene gene = (MutantGene) loc.getMappableEntity();       
        direction = gene.getDirection();

        // mutant genes have a list of names -- set them
        // all as aliases since single string name will
        // appear as a / delimited combo. of all names
        ArrayList stubAliases = new ArrayList( gene.getNames() );
        stubAliases.addAll( gene.getAliases() ); // add aliases as well
        setAliasList( stubAliases );
        
        this.locusTairObjectID = gene.getLocusTairObjectID();

    }
    
    //
    // implementations of abstract methods in superclass
    //

    public int getThickness() {
        return 18 + GAP; // = 24
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
        return FeatureType.locus;
    }



    //
    // class specific methods
    //

    
    // override the MapFeature's drawFeature() method
    public void drawFeature( Graphics g, int x, int y, int codingRegionW, int featureH, int zoomLevel ) {
        int lArrowWidth = 0;
        int rArrowWidth = 0;
        Polygon arrow = null;
        
        Direction direction = getDirection();
        
        if ( direction == Direction.LEFT && codingRegionW >= ARROW_WIDTH ) {
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
            int[] xPts =  new int[] { 
                    x + codingRegionW,
                    x + ( codingRegionW - ARROW_WIDTH ), 
                    x + ( codingRegionW - ARROW_WIDTH ) 
                        };

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
            } else  {
                g.drawLine( x + codingRegionW, y,
                            x + codingRegionW, y + featureH - 1 );
            }

        } else {
            g.drawRect( x + lArrowWidth, 
                        y,
                        codingRegionW - rArrowWidth, 
                        featureH - 1 );
            
        }
    }
    
    
    public Direction getDirection() {
        return direction;
    } 

    /**
     * Retrieves tair object id of gene's locus
     *
     * @return Tair object id of gene's locus
     */
    public long getLocusTairObjectID() {
        return locusTairObjectID;
    }



    /**
     * Overrides superclass's version of this method to return
     * tair object id of gene's locus for creating links to locus
     * detail page in band image.. This id is different than the 
     * gene's tair object id, which is the value returned by the ID()
     * method
     *
     * @return ID to use for creating links to detail page for this feature
     */
    public long getLinkID() {
        return getLocusTairObjectID();
    }
                            



  
} 


