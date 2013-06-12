// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.11 $
// $Date: 2005/03/02 16:35:39 $
// ------------------------------------------------------------------------------

package org.tair.search;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.Debugger;


/**
 * AnnotationSearcher retrieves annotations ( rows from TairObjKeyEvidence table )
 * according to submitted search parameters. Currently, these may be by keyword,
 * by reference, by tair_object ( gene ) or by locus Search results are stored
 * in a temp table <code>AnnotationTableInfo</code> which is created for a
 * particular user based on session id and search type ( annotation ). For temp
 * table definition see <code>AnnotationTableInfo</code>. AnnotationSearcher
 * only inserts into temp table; creating, deleting and dropping table is done
 * by <code>SearchSession</code>. Selecting from temp table is done by
 * <code>ResultsFetcher</code> via the summary jsp for search results.
 * AnnotationSearcher retrieves the relevant temp table name to use by querying
 * <code>MasterTableInfo</code>.
 */

public class AnnotationSearcher {

  private String tempTblName;
  private final String searchType = "annotation";
  private Map params;
  private DBWriteManager connectionPool;
  private String sessionID;
  private StringBuffer whereBuffer;
  private StringBuffer fromBuffer;
  private boolean hasParentKeyword;
  private Long parentKeywordID;
  private String orderBy;

  /**
   * Default constructor for keyword search page
   */
  public AnnotationSearcher() {
  }


	/**
	* get the unique identifier query line of this search
	* quick search will never have multiple parameters, 
	* so instead of generating the query, we can just return 
	* a unique identifier based on the thing searched
	*/
	public String generateInsertLine( DBconnection conn, Map search_params, String type )
	throws SQLException {                                                      
		String insert_query = "";                                                   
		if (type.equalsIgnoreCase( "form" ) ){
			setParams( (HashMap)search_params );
			insert_query = createSearchSQL( "" );
		} else {
			setParams( (HashMap)search_params );
			insert_query = createSearchSQL( "" );
		}   
		return insert_query;
	}  
  

  /**
   * Creates SQL query using submitted search parameters and stores annotations (
   * entries in TairObjKeyEvidence table ) that match criteria in temp table.
   * Each row in the temp table represents a unique annotation used for display
   * on the summary page. Each column is populated with an annotation attribute
   * cooresponding to the the row's tair_obj_key_evidence_id (column name = ID).
   * Where compound information is associated with one annotation, a unique id
   * is stored to be used for lookup into the appropriate table at the time the
   * complete row's data is requested for display via
   * <code>ResultsFetcher</code>.
   * 
   * @param searchParams Search criteria submitted through the web search form,
   *          stored as field name as a <code>String</code> key referencing
   *          the search value.
   * @param sessionID User's session id. Used to access temp table for user's
   *          individual results.
   * @exception SQLException thrown if a database error occurs.
   */

  public void search(Map searchParams) throws SQLException {
    setParams(searchParams);
    //setSessionID(sessionID);
    //setTempTblName();
    String queryID = (String) searchParams.get( "query_id" );
    processSearch( queryID );
    if (hasParentKeyword) {
      markParentKeyword( queryID );
    }
  }

  /**
   * Return the search type.
   * 
   * @return a string search type
   */
  private final String getSearchType() {
    return searchType;
  }

  /**
   * Return the SQL SELECT clause for the search query.
   * 
   * @return a string containing a SELECT clause
   */
  private final String getSelectClause( String queryID ) {
    String select_clause = " SELECT DISTINCT toke.tairobj_key_evidence_id AS id,"
           + " kt.keywordtype_type AS keyword_category,"
           + " toke.keyword_id AS keyword_id,"
           + " CASE WHEN kd.display IS NULL THEN k.keyword ELSE kd.display END AS keyword,"
           + " toke.tair_object_id AS tair_object_id,"
           + " toke.relationship_type_id AS relationship_type_id,"
           + " toke.evidence_description_id AS evidence_description_id,"
           + " toke.reference_id AS reference_id,"
           + " 'F' AS is_parent_keyword," 
           + " 'other' ";
    if (queryID != null && queryID != "") {
        select_clause = select_clause + ", '" + queryID + "', CURRENT_DATE ";
    }else{
        select_clause = select_clause + ", '', '' ";
    }
    return select_clause;
  }

  /**
   * Set the base SQL FROM clause for the search query. This sets the fromBuffer
   * data member.
   */
  private void setBaseFromClause() {
    fromBuffer = new StringBuffer(" FROM TairObjKeyEvidence toke");
    fromBuffer.append(", KeywordType kt");
    fromBuffer
        .append(", Keyword k LEFT OUTER JOIN KeywordDisplay kd ON k.keyword_id = kd.keyword_id");
  }

  /**
   * Set the base SQL WHERE clause for the search query. This sets the
   * whereBuffer data member.
   */
  private void setBaseWhereClause() {
    whereBuffer =
        new StringBuffer(" WHERE k.keyword_type_id = kt.keyword_type_id AND ");
    whereBuffer.append(" kt.keyword_type_id");
    whereBuffer.append(" NOT IN ( 'user', 'root', 'anat' ) ");
    whereBuffer.append(" AND k.keyword_id = toke.keyword_id ");
  }

  /**
   * Get the customized SQL FROM clause.
   * 
   * @return a string containing a SQL FROM clause
   */
  private String getFromClause() {
    return fromBuffer.toString();
  }

  /**
   * Get the customized SQL WHERE clause.
   * 
   * @return a string containing a SQL WHERE clause.
   */
  private String getWhereClause() {
    return whereBuffer.toString();
  }

  /**
   * Set the base SQL ORDER BY clause for the search query. This sets the
   * orderBy data member.
   */
  private void setOrderByClause() {
    if (getParams().get("keyword_id") != null) {
      orderBy = " ORDER BY 4 "; // order by keyword expression
    } else
      orderBy = " ";
  }

  /**
   * Get the customized SQL ORDER BY clause for the search query.
   * 
   * @return a string containing a SQL ORDER BY clause
   */
  private String getOrderByClause() {
    return orderBy;
  }

	private String getDelete( String queryID ) { 
		return "DELETE FROM " + getTempTblName() + "  WHERE QUERY_ID = '" + queryID + "'";
	}

	private String getTableColumns( String type ) {
		String columns = 
			"id, " + 
			"keyword_category, " + 
			"keyword_id, " + 
			"keyword, " +
			"tair_object_id, " + 
			"relationship_type_id, " + 
			"evidence_description_id, " + 
			"reference_id, " + 
			"is_parent_keyword, " + 
			"annotation_go_po_type, ";
		if ( type.equalsIgnoreCase( "all" ) ) { 
       columns = columns + 
				"query_id, " + 
				"date_last_queried ";
		}
		return columns;
	}

  /**
   * Get the SQL INSERT clause.
   * 
   * @return a string containing the SQL INSERT clause
   */
  private final String getInsertClause() {
    return "INSERT /* APPEND */ INTO " + getTempTblName()
        + "( " + getTableColumns( "all" ) + ") ";
  }

  /**
   * Get a database connection.
   * 
   * @return a database connection from the standard data source.
   * @throws SQLException when there is a problem getting a connection
   */
  private DBconnection getConnection() throws SQLException {
    connectionPool = DBWriteManager.getInstance();
    return connectionPool.getSearchConnection();
  }

  /**
   * Release the database connection. After calling this method, you can no
   * longer use the connection object.
   * 
   * @param conn the database connection object
   * @throws SQLException when there is a problem releasing the connection
   */
  private void returnConnection(DBconnection conn) throws SQLException {
    connectionPool.return_connection(conn);
  }

  /**
   * Get the current temporary table name.
   * 
   * @return a string containing the temp table name
   */
  private String getTempTblName() {
    return "RESULT_ANNOTATION";
  }

  /**
   * Set the search parameters for the search.
   * 
   * @param searchParams a Map of search parameters set by the user
   */
  private void setParams(Map searchParams) {
    params = searchParams;
  }

  /**
   * Get the search parameters for the search.
   * 
   * @return a Map of search parameters.
   */
  private Map getParams() {
    return params;
  }

  /**
   * Create the SQL string for the search using the current SQL components and
   * the parameters; the SQL query inserts the qualifying output rows into the
   * temporary table.
   * 
   * @return a complete SQL string
   * @throws SQLException when there is a problem constructing the WHERE clause
   *           using a query of in-scope qualifiers
   */
  private String createSearchSQL( String queryID ) throws SQLException {
    String keywordID = null;
    String scope = null;
    String referenceID = null;
    String tairObjectID = null;
    setBaseFromClause();
    setBaseWhereClause();
    setOrderByClause();
    // check params, modify From/Where clause as needed
    // to get annotations for a reference from the publication detail page
    if (getParams().get("reference_id") != null) {
      referenceID = (String)getParams().get("reference_id");
      whereBuffer.append(" AND EXISTS ( SELECT 'X' FROM ");
      whereBuffer.append(" Reference_Keyword rk ");
      whereBuffer.append(" WHERE rk.reference_id = toke.reference_id ");
      whereBuffer.append(" AND rk.reference_id = ");
      whereBuffer.append(referenceID);
      whereBuffer.append("  ) ");
    }
    // to get annotations for a keyword from the annotation_count display
    if (getParams().get("keyword_id") != null) {
      if (getParams().get("scope") != null) {
        // will need to create different sql depending on the "scope"
        // ie: 'term', 'child', 'combo' if no scope provided
        // default to 'term' logic
        keywordID = (String)getParams().get("keyword_id");
        scope = (String)getParams().get("scope");
        whereBuffer.append(getKeywordQualification(keywordID, scope));
      } else {
        whereBuffer.append(" AND toke.keyword_id = ");
        whereBuffer.append(keywordID);
      }
    }
    // to get annotations for a gene from the gene detail page
    if (getParams().get("tair_object_id") != null) {
      tairObjectID = (String)getParams().get("tair_object_id");
    }
    if (getParams().get("gene_name") != null) {
      whereBuffer.append(" AND toke.tair_object_id = ");
      whereBuffer.append(tairObjectID);
    }
    // to get annotations for a locus from the locus detail page
    if (getParams().get("locus_name") != null) {
      whereBuffer.append(" AND EXISTS ( SELECT 'X' FROM ");
      whereBuffer.append(" Locus l, ");
      whereBuffer.append(" MapElement_Locus mel, ");
      whereBuffer.append(" Gene g ");
      whereBuffer.append(" WHERE l.locus_id = mel.locus_id ");
      whereBuffer.append(" AND mel.map_element_id = g.map_element_id ");
      whereBuffer.append(" AND ( l.tair_object_id = toke.tair_object_id OR g.tair_object_id = toke.tair_object_id ) ");
      whereBuffer.append(" AND l.tair_object_id = ");
      whereBuffer.append(tairObjectID);
      whereBuffer.append("  ) ");
    }
    //    System.out.println (getInsertClause() + getTempTblName() + getSelectClause()
    //         + getFromClause() + getWhereClause() + getOrderByClause());
    return ( getSelectClause( queryID ) + getFromClause() + getWhereClause() + getOrderByClause());
  }

  /**
   * Builds a keyword expression based on the keyword ID and the scope of the
   * search.
   * 
   * @param keywordID the unique identifier for a keyword
   * @param scope the scope of the search ("children", "combo", "term", or
   *          something else)
   * @return a SQL expression to include in a WHERE clause
   * @throws SQLException when there is a problem querying the information
   *           needed to construct the expression
   */
  private String getKeywordQualification(String keywordID, String scope)
      throws SQLException {
    String kwQual = null;
    StringBuffer inBuffer = new StringBuffer(" AND toke.keyword_id IN (  ");
    String query = null;
    DBconnection conn = null;

    if (scope.equalsIgnoreCase("children")) { // scope = 'child'
      query = "SELECT child_term_id FROM ShortestPath"
        + " WHERE parent_term_id = " + keywordID 
        + " AND child_term_id <> parent_term_id )";
        inBuffer.append( query );

      /*
      try {
        conn = getConnection();
        query =
            "SELECT child_term_id AS child_id" + " FROM ShortestPath"
                + " WHERE parent_term_id = " + keywordID
                + " AND child_term_id <> parent_term_id ";
        conn.setQuery(query);
        ResultSet results = conn.getResultSet();
        int kwCount = 0;
        while (results.next()) {
          if (kwCount > 0)
            inBuffer.append(" , ");
          inBuffer.append(results.getString("child_id"));
          kwCount++;
        }
        conn.releaseResources();
        if (kwCount == 0)
          inBuffer.append(keywordID);
        inBuffer.append(")");
      } finally {
        if (conn != null)
          returnConnection(conn);
      }
        */
      kwQual = inBuffer.toString();
    } else if (scope.equalsIgnoreCase("combo")) { // scope = 'combo'
      hasParentKeyword = true;
      setParentKeywordID(new Long(keywordID));
      query = "SELECT child_term_id FROM ShortestPath"
        + " WHERE parent_term_id = " + keywordID + ")";
      inBuffer.append( query ); 
      /*
      try {
        conn = getConnection();
        query =
            "SELECT child_term_id AS child_id" + " FROM ShortestPath"
                + " WHERE parent_term_id = " + keywordID;
        conn.setQuery(query);
        ResultSet results = conn.getResultSet();
        int kwCount = 0;
        while (results.next()) {
          if (kwCount > 0)
            inBuffer.append(" , ");
          inBuffer.append(results.getString("child_id"));
          kwCount++;
        }
        conn.releaseResources();
        if (kwCount == 0)
          inBuffer.append(keywordID);
        inBuffer.append(")");
      } finally {
        if (conn != null)
          returnConnection(conn);
      }
      */
      kwQual = inBuffer.toString();
    } else { // scope = 'term' or other
      kwQual = " AND toke.keyword_id = " + keywordID;
    }
    return kwQual;
  }

  /**
   * Set the parent keyword identifier.
   * 
   * @param parentKeywordID a unique identifier for a keyword
   */
  private void setParentKeywordID(Long parentKeywordID) {
    this.parentKeywordID = parentKeywordID;
  }

  /**
   * Return the parent keyword identifier.
   * 
   * @return a unique keyword identifier for the parent
   */
  private Long getParentKeywordID() {
    return parentKeywordID;
  }

  /**
   * Mark the parent keyword in the temporary table for later retreival. You
   * need this only when you invoke search with a keyword id and the scope =
   * 'combo', meaning you want to get both the keyword annotations and the
   * annotations of the keywords. Marking the parent in the temp table allows
   * the system to order by parent keyword on the results page.
   * 
   * @throws SQLException when there is a problem executing the update
   */
  private void markParentKeyword( String queryID ) throws SQLException {

    DBconnection conn = null;
    String query =
        "update " + getTempTblName() + " set is_parent_keyword = 'T' "
            + " where QUERY_ID = '" + queryID + "' AND keyword_id = " 
            + getParentKeywordID().toString();
    Debugger.println(Debugger.logMsg(this, " update is_parent_keyword = "
                                           + query));
    try {
      conn = getConnection();
      conn.setQuery(query);
      conn.executeUpdate();
      conn.releaseResources();
    } finally {
      if (conn != null)
        returnConnection(conn);
    }

  }
	
	private void markGoPoType ( String queryID ) throws SQLException {
		DBconnection conn = null;
		String query = 
			"update " + getTempTblName() + " set annotation_go_po_type = 'GO' "
				+ " WHERE ( keyword_category = 'molecular function' "
				+ " OR keyword_category = 'cellular component' " 
				+ " OR keyword_category = 'biological process') "
				+ " AND QUERY_ID = '" + queryID + "' ";
    try {
      conn = getConnection();
      conn.setQuery(query);
      conn.executeUpdate();
      conn.releaseResources();
    } finally {
      if (conn != null)
        returnConnection(conn);
    }
	}
  /**
   * Process the search. This writes the results to the temporary table.
   * 
   * @throws SQLException when there is a problem creating the search SQL
   */
  private void processSearch( String queryID ) throws SQLException {
    writeToTempTbl(createSearchSQL( queryID ), queryID );
  }

  /**
   * Write the results of the query to the temporary table.
   * 
   * @param stmt the SQL statement for the query
   * @throws SQLException when there is a problem running the query
   */
  private void writeToTempTbl(String stmt, String query_id ) throws SQLException {
    Debugger.println(Debugger.logMsg(this, "writeToTempTbl, SQL = " + stmt));
    DBconnection conn = null;
    try {
      conn = getConnection();
      
      //do preliminary table drops first. should never get here, but just in case
      String del_query = getDelete( query_id );
      conn.setQuery( del_query );
      conn.executeUpdate();
      conn.releaseResources();
      
      //populate temp table with results
      String insert_query = getInsertClause() + stmt;
      System.out.println( "annotation insert query : " + insert_query );
      conn.setQuery (insert_query );
      conn.executeUpdate();
    } finally {
      if (conn != null)
        returnConnection(conn);
    }
  }

  /*
   * main method for stand alone test
   */
  public static void main(String[] args) {
  }

}
