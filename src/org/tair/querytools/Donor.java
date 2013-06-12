//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.3 $
// $Date: 2004/09/14 22:32:46 $
//------------------------------------------------------------------------------ 
package org.tair.querytools;

import java.math.BigInteger;
import java.sql.SQLException;

import org.tair.community.ListCommunity;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcDonor;

/**
 * Donor extends ListCommunity to show abbreviated information about
 * a community record as it relates to a stock.  In addition to the
 * information in ListCommunity, Donor contains the date the stock
 * donation was made. Donor is useful when creating ListCommunityCollections
 * to reflect donors for a stock since the collection can be specially
 * populated to include this donor info if requested
 */


public class Donor extends ListCommunity {

  /**
   * Generated serial version UID for serializable object
   */
  private static final long serialVersionUID = 3220469873754331241L;
    private TfcDonor donorInfo;

    /**
     * Creates an empty instance of Donor
     */
    public Donor() { 
	super();
	donorInfo = new TfcDonor();
    }

    /**
     * Creates an instance of Donor that contains community info for 
     * submitted communityID as well as donor data for community record
     * in relation to submitted stockID.  
     *
     * @param conn An active connection to the database
     * @param communityID Community id to retrieve data for
     * @param stockID Stock id to retrieve data for   
     * @param isPerson If <code>true</code> community id refers to a record in
     * Person; if <code>false</code> community id refers to a record in 
     * Organization
     * @throws SQLException thrown if a database error occurs, or if no record 
     * found for communityID and stockID
     */
    public Donor( DBconnection conn, 
		  BigInteger communityID, 
		  Long stockID, 
		  boolean isPerson ) 
	throws SQLException {

	super(communityID, isPerson );
	donorInfo = new TfcDonor( conn, communityID, stockID );
    }



    //
    // TfcDonor wrappers
    //

    public Long getStockID() { 
	return donorInfo.get_stock_id(); 
    }

    public Integer getDisplayNumber() {
	return donorInfo.get_display_number(); 
    }

    public java.util.Date getDate() {
	return donorInfo.get_donor_date(); 
    }

    public String getDonorStockNumber() {
	return donorInfo.get_donor_stock_number();
    }

    public void setDate( java.util.Date date ) {
	donorInfo.set_donor_date( date ); 
    }

    public void setDisplayNumber( Integer number ) { 
	donorInfo.set_display_number( number );
    }

    public void setStockID( Long id ) {
	donorInfo.set_stock_id( id );  
    }

    public void setDonorStockNumber( String number ) {
	donorInfo.set_donor_stock_number( number );
    }

  
    /**
     * Overrides superclass method to keep ListCommunity and donorInfo 
     * in synch
     *
     * @param id Community id to set
     */
    public void setCommunityID( BigInteger id ) { 
	donorInfo.set_community_id( id ); 
	super.setCommunityID( id );
    }

    /**
     * For unit testing only
     */
    public void test() {
	//super.test();
	donorInfo.test();
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
	try {

	    DBconnection conn = new DBconnection();
	    BigInteger communityID = new BigInteger("211537");
	    Long stockID = new Long( 500209898 );
	    boolean isPerson = false;
	    Donor donor = new Donor( conn, communityID, stockID, isPerson );
	    donor.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}
    }
}
