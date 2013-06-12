/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.sql.*;
import java.util.ArrayList;
import org.tair.tfc.DBconnection;
import org.tair.tfc.DBReadManager;
import org.tair.querytools.GeneDetail;


/** 
 * Class to hold the Annotation Statistics
 *
 * See:  AnnotationStatistics Table
 *       
 */
public class AnnotationStatistics  {

    public static final int PROCESS_ANNOTATIONS   = 0;
    public static final int PROCESS_LOCI          = 1;
    public static final int FUNCTION_ANNOTATIONS  = 2;
    public static final int FUNCTION_LOCI         = 3;
    public static final int COMPONENT_ANNOTATIONS = 4;
    public static final int COMPONENT_LOCI        = 5;
    public static final int EXPERIMENTAL_ANNOTATIONS_ANNOTATIONS = 6;
    public static final int EXPERIMENTAL_ANNOTATIONS_LOCI = 7;
    public static final int NON_ANNOTATIONS_ANNOTATIONS   = 8;
    public static final int NON_ANNOTATIONS_LOCI  = 9;
    public static final int DISTINCT_GO_TERMS     = 10;
    public static final int TOTAL_ANNOTATIONS     = 11;
    public static final int TOTAL_LOCI            = 12;

    private int[] vals;

    public AnnotationStatistics () throws SQLException {
	
	this.vals = new int[13]; 

	DBReadManager pool = null;
	DBconnection conn = null;

	try {

	    pool = DBReadManager.getInstance();
	    conn = pool.get_connection();

	    String query = "select * from AnnotationStatistics";
	    
	    conn.setQuery(query);
	    ResultSet results = conn.getResultSet();

	    while(results.next()) {
		int id   = results.getInt(1);
		int stat = results.getInt(2);

		if (id < this.vals.length) {
		    this.vals[id] = stat;
		}
		
	    } 
	} finally {

	    if ( conn != null ) { 
		conn.releaseResources();	    
		pool.return_connection( conn ); 
	    }
	}
    }

    public int getStat(int id) {
	if (id < this.vals.length) {
	    return this.vals[id];
	} 

	return 0;
    }

}

