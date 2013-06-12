//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.4 $
// $Date: 2004/09/14 22:32:55 $
//------------------------------------------------------------------------------ 
package org.tair.tfc;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.tair.utilities.RecordNotFoundException;

/**
 * TfcDonor maps directly to the Donor table that contains data on the 
 * relationship between a Stock and a Community record. Each instance of 
 * TfcDonor should map to a single row in the Donor table.
 *
 * <p>
 * Implements Serializable so objects can be written as part of serialized 
 * stock catalog data 
 */

public class TfcDonor implements Serializable {

  /**
   * Generated serial version UID for serializable object
   */
  private static final long serialVersionUID = -6190664671968659909L;
    private BigInteger community_id;
    private Long stock_id;
    private java.util.Date donor_date;
    private Integer display_number;
    private String donor_stock_number;


    /**
     * Creates an empty instance of TfcDonor
     */
    public TfcDonor() { }


    /**
     * Creates an instance of TfcDonor that contains data for the donor 
     * relationship between the submitted community id and stock id
     *
     * @param conn An active connection to the database
     * @param community_id Community id to retrieve data for
     * @param stock_id Stock id to retrieve data for
     * @throws SQLException thrown if a database error occurs
     * @throws RecordNotFoundException if no data found for submitted community
     * and stock ids
     */
    public TfcDonor( DBconnection conn, BigInteger community_id, Long stock_id ) 
	throws RecordNotFoundException, SQLException {


	boolean found = false;

	String query =
	    "SELECT community_id, " +
	    "stock_id, " +
	    "display_number, " +
	    "donor_stock_number, " +
	    "donor_date " +
	    "FROM Donor " +
	    "WHERE community_id = ? " +
	    "AND stock_id = ?";

	conn.setQuery( query );
	conn.setQueryVariable( 1, community_id );
	conn.setQueryVariable( 2, stock_id );

	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    found = true;
	    set_community_id( results.getBigDecimal( "community_id" ).toBigInteger() );
	    set_stock_id( new Long( results.getLong( "stock_id" ) ) );
	    set_donor_date( results.getDate( "donor_date" ) );

	    int number = results.getInt( "display_number" );
	    if ( !results.wasNull() ) {
		set_display_number( new Integer( number ) );
	    }

	    set_donor_stock_number( results.getString( "donor_stock_number" ) );
	}
	conn.releaseResources();

	if ( !found ) {
	    throw new RecordNotFoundException( "No donor information found for " +
					       "community id: " + community_id + 
					       " and stock id: " + stock_id );
	}

    }
   

    public BigInteger get_community_id() {
	return community_id; 
    }

    public Long get_stock_id() {
	return stock_id; 
    }

    public Integer get_display_number() {
	return display_number; 
    }

    public java.util.Date get_donor_date() {
	return donor_date;
    }

    public void set_community_id( BigInteger id ) {
	this.community_id = id;
    }

    public void set_stock_id( Long id ) {
	this.stock_id = id; 
    }

    public void set_display_number( Integer number ) {
	this.display_number = number;
    }

    public void set_donor_date( java.util.Date donor_date ) {
	this.donor_date = donor_date;
    }

    public void set_donor_stock_number( String number ) {
	this.donor_stock_number = number;
    }

    public String get_donor_stock_number() {
	return donor_stock_number;
    }
    

    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "community_id: " + get_community_id() );
	System.out.println( "stock_id: " + get_stock_id() );
	System.out.println( "display_number: " + get_display_number() );
	System.out.println( "donor stock number: " + get_donor_stock_number() );
	System.out.println( "donor_date: " + get_donor_date() + "\n" );
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try {

	    DBconnection conn = new DBconnection();
	    BigInteger communityID = new BigInteger("211883");
	    Long stockID = new Long( 1000750053 );
	    TfcDonor donor = new TfcDonor( conn, communityID, stockID );
	    donor.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }

    

}
