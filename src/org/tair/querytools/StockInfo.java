/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

/**
 * StockInfo is a light weight class used to store select information about a stock
 */

public class StockInfo {

	Long id;
	String name, availType;

	public StockInfo(Long id, String name, String availType){
			this.id = id;
			this.name = name != null ? name : "";
			this.availType = availType != null ? availType : "";
	}

	public Long getId(){
		return id;
	}

	public String getName(){
		return name;
	}

	public String getAvailabilityType(){
		return availType;
	}
}
