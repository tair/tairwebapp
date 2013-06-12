/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * ExternalLinkObjectCollection is a custom collection that stores
 * all external links associated to a given tair object as a collection of 
 * <code>ExternalLinkObject</code> objects. 
 */


public class ExternalLinkObjectCollection {
  private ArrayList external_links;


  /**
   * Creates an empty instance of ExternalLinkObjectCollection 
   * for population externally
   */
  public ExternalLinkObjectCollection() {
    external_links = new ArrayList();
  }

  
  /**
   * Creates an instance of ExternalLinkObjectCollection that contains all external links
   * associated to  a given tair object.  Each external link object has a base_url string, a
   * web_site_name, a url_variable and a fully assembled link. 
   *
   * @param db An active connection to the database
   * @param tair_object_id ID to retrieve data for
   * @throws SQLException in the case of an invalid operation or database error
   */
  public ExternalLinkObjectCollection( DBconnection db, Long tair_object_id ) throws SQLException {
    external_links = new ArrayList();

    if ( tair_object_id != null ) {
      get_information( db, tair_object_id );
    }
  }

	private void get_information( DBconnection conn, Long id ) throws SQLException {
		external_links.clear();
		if(id == null)
			return;
		String query =
			"SELECT ex.external_link_id, ex.web_site_name, ex.base_url, toe.link_name, toe.url_variable" +
			"  FROM TairObject_ExternalLink toe, ExternalLink ex" +
			" WHERE ex.external_link_id = toe.external_link_id" +
			"   AND tair_object_id = ?";
		conn.setQuery(query);
		conn.setQueryVariable(id);
		ResultSet rs = conn.getResultSet();
		while(rs.next())
			external_links.add(
				new ExternalLinkObject(
					id,
					rs.getString("link_name"),
					rs.getString("url_variable"),
					new Long(rs.getLong("external_link_id")),
					rs.getString("base_url"),
					rs.getString("web_site_name")));
	}

  /**
   * @return <code>true</code> if collection has no external links in it; <code>false</code>
   * if collection has at least one element in it
   */
  public boolean isEmpty() { return external_links.isEmpty(); }

  /**
   * @return Number of elements in collection
   */
  public int size() { return external_links.size(); }

  /**
   * @return ExternalLinkObject at supplied index, or <code>null</code> if no element at supplied index
   */
  public ExternalLinkObject elementAt( int index ) { return (ExternalLinkObject) external_links.get( index ); }

  /**
   * @return <code>true</code> if supplied element is in collection; <code>false</code>
   * if element is not found
   */
  public boolean contains( ExternalLinkObject external_link ) { return external_links.contains( external_link ); }

  /**
   * @return All external_links in collection as an <code>Iterator</code> of <code>ExternalLinkObject</code>
   * objects, or <code>null</code> if no external_links in collection
   */
  public Iterator iterator() { return ( !external_links.isEmpty() ) ? external_links.iterator() : null; }


  /**
   * Returns an <code>Iterator</code> of <code>ExternalLinkObject</code>s 
   * @return <code>Iterator</code> of <code>ExternalLinkObject</code>s or <code>null</code> 
   * if no objects in collection 
   */
  public Iterator get_external_links() { return iterator(); }

  /**
   * test ExternalLinkObjectCollection content
   */
  
  public void test(){
    System.out.println( "****** ExternalLinkObjectCollection content test ******" );
    if( this != null && this.size() != 0 ){
      int length = this.size();
      ExternalLinkObject object = null;
      for( int i=0 ; i<length; i++ ){
	object = ( ExternalLinkObject )this.elementAt( i );
	object.test();
      }
    }
    System.out.println( "**** ExternalLinkObjectCollection content test end ****" );
    
  }
  
  // this part is for test basic functions
  public static void main( String[] args ){
    try{
      DBconnection connection = new DBconnection();

      Long test_id = new Long( 4433355 ); // tair_object_id
      ExternalLinkObjectCollection external_links = new ExternalLinkObjectCollection( connection, test_id );
      external_links.test();

      System.out.println( "******************************************" );

    } catch ( Exception e ) {
      e.printStackTrace();
    }

  }

}
  








