/**
 * basically a user-defined data type to hold Annotation count information for ease of manipulation 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */

package org.tair.querytools;

public class AnnotationCount {   

  private String display_name;
  private String scope;
  private String count_sql;
  private String search_sql;
  private String child_table_name;
  private Long keyword_id;
  private String keyword_name;
  private int count;

  /**
   * Creates an empty instance of AnnotationCount, attributes have initial values
   */

  public AnnotationCount() {}

  /**
   * set the display name
   */
  public void setDisplayName( String display_name ) { this.display_name = display_name; } 
  /**
   * @return String value of annotation type's display name
   */
  public String getDisplayName() { return display_name; }

  /**
   * set the scope
   */
  public void setScope( String scope ) { this.scope = scope; } 
  /**
   * @return String value of scope
   */
  public String getScope() { return scope; }

  /**
   * set the count sql
   */
  public void setCountSql( String count_sql ) { this.count_sql = count_sql; } 
  /**
   * @return String value of count sql 
   */
  public String getCountSql() { return count_sql; }

  /**
   * set the search sql
   */
  public void setSearchSql( String search_sql ) { this.search_sql = search_sql; } 
  /**
   * @return String value of  search sql 
   */
  public String getSearchSql() { return search_sql; }

  /**
   * set the child table name
   */
  public void setChildTableName( String child_table_name ) { this.child_table_name = child_table_name; } 
  /**
   * @return String value of child table name 
   */
  public String getChildTableName() { return child_table_name; }

  /**
   * @return String value of hyperlink where they do not include obsolete genes
   */
  public String getHyperlink_withoutObs() {
    String hyperlink = null;  
    if ( getDisplayName() != null && getScope() != null && getCount() > 0 && 
         getKeywordID() != null && getChildTableName() != null ) {
      if ( getDisplayName().equalsIgnoreCase( "annotations" ) ) {
          hyperlink = "<A href=\"/servlets/Search?type=annotation&action=search&kw_id=" + 
	  getKeywordID().toString() + "&kw=" + getKeywordName() + "&scope=" + 
              getScope() +
	  "\" target=\"_other\">" + getCount() + " " + 
              getDisplayName() + "</A>";	
      } else { // all other annotation types
	if ( getScope().equalsIgnoreCase( "term" ) || 
             getScope().equalsIgnoreCase( "children" ) ) {
          hyperlink = "<A href=\"/servlets/Search?type=keyword&action=ann_type&kw_id=" + 
	  getKeywordID().toString() + "&scope=" + getScope() + "&table=" +
	  getChildTableName() + "\" target=\"_other\">" + getCount() + " " + 
              getDisplayName() + " to " + getScope() + "</A>";
	} else { // scope = combo
        if (getChildTableName().equalsIgnoreCase("Gene") ||
	    getChildTableName().equalsIgnoreCase("Locus")) {
            hyperlink = "<A href=\"/servlets/Search?type=keyword&action=ann_type&kw_id=" + 
	  getKeywordID().toString() + "&scope=" + getScope() + "&table=" +
	  getChildTableName() + "&show_obsolete=F\" target=\"_other\">" + getCount() + " " + 
	       getDisplayName() + "</A>";
	} else {
            hyperlink = "<A href=\"/servlets/Search?type=keyword&action=ann_type&kw_id=" + 
	  getKeywordID().toString() + "&scope=" + getScope() + "&table=" +
	  getChildTableName() + "\" target=\"_other\">" + getCount() + " " + 
              getDisplayName() + "</A>";
    
        }
    }
      }
    } else { // end if values are supplied
      hyperlink = " ";
    }
    return hyperlink;
  }

  /**
  
  
  /**
   * @return String value of hyperlink
   */
  public String getHyperlink() {
    String hyperlink = null;  
    if ( getDisplayName() != null && getScope() != null && getCount() > 0 && 
         getKeywordID() != null && getChildTableName() != null ) {
      if ( getDisplayName().equalsIgnoreCase( "annotations" ) ) {
          hyperlink = "<A href=\"/servlets/Search?type=annotation&action=search&kw_id=" + 
	  getKeywordID().toString() + "&kw=" + getKeywordName() + "&scope=" + 
              getScope() +
	  "\" target=\"_other\">" + getCount() + " " + 
              getDisplayName() + "</A>";	
      } else { // all other annotation types
	if ( getScope().equalsIgnoreCase( "term" ) || 
             getScope().equalsIgnoreCase( "children" ) ) {
          hyperlink = "<A href=\"/servlets/Search?type=keyword&action=ann_type&kw_id=" + 
	  getKeywordID().toString() + "&scope=" + getScope() + "&table=" +
	  getChildTableName() + "\" target=\"_other\">" + getCount() + " " + 
              getDisplayName() + " to " + getScope() + "</A>";
	} else { // scope = combo
          hyperlink = "<A href=\"/servlets/Search?type=keyword&action=ann_type&kw_id=" + 
	  getKeywordID().toString() + "&scope=" + getScope() + "&table=" +
	  getChildTableName() + "\" target=\"_other\">" + getCount() + " " + 
              getDisplayName() + "</A>";
	}
      }
    } else { // end if values are supplied
      hyperlink = " ";
    }
    return hyperlink;
  }

  /**
   * @return String value of abbreviated hyperlink
   */
  public String getShortHyperlink() {
    String hyperlink = null;  
    if ( getDisplayName() != null && getScope() != null && getCount() > 0 && 
         getKeywordID() != null && getChildTableName() != null ) {
      if ( getDisplayName().equalsIgnoreCase( "annotations" ) ) {
          hyperlink = "<A href=\"/servlets/Search?type=annotation&action=search&kw_id=" + 
	  getKeywordID().toString() + "&kw=" + getKeywordName() + "&scope=" + 
              getScope() + 
	  "\" target=\"_other\">" + getCount() + " " + 
              getDisplayName() + "</A>";		
      } else { // all other annotation types
	  //if ( getScope().equalsIgnoreCase( "term" ) || getScope().equalsIgnoreCase( "children" ) ) {
          hyperlink = "<A href=\"/servlets/Search?type=keyword&action=ann_type&kw_id=" + 
	  getKeywordID().toString() + "&scope=" + getScope() + "&table=" +
	  getChildTableName() + "\" target=\"_other\">" + getCount() + " " + getDisplayName() + "</A>";
	  //} // right now, short hyperlink will be null for scope = combo
      }
    } else { // end if values are supplied
      hyperlink = " ";
    }
    return hyperlink;
  }

  /**
   * set the keyword id
   */
  public void setKeywordID( Long keyword_id ) { this.keyword_id = keyword_id; } 
  /**
   * @return Long value of keyword_id
   */
  public Long getKeywordID() { return keyword_id; }

  /**
   * set the keyword name
   */
  public void setKeywordName( String keyword_name ) { this.keyword_name = keyword_name; } 
  /**
   * @return Long value of keyword_name
   */
  public String getKeywordName() { return keyword_name; }

  /**
   * set the count
   */
  public void setCount( int count ) { this.count = count; } 
  /**
   * @return integer value of count
   */
  public int getCount() { return count; }
  
  /**
   * test AnnotationCount content
   */
  public void test() {
    System.out.println( "****** AnnotationCount content test ******" );
    System.out.println( "display_name: " + getDisplayName() );
    System.out.println( "scope: " + getScope() );
    System.out.println( "count_sql: " + getCountSql() );
    System.out.println( "search_sql: " + getSearchSql() );
    System.out.println( "child table name: " + getChildTableName() );
    System.out.println( "keyword_id: " + getKeywordID() );
    System.out.println( "keyword_name: " + getKeywordName() );
    System.out.println( "count: " + getCount() );
    System.out.println( "hyperlink: " + getHyperlink() );
    System.out.println( "short hyperlink: " + getShortHyperlink() );
    System.out.println( "**** AnnotationCount content test end ****" );
  }
    

  /**
   * main function is used to for testing only 
   */
  public static void main( String[] args ) {
    AnnotationCount ac = new AnnotationCount();     
    ac.setDisplayName( "annotations" );
    ac.setScope( "term" );
    ac.setCountSql( " select count(blah blah) " );
    ac.setSearchSql( " select blah blah " );
    ac.setChildTableName( "TairObjKeyEvidence" );
    ac.setKeywordID( new Long ( 7858) );
    ac.setKeywordName( " keyword name goes here " );
    ac.setCount( 276 );
    ac.test();
  }

}
