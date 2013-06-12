/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.io.Serializable;
import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;


/** 
 * StockCollection is a custom collection for storing stocks as <code>StockObject</code>
 * objects.  StockObjects themselves may contain instances of StockCollection to 
 * contain each stock's member stocks (if stock is a pool or set), as well as any
 * stock pools or sets the stock is a member of and a collection of stock donors
 * for each stock.  Each of these collections must be populated explicitly using the
 * populateXXX() methods.
 *
 * How stocks are retrieved is determined by a String parameter called "type". 
 * The different values of type are:
 *
 * <ul>
 * <li>tair_object - Creates a collection of stocks for a tair object 
 * (such as clone). This is the default population mode that 
 * is if the simple version of the constructor StockCollection(conn, id) is 
 * used. Stocks will be created to contain basic stock info. as well as linking 
 * table information for that stock's relationship to the tair object</li>
 *
 * <li>species_variant - Creates a collection of stocks related to any germplasms
 * related to a species variant.
 *
 * <li>member_stock - Creates a collection of stock pools or sets that contain 
 * a given stock. 
 *
 * <li>parent_stock - Creates a collection of stocks contained by a stock set 
 * or pool. This is slightly different than "tair_object" in that the number of
 * member stocks created will not exceed a set maximum (currently 10). This is
 * done since the number of member stocks may be too large to easily display
 * on a detail page (where this collection is usually used). Client code can
 * determine if collection does not contain the full list of member stocks through
 * the isAbbreviated() method and get the full number of member stocks through the
 * getFullCount() method.
 * </ul>
 *
 * <p>
 * Implements Serializable so objects can be written as
 * part of serialized stock catalog data
 *
 */

public class StockCollection implements Serializable {
  private ArrayList stocks;

  // maximum number of member stocks to hold in collection when populating
  // collection using "parent_stock" mode; this number is limited since the
  // total number may sometimes be too many to display on a detail page
  private static final int MAX_MEMBERS = 10;


  // flag to record whether stock collection only contains abbreviated
  // list of member stocks for a stock pool or set. This will only be true
  // when populating collection using "parent_stock" mode, where pool/set
  // contains more members than allowed by MAX_MEMBERS constant
  private boolean abbreviatedList = false;

  // total number of stocks that *would* be in collection if list hadn't been
  // abbreviated by MAX_MEMBERS;
  private int fullCount = 0;


  /**
   * Creates an empty version of StockCollection
   */
  public StockCollection()  {
    stocks = new ArrayList();
  }


  /**
   * Creates an instance of StockCollection populated with <code>StockObject</code>
   * objects that are associated to the supplied tair object id. 
   *
   * @param conn An active connection to the database
   * @param tair_object_id Tair object id to retrieve stocks for
   * @exception SQLException in the case of an invalid operation or database error
   */   
  public StockCollection( DBconnection conn, Long tair_object_id ) throws SQLException {
    stocks = new ArrayList();
    if ( tair_object_id != null ) {
      retrieveStocks( conn, tair_object_id );
    }
  }

  /**
   * Creates an instance of StockCollection populated according to submitted
   * population type. Current values for type are:
   * <ul>
   * <li>tair_object - id should be tair_object_id. This is the same as if 2 param
   * constructor was called</li>
   * <li>species_variant - id should be species_variant_id</li>
   * <li>member_stock - id should be stock_id of stock to retrieve parent pools or sets for</li>
   * <li>parent_stock - id should be tair object id of a stock pool or set - 
   * retrieves member stocks for parent stock; since this may be a large number,
   * only the first 10 member stocks are retrieved and the isAbbreviated flag
   * will be set to notify client code that link to stock search results should
   * be made to display full list of member stocks.</li>
   * </ul>
   *
   * @param conn An active connection to the database
   * @param id ID to retrieve stocks for
   * @param type Specifies how stocks should be retrieved in relation to id
   * @exception SQLException in the case of an invalid operation or database error
   */ 
  public StockCollection( DBconnection conn, Long id, String type ) throws SQLException {
    stocks = new ArrayList();
    if ( id != null && type != null ) {
      if ( type.equals( "tair_object" ) ) {
	retrieveStocks( conn, id );
      } else if ( type.equals( "species_variant" ) ) {
	retrieveSpeciesVariantStocks( conn, id );
      } else if ( type.equals( "member_stock" ) ) { 
	retrieveMemberParents( conn, id );
      } else if ( type.equals( "parent_stock" ) ) {
	retrieveParentMembers( conn, id );


      } else { // take this out before pushing forward...
	throw new SQLException( "INVALID STOCK COLLECTION POPULATION TYPE: " + type );
      }
    }
  }


  // Retrieves stocks for supplied tair object id and populates collection
  private void retrieveStocks( DBconnection conn, Long tair_object_id ) throws SQLException {
    ArrayList stockIDs = null;
    String query = null;
    ResultSet results = null;

    if ( tair_object_id != null ) {
      query = 
	"SELECT s.stock_id " +
	"FROM TairObject_Stock ts, Stock s " +
	"WHERE ts.stock_id = s.stock_id " +
	"AND s.is_obsolete = 'F' " +
	"AND ts.tair_object_id = " + tair_object_id.toString();
      
      conn.setQuery( query );
      results = conn.getResultSet();
      while ( results.next() ) {
	if ( stockIDs == null ) {
	  stockIDs = new ArrayList();
	}
	stockIDs.add( new Long( results.getLong( "stock_id" ) ) );
      }
      conn.releaseResources();

      if ( stockIDs != null && !stockIDs.isEmpty() ) {
	createStockObjects( conn, tair_object_id, stockIDs );
      }
    }
  }

  // utility method to create StockObject objects to represent stock info in list of
  // stockIDs and their relationship to tair_object_id
  private void createStockObjects( DBconnection conn, Long tair_object_id, ArrayList stockIDs ) throws SQLException {
    Iterator iter = null;
    StockObject stock = null;

    iter = stockIDs.iterator(); // stockIDs should never be null or empty if we got this far
    while ( iter.hasNext() ) {
      stock = new StockObject( conn, tair_object_id, (Long) iter.next() );
      add( stock );
    }
  }



  // species variant is associated to stock through germplasm -- to populate, get all germplasm
  // tair object ids, then call retrieveStocks for each tair object id to get all stocks for
  // each germplasm associated to variant
  private void retrieveSpeciesVariantStocks( DBconnection conn, Long species_variant_id ) throws SQLException {
    ArrayList tairObjectIDs = null;
    String query = null;
    Iterator iter = null;

    if ( species_variant_id != null ) {
      query = 
	"SELECT g.tair_object_id " +
	"FROM Germplasm g " +
	"WHERE g.is_obsolete = 'F' " +
	"AND g.species_variant_id = " + species_variant_id.toString();
      conn.setQuery( query );
      ResultSet results = conn.getResultSet();
      while ( results.next() ) {
	if ( tairObjectIDs == null ) {
	  tairObjectIDs = new ArrayList();
	}
	tairObjectIDs.add( new Long( results.getLong( "tair_object_id" ) ) );
      }
      conn.releaseResources();
      
      if ( tairObjectIDs != null && !tairObjectIDs.isEmpty() ) {
	iter = tairObjectIDs.iterator();
	while ( iter.hasNext() ) {
	  retrieveStocks( conn, (Long) iter.next() );
	}
      }
    }
  }

  // retrieves any stock pools or sets that submitted stock id is a member of
  private void retrieveMemberParents( DBconnection conn, Long stockID ) throws SQLException {
    String query = null;
    ResultSet results = null;
    Iterator iter = null;
    ArrayList parentStockIDs = null;
    StockObject stock = null;

    query = 
      "SELECT s.stock_id " +
      "FROM TairObject_Stock ts, Stock s " +
      "WHERE ts.tair_object_id = s.tair_object_id " +
      "AND ts.stock_id = " + stockID.toString();

    conn.setQuery( query );
    results = conn.getResultSet();
    while ( results.next() ) {
      if ( parentStockIDs == null ) {
	parentStockIDs = new ArrayList();
      }
      parentStockIDs.add( new Long( results.getLong( "stock_id" ) ) );
    }
    conn.releaseResources();
    
    if ( parentStockIDs != null && !parentStockIDs.isEmpty() ) {
      iter = parentStockIDs.iterator();
      while ( iter.hasNext() ) {
	stock = new StockObject( conn, (Long) iter.next() );
	add( stock );
      }
    }
  }

  // retrieves member stocks for a stock pool or set. Populating collection this way will
  // automatically limit number of stock objects created by MAX_MEMBER constant and will
  // populate the fullCount variable to store the total number of stocks that would have
  // been created if collection hadn't been limited
  private void retrieveParentMembers( DBconnection conn, Long parentTairObjectID ) throws SQLException {
    String query = null;
    ResultSet results = null;
    Iterator iter = null;
    ArrayList memberIDs = null;
    int memberCounter = 0;

    query =
      "SELECT DISTINCT s.stock_id " +
      "FROM TairObject_Stock ts, Stock s " +
      "WHERE ts.stock_id = s.stock_id " +
      "AND ts.tair_object_id = " + parentTairObjectID.toString();

    conn.setQuery( query );
    results = conn.getResultSet();
    while ( results.next() ) {
      if ( memberIDs == null ) {
	memberIDs = new ArrayList();
      }
      if ( memberCounter < MAX_MEMBERS ) {
	memberIDs.add( new Long( results.getLong( "stock_id" ) ) );

	// set flag to track that max members has been exceeded & that collection 
	// only contains partial list
      } else { 
	this.abbreviatedList = true;
      }
	
      memberCounter++;
    }
    conn.releaseResources();

    // if max members was exceeded, save total number of rows returned 
    // by query for display later
    if ( this.abbreviatedList ) {
      this.fullCount = memberCounter;
    }
    
    if ( memberIDs != null && !memberIDs.isEmpty() ) {
      createStockObjects( conn, parentTairObjectID, memberIDs );
    }
  }
  

  /**
   * Determines whether stock collection contains only a partial list of member 
   * stocks for a stock pool or set.  This will only be true if collection was
   * populated in "parent_stock" mode, and if stock/pool or set contains more
   * member stocks than allowed in the collection by MAX_MEMBERS constant 
   * (currently 10).  This is done since some sets/pools have so many members
   * that displaying them all is unwieldly on a detail page; this method can then
   * be used to determine whether a "show all" link should be provided
   *
   * @return <code>true</code> if stock collection only contains a partial list
   * of all member stocks for a given stock pool or set, or <code>false</code> ifg200
   * collection is a full list of all stocks retrieved by population methods
   */
  public boolean isAbbreviatedList() {
    return abbreviatedList;
  }

  /**
   * If number of stocks in collection was restricted by MAX_MEMBERS constant, this
   * method will return the total number of rows that matched the original query, 
   * even though stock objects were not created for all results.  This is useful
   * for showing helpful display info. when displaying an abbreviated list like
   * "showing 10 of 43 stocks".
   *
   * <p>
   * NOTE: if isAbbreviatedList() returns <code>false</code> (i.e. collection is
   * not an abbreviated collection), this method will return the same number as
   * if size() were called
   *
   * @return Number of stocks that would be in collection if collection size had not
   * been limited by MAX_MEMBERS constant when collection was populated
   */
  public int getFullCount() {
    return ( isAbbreviatedList() ) ? fullCount : size();
  }

  /**
   * Returns value of MAX_MEMBERS constant that is used to limit size of collection
   * when populating collection with member stocks of a stock set or pool. 
   *
   * @return int constant for max number of member stocks to be in collection when
   * populating collection with member stocks of a stock set or pool
   */
  public int getMaxMembers() {
    return MAX_MEMBERS;
  }

  
  /**
   * Adds supplied element to collection
   * 
   * @param stock Element to add to collection
   */
  public void add( StockObject stock ) { stocks.add( stock ); }

  /**
   * Removes supplied element from collection. If element is not in collection
   * request is silently ignored
   *
   * @param stock Element to remove from collection
   */
  public void remove( StockObject stock ) { stocks.remove( stock ); }

  /**
   * Determines if collection has elements in it or not
   *
   * @return <code>true</code> if collection has no elements in it; <code>false</code>
   * if collection has at least one element in it
   */
  public boolean isEmpty() { return stocks.isEmpty(); }

  /**
   * Retrieves number of elements in collection
   *
   * @return Number of elements in collection
   */
  public int size() { return stocks.size(); }


  /**
   * Determines if supplied element is in collection
   *
   * @param stock Element to check
   * @return <code>true</code> if supplied element is in collection; <code>false</code>
   * if element is not found
   */
  public boolean contains( StockObject stock ) { return stocks.contains( stock ); }


  /**
   * Retrieves element at supplied index
   *
   * @return Element at supplied index, or <code>null</code> if no element at supplied index
   */
  public StockObject get( int index ) { return (StockObject) stocks.get( index ); }

  /**
   * Retrieves all stocks in collection
   *
   * @return All stocks in collection as an <code>Iterator</code>
   * of <code>StockObject</code> objects, or <code>null</code>
   * if collection is empty
   */
  public Iterator iterator() { return stocks.iterator(); }


  /**
   * Retrieves all stock numbers in collection as delimited string
   *
   * @return All stock numbers in collection as a comma delimited string, or <code>null</code>
   * if no stocks in collection
   */
  public String getStockNumberString( ) {
    StringBuffer buffer = null;
    String stockNumbers = null;
    Iterator iter = iterator();

    if ( iter != null ) {
      buffer = new StringBuffer();
      boolean first = true;
      while ( iter.hasNext() ) {
	StockObject stock = (StockObject) iter.next();
	if ( !first ) {
	  buffer.append( ", " );
	}
	buffer.append( stock.get_name() );
	first = false;
      }
      stockNumbers = buffer.toString();
    }
    return stockNumbers;
  }

  /**
   * Gets the set of unique names in this collection
   * @return the a set of the names for stocks in this collection
   */
  public Set getNames() {
    TreeSet names = new TreeSet();
    Iterator iter = iterator();
	
    while ( iter != null && iter.hasNext() ) {
      StockObject stock = (StockObject) iter.next();
      names.add(stock.get_name());
    }

    return names;
  }

  
  /**
   * Populates list of donors for each stock in collection. This is done 
   * separately from constructor since we don't always need this info, and so
   * don't always want to expend resources retrieving donors needlessly.
   *
   * @param conn An active connection to the database
   * @exception SQLException thrown if a database error occurs
   */
  public void populateDonors( DBconnection conn ) throws SQLException {
    Iterator iter = null;
    StockObject stock = null;

    if ( !isEmpty() ) {
      iter = iterator();
      while ( iter.hasNext() ) {
	stock = (StockObject) iter.next();
	stock.populateDonors( conn );
      }
    }
  }


  /**
   * Populates list of member stocks for each stock in collection (if stock itself
   * is a stock pool or set). This is done separately from constructor since we don't
   * always need this info, and so don't always want to expend resources unnecessarily.
   *
   * @param conn An active connection to the database
   * @exception SQLException thrown if a database error occurs
   */
  public void populateMemberStocks( DBconnection conn ) throws SQLException {
    Iterator iter = null;
    StockObject stock = null;

    if ( !isEmpty() ) {
      iter = iterator();
      while ( iter.hasNext() ) {
	stock = (StockObject) iter.next();
	stock.populateMemberStocks( conn );
      }
    }
  }


  /**
   * Populates list of stock pools or sets each stock in collection is a member of. 
   * This is done separately from constructor since we don't always need this info, 
   * and so don't always want to expend resources unnecessarily.
   *
   * @param conn An active connection to the database
   * @exception SQLException thrown if a database error occurs
   */
  public void populateParentStocks( DBconnection conn ) throws SQLException {
    Iterator iter = null;
    StockObject stock = null;

    if ( !isEmpty() ) {
      iter = iterator();
      while ( iter.hasNext() ) {
	stock = (StockObject) iter.next();
	stock.populateParentStocks( conn );
      }
    }
  }

  /**
   * Populates the detailss for each stock in the collection
   *
   * @param conn An active connection to the database
   * @exception SQLException thrown if a database error occurs
   */
  public void populateDetails( DBconnection conn ) throws SQLException {
    Iterator iter = null;
    StockObject stock = null;

    if ( !isEmpty() ) {
      iter = iterator();
      while ( iter.hasNext() ) {
	stock = (StockObject) iter.next();
	stock.populateDetails( conn );
      }
    }
  }


  
  /**
   * For unit testing only
   */
  public void test() {
    System.out.println( "****** test StockCollection content ******" );
    int length = this.size();
    StockObject stock = null;
    Iterator iter = null;
    if ( !isEmpty() ) {
      iter = iterator();
      while ( iter.hasNext() ) {
	stock = (StockObject) iter.next();
	stock.test();
      }
    }
    System.out.println( "**** test StockCollection content end ****" );	
  }


  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
	
    try{
      DBconnection conn = new DBconnection();
      Long id = new Long( 2271320 );
      StockCollection stocks = new StockCollection( conn, id );
      stocks.test();
      
      System.out.println( "Creating collection for species variant..." );
      id = new Long( 108 );
      stocks = new StockCollection( conn, id, "species_variant" );
      stocks.test();

    } catch( Exception e ) {
      e.printStackTrace();
    }
  }

}
  








