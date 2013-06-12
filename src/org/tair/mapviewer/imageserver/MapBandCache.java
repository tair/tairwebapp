/*
 * $Id: MapBandCache.java,v 1.7 2005/12/06 00:28:23 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */

package org.tair.mapviewer.imageserver;

import org.tair.mapviewer.shared.*;
import java.util.HashMap;

import org.ncgr.util.*;


/**
 *
 */
public class MapBandCache {

    /**
     * key=MapDescriptor: value=MapBand
     */
    private HashMap mapBands;

    /**
     *
     */
    private static MapBandCache instance;

    /**
     *
     */
    static Logger logger = new ScreenLogger();


    /**
     * Singleton pattern was used to grantee only one 
     */
    public static synchronized MapBandCache getInstance() {
        if ( instance == null ) {

            try {
                instance = new MapBandCache();
            } catch ( Exception e ) {
                logger.logException( "Error making MapBandCache : ",  e );
            } 
        }
        return instance;
    }
    
    
    /**
     * Constructor
     */
    protected MapBandCache() {
        mapBands = new HashMap();
        loadData( mapBands );
    }
    
    
    /**
     *
     */
    private void loadData( HashMap mapBands ) {
       
        try {
            MapCache mapCache = MapCache.getInstance();
            MapDescriptor[] mds = mapCache.getAllMapDescriptors();

            for ( int i = 0; i < mds.length; ++i ) {
                
                // enclose try/catch within for loop, so that we cache as many maps
                // as possible; some is better than none, so we don't want to 
                // abort just because some maps could not be loaded
                cacheMapBand( mds[i], 
                              mds[i].getIntChromosome(), 
                              mds[i].getRealLength() );
            }
        } catch ( Exception e ) {
            // FIXME: Should do more to inform admin that something is 
            // wrong
            e.printStackTrace();
        } 
    } 
    
    /**
     *
     */
    private void cacheMapBand( MapDescriptor md , 
                               int chromosome , 
                               double length )
        throws MapNotFoundException {

        // important to determine te genetic map type
        boolean isClassical = (md.name).equals( "Classical" );
        MapCache mapCache = MapCache.getInstance();
        Map map = mapCache.getMap( md );
        
        if ( map instanceof SequenceMap ) {
            MapBand mapBand = MapBandDBFactory.createNewBand( map, 
                                                              chromosome,
                                                              length,
                                                              logger);
            if ( mapBand != null ) {
                mapBands.put( md, mapBand );
            }

        } else if ( map instanceof PhysicalMap ){

            // Note: createNewBand() will return a map band that represents
            // a single group of the physical map
            MapBand mapBand =  MapBandDBFactory.createNewBand( map ,
                                                               chromosome , 
                                                               md.getRealLength() , 
                                                               isClassical ,
                                                               logger );
            if ( mapBand != null ) {
                mapBands.put( md, mapBand );
            }

        } else if ( map instanceof GeneticMap )  {
            MapBand mapBand = MapBandDBFactory.createNewBand( map , 
                                                              chromosome , 
                                                              md.getRealLength() ,
                                                              isClassical , 
                                                              logger );
            if ( mapBand != null ) {
                mapBands.put( md, mapBand );
            }
        } 
    }
    
    
    /**
     *
     */
    public void reloadData() {
        
        // this assignment does not need to be synchronized; the Java
        // memory model ensures that the assignment of references is atomic;
        // it is acceptable that the updated value of 'maps' may not be visible
        // to other threads immediately (since it's ok to use old data for a 
        // little while longer); we do not want to synchronize accesses to the 
        // 'maps' reference for performance reasons.
        MapCache.getInstance().reloadData();
        
        HashMap tmpMapBands = new HashMap();
        loadData( tmpMapBands );
        mapBands = tmpMapBands;
    } 
    
    
    
    


        
    /**
     * Return a MapBand according to a MapDecriptor
     */
    public MapBand getMapBand( MapDescriptor descriptor )
        throws MapNotFoundException {
        
        MapBand mapBand = (MapBand) mapBands.get( descriptor );
        if ( mapBand == null ) {
            throw new MapNotFoundException();
        } 
        return mapBand;
    } 
    
} 
