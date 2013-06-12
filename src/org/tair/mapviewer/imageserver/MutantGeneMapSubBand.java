/*
 * $Id: MutantGeneMapSubBand.java,v 1.2 2005/12/06 00:28:24 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.imageserver;

import org.tair.mapviewer.shared.*;

import java.util.*;
import java.awt.*;

import org.ncgr.util.*;

/** 
 * MutantGeneMapSubBand extends MapSubBand to present type specific info. for the
 * mutant genes sub band on the sequence/agi map.
 *
 * <p>
 * MutantGeneSubBand contains mutant gene features on segment of map to be drawn as
 * a list of MutantGeneStub objects.
 */

public class MutantGeneMapSubBand extends MapSubBand {

    private ArrayList stubbedMutants;
    

    /**
     * Creates an instance of MutantGeneSubBand by translating
     * all submitted mutant gene locations into MutantGeneStub objects,
     * which will take care of drawing functions for each individual
     * mutant gene feature on a given subset of sequence map.
     *
     * @param mutantLocs Mutant gene locations as a list of IntervalLocation
     * objects
     */
    public MutantGeneMapSubBand( ArrayList mutantLocs, 
                                 boolean reporting,
                                 Logger logger ) {

        super( MutantGeneStub.FILL_COLOR, Color.black,  reporting, logger );

        stubbedMutants = new java.util.ArrayList();
        
        for ( int i = 0; i < mutantLocs.size(); ++i ) {
            IntervalLocation il = (IntervalLocation) mutantLocs.get( i ); 
            MutantGeneStub mutant = new MutantGeneStub( il );
            stubbedMutants.add( mutant );
        }
    }
    
    public ArrayList getMapFeatures() {
        return stubbedMutants;
    }  
    
    
    public String getBandLabel() {
        return "VisMutants";
    }
    
    public Color getLabelTextColor() {
        return Color.black;
    }
    
    public Color getLabelBackColor() {
        return MutantGeneStub.FILL_COLOR;
    }
    
} 
