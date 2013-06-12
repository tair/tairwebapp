//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.19 $
// $Date: 2006/06/15 21:27:20 $
//------------------------------------------------------------------------------ 

package org.tair.querytools;

import java.util.*;
import java.sql.*;
import org.tair.community.*;

import org.tair.querytools.*;
import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * StockDetail is a composite class to represent all information
 * associated with an entry in the Stock table for display
 * on the stock detail page. StockDetail contains an instance of 
 * <code>TfcStock</code>, and collections of all donors, vectors 
 * and libraries and germplasms associated, to stock in addition to 
 * all information in <code>TairObjectDetail</code> superclass.
 */


public class StockDetail extends TairObjectDetail {

    private TfcStock stock;

    // clones associated to stock - stored as Clone objects
    private CloneCollection clones;

    // vectors associated to stock - stored as TfcVector objects
    private ArrayList vectors;

    // libraries associated to  stock - stored as TfcLibrary objects
    private LibraryCollection libraries;
  
    // donors for stock - stored as ListCommunity objects
    private ListCommunityCollection donors;

    // associated germplasms for stock - stored as Germplasm objects
    private GermplasmCollection germplasms;

    // host strains associated to stock - stored as HostStrain objects
    private HostStrainCollection hostStrains;


    // parent stocks for this stock (if stock is member of set or pool) - stored
    // as StockObject objects
    private StockCollection parentStocks;

    // member stocks of this stock (if stock itself is a set or pool) - stored
    // as StockObject objects.  Since a set or pool may have more member stocks
    // than is feasible to display on the stock detail page, this collection 
    // will have at most 10 stocks in it along with a boolean flag to determine
    // if full list is being shown, or if a link to stock search results page 
    // is needed
    private StockCollection memberStocks;
  

    /**
     * Creates an empty instance of StockDetail
     */
    public StockDetail() { }


    /**
     * Creates an instance of StockDetail that contains all data for 
     * supplied stock_id.
     *
     * @param conn An active connection to the database
     * @param stockID The stock_id to retrieve data for
     * @throws RecordNotFoundException if no entry found for stockID
     * @throws SQLException thrown if a database error occurs 
     */
    public StockDetail( DBconnection conn, Long stockID ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, stockID );
    }

    /**
     * Creates an instance of StockDetail with all information associated 
     * to supplied stock name.
     *
     * @param conn An active connection to the database
     * @param name Name to retrieve data for
     * @throws RecordNotFoundException if no entry found for name
     * @throws SQLException thrown if a database error occurs
     */
    public StockDetail( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {

	get_information( conn, name );
    }


    /**
     * Retrieve all information for stock with submitted name.
     *
     * @param conn An active connection to the database
     * @param name Stock name to retrieve data for
     * @throws RecordNotFoundException if no entry found for name
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name )
	throws SQLException {

	Long stockID = TfcStock.retrieveStockID( conn, name );

	if ( stockID == null ) {
	    throw new RecordNotFoundException( "No stock found with stock " +
					       "number: " + name );
	}
	
    get_information( conn, stockID );
    
    
    
    }


    /**
     * Retrieve all information for stock with submitted stockID. Method 
     * implemented to satisfy the Detail interface
     *
     * @param conn An active connection to the database
     * @param stockID Stock id to retrieve data for
     * @throws RecordNotFoundException if no entry found for id
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, Long stockID ) 
	throws SQLException {

        stock = new TfcStock( conn, stockID );
        super.populateBaseObject( stock );
    
        if ( stock.get_is_obsolete() == true ) { 
            throw new RecordNotFoundException( "The stock you are trying to view (number : " 
            + stock.get_name() + ") no longer exists ");
        }

        donors = new ListCommunityCollection( conn, stockID, "donor" );

        germplasms = new GermplasmCollection( conn, stockID, "stock" );
        germplasms.populateTaxons( conn );

        clones = new CloneCollection( conn, stockID, "stock" );
        populateVectors( conn );
        libraries = new LibraryCollection( conn, stockID, "stock" );

	hostStrains = new HostStrainCollection( conn, stockID );

        // get pools/sets this stock is a member of
        parentStocks = new StockCollection( conn, stockID, "member_stock" );

        // get stocks contained by this stock (if a pool or a set)
        memberStocks = new StockCollection( conn, 
					    stock.get_tair_object_id(), 
					    "parent_stock" );
      
	// populate superclass data
	getTairObjectInformation( conn );
    }

    
    //
    // TfcStock wrappers
    //

    public void set_stock_id( Long id ) {
	stock.set_stock_id( id ); 
    }

    public void set_stock_type_id( Long type ) {
	stock.set_stock_type_id( type );
    }

    public void set_stock_availability_type_id( Long avail ) {
	stock.set_stock_availability_type_id( avail );
    }

    public void set_fixed_price( Boolean fixed ) {
	stock.set_fixed_price( fixed );
    }

    public void set_express_shipping( Float charge ) {
    stock.set_express_shipping_charge( charge );
    }
    
    public void set_express_shipping_required( Boolean expressRequired ) {
    stock.set_express_shipping_required( expressRequired );
    }
    
    public void set_base_price( Float price ) {
	stock.set_base_price( price );
    }

    public void set_description( String descr ) {
	stock.set_description( descr );
    }

    public void set_name( String name ) { 
	stock.set_name( name );
    }

    public void set_is_seed( Boolean seed ) {
	stock.set_is_seed( seed );
    }

    public void set_is_restricted( Boolean restricted ) {
	stock.set_is_restricted( restricted );
    }

    public void set_stock_type( String type ) {
	stock.set_stock_type( type );
    }

    public void set_stock_availability_type( String type ) {
	stock.set_stock_availability_type( type );
    }

    public void set_is_molecular_mapping( Boolean is_molecular_mapping ) {
	stock.set_is_molecular_mapping( is_molecular_mapping );
    }

    public void set_is_classical_mapping( Boolean is_classical_mapping ) {
	stock.set_is_classical_mapping( is_classical_mapping );
    }

    public void set_NASC_request( Boolean NASC_request ) {
	stock.set_NASC_request( NASC_request );
    }

    public void set_NASC_request_fee( Boolean NASC_request_fee ) {
	stock.set_NASC_request_fee( NASC_request_fee );
    }

    public void set_format_received( String format_received ) { 
	stock.set_format_received( format_received ); 
    }

    public void set_maintenance_method( String maintenance_method ) {
	stock.set_maintenance_method( maintenance_method );
    }

    public void set_media( String media ) {
	stock.set_media( media );
    }

    public void set_growth_temperature( String growth_temperature ) {
	stock.set_growth_temperature( growth_temperature );
    }

    public void set_duration_of_growth( String duration_of_growth ) { 
	stock.set_duration_of_growth( duration_of_growth );
    }

    public void set_format_shipped( String format_shipped ) { 
	stock.set_format_shipped( format_shipped );
    }

    public void set_kit_contents( String kit_contents ) { 
	stock.set_kit_contents( kit_contents );
    }

    public void set_number_in_set( Long number_in_set ) {
	stock.set_number_in_set( number_in_set );
    }

    public void set_num_lines( Integer num_lines ) {
	stock.set_num_lines( num_lines ); 
    }

    public void set_box( String box ) {
	stock.set_box( box ); 
    }

    public void set_position( String position ) {
	stock.set_position( position );
    }

    public void set_location( String location ) {
	stock.set_location( location );
    }

    public void set_has_stock_notes( Boolean has_stock_notes ) { 
	stock.set_has_stock_notes( has_stock_notes ); 
    }

    public void set_MTA_signature( Boolean MTA_signature ) {
	stock.set_MTA_signature( MTA_signature );
    }

    public void set_ABRC_comments( String ABRC_comments ) { 
	stock.set_ABRC_comments( ABRC_comments );
    }

    public void set_date_entered( java.util.Date date_entered ) { 
	stock.set_date_entered( date_entered ); 
    }

    public void set_date_last_modified( java.util.Date date_last_modified ) {
	stock.set_date_last_modified( date_last_modified );
    }

    public void set_release_date( java.util.Date release_date ) { 
	stock.set_release_date( release_date ); 
    }

    public void set_is_obsolete( Boolean is_obsolete ) {
	stock.set_is_obsolete( is_obsolete );
    }

    public void set_stock_availability_comment( String stock_availability_comment ) {
	stock.set_stock_availability_comment( stock_availability_comment );
    }
    
    public Long get_stock_id() {
	return stock.get_stock_id();
    }

    public Long get_stock_type_id() {
	return stock.get_stock_type_id();
    }

    public Long get_stock_availability_type_id() {
	return stock.get_stock_availability_type_id();
    }

    public Boolean get_express_shipping_required() {
    return stock.get_express_shipping_required();
    }
    
    public Boolean get_fixed_price() {
	return stock.get_fixed_price();
    }

    public String get_format_base_price() {
	return stock.get_format_base_price(); 
    }

    public Float get_base_price() { 
	return stock.get_base_price();
    }

    public String get_format_commercial_price() {
	return stock.get_format_commercial_price();
    }

    public String get_format_express_shipping_charge() {
    return stock.get_format_express_shipping_charge();
    }
    
    public String get_description() {
	return stock.get_description();
    }

    public String get_abbrev_description() {
	return stock.get_abbrev_description();
    }

    public String get_name() { 
	return stock.get_name();
    }

    public Boolean get_is_seed() {
	return stock.get_is_seed();
    }

    public Boolean get_is_restricted() {
	return stock.get_is_restricted();
    }

    public String get_stock_type() { 
	return stock.get_stock_type(); 
    }

    public String get_stock_availability_type() {
	return stock.get_stock_availability_type();
    }

    public String get_stock_availability_comment() {
	return stock.get_stock_availability_comment();
    }

    public Boolean get_is_molecular_mapping() { 
	return stock.get_is_molecular_mapping();
    }

    public Boolean get_is_classical_mapping() {
	return stock.get_is_classical_mapping();
    }

    public Boolean get_NASC_request() { 
	return stock.get_NASC_request();
    }

    public Boolean get_NASC_request_fee() {
	return stock.get_NASC_request_fee();
    }

    public String get_format_received() {
	return stock.get_format_received();
    }

    public String get_maintenance_method() { 
	return stock.get_maintenance_method();
    }

    public String get_media() { 
	return stock.get_media(); 
    }

    public String get_growth_temperature() {
	return stock.get_growth_temperature();
    }

    public String get_duration_of_growth() {
	return stock.get_duration_of_growth();
    }

    public String get_format_shipped() {
	return stock.get_format_shipped();
    }

    public String get_kit_contents() {
	return stock.get_kit_contents();
    }

    public Long get_number_in_set() {
	return stock.get_number_in_set(); 
    }

    public Integer get_num_lines() { 
	return stock.get_num_lines();
    }

    public String get_box() {
	return stock.get_box();
    }

    public String get_position() {
	return stock.get_position();
    }

    public String get_location() { 
	return stock.get_location(); 
    }

    public Boolean get_has_stock_notes() {
	return stock.get_has_stock_notes();
    }

    public Boolean get_MTA_signature() { 
	return stock.get_MTA_signature(); 
    }

    public String get_ABRC_comments() {
	return stock.get_ABRC_comments();
    }

    public java.util.Date get_date_last_modified() {
	return stock.get_date_last_modified(); 
    }

    public java.util.Date get_release_date() { 
	return stock.get_release_date();
    }

    public Boolean get_is_obsolete() {
	return stock.get_is_obsolete();
    }

    public java.util.Date get_date_entered() { 
        return stock.get_date_entered();
    }
    
    public String get_original_name() { 
        return stock.get_original_name();
    }

    /**
     * Retrieves stock donors for this stock
     *
     * @return Stock donors as an <code>Iterator</code> of 
     * <code>ListCommunity</code> objects, or <code>null</code> if no 
     * donors for this stock
     */
    public Iterator getDonors() { 
        return hasDonors() ? donors.iterator() : null; 
    }


    /**
     * Determines is stock has donors associated to it
     * 
     * @return <code>true</code> if stock has donors associated to it;
     * <code>false</code> if no donors associated to stock
     */
    public boolean hasDonors() { 
        return ( donors != null && !donors.isEmpty() );
    }
    
    
    /**
     * Determines if stock has clones associated to it
     *
     * @return <code>true</code> if stock has clones associated
     * to it; <code>false</code> if no clones associated to
     * stock
     */
    public boolean hasClones() {
        return ( clones != null && !clones.isEmpty() );
    }
    
    /**
     * Retrieves clones associated to stock
     *
     * @return Clones associated to stock as an <code>Iterator</code>
     * of <code>Clone</code> objects, or <code>null</code> if no
     * clones associated to stock.
     */
    public Iterator getClones() { 
        return hasClones() ? clones.iterator() : null; 
    }
    
    /**
     * Determines if stock has vectors associated to it
     *
     * @return <code>true</code> if stock has vectors associated to
     * it; <code>false</code> if no vectors associated to stock
     */
    public boolean hasVectors() {
        return ( vectors != null && !vectors.isEmpty() );
    }
    
    
    /**
     * Retrieves vectors associated to stock
     *
     * @return Vectors associated to stock as an <code>Iterator</code>
     * of <code>TfcVector</code> objects, or <code>null</code> if no 
     * vectors associated to stock
     */
    public Iterator getVectors() { 
        return hasVectors() ? vectors.iterator() : null;
    }
    
    /**
     * Determines if stock has vector data through associated clone(s) of stock.
     * This is different than other vector data which is retrieved only if
     * vector is directly linked to stock.  This method determines if stock's
     * associated clones have any vector data for display.
     *
     * @return <code>true</code> if stock has vector data through clone(s)
     * associated to stock, or <code>false</code> if no associated vector
     * data to display
     */
    public boolean hasCloneVectors() {
	boolean hasCloneVectors = false;

	if ( hasClones() ) {
	    Clone clone = null;
	    Iterator iter = getClones();
	    while ( iter.hasNext() ) {
		clone = (Clone) iter.next();
		if ( clone.get_vector_id() != null ) {
		    hasCloneVectors = true;
		    break;
		}
	    }
	}

	return hasCloneVectors;
    }

    /**
     * Retrieves vector data associated to stock's clone(s). This is different
     * from vector data returned by getVectors() which will only return
     * vectors directly associated to stock.
     *
     * @return Vector data for stock's associated clone(s) as an 
     * <code>Iterator</code> of <code>TfcVector</code> objects, or 
     * <code>null</code> if no clone vector data available.
     */
    public Iterator getCloneVectors() {
	Iterator returnIter = null;

	if ( hasClones() ) {
	    ArrayList cloneVectors = null;
	    Clone clone = null;
	    Iterator iter = getClones();

	    while ( iter.hasNext() ) {
		clone = (Clone) iter.next();
		if ( clone.get_vector_id() != null ) {
		    if ( cloneVectors == null ) {
			cloneVectors = new ArrayList();
		    }
		    cloneVectors.add( clone.getVector() );
		}
	    }

	    if ( cloneVectors != null ) {
		returnIter = cloneVectors.iterator();
	    }
	}

	return returnIter;
    }

     
    /**
     * Determines if stock has libraries associated to it
     * 
     * @return <code>true</code> if stock has libraries associated to
     * it; <code>false</code> if no libraries associated to stock
     */
    public boolean hasLibraries() {
        return ( libraries != null && !libraries.isEmpty() );
    }
    
    /**
     * Retrieves libraries associated to stock
     *
     * @return Libraries associated to stock as an <code>Iterator</code>
     * of <code>TfcLibrary</code> objects, or <code>null</code> if no 
     * libraries associated to stock
     */
    public Iterator getLibraries() { 
        return hasLibraries() ? libraries.iterator() : null;
    }
    
    /**
     * Determines if stock has germplasms associated to it
     * 
     * @return <code>true</code> if stock has germplasms associated to
     * it; <code>false</code> if no germplasms associated to stock
     */
    public boolean hasGermplasms() {
        return ( germplasms != null && !germplasms.isEmpty() );
    }
    
    /**
     * Retrieves germplasms associated to stock
     *
     * @return Germplasms associated to stock as an <code>Iterator</code>
     * of <code>Germplasm</code> objects, or <code>null</code> if no 
     * germplasms associated to stock
     */
    public Iterator getGermplasms() { 
        return hasGermplasms() ? germplasms.iterator() : null;
    }
    
    
    /**
     * Determines if stock has host strains associated to it
     * 
     * @return <code>true</code> if stock has host strains associated to
     * it; <code>false</code> if no host strains associated to stock
     */
    public boolean hasHostStrains() {
        return ( hostStrains != null && !hostStrains.isEmpty() );
    }
    
    /**
     * Retrieves host strains associated to stock
     *
     * @return Host strains associated to stock as an <code>Iterator</code>
     * of <code>HostStrain</code> objects, or <code>null</code> if no 
     * host strains associated to stock
     */
    public Iterator getHostStrains() { 
        return hasHostStrains() ? hostStrains.iterator() : null;
    }

    
    /**
     * Determines if stock is a member of a set or pool, and has parent stocks
     * for display
     * 
     * @return <code>true</code> if stock is member of a set or pool and has
     * parent stocks, or <code>false</code> if no parent stocks associated to 
     * stock
     */
    public boolean hasParentStocks() {
        return ( parentStocks != null && !parentStocks.isEmpty() );
    }
    
    /**
     * Retrieves any stock sets or pools this stock is a member of
     *
     * @return Stock sets or pools this stock is a member of as an 
     * <code>Iterator</code> of <code>StockObject<</code> objects, or 
     * <code>null</code> if no parent stocks for this stock.
     */
    public Iterator getParentStocks() {
        return ( hasParentStocks() ) ? parentStocks.iterator() : null; 
    }
    
    
    /**
     * Determines if stock is a set or pool and contains member stocks
     * for display
     * 
     * @return <code>true</code> if stock is a set or pool stock  and has
     * member stocks, or <code>false</code> if no member stocks associated 
     * to stock
     */
    public boolean hasMemberStocks() {
        return ( memberStocks != null && !memberStocks.isEmpty() );
    }
    
    /**
     * Retrieves stocks this stock contains if stock is a pool or set
     *
     * @return Member stocks associated to this stock as an 
     * <code>Iterator</code> of <code>StockObject</code> objects, or 
     * <code>null</code> if no member stocks for this stock.
     */
    public Iterator getMemberStocks() {
        return ( hasMemberStocks() ) ? memberStocks.iterator() : null;
    }
    
    
    /**
     * Determines if list of member stocks is an abbreviated list, in which 
     * case a hyperlink should be created to show full list using the seed 
     * or dna stock search results page. This is needed for cases where full 
     * list of member stocks is so long that it's impractical to show the full
     * list on the stock detail page. 
     *
     * @return <code>true</code> if this stock contains more member stocks than
     * are currently available for display through this detail object, or 
     * <code>false</code> if collection of member stocks contains all member 
     * stocks for this stock
     */
    public boolean memberStocksAbbreviated() {
        return ( hasMemberStocks() && memberStocks.isAbbreviatedList() );
    }
    
    /**
     * If number of stocks in collection is an abbreviated list, this
     * method will return the total number of stocks that would be in the 
     * collection if results hadn't been limited. This is useful for showing 
     * info. when displaying an abbreviated list like "showing 10 of 43 stocks".
     *
     * <p>
     * NOTE: if collection is not an abbreviated collection (i.e. 
     * if memberIsAbbreviated() returns <code>false</code>), this method will
     * return the same number as if getMemberStockSize() were called
     *
     * @return Number of stocks that would be in collection if collection size 
     * had not been limited 
     */
    public int getTotalMemberStocks() {
        int fullCount = 0;
	
        if ( hasMemberStocks() ) {
            if ( memberStocksAbbreviated() ) {
                fullCount = memberStocks.getFullCount();
            } else {
                fullCount = memberStocks.size();
            }
        }
        return fullCount;
    }
    
    /**
     * Determines number of member stocks in inner collection. This method 
     * differs from getFullCount() in that it will always return the absolute 
     * number of stocks in the collection, whereas getFullCount() will return 
     * the number of stocks that would be in the collection if collection size
     * hadn't been limited during population
     *
     * @return number of member stocks in inner collection
     */
    public int getNumberMemberStocks() {
        return ( hasMemberStocks() ) ? memberStocks.size() : 0;
    }
    
    
    
    /**
     * Get all vectors associated with stock
     */
    private void populateVectors( DBconnection conn )  throws SQLException {
        String query = null;
        ArrayList ids = null;
        ResultSet results = null;
        TfcVector vector = null;
        Iterator iter = null;

        if ( get_stock_id() != null ) {
            query = 
                "SELECT v.vector_id " +
                "FROM Vector v, TairObject_Stock ts " +
                "WHERE v.tair_object_id = ts.tair_object_id " +
                "AND ts.stock_id = " + get_stock_id().toString();
            conn.setQuery( query );
            results = conn.getResultSet();
            while ( results.next() ) {
                if ( ids == null ) {
                    ids = new ArrayList();
                }
                ids.add( new Long( results.getLong( "vector_id" ) ) );
            }
            conn.releaseResources();

            if ( ids != null && !ids.isEmpty() ) {
                if ( vectors == null ) {
                    vectors = new ArrayList();
                }
                iter = ids.iterator();
                while ( iter.hasNext() ) {
                    vector = new TfcVector( conn, (Long) iter.next() );
                    vectors.add( vector );
                }
            }
        }
    }


    /**
     * For unit testing only
     */
    public void test() {
	super.test();
	
        System.out.println( "**** StockDetail content test end ****" );
	stock.test();
        System.out.println( "accession: " + getAccession() );

        if ( clones != null ) {
            clones.test();
        }
    
        Iterator iter = null;
        if ( hasVectors() ) {
            iter = getVectors();
            while ( iter.hasNext() ) {
                TfcVector vector = (TfcVector) iter.next();
                vector.test();
            }
        }

        if ( hasLibraries() ) {
            libraries.test();
        }

        /*if ( hasDonors() ) {
            donors.test();
        }*/

        if ( hasGermplasms() ) {
            germplasms.test();
        }
        System.out.println( "**** StockDetail content test end ****" );
    }
 

    /**
    * For unit testing only
    */
    public static void main( String[] args ) {
        DBconnection conn = null;
        try {
            conn = new DBconnection();
            //      StockDetail stock = new StockDetail( conn, new Long( 32322 ) );
            StockDetail stock = new StockDetail( conn, new Long( 33133 ) );

            System.out.println( "----- Using numeric ID -----" );
            stock.test();

            stock = new StockDetail( conn, "100A1" );
            System.out.println( "----- Using string name -----" );
            stock.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
