/*
 *
 * $Id: Map.java,v 1.4 2003/09/10 17:20:20 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.shared;

public class Map extends MappableEntity {

    private String units;
    private double start;
    private double end;
    private Location[] location;
    private String chromosome;
    private String species;

    /**
     * something like, Lister & Dean RI, AGI Map,
     * Classical etc
     */
    private String mapType;
    private int groupNumber;

    private final static Object [][] mapTypes = 
    { 
        { "UNDEFINED" , MapType.UNDEFINED } , 
        { "GENETIC" , MapType.GENETIC } , 
        { "PHYSICAL" , MapType.PHYSICAL } ,
        { "AGI"  , MapType.AGI }
    };


    /**
     * @return    the int TYPE for a Map
     */
    public static MapType getMapType( String type ) {
        for ( int i = 0; i < mapTypes.length; i++ ) {
            Object [] oa = mapTypes[ i ];
            String name = (String) oa[ 0 ];
            if ( name.equalsIgnoreCase( type ) ) {
                return ( MapType ) oa[ 1 ];
            }
        }
        return MapType.UNDEFINED;
    }
  

    public Map() {
        super();
    }

    public Map( Map map ) {
        this( (MappableEntity) map, 
              map.getUnits(), 
              map.getStart(), 
              map.getEnd(), 
              map.getLocations(), 
              map.getChromosome() );
    }

    public Map( MappableEntity ME,
                String units,
                double start,
                double end,
                Location[] location,
                String chromosome
                ) {
        super( ME );
        this.units = units;
        this.start = start;
        this.end = end;
        this.location = location;
        this.chromosome = chromosome;
    }
    
    /**
     * @return    unit used for this map. Could be cM if genetic, or Mbp if physical
     */
    public String getUnits() {
        return this.units;
    }
    
    /**
     * @return    the start point in unit
     */
    public double getStart() {
        return this.start;
    }
  
    /**
     * @return    the end point in unit.  Should be greater than start
     */
    public double getEnd() {
        return this.end;
    }
  
    /**
     * @return    an array of assignments contained in this map
     */
    public Location[] getLocations() {
        return this.location;
    }

    public String getChromosome() {
        return this.chromosome;
    }

    public String getSpecies() {
        return this.species;
    }

    /**
     * @return    the number of Locations on the Map
     */
    public int getNumLocations() {
        return location.length;
    }
  
  
    // Set methods

    public void setUnits( String units ) {
        this.units = units;
    }

    public void setChromosome( String chrom ) {
        this.chromosome = chrom;
    }

    public void setStart( double start ) {
        this.start = start;
    }
  
    public void setEnd( double end ) {
        this.end = end;
    }
  

    /**
     * set the array of locations contained in this map
     */
    public void setLocations( Location[] location ) {
        this.location = location;
    }

    /**
     * @return    the type of map
     */
    public String getMapType() {
        return this.mapType;
    }
    /**
     * @return    the group/framework for map
     */
    public int getGroupNumber() {
        return this.groupNumber;
    }

    public void setMapType( String type ) {
        this.mapType = type;
    }

    public void setGroupNumber( int gNum ) {
        this.groupNumber = gNum;
    }
}
