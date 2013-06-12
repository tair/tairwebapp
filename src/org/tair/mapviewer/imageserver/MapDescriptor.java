/*
 * $Id: MapDescriptor.java,v 1.12 2005/12/06 00:28:23 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */

package org.tair.mapviewer.imageserver;

import org.tair.mapviewer.shared.*;
import org.ncgr.util.*;

/**
 * Uniquely identifies a map. This class allows a set of map attributes to be 
 * used as a key in a hashtable.
 *
 * A map descriptor object is constructed using the map's attributes
 * (chromosome, type, etc.). If the specified attributes uniquely identify
 * a map, all map descriptor fields are then initialized and made available
 * to the client.
 */

public class MapDescriptor
{
    public static final int MAXIMUM_LABEL_OVERHANG = 75;


    /**
     * Chromosome number such as 1, 2, 3, 4, and 5 for Arabidopsis 
     */
    private String chromosome;
    
    /**
     * Values defined org.tair.mapviewer.shared.Map
     */
    private MapType type;
    
    /**
     * Basically is the mapType displayed in mapviewer, such as
     * AGI, Classical
     */
    String name;

    /**
     * Used to identify the physical map group name, such as Goodman. 
     */
    private String group;
    
    // Evaluated attributes; the map server is queried to determine these 
    // attributes. If the client-specified attributes do not uniquely specify an
    // existing map, 'isValid' will be false and these evaluated attributes will
    // be undefined.
    private long id;
    
    /**
     * This is used by servlet to determine appropriate scale for each map so 
     * that all maps are given the same width. 
     */
    private double length;
    
    /**
     * 'true' if the attributes values, as specified in the constructor, are
     *	sufficient to uniquely identify an existing map. 
     */
    private boolean isValid;
    
    /**
     * 'true' if the map server has been called in order to retrieve map id and
     * length. 
     */
    private boolean isLoaded;
    

    /** 
     *	Constructor: used for Genetic Maps. 
     */
    public MapDescriptor( String chromosome,
			  MapType type,
			  String name )
			  
    {
	if ( type == MapType.PHYSICAL ) {
	    throw new IllegalArgumentException( "'type' cannot be PHYSICAL if " +
						"group is not specified" );
	} // if
	if ( chromosome == null ) {
	    throw new IllegalArgumentException( "'chromosome' argument cannot " +
						"be null." );
	} // if
	if ( name == null ) {
	    throw new IllegalArgumentException( "'name' argument cannot " +
						"be null." );
	} // if

	this.chromosome = chromosome;
	this.type = type;
	this.name = name;
    } 

    /**
     *
     */
    public MapBand getMapBand( Logger logger )
    {
	try
	    {
		MapBandCache cache = MapBandCache.getInstance();
		MapBand mb = cache.getMapBand( this );
		return mb;
	    }
	catch( Exception e )
	    {
		logger.logException( "Exception : " , e );
		return null;
	    }
    }
    

    /** 
     *	Used for Physical Maps. 
     */
    public MapDescriptor( String chromosome,
			  MapType type,
			  String name,
			  String group )
    {
	if ( type != MapType.PHYSICAL ) {
	    throw new IllegalArgumentException( "'type' must be PHYSICAL if " +
						"group is specified" );
	} // if
	if ( chromosome == null ) {
	    throw new IllegalArgumentException( "'chromosome' argument cannot " +
						"be null." );
	} // if
	if ( name == null ) {
	    throw new IllegalArgumentException( "'name' argument cannot " +
						"be null." );
	} // if
	if ( group == null ) {
	    throw new IllegalArgumentException( "'group' argument cannot " +
						"be null." );
	} // if

	this.chromosome = chromosome;
	this.type = type;
	this.name = name;
	this.group = group;
    } // constructor 2

    public String toString()
    {
	String s;
	if ( type == MapType.PHYSICAL ) {
	    s = "[Type: \"" + type + "\", Name: \"" + name + "\", Chromosome: \"" +
		chromosome + "\", Group: \"" + group + "\"]";
	} 
	else {
	    s = "[Type: \"" + type + "\", Name: \"" + name + "\", Chromosome: \"" +
		chromosome + "\"]";
	} 
	return s;
    } 
	
    public boolean equals( Object o )
    {
	if ( o instanceof MapDescriptor ) {
	    if ( this == o ) {
		return true;
	    } 
	    MapDescriptor md = (MapDescriptor) o;
	    // if the MapDescriptor has been "loaded", then just compare ids; in 
	    // this case, map descriptors can only be equal if they are valid
	    if ( isLoaded ) {
		if ( isValid && this.id == md.id ) {
		    return true;
		} 
	    }
	    // otherwise compare the client-specified attributes
	    else {
		if ( 
		    ( ( this.chromosome == null && md.chromosome == null ) ||
		      this.chromosome.equals( md.chromosome ) ) &&
		    this.type == md.type &&
		    ( ( this.name == null && md.name == null ) ||
		      this.name.equals( md.name ) ) &&
		    ( ( this.group == null && md.group == null ) ||
		      this.group.equals( md.group ) ) ) {
		    return true;
		} // if
	    } // if
	} // if
	return false;
    } 

    public int hashCode()
    {
	// FIXME: must implement properly, generating a unique hashcode
	// from the map's attributes
	return chromosome.hashCode() * type.hashCode() * name.hashCode();
    } 

    public String getChromosome()
    {
	return chromosome;
    } 

    public int getIntChromosome()
    {
      try
      {
	Integer i = new Integer( chromosome );
	return i.intValue(); 
      }
      catch( Exception e )
      {
      }
      if ( chromosome.equals("I"))
	return 1;
      else if ( chromosome.equals("II"))
	return 2;
      else if ( chromosome.equals("III"))
	return 3;
      else if ( chromosome.equals("IV"))
	return 4;
      else if ( chromosome.equals("V"))
	return 5;
      throw new RuntimeException( "Bad chromosome : " + chromosome );
    }

    public MapType getType()
    {
	return type;
    }

    public String getName()
    {
	return name;
    } 

    public String getGroup()
    {
	return group;
    } 

    /**
     *  Returns the map id. When called for the first time, this method will
     *	lookup the map id.
     *	@exception MapNotFoundException If this MapDescriptor does not identify
     *	an existing map.
    */
    public long getId()
	throws MapNotFoundException
    {
	if ( !isLoaded ) {
	    loadMapAttributes();
	}
	return id;
    } 

    /**
     * Get the real length of the map, as reported by the map's data.
     *
     * @exception MapNotFoundException If this MapDescriptor does not identify
     * an existing map.
     */
    public double getRealLength()
	throws MapNotFoundException
    {
	if ( !isLoaded ) {
	    loadMapAttributes();
	}
	return length;
    } 

    /** 
     * @deprecated Use getRealLength() 
     * @see #getRealLength()
     * @exception MapNotFoundException If this MapDescriptor does not identify
     * an existing map.
     */
    double getLength()
	throws MapNotFoundException
    {
	if ( !isLoaded ) {
	    loadMapAttributes();
	}
	return length;
    } 

    /**
     * Get the visible length of the map, which includes some extra space 
     * appended to the end of the map to accomodate labels that would normally 
     * extend past the right edge of the map area. If the developer wants the
     * extra space to be constant across all zoom levels then this method should
     * be called when calculating the pixelsPerUnit value for each zoom level.
     * @param pixelWidthOfMap the number of pixels that are required to entire
     * width of the map at a given zoom level.
     * @see #getRealLength()
     * @exception MapNotFoundException If this MapDescriptor does not identify
     * an existing map.
     */
    public double getVisibleLength( int pixelWidthOfMap )
	throws MapNotFoundException
    {
	if ( !isLoaded ) {
	    loadMapAttributes();
	}
	double pctIncrease = 1 + MAXIMUM_LABEL_OVERHANG / (double) pixelWidthOfMap;
	return length * pctIncrease;
    } 

    /**
     * @return boolean - true if data specified during construction is 
     * sufficient to identify a unique map. 
     */ 
    public boolean isValid()
    {
	if ( !isLoaded ) {
	    loadMapAttributes();
	}
	return isValid;
    } 

    private void loadMapAttributes()
    {
	try {
	    Map map = MapCache.getInstance().getMap( this );
	    id = map.getID();
	    // FIXME: should we do "end - start" instead?

	    length = map.getEnd();
	    isValid = true;
	} 
	catch ( MapNotFoundException e ) {
	    isValid = false;
	} 
	catch ( Exception e ) {
	    e.printStackTrace();
	} 
    } 

} 
