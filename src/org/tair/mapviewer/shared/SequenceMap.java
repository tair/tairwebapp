/*
 *
 * $Id: SequenceMap.java,v 1.6 2003/09/30 18:39:00 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.shared;

import java.util.*;

/**
 * SequenceMap is a data class to represent and contain data for a single
 * chromosome of the AGI/sequence map.  SequenceMap stores all data in 
 * superclasses.
 */

public class SequenceMap extends PhysicalMap {

    /**
     *  Constructor
     */
    public SequenceMap( MappableEntity ME,
                        String units,
                        double start,
                        double end,
                        Location[] location,
                        String chromosome ){ 
        
        // pass parameters to parent class constructor
        super(ME, units, start, end, location, chromosome);
    }


    /**
     * Retrieves all gene models contained by this instance of sequence map where
     * gene model's tair_object_id is in submitted list of requested ids.  Gene models
     * are returned as IntervalLocation objects, which contain GeneFeature objects as
     * MappableEntity. This method is useful when creating collection of mutant genes 
     * for Sequence map, since returned gene objects can be used to create new 
     * mutant gene objects (see org.tair.mapviewer.imageserver.MapDBServer)
     *
     * @param tairObjectIDs Tair object ids of genes to return as GeneFeature objects; 
     * Collection must contain ids as Integer objects
     * @return Requested gene features on this chromosome as an array of IntervalLocation
     * objects (which contain GeneFeature);
     */
    public IntervalLocation[] getMatchingGenes( Collection tairObjectIDs ) {

        // get locations from superclass; for each one, check to see if
        // MappableEntity contained by Location is a GeneFeature object; 
        // if so, check to see if gene's tair object id is in requested 
        // list of ids
        ArrayList foundGenes = new ArrayList();
        Location[] locations = getLocations();
        MappableEntity mapEntity = null;
        for ( int i = 0; i < locations.length; i++ ) {
            mapEntity = locations[ i ].getMappableEntity();

            // save if location is an IntervalLocation object containing
            // a GeneFeature whose tair object id is in requested list 
            // (blechhh... no choice but to check for object types to 
            // isolate out Locations representing genes)
            if ( locations[ i ] instanceof IntervalLocation &&
                 mapEntity instanceof GeneFeature &&
                 tairObjectIDs.contains( new Long( mapEntity.getID() ) ) ) {

                foundGenes.add( locations[ i ] );
            }
        }

        // translate to typed array for return
        IntervalLocation[] foundGenesArr = new IntervalLocation[ foundGenes.size() ];
        foundGenesArr = (IntervalLocation[]) foundGenes.toArray( foundGenesArr );

        return foundGenesArr;
    }

    /**
     * Add submitted list of locations to locations already stored for 
     * this instance of sequence map. New locations are added, without
     * replacing existing locations (as super class's setLocations would
     * do). This is useful for adding mutant genes to map, which occurs after
     * main population of map features has already occurred.
     *
     * @param newLocations Locations to add to map data
     */
    public void addLocations( Location[] newLocations ) {

        Location[] locations = getLocations(); // locations already stored in superclass
        
        // create new array to hold combo. of all locations
        Location[] newTotalLocations = new Location[ locations.length + newLocations.length ];

        // add existing locations to new combo. array
        int totalIndex = 0;
        int i = 0;
        for ( i = 0; i < locations.length; i++ ) {
            newTotalLocations[ totalIndex++ ] = locations[ i ];
        }

        // add new locations to combo. array
        for ( i = 0; i < newLocations.length; i++ ) {
            newTotalLocations[ totalIndex++ ] = newLocations[ i ];
        }

        // replace locations in superclass
        setLocations( newTotalLocations );
    }

    
}





 
