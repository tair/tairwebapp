/**
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
 */
package org.tair.utilities;

import java.sql.SQLException;

/**
 * This is an interface for use by the search handlers to ensure 
 * a consistent method for this class to call to get the download content
 * right now it is specific to a particular class -- as search types provide
 * download all capability this could become a pain -- so if we have 
 * an interface that declares the method and any class that then wants
 * to provide the new download capability it would need to implement the 
 * interface
 * and provide concrete code for the method 
 * 
 */
public interface DownloadAllHandler {
	/**
	 *
	 * @param ids Collection of ids of data type for download
	 * @param session id; used to determine temp table name where 
	 * 		the contents of the query are stored 
	 *
	 * @return String containing content from query results
	 * 		using the set of passed in ids and the session id
	 * @exception SQLException thrown if a database error occurs
	 */
	public String populateDownloadContent( Long[] ids ) 
		throws SQLException;

}
