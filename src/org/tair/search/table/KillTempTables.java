package org.tair.search.table;

//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.4 $
// $Date: 2005/03/22 15:01:39 $
//------------------------------------------------------------------------------

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Properties;

/**
 * Class to get rid of any temp tables left in tempdb.  Temp tables
 * are created by the top level searches to cache search results in
 * order to improve performance when scrolling through multiple pages of
 * results.  Each temp table is created using the user's session ID
 * so that a unique table name can be created for each user.  When user's
 * session expires, these tables are dropped.  However, during a server
 * restart, there are times when sessions cannot be serialized to disk,
 * and so are lost.  This can lead to a build up of "orphaned" tables
 * over time, since once the session is lost, there is no mechanism to
 * get rid of the tables.
 *
 * <p>
 * This program should be regularly executed by a cron job.
 */

public class KillTempTables {

	// args should be db driver class (such as com.sybase.jdbc2.jdbc.SybDriver),
	// the database url (such as jdbc:sybase:Tds:scotland.tairgroup.org:4100/tairtest),
	// db user, db password, minimum age (in days) of temp tables to delete, and a file
	// name for the properties file which contains the prefixes for temp table names to delete.
	public static void main(String[] args) throws Exception
	{
		String driver = args[0];
		String url = args[1];
		String user = args[2];
		String pass = args[3];
		int days = Integer.parseInt(args[4]);
		String propfile = args[5];

		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, user, pass);
		Statement stat = conn.createStatement();
		stat.executeUpdate("use tempdb");
		stat.close();

		// get table names that were created more than 2 days ago
		GregorianCalendar now = new GregorianCalendar();
		now.roll( Calendar.DAY_OF_YEAR, -days );

		System.out.println( "Get tables created before: " + now.getTime() );
		String query =
			"SELECT name " +
			"FROM sysobjects " +
			"WHERE crdate <= " + (new SimpleDateFormat(" ''MM/dd/yyyy'' ").format(now.getTime())) +
			"AND ( " + getPrefixes(propfile) + " ) " +
			"ORDER BY name";
		System.out.println("\n\n"+query+"\n\n");
		stat = conn.createStatement();
		ResultSet results = stat.executeQuery(query);
		List<String> names = new ArrayList<String>();
		while(results.next())
			names.add(results.getString("name"));
		stat.close();

		// drop all tables
		stat = conn.createStatement();
		for(String table : names)
			try {
				stat.executeUpdate("DROP TABLE " + table);
			} catch(Exception e) {
				e.printStackTrace();
			}
		stat.close();

		System.out.println(names.size() + " tables dropped");
	}

	// create sub-clause to be included in SQL query to return
	// tables with valid search prefixes only
	public static String getPrefixes(String propfile) throws Exception
	{
		Properties props = new Properties();
		props.load(new FileInputStream(propfile));
		Enumeration names = props.propertyNames();
		String join = "";
		StringBuilder sb = new StringBuilder();
		while(names.hasMoreElements()){
			sb.append(join).append("name LIKE '").append(names.nextElement()).append("%' ESCAPE '\\\'");
			join = " OR ";
		}
		return sb.toString();
	}
}
