/*
 * $Id: SequenceMapBand.java,v 1.13 2005/12/06 00:28:26 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */

package org.tair.mapviewer.imageserver;

import java.awt.*;
import java.util.*;
import org.ncgr.util.*;

public class SequenceMapBand extends MapBand implements Colors {

    // zoom levels handled by Sequence map
    private static int [] levels = 
    { 1, 2, 4, 8, 20, 40, 80, 200, 400, 800 };
    

    /**
     * Creates an instance of SequenceMapBand that contains sub bands
     * to display markers, clones, genes and mutant gene locations for
     * AGI/sequence map as well as scale and ruler info.
     *
     * @param markerLocs Markers on sequence map as list of CoordinateLocation objects
     * @param cloneLocs Assembly units on sequence map as list of IntervalLocation objects
     * @param geneLocs Genes on sequence map as list of IntervalLocation objects
     * @param mutantGeneLocs Mutant genes on sequence map as list of Interval Location objects
     * @param chromosome Chromosome this instance of SequenceMapBand represents
     * @param length Length of chromosome (?)
     * @param Logger logging object
     */
    public SequenceMapBand( ArrayList markerLocs,
                            ArrayList cloneLocs, 
                            ArrayList geneLocs,
                            ArrayList mutantGeneLocs, 
                            int chromosome, 
                            double length, 
                            Logger logger ) {

        super( chromosome, length, logger );
        
        addSubBand( new ScaleMapSubBand( "bp", 0, logger ) );
        addSubBand( new RulerMapSubBand( "bp", 0, logger ) );
        addSubBand( new RangeMarkerMapSubBand( markerLocs, 
                                               0, 
                                               true, 
                                               0, 
                                               SEQUENCE_MAP_COLOR,
                                               Color.black, 
                                               true, 
                                               false, 
                                               logger ) );

        addSubBand( new AssemblyUnitMapSubBand( cloneLocs, length, true, logger ) );
        addSubBand( new GeneMapSubBand( geneLocs,  true, logger ) );

        //
        // disable mutant gene sub band until we get assignment/global assignment
        // issues worked out.  Need to push other changes forward, though, to 
        // minimize versioning problems, so just don't display band for now
        //
        // NM 2.6.2004
        //
        // addSubBand( new MutantGeneMapSubBand( mutantGeneLocs, true, logger ) );
    } 
    

    /**
     * Retrieves zoom levels handled by SequenceMap sub band as an array of 
     * primitive int values
     */
    public int [] getLevels() {
        return levels;
    }
    
}
