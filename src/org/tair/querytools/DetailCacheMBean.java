/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

public interface DetailCacheMBean
{
	public int  getExpirationInterval();
	public void setExpirationInterval(int i);
	public int  getCleaningInterval();
	public void setCleaningInterval(int i);
	public int  getCacheSize();
	public void flush();
}
