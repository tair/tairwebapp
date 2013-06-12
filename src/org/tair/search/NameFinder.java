/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search;

import org.tair.utilities.TextConverter;

/**
   *
   *
 */

public class NameFinder {
  
  private String name_type;

  // secondary name type (i.e. gene name/alias type) - 
  // will usually be null since most name searches don't
  // use a type param
  private String search_name_type;

  private String return_id;
  private String search_string_wild;
  private String base_table_name = "NameAlias";
  private String name_sql;

    // no arg constructor 
  public NameFinder() { }

  private String getNameType() { return name_type; }
  private String getSearchNameType() { return search_name_type; }
  private String getReturnID() { return return_id; }
  private String getWildSearchString() { return search_string_wild; }

  private String getNameAliasTable( String name_type ) {
    return new String( name_type + base_table_name );
  }  

  public String getNameSql() { return name_sql; }
  
  public void setNameFinder( String name_type, String return_id_type, String search_string, String method ) { 
    setNameFinder( name_type, return_id_type, TextConverter.convertEnds( search_string, method ) );   
  } 

  public void setNameFinder( String name_type, String return_id_type, String search_string_wild ) {
    this.name_type = name_type;
    return_id = return_id_type;
    this.search_string_wild = search_string_wild;
    StringBuffer query_buffer = new StringBuffer(" ( select ");
    query_buffer.append( getReturnID() );
    query_buffer.append( " FROM " + getNameAliasTable( getNameType() ) );
    query_buffer.append( " WHERE name like " );
    query_buffer.append( TextConverter.dbQuote( getWildSearchString().toUpperCase() ) );
    query_buffer.append( " ESCAPE '\\\' ) " );
    name_sql = new String( query_buffer );
  }

  
  /**
   * Set parameters for creating name/alias sub select SQL string.  This 
   * version allows results to be restricted by a secondary name type (search_name_type).
   * This is useful in cases where names and aliases are stored as having a specific 
   * type (gene for example).  If search_name_type is <code>null</code>, names will
   * not be restricted by type.  This version converts search_string to included
   * wildcard characters as determined by method
   *
   * @param name_type Object type to search for name matches
   * @param search_name_type Secondary name type to restrict name matches to
   * @param return_id_type Literal value of column to return as selected id 
   * (i.e. tair_object_id, map_element_id etc.)
   * @param search_string Search term to use for finding name matches
   * @param method Search method (contains/exact etc.) to use for wildcard translation
   * of search_string
   */
  public void setNameTypeFinder( String name_type, String search_name_type, String return_id_type, String search_string, String method ) {

    this.name_type = name_type;
    this.search_name_type = search_name_type;
    this.return_id = return_id_type;
    this.search_string_wild = TextConverter.convertEnds( search_string, method );
    
    StringBuffer query_buffer = new StringBuffer(" ( select ");
    query_buffer.append( getReturnID() );
    query_buffer.append( " FROM " + getNameAliasTable( getNameType() ) );
    query_buffer.append( " WHERE name like " );
    query_buffer.append( TextConverter.dbQuote( getWildSearchString().toUpperCase() ) + " ESCAPE '\\\' " );
    
    // only restrict by name_type if value is not null
    if ( search_name_type != null ) {
      query_buffer.append( "AND name_type = " + TextConverter.dbQuote( search_name_type ) + " " );
    }
    
    query_buffer.append( " ) " );
    name_sql = query_buffer.toString();

  }
  

  /**
   * Set parameters for creating name/alias sub select SQL string.  This 
   * version allows results to be restricted by a secondary name type (search_name_type).
   * This is useful in cases where names and aliases are stored as having a specific 
   * type (gene for example).  If search_name_type is <code>null</code>, names will
   * not be restricted by type.  This version assumes search_string has already been
   * converted to contain wildcard characters as determined by search method
   *
   * @param name_type Object type to search for name matches
   * @param search_name_type Secondary name type to restrict name matches to
   * @param return_id_type Literal value of column to return as selected id 
   * (i.e. tair_object_id, map_element_id etc.)
   * @param search_string Search term to use for finding name matches
   */
  public void setNameTypeFinder( String name_type, String search_name_type, String return_id_type, String search_string ) {

    this.name_type = name_type;
    this.search_name_type = search_name_type;
    this.return_id = return_id_type;
    this.search_string_wild = search_string;
    
    StringBuffer query_buffer = new StringBuffer(" ( select ");
    query_buffer.append( getReturnID() );
    query_buffer.append( " FROM " + getNameAliasTable( getNameType() ) );
    query_buffer.append( " WHERE name like " );
    query_buffer.append( TextConverter.dbQuote( getWildSearchString().toUpperCase() ) + " ESCAPE '\\\' " );
    
    // only restrict by name_type if value is not null
    if ( search_name_type != null ) {
      query_buffer.append( "AND name_type = " + TextConverter.dbQuote( search_name_type ) + " " );
    }
    
    query_buffer.append( " ) " );
    name_sql = query_buffer.toString();

  }




    /*     main method for stand alone test
     */

  public static void main( String[] args ) {
      NameFinder nf = new NameFinder();
      nf.setNameFinder( "clone", "clone_id", "ata", "1" );
      System.out.println(" ===== Name Finder output ===== ");
      System.out.println(" params = clone, clone_id, ata, 1 " );
      System.out.println(" name_sql = " + nf.getNameSql() );
      nf.setNameFinder( "clone", "map_element_id", "%ata%" );
      System.out.println(" params = clone, map_element_id, %ata% " );
      System.out.println(" name_sql = " + nf.getNameSql() );
      nf.setNameFinder( "polymorphism", "tair_object_id", "snp", "3" );
      System.out.println(" params = polymorphism, tair_object_id, snp, 3 " );
      System.out.println(" name_sql = " + nf.getNameSql() ); 
  }

}
    
  
