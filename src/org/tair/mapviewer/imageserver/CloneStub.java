/*
 * $Id: CloneStub.java,v 1.12 2005/12/06 00:28:22 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
 */
package org.tair.mapviewer.imageserver;

import org.tair.mapviewer.shared.*;
import java.awt.*;

/**
 *
 */
public class CloneStub extends MapFeature implements Colors {

    private final int GAP = 4;
    private final int TEXT_HEIGHT = 10;
    
    private int status;
    private long type;
    private Direction direction;
    
    public CloneStub( IntervalLocation loc ) {

        super( loc );
        
        
        Clone clone = (Clone) loc.getMappableEntity();

        status = clone.getStatus();
        type = ( loc.getMappableEntity() ).getType();
        direction = clone.getDirection();       
        
    }

    
    //
    // Implementations of abstract methods in superclass
    //

    public Color getFeatureColor() {
        return getCloneStatusColor();
    }
    
    public FeatureType getFeatureType() {
        return FeatureType.clone;
    }
    
    public Color getLabelColor() {
        return Color.black;
    }

    public String getDisplayName()  {
        return getName();
    }

    public int getThickness() {
        return getInternalThickness() + GAP; // 23
    }


    // 
    // class specific methods
    //

    private int getInternalThickness() {
        return 9 + TEXT_HEIGHT;// = 19
    }

    public Direction getDirection() {
        return direction;
    } 

    private Color getCloneStatusColor() {
        switch ( status ) {
        case 0: // non-AGI clone
            // If status=0, then  it must be a non-AGI clone, so use the type to
            // determine color 
            if ( type == MappableEntityType.TYPE_BAC ) {
                return BAC_COLOR; 

            } else if ( type == MappableEntityType.TYPE_P1 ) {
                return P1_COLOR;

            } else if ( type == MappableEntityType.TYPE_TAC ) {
                return TAC_COLOR;

            } else if ( type == MappableEntityType.TYPE_YAC ) {
                return YAC_COLOR;

            } else {
                // using light gray because old TAIR maps seemed to use
                // light gray ( "intention to sequence" ) for clones whose 
                // status=0 and type is "unknown";
                return UNKNOWN_COLOR;
            }
            
        case Clone.INTENT_TO_SEQUENCE:
            return INTENT_TO_SEQUENCE_COLOR;
            
        case Clone.IN_PREPARATION:
        case Clone.SEQUENCING_BEGUN:
            return Color.red;
            
        case Clone.PRELIMINARY_SEQUENCE:
        case Clone.COMPLETE_SEQUENCE:
            return Color.orange;
            
        case Clone.ANNOTATED_GB:
            return Color.green.darker();
            
        default: // for PM ( non-AGI ) maps, since status value is not available for clones
            return Color.gray;
        }
    } 
    
    
    
    public void drawFeature( Graphics g , 
                             int x, int y, 
                             int cloneW, 
                             int cloneH, 
                             int zoomLevel )
                             
    {
        
        // "-1" because we want clone height to be getThickness() pixels
        // tall, but drawRect always adds an extra pixel
                
        int right = x + cloneW;
        int height = cloneH;//getInternalThickness() - ( 1+TEXT_HEIGHT );
        int h2 = height / 2;
        int bottom = y + height;
        
        int [] xPts;
        int [] yPts;
        int nPoints;
        
        if ( direction == Direction.LEFT && cloneW > h2 ) {
            xPts = new int[] { x , x + h2 , right , right , x + h2 };
            yPts = new int[] { y + h2 , y , y , bottom , bottom };
            nPoints = 5;

        } else if ( direction == Direction.RIGHT && cloneW > h2 ) {
            xPts = new int[] { x , right - h2 , right , right - h2 , x };
            yPts = new int[] { y , y , y + h2 , bottom , bottom };
            nPoints = 5;

        } else {
            xPts = new int[] { x , right, right , x };
            yPts = new int[] { y , y , bottom , bottom };
            nPoints = 4;
        }
        
        Polygon p = new Polygon( xPts , yPts , nPoints );
        
        g.setColor( getCloneStatusColor() );
        g.fillPolygon( p );
        g.setColor( Color.black );
        g.drawPolygon( p );
        
    }


}
