/*
 * $Id: MapBandDBFactory.java,v 1.9 2005/12/06 00:28:23 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */

package org.tair.mapviewer.imageserver;

import org.tair.mapviewer.shared.*;
import java.util.ArrayList;
import org.ncgr.util.*;

/**
 * Creates specific types of MapBand objects for each type of submitted map, so
 * that (for instance), a submitted instance of GeneticMap will result in a
 * GeneticMapBand object that contains all features to be drawn on that
 * map.  Each MapBand object will contain one or more typed MapSubBand objects
 * that contain type specific data and drawing methods for drawing that specific
 * subband of a map (i.e. markers, clones, genes etc.). This class determines
 * what concrete type of Map is submitted, then executes type specific logic
 * for populating and creating sub bands needed for each map.
 */
public class MapBandDBFactory {


    /**
     * Creates a type-specific MapBand object to handle display functions for
     * the submitted map. This version of the constructor should only be
     * used where Map is concretely either an instance of GeneticMap or PhysicalMap.
     */
    public static MapBand createNewBand( Map map, 
                                         int chromosome, 
                                         double length, 
                                         boolean isClassical,
                                         Logger logger ) {

        if ( map instanceof GeneticMap ) {
            GeneticMap gMap = (GeneticMap) map;
            ArrayList markers = new ArrayList();
            extractGeneticMapElements( gMap, markers );
            return new GeneticMapBand( markers, 
                                       chromosome, 
                                       length, 
                                       isClassical,
                                       logger );

        } else if ( map instanceof PhysicalMap ) {
            ArrayList probes = new ArrayList();
            ArrayList contigs = new ArrayList();
            ArrayList clones = new ArrayList();
            extractPhysicalMapElements( (PhysicalMap) map, 
                                        clones, 
                                        contigs, 
                                        probes );
            MapBand mapBand = new PhysicalGroupMapBand( probes, 
                                                        contigs, 
                                                        clones, 
                                                        chromosome, 
                                                        length, 
                                                        logger );
            return mapBand;
        } 
        throw new IllegalArgumentException( "map must be a physical or a " +
                                            "genetic map" );
    } 
    

    /**
     * Creates a type-specific MapBand object to handle display functions for
     * the submitted map. This version of the constructor should only be
     * used where Map is an instance of SequenceMap
     */
    public static MapBand createNewBand( Map map, 
                                         int chromosome,
                                         double length,
                                         Logger logger ) {

        MapBand mapBand = null;

        //
        // NOTE: mutant gene band will not display, even though its
        // data elements are populated here -- until we straighten out
        // some issues w/assignments (new GlobalAssignment table), 
        // new mutant gene band should not show.  However, there are 
        // many other code changes that need to be moved forward to production,
        // so this band has been disabled simply by commenting out the
        // creation of the sub band in SequenceMap.java. 
        //
        // NM 2.6.2004
        
        if ( map instanceof SequenceMap ) {
            ArrayList markerLocs = new ArrayList();
            ArrayList cloneLocs = new ArrayList();
            ArrayList geneLocs = new ArrayList();
            ArrayList mutantGeneLocs = new ArrayList();
            extractSequenceMapElements( (SequenceMap) map, 
                                        markerLocs, 
                                        cloneLocs,
                                        geneLocs,
                                        mutantGeneLocs );
            
            
            mapBand = new SequenceMapBand( markerLocs, 
                                           cloneLocs, 
                                           geneLocs,
                                           mutantGeneLocs,
                                           chromosome, 
                                           length, 
                                           logger );
            
        } else {
            throw new IllegalArgumentException( "map must be a sequence " +
                                                "( agi ) map" );
        }
        return mapBand;
    }
    
    /**
     * Extracts Location elements found on submitted physical map and separates
     * them out into submitted element-specific lists (clone, contigs and probes).
     * These type specific lists are then used by corresponding MapBand objects for
     * Map to draw different elements on map
     *
     * @param pMap Physical map to extract elements from
     * @param clones List to hold clones on pMap; clones are stored within each contig object
     * @param contigs List to hold contigs on pMap
     * @param probes List to hold probes on pMap; probes are stored within each contig object
     */
    public static void extractPhysicalMapElements( PhysicalMap pMap, 
                                                    ArrayList clones,
                                                    ArrayList contigs,
                                                    ArrayList probes ) {
        Location[] ploc = pMap.getLocations();     
       
        if ( ploc == null ) {
            return;
        }

        for ( int j = 0; j < ploc.length; j++ ) {  
            if ( contigs != null )  {
                contigs.add( ploc[ j ] );
            } 
            Location[] cloc =  ( (Contig) ploc[ j ].getMappableEntity() ).getLocations(); 

            if ( cloc != null ) {
                for ( int k = 0; k < cloc.length; k++ ) {
                    if ( cloc[ k ] instanceof CoordinateLocation ) {   //Probes
                        if ( probes != null ) {
                            probes.add( cloc[ k ] );
                        } 
                    } else {                                     // Clones
                        if  ( clones != null ) {
                            clones.add( cloc[ k ] );
                            
                        }
                    } 
                } 
            }
        }
    } 
    

    
    /**
     * Extracts Location elements found on submitted sequence map and separates
     * them out into submitted element-specific lists (markers, clones, genes
     * and mutant genes. These type specific lists are then used by corresponding 
     * MapBand objects for Map to draw different elements on map
     *
     * @param map Sequence map to extract elements from
     * @param markerLocs List to hold genetic markers on sequence map
     * @param cloneLocs List to hold assembly unit clones on sequence map
     * @param geneLocs List to hold genes on sequence map
     * @param mutantGeneLocs List to hold mutant genes on sequence map
     */
    private static void extractSequenceMapElements( SequenceMap map,
                                                    ArrayList markerLocs,
                                                    ArrayList cloneLocs,
                                                    ArrayList geneLocs,
                                                    ArrayList mutantGeneLocs ) {
        Location[] locs = map.getLocations();
        
        for ( int i = 0; i < locs.length; i++ ) {
            MappableEntity me = locs[ i ].getMappableEntity();
            
            if ( me instanceof AssemblyUnit ) {
                cloneLocs.add( locs[ i ] );

            } else if ( me instanceof GeneFeature ) {
                geneLocs.add( locs[ i ] );

            } else if ( me instanceof MutantGene ) {
                mutantGeneLocs.add( locs[ i ] );

            } else { // default to markers
                markerLocs.add( locs[ i ] );
            } 
        }
    }

    
    /**
     * Translates all location elements in submitted Genetic map to list of markers
     * to be displayed on that map
     */
    public static void extractGeneticMapElements( GeneticMap map, ArrayList markers ) {
        Location[] locs = map.getLocations();
        for ( int i = 0; i < locs.length; ++i ) {
            markers.add( locs[ i ] );
        } 
    } 
    
} 
