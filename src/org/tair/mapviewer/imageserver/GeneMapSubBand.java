/*
 * $Id: GeneMapSubBand.java,v 1.7 2005/12/06 00:28:22 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.imageserver;

import org.tair.mapviewer.shared.*;

import java.util.*;
import java.awt.*;
import org.ncgr.util.*;

/** 
 * Horizontal extents affected by scale; vertical extents unaffected by scale.
 */
public class GeneMapSubBand extends MapSubBand {
  
    private ArrayList stubbedGenes;
    
    public GeneMapSubBand( ArrayList geneLocs, 
                           boolean reporting,
                           Logger logger )
    {
        super( GeneStub.FILL_COLOR , Color.black ,  reporting , logger );
        
        stubbedGenes = new java.util.ArrayList();
        
        for ( int i = 0 ; i < geneLocs.size() ; ++ i ) {
            IntervalLocation il = (IntervalLocation) geneLocs.get( i ); 
            GeneStub gene = new GeneStub( il );
            stubbedGenes.add( gene );
        }
    }
    

    public ArrayList getMapFeatures() {
        return stubbedGenes;
    }  
    
    
    public String getBandLabel() {
        return "Genes";
    }
    
    public Color getLabelTextColor() {
        return Color.black;
    }
    
    public Color getLabelBackColor() {
        return GeneStub.FILL_COLOR;
    }
    
} 
