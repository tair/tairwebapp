// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $RCSfile: GOSlimBuilder.java,v $
// $Revision $
// $Date: 2005/08/12 18:18:58 $
// ------------------------------------------------------------------------------
package org.tair.search.goslim;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.Vector;

import org.jboss.logging.Logger;
import org.tair.search.table.MasterTableInfo;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.TextConverter;


/**
 * takes in a list of loci either from a textbox or from a file puts the loci
 * names in a temp table temp table of input entries making sure there aren't
 * duplicate entries or blank entries for each locus, get associated genes with
 * annotations to keywords, for each keyword annotation for the locus translate
 * the keyword to a slim name using the LociGoslim_wrk table and place the entry
 * in the temp table of results next group and order the temp table results to
 * get frequencies of slim name hits ordered by keyword type keep only the
 * entries in the temp table that have frequencies > 0
 * 
 * note : we used to find goslim terms which were specially marked keywords but
 * now the special keywords are designated with a slim name so this slim label
 * is what we'll be using to group the entries 041404 - mhm
 * 
 * update - 080205, mhm we now provide the capability to categorize all the
 * unique loci in the LociGoslim_wrk table in addition to providing the
 * categorization against the submitted list or file of loci
 */

public class GOSlimBuilder {
  private static final Logger logger = Logger.getLogger(GOSlimBuilder.class);
  
  private static final String INSERT_SQL = 
    "INSERT INTO RESULT_LOCIGOSLIM (locus_name, query_id, date_last_queried)  VALUES  ( ?, ?, CURRENT_DATE )";

  private final String resultTableName = "RESULT_GOSLIM";
  // regular results set temp table
  private String inputQueryID;
  private String queryID;
  private boolean whole = false;
  private final String searchType = "goslim";
  private final String inputSearchType = "locigoslim";
  private Map params;
  private DBWriteManager connectionPool;
  private final String inputTempTblName = "RESULT_LOCIGOSLIM";

  // this temp table holds the loci being used for the
  // categorization - needed to persist and be accessed by the
  // gene search for the linking capability

  public GOSlimBuilder() {
  }

  /**
   * takes in the user-supplied parameters from the form and the user's session
   * id and builds the set of goslim terms for the provided set of loci
   */
  public void build(Map searchParams) throws SQLException, InvalidFormException {
    if (searchParams != null) {
      setParams(searchParams);
      // setTempTblName();
      // setInputTempTblName();
      setWholeGenomeFlag();
      DBconnection conn = null;
      try {
        conn = getConnection();
        // populate the inputTempTbl with locus names provided by
        // text box or file
        setLociList(conn);
        // Use just one query id, since results will be the same if the locus list is the same
        setQueryID(getInputQueryID()); 
        deleteRows(conn, "all");
        storeSlimEntries(conn);
        groupRows(conn);
        deleteRows(conn, "ancount");
        deleteNullSQL(conn);
      } finally {
        if (conn != null)
          returnConnection(conn);
      }
    }
  }

  // returns the search type
  private final String getSearchType() {
    return searchType;
  }

  private final String getInputSearchType() {
    return inputSearchType;
  }

  // returns the sql used to insert goslim terms into the temp table
  // counts will be populated by grouping these rows and storing
  // them into the results table with the count fields populated
  // these rows that contain no counts but were used to generate
  // the counts will then be deleted
  private String getGOSlimSQL(String queryID) {
    String select =
      " SELECT DISTINCT lg.keyword_id AS id "
          + " , lg.slim_name AS slim_name "
          + " , lg.category AS keyword_type_id "
          + " , 0 AS annotation_count "
          + " , 0 AS loci_count "
          + " , lg.locus_id AS locus_id"
          + " , 0 AS grouping"
          + " , 0 AS subgroup";
    if (queryID != null && queryID != "") {
      select = select + ", '" + queryID + "', CURRENT_DATE ";
    } else {
      select = select + ", '', '' ";
    }
    select =
      select
          + " FROM LociGoslim_wrk lg, "
          + getInputTempTblName()
          + " itt "
          + " WHERE lg.locus_name = itt.locus_name "
          + " AND itt.query_id = "
          + getInputQueryID();
    logger.debug("GoSlim query: " + select);
    return select;
  }

  /**
   * Get the SQL statement that queries the unique set of loci from the
   * LociGoslim_wrk table, excluding obsolete and non-Arabidopsis loci. The
   * statement returns the locus name, the query id, and the date, suitable
   * for insertion into the result table.
   * 
   * @param queryID the query id to put into the SELECT list; if null, the select returns an empty string
   * @return the SELECT statement
   */
  private String getLociListSQL(String queryID) {
    StringBuilder select = new StringBuilder(" SELECT DISTINCT " + " lg.locus_name AS locus_name ");
    if (queryID != null && queryID != "") {
      select.append(", '");
      select.append(queryID);
      select.append("', CURRENT_DATE ");
    } else {
      select.append(", '', '' ");
    }
    select.append(" FROM LociGoslim_wrk lg JOIN Locus l ON lg.locus_id = l.locus_id ");
    select.append(" WHERE l.is_obsolete = 'F' AND l.taxon_id = 1 ");
    logger.debug("Whole-genome categorization locus query: " + select.toString());
    return select.toString();
  }

  /**
   * Get a SQL statement that queries all result-table rows from the result
   * table, querying the row number as the id.
   * 
   * @return
   */
  private final String getDownloadIDsSQL() {
    return " SELECT id " + " FROM " + resultTableName;
  }

  // return sql that groups and orders the data in the temp table and writes
  // the groupings as new rows with counts from
  // the group by in the annotation_count and loci_count columns
  private String getGroupRowsSQL(String queryID) {
    String select =
      "SELECT 0 AS id "
          + " , slim_name AS slim_name "
          + " , keyword_type_id AS keyword_type_id "
          + " , count(*) AS annotation_count "
          + " , count(DISTINCT locus_id) AS loci_count "
          + " , 0 AS locus_id"
          + " , 0 AS grouping"
          + " , 0 AS subgroup";
    if (queryID != null && queryID != "") {
      select = select + ", '" + queryID + "', CURRENT_DATE ";
    } else {
      select = select + ", '', '' ";
    }
    select =
      select
          + " FROM "
          + resultTableName
          + " WHERE annotation_count = 0 "
          + " AND query_id = "
          + queryID
          + " GROUP BY  slim_name, keyword_type_id"
          + " ORDER BY keyword_type_id, annotation_count desc";
    return select;
  }

  private String getFinalSQL(String query_id) {
    return " SELECT DISTINCT itt.id as id,"
           + " lg.slim_name AS slim_name,"
           + " lg.category AS keyword_type_id,"
           + " itt.annotation_count AS annotation_count,"
           + " itt.loci_count AS loci_count,"
           + " itt.locus_id as locus_id,"
           + " itt.grouping as grouping,"
           + " itt.subgroup as subgroup"
           +
           // " itt.row_id as row_id" +
           " FROM LociGoslim_wrk lg left outer join "
           + resultTableName
           + " itt on lg.slim_name = itt.slim_name and itt.query_id = "
           + queryID;

  }

  /*
   * Updates the temp table to contain all the slim_names from the different
   * categories, but no nulls
   */
  private void deleteNullSQL(DBconnection conn) throws SQLException {
    String query_id = getQueryID();
    String query = getFinalSQL(query_id);
    conn.setQuery(query);
    ResultSet results = conn.getResultSet();

    while (results.next()) {
      int id = results.getInt("id");
      if (results.wasNull()) {
        // insert a 0 value into that cell
        query =
          "INSERT INTO "
              + resultTableName
              + "( "
              + getColumnList("all")
              + ") "
              + " VALUES ("
              + 0
              + ", "
              + TextConverter.dbQuote(results.getString("slim_name"))
              + ", "
              + TextConverter.dbQuote(results.getString("keyword_type_id"))
              + ", "
              + 0
              + ", "
              + 0
              + ", "
              + 0
              + ", "
              + 0
              + ", "
              + 0
              + ", "
              + getQueryID()
              + ", CURRENT_DATE)";

        conn.setQuery(query);
        conn.executeUpdate();
      }
    }

    conn.releaseResources();
  }

  // remove initial entries from temp table - those that were grouped to
  // obtain the annotation_count and loci_count values
  // if type all is set, delete all rows of current query_id
  private final String getDeleteRowsSQL(String query_id, String type) {
    String del_query =
      " DELETE FROM " + resultTableName + " WHERE query_id = " + query_id;
    if (type.equalsIgnoreCase("ancount")) {
      del_query = del_query + " AND annotation_count = 0 ";
    }
    return del_query;
  }

  // returns the insert clause used to populate loci names
  // into a temp table
  // from a textarea or a file
  private final String getInsertSQL() {
    return " INSERT INTO "
           + getInputTempTblName()
           + " (locus_name, query_id, date_last_queried) "
           + " VALUES ";
  }

  private void setLociList(DBconnection conn) throws InvalidFormException,
      SQLException {
    if (useWholeGenome()) {
      setList(conn);
    } else {
      if ((getParams().get("loci") != null)
          || (getParams().get("file") != null)) {
        if (getParams().get("loci") != null) {
          // get list of names from a textarea
          setList((String)getParams().get("loci"), conn);
        } else { // get list of names from a file
          setList((File)getParams().get("file"), conn);
        }
      }
    }
  }

  /**
   * Read the uploaded file of locus names and set the list with it. This method
   * reads the entire file into a string and passes the string to the String
   * setList method.
   * 
   * @param uploadedFile the locus file
   * @param conn the JDBC connection wrapper
   * @throws InvalidFormException when there is a problem with the file
   * @throws SQLException when setting the list causes a database problem
   * @see #setList(String, DBconnection)
   */
  private void setList(File uploadedFile, DBconnection conn)
      throws InvalidFormException, SQLException {
    if (uploadedFile != null) {
      try {
        FileReader fs = new FileReader(uploadedFile);
        BufferedReader in = new BufferedReader(fs);
        StringBuilder builder = new StringBuilder();
        try {
          // Read the file into the builder as chars.
          int retcode = 0;
          while (retcode == 0) {
            retcode = in.read();
            if (retcode != -1) {
              builder.append((char)retcode);
              retcode = 0;
            }
          }
        } catch (Exception e) {
          logger.error("Problem reading locus file for GO keyword download", e);
          throw e;
        } finally {
          in.close();
        }
        setList(builder.toString(), conn);
      } catch (SQLException e) {
        logger.error("Problem processing search results from database: " + e.getMessage(), e);
        throw new InvalidFormException("Problem processing search results from database: " + e.getMessage());
      } catch (FileNotFoundException fnfe) {
        logger.error("Uploaded file not found error: "
                                       + uploadedFile.toString(), fnfe);
        throw new InvalidFormException("Uploaded file not found error: "
                                       + uploadedFile.toString());
      } catch (IOException ioe) {
        logger.error("Uploaded file error", ioe);
        throw new InvalidFormException("Uploaded file error: "
                                       + uploadedFile.toString()
                                       + "uploadedFile.exists(): "
                                       + uploadedFile.exists()
                                       + "uploadedFile.length(): "
                                       + uploadedFile.length());
      } catch (Exception e) {
        logger.error("Problem building GO keyword search results", e);
        throw new InvalidFormException("Problem building GO keyword search results: " + e.getMessage());
      }
    }
  }

  // this lociList parameter will contain either a delimited string
  // from a line
  // of a file if it is being invoked from setList( uploadedFile, conn )
  // or the contents of a text area if invoked from setLociList method
  private void setList(String lociList, DBconnection conn)
      throws InvalidFormException, SQLException {
    if (lociList != null) {
      StringTokenizer st = new StringTokenizer(lociList, " ,\t\n\r");
      int periodIndex = 0;
      String locus = null;
      int i = 0;
      boolean firstSearch = true;
      // Use hash code because list can exceed string literal size limit in
      // Oracle
      String insert_query = "GOSLIM_" + lociList.hashCode();
      if (MasterTableInfo.queryIDExists(insert_query, conn)) {
        firstSearch = false;
      }

      String query_id =
        MasterTableInfo.getQueryID(insert_query, conn, getInputSearchType());
      setInputQueryID(query_id);
      if (firstSearch) {
        // Build and parse the SQL INSERT statement.
        conn.setQuery(INSERT_SQL);

        while (st.hasMoreTokens()) {
          i++;
          locus = st.nextToken().toUpperCase();
          // look for a period in the locus string, truncate from the
          // period if it exists and use that as the locus
          periodIndex = locus.indexOf(".");
          if (periodIndex > 0) {
            locus = locus.substring(0, periodIndex);
          }
          // Bind the locus and input query id into the statement.
          conn.setQueryVariable(1, locus);
          conn.setQueryVariable(2, inputQueryID);
          
          // Execute the insert.
          conn.executeUpdate();
        }
      }
      conn.releaseResources();
    }
  }

  // in this situation where we want to categorize against all the
  // unique loci in the LociGoslim_wrk table - rather than a submitted
  // list from the user, we will populate the inputTempTable using a
  // query against the LociGoslim_wrk table. That way all the processing
  // remains the same as when the list is submitted
  private void setList(DBconnection conn) throws InvalidFormException,
      SQLException {
    boolean firstSearch = true;
    String insert_query = getLociListSQL("");
    if (MasterTableInfo.queryIDExists(insert_query, conn)) {
      firstSearch = false;
    }

    String query_id =
      MasterTableInfo.getQueryID(insert_query, conn, getInputSearchType());
    setInputQueryID(query_id);
    if (firstSearch) {
      conn.setQuery("INSERT INTO "
                    + getInputTempTblName()
                    + "(locus_name, query_id, date_last_queried) "
                    + getLociListSQL(query_id));
      conn.executeUpdate();
    }
    conn.releaseResources();
  }

  // insert name from file or textarea into pound table
  // inserts into temp table one at a time
  private void insertLocus(String locus, DBconnection conn) throws SQLException {
    // insert name
    if (conn != null) {
      if (locus != null && locus.length() > 0 && !locus.equals("\r")) {
        StringBuffer sql = new StringBuffer(getInsertSQL());
        sql.append(" ( ");
        sql.append(TextConverter.dbQuote(locus));
        sql.append(", ");
        sql.append(TextConverter.dbQuote(getInputQueryID()));
        sql.append(", CURRENT_DATE ) ");
        conn.setQuery(sql.toString());
        conn.executeUpdate();
      }
    }
  }

  private void storeSlimEntries(DBconnection conn) throws SQLException {
    if (conn != null) {
      boolean firstSearch = true;
      String insert_query = getGOSlimSQL("");
      String query_id = getQueryID();
      conn.setQuery("INSERT INTO "
                    + resultTableName
                    + " ("
                    + getColumnList("all")
                    + ") "
                    + getGOSlimSQL(query_id));
      conn.executeUpdate();
      conn.releaseResources();
    }
  }

  // gets a pooled connection to the database
  private DBconnection getConnection() throws SQLException {
    connectionPool = DBWriteManager.getInstance();
    return connectionPool.getSearchConnection();
  }

  // releases a connection back to the database pool
  private void returnConnection(DBconnection conn) throws SQLException {
    connectionPool.return_connection(conn);
  }

  // returns the input temp table name
  private String getInputTempTblName() {
    return inputTempTblName;
  }

  // sets the parameters that user specified on search form
  private void setParams(Map searchParams) {
    params = searchParams;
  }

  // returns the map object of search params the user entered
  private Map getParams() {
    return params;
  }

  private void setQueryID(String queryID) {
    this.queryID = queryID;
  }

  private void setInputQueryID(String inputQueryID) {
    this.inputQueryID = inputQueryID;
  }

  public String getQueryID() {
    return queryID;
  }

  public String getInputQueryID() {
    return inputQueryID;
  }

  // set the whole genome flag which is an
  // input paramater specified by the user
  private void setWholeGenomeFlag() {
    String mode = null;
    if (getParams().get("mode") != null) {
      mode = (String)getParams().get("mode");
      if (mode.equalsIgnoreCase("whole")) {
        whole = true;
      }
    }
  }

  // returns boolean indicating whether the whole
  // genome was specified as an input parameter
  private boolean useWholeGenome() {
    return whole;
  }

  // returns the column list
  private String getColumnList(String type) {
    String columns =
      " id, slim_name, keyword_type_id, annotation_count, "
          + " loci_count, locus_id, grouping, subgroup, query_id";
    if (type.equalsIgnoreCase("all")) {
      columns = columns + ", date_last_queried ";
    }
    return columns;
  }

  // returns the Vector of download ids
  public Vector<String> getDownloadIDs() throws SQLException {
    Vector<String> ids = new Vector<String>();
    DBconnection conn = null;
    if (resultTableName != null) {
      String sqlText = null;
      try {
        conn = getConnection();
        sqlText = getDownloadIDsSQL();
        conn.setQuery(sqlText);

        ResultSet results = conn.getResultSet();
        while (results.next()) {
          ids.add(results.getString("id"));
        }
        conn.releaseResources();
      } catch (SQLException e) {
        if (sqlText != null) {
          logger.error("Download id query failed: " + sqlText, e);
          throw new RuntimeException("Error getting search result ids from database result table RESULT_GOSLIM: "
                                     + sqlText
                                     + ", "
                                     + e.getMessage());
        }
      } finally {
        if (conn != null)
          returnConnection(conn);
      }
    }
    return ids;
  }

  // store rows with annotation_counts and loci_counts
  private void groupRows(DBconnection conn) throws SQLException {
    if (conn != null) {
      String query_id = getQueryID();
      conn.setQuery("INSERT INTO "
                    + resultTableName
                    + " ("
                    + getColumnList("all")
                    + ") "
                    + getGroupRowsSQL(query_id));
      conn.executeUpdate();
      conn.releaseResources();
    }
  }

  // eleminate redundancies
  private void deleteRows(DBconnection conn, String type) throws SQLException {
    if (conn != null) {
      String query_id = getQueryID();
      conn.setQuery(getDeleteRowsSQL(query_id, type));
      conn.executeUpdate();
      // conn.setQuery( getTTUpdateSQL() );
      conn.executeUpdate();
      conn.releaseResources();
    }
  }

  /*
   * main method for stand alone test
   */
  public static void main(String[] args) {

  }
}
