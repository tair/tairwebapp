/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.goslim;

import java.sql.*;
import org.tair.search.table.MasterTableInfo;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.TextConverter;

public class GOSlimChartFactory {
    private static final int max_num = 55;
    private static DBReadManager connectionPool;
    private static String chartType;
    private static String keytype;
    private static String title;
    private static String tempTblName;
    private static String countTmpTbl; //the table with the number of loci
    private static String goslimQueryID;
    private static String locigoslimQueryID;
    private static int keywordCount;
    private static boolean create;
    private static int locicount;
    private static int[] raw_values;
    private static String[] labels;
	
	public static GOSlimChart getChart(String keywordType, String type, String queryID, String countQueryID) 
	throws SQLException {
		chartType = type;
		keytype = keywordType;
                raw_values = new int[max_num];
                labels = new String[ max_num];
		tempTblName = "RESULT_GOSLIM";
		countTmpTbl ="RESULT_LOCIGOSLIM";
		goslimQueryID = queryID;
		locigoslimQueryID = countQueryID;
		connect();
		
		if (type.equalsIgnoreCase("annotation")) //pie chart
		{
			GOSlimPie slimpie = new GOSlimPie(keywordType, title, max_num,
					raw_values, labels, keywordCount, create);
			return slimpie;
		}
		else //if type is "loci", ie bar chart
		{
			GOSlimBar slimbar = new GOSlimBar(keywordType, title, max_num,
					raw_values, labels, keywordCount, locicount, create);
			return slimbar;
		}
	}
	
	private static void connect() throws SQLException{
		DBconnection conn = null;
        try {
        	connectionPool = DBReadManager.getInstance();
            conn = connectionPool.get_connection();
            if (chartType.equals("annotation")) //pie chart
            	setPieData( conn );
            else //if chartType  = "loci", ie bar chart
            	setBarData( conn );
            
            if ( create ) 
            	setTitle( conn );
        } finally {
            if ( conn != null ) 
            	connectionPool.return_connection(conn); 
        }
	}

    private static void setTitle( DBconnection conn ) throws SQLException {
        StringBuffer buffer = new StringBuffer();
        buffer.append( " Functional Categorization by " + 
                chartType + " for : " );
        if ( keytype != null ) {
            String query = "SELECT display " + 
                " FROM KeywordType " + 
                " WHERE keyword_type_id = " + 
                TextConverter.dbQuote( keytype );
            conn.setQuery( query );    
            ResultSet results = conn.getResultSet();
            if ( results.next() ) {
                buffer.append( results.getString( "display" ) );
            }
            conn.releaseResources();
            title = buffer.toString();
        }
    }
    
    private static void setPieData( DBconnection conn ) throws SQLException {
    	//get the keyword by descending magnitude of raw values
        if ( keytype != null && tempTblName != null ) {
            String query = "SELECT slim_name, " + 
                "annotation_count FROM " + tempTblName + 
                " WHERE QUERY_ID = " + TextConverter.dbQuote( goslimQueryID ) + 
                " AND keyword_type_id = " + 
                TextConverter.dbQuote( keytype ) +
                " AND annotation_count > 0" + 
                " ORDER BY annotation_count DESC "; 
            conn.setQuery( query );    
            ResultSet results = conn.getResultSet();
            keywordCount = 0;
            String label = null;
            while ( results.next() ) {
                keywordCount ++;
                if ( keywordCount <= max_num ) {
                    create = true;
                    raw_values[ keywordCount - 1 ] = 
                        results.getInt( "annotation_count" );
                    label = results.getString( "slim_name" );
                    labels[ keywordCount - 1 ] = label;
                }

            }
            conn.releaseResources(); 
        }

    }
    
    private static void setBarData( DBconnection conn ) throws SQLException {
        if ( keytype != null && tempTblName != null  
        		&& countTmpTbl != null) {
            String query = "SELECT DISTINCT ctt.locus_name AS locus_name " +
                           " FROM LociGoslim_wrk lg, " + countTmpTbl + " ctt " +
                           " WHERE ctt.QUERY_ID = " + TextConverter.dbQuote( locigoslimQueryID ) + 
                           " AND lg.locus_name = ctt.locus_name AND lg.category = " + TextConverter.dbQuote(keytype);
            conn.setQuery(query);
            ResultSet results = conn.getResultSet();
            
            locicount = 0;
            while(results.next() ) 
                locicount++;

            query = "SELECT slim_name, loci_count FROM " + tempTblName + 
                           " WHERE QUERY_ID = " + TextConverter.dbQuote( goslimQueryID ) + 
                           " AND keyword_type_id = " + TextConverter.dbQuote( keytype ) +
                           " ORDER BY UPPER(slim_name) ASC";
            conn.setQuery(query);    
            results = conn.getResultSet();
            
            keywordCount = 0;
            String label = null;
            
            // keep track of different genes, and the total number of genes
            while ( results.next() ) {
                keywordCount ++;
                if ( keywordCount <= max_num) {
                    create = true;
                    raw_values[ keywordCount - 1 ] = 
                        results.getInt( "loci_count" );
                    label = results.getString( "slim_name" );
                    labels[ keywordCount - 1 ] = label;
                }
            }
            conn.releaseResources(); 
        }
    }
    
}
