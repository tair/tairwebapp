//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.14 $
// $Date: 2005/11/16 22:46:19 $
//------------------------------------------------------------------------------

package org.tair.abrc;

import java.sql.*;
import java.util.*;

import org.tair.abrc.stock.*;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * OrderCombiner is a utility class that contains functions to detect if a user
 * is ordering a stock that was ordered by another member of their lab within
 * the last 60 days. If so, UpdateOrderHandler will redirect user to a page that
 * gives the choice to keep stocks in new order or to remove them.
 */

public class OrderCombiner {

    // number of days in past to check for recent stock orders
    private static final int daysAgo = -60;

    /**
     * Returns any stocks in submitted order that were recently ordered by any
     * member of user's lab (chosen for this order). Stocks are returned as
     * <code>ListStock</code> objects so that details (date ordered, person
     * who ordered stock etc.) can be displayed. Number of days to search back
     * for duplicate orders is set as an integer constant (as of 4/11/02 value
     * is 60 days).
     * 
     * @param conn
     *            An active connection to the database
     * @param order
     *            Order now being placed that is used to check for duplicate
     *            stock orders
     * @return List of stocks in new order that were recently ordered by someone
     *         else at same lab
     * @throws SQLException
     *             thrown if a database error occurs.
     */
    public static ListStock[] getRecentStock( DBconnection conn,
                                             CompositeOrder order )
        throws SQLException {

        ListStock[] returnCollection = null;

        // check for recent stocks
        if ( order.hasStocks() ) {

            // get string representing date to start searching
            String timeFrame = calculateTimeFrame();

            StringBuffer query = new StringBuffer();
            query
                 .append( "SELECT os.orders_id, "
                          + "s.stock_id, "
                          + "o.order_date, "
                          + "s.name "
                          + "FROM Orders_Stock os, Orders o, Stock s "
                          + "WHERE os.orders_id = o.orders_id "
                          + "AND os.stock_id = s.stock_id "
                          + "AND o.organization_id = "
                          + order.get_organization_id().toString()
                          + " "
                          + "AND o.order_date >= "
                          + TextConverter.dbQuote( timeFrame )
                          + " "
                          + "AND ( os.waive_charge != "
                          + TextConverter
                                         .dbQuote( DataConstants
                                                                .getReshipNoCharge() )
                          + " OR os.waive_charge is null ) "
                          + "AND o.status != "
                          + TextConverter
                                         .dbQuote( DataConstants
                                                                .getCancelledOrder() )
                          + " " );

            if ( order.get_orders_id() != null ) {
                query.append( " AND o.orders_id != "
                              + order.get_orders_id().toString() );
            }
            query.append( "ORDER BY s.name, o.order_date" );

            conn.setQuery( query.toString() );
            System.out.println( "getRecentStock query = " + query );
            Long stockID = null;
            String stockNumber = null;
            Stock stock = null;
            CompoundVector recentStocks = null;
 
            ResultSet results = conn.getResultSet();
            while ( results.next() ) {
                stockID = new Long( results.getLong( "stock_id" ) );
                stockNumber = results.getString( "name" );
                
                stock = order.getStock( stockNumber );
                //mjr added this to accommodate non-charged or waived-fee users/orders, for
                //the confirm/reship page
                if ( stock != null && !stock.hasWaiver() ) { 
                    if ( recentStocks == null ) {
                        recentStocks = new CompoundVector();
                    }
                    recentStocks
                                .put( new Long( results.getLong( "orders_id" ) ),
                                      stockID );
                }
            }
            conn.releaseResources();

            if ( recentStocks != null && !recentStocks.isEmpty() ) {
                returnCollection = getStockOrderInfo( conn, recentStocks );
            }
        }

        return returnCollection;
    }

    /**
     * Create ListStock objects from found stock numbers to present detailed
     * info on each stock order
     */
    private static ListStock[] getStockOrderInfo( DBconnection conn,
                                                 CompoundVector recentStocks )
        throws SQLException {

        ListStock stock = null;
        Long stockID = null;
        Long orderID = null;

        ArrayList tmpList = new ArrayList();

        for ( int i = 0; i < recentStocks.size(); i++ ) {
            stockID = (Long) recentStocks.getValueAt( i );
            orderID = (Long) recentStocks.getKeyAt( i );
            stock = new ListStock( conn, orderID, stockID );
            tmpList.add( stock );
        }

        ListStock[] stocks = new ListStock[tmpList.size()];
        stocks = (ListStock[]) tmpList.toArray( stocks );

        return stocks;
    }

    /**
     * Calculates date to use for reviewing stock history while looking for
     * duplicate stock orders.
     */
    private static String calculateTimeFrame() {
        GregorianCalendar now = new GregorianCalendar();
        now.add( Calendar.DAY_OF_YEAR, daysAgo ); // set day back daysAgo
        return TextConverter.dateToString( now.getTime() );
    }

}
