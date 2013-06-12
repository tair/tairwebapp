/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.io.Serializable;
import java.util.Map;
import java.util.HashMap;
import java.util.Date;
import java.util.Calendar;
import javax.naming.InitialContext;

public class DetailCache implements DetailCacheMBean, Serializable
{
	private int cleaning = 10;
	private int expire = 1000;
	private Map<String,CacheEntry> cache = new HashMap<String,CacheEntry>();

	public DetailCache(){
		new CacheThread(this).start();
	}

	public Object get(String key){
		CacheEntry entry = cache.get(key);
		return entry == null ? null : entry.detail;
	}

	public void put(String key, Object obj){
		cache.put(key, new CacheEntry(obj));
	}

	public int getCacheSize() {
		return cache.size();
	}

	public void flush(){
		cache.clear();
	}

	public int getExpirationInterval(){
		return expire;
	}

	public void setExpirationInterval(int expire){
		this.expire = expire;
	}

	public int getCleaningInterval(){
		return cleaning;
	}

	public void setCleaningInterval(int cleaning){
		this.cleaning = cleaning;
	}

	void clean()
	{
		Calendar c = Calendar.getInstance();
		c.add(Calendar.SECOND, -expire);
		Date cutoff = c.getTime();
		for(String key: cache.keySet())
			if(cache.get(key).birth.before(cutoff))
				cache.remove(key);
	}

	class CacheThread extends Thread {
		private DetailCache dc;
		public CacheThread(DetailCache dc){
			this.dc = dc;
		}
		public void run() {
			while(!interrupted()){
				try{
					dc.clean();
					sleep(1000*dc.getCleaningInterval());
				} catch(Exception e) {}
			}
		}
	}

	class CacheEntry {
		public Date birth;
		public Object detail;
		public CacheEntry(Object detail){
			this.detail = detail;
			this.birth = new Date();
			//touch();
		}
		/*public void touch(){
			Calendar c = Calendar.getInstance();
			c.add(Calendar.SECOND, 30);
			this.birth = c.getTime();
		}*/
	}

}
