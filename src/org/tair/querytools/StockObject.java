/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;

/**
 * MemberStock extends <code>TfcStock</code> to contain data on a stock in 
 * the context of its relationship to another tair object.  In addition
 * to all data in <code>TfcStock</code>, MemberStock contains data on
 * the relationship type between the stock and the tair object (which itself
 * may be another stock as in the case of stock pools and sets).
 */


public class StockObject extends TfcStock {

  // represents join between this stock and any tair object
  private TfcTairObjectStock tairObjectStock;

  // donors for stock - stored as Donor - this collection must be populated
  // explicitly using the populateDonors() method
  private ListCommunityCollection donors;

  // member stocks associated to this stock if this stock is a stock pool or
  // set - this collection must be populated explicitly using the populateMemberStocks() method
  // objects themselves stored as StockObject
  private StockCollection memberStocks;

  // stock pools or sets this stock is a member of - this collection must be
  // populated explicitly using the populateParentStocks() method. objects stored
  // themselves as StockObject
  private StockCollection parentStocks;
  
  // the aliases associated with this stock;
  private AliasVector aliases;

  // the detail object for stocks
  private StockDetail details;
 
  /**
   * Creates an empty instance of StockObject
   */
  public StockObject() {
    super();
    tairObjectStock = new TfcTairObjectStock();
  }


  /**
   * Creates an instance of StockObject that reflects the stock data for submitted
   * stock id. No additional info. on stock is retrieved when using this method; 
   * ancillary data should be retrieved using the populateXXX() methods
   *
   * @param conn An active connection to the database
   * @param stockID Stock id to retrieve data for
   * @exception SQLException thrown if a database error occurs, or if no stock
   * found with submitted id
   */
  public StockObject( DBconnection conn, Long stockID ) throws SQLException {
    super( conn, stockID );
    tairObjectStock = new TfcTairObjectStock();
  }


  /**
   * Creates an instance of StockObject that reflects the stock data for
   * the submitted stock id, and the relationship of the stock to the submitted
   * tair object id
   *
   * @param conn An active connection to the database
   * @param tairObjectID Tair object id to retrieve data for
   * @param stockID Stock id to retrieve data for
   * @exception SQLException thrown if a database error occurs, or if no corresponding
   * row found for stockID, or join between tairObjectID and stockID
   */
  public StockObject( DBconnection conn, Long tairObjectID, Long stockID ) throws SQLException {
    super( conn, stockID );
    tairObjectStock = new TfcTairObjectStock( conn, tairObjectID, stockID );
  }

  /**
   * Retrieves tair object id this stock id is associated to 
   *
   * @return tair object id stock joined to
   */
  public Long get_associated_tair_object_id() { return tairObjectStock.get_tair_object_id(); }


  /**
   * Sets tair object id this stock is associated to
   *
   * @param tair_object_id Tair object id to associate stock to
   */
  public void set_associated_tair_object_id( Long id ) { tairObjectStock.set_tair_object_id( id ); }
    

  /**
   * Overridden method to set stock_id for object.  This version keeps stock id
   * used for stock & stock-tair object join in synch.
   * 
   * @param id Stock id to set for object
   */
  public void set_stock_id ( Long id ) { 
    super.set_stock_id( id );
    if ( tairObjectStock != null ) {
	tairObjectStock.set_stock_id( id ); 
    }
  }
  
  /**
   * Sets relationship type for stock's relationship to a tair object
   */
  public void set_relationship_type( String type ) { tairObjectStock.set_relationship_type( type ); }

  /**
   * Retrieves relationship_type value for this stock's relationship to a tair object
   */
  public String get_relationship_type() { return tairObjectStock.get_relationship_type(); }


  /**
   * Determines whether this stock has any stock donors associated to it
   *
   * @return <code>true</code> if this stock has associated donors or 
   * <code>false</code> if no donors found
   */
  public boolean hasDonors() {
    return ( donors != null && !donors.isEmpty() );
  }

  /**
   * Retrieves donors for this stock.
   *
   * @return Donors for stock as an <code>Iterator</code>
   * of <code>Donor</code> objects, or <code>null</code>
   * if no donor attributions found
   */
  public Iterator getDonors() {
    return ( hasDonors() ) ? donors.iterator() : null;
  }


  /**
   * Populates list of donors for stock. This is done separately from 
   * constructor since we don't always need this info, and so don't always
   * want to expend resources retrieving donors needlessly. Usually this
   * method will be called by StockCollection so that all stocks in collection
   * can show donor info.
   *
   * <p>
   * This method assumes that stock info in TfcStock has already been populated
   *
   * @param conn An active connection to the database
   * @exception SQLException thrown if a database error occurs
   */
  public void populateDonors( DBconnection conn ) throws SQLException {
    donors = new ListCommunityCollection( conn, get_stock_id(), "donor" );
  }
   
  /**
   * Determines whether this stock has member stocks associated to it (i.e.
   * if this stock is itself a stock pool or set)
   *
   * @return <code>true</code> if this stock has member stocks or <code>false</code>
   * if no member stocks found
   */
  public boolean hasMemberStocks() {
    return ( memberStocks != null && !memberStocks.isEmpty() );
  }


  /**
   * Retrieves member stocks for this stock.
   *
   * @return Member stocks for stock as an <code>Iterator</code>
   * of <code>StockObject</code> objects, or <code>null</code>
   * if no member stocks found
   */
  public Iterator getMemberStocks() {
    return ( hasMemberStocks() ) ? memberStocks.iterator() : null;
  }


  /**
   * Populates list of member stocks for stock. This is done separately from 
   * constructor since we don't always need this info, and so don't always
   * want to expend resources retrieving member stocks needlessly.
   *
   * <p>
   * This method assumes that stock info in TfcStock has already been populated.
   * Collection of member stocks will automatically be limited to the max number
   * of member stocks set in MAX_MEMBERS constant of StockCollection
   *
   * @param conn An active connection to the database
   * @exception SQLException thrown if a database error occurs
   */
  public void populateMemberStocks( DBconnection conn ) throws SQLException {
    this.memberStocks = new StockCollection( conn, get_tair_object_id(), "parent_stock" );
  }
   

 /**
   * Retrieves number of member stocks associated to this stock, where this stock
   * is the "parent" stock of the collection, pool or set
   *
   * @return Number of stocks associated to this stocks; zero will be returned
   * if no member stocks are found
   */
  public int getNumberMemberStocks() {
    return ( hasMemberStocks() ) ? memberStocks.size() : 0;
  }

  
  /**
   * Determines if list of member stocks is an abbreviated list, in which 
   * case a hyperlink should be created to show full list using the seed or dna 
   * stock search results page. This is needed for cases where full list of associated 
   * stocks is so long that it's impractical to show the full list on a detail page. 
   *
   * @return <code>true</code> if this stock contains more associated stocks than are 
   * currently available for display through this object, or <code>false</code> if 
   * collection of member stocks contains all member stocks for this stock
   */
  public final boolean memberStocksAbbreviated() {
    return ( hasMemberStocks() && memberStocks.isAbbreviatedList() );
  }


  /**
   * If member stock collection is an abbreviated list, this
   * method will return the total number of stocks that would be in the 
   * collection if results hadn't been limited. This is useful for showing 
   * info. when displaying an abbreviated list like "showing 10 of 43 stocks".
   *
   * <p>
   * NOTE: if collection is not an abbreviated collection (i.e. if memberStocksAbbreviated()
   * returns <code>false</code>), this method will return the same number as
   * if getNumberMemberStocks() were called
   *
   * @return Number of stocks that would be in collection if collection size had not
   * been limited 
   */
  public int getTotalMemberStocks() {
    int fullCount = 0;
    
    if ( hasMemberStocks() ) {
      if ( memberStocks.isAbbreviatedList() ) {
	fullCount = memberStocks.getFullCount();
      } else {
	fullCount = memberStocks.size();
      }
    }
    return fullCount;
  }


  /**
   * Populates list of stock pools or sets this stock is a member of. This is done 
   * separately from constructor since we don't always need this info, and so don't 
   * always want to expend resources retrieving parent stocks needlessly.
   *
   * <p>
   * This method assumes that stock info in TfcStock has already been populated.
   *
   * @param conn An active connection to the database
   * @exception SQLException thrown if a database error occurs
   */
  public void populateParentStocks( DBconnection conn ) throws SQLException {
    this.parentStocks = new StockCollection( conn, get_stock_id(), "member_stock" );
  }

  /**
   * Determines whether this stock has parent stocks (i.e. is a member of a stock set or pool)
   *
   * @return <code>true</code> if this stock has parent stocks or <code>false</code>
   * if no parent stocks found
   */
  public boolean hasParentStocks() {
    return ( parentStocks != null && !parentStocks.isEmpty() );
  }


  /**
   * Retrieves parent stocks for this stock.
   *
   * @return Stock pools or sets this stock is a member of as an <code>Iterator</code>
   * of <code>StockObject</code> objects, or <code>null</code>
   * if no parent stocks found
   */
  public Iterator getParentStocks() {
    return ( hasParentStocks() ) ? parentStocks.iterator() : null;
  }


  /**
   * Populates the deatil information for this stock. This is done
   * separately from constructor since we don't always need this info, and so don't 
   * always want to expend resources retrieving details needlessly.
   *
   * <p>
   * This method assumes that stock info in TfcStock has already been populated.
   *
   * @param conn An active connection to the database
   * @exception SQLException thrown if a database error occurs
   */
  public void populateDetails( DBconnection conn ) throws SQLException {
      details = new StockDetail( conn, get_stock_id() ); 
  }

  /**
   * Determines whether this stock has its details populated
   *
   * @return <code>true</code> if this stock has its deatils populated or <code>false</code>
   * if there are no details
   */
  public boolean hasDetails() {
    return ( details != null );
  }


  /**
   * Retrieves the details for this stock.
   *
   * @return The detail information for this stock as a <code>StockDetail</code>
   * objects, or <code>null</code> if the details haven't been populated
   */
  public StockDetail getDetails() {
    return ( hasDetails() ) ? details : null;
  }

    /**
     * Determines if stock has germplasms associated to it
     * 
     * @return <code>true</code> if stock has germplasms associated to
     * it; <code>false</code> if no germplasms associated to stock
     */
    public boolean hasGermplasms() {
        return ( hasDetails() && getDetails().hasGermplasms() );
    }
    
    /**
     * Retrieves germplasms associated to stock
     *
     * @return Germplasms associated to stock as an <code>Iterator</code>
     * of <code>Germplasm</code> objects, or <code>null</code> if no 
     * germplasms associated to stock
     */
    public Iterator getGermplasms() { 
        return hasGermplasms() ? getDetails().getGermplasms() : null;
    }



  /**
   * For unit testing only
   */
  public void test() {
    super.test();
    tairObjectStock.test();

    /*if ( hasDonors() ) {
      donors.test();
    }*/

    if ( hasMemberStocks() ) {
      memberStocks.test();
    }

    if ( hasParentStocks() ) {
      parentStocks.test();
    }
  }

  public static void main( String[] args ) {
    try {


      DBconnection conn = new DBconnection();
      Long stockID = new Long( 88557 );
      Long tairObjectID = new Long( 2271320 );
      System.out.println( "testing member.." );
      StockObject stock = new StockObject( conn, tairObjectID, stockID );
      stock.test();

      System.out.println( "testing stock donor.." );
      stockID = new Long( 8 );
      tairObjectID = new Long( 14933 );
      stock = new StockObject( conn, tairObjectID, stockID );
      stock.populateDonors( conn );
      stock.test();

    } catch ( Exception e ) {
      e.printStackTrace();
    }
  }			    
}
