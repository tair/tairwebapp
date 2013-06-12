//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.28 $
// $Date: 2006/02/15 01:57:33 $
//------------------------------------------------------------------------------

package org.tair.abrc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Vector;

import org.tair.abrc.stock.ListOrder;
import org.tair.abrc.stock.ListStock;
import org.tair.tfc.DBconnection;
import org.tair.utilities.Debugger;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;

/**
 * OrderSearcher executes all searches for placed orders by assembling the
 * appropriate SQL string out of the submitted parameters. Results are returned
 * in a format determined by a resultsType parameter
 */

public class OrderSearcher {

    /**
     * Searches for stock items according to the supplied criteria. Results are
     * returned according to the format specified by resultsType. The values of
     * resultsType are:
     * 
     * <ul>
     * <li>order - returns results as an array of <code>ListOrder</code>
     * objects without itemized stock data</li>
     * <li>stock - returns results as a List of <code>ListOrder</code>
     * objects that each contain a collection of <code>ListStock</code>
     * objects.</li>
     * <li>statistics - returns results as counts of stock items and stock
     * orders</li>
     * </ul>
     * 
     * @param conn
     *            An active connection to the database
     * @param searchParams
     *            A map of search values retrieved from user's submission by
     *            <code>OrderFormValidator</code>
     * @param scrollParams
     *            ScrollParams object that contains information on what page of
     *            results to return
     * @param resultsType
     *            Format to return search results in
     * @return SearchResultsCollection containing statistics results, or a
     *         subset of results as determined by resultsType
     * @throws SQLException
     *             thrown if an error occurs while retrieving data.
     */
    public static SearchResultsCollection search( DBconnection conn,
            Map searchParams, ScrollParams scrollParams, String resultsType )
            throws SQLException {

        SearchResultsCollection searchCollection = null;

        int floor = scrollParams.getFloor();
        int ceiling = scrollParams.getCeiling();

        // create SQL query to get stock/order data according to
        // submitted search params
        String query = createQueryString( searchParams );

        // Get results as list of orders
        if ( resultsType.equals( "order" ) ) {
            searchCollection = processOrderResults( conn, query, floor, ceiling );

            // return results as statistics - numbers of stocks and orders
            // placed within result set
        } else if ( resultsType.equals( "statistics" ) ) {
            searchCollection = processStatisticsResults( conn, query );

            // else return results as ListOrders that contain all
            // stocks as ListStock objects
        } else if ( resultsType.equals( "stock" ) ) {
            searchCollection = processStockResults( conn, query, floor, ceiling );
        }

        // get plain text version of search parameters
        if ( searchCollection != null && !searchCollection.isEmpty() ) {
            String criteria = getFormatSearchCriteria( searchParams,
                    searchCollection.getResultSize() );
            searchCollection.setSearchCriteria( criteria );
        }

        return searchCollection;
    }

    /**
     * Saves each row of result set as a ListStock object, while grouping all
     * stocks together in ListOrder object that contains order specific data.
     * Final results collection is a Vector of ListOrder objects containing
     * collection of ListStock objects. Only stocks that are part of order #'s
     * that are in the current requested subset of results (as defined by floor
     * and ceiling) will actually be created as ListStocks.
     * 
     * @param conn
     *            An active connection to the database
     * @param query
     *            SQL query to execute
     * @param floor
     *            Starting point of requested subset
     * @param ceiling
     *            End point of requested subset
     * @return SearchResultsCollection containing results as a Vector of
     *         ListOrder objects that contain ListStock objects
     * @throws SQLException
     *             if a database error occurs
     */
    private static SearchResultsCollection processStockResults(
            DBconnection conn, String query, int floor, int ceiling )
            throws SQLException {

        Vector found = null;
        ListOrder order = null;

        SearchResultsCollection searchCollection = null;

        int recordCounter = -1;

        conn.setQuery( query );
        ResultSet results = conn.getResultSet();

        // iterate through result set and save stocks in subset "window"
        long last_orders_id = 0;
        while ( results.next() ) {

            // if we're starting a new order, increment recordCounter to
            // keep track of total number of orders and save previous
            // order
            if ( last_orders_id != results.getLong( "orders_id" ) ) {
                recordCounter++;

                // save previous stocks grouped together by order number in
                // found before making new set of items
                if ( order != null && order.hasStocks() ) {
                    if ( found == null ) {
                        found = new Vector();
                    }
                    found.addElement( order );
                    order = new ListOrder();
                }
            }

            // if current order is part of requested subset,
            // create stock objects and save
            if ( recordCounter >= floor && recordCounter <= ceiling ) {

                ListStock stock = new ListStock();

                stock.set_is_seed( TextConverter.stringToBoolean( results
                        .getString( "is_seed" ) ) );

                stock
                        .set_orders_id( new Long( results.getLong( "orders_id" ) ) );

                stock.set_order_number( new Long( results
                        .getLong( "order_number" ) ) );

                stock.set_order_date( results.getDate( "order_date" ) );

                stock
                        .set_person_id( new Long( results.getLong( "person_id" ) ) );

                stock.set_fixed_price( TextConverter.stringToBoolean( results
                        .getString( "fixed_price" ) ) );

                stock.set_stock_price( new Float( results
                        .getFloat( "base_price" ) ) );

                stock.set_stock_status( results.getString( "stock_status" ) );
                stock.set_quantity( results.getInt( "quantity" ) );
                stock.set_waive_charge( results.getString( "waive_charge" ) );

                stock.set_date_last_modified( results
                        .getDate( "date_last_modified" ) );

                stock.set_stock_charge( new Float( results
                        .getFloat( "stock_charge" ) ) );

                stock.set_stock_number( results.getString( "stock_name" ) );
                stock.set_stock_id( new Long( results.getLong( "stock_id" ) ) );

                if ( order == null ) {
                    order = new ListOrder();
                }

                // populate data from result set if not done already
                if ( order.get_orders_id() == null ) {
                    order.set_orders_id( new Long( results
                            .getLong( "orders_id" ) ) );

                    order.set_order_number( new Long( results
                            .getLong( "order_number" ) ) );

                    order.set_order_status( results.getString( "status" ) );
                    order.set_order_date( results.getDate( "order_date" ) );

                    order
                            .set_date_complete( results
                                    .getDate( "date_complete" ) );

                    order.set_organization_country( results
                            .getString( "organization_country" ) );

                    order.set_no_charge( TextConverter.stringToBoolean( results
                            .getString( "no_charge" ) ) );

                    order.set_person_id( new Long( results
                            .getLong( "person_id" ) ) );

                    order.set_organization_id( new Long( results
                            .getLong( "organization_id" ) ) );
                }

                // add stock to order's collection of stocks
                order.addStock( stock );
            }

            last_orders_id = results.getLong( "orders_id" );
        }
        conn.releaseResources();

        // check again to make sure we got last order
        if ( order != null && order.hasStocks() ) {
            if ( found == null ) {
                found = new Vector();
            }
            found.addElement( order );
        }

        if ( found != null && !found.isEmpty() ) {
            searchCollection = new SearchResultsCollection();
            setCommunityInfo( conn, found );
            setStockCountFlags( conn, found );
            searchCollection.setResults( found );
            searchCollection.setResultSize( recordCounter + 1 );

            // increment floor & ceiling to match real (not array) numbers
            searchCollection.setFloor( floor + 1 );
            searchCollection.setCeiling( floor + found.size() );

        }

        return searchCollection;
    }

    /**
     * Iterate through result set and save details of individual orders as
     * ListOrder objects. Since result set is made up of rows of individual
     * stocks items, only create order objects when the current order id is
     * different than the last row. ListOrder objects do not contain itemized
     * collections of individual stocks when created this way.
     * 
     * @param conn
     *            An active connection to the database
     * @param query
     *            SQL query to execute
     * @param floor
     *            Starting point of requested subset
     * @param ceiling
     *            End point of requested subset
     * @return SearchResultsCollection containing results as a Vector of
     *         ListOrder objects
     * @throws SQLException
     *             if a database error occurs
     */
    private static SearchResultsCollection processOrderResults(
            DBconnection conn, String query, int floor, int ceiling )
            throws SQLException {

        Vector found = null;
        ListOrder[] searchResults = null;
        SearchResultsCollection searchCollection = null;
        int recordCounter = 0;

        conn.setQuery( query );
        ResultSet results = conn.getResultSet();

        // only create objects for separate orders within requested subset
        // defined by floor and ceiling
        long last_orders_id = 0;
        while ( results.next() ) {
            if ( last_orders_id != results.getLong( "orders_id" ) ) {
                if ( recordCounter >= floor && recordCounter <= ceiling ) {
                    if ( found == null ) {
                        found = new Vector();
                    }

                    ListOrder order = new ListOrder();
                    order.set_orders_id( new Long( results
                            .getLong( "orders_id" ) ) );

                    order.set_order_number( new Long( results
                            .getLong( "order_number" ) ) );

                    order.set_order_status( results.getString( "status" ) );
                    order.set_order_date( results.getDate( "order_date" ) );

                    order
                            .set_date_complete( results
                                    .getDate( "date_complete" ) );

                    order.set_no_charge( TextConverter.stringToBoolean( results
                            .getString( "no_charge" ) ) );

                    order.set_person_id( new Long( results
                            .getLong( "person_id" ) ) );

                    order.set_organization_id( new Long( results
                            .getLong( "organization_id" ) ) );

                    found.addElement( order );
                }
                last_orders_id = results.getLong( "orders_id" );
                recordCounter++;
            }
        }
        conn.releaseResources();

        // save any results found
        if ( found != null && !found.isEmpty() ) {
            setCommunityInfo( conn, found );
            searchResults = new ListOrder[found.size()];
            found.copyInto( searchResults );
            searchCollection = new SearchResultsCollection();
            searchCollection.setResults( searchResults );
            searchCollection.setResultSize( recordCounter );

            // increment floor & ceiling to match real (not array) numbers
            searchCollection.setFloor( floor + 1 );
            searchCollection.setCeiling( floor + found.size() );

        }
        return searchCollection;
    }

    /**
     * Executes submitted SQL query and calculates statistics for result set.
     * Statistics calculated include total number of orders in results and total
     * of stock items represented; stock total is calculated accounting for
     * ordered quantity of stocks, not just distinct stock numbers
     * 
     * @param conn
     *            An active connection to the database
     * @param query
     *            SQL query to execute
     * @return SearchResultsCollection containing statistics results
     * @throws SQLException
     *             if a database error occurs
     */
    private static SearchResultsCollection processStatisticsResults(
            DBconnection conn, String query ) throws SQLException {

        conn.setQuery( query );
        ResultSet results = conn.getResultSet();

        // counters of distinct order #'s and all stocks in result set
        int orderCounter = 0;
        int stockCounter = 0;

        long lastOrderID = -1;
        while ( results.next() ) {

            // if current order id is different from last id,
            // increment order count
            long currentID = results.getLong( "orders_id" );
            if ( currentID != lastOrderID ) {
                orderCounter++;
                lastOrderID = currentID;
            }

            // increment stock counter by quantity ordered
            stockCounter += results.getInt( "quantity" );
        }

        conn.releaseResources();

        // create results collection - no actual results list, but
        // set number of stocks as result size & number of orders
        // as secondary result size
        SearchResultsCollection searchCollection = new SearchResultsCollection();

        searchCollection.setResultSize( stockCounter );
        searchCollection.setSecondaryResultSize( orderCounter );

        return searchCollection;

    }

    /**
     * Populates all community data for orders - allows us to remove this data
     * from main search SQL, which helps performance
     * 
     * @param conn
     *            An active connection to the database
     * @param orders
     *            List of orders to populate community info. for
     * @throws SQLException
     *             if a database error occurs
     */
    private static void setCommunityInfo( DBconnection conn, Vector orders )
            throws SQLException {

        ListOrder order = null;
        for ( Iterator iter = orders.iterator(); iter.hasNext(); ) {
            order = (ListOrder) iter.next();
            order.populateCommunityInfo( conn );
        }
    }

    /**
     * Populates stock count flags that determine whether orders contain seed or
     * DNA stocks (regardless of stocks contained by orders which are populated
     * by matching search criteria)
     * 
     * @param conn
     *            An active connection to the database
     * @param orders
     *            List of orders to populate stock count flags for
     * @throws SQLException
     *             if a database error occurs
     */
    private static void setStockCountFlags( DBconnection conn, Vector orders )
            throws SQLException {

        ListOrder order = null;
        for ( Iterator iter = orders.iterator(); iter.hasNext(); ) {
            order = (ListOrder) iter.next();
            order.setStockCountFlags( conn );
        }
    }

    /**
     * Utility method to add Person table into query, if not already there
     * 
     * @param select
     *            SELECT statement to add criteria to
     * @param joins
     *            Table joins portion of WHERE clause to add criteria to
     * @param tables
     *            List of tables already included in SQL query
     */
    private static void addPerson( StringBuffer select, StringBuffer joins,
            ArrayList tables ) {
        if ( !tables.contains( "Person" ) ) {
            select.append( ", Person p " );
            joins.append( "AND o.person_id = p.person_id " );
            tables.add( "Person" );
        }
    }

    /**
     * Utility method to add Organization table into query, if not already there
     * 
     * @param select
     *            SELECT statement to add criteria to
     * @param joins
     *            Table joins portion of WHERE clause to add criteria to
     * @param tables
     *            List of tables already included in SQL query
     */
    private static void addOrganization( StringBuffer select,
            StringBuffer joins, ArrayList tables ) {
        if ( !tables.contains( "Organization" ) ) {
            select.append( ", Organization og " );
            joins.append( "AND o.organization_id = og.organization_id " );
            tables.add( "Organization" );
        }
    }

    /**
     * Create SQL to search orders according to search values. Since some search
     * values are item specific instead of order specific, result set will
     * consist of rows of items, not orders -- meaning that result set must be
     * manually processed to group stocks from separate orders together. This
     * method will create SQL that can be used for all searches (curator, user,
     * lab & stock)
     * 
     * <p>
     * Since DNA and seed stock orders are stored in separate tables, do
     * searches as a UNION between them, if necessary to retrieve both
     * 
     * @param searchParams
     *            Search params to include in SQL query
     * @return SQL query to execute for retrieving order search results
     */
    private static String createQueryString( Map searchParams ) {

        // retrieve search parameters
        String search_in = (String) searchParams.get( "search_in" );

        Long order_number_from = (Long) searchParams.get( "order_number_from" );
        Long order_number_to = (Long) searchParams.get( "order_number_to" );

        Long person_id = (Long) searchParams.get( "person_id" );
        Long organization_id = (Long) searchParams.get( "organization_id" );

        String last_name = (String) searchParams.get( "last_name" );

        String last_name_method = (String) searchParams
                .get( "last_name_method" );

        String first_name = (String) searchParams.get( "first_name" );

        String first_name_method = (String) searchParams
                .get( "first_name_method" );

        String organization_name = (String) searchParams
                .get( "organization_name" );

        String organization_name_method = (String) searchParams
                .get( "organization_name_method" );

        String donor_last_name = (String) searchParams.get( "donor_last_name" );

        String donor_last_name_method = (String) searchParams
                .get( "donor_last_name_method" );

        String donor_first_name = (String) searchParams
                .get( "donor_first_name" );

        String donor_first_name_method = (String) searchParams
                .get( "donor_first_name_method" );

        String donor_organization_name = (String) searchParams
                .get( "donor_organization_name" );

        String donor_organization_name_method = (String) searchParams
                .get( "donor_organization_name_method" );

        Long donor_person_id = (Long) searchParams.get( "donor_person_id" );

        Long donor_organization_id = (Long) searchParams
                .get( "donor_organization_id" );

        java.util.Date donated_date_from = (java.util.Date) searchParams
                .get( "donated_date_from" );

        java.util.Date donated_date_to = (java.util.Date) searchParams
                .get( "donated_date_to" );

        java.util.Date order_date_from = (java.util.Date) searchParams
                .get( "order_date_from" );

        java.util.Date order_date_to = (java.util.Date) searchParams
                .get( "order_date_to" );

        java.util.Date last_modified_from = (java.util.Date) searchParams
                .get( "last_modified_from" );

        java.util.Date last_modified_to = (java.util.Date) searchParams
                .get( "last_modified_to" );

        java.util.Date date_complete_from = (java.util.Date) searchParams
                .get( "date_complete_from" );

        java.util.Date date_complete_to = (java.util.Date) searchParams
                .get( "date_complete_to" );

        String stock_type = (String) searchParams.get( "stock_type" );
        String order_status = (String) searchParams.get( "order_status" );
        String[] stock_number = (String[]) searchParams.get( "stock_numbers" );

        String seed_stock_center = (String) searchParams
                .get( "seed_stock_center" );

        String stock_status = (String) searchParams.get( "stock_status" );
        String waive_charge = (String) searchParams.get( "waive_charge" );
        String order_by = (String) searchParams.get( "order_by" );

        // keep track of tables already in query
        ArrayList tables = new ArrayList();

        // shouldn't get this far w/null order_by, but just in case
        if ( order_by == null ) {
            order_by = "o.order_number";
        }

        boolean addSortField = false;
        if ( order_by.equals( "p.last_name" ) ) {
            addSortField = true;
            order_by = "p.last_name_uc, p.first_name";
        }

        boolean searchDonor = ( donor_last_name != null
                || donor_first_name != null || donor_organization_name != null
                || donor_person_id != null || donor_organization_id != null
                || donated_date_from != null || donated_date_to != null );

        StringBuffer select = new StringBuffer(); // holds select statement
        StringBuffer where = new StringBuffer(); // holds all search
                                                    // parameters
        StringBuffer joins = new StringBuffer(); // holds join info.
        StringBuffer query = null; // holds entire query to be returned

        // create base query to retrieve stocks
        select.append( "SELECT o.orders_id, "
                       + "o.order_number, "
                       + "o.status, " 
                       + "o.no_charge, " 
                       + "o.order_date, "
                       + "o.date_complete, " 
                       + "ct.name AS organization_country, "
                       + "o.person_id, " 
                       + "o.organization_id, " 
                       + "os.stock_id, "
                       + "os.status AS stock_status, "
                       + "os.quantity, "
                       + "os.waive_charge, " 
                       + "os.date_last_modified, "
                       + "os.stock_charge, " 
                       + "s.name AS stock_name, " 
                       // select fields for sorting result set only
                       + "s.stock_number_prefix, " 
                       + "s.stock_number_suffix, " 
                       + "s.base_price, " 
                       + "s.fixed_price, " 
                       + "s.is_seed " );

        // add sort field if requested
        if ( addSortField ) {
            select.append( ", p.last_name_uc " );
        }

        select.append( "FROM Orders o, Orders_Stock os, Stock s, Country ct " );
        joins.append( "WHERE o.orders_id = os.orders_id "
                      + "AND os.stock_id = s.stock_id " 
                      + "AND o.organization_country_id = ct.country_id " );

        // add join to person if sorting by last name
        if ( addSortField ) {
            addPerson( select, joins, tables );
        }

        // restrict to seed or dna results if requested
        if ( search_in != null && search_in.equals( "seed" ) ) {
            where.append( "AND s.is_seed = 'T' " );
        } else if ( search_in != null && search_in.equals( "DNA" ) ) {
            where.append( "AND s.is_seed = 'F' " );

            // if "combined" is selected, restrict results to orders
            // that have both seed and dna stocks in them
        } else if ( search_in != null && search_in.equals( "combined" ) ) {
            where.append( "AND ( EXISTS(  " + "SELECT 'X' "
                    + "FROM Orders_Stock os2, Stock s2 "
                    + "WHERE os2.orders_id = o.orders_id "
                    + "AND os2.stock_id = s2.stock_id "
                    + "AND s2.is_seed = 'T' ) " + "AND EXISTS(  "
                    + "SELECT 'X' " + "FROM Orders_Stock os3, Stock s3 "
                    + "WHERE os3.orders_id = o.orders_id "
                    + "AND os3.stock_id = s3.stock_id "
                    + "AND s3.is_seed = 'F' ) ) " );
        }

        // add stock type join if requested
        if ( stock_type != null ) {
            select.append( ", StockType st " );
            joins.append( "AND s.stock_type_id = st.stock_type_id " );
            where.append( "AND st.stock_type = "
                    + TextConverter.dbQuote( stock_type ) + " " );
        }

        // append donor joins & criteria if requested
        if ( searchDonor ) {

            // search person & organization as separately aliased joins
            boolean donorPerson = ( donor_last_name != null
                    || donor_first_name != null || donor_person_id != null );

            boolean donorOrg = ( donor_organization_id != null || donor_organization_name != null );

            if ( donorPerson ) {
                select.append( ", Donor dnp, Person dp " );
                joins.append( "AND s.stock_id = dnp.stock_id "
                        + "AND os.stock_id = dnp.stock_id "
                        + "AND dnp.community_id = dp.community_id " );

                if ( donor_last_name != null ) {
                    where.append( "AND dp.last_name_uc LIKE "
                            + TextConverter.dbQuote( TextConverter.convertEnds(
                                    donor_last_name.toUpperCase(),
                                    donor_last_name_method ) ) + " ESCAPE '\\\' " );
                }

                if ( donor_first_name != null ) {
                    where.append( "AND dp.first_name_uc LIKE "
                            + TextConverter.dbQuote( TextConverter.convertEnds(
                                    donor_first_name.toUpperCase(),
                                    donor_first_name_method ) ) + " ESCAPE '\\\' " );

                }

                if ( donor_person_id != null ) {
                    where.append( "AND dp.person_id = "
                            + donor_person_id.toString() + " " );
                }
            }

            // add donor organization
            if ( donorOrg ) {
                select.append( ", Donor dno, Organization do " );
                joins.append( "AND s.stock_id = dno.stock_id "
                        + "AND os.stock_id = dno.stock_id "
                        + "AND dno.community_id = do.community_id " );

                if ( donor_organization_name != null ) {
                    where.append( "AND do.name_uc LIKE "
                            + TextConverter.dbQuote( TextConverter.convertEnds(
                                    donor_organization_name.toUpperCase(),
                                    donor_organization_name_method ) ) + " ESCAPE '\\\' " );
                }
                if ( donor_organization_id != null ) {
                    where.append( "AND do.organization_id = "
                            + donor_organization_id.toString() + " " );
                }
            }

            // make sure to append donation date to both person &
            // org. join clauses
            if ( donated_date_from != null ) {
                if ( donorPerson ) {
                    where.append( "AND dnp.date >= "
                            + TextConverter.dbQuote( donated_date_from, "mm/dd/yyyy" ) + " " );
                }

                if ( donorOrg ) {
                    where.append( "AND dno.date >= "
                            + TextConverter.dbQuote( donated_date_from, "mm/dd/yyyy") + " " );
                }
            }

            if ( donated_date_to != null ) {
                if ( donorPerson ) {
                    where.append( "AND dnp.date <= "
                            + TextConverter.dbQuote( donated_date_to, "mm/dd/yyyy") + " " );
                }

                if ( donorOrg ) {
                    where.append( "AND dno.date <= "
                            + TextConverter.dbQuote( donated_date_to, "mm/dd/yyyy") + " " );
                }
            }

        }

        // if both ids present, search range between -
        // otherwise if only one id look for exact match
        if ( order_number_from != null && order_number_to != null ) {
            where.append( "AND o.order_number >= "
                    + order_number_from.toString() + " " );

            where.append( "AND o.order_number <= " + order_number_to.toString()
                    + " " );

        } else if ( order_number_from != null ) {
            where.append( "AND o.order_number = "
                    + order_number_from.toString() + " " );

        } else if ( order_number_to != null ) {
            where.append( "AND o.order_number = " + order_number_to.toString()
                    + " " );
        }

        if ( order_date_from != null ) {
            where.append( "AND o.order_date >= "
                    + TextConverter.dbQuote( order_date_from, "mm/dd/yyyy" ) + " " );
        }

        if ( order_date_to != null ) {
            where.append( "AND o.order_date <= "
                    + TextConverter.dbQuote( order_date_to, "mm/dd/yyyy" ) + " " );
        }

        if ( date_complete_from != null ) {
            where.append( "AND o.date_complete >= "
                    + TextConverter.dbQuote( date_complete_from, "mm/dd/yyyy" ) + " " );
        }

        if ( date_complete_to != null ) {
            where.append( "AND o.date_complete <= "
                    + TextConverter.dbQuote( date_complete_to, "mm/dd/yyyy" ) + " " );
        }

        if ( order_status != null ) {
            where.append( "AND o.status  = "
                    + TextConverter.dbQuote( order_status ) + " " );
        }

        if ( person_id != null ) {
            where.append( "AND o.person_id = " + person_id + " " );
        }

        if ( organization_id != null ) {
            where.append( "AND o.organization_id = " + organization_id + " " );
        }

        if ( last_name != null ) {
            addPerson( select, joins, tables );
            where
                    .append( "AND p.last_name_uc LIKE "
                            + TextConverter
                                    .dbQuote( TextConverter.convertEnds(
                                            last_name.toUpperCase(),
                                            last_name_method ) ) + " ESCAPE '\\\' " );
        }

        if ( first_name != null ) {
            addPerson( select, joins, tables );
            where.append( "AND p.first_name_uc LIKE "
                    + TextConverter.dbQuote( TextConverter.convertEnds(
                            first_name.toUpperCase(), first_name_method ) )
                    + " ESCAPE '\\\' " );
        }

        if ( organization_name != null ) {
            addOrganization( select, joins, tables );
            where.append( " AND " );
            where.append( "og.name_uc LIKE "
                    + TextConverter.dbQuote( TextConverter.convertEnds(
                            organization_name.toUpperCase(),
                            organization_name_method ) ) + " ESCAPE '\\\' " );
        }

        if ( last_modified_from != null ) {
            where.append( "AND os.date_last_modified >= "
                    + TextConverter.dbQuote( last_modified_from, "mm/dd/yyyy" ) + " " );
        }

        if ( last_modified_to != null ) {
            where.append( "AND os.date_last_modified <= "
                    + TextConverter.dbQuote( last_modified_to, "mm/dd/yyyy" ) + " " );
        }

        if ( stock_status != null ) {
            where.append( "AND os.status = "
                    + TextConverter.dbQuote( stock_status ) + " " );
        }

        if ( waive_charge != null ) {
            where.append( "AND os.waive_charge = "
                    + TextConverter.dbQuote( waive_charge ) + " " );
        }

        if ( seed_stock_center != null ) {
            addOrganization( select, joins, tables );
            where.append( "AND og.seed_stock_center = "
                    + TextConverter.dbQuote( seed_stock_center ) + " " );
        }

        // stock number may be an array of values - if not null,
        // create a sub clause that checks for any of submitted
        // values using an OR
        if ( stock_number != null && stock_number.length > 0 ) {

            // stock number comes from Stock.name
            appendMultiple( where, stock_number, "s.name" );
        }

        // combine pieces
        query = new StringBuffer();
        query.append( select.toString() + joins.toString() + where.toString() );

        query.append( "ORDER BY " + order_by );

        // need to make sure we sub-sort by order number so items in same
        // order stay together
        if ( !order_by.equals( "o.order_number" ) ) {
            query.append( ", o.order_number" );
        }
        query.append( ", s.is_seed, " + "s.stock_number_prefix, "
                + "s.stock_number_suffix, " + "stock_name " );

        Debugger.println( query.toString() );

        return query.toString();
    }

    /**
     * Helper method to include multiple search values in search query
     * 
     * @param query
     *            Query to add search values to
     * @param values
     *            Search values to add to query as an IN(...) sub-clause
     * @param columnName
     *            Column name to search with values
     */
    private static void appendMultiple( StringBuffer query, String[] values,
            String columnName ) {
        boolean first = true;

        query.append( "AND " + columnName + " IN ( " );
        for ( int i = 0; i < values.length; i++ ) {
            if ( values[i] != null ) {
                if ( !first ) {
                    query.append( ", " );
                } else {
                    first = false;
                }
                query.append( TextConverter.dbQuote( values[i].toUpperCase() ) );
            }
        }
        query.append( ") " );
    }

    /**
     * Creates string to list search criteria for results page
     * 
     * @param searchParams
     *            Search criteria used for creating result set
     * @param resultSize
     *            Total number of results of search
     * @return Search criteria to display on results page
     */
    private static String getFormatSearchCriteria( Map searchParams,
            int resultSize ) {
        StringBuffer buffer = null;
        boolean first = true;

        String search_in = (String) searchParams.get( "search_in" );
        Long order_number_from = (Long) searchParams.get( "order_number_from" );
        Long order_number_to = (Long) searchParams.get( "order_number_to" );
        Long person_id = (Long) searchParams.get( "person_id" );
        Long organization_id = (Long) searchParams.get( "organization_id" );

        String last_name = (String) searchParams.get( "last_name" );
        String last_name_method = (String) searchParams
                .get( "last_name_method" );

        String first_name = (String) searchParams.get( "first_name" );

        String first_name_method = (String) searchParams
                .get( "first_name_method" );

        String organization_name = (String) searchParams
                .get( "organization_name" );

        String organization_name_method = (String) searchParams
                .get( "organization_name_method" );

        String donor_last_name = (String) searchParams.get( "donor_last_name" );

        String donor_last_name_method = (String) searchParams
                .get( "donor_last_name_method" );

        String donor_first_name = (String) searchParams
                .get( "donor_first_name" );

        String donor_first_name_method = (String) searchParams
                .get( "donor_first_name_method" );

        String donor_organization_name = (String) searchParams
                .get( "donor_organization_name" );

        String donor_organization_name_method = (String) searchParams
                .get( "donor_organization_name_method" );

        Long donor_person_id = (Long) searchParams.get( "donor_person_id" );

        Long donor_organization_id = (Long) searchParams
                .get( "donor_organization_id" );

        java.util.Date donated_date_from = (java.util.Date) searchParams
                .get( "donated_date_from" );

        java.util.Date donated_date_to = (java.util.Date) searchParams
                .get( "donated_date_to" );

        java.util.Date order_date_from = (java.util.Date) searchParams
                .get( "order_date_from" );

        java.util.Date order_date_to = (java.util.Date) searchParams
                .get( "order_date_to" );

        java.util.Date last_modified_from = (java.util.Date) searchParams
                .get( "last_modified_from" );

        java.util.Date last_modified_to = (java.util.Date) searchParams
                .get( "last_modified_to" );

        java.util.Date date_complete_from = (java.util.Date) searchParams
                .get( "date_complete_from" );

        java.util.Date date_complete_to = (java.util.Date) searchParams
                .get( "date_complete_to" );

        String stock_type = (String) searchParams.get( "stock_type" );
        String order_status = (String) searchParams.get( "order_status" );
        String[] stock_number = (String[]) searchParams.get( "stock_numbers" );

        String seed_stock_center = (String) searchParams
                .get( "seed_stock_center" );

        String stock_status = (String) searchParams.get( "stock_status" );
        String waive_charge = (String) searchParams.get( "waive_charge" );

        String mode = (String) searchParams.get( "mode" );

        String community_name = (String) searchParams.get( "community_name" );

        buffer = new StringBuffer();

        buffer.append( "Your query for " + search_in + " stock orders " );

        // community name is a display only field that is used on
        // many non-curator pages
        if ( community_name != null ) {

            // who/what community name is depends on search mode
            if ( mode != null ) {
                if ( mode.equals( "user" ) ) {
                    buffer.append( "placed by " );

                } else if ( mode.equals( "donor" ) || mode.equals( "donor_lab" ) ) {

                    buffer.append( "donated by " );

                } else if ( mode.equals( "pi" ) ) {
                    buffer.append( "billed to " );
                }
            }

            buffer.append( "<b>" + community_name + "</b> " );
        }

        // append curator mode parameters
        if ( mode != null && mode.equals( "curator" ) ) {

            if ( person_id != null ) {
                first = appendComma( buffer, first );
                buffer.append( "person id: " + person_id );
            }

            if ( organization_id != null ) {
                first = appendComma( buffer, first );
                buffer.append( "organization id: " + organization_id );
            }

            if ( donor_person_id != null ) {
                first = appendComma( buffer, first );
                buffer.append( "donor person id: " + donor_person_id );
            }

            if ( donor_organization_id != null ) {
                first = appendComma( buffer, first );
                buffer.append( "donor organization id: "
                        + donor_organization_id );
            }

            if ( last_name != null ) {
                first = appendComma( buffer, first );
                buffer.append( "orderer last name: "
                        + TextConverter.convertMethods( last_name_method )
                        + " " + last_name );
            }

            if ( first_name != null ) {
                first = appendComma( buffer, first );
                buffer.append( "orderer first name: "
                        + TextConverter.convertMethods( first_name_method )
                        + " " + first_name );
            }

            if ( organization_name != null ) {
                first = appendComma( buffer, first );
                buffer.append( "lab name: "
                        + TextConverter
                                .convertMethods( organization_name_method )
                        + " " + organization_name );
            }

            if ( donor_last_name != null ) {
                first = appendComma( buffer, first );
                buffer.append( "stock donor last name: "
                        + TextConverter.convertMethods( donor_last_name_method )
                        + " " + donor_last_name );
            }

            if ( donor_first_name != null ) {
                first = appendComma( buffer, first );
                buffer.append( "stock donor first name: "
                        + TextConverter
                                .convertMethods( donor_first_name_method )
                        + " " + donor_first_name );
            }

            if ( donor_organization_name != null ) {
                first = appendComma( buffer, first );
                buffer
                        .append( "stock donor organization name: "
                                + TextConverter
                                        .convertMethods( donor_organization_name_method )
                                + " " + donor_organization_name );
            }

            if ( last_modified_from != null && last_modified_to != null ) {
                first = appendComma( buffer, first );
                buffer.append( "items last updated between: "
                        + TextConverter.dateToString( last_modified_from )
                        + " and "
                        + TextConverter.dateToString( last_modified_to ) );

            } else if ( last_modified_from != null ) {
                first = appendComma( buffer, first );
                buffer.append( "items last updated on or after: "
                        + TextConverter.dateToString( last_modified_from ) );

            } else if ( last_modified_to != null ) {
                first = appendComma( buffer, first );
                buffer.append( "item(s) last updated on or before: "
                        + TextConverter.dateToString( last_modified_to ) );
            }

            if ( date_complete_from != null && date_complete_to != null ) {
                first = appendComma( buffer, first );
                buffer.append( "order completion date between: "
                        + TextConverter.dateToString( date_complete_from )
                        + " and "
                        + TextConverter.dateToString( date_complete_to ) );

            } else if ( date_complete_from != null ) {
                first = appendComma( buffer, first );
                buffer.append( "order completion date on or after: "
                        + TextConverter.dateToString( date_complete_from ) );

            } else if ( date_complete_to != null ) {
                first = appendComma( buffer, first );
                buffer.append( "order completion date on or before: "
                        + TextConverter.dateToString( date_complete_to ) );
            }

            if ( order_status != null ) {
                first = appendComma( buffer, first );
                buffer.append( "order status: " + order_status );
            }

            if ( stock_status != null ) {
                first = appendComma( buffer, first );
                buffer.append( "stock status: " + stock_status );
            }

            if ( seed_stock_center != null && !seed_stock_center.equals( "any" ) ) {

                first = appendComma( buffer, first );
                buffer.append( "seed stock center: " + seed_stock_center );
            }

            if ( waive_charge != null ) {
                first = appendComma( buffer, first );
                buffer.append( "charge waiver " + waive_charge );
            }
        }

        if ( order_number_from != null && order_number_to != null ) {
            first = appendComma( buffer, first );
            buffer.append( "order # between: " + order_number_from + " and "
                    + order_number_to );

        } else if ( order_number_from != null ) {
            first = appendComma( buffer, first );
            buffer.append( "order #: " + order_number_from );

        } else if ( order_number_to != null ) {
            first = appendComma( buffer, first );
            buffer.append( "order # is less than or equal to: "
                    + order_number_to );
        }

        if ( donated_date_from != null && donated_date_to != null ) {
            first = appendComma( buffer, first );
            buffer.append( "stocks donated between: "
                    + TextConverter.dateToString( donated_date_from ) + " and "
                    + TextConverter.dateToString( donated_date_to ) );

        } else if ( donated_date_from != null ) {
            first = appendComma( buffer, first );
            buffer.append( "stocks donated on or after: "
                    + TextConverter.dateToString( donated_date_from ) );

        } else if ( donated_date_to != null ) {
            first = appendComma( buffer, first );
            buffer.append( "stocks donated on or befores "
                    + TextConverter.dateToString( donated_date_to ) );
        }

        if ( order_date_from != null && order_date_to != null ) {
            first = appendComma( buffer, first );
            buffer.append( "order date between: "
                    + TextConverter.dateToString( order_date_from ) + " and "
                    + TextConverter.dateToString( order_date_to ) );

        } else if ( order_date_from != null ) {
            first = appendComma( buffer, first );
            buffer.append( "order date on or after: "
                    + TextConverter.dateToString( order_date_from ) );

        } else if ( order_date_to != null ) {
            first = appendComma( buffer, first );
            buffer.append( "order date on or before: "
                    + TextConverter.dateToString( order_date_to ) );
        }

        if ( stock_type != null ) {
            first = appendComma( buffer, first );
            buffer.append( "stocks of type: " + stock_type );
        }

        if ( stock_number != null && stock_number.length > 0 ) {
            first = appendComma( buffer, first );
            boolean firstNumber = true;
            buffer.append( "stock number(s): " );
            for ( int i = 0; i < stock_number.length; i++ ) {
                if ( !firstNumber ) {
                    buffer.append( ", " );
                }
                buffer.append( stock_number[i] );
                firstNumber = false;
            }
        }

        buffer.append( " resulted in <font class=\"emphasis\">" + resultSize
                + "</font> " );

        if ( resultSize == 1 ) {
            buffer.append( "match." );
        } else {
            buffer.append( "matches." );
        }

        return buffer.toString();
    }

    /**
     * Method to decide whether to append comma for separating search criteria
     * based on whether current value is first in list or not; returns new value
     * of flag which tracks this
     * 
     * @param buffer
     *            Buffer to add comma to
     * @param first
     *            If <code>true</code>, comma does not need to be added since
     *            parameter being added to buffer is the first one; if
     *            <code>false</code> comma should be added
     * @return New value of first (should always be false since after this
     *         method is called comma will always need to be added)
     */
    private static final boolean appendComma( StringBuffer buffer, boolean first ) {
        if ( !first ) {
            buffer.append( ", " );
        } else {
            buffer.append( "having " );
            first = false;
        }
        return first;
    }

}
