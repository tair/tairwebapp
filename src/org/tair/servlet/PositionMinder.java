/*
 * $Id: PositionMinder.java,v 1.10 2003/09/29 15:35:15 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.servlet;

/**
 * Keeps the position and the zoom level of the map
 */
public class PositionMinder
{

    /**
     * the left edge of the view window
     */
    private double left;
  
    /**
     * how far over we move with a scroll at this zoom level.
     * not size of screen, because we want overlap
     */
    private double moveBy;
    
    /**
     * the current integer zoom level
     */
    private Number zoomLevel;
    
    
    /**
     * the right edge of the view window
     */
    private double right;
    
    /**
     * how many units long the map is
     */
    private double mapLength;
    
    /**
     * percentage of screen NOT overlapping
     */
    private final double overlapFraction = .8;
    
    /**
     * how many units wide the screen is at this zoom level
     */
    private double sizeOfScreenAtThisLevel;
    
    /**
     * what zoom levels for this map, for example, 1, 2, 4, 8, 20
     */
    private int [] levels;
    
    /**
     * constructor
     */
    PositionMinder( double length , int [] levels , int zoomLevel)
    {
	this.mapLength = length;
	this.levels = levels;
	this.zoomLevel = new Integer( zoomLevel );
	adjustAfterZoom();
    }
    
    void setZoomLevel( Integer n )
    {
	if (n.intValue() == zoomLevel.intValue())
	    return;
	zoomLevel = n;
	adjustAfterZoom();
    }
    
    
    
    public double getMapLength()
    {
	return mapLength;
    }
    
    public double getLeft()
    {
	return left;
    }
    
    public double getRight()
    {
	return Math.min( right ,  adjustedMapLength());
    }
    
    /**
     * set the numeric viewing zone,
     */
    void setZone( int zts )
    {

	left = sizeOfScreenAtThisLevel * zts;
	right = left + sizeOfScreenAtThisLevel;

	adjustRightEdge();
	adjustLeftEdge();
    }
    
    
    /**
     * set the double viewing zone, range 0.0 - 1.0
     */
    void setZone( double zts )
    {
	setZone( (int)(getNumberOfZones() * zts) );
    }
    
 
    double unitsPerPixelAtThisLevel()
    {
	
	return mapLength / ( getNumberOfZones() * BioServlet.BandWidth );
    }
 

    /**
     * Can this be used to dynamically to adjust the map length?
     * Say for AGI map, real map length = 20000000, at 1x, = 30000000.
     */
    double adjustedMapLength()
    {
	return mapLength + ( 20 * unitsPerPixelAtThisLevel() );

    }
    
    /**
     * how many units long the screen is a the current zoom level
     */
    private double getSizeOfScreenAtThisLevel()
    {
	return mapLength / getNumberOfZones();
    }
    
    
    /**
     * after a zoom, call this to recalc critical data
     */
    private void adjustAfterZoom()
    {
	double currentCenter = ( left + right ) / 2;
	sizeOfScreenAtThisLevel =  getSizeOfScreenAtThisLevel();
	moveBy = sizeOfScreenAtThisLevel * overlapFraction;
	
	left = currentCenter - ( sizeOfScreenAtThisLevel / 2 );
	
	if ( left < 0.0 ) 
	    {
		left = 0.0;
	    }
	
	right = left + sizeOfScreenAtThisLevel;
	
	adjustRightEdge();
	adjustLeftEdge();
    }
    
    
    
    /**
     * make sure the right edge is not off the band.  
     * if it is, adjust scroll so it's back in range.
     */
    private void adjustRightEdge()
    {
	if ( right > adjustedMapLength() )
	    {
		left = adjustedMapLength() - sizeOfScreenAtThisLevel;
		right = adjustedMapLength();
	    }
    }
    
    
    /**
     * if the left edge is less than zero, make it zero, and
     * adjust the right edge accordingly.
     */ 
    void adjustLeftEdge()
    {
	if ( left < 0.0 )
	    {
		left = 0.0;
		right = sizeOfScreenAtThisLevel;
	    }
    }
    
    double unitsVisibleIn( int pixels )
    {
	return pixels / sizeOfScreenAtThisLevel;
    }
    
    public void left()
    {
	snapToIntZoomLevel();
	left -= moveBy;
	right -= moveBy;
	adjustLeftEdge();
    }
    
    public void zoomIn()
    {
	if ( zoomLevel instanceof Double )
	    {
		zoomLevel = new Integer(  ( int ) Math.floor( zoomLevel.doubleValue() ) );
	    }
	if ( zoomLevel.intValue() < (levels.length-1) )
	    {  
		double oldLeft = left;
		double oldRight = right;
		zoomLevel = new Integer( zoomLevel.intValue() + 1 );
		adjustAfterZoom();
		
		if ( ( oldRight + .01 ) > mapLength )
		    {
			right = mapLength;
			left = ( right - sizeOfScreenAtThisLevel );
		    }
		
		if ( oldLeft < 0.001 )
		    {
			left = 0.0;
			right = sizeOfScreenAtThisLevel;
		    }
		
		
	    }
    }
    
    public void zoomOut()
    {
	if ( zoomLevel instanceof Double )
	    {
		zoomLevel = new Integer( (int) Math.ceil( zoomLevel.doubleValue() ) );
	    }
	
	if ( zoomLevel.intValue() > 0 )
	    {
		zoomLevel = new Integer( zoomLevel.intValue() - 1 );
		adjustAfterZoom();
	    }
    }
    
    public void right()
    {
	snapToIntZoomLevel();
	left += moveBy;
	right += moveBy;
	adjustRightEdge();
    }
    
    
    void setLocationAndMinLevel( double center , int mzl )
    {
	//BioServlet.debug( "slaml : " + center + " , " + mzl );
	
	int zl2 = 0;
	for( int a = 0 ; a < levels.length ; ++ a )
	    {
		if ( mzl == levels[ a ] )
		    {
			zl2 = a;
		    }
	    }
	
	if ( zl2 > zoomLevel.doubleValue() )
	    {
		
		zoomLevel = new Integer( zl2 );
		adjustAfterZoom();
	    }
	
	double sos = getSizeOfScreenAtThisLevel();
	sos /= 2;
	
	left = center - sos;
	right = center + sos;
	adjustRightEdge();
	adjustLeftEdge();
    }
    
    double log2( double target )
    {
	double low = 0.0;
	double high = target;
	
	while ( high - low > .01 )
	    {
		double ave = ( low + high ) / 2;
		double t2 = Math.pow( 2.0 , ave );
		if ( t2 > target )
		    high = ave;
		else
		    low = ave;
	    }
	return ( low + high ) / 2.0;
    }
    
    /**
     * When select a range to display, this function get called. Need to take
     * care of out of range selection.
     */
    boolean setLeftRight( double left , double right )
    {

	double interval = right - left;
	sizeOfScreenAtThisLevel = Math.min(interval, mapLength); 



	if  ( left != right ) { 
	    this.left = left; 
	    this.right = right;

	    adjustRightEdge();
	    adjustLeftEdge();
	    	    	    
	    double zonesAtThisLevel = 1.0; 
	    try{ 	      
		zonesAtThisLevel =  mapLength / sizeOfScreenAtThisLevel; 
	    } 
	    catch( Exception e ){ 
	    } 
	    
	    zoomLevel = new Double( log2( zonesAtThisLevel ) ); 
	    	    
	    return true; 
	}  
	return false; 

    }
    


    /**
     * this is a rescue when a custom zoom level is produced
     */
    void snapToIntZoomLevel()
    {
	if ( zoomLevel instanceof Double ){
	    double d = Math.round( zoomLevel.doubleValue() );
	    int i = ( int ) d;
	    if ( i >= levels.length )
		{
		    i = levels.length - 1;
		}
	    zoomLevel = new Integer( i );
	    adjustAfterZoom();
	}
    }
    
    int getNumberOfZonesAtLevel( int l )
    {
	return levels[ l ];
    }
    
    public int getNumberOfZones()
    {

	if ( zoomLevel instanceof Integer ) {
	    return getNumberOfZonesAtLevel( zoomLevel.intValue() );
	}
	else {

	    double d = Math.round( zoomLevel.doubleValue() );
	    int i = ( int ) d;
	    if ( i >= levels.length )
		{
		    i = levels.length - 1;
		}
	    return getNumberOfZonesAtLevel(i);

	    //return -1; // this is very dangerous
	}

    }
    
    Number getZoomLevel()
    {
	return zoomLevel;
    }
}

