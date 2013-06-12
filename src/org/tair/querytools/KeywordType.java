/*-----------------------------------------------------------------------
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*-----------------------------------------------------------------------
 */

/**
 * KeywordType is class that holds a list of hyperlinks to keywords grouped by
 * keyword type and relationship type generally for display on type specific
 * detail pages such as Gene and Locus( uses child_table_name = 'Gene'and an
 * array of ids.
 */

package org.tair.querytools;


import java.sql.*;
import java.util.*;
import org.tair.tfc.*;
import org.tair.utilities.*;


public class KeywordType {

  private String keyword_type;
  private ArrayList relationship_types;
  private String linking_table_name;
  private String column_name;
  private HashMap keywords;

  /**
   * Creates an empty instance of KeywordType
   */
  public KeywordType() {
  }

  /**
   * populates KeywordType attributes for a particular keyword type id, db
   * object id, and linking table from the db
   */
  public void populate(DBconnection conn, String keyword_type_id, Long id,
                       String linking_table_name, String column_name)
      throws SQLException {
    if (keyword_type_id != null && id != null && linking_table_name != null
        && column_name != null) {
      this.linking_table_name = linking_table_name;
      this.column_name = column_name;
      setKeywordType(conn, keyword_type_id);
      setRelationshipTypes(conn, keyword_type_id, id);
      setKeywords(conn, keyword_type_id, id);
    }
  }

  /**
   * populates KeywordType attributes for a particular keyword type id, db
   * object id array, and linking table from the db
   */
  public void populate(DBconnection conn, String keyword_type_id, Long[] ids,
                       String linking_table_name, String column_name)
      throws SQLException {
    if (keyword_type_id != null && ids != null && linking_table_name != null
        && column_name != null) {
      this.linking_table_name = linking_table_name;
      this.column_name = column_name;
      setKeywordType(conn, keyword_type_id);
      setRelationshipTypes(conn, keyword_type_id, ids);
      setKeywords(conn, keyword_type_id, ids);
    }
  }

  // 
  private void setKeywordType(DBconnection conn, String keyword_type_id)
      throws SQLException {
    if (keyword_type_id != null) {
      ResultSet results = null;
      String query =
          " select display from KeywordType " + "where keyword_type_id = "
              + TextConverter.dbQuote(keyword_type_id);
      // Debugger.println( Debugger.logMsg( this, "keyword type query = " +
      // query ) );
      conn.setQuery(query);
      results = conn.getResultSet();
      if (results.next()) {
        keyword_type = results.getString("display");
      }
      conn.releaseResources();
    }
  }

  // 
  private void setRelationshipTypes(DBconnection conn, String keyword_type_id,
                                    Long id) throws SQLException {
    relationship_types = new ArrayList();
    if (keyword_type_id != null && id != null) {
      ResultSet results = null;
      String query =
          " select distinct rt.relationshiptype_type AS relationship_type"
              + " from RelationshipType rt, Keyword k, "
              + getLinkingTableName()
              + " lt where rt.relationship_type_id = lt.relationship_type_id AND "
              + " k.keyword_id =  lt.keyword_id AND " + " k.keyword_type_id = "
              + TextConverter.dbQuote(keyword_type_id) + " AND lt."
              + getColumnName() + " = " + id.toString() + " order by rt.relationshiptype_type ";
      // Debugger.println( Debugger.logMsg( this, "rel types query = " + query )
      // );
      conn.setQuery(query);
      results = conn.getResultSet();
      while (results.next()) {
        relationship_types.add(results.getString("relationship_type"));
      }
      conn.releaseResources();
    }
  }

  // 
  private void setRelationshipTypes(DBconnection conn, String keyword_type_id,
                                    Long[] ids) throws SQLException {
    relationship_types = new ArrayList();
    if (keyword_type_id != null && ids != null) {
      StringBuffer inList = new StringBuffer(" IN (  ");
      for (int i = 0; i < ids.length; i++) {
        if (i > 0)
          inList.append(" , ");
        inList.append(ids[i].toString());
      }
      inList.append(" ) ");
      ResultSet results = null;
      String query =
          " SELECT DISTINCT rt.relationshiptype_type AS relationship_type"
              + " FROM RelationshipType rt, Keyword k, "
              + getLinkingTableName()
              + " lt WHERE rt.relationship_type_id = lt.relationship_type_id "
              + " AND k.keyword_id =  lt.keyword_id "
              + " AND k.keyword_type_id = "
              + TextConverter.dbQuote(keyword_type_id) + " AND lt."
              + getColumnName() + inList.toString() + " ORDER BY rt.relationshiptype_type ";
      // Debugger.println( Debugger.logMsg( this, "rel types query = " + query )
      // );
      conn.setQuery(query);
      results = conn.getResultSet();
      while (results.next()) {
        relationship_types.add(results.getString("relationship_type"));
      }
      conn.releaseResources();
    }
  }

  // 
  private void setKeywords(DBconnection conn, String keyword_type_id, Long id)
      throws SQLException {
    keywords = new HashMap();
    if (keyword_type_id != null && id != null && hasRelationshipTypes()) {
      Iterator rtIter = getRelationshipTypes();
      if (rtIter != null) {
        String rel_type = null;
        StringBuffer kw_list = new StringBuffer(" ");
        boolean first = true;
        ResultSet results = null;
        String query =
            " SELECT DISTINCT CASE WHEN kd.display IS NULL THEN k.keyword ELSE kd.display END AS keyword, k.keyword_id AS keyword_id"
                + " FROM Keyword k LEFT OUTER JOIN KeywordDisplay kd ON k.keyword_id = kd.keyword_id, RelationshipType rt, "
                + getLinkingTableName()
                + " lt WHERE k.keyword_id = lt.keyword_id AND lt.relationship_type_id = rt.relationship_type_id"
                + " AND k.keyword_type_id = "
                + TextConverter.dbQuote(keyword_type_id)
                + " AND rt.relationshiptype_type = ? "
                + " AND lt." + getColumnName() + " = " + id.toString();
        // Debugger.println( Debugger.logMsg( this, "keywords query = " + query
        // ) );
        while (rtIter.hasNext()) {
          rel_type = (String)rtIter.next();
          conn.setQuery(query);
          conn.setQueryVariable(rel_type);
          results = conn.getResultSet();
          while (results.next()) {
            if (!first)
              kw_list.append(", ");
            // begin hyperlink tag for this keyword - link goes to keyword's
            // detail page
            kw_list.append("<A href=\"/servlets/TairObject?type=keyword&id=");
            kw_list.append(results.getString("keyword_id"));
            kw_list.append("\"target=\"_other\">");
            kw_list.append(results.getString("keyword"));
            kw_list.append("</A>");
            // end hyperlink tag for this keyword
            first = false;
          }// while results.next()
          conn.releaseResources();
          keywords.put(rel_type, new String(kw_list));
          first = true;
          // reset first
          kw_list.delete(1, kw_list.length());
          // clear out kw_list
        }// while rtIter has next
      }// if rtIter not null
    } // if keyword_type_id, etc not null
  }// end

  // 
  private void setKeywords(DBconnection conn, String keyword_type_id, Long[] ids)
      throws SQLException {
    keywords = new HashMap();
    if (keyword_type_id != null && ids != null && hasRelationshipTypes()) {
      Iterator rtIter = getRelationshipTypes();
      if (rtIter != null) {
        String rel_type = null;
        StringBuffer kw_list = new StringBuffer(" ");
        boolean first = true;
        ResultSet results = null;
        StringBuffer inList = new StringBuffer(" IN (  ");
        for (int i = 0; i < ids.length; i++) {
          if (i > 0)
            inList.append(" , ");
          inList.append(ids[i].toString());
        }
        inList.append(" ) ");
        String query =
            " SELECT DISTINCT CASE WHEN kd.display IS NULL THEN k.keyword ELSE kd.display END AS keyword, k.keyword_id AS keyword_id"
                + " FROM Keyword k LEFT OUTER JOIN KeywordDisplay kd ON k.keyword_id = kd.keyword_id, RelationshipType rt, "
                + getLinkingTableName()
                + " lt WHERE k.keyword_id = lt.keyword_id AND lt.relationship_type_id = rt.relationship_type_id"
                + " AND k.keyword_type_id = "
                + TextConverter.dbQuote(keyword_type_id)
                + " AND rt.relationshiptype_type = ? "
                + " AND lt." + getColumnName() + inList.toString();
        // Debugger.println( Debugger.logMsg( this, "keywords query = " + query
        // ) );
        while (rtIter.hasNext()) {
          rel_type = (String)rtIter.next();
          conn.setQuery(query);
          conn.setQueryVariable(rel_type);
          results = conn.getResultSet();
          while (results.next()) {
            if (!first)
              kw_list.append(", ");
            // begin hyperlink tag for this keyword - link goes to keyword's
            // detail page
            kw_list.append("<A href=\"/servlets/TairObject?type=keyword&id=");
            kw_list.append(results.getString("keyword_id"));
            kw_list.append("\"target=\"_other\">");
            kw_list.append(results.getString("keyword"));
            kw_list.append("</A>");
            // end hyperlink tag for this keyword
            first = false;
          }// while results.next()
          conn.releaseResources();
          keywords.put(rel_type, new String(kw_list));
          first = true;
          // reset first
          kw_list.delete(1, kw_list.length());
          // clear out kw_list
        }// while rtIter has next
      }// if rtIter not null
    } // if keyword_type_id, etc not null
  }// end

  // returns linking table name
  private String getLinkingTableName() {
    return linking_table_name;
  }

  // returns column name
  private String getColumnName() {
    return column_name;
  }

  /**
   * @returns keyword type
   */
  public String getKeywordType() {
    return keyword_type;
  }

  /**
   * @returns comma delimited list of keywords for specified relationship type
   */
  public String getKeywords(String relationship_type) {
    String keyword_list = null;
    if (keywords != null && relationship_type != null) {
      keyword_list = (String)keywords.get(relationship_type);
    }
    return keyword_list;
  }

  /**
   * @returns boolean indicating whether there are relationship types for this
   *          id and keyword type
   */
  public boolean hasRelationshipTypes() {
    return (relationship_types != null && !relationship_types.isEmpty());
  }

  /**
   * @returns iterator of relationship types for this id and keyword type
   */
  public Iterator getRelationshipTypes() {
    return (hasRelationshipTypes()) ? relationship_types.iterator() : null;
  }

  /**
   * test KeywordType content
   */
  public void test() {
    System.out.println("****** KeywordType content test ******");
    System.out.println(" keyword type = " + getKeywordType());
    if (hasRelationshipTypes()) {
      Iterator rtIter = getRelationshipTypes();
      if (rtIter != null) {
        String rel_type = null;
        while (rtIter.hasNext()) {
          rel_type = (String)rtIter.next();
          System.out.println(" relationship type = " + rel_type);
          System.out.println(" keyword list = " + getKeywords(rel_type));
        }
      }
    }
    System.out.println("**** KeywordType content test end ****");
  }

  /**
   * this method is used for testing.
   */
  public static void main(String[] args) {
    try {
      DBconnection conn = new DBconnection();
      KeywordType kt = new KeywordType();
      kt.populate(conn, "proc", new Long(2207424), "TairObject_Keyword",
                  "tair_object_id");
      kt.test();
      kt.populate(conn, "anat", new Long(5043), "Reference_Keyword",
                  "reference_id");
      kt.test();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
