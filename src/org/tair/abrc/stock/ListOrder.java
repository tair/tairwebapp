//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.17 $
// $Date: 2006/02/15 01:57:52 $
//------------------------------------------------------------------------------ 
package org.tair.abrc.stock;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.tair.bs.community.BsCountry;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.CountryDelegate;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcOrdersStock;
import org.tair.utilities.TextConverter;

/**
 * ListOrder is a lightweight data class for displaying lists of order search
 * results. Each instance of ListOrder contains only the information needed for
 * displaying data in a list view, and is useful for avoiding the relatively
 * high cost of instantiating a full <code>CompositeOrder</code> object for
 * each search result. ListOrder objects are created in
 * <code>OrderSearcher</code>, which populates order's stock collection
 * manually through the addStock() method so that each order instance contains
 * only stocks that matched the search criteria used to create the result set
 * order is part of.
 */

public class ListOrder {

    // order info
    private Long orders_id;
    private Long order_number;
    private String order_status;
    private java.util.Date order_date;
    private java.util.Date date_complete;
    private Boolean no_charge;

    // person info
    private Long person_community_id;
    private Long person_id;
    private String firstName;
    private String lastName;

    // organization info
    private Long organization_community_id;
    private Long organization_id;
    private String organization_country;
    private String organizationName;
    private String seed_stock_center;
    private Boolean commercial;

    // stocks in order as ListStock objects
    private ArrayList stocks;

    // flags to determine if order contains any active seed or DNA
    // stocks, regardless of the current contents of the stocks collection;
    // these flags are explicitly populated through the
    // setStockCountFlags method.
    private boolean hasSeedStocks = false;
    private boolean hasDNAStocks = false;

    public final void set_orders_id( Long orders_id ) {
        this.orders_id = orders_id;
    }

    public final void set_order_number( Long order_number ) {
        this.order_number = order_number;
    }

    public final void set_person_community_id( Long person_community_id ) {
        this.person_community_id = person_community_id;
    }

    public final void set_person_id( Long person_id ) {
        this.person_id = person_id;
    }

    public final void set_organization_community_id( Long id ) {
        this.organization_community_id = id;
    }

    public final void set_organization_id( Long id ) {
        this.organization_id = id;
    }

    public final void set_first_name( String name ) {
        this.firstName = name;
    }

    public final void set_last_name( String name ) {
        this.lastName = name;
    }

    public final void set_organization_name( String name ) {
        this.organizationName = name;
    }

    public final void set_order_status( String status ) {
        this.order_status = status;
    }

    public final void set_order_date( java.util.Date order_date ) {
        this.order_date = order_date;
    }

    public final void set_date_complete( java.util.Date date_complete ) {
        this.date_complete = date_complete;
    }

    public final void set_no_charge( Boolean no_charge ) {
        this.no_charge = no_charge;
    }

    public final void set_organization_country( String country ) {
        this.organization_country = country;
    }

    public final void set_seed_stock_center( String center ) {
        this.seed_stock_center = center;
    }

    public final void set_commercial( Boolean commercial ) {
        this.commercial = commercial;
    }

    public final Long get_orders_id() {
        return orders_id;
    }

    public final Long get_order_number() {
        return order_number;
    }

    public final Long get_person_community_id() {
        return person_community_id;
    }

    public final Long get_person_id() {
        return person_id;
    }

    public final Long get_organization_community_id() {
        return organization_community_id;
    }

    public final Long get_organization_id() {
        return organization_id;
    }

    public final String get_first_name() {
        return firstName;
    }

    public final String get_last_name() {
        return lastName;
    }

    public final String get_organization_name() {
        return organizationName;
    }

    public final String get_order_status() {
        return order_status;
    }

    public final java.util.Date get_order_date() {
        return order_date;
    }

    public final java.util.Date get_date_complete() {
        return date_complete;
    }

    public final Boolean get_no_charge() {
        return no_charge;
    }

    public final String get_organization_country() {
        return organization_country;
    }

    public final String get_seed_stock_center() {
        return seed_stock_center;
    }

    public final Boolean get_commercial() {
        return commercial;
    }

    /**
     * Populates data for order's associated person and organization records.
     * This population is done separately in this method to allow OrderSearcher
     * to only populate this data for order records being displayed on a current
     * page; removing this data from the large search SQL query offers a big
     * improvement on query performance.
     * 
     * <p>
     * This method assumes basic order info. has already been populated.
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             thrown if a database error occurs
     */
    public void populateCommunityInfo( DBconnection conn ) throws SQLException {
        if ( get_organization_id() != null && get_person_id() != null ) {

            // get organization data
            String query = "SELECT og.community_id AS organization_community_id, "
                           + "og.seed_stock_center, "
                           + "og.commercial, "
                           + "og.name "
                           + "FROM Organization og "
                           + "WHERE og.organization_id = ?";

            conn.setQuery( query );
            conn.setQueryVariable( get_organization_id() );

            ResultSet results = conn.getResultSet();
            if ( results.next() ) {
                this.organization_community_id = 
                    new Long( results.getLong( "organization_community_id" ) );

                this.seed_stock_center = 
                    results.getString( "seed_stock_center" );

                this.commercial = 
                    TextConverter.stringToBoolean( results.getString( "commercial" ) );

                this.organizationName = results.getString( "name" );
            }
            conn.releaseResources();

            // get person data
            query = "SELECT p.community_id AS person_community_id, "
                    + "p.last_name, "
                    + "p.first_name "
                    + "FROM Person p "
                    + "WHERE p.person_id = ?";

            conn.setQuery( query );
            conn.setQueryVariable( get_person_id() );

            results = conn.getResultSet();
            if ( results.next() ) {
                this.person_community_id = 
                    new Long( results.getLong( "person_community_id" ) );

                this.firstName = results.getString( "first_name" );
                this.lastName = results.getString( "last_name" );
            }
            conn.releaseResources();

            // update all stocks in order w/community info. since some
            // info. duplicated there
            if ( hasStocks() ) {
                ListStock stock = null;
                for ( Iterator iter = getStocks(); iter.hasNext(); ) {
                    stock = (ListStock) iter.next();
                    stock.set_commercial( get_commercial() );
                    stock.set_person_community_id( get_person_community_id() );
                    stock.set_person_id( get_person_id() );
                    stock.set_first_name( get_first_name() );
                    stock.set_last_name( get_last_name() );
                }
            }
        }
    }

    /**
     * Returns combination of first name and last name of person who placed the
     * order.
     * 
     * @return String containing first name and last name
     */
    public String get_person_name() {
        return get_first_name() + " " + get_last_name();
    }

    /**
     * Returns preferred seed stock center for organization. If this value is
     * null in the database, this method calculates stock center on
     * organization's country and returns result.
     * 
     * @return Seed stock center (ABRC/NASC) for this organization
     */
    public String get_format_stock_center() {
        String name = get_organization_country();
        String center = get_seed_stock_center();
        String returnCenter = null;
        CountryDelegate delegate = CommunityDelegateFactory.getCountryDelegate();
        BsCountry country = delegate.getCountryByName(name);

        if ( center != null ) { // if value already stored in db, return that
            returnCenter = center;
        } else {
            // if "other" country that hasn't chosen, return
            // Undetermined

            if (BsCountry.StockCenter.OPTIONAL.equals(country.getStockCenter())) {
                returnCenter = "Undetermined";

                // else, return preferred stock center stored for this
                // country
            } else {
                returnCenter = country.getStockCenter();
            }
        }
        return returnCenter;
    }

    /**
     * Adds the submitted stock to inner collection of stocks for this order
     * 
     * @param stock
     *            Stock to add to order
     */
    public void addStock( ListStock stock ) {
        if ( stocks == null ) {
            stocks = new ArrayList();
        }
        stocks.add( stock );
    }

    /**
     * Retrieves all stocks in this order
     * 
     * @return Stocks in order as an <code>Iterator</code> of
     *         <code>ListStock</code> objects, or <code>null</code> if no
     *         stocks for this order
     */
    public Iterator getStocks() {
        return ( stocks != null && !stocks.isEmpty() ) ? stocks.iterator()
                                                      : null;
    }

    /**
     * Retrieves number of active DNA stocks in order. This count only includes
     * DNA stocks whose status is not "inactive" (cancelled).
     * 
     * @return Number of active DNA stocks in order, or 0 if no active dna
     *         stocks in order
     */
    public int getDNAStockCount() {
        Iterator iter = null;
        ListStock stock = null;
        int stockCount = 0;

        iter = getStocks();
        if ( iter != null ) {
            while ( iter.hasNext() ) {
                stock = (ListStock) iter.next();
                if ( !stock.inactive()
                     && ( stock.get_is_seed() == null || 
                             !stock.get_is_seed().booleanValue() ) ) {

                    stockCount += stock.get_quantity();
                }
            }
        }
        return stockCount;
    }

    /**
     * Retrieves number of active seed stocks in order. This count only includes
     * seed stocks whose status is not "inactive" (cancelled).
     * 
     * @return Number of active seed stocks in order, or 0 if no active seed
     *         stocks in order
     */
    public int getSeedStockCount() {
        Iterator iter = null;
        ListStock stock = null;
        int stockCount = 0;

        iter = getStocks();
        if ( iter != null ) {
            while ( iter.hasNext() ) {
                stock = (ListStock) iter.next();
                if ( !stock.inactive()
                     && ( stock.get_is_seed() != null && 
                             stock.get_is_seed().booleanValue() ) ) {

                    stockCount += stock.get_quantity();
                }
            }
        }
        return stockCount;
    }

    /**
     * Retrieves total number of active stocks (DNA & seed) in order. This count
     * only includes stocks whose status is not "inactive" (cancelled).
     * 
     * @return Number of active stocks in order, or 0 if no active stocks in
     *         order
     */
    public int getStockCount() {
        Iterator iter = null;
        int stockCount = 0;
        ListStock stock = null;

        if ( hasStocks() ) {
            iter = getStocks();
            while ( iter.hasNext() ) {
                stock = (ListStock) iter.next();
                if ( !stock.inactive() ) {
                    stockCount += stock.get_quantity();
                }
            }
        }
        return stockCount;
    }

    /**
     * Determines number of distinct stocks in order; this is different from
     * getStockCount which calculates the count using the quantity ordered for
     * each stock.
     * 
     * @return Number of distinct stocks in order
     */
    public int getDistinctStockCount() {
        return ( hasStocks() ) ? stocks.size() : 0;
    }

    /**
     * Determines whether instance of ListOrder has any stocks in it
     * 
     * @return <code>true</code> if order contains stocks, or
     *         <code>false</code> if no stocks in order
     */
    public boolean hasStocks() {
        return ( stocks != null && !stocks.isEmpty() );
    }

    /**
     * Determines whether order has seed stocks in it, regardless of whether
     * current instance contains those seed stocks. This is helpful for display
     * on order search results pages where seed stocks may not have matched
     * search criteria. Only stocks that do not have an "inactive" (cancelled)
     * status will be counted in determining this.
     * 
     * @return <code>true</code> if order contains seed stocks; returns
     *         <code>false</code> if order contains no seed stocks.
     */
    public boolean hasSeedStocks() {
        return hasSeedStocks;
    }

    /**
     * Determines whether order has DNA stocks in it, regardless of whether
     * current instance contains those DNA stocks. This is helpful for display
     * on order search results pages where DNA stocks may not have matched
     * search criteria. Only stocks that do not have an "inactive" (cancelled)
     * status will be counted in determining this.
     * 
     * @return <code>true</code> if order contains DNA stocks; returns
     *         <code>false</code> if order contains no DNA stocks.
     */
    public boolean hasDNAStocks() {
        return hasDNAStocks;
    }

    /**
     * Sets values for whether order contains seed or DNA stocks. This is done
     * through this method to allow the explicit population of these values from
     * OrderSearcher. Method will determine whether order has any (active) seed
     * or DNA stocks associated to it regardless of the actual contents of the
     * stock collection currently in order.
     * 
     * <p>
     * This method assumes basic order information (such as orders_id) has
     * already been populated
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void setStockCountFlags( DBconnection conn ) throws SQLException {
        // check if internal collections contain seed or dna stocks; if
        // one type or the other is not found, check database to be sure
        // before setting internal value

        if ( getDNAStockCount() > 0 ) {
            this.hasDNAStocks = true;

        } else {

            int dnaCount = TfcOrdersStock.getStockCount( conn,
                                                         get_orders_id(),
                                                         false, // dna stocks
                                                         false ); // exclude
                                                                    // inactive
            if ( dnaCount > 0 ) {
                this.hasDNAStocks = true;
            }
        }

        if ( getSeedStockCount() > 0 ) {
            this.hasSeedStocks = true;
        } else {
            int seedCount = TfcOrdersStock.getStockCount( conn,
                                                          get_orders_id(),
                                                          true, // seed stocks
                                                          false ); // exclude
                                                                    // inactive
            if ( seedCount > 0 ) {
                this.hasSeedStocks = true;
            }
        }

    }

    /**
     * Prints contents of this instance of ListOrder. For unit testing only.
     */
    public void test() {
        System.out.println( "order id: " + orders_id );
        System.out.println( "person community id: " + person_community_id );
        System.out.println( "person id: " + person_id );

        System.out.println( "organization_community_id: "
                            + organization_community_id );

        System.out.println( "organization id: " + organization_id );
        System.out.println( "first name: " + firstName );
        System.out.println( "last name: " + lastName );
        System.out.println( "organization name: " + organizationName );
        System.out.println( "order status: " + order_status );

        System.out.println( "order_date: "
                            + TextConverter.dateToString( order_date ) );

        System.out.println( "date_complete: "
                            + TextConverter.dateToString( date_complete ) );

        System.out.println( "no_charge: " + no_charge );

        System.out.println( "organization country: "
                            + get_organization_country() );

        System.out.println( "seed stock center: " + get_seed_stock_center() );
        System.out.println( "commercial: " + get_commercial() );

        if ( stocks != null && !stocks.isEmpty() ) {
      Iterator iter = stocks.iterator();
            while ( iter.hasNext() ) {
                ListStock stock = (ListStock) iter.next();
                stock.test();
            }
        }
    }
}
