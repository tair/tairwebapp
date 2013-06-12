/*
 * $Id: MapGeneralInfo.java,v 1.2 2005/12/06 00:27:43 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/



package org.tair.html;


/**
 * Originally a inner class of MapPickerHtml, MapInfo.
 */
public class MapGeneralInfo 
{
    
    private String name,type,unit,length;

    private boolean isOn;
    
    MapGeneralInfo(String name, String type, String length, String unit, boolean isOn) 
    {
	this.name = name;
	this.type = type;
	this.length = length;
	this.unit = unit;
	this.isOn = isOn;
    }
    
	public String getName() 
    { 
	return name; 
    }
    
    public String getType() 
    { 
	return type; 
    }
	
    public String getLength() 
    { 
	return length; 
    }
    
    public String getUnit()
    { 
	return unit; 
    }
    
    public boolean isOn() 
    { 
	return isOn; 
    }
}

