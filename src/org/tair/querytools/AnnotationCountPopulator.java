/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;
import org.tair.search.*;

/**
   *
   *
 */

public class AnnotationCountPopulator {
  
  private ArrayList annotation_count_objects;
  private String count_sql;
  private String from_and_where_clause;
  private String select_searcher_clause;
  private TfcAnnotationType tfc_annotation_type; 
  private AnnotationCount ac; 
  private AnnotationTypeCollection atc;  
  private String scope;
  private Long keyword_id;
  private String keyword_name;
  private boolean has_direct_links = true;
  private boolean has_child_links = true;
  private final String count_table_name  = "Keyword_wrk";

    // no arg constructor 
  public AnnotationCountPopulator() {}

    // 
  public void setAnnotationCounts( DBconnection conn, Long keyword_id, String scope, boolean populate_keyword_info ) throws SQLException {
      // for each active annotation type setAnnotationCount and place the resulting objects in an array
    if ( scope != null && ( scope.equalsIgnoreCase( "term" ) || scope.equalsIgnoreCase( "children" ) || scope.equalsIgnoreCase( "combo" ) ) ) this.scope = scope; 
    if ( keyword_id != null ) {
      this.keyword_id = keyword_id;
      if ( populate_keyword_info ) setKeywordInfo( conn, keyword_id );
      if ( atc == null ) atc = new AnnotationTypeCollection( conn );  
      annotation_count_objects = new ArrayList();
      Iterator atcIter = atc.iterator();
      if ( atcIter != null ) {
        while ( atcIter.hasNext() ) {
	  setAnnotationType( ( TfcAnnotationType )atcIter.next() );
	  // by default, populate the count attribute 
	  setAnnotationCount( conn, true );
	  if ( getAnnotationCount().getCount() > 0 ) annotation_count_objects.add( getAnnotationCount() );
        }  
      }
    }
  }
    // returns an iterator to the arraylist that holds the AnnotationCount objects created for this keyword id and scope
  public Iterator getAnnotationCounts() { return ( !annotation_count_objects.isEmpty() ) ? annotation_count_objects.iterator() : null; }

  public void sortAnnotationCounts(Comparator comp) {
      if (annotation_count_objects != null) {
          Collections.sort(annotation_count_objects, comp);
      }
  }
    
  // sets TfcAnnotationType 
  private void setAnnotationType( TfcAnnotationType tat ) { tfc_annotation_type = tat; }

  // sets TfcAnnotationType 
  private void setAnnotationType( DBconnection conn, String child_table_name ) throws SQLException {
    if ( child_table_name != null ) tfc_annotation_type = new TfcAnnotationType( conn, child_table_name );
  }
  // returns TfcAnnotationType
  private TfcAnnotationType getAnnotationType() { return tfc_annotation_type; } 

  // instantiates AnnotationCount and populates its attributes - first instantiates a TfcAnnotationType object based on child table name
  public void setAnnotationCount( DBconnection conn, Long keyword_id, String child_table_name, String scope ) throws SQLException { 
    if ( scope != null && ( scope.equalsIgnoreCase( "term" ) || scope.equalsIgnoreCase( "children" ) || scope.equalsIgnoreCase( "combo" ) ) ) this.scope = scope; 
    setAnnotationType( conn, child_table_name );
    if ( keyword_id != null ) setKeywordInfo( conn, keyword_id );
    // by default, populate the count attribute
    setAnnotationCount( conn, true );
  }

  // Instantiates AnnotationCount and populates its attributes - first instantiates a TfcAnnotationType object based on child table name
  public void setAnnotationCount( DBconnection conn, Long keyword_id, String child_table_name, String scope, boolean populate_count_attribute ) throws SQLException { 
    if ( scope != null && ( scope.equalsIgnoreCase( "term" ) || scope.equalsIgnoreCase( "children" ) || scope.equalsIgnoreCase( "combo" ) ) ) this.scope = scope; 
    setAnnotationType( conn, child_table_name );
    if ( keyword_id != null ) setKeywordInfo( conn, keyword_id );
    // by default, populate the count attribute
    setAnnotationCount( conn, populate_count_attribute );
  }

  // instantiates AnnotationCount and populates its attributes - first instantiates a TfcAnnotationType object based on child table name
  public void setAnnotationCount( DBconnection conn, Long keyword_id, String child_table_name, String scope, boolean populate_count_attribute, boolean populate_keyword_info ) throws SQLException { 
    if ( scope != null && ( scope.equalsIgnoreCase( "term" ) || scope.equalsIgnoreCase( "children" ) || scope.equalsIgnoreCase( "combo" ) ) ) this.scope = scope; 
    setAnnotationType( conn, child_table_name );
    if ( keyword_id != null && populate_keyword_info ) setKeywordInfo( conn, keyword_id );
    // by default, populate the count attribute
    setAnnotationCount( conn, populate_count_attribute );
  }

  // instantiates AnnotationCount and populates its attributes
  private void setAnnotationCount( DBconnection conn, boolean populate_count_attribute ) throws SQLException {
    ac = new AnnotationCount();
    boolean do_count = false;

    if ( getAnnotationType().getChildTableName() != null ) {
      ac.setDisplayName( getAnnotationType().getDisplayName() );
      ac.setChildTableName( getAnnotationType().getChildTableName() );
      ac.setScope( getScope() );
      ac.setKeywordID( getKeywordID() );
      ac.setKeywordName( getKeywordName() );
      setCountSql( getAnnotationType().getAnnotationTypeID(), getScope() );
      setSelectSearchClause( getAnnotationType().getChildTableName() );
      // set the search sql 

      if ( getScope().equalsIgnoreCase( "term" ) ) {
        setToTermFromWhere( getAnnotationType().getChildTableName() );
	if ( hasDirectLinks() ) do_count = true;
      } else if ( getScope().equalsIgnoreCase( "children" ) ) {
        setToChildrenFromWhere( getAnnotationType().getChildTableName() );
	if ( hasChildLinks() ) do_count = true;
      } else if ( getScope().equalsIgnoreCase( "combo" ) ) {
        setComboFromWhere( getAnnotationType().getChildTableName() );
	if ( hasDirectLinks() || hasChildLinks() ) do_count = true;
      }
      ac.setCountSql( getCountSql() );
      ac.setSearchSql( getSearchSql() );
      if ( populate_count_attribute ) {
        // set the counts
        ResultSet results = null;
        if ( do_count ) { 
	  Debugger.println( Debugger.logMsg( this, "count sql = " + ac.getCountSql() ) );
          conn.setQuery( ac.getCountSql() );
	  conn.setQueryVariable( getKeywordID() );
          results = conn.getResultSet();
	  if ( results.next() ) ac.setCount( results.getInt( "annotation_count" ) ); 
	  conn.releaseResources();
	}
      }
    }     
  }

  // returns AnnotationCount object
  public AnnotationCount getAnnotationCount() { return ac; } 

  // returns count table name
  public String getCountTableName() { return count_table_name; } 
 
  // assembles count sql for a particular annotation type and scope
  private void setCountSql( Long annotation_type_id, String scope ) throws SQLException {
    if ( annotation_type_id != null && scope != null ) {
	count_sql = "select link_count AS annotation_count from " + getCountTableName() +
	    " where annotation_type_id = " + annotation_type_id.toString() +
	    " and scope = " + TextConverter.dbQuote( scope ) +
	    " and keyword_id = ? ";
    }
  } 

  // assembles select clause for searcher query given a child table name
  private void setSelectSearchClause( String child_table_name ) throws SQLException {
    if ( child_table_name.equalsIgnoreCase( "Annotation" ) ) {
      select_searcher_clause = "select toke.tair_object_id ";
    } else {
      select_searcher_clause = " select lt." + getAnnotationType().getColumnName();
    }
  }  

  // assembles from and where clause for 'to children' associations given a child table name
  private void setToChildrenFromWhere( String child_table_name ) throws SQLException {
    if ( child_table_name.equalsIgnoreCase( "Annotation" ) ) {
      from_and_where_clause = " from TairObjKeyEvidence toke where EXISTS ( select 'X' from ShortestPath sp where toke.keyword_id = sp.child_term_id AND sp.parent_term_id = ? AND sp.parent_term_id <> sp.child_term_id ) ";
    } else { 
      from_and_where_clause = " from " +  getAnnotationType().getLinkingTableName() + " lt, ShortestPath sp " +
	  " where sp.parent_term_id = ? " +
	  " AND lt.keyword_id = sp.child_term_id " +
	  " AND sp.parent_term_id <> sp.child_term_id ";

      if (child_table_name.equalsIgnoreCase(TfcAnnotationType.LOCUS)) {
	  from_and_where_clause += 
	      " AND (lt.annotation_type_id = " + getAnnotationType().getAnnotationTypeID() +
	      " OR lt.annotation_type_id = 1 )";
      } else {
	  from_and_where_clause +=
	      " AND lt.annotation_type_id = " + getAnnotationType().getAnnotationTypeID();
      }
      // +  getIsObsoleteClause();
    }
  } 

  // assembles from and where clause for 'to term' associations given a child table name
  private void setToTermFromWhere( String child_table_name ) throws SQLException {
    if ( child_table_name.equalsIgnoreCase( "Annotation" ) ) {
      from_and_where_clause = " from TairObjKeyEvidence toke where toke.keyword_id = ? ";
    } else {
	from_and_where_clause = " from " +  getAnnotationType().getLinkingTableName() + " lt, ShortestPath sp " +
	    " where sp.parent_term_id = ? " +
	    " AND lt.keyword_id = sp.child_term_id " +
	    " AND sp.parent_term_id = sp.child_term_id ";
	
	if (child_table_name.equalsIgnoreCase(TfcAnnotationType.LOCUS)) {
	    from_and_where_clause += 
		" AND (lt.annotation_type_id = " + getAnnotationType().getAnnotationTypeID() +
		" OR lt.annotation_type_id = 1 )";
	} else {
	    from_and_where_clause +=
		" AND lt.annotation_type_id = " + getAnnotationType().getAnnotationTypeID();
	}
      // + getIsObsoleteClause();
    }
  } 

  // assembles from and where clause for 'combo' associations given a child table name
  private void setComboFromWhere( String child_table_name ) throws SQLException {
    if ( child_table_name.equalsIgnoreCase( "Annotation" ) ) {
      from_and_where_clause = " from TairObjKeyEvidence toke where EXISTS ( select 'X' from ShortestPath sp where toke.keyword_id = sp.child_term_id AND sp.parent_term_id = ? ) ";
    } else {
	from_and_where_clause = " from " +  getAnnotationType().getLinkingTableName() + " lt, ShortestPath sp " +
	    " where sp.parent_term_id = ? " +
	    " AND lt.keyword_id = sp.child_term_id ";
	
	if (child_table_name.equalsIgnoreCase(TfcAnnotationType.LOCUS)) {
	    from_and_where_clause += 
		" AND (lt.annotation_type_id = " + getAnnotationType().getAnnotationTypeID() +
		" OR lt.annotation_type_id = 1 )";
	} else {
	    from_and_where_clause +=
		" AND lt.annotation_type_id = " + getAnnotationType().getAnnotationTypeID();
	}
      // +  getIsObsoleteClause();
    }
  } 

  /*
   * Not actually used but maybe this would be better to use instead of
   * checking for an explicite annotation_type_id in the above methods?
   */
  public String getLocusAnnotatoinTypeConstraint(DBconnection conn) 
    throws SQLException {
      TfcAnnotationType gene = new TfcAnnotationType(conn, TfcAnnotationType.GENE);
      TfcAnnotationType locus = new TfcAnnotationType(conn, TfcAnnotationType.LOCUS);

      String result =
	  "lt.annotation_type_id = " + locus.getAnnotationTypeID() + 
	  " OR " +
	  "lt.annotation_type_id = " + gene.getAnnotationTypeID();

      return result;
  }

    // returns to count sql 
  private String getCountSql() { return count_sql; } 

    // returns search sql 
  private String getSearchSql() { return select_searcher_clause + from_and_where_clause; } 

    // returns to is_obsolete check on child table
  private String getIsObsoleteClause() { 
    String is_obsolete_clause = null;
    if ( getAnnotationType().getLinkingTableName() != null && ( getAnnotationType().getLinkingTableName().equalsIgnoreCase( "TairObject_Keyword" ) || getAnnotationType().getLinkingTableName().equalsIgnoreCase( "Community_Keyword" ) ) ) {
      is_obsolete_clause =  " AND EXISTS ( select 'X' from " + 
	  getAnnotationType().getChildTableName() + " c where c." + getAnnotationType().getColumnName() + 
	  " = lt." + getAnnotationType().getColumnName() + " AND is_obsolete = 'F' ) ";	
    } else is_obsolete_clause = " "; 
    return is_obsolete_clause; 
  } 

    // returns to scope
  private String getScope() { return this.scope; } 

    // sets the keyword id, has_direct_links and has_child_links - default values are true 
  private void setKeywordInfo( DBconnection conn, Long keyword_id ) throws SQLException { 
    if ( keyword_id != null ) { 
      this.keyword_id = keyword_id;
      String query = "select keyword, has_direct_links, has_child_links from " + 
	  " Keyword where keyword_id = " + 
	  keyword_id.toString();

      conn.setQuery( query );  
      ResultSet results = conn.getResultSet();
      if ( results.next() ) {
	if ( results.getString( "has_direct_links" ).equalsIgnoreCase( "T" ) ) {
	  has_direct_links = true;
	} else {
	  has_direct_links = false;
	} 	  
	if ( results.getString( "has_child_links" ).equalsIgnoreCase( "T" ) ) {
	  has_child_links = true;
	} else {
	  has_child_links = false;
	}
	keyword_name = results.getString( "keyword" );
      }
      conn.releaseResources();
    }
  }    
    // returns keyword_id
  private Long getKeywordID() { return keyword_id; }  
    // returns keyword name
  private String getKeywordName() { return keyword_name; }  
    // returns has_direct_links
  private boolean hasDirectLinks() { return has_direct_links; }  
    // returns has_child_links
  private boolean hasChildLinks() { return has_child_links; }  

    /*     main method for stand alone test
     */

  public static void main(String[] args){    
  }	
}
    
  
