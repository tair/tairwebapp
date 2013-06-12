//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.4 $
// $Date: 2005/05/03 21:21:32 $
//------------------------------------------------------------------------------
package org.tair.abrc.stock;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;


/**
 * UnorderedStock is a class to hold requested stocks that were not ordered, 
 * because of invalid ids, unavailability, or restrictions.  Unordered stock 
 * keeps collections of these different stock types so that after a stock 
 * request is received, all information about unordered stocks, and why they
 * were not ordered, can be easily passed to response pages for display
 *
 * The inner collections are:
 * <ul>
 * <li>unavailableStock - Collection of unavailable stocks
 * <li>restrictedStock - Collection of stocks restricted to academic 
 * (non-commercial) labs
 * <li>invalidStock - Collection of invalid stock numbers stored as 
 * <code>String</code>
 * <li>fwtoNASC - Collection of stocks that need to be forwarded to NASC
 * </ul>
 */
  
public class UnorderedStock implements Serializable {

    // Unavailable stocks 
    private OrderStockCollection unavailableStock;

    // Stocks not ordered because of academic only restrictions
    private OrderStockCollection restrictedStock;

    // Invalid stock numbers
    private ArrayList invalidStock;
  
    //Stocks that are unordered because the organization is European
    private OrderStockCollection fwtoNASCStock;

    /**
     * Creates an empty instance of UnorderedStock
     */
    public UnorderedStock() { }

    /**
     * Adds a single stock to the collection of stocks not ordered because
     * of unavailability
     *
     * @param stock Stock object representing stock not ordered
     */
    public void addUnavailableStock( Stock stock ) {
	if ( unavailableStock == null ) {
	    unavailableStock = new OrderStockCollection();
	}
	unavailableStock.addElement( stock );
    }

    /**
     * Adds a single stock to the collection of stocks not ordered because
     * of academic only restrictions
     *
     * @param stock Stock object representing stock not ordered
     */
    public void addRestrictedStock( Stock restricted ) {
	if ( restrictedStock == null ) {
	    restrictedStock = new OrderStockCollection();
	}
	restrictedStock.addElement( restricted );
    }

    /**
     * Adds a single stock number to the collection of invalid stock numbers
     *
     * @param stock Invalid stock number
     */
    public void addInvalidStock( String stockName ) {
	if ( invalidStock == null ) {
	    invalidStock = new ArrayList();
	}
	invalidStock.add( stockName );
    }

    /**
    * Adds a single stock number to a colleciton of stocks that should be forwarded
    * to NASC
    * 
    * @param stock ordered from european lab
    */
    public void addfwtoNASCStock(Stock stock) {
    if (fwtoNASCStock == null ) {
        fwtoNASCStock = new OrderStockCollection();
    }
    fwtoNASCStock.addElement(stock);
    }

    /**
     * Determines if collection has unavailable stocks
     *
     * @return <code>true</code> if collection has unavailable stocks or
     * <code>false</code> if collection does not have unavailable stocks
     */
    public boolean hasUnavailableStock() {
	return ( unavailableStock != null && !unavailableStock.isEmpty() );
    }


    /**
     * Retrieves iterator to cycle through collection of unavailable stocks
     * 
     * @return Iterator of <code>Stock</code> objects, or <code>null</code> if
     * no unavailable stocks are in the collection
     */
    public Iterator getUnavailableStock() {
	return hasUnavailableStock() ? unavailableStock.iterator() : null;
    }
    
    /** 
    * Determines if a collection has stocks that need to be FW to NASC
    *
    * @return <code>true</code> if collection has fwtoNASC stocks or
    * <code>false<code> if collection does not have those stocks
    */
    public boolean hasfwtoNASCStock() {
        return (fwtoNASCStock != null && !fwtoNASCStock.isEmpty() );
    }
    
    /**
    * Retrieves iterator to cycle through collection of fwtoNASC stocks
    *
    * @return Iretaor of <code>Stock</code> objects or <code>null</code> if
    * no fwtoNASC stocks are in the collection
    */
    public Iterator getfwtoNASCStock() {
        return hasfwtoNASCStock() ? fwtoNASCStock.iterator() : null;
    }
    
    /**
     * Determines if collection has restricted stocks
     *
     * @return <code>true</code> if collection has restricted stocks or
     * <code>false</code> if collection does not have restricted stocks
     */
    public boolean hasRestrictedStock() {
	return ( restrictedStock != null && !restrictedStock.isEmpty() );
    }


    /**
     * Retrieves iterator to cycle through collection of academic only stocks
     * 
     * @return Iterator of <code>Stock</code> objects, or <code>null</code> if
     * no restricted stocks are in the collection
     */
    public Iterator getRestrictedStock() {
	return hasRestrictedStock() ? restrictedStock.iterator() : null;
    }


    /**
     * Determines if collection has invalid stocks
     *
     * @return <code>true</code> if collection has invalid stocks or
     * <code>false</code> if collection does not have invalid stocks
     */
    public boolean hasInvalidStock() {
	return ( invalidStock != null && !invalidStock.isEmpty() );
    }

    /**
     * Retrieves iterator to cycle through collection of invalid stock numbers
     * 
     * @return Iterator of <code>String</code> objects, or <code>null</code> if
     * no invalid stock numbers are in the collection
     */
    public Iterator getInvalidStock() {
	return hasInvalidStock() ? invalidStock.iterator() : null;
    }


    /**
     * Determines whether an instance of UnorderedStock contains any unordered
     * stocks, or is empty
     *
     * @return <code>true</code> if inner collections of unordered stocks have 
     * stocks in them or <code>false</code> if there are no unordered stocks in
     * this object
     */
    public boolean isEmpty() {
	boolean empty = true;

	if ( hasUnavailableStock() || 
	     hasRestrictedStock() ||
	     hasInvalidStock()  ||
         hasfwtoNASCStock() ) {

	    empty = false;
	}

	return empty;
    }
}
