// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.37 $
// $Date: 2005/02/10 21:22:43 $
// ------------------------------------------------------------------------------

package org.tair.search;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.Debugger;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.TextConverter;


/**
 * ExpressionSearcher retrieves DualChannel hyb data rows according to submitted
 * search parameters. Search results are stored in a temp table
 * <code>ExpressionTableInfo</code> which is created for a particular user
 * based on session id and search type (expression). For temp table definition
 * see <code>ExpressionTableInfo</code>. ExpressionSearcher only inserts into
 * temp table; creating, deleting and dropping table is done by
 * <code>SearchSession</code>. Selecting from temp table is done by
 * <code>ResultsFetcher</code> via the summary jsp for search results.
 * ExpressionSearcher retrieves the relevant table name to use by querying
 * <code>MasterTableInfo</code>.
 */

public class ExpressionSearcher {

  private String tempTblName;
  private String auxTempTblName;
  private final String searchType = "expression";
  private Map params;
  private DBWriteManager connectionPool;
  private String queryID;
  private String value;
  private String relative;
  private String absolute;
  private String analysisLevel;
  private String error;
  private StringBuffer whereBuffer;
  private StringBuffer fromBuffer;
  private String orderBy;
  private boolean poundTblExists;
  private String poundTblName;
  private String nameTypeQualifier;
  private String nameType;
  private ArrayList nameListArray;

  /**
   * Creates SQL query using submitted search parameters and stores rows that
   * match criteria in temp table. Each row in the temp table represents a
   * unique keyword used for display on the summary page. Each column is
   * populated with a array element attribute cooresponding to the the row's
   * summary hyb data id (column name = ID). Where compound information is
   * associated with one row, a unique id is stored to be used for lookup into
   * the appropriate table at the time the complete row's data is requested for
   * display via <code>ResultsFetcher</code>.
   * 
   * @param searchParams Search criteria submitted through the web search form,
   *          stored as field name as a <code>String</code> key referencing
   *          the search value.
   * @param queryID User's session id. Used to access temp table for user's
   *          individual results.
   * @throws SQLException thrown if a database error occurs.
   * @throws InvalidFormException thrown if invalid or conflicting search
   *           parameters are received
   */
  public void search(Map searchParams, boolean firstSearch) throws SQLException,
      InvalidFormException {
    setParams(searchParams);
    String queryID = (String) searchParams.get( "query_id" );
    setQueryID(queryID);
    if (firstSearch) { 
        processSearch();
    }
  }
  
    /**
    * get the unique identifier query line of this earch. quick
    * search will never have multiple parameters, so instead of 
    * generating the query, we can just return an unique identifier 
    * based on the thing searched
    */
    public String generateInsertLine( DBconnection conn, Map searchParams, String type )
    throws InvalidFormException, SQLException {
        String insert_query = "";
        setParams( (HashMap) searchParams );
        if (type.equalsIgnoreCase( "form" )){
            insert_query = createSearchSQL( conn );
        }else if (type.equalsIgnoreCase( "general" )){
            String searchTerm = (String) getParams().get("searchTerm");
            insert_query = "EXPRESSION_QUICKSEARCH_" + searchTerm.toUpperCase();
        }else{
            insert_query = createSearchSQL( conn );
        }
        return insert_query;
    }

    /**
    * returns the search type
    */
    private final String getSearchType() {
        return searchType;
    }

    private final String getTableColumns() {
        return
        "id, " + 
        "map_element_id, " + 
        "array_element_id, " + 
        "tair_object_id, " + 
        "name, " + 
        "locus, " + 
        "locus_id, " + 
        "rep_genemodel_id, " + 
        "exp_tair_object_id, " + 
        "experiment_name, " + 
        "hyb_desc_id, " + 
        "hyb_desc_name, " + 
        "repl_fold_change, " + 
        "repl_fold_change_stderr, " + 
        "query_id, " + 
        "date_last_queried ";
    }

    /**
    * returns the select clause used for general and expression search
    */
    private final String getSelectClause() {
        String queryID = getQueryID();
        String select =  " SELECT DISTINCT " + " hdes.hyb_desc_id AS id, "
           + " aen.map_element_id AS map_element_id, "
           + " aen.array_element_id AS array_element_id, "
           + " aen.tair_object_id AS tair_object_id, "
           + " aen.display_name AS name, " + " aen.locus AS locus, "
           + " aen.locus_id AS locus_id, "
           + " aen.rep_genemodel_id AS rep_genemodel_id, "
           + " hdes.tair_object_id AS exp_tair_object_id, "
           + " hdes.original_experiment_name AS experiment_name, "
           + " hdes.hyb_desc_id AS hyb_desc_id, "
           + " hdes.hyb_desc_name AS hyb_desc_name, "
           + " dhd.repl_fold_change AS repl_fold_change, "
           + " dhd.repl_fold_change_stderr AS repl_fold_change_stderr ";
        if ( queryID != null && queryID != ""){
            select = select +
            ", '" + queryID + "', CURRENT_DATE ";
        }else{
            select = select +
            ", '', '' ";
        }
        return select;
    }

  /**
   * sets the base from clause used for search
   */
  private void setBaseFromClause() {
    fromBuffer =
        new StringBuffer(
                         " FROM DualChannelHybData dhd, ArrayElementNameAlias aen ");
    fromBuffer.append(", HybDataDescExprSet_wrk hdes ");
  }

  /**
   * sets the base where clause used for search
   */
  private void setBaseWhereClause() {
    whereBuffer =
        new StringBuffer(" WHERE dhd.array_element_id = aen.array_element_id ");
    whereBuffer.append(" AND dhd.hyb_data_id = hdes.hyb_data_id");
  }

  // returns the customized from clause for the search
  private String getFromClause() {
    return fromBuffer.toString();
  }

  // returns the customized where clause for the search
  private String getWhereClause() {
    return whereBuffer.toString();
  }

  // returns the insert clause used for search
  private final String getInsertClause() {
    return "INSERT /*+ APPEND */ INTO RESULT_EXPRESSION ";
  }
  
  // returns delete clause used for search, in case there is data in result table that
  // shouldn't be there
  private final String getDelete() {
    String del_query =
        " DELETE FROM RESULT_EXPRESSION WHERE QUERY_ID = '" + getQueryID() + "' ";
        return del_query;
  }

  // sets the orderBy clause used for search
  private void setOrderByClause() {
    // init it to empty string
    orderBy = " ";
    if (getParams().get("order") != null) {
      if (((String)getParams().get("order")).equalsIgnoreCase("name")) {
        orderBy = " ORDER BY aen.display_name ";
      } else if (((String)getParams().get("order")).equalsIgnoreCase("locus")) {
        orderBy = " ORDER BY aen.locus ";
      } else if (((String)getParams().get("order"))
          .equalsIgnoreCase("repl_fold_change")) {
        orderBy = " ORDER BY abs( " + getAnalysisLevel("value") + " ) desc ";
      } else if (((String)getParams().get("order"))
          .equalsIgnoreCase("experiment_name")) {
        orderBy = " ORDER BY hdes.original_experiment_name ";
      } else {
        System.out.println("bad orderBy value: " + getParams().get("order"));
      }
    }
  }

  // returns the orderBy clause used for search
  private String getOrderByClause() {
    return orderBy;
  }

  /**
   * returns the create SQL used to create a pound table used to store the loci
   * or element names from a textarea or a file
   */
  /*
  private final String getCreateSQL() {
    return " CREATE GLOBAL TEMPORARY TABLE " + getPoundTblName() 
        + " ( name varchar(20) ) "
        + " ON COMMIT DELETE ROWS ";
  }
  */
  /**
   * Returns the insert clause used to populate element names or loci into a
   * pound temp table from a textarea or a file
   */
  private final String getInsertSQL() {
    return " INSERT INTO " + getPoundTblName() + " VALUES ";
  }

  // returns the drop SQL used to drop a pound table used to store the loci or
  // element names
  // from a textarea or a file
  /*
  private final String getDropSQL() {
    return " DROP TABLE " + getPoundTblName();
  }
  private final String getTruncateSQL() {
    return " TRUNCATE TABLE " + getPoundTblName();
  }
    */
  // gets a pooled connection to the database
  private DBconnection getConnection() throws SQLException {
    connectionPool = DBWriteManager.getInstance();
    return connectionPool.getSearchConnection();
  }

  // releases a connection back to the database pool
  private void returnConnection(DBconnection conn) throws SQLException {
    connectionPool.return_connection(conn);
  }

  // sets the pound table name
  /*
  private void setPoundTblName() {
    Integer id = null;
    Random generator = new Random(System.currentTimeMillis());
    id = new Integer(generator.nextInt(999));
    poundTblName = "NL" + id.toString();
  }
    */
  // returns the pound table name
  private String getPoundTblName() {
    //return poundTblName;
    return "ExpressionNames";
  }

  // sets the parameters that user specified on search form
  private void setParams(Map searchParams) {
    params = searchParams;
  }

  // returns the map of search params the user entered
  private Map getParams() {
    return params;
  }

  // adds an element to the param map that is a camma delimted list of
  // elements or loci that did not contribute to the result set
  @SuppressWarnings("unchecked")
  private void setNTFListParam(DBconnection conn) throws SQLException {
    String query = null;

    // notExists query against temp table and pound table to set this
    // param - need to know name type, name or locus
    if (getNameType() != null) {
      if (getNameType().equalsIgnoreCase("element")) {

        // check for aliases also -- join to ArrayElementNameAlias
        // to check if the name was found
        query =
            "SELECT pt.name AS name " + "FROM " + getPoundTblName() + " pt "
                + "WHERE NOT EXISTS (" + "SELECT 'X' " + "FROM "
                + "RESULT_EXPRESSION tt, ArrayElementNameAlias aen "
                + "WHERE tt.QUERY_ID = '" + getQueryID() + "' " 
                + "AND tt.name = aen.display_name "
                + "AND aen.name  = pt.name " + ")";

      } else if (getNameType().equalsIgnoreCase("locus")) { // straight up
        query =
            "SELECT pt.name AS name FROM " + getPoundTblName()
                + " pt WHERE NOT EXISTS ( SELECT 'X' FROM "
                + " RESULT_EXPRESSION tt WHERE tt.QUERY_ID = '" + getQueryID() + "' "
                + " AND tt.locus  = pt.name )";
      }
      Debugger.println(Debugger.logMsg(this, "ntf SQL = " + query));
      conn.setQuery(query);

      ResultSet results = conn.getResultSet();
      if (results.next()) {
        getParams().put("hasNTFs", new Boolean(true));
      } else {
        getParams().put("hasNTFs", new Boolean(false));
      }
    }
  }

  // sets the session id
  private void setQueryID(String queryID) {
    this.queryID = queryID;
  }

  // returns the session id
  private String getQueryID() {
    return queryID;
  }

  // sets the value param
  private void setValue(String value) {
    this.value = value;
  }

  // returns the value param
  private String getValue() {
    String processedValue = null;
    if (value.equals("1-2")) {
      String lowValue = "1";
      String highValue = "2";
      if (getRelative() != null && value != null) {
        if (getRelative().equalsIgnoreCase("any")) {
          processedValue =
              " AND ( ( " + getAnalysisLevel("value") + " BETWEEN " + lowValue
                  + " AND " + highValue + " ) OR ( "
                  + getAnalysisLevel("value") + " BETWEEN -" + highValue
                  + " AND -" + lowValue + " ) ) ";

        } else if (getRelative().equalsIgnoreCase("up")) {
          processedValue =
              " AND " + getAnalysisLevel("value") + " BETWEEN " + lowValue
                  + " AND " + highValue;

        } else if (getRelative().equalsIgnoreCase("down")) {
          processedValue =
              " AND " + getAnalysisLevel("value") + " BETWEEN -" + highValue
                  + " AND -" + lowValue;

        } else if (getRelative().equalsIgnoreCase("unchanged")) {
          processedValue =
              " AND " + getAnalysisLevel("value") + " BETWEEN -1.50 AND 1.50 ";
        }
      }
    } else { // all other values
      if (getRelative() != null && value != null) {
        if (getRelative().equalsIgnoreCase("any")) {
          processedValue =
              " AND ( " + getAnalysisLevel("value") + " >= " + value + " OR "
                  + getAnalysisLevel("value") + " <= -" + value + " ) ";

        } else if (getRelative().equalsIgnoreCase("up")) {
          processedValue = " AND " + getAnalysisLevel("value") + " >= " + value;

        } else if (getRelative().equalsIgnoreCase("down")) {
          processedValue =
              " AND " + getAnalysisLevel("value") + " <= -" + value;

        } else if (getRelative().equalsIgnoreCase("unchanged")) {
          processedValue =
              " AND " + getAnalysisLevel("value") + " BETWEEN -1.50 AND 1.50 ";
        }
      }
    }
    return processedValue;
  }

  // sets the relative param
  private void setRelative(String relative) {
    this.relative = relative;
  }

  // returns the relativen param
  private String getRelative() {
    return relative;
  }

  // sets the error param
  private void setError(String error) {
    this.error = error;
  }

  // returns the error param
  private String getError() {
    String processedError = null;
    if (error != null) {
      if (error.equalsIgnoreCase("any")) {
        processedError = " ";
      } else {
        processedError = " AND " + getAnalysisLevel("error") + error;
      }
    }
    return processedError;
  }

  // sets the sql column for the designated analysis level param
  private void setAnalysisLevel(String analysisLevel) {
    this.analysisLevel = analysisLevel;
  }

  // returns the column name appropriate for the analysisLevel param
  private String getAnalysisLevel(String type) {
    String column = null;
    if (analysisLevel != null && type != null) {
      if (analysisLevel.equalsIgnoreCase("element")) {
        if (type.equalsIgnoreCase("value")) {
          column = " dhd.fold_change ";
        } else if (type.equalsIgnoreCase("error")) {
          column = " dhd.fold_change_stderr ";
        }
      } else if (analysisLevel.equalsIgnoreCase("replicate")) {
        if (type.equalsIgnoreCase("value")) {
          column = " dhd.repl_fold_change ";
        } else if (type.equalsIgnoreCase("error")) {
          column = " dhd.repl_fold_change_stderr ";
        }
      }
    }
    return column;
  }

  // sets the absolute param
  private void setAbsolute(String absolute) {
    this.absolute = absolute;
  }

  // returns the absolute param
  private String getAbsolute() {
    return absolute;
  }

  /**
   * turns the search parameter entries into a sql search string that will be
   * used for the search
   */
  private String createSearchSQL(DBconnection conn)
      throws InvalidFormException, SQLException {

    setBaseFromClause();
    setBaseWhereClause();
    // append from and where clauses based on params from expression_form
    applyExpressionValueOptions();// will provide some defaults at a minimum
    applyArrayDesignOption();
    applyNameSearch(conn);
    applyAuxillarySearch();
    setOrderByClause();
    return (getSelectClause() + getFromClause() + getWhereClause());
    // + getOrderByClause());
  }

  /**
   * convert user designated options (parameters from expression_form jsp) into
   * additions to the 'where' clause in the search sql
   */
  private void applyNameSearch(DBconnection conn) throws InvalidFormException,
      SQLException {

    // for name searching, check the radiobutton option
    if (getParams().get("input") != null) { // name input option equals "wild"
      String nameInput = (String)getParams().get("input");
      if (nameInput.equalsIgnoreCase("wild")) {
        if (getParams().get("expression_term") != null) {
          generateNameSql((String)getParams().get("expression_name_type"),
                          (String)getParams().get("expression_term"));
        }
      } else { // name input option equals "list"
        if ((getParams().get("names") != null)
            || (getParams().get("file") != null)) {

          if (getParams().get("listNameType") != null) {
            // set name type qualifier - same for textbox and file
            setNameTypeQualifier((String)getParams().get("listNameType"));

            // get delimited list of names from textarea or file
            String delimitedNames = null;

            // textarea contents preferred if both supplied
            if (getParams().get("names") != null) {
              delimitedNames = (String)getParams().get("names");

              // else get list of names from a file -- exception
              // will be thrown if any errors occur while reading file
            } else if (getParams().get("file") != null) {
              delimitedNames = readNameFile((File)getParams().get("file"));
            }

            // parse delimited list of names into array list and
            // set internal reference to name array - exception will
            // be thrown if invalid number of names received (i.e. too
            // many or not enough)
            setNameListArray(parseNameList(delimitedNames));

            // create pound table to hold the list of names and insert
            // all names received from either textbox or file.
            insertNames(conn);

            fromBuffer.append("," + getPoundTblName());
            whereBuffer.append(" AND " + getNameTypeQualifier());
            whereBuffer.append(" = " + getPoundTblName() + ".name ");
          }
        }
      }
    }
  }

  /**
   * do not include thetable prefix here since this is uses to build the main
   * query sql, which uses aen prefix and also in building the not found sql
   * which uses the temp table prefix
   */
  private void setNameTypeQualifier(String nameType) {
    if (nameType != null) {
      this.nameType = nameType;
      if (nameType.equals("element")) {
        nameTypeQualifier = "aen.name";
      } else if (nameType.equals("locus")) {
        nameTypeQualifier = "aen.locus";
      }
    }
  }

  private String getNameTypeQualifier() {
    return nameTypeQualifier;
  }

  private String getNameType() {
    return nameType;
  }

  // creates the pound table needed to hold the names from the textarea or file
  private void createPoundTbl(DBconnection conn) throws SQLException {
    /*
    if (!poundTblExists) {
      setPoundTblName();
      conn.setQuery(getCreateSQL());
      conn.executeUpdate();
      conn.releaseResources();
      poundTblExists = true;
    }
    */
      poundTblExists = true;
  }

  /**
   * Create pound table to hold names and insert names from nameListArray
   */
  private void insertNames(DBconnection conn) throws SQLException {
    createPoundTbl(conn);

    // insert names
    String nameValue = null;
    for (int i = 0; i < getNameListArray().size(); i++) {
      if (getNameListArray().get(i) != null) {
        nameValue =
            " ( " + TextConverter.dbQuote((String)getNameListArray().get(i))
                + " ) ";
        conn.setQuery(getInsertSQL() + nameValue);
        // Debugger.println( "# insert: " + getInsertSQL() + nameValue );
        conn.executeUpdate();
        conn.releaseResources();
      }
    }

  }

  // drops the pound table needed to hold the names from the textarea or file
  /*
  private void dropPoundTbl(DBconnection conn) throws SQLException {
    if (poundTblExists) {
      //since it's temporary table. need to truncate and then drop.
      conn.setQuery(getTruncateSQL());
      conn.executeUpdate();
      conn.releaseResources();

      conn.setQuery(getDropSQL());
      conn.executeUpdate();
      conn.releaseResources();
      poundTblExists = false;
    }
  }
    */

  /**
   * Set value of array element/locus name list
   */
  private void setNameListArray(ArrayList nameList) {
    this.nameListArray = nameList;
  }

  /**
   * Reads contents of file uploaded through expression search form and creates
   * a single string containing all lines of file. This string can then be used
   * as input to the parseNameList method for parsing out element names
   * individually. This is done in two steps so the parsing code can be written
   * to handle input both from file as well as from textarea on web form.
   * Additionally, since there are multiple delimiters that are acceptable for
   * separating element names, it's best to just join all lines together here
   * and pass string along.
   * 
   * <p>
   * Method is offered as a static method that returns String so that it can be
   * used for validating the file upload submitted when search form is being
   * updated (without executing search) as well as by Searcher when search is
   * being performed.
   */
  public static String readNameFile(File uploadedFile)
      throws InvalidFormException {

    String nameStr = null;

    if (uploadedFile != null) {
      StringBuffer nameBuffer = new StringBuffer();

      try {
        FileReader fs = new FileReader(uploadedFile);
        BufferedReader in = new BufferedReader(fs);

        String s = null;
        while ((s = in.readLine()) != null) {
          nameBuffer.append(s + "\n");
        }
        in.close();
      } catch (FileNotFoundException fnfe) {
        throw new InvalidFormException("Uploaded file not found error: "
                                       + uploadedFile.toString());
      } catch (IOException ioe) {
        throw new InvalidFormException("Uploaded file error: "
                                       + uploadedFile.toString()
                                       + "uploadedFile.exists(): "
                                       + uploadedFile.exists()
                                       + "uploadedFile.length(): "
                                       + uploadedFile.length());
      }

      nameStr = nameBuffer.toString();
    }
    return nameStr;
  }

  /**
   * Parses submitted string into a list of element names for searching.
   * Submitted string is assumed to contain element names delimited by
   * whitespace, commas, tabs or hard returns ( ,\t\n). InvalidFormException
   * will be thrown number of submitted names is greater than maximum allowed
   * (currently 10), as well as if submitted name string contains no names.
   * 
   * <p>
   * This method is offered as a static method that returns the list so it can
   * be used by ExpressionSearchHandler for validating submissions when updating
   * the form view (without executing search) as well as by searcher itself for
   * parsing values and actually doing search.
   * 
   * @param nameListStr String containing element names for searching separated
   *          by valid delimites
   * @return List containing all names parsed from submitted string
   * @throws InvalidFormException if zero or more than 100 names are contained
   *           within nameListStr
   */
  public static ArrayList parseNameList(String nameListStr)
      throws InvalidFormException {

    ArrayList<String> nameList = new ArrayList<String>();

    if (nameListStr != null) {
      StringTokenizer st = new StringTokenizer(nameListStr, " ,\t\n");

      int maxNum = 10;

      int numNames = st.countTokens();
      if (numNames > maxNum) {
        throw new InvalidFormException("Exceeded maximum number of elements "
                                       + "or loci which is set to : " + maxNum);
      }

      if (numNames == 0) {
        throw new InvalidFormException("No data provided in the file ");
      }

      String name = null;
      while (st.hasMoreTokens()) {
        name = st.nextToken().toUpperCase();
        if (!nameList.contains(name)) {
          nameList.add(name);
        }
      }
    }

    return nameList;
  }

  // returns the list of names parsed from the textarea or a file
  private ArrayList getNameListArray() {
    return nameListArray;
  }

  private void generateNameSql(String nameType, String term) {
    if (term != null) {
      if (nameType.equals("name")) {
        whereBuffer.append(" AND aen.name = ");
        whereBuffer.append(TextConverter.dbQuote(term.toUpperCase()));
      } else if (nameType.equals("locus")) {
        whereBuffer.append(" AND aen.locus = ");
        whereBuffer.append(TextConverter.dbQuote(term.toUpperCase()));
      } else if (nameType.equals("genbank")) {
        whereBuffer
            .append(" AND EXISTS ( SELECT 'X' FROM ArrayElementGenBankAcc_wrk aegb");
        whereBuffer
            .append(" WHERE aen.array_element_id = aegb.array_element_id ");
        whereBuffer.append(" AND aegb.gen_bank_accession = ");
        whereBuffer.append(TextConverter.dbQuote(term.toUpperCase()));
        whereBuffer.append(" ) ");
      } else if (nameType.equals("gene")) {
        whereBuffer.append(" AND EXISTS ( SELECT 'X' FROM Locus l ");
        whereBuffer.append(" , MapElement_Locus mel ");
        whereBuffer.append(" , GeneNameAlias gna ");
        whereBuffer.append(" WHERE aen.locus_id = l.locus_id ");
        whereBuffer.append(" AND mel.locus_id = l.locus_id ");
        whereBuffer.append(" AND gna.map_element_id = mel.map_element_id ");
        whereBuffer.append(" AND gna.name = ");
        whereBuffer.append(TextConverter.dbQuote(term.toUpperCase()));
        whereBuffer.append(" ) ");
      }
    }
  }

  /**
   * convert user designated options (parameters from form jsp) into additions
   * to the 'from' and 'where' clauses in the search sql -- this is for a single
   * select drop down menus
   */
  private void applyExpressionValueOptions() {
    if (getParams().get("analysis_level") != null) {
      setAnalysisLevel((String)getParams().get("analysis_level"));
    }

    // needs processing in get method
    if (getParams().get("absolute") != null) {
      setAbsolute((String)getParams().get("absolute"));
    }

    if (getParams().get("relative") != null) {
      setRelative((String)getParams().get("relative"));
    }

    if (getParams().get("value") != null) {
      setValue((String)getParams().get("value"));
    }

    // needs processing in set method based on getRelative()
    if (getParams().get("error") != null) {
      setError((String)getParams().get("error"));
    }

    // needs processing in set method
    whereBuffer.append(getExpressionValueQualification());
  }

  /**
   * based on user input build the expression value qualification for the where
   * clause
   */
  private String getExpressionValueQualification() {
    StringBuffer qualBuffer = new StringBuffer(" ");
    if (getAbsolute() != null) {
      if (getAbsolute().equalsIgnoreCase("expressed")) {
        qualBuffer.append(" AND dhd.ch1_signal >= 350 "
                          + " AND dhd.ch2_signal >= 350 ");
      } else if (getAbsolute().equalsIgnoreCase("not expressed")) {
        qualBuffer.append(" AND  ( dhd.ch1_signal < 350 ");
        qualBuffer.append(" OR  dhd.ch2_signal < 350  ) ");
      }
    }
    if (getAnalysisLevel("value") != null && getValue() != null) {
      qualBuffer.append(getValue());
    }

    if (getAnalysisLevel("error") != null && getError() != null) {
      qualBuffer.append(getError());
    }

    return qualBuffer.toString();
  }

  /**
   * convert user designated options (parameters from form jsp) into additions
   * to the 'from' and 'where' clauses in the search sql -- this is for a multi
   * select drop down menu
   */
  private void applyArrayDesignOption() {

    String[] params = (String[])getParams().get("design");
    if (params != null) {
      List<String> selected = Arrays.asList(params);
      if (selected != null && selected.size() > 0
          && !selected.get(0).equalsIgnoreCase("any")) {

        String predicate = getMultiSelectorPredicate(selected);

        setOptionQualifier("design");
        whereBuffer.append(predicate);
        whereBuffer.append(" ) ");
      }
    }
  }

  /**
   * build the sql for the predicate part of the 'where' clause based on
   * selected options
   */
  private String getMultiSelectorPredicate(List<String> options) {
    StringBuilder in_buffer = new StringBuilder(" IN (  ");

    String sep = ""; // no separator first time through
    for (String s : options) {
      in_buffer.append(sep);
      in_buffer.append(TextConverter.dbQuote(s));
      sep = ", ";
    }
    in_buffer.append(" ) ");

    return in_buffer.toString();
  }

  /**
   * build the sql for the 'from' and 'where' clauses based on a particular
   * option type
   */
  private void setOptionQualifier(String optionType) {
    if (optionType.equals("design")) {
      whereBuffer
          .append(" AND EXISTS ( "
                  + " SELECT 'X' FROM HybData hd, HybDescription hds, ArrayDesign ad ");
      whereBuffer.append(" WHERE hdes.hyb_data_id = hd.hyb_data_id ");
      whereBuffer
          .append(" AND hd.hyb_description_id = hds.hyb_description_id ");
      whereBuffer.append(" AND hds.array_design_id = ad.array_design_id ");
      whereBuffer.append(" AND ad.name ");
    }
  }

  /**
   * check to see if auxillary search results need to be incorporated into the
   * search sql in this specific case - is experiment search criteria were
   * specified then an auxSearchType parameter will have been provided -- the
   * temp table can then be derived( search type + session id ) and joined to
   * the main query
   */
  private void applyAuxillarySearch() {
    String searchType = null;
    if (getParams().get("auxSearchType") != null) {
      String auxQueryID = (String)getParams().get("aux_query_id");
      whereBuffer.append(" AND EXISTS ( SELECT 'X' FROM RESULT_EXPR att");
      whereBuffer.append(" WHERE att.QUERY_ID = '" + auxQueryID + "' ");
      whereBuffer.append(" AND att.tair_object_id = hdes.tair_object_id ) ");
    }
  }

  // invokes a method to write the results of the search sql to the temp table
  private void processSearch() throws SQLException, InvalidFormException {
    DBconnection conn = null;
    try {
      conn = getConnection();
      String stmt = createSearchSQL(conn);
      // Debugger.println( Debugger.logMsg( this, " SQL = " + stmt ) );
      writeToTempTbl(conn, stmt);
      if (poundTblExists) {
        setNTFListParam(conn);
        //dropPoundTbl(conn);
      }
    } finally {
      if (conn != null)
        returnConnection(conn);
    }
  }

  // writes search results to temp table
  private void writeToTempTbl(DBconnection conn, String stmt)
      throws SQLException {
    Debugger.println(Debugger.logMsg(this, "writeToTempTbl, SQL = " + stmt));
    
    //do preliminary drops first. should never get here but just in case
    String del_query = getDelete();
    conn.setQuery( del_query );
    conn.executeUpdate();
    conn.releaseResources();

    String insert_query = getInsertClause() + "( " + getTableColumns() + ") " + stmt;
    conn.setQuery(insert_query);
    conn.executeUpdate();
    conn.releaseResources();
  }

}
