// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.21 $
// $Date: 2005/05/03 19:12:38 $
// ------------------------------------------------------------------------------

package org.tair.tfc;


import java.sql.*;
import java.util.*;

import org.tair.utilities.*;


/**
 * This class maps to the table Keyword in the tair database. Each instance maps
 * one row of data in Keyword table. Each data object maps to one field of a row
 * in the table. Each field has one set method and one get method for accessing
 * from outside of class.
 */

public class TfcKeyword {

  private Long keyword_id;
  private String keyword_type_id;
  private String keyword;
  private String keyword_uc;
  private String definition;
  private String note;
  private String def_source;
  private String extdb_id;
  private java.util.Date date_last_modified;
  private String has_direct_links;
  private String has_child_links;
  private Long pub_id;
  private String keyword_type;
  private String keyword_type_display;
  private String type_definition;
  private static Map<String, Long> aspects;

  /**
   * Creates an empty instance of TfcKeyword
   */
  public TfcKeyword() {
  }

  /**
   * Creates an instance of TfcKeyword that reflects the data referenced by
   * submitted keyword_id
   * 
   * @param conn An active connection to the database
   * @param keyword_id Keyword id to retrieve data for
   * @throws SQLException thrown if a database error occurs
   */
  public TfcKeyword(DBconnection conn, Long keyword_id) throws SQLException {

    String query =
        "SELECT kw.keyword_id AS kw_id, "
            + "kw.keyword_type_id AS kw_type_id, " + "kw.keyword AS kw, "
            + "kw.keyword_uc AS kw_uc, " + "kw.definition AS kw_def, "
            + "kd.note AS kw_note, " + "kw.def_source AS kw_def_source, "
            + "kw.extdb_id AS extdb_id, "
            + "kw.date_last_modified AS date_last_modified, "
            + "kw.has_direct_links AS has_direct_links, "
            + "kw.has_child_links AS has_child_links, "
            + "kw.pub_id AS pub_id, " + "kwt.keywordtype_type AS kw_type, "
            + "kwt.display AS kw_type_display, "
            + "kwt.definition AS kw_type_def "
            + "FROM Keyword kw LEFT OUTER JOIN "
            + "KeywordDisplay kd ON kw.keyword_id = kd.keyword_id JOIN "
            + "KeywordType kwt ON kw.keyword_type_id = kwt.keyword_type_id "
            + "WHERE kw.keyword_id = ?";

    conn.setQuery(query);
    conn.setQueryVariable(keyword_id);

    ResultSet results = conn.getResultSet();
    if (results.next()) {
      long id = 0;
      this.keyword_id = new Long(results.getLong("kw_id"));
      keyword_type_id = results.getString("kw_type_id");
      keyword = results.getString("kw");
      keyword_uc = results.getString("kw_uc");
      definition = results.getString("kw_def");
      note = results.getString("kw_note");
      def_source = results.getString("kw_def_source");
      extdb_id = results.getString("extdb_id");
      date_last_modified = results.getDate("date_last_modified");
      has_direct_links = results.getString("has_direct_links");
      has_child_links = results.getString("has_child_links");
      id = results.getLong("pub_id");
      if (!results.wasNull())
        pub_id = new Long(id);
      keyword_type = results.getString("kw_type");
      keyword_type_display = results.getString("kw_type_display");
      type_definition = results.getString("kw_type_def");
    }
    conn.releaseResources();
  }

  public void set_keyword_id(Long value) {
    keyword_id = value;
  }

  public Long get_keyword_id() {
    return keyword_id;
  }

  public void set_keyword_type_id(String value) {
    keyword_type_id = value;
  }

  public String get_keyword_type_id() {
    return keyword_type_id;
  }

  public void set_keyword(String value) {
    keyword = value;
  }

  public String get_keyword() {
    return keyword;
  }

  public void set_keyword_uc(String value) {
    keyword_uc = value;
  }

  public String get_keyword_uc() {
    return keyword_uc;
  }

  public void set_definition(String value) {
    definition = value;
  }

  public String get_definition() {
    return definition;
  }

  public void set_note(String value) {
    note = value;
  }

  public String get_note() {
    return note;
  }

  public void set_def_source(String value) {
    def_source = value;
  }

  public String get_def_source() {
    return def_source;
  }

  public void set_extdb_id(String value) {
    extdb_id = value;
  }

  public String get_extdb_id() {
    return extdb_id;
  }

  public void set_date_last_modified(java.util.Date value) {
    date_last_modified = value;
  }

  public java.util.Date get_date_last_modified() {
    return date_last_modified;
  }

  public void set_has_direct_links(String value) {
    has_direct_links = value;
  }

  public String get_has_direct_links() {
    return has_direct_links;
  }

  public void set_has_child_links(String value) {
    has_child_links = value;
  }

  public String get_has_child_links() {
    return has_child_links;
  }

  public void set_pub_id(Long value) {
    pub_id = value;
  }

  public Long get_pub_id() {
    return pub_id;
  }

  public void set_keyword_type(String value) {
    keyword_type = value;
  }

  public String get_keyword_type() {
    return keyword_type;
  }

  public void set_keyword_type_display(String value) {
    keyword_type_display = value;
  }

  public String get_keyword_type_display() {
    return keyword_type_display;
  }

  public void set_type_definition(String value) {
    type_definition = value;
  }

  public String get_type_definition() {
    return type_definition;
  }

  /**
   * Utility method to retrieve keyword values for submitted list of keyword
   * ids. This is useful for quickly translating submitted values from a search
   * form into string values needed for display. In many situations, searching
   * using primary key values such as keyword id can be more efficient than
   * searching by the string literal, making the expense of this manual
   * translation worthwhile.
   * 
   * @param conn An active connection to the database
   * @param keywordIDs List of keyword ids to translate
   * @return String array of keywords for keywordIDs, or <code>null</code> if
   *         no keywords found for submitted ids. Returned ids will be in
   *         alphabetical order by keyword.
   * @throws SQLException thrown if a database error occurs
   */
  public static String[] translateKeywordIDs(DBconnection conn,
                                             List<Long> keywordIDs)
      throws SQLException {

    ArrayList keywords = null;
    String[] translated = null;

    StringBuffer query = new StringBuffer();
    query.append("SELECT keyword " + "FROM Keyword " + "WHERE keyword_id IN (");
    String sep = ""; // empty separator first time through
    for (Long id : keywordIDs) {
        query.append(sep);
      query.append(id);
      sep = ", ";
    }
    query.append(") ORDER BY keyword ");

    conn.setQuery(query.toString());
    ResultSet results = conn.getResultSet();
    while (results.next()) {
      if (keywords == null) {
        keywords = new ArrayList();
      }
      keywords.add(results.getString("keyword"));
    }
    conn.releaseResources();

    if (keywords != null && !keywords.isEmpty()) {
      translated = new String[keywords.size()];
      translated = (String[])keywords.toArray(translated);
    }
    return translated;
  }

  /**
   * Utility method to retrieve keyword id for submitted keyword literal value
   * and type
   * 
   * @param conn An active connection to the database
   * @param keyword Keyword to find id for
   * @param type keyword_type to find id for
   * @return a list of keyword id for submitted keyword and type, or
   *         <code>null</code> if keyword not found in the database
   */
  public static List retrieveKeywordID(DBconnection conn, String keyword,
                                       String type) throws SQLException {

    List ids = new ArrayList();

    String query =
        "SELECT keyword_id " + "FROM Keyword " + "WHERE keyword_uc = "
            + TextConverter.dbQuote(keyword.toUpperCase())
            + " AND keyword_type_id = " + TextConverter.dbQuote(type);

    conn.setQuery(query);

    ResultSet results = conn.getResultSet();
    if (results.next()) {
      ids.add(new Long(results.getLong("keyword_id")));
    }
    conn.releaseResources();

    return ids;
  }

  /**
   * Copies all member variable values from this keyword instance to submitted
   * keyword. This is useful for quickly cloning a keyword instance. This method
   * is implemented manually instead using Object.clone() to allow for this
   * facility in microarray loading where target keyword is actually a sub-class
   * of TfcKeyword
   * 
   * @param targetKeyword Keyword to copy all data into
   */
  public void copyInto(TfcKeyword targetKeyword) {
    targetKeyword.set_keyword_id(get_keyword_id());
    targetKeyword.set_keyword_type_id(get_keyword_type_id());
    targetKeyword.set_keyword(get_keyword());
    targetKeyword.set_keyword_uc(get_keyword_uc());
    targetKeyword.set_definition(get_definition());
    targetKeyword.set_note(get_note());
    targetKeyword.set_def_source(get_def_source());
    targetKeyword.set_extdb_id(get_extdb_id());
    targetKeyword.set_date_last_modified(get_date_last_modified());
    targetKeyword.set_has_direct_links(get_has_direct_links());
    targetKeyword.set_has_child_links(get_has_child_links());
    targetKeyword.set_pub_id(get_pub_id());
    targetKeyword.set_keyword_type(get_keyword_type());
    targetKeyword.set_keyword_type_display(get_keyword_type_display());
    targetKeyword.set_type_definition(get_type_definition());
  }

  /**
   * Utility method to create a map of top level aspect terms ie,
   * cellular_component to its keyword_id
   * 
   * @param conn An active connection to the database
   * @throws SQLException thrown if a database error occurs
   */
  public static void setAspects() throws SQLException {
    DBReadManager connectionPool = null;
    DBconnection conn = null;
    String sql =
        "SELECT k1.keyword_id AS kw_id, k1.keyword AS kw " +
          "FROM Keyword k1 JOIN " +
               "TermRelationship tr ON k1.keyword_id = tr.child_term_id JOIN " +
               "Keyword k2 ON tr.parent_term_id = k2.keyword_id " +
         "WHERE k2.keyword_type_id = 'root'";
    if (aspects == null) {
      aspects = new HashMap<String, Long>();
      try {
        connectionPool = DBReadManager.getInstance();
        conn = connectionPool.get_connection();
        conn.setQuery(sql);
        ResultSet results = conn.getResultSet();
        while (results.next()) {
          aspects.put(results.getString("kw"), new Long(results
              .getLong("kw_id")));
        }
        conn.releaseResources();
      } finally {
        if (conn != null) {
          DBReadManager.return_connection(conn);
        }
      }
    }
  }

  /**
   * Utility method to retreive top level aspect ids given a term ie, give the
   * keyword id of cellular_component
   * 
   * @param String term String representation of the term to get the id for
   */
  public static Long getAspectID(String term) {
    Long aspectID = null;
    if (aspects != null) {
      if (term != null) {
        aspectID = (Long)aspects.get(term);
      }
    }
    return aspectID;
  }


    /**
     * Retrieves the keywords for a given locus
     *
     */
public static List retrieveKeywords( DBconnection conn, String tair_object_id ) 
throws SQLException {
	return retrieveKeywords(conn, tair_object_id, "basic");
}
    
public static List retrieveKeywords( DBconnection conn, String tair_object_id, String flag ) 
throws SQLException {
	return retrieveKeywords(conn, tair_object_id, flag, "all");
}    
public static List retrieveKeywords( DBconnection conn, String tair_object_id, String flag, String keyword_type ) 
	throws SQLException {

	List<String> kw_list = new ArrayList();
	ResultSet results = null;
	String query = ""; 
    if (flag.equalsIgnoreCase("with_nots") ) {
	
        query = 
            " SELECT CASE WHEN (kd.display IS NULL and rt.relationshiptype_type like '%not%') THEN 'NOT ' || k.keyword "
            + " WHEN (rt.relationshiptype_type like '%not%' AND kd.display is not null) THEN 'NOT ' || kd.display "
            + " WHEN (kd.display is null and not rt.relationshiptype_type like '%not%') THEN k.keyword "
            + " ELSE kd.display END AS keyword "
            + " From Keyword k LEFT OUTER JOIN KeywordDisplay kd "
            + " ON k.keyword_id = kd.keyword_id "
            + " LEFT JOIN TairObject_Keyword tok "
            + " ON k.keyword_id = tok.keyword_id "
            + " LEFT JOIN RelationshipType rt "
            + " ON tok.relationship_type_id = rt.relationship_type_id "
            + " WHERE tok.tair_object_id = " + tair_object_id;
        if (keyword_type.equalsIgnoreCase("GO") ){
            query = query + " AND k.keyword_type_id IN ('comp', 'func', 'proc') ";
        }
    } else {
        query = 
	    " SELECT CASE WHEN kd.display IS NULL THEN k.keyword ELSE kd.display END AS keyword " +
	    " FROM Keyword k LEFT OUTER JOIN KeywordDisplay kd ON k.keyword_id = kd.keyword_id " +
	    " WHERE EXISTS ( SELECT 'X' FROM TairObject_Keyword tok " +
	    " WHERE k.keyword_id = tok.keyword_id AND " +
	    " tok.tair_object_id = " + tair_object_id  +
	    " ) ";
    }
	conn.setQuery(query);
	results = conn.getResultSet();
	
	while (results.next()) {
	    kw_list.add(results.getString("keyword"));
	}

	conn.releaseResources();
	return kw_list;
    }





  /**
   * For unit testing only
   */
  public void test() {
    System.out.println("****** TfcKeyword content test ******");
    System.out.println("keyword_id: " + get_keyword_id());
    System.out.println("keyword_type_id: " + get_keyword_type_id());
    System.out.println("keyword: " + get_keyword());
    System.out.println("keyword_uc: " + get_keyword_uc());
    System.out.println("definition: " + get_definition());
    System.out.println("note: " + get_note());
    System.out.println("def_source: " + get_def_source());
    System.out.println("extdb_id: " + get_extdb_id());
    System.out.println("date_last_modified: " + get_date_last_modified());
    System.out.println("has_direct_links: " + get_has_direct_links());
    System.out.println("has_child_links: " + get_has_child_links());
    System.out.println("pub_id: " + get_pub_id());
    System.out.println("keyword_type: " + get_keyword_type());
    System.out.println("keyword_type_display: " + get_keyword_type_display());
    System.out.println("type_definition: " + get_type_definition());
    System.out.println("**** TfcKeyword content test end ****");
  }

    public static void retrieveKeywordsTest(DBconnection conn, String tair_object_id) 
	throws SQLException {
	System.out.println("***** START: retrieveKeywordsTest ****");

	List<String> kw_list = retrieveKeywords(conn, tair_object_id);
	for (String keyword : kw_list) {
	    System.out.println(keyword);
	}

	System.out.println("***** END: retrieveKeywordsTest ****");
    }

  /**
   * For unit testing only
   */
  public static void main(String[] args) {
    try {

      DBconnection conn = new DBconnection();
      Long test_id = new Long(7858);
      TfcKeyword keyword = new TfcKeyword(conn, test_id);
      keyword.test();

      retrieveKeywordsTest(conn, "2200959");
      retrieveKeywordsTest(conn, "2200960");

    } catch (Exception e) {
      e.printStackTrace();
    }

  }

}
