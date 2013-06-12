//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.56 $
// $Date: 2006/02/15 01:55:55 $
//------------------------------------------------------------------------------

package org.tair.utilities;

import java.util.*;

/**
 * DataConstants holds literal constants for symbolic reference throughout the
 * TAIR application. Several members are used for building consistent HTML
 * entities with <code>HTMLFactory</code>.
 * 
 * 
 * @see HTMLFactory
 */

public class DataConstants {

	public static final String ORDER_STATE = "order-state";
	public static final String ORDER_PLACED = "order-placed";

    // Two collections of US/Canada states. Problem is, sometimes we want list
    // ordered alphabetically by display name (not abbreviation [meaning that
    // pairs need to be stored in TreeMap using display name as key] ) and
    // sometimes we want to get display name using abbreviation as key. Quick
    // 'n' dirty is to just store two collections, rather than figure out a
    // nicer solution and change it everywhere on the site. Literal list is
    // written out once; on static initialization, MENU_REGIONS is populated
    // from REGIONS, so at least we can keep the list normalized...

    // States in US & Canada -- stored w/abbrev as key & display value as value
    private static final TreeMap REGIONS = new TreeMap();

    // States in US & Canada -- stored w/display value as key & abbrev as value
    private static final TreeMap MENU_REGIONS = new TreeMap();

    // organization types & display values
    private static final TreeMap ORG_TYPES = new TreeMap();

    /**
     * Retrieve collection of states in US and Canada with each state's
     * abbreviation as a <code>String</code> key to the <code>String</code>
     * value of the state's full name.
     * 
     * @return Map containing US & Canada states w/abbreviations
     */
    public static final TreeMap getRegions() {
        return REGIONS;
    }

    /**
     * Retrieve collection of states in US and Canada with each state's full
     * name as a <code>String</code> key to the <code>String</code>
     * abbreviation. Used to make HTML select menus in alphabetical order by
     * display name
     * 
     * @return Map containing US & Canada states w/abbreviations
     */
    public static final TreeMap getMenuRegions() {
        return MENU_REGIONS;
    }

    /**
     * Retrieves collection of organization types for Community records with
     * database value as a <code>String</code> referencing a formatted
     * <code>String</code> value for display.
     * 
     * @return Map of organization types and display values
     */
    public static final TreeMap getOrganizationTypes() {
        return ORG_TYPES;
    }

    /**
     * Retrieves string value of "lab" organization type. Since labs are treated
     * differently from other organizations throughout the Community and
     * Ordering functions of TAIR, a given organization's type must be compared
     * to this lab constant often to determine if the organization is a lab or
     * not.
     */
    public static final String getLabType() {
        return "lab";
    }

    /**
     * Retrieves list of valid job titles for affiliations
     * 
     * @return Array of job titles
     */
    public static final String[] getAffiliationTitles() {

        String[] titles = new String[] { "Advisory Board Member",
                                        "Assistant Professor",
                                        "Associate Professor",
                                        "Board Member",
                                        "Coordinator",
                                        "Curator",
                                        "Director",
                                        "Elementary School Student",
                                        "Elementary School Teacher",
                                        "Graduate Student",
                                        "Group Leader",
                                        "High School Student",
                                        "High School Teacher",
                                        "Lecturer",
                                        "Librarian",
                                        "Middle School Student",
                                        "Middle School Teacher",
                                        "Post-Doctoral Researcher",
                                        "President ",
                                        "Professor",
                                        "Programmer",
                                        "Project Leader",
                                        "Research Assistant",
                                        "Research Associate",
                                        "Research Fellow",
                                        "Research Scientist",
                                        "Secretary",
                                        "Senior Lecturer",
                                        "Senior Research Officer",
                                        "Teacher",
                                        "Undergraduate Student",
                                        "Unknown",
                                        "Other" };

        return titles;
    }

    /**
     * Retrieve String value of community status for "new".
     * 
     * @return String value of community status for "new"
     */
    public static final String getNewStatus() {
        return "new";
    }

    /**
     * Retrieve String value of community status for "active".
     * 
     * @return String value of community status for "active"
     */
    public static final String getActiveStatus() {
        return "active";
    }

    /**
     * Retrieve String value of community status for "inactive".
     * 
     * @return String value of community status for "inactive"
     */
    public static final String getInactiveStatus() {
        return "inactive";
    }

    /**
     * Retrieve all community status constants combined in an Array
     * 
     * @return All community status constants combined in an Array
     */
    public static final String[] getStatusCodes() {

        String[] statusCodes = new String[] { getNewStatus(),
                                             getActiveStatus(),
                                             getInactiveStatus() };

        return statusCodes;
    }

    /**
     * Retrieve values for organisms of interest as a String array
     * 
     * @return list of organisms of interest for community profiles
     */
    public static final String[] getOrganismsOfInterest() {
        String[] organisms = new String[] { "Arabidopsis",
                                           "Legumes",
                                           "Maize",
                                           "Potato",
                                           "Rice",
                                           "Tomato",
                                           "Wheat",
                                           "Animals",
                                           "Fungi",
                                           "Bacteria" };

        return organisms;
    }

    /**
     * Retrieves stock center code for ABRC. Stock center codes are associated
     * with countries, so that each country has a designated seed stock center
     * they should use. North and South American countries all have ABRC as
     * their primary seed stock center.
     * 
     * @return Database value for ABRC as stock center
     */
    public static final String getABRCStockCenter() {
        return "ABRC";
    }

    /**
     * Retrieves stock center code for NASC. Stock center codes are associated
     * with countries, so that each country has a designated seed stock center
     * they should use. European countries have NASC as their primary seed stock
     * center
     * 
     * @return Database value for NASC as stock center
     */
    public static final String getNASCStockCenter() {
        return NASC_STOCK_CENTER;
    }

	public static final String NASC_STOCK_CENTER = "NASC";

    /**
     * Retrieves stock center code for countries that may use either ABRC or
     * NASC for seed stock. Stock center codes are associated with countries, so
     * that each country has a designated seed stock center they should use.
     * Countries outside of North America, South America and Europe may use
     * either ABRC or NASC for seeds.
     */
    public static final String getOptionalStockCenter() {
        return "optional";
    }

    /**
     * Retrieves string value of order status for "new".
     * 
     * @return String value of order status for "new"
     */
    public static final String getNewOrder() {
        return "new";
    }

    /**
     * Retrieves string value of order status for "in progress".
     * 
     * @return String value of order status for "in progress"
     */
    public static final String getInProgressOrder() {
        return "in_progress";
    }

    /**
     * Retrieves string value of order status for "completed".
     * 
     * @return String value of order status for "completed"
     */
    public static final String getCompletedOrder() {
        return "completed";
    }

    /**
     * Retrieves string value of order status for "cancelled".
     * 
     * @return String value of order status for "cancelled"
     */
    public static final String getCancelledOrder() {
        return "cancelled";
    }

    /**
     * Retrieves all order status constants combined in an Array
     * 
     * @return Array containing all order status constants
     */
    public static final String[] getOrderStatusCodes() {
        String[] statusCodes = new String[] { getNewOrder(),
                                             getInProgressOrder(),
                                             getCompletedOrder(),
                                             getCancelledOrder() };

        return statusCodes;
    }

    /**
     * Retrieves string value of stock item status for "new".
     * 
     * @return Constant value for stock item status of "new"
     */
    public static final String getNewStock() {
        return "new";
    }

    /**
     * Retrieves string value of stock item status for "in progress".
     * 
     * @return Constant value for stock item status of "in progress"
     */
    public static final String getInProgressStock() {
        return "in_progress";
    }

    /**
     * Retrieves string value of stock item status for "shipped".
     * 
     * @return Constant value for stock item status of "shipped"
     */
    public static final String getShippedStock() {
        return "shipped";
    }

    /**
     * Retrieves string value of stock item status for "back ordered".
     * 
     * @return Constant value for stock item status of "back ordered"
     */
    public static final String getBackOrderedStock() {
        return "back_ordered";
    }

    /**
     * Retrieves string value of stock item status for "inactive".
     * 
     * @return Constant value for stock item status of "inactive"
     */
    public static final String getInactiveStock() {
        return "inactive";
    }

    /**
     * Retrieves string value of stock item status for "waiting for MTA".
     * 
     * @return Constant value for stock item status of "waiting for MTA"
     */
    public static final String getMTAStock() {
        return "waiting_for_MTA";
    }

    /**
     * Retrieves string value of stock item status for "forwarded to NASC".
     * 
     * @return Constant value for stock item status of "forwarded to NASC"
     */
    public static final String getNASCStock() {
        return "forwarded_to_NASC";
    }

    /**
     * Retrieves string value of stock item status for "NASC will ship"
     * 
     * @return Constant value for stock item status of "NASC will ship"
     */
    public static final String getNASCShipStock() {
        return "NASC_will_ship";
    }

    /**
     * Retrieves all stock item status constants combined in an array
     * 
     * @return Array of all stock item status constants
     */
    public static final String[] getStockStatusCodes() {
        String[] statusCodes = new String[] { getNewStock(),
                                             getInProgressStock(),
                                             getBackOrderedStock(),
                                             getShippedStock(),
                                             getMTAStock(),
                                             getNASCStock(),
                                             getNASCShipStock(),
                                             getInactiveStock() };

        return statusCodes;
    }

	public static final String AVAILABLE_STOCK = "available";

    /**
     * Retrieves string value of stock availability type of "available"
     */
    public static final String getAvailableStock() {
        return AVAILABLE_STOCK;
    }

	public static final String UNAVAILABLE_STOCK = "not_available";

    /**
     * Retrieves string value of stock availability type of "available_soon"
     */
    public static final String getAvailableSoonStock() {
        return "available_soon";
    }

    /**
     * Retrieves string value of stock availability type of "unavailable"
     */
    public static final String getUnavailableStock() {
        return UNAVAILABLE_STOCK;
    }

    /**
     * Retrieves string value of stock availability type of unknown (other than
     * available/unavailable)
     */
    public static final String getUnknownStock() {
        return "unknown";
    }

    /**
     * Retrieves string value of invoice item status for "new"
     * 
     * @return Constant value for invoice item status of "new"
     */
    public static final String getNewInvoice() {
        return "new";
    }

    /**
     * Retrieves string value of invoice item status for "in progress"
     * 
     * @return Constant value for invoice item status of "in progress"
     */
    public static final String getInProgressInvoice() {
        return "in_progress";
    }

    /**
     * Retrieves string value of invoice item status for "paid in full"
     * 
     * @return Constant value for invoice item status of "paid in full"
     */
    public static final String getPaidInvoice() {
        return "paid_in_full";
    }

    /**
     * Retrieves string value of invoice item status for "cancelled"
     * 
     * @return Constant value for invoice item status of "cancelled"
     */
    public static final String getCancelledInvoice() {
        return "cancelled";
    }

	public static final String INVOICE_STATUS_NEW = "new";
	public static final String INVOICE_STATUS_CANCELLED = "cancelled";
	public static final String INVOICE_STATUS_PAID_IN_FULL = "paid_in_full";
	public static final String INVOICE_STATUS_IN_PROGRESS = "in_progress";

    /**
     * Retrieves all invoice item status constants combined in an array
     * 
     * @return Array of all invoice item status constants
     */
    public static final String[] getInvoiceStatusCodes() {
        String[] statusCodes = new String[] { getNewInvoice(),
                                             getInProgressInvoice(),
                                             getPaidInvoice(),
                                             getCancelledInvoice() };

        return statusCodes;
    }

    /**
     * Retrieves string value of line item status for "paid"
     * 
     * @return Constant value for line item status of "paid"
     */
    public static final String getPaidLineItem() {
        return "paid";
    }

    /**
     * Retrieves string value of line item status for "unpaid"
     * 
     * @return Constant value for line item status of "unpaid"
     */
    public static final String getUnpaidLineItem() {
        return "unpaid";
    }

	public static final String LINE_ITEM_STATUS_PAID = "paid";
	public static final String LINE_ITEM_STATUS_UNPAID = "unpaid";

    /**
     * Retrieves all line item status constants combined in an array
     * 
     * @return Array of all line item status constants
     */
    public static final String[] getLineItemStatusCodes() {
        String[] statusCodes = new String[] { getUnpaidLineItem(),
                                             getPaidLineItem(), };

        return statusCodes;
    }

    /**
     * Retrieves string value of line item type for "order charge"
     * 
     * @return Constant value for line item type of "order charge"
     */
    public static final String getOrderChargeLineItem() {
        return ORDER_CHARGE_LINE_ITEM;
    }

	public static final String ORDER_CHARGE_LINE_ITEM = "order_charge";

    /**
     * Retrieves string value of line item type for "express shipping charge"
     * 
     * @return Constant value for line item type of "express shipping charge"
     */
    public static final String getExpressShippingLineItem() {
        return EXPRESS_SHIPPING_LINE_ITEM;
    }

	public static final String EXPRESS_SHIPPING_LINE_ITEM = "express_shipping_charge";

    /**
     * Retrieves string value of line item type for "express shipping charge"
     * 
     * @return Constant value for line item type of "express shipping charge"
     */
    public static final String getExpressShippingRequired() {
        return "express_shipping_charge_required";
    }

    /**
     * Retrieves string value of line item type for "phytosanitary charge"
     * 
     * @return Constant value for line item type of "phytosanitary charge"
     */
    public static final String getPhytosanitaryChargeLineItem() {
        return "phytosanitary_charge";
    }

	public static final String STOCK_CHARGE_LINE_ITEM = "stock_charge";

    /**
     * Retrieves string value of line item type for "stock charge"
     * 
     * @return Constant value for line item type of "stock charge"
     */
    public static final String getStockChargeLineItem() {
        return "stock_charge";
    }

    /**
     * Retrieves all line item type constants combined in an array
     * 
     * @return Array of all line item type constants
     */
    public static final String[] getLineItemTypes() {
        String[] types = new String[] { getOrderChargeLineItem(),
                                       getExpressShippingLineItem(),
                                       getPhytosanitaryChargeLineItem(),
                                       getStockChargeLineItem() };

        return types;
    }

	public static final String NO_PAYMENT_METHOD = "";
	public static final String CREDIT_CARD_PAYMENT_METHOD = "credit_card";
	public static final String PURCHASE_ORDER_PAYMENT_METHOD = "purchase_order";

    /**
     * Retrieves string value of invoice payment method value for "credit card"
     * 
     * @return Constant value for invoice payment method "credit card"
     */
    public static final String getCreditCardPaymentMethod() {
        return CREDIT_CARD_PAYMENT_METHOD;
    }

    /**
     * Retrieves string value of invoice payment method value for "purchase
     * order"
     * 
     * @return Constant value for invoice payment method "purchase order"
     */
    public static final String getPurchaseOrderPaymentMethod() {
        return PURCHASE_ORDER_PAYMENT_METHOD;
    }

    /**
     * Retrieves string value of item waive charge value for "curator"
     * 
     * @return Constant value for item waive charge value of "curator"
     */
    public static final String getCuratorNoCharge() {
        return "curator";
    }

    /**
     * Retrieves string value of item waive charge value for "follow up"
     * 
     * @return Constant value for item waive charge value of "follow up"
     */
    public static final String getFollowUpNoCharge() {
        return "follow_up";
    }

    /**
     * Retrieves string value of item waive charge value for "reship"
     * 
     * @return Constant value for item waive charge value of "reship"
     */
    public static final String getReshipNoCharge() {
        return "reship";
    }

    /**
     * Retrieves string value of item waive charge value for "reship"
     * 
     * @return Constant value for item waive charge value of "reship"
     */
    public static final String getNoWaiver() {
        return "none";
    }

    /**
     * Retrieves default quantity for new stock orders
     * 
     * @return Default quantity for new stock orders
     */
    public static final int getDefaultQuantity() {
        return DEFAULT_QUANTITY;
    }

	public static final int DEFAULT_QUANTITY = 1;

    /**
     * Retrieves default number of search results to show on each page of
     * multiple page result sets
     * 
     * @return Default number of search results to show
     */
    public static final int getDefaultPageSize() {
        int defaultPageSize = 25;

        return defaultPageSize;
    }

    /**
     * Constant value for search method of "contains"
     */
    public static final String SEARCH_CONTAINS = "1";

    /**
     * Constant value for search method of "starts with"
     */
    public static final String SEARCH_STARTS = "2";

    /**
     * Constant value for search method of "ends with"
     */
    public static final String SEARCH_ENDS = "3";

    /**
     * Constant value for search method of "exact match"
     */
    public static final String SEARCH_EXACT = "4";

    /**
     * Collection of all search methods with constant as <code>String</code>
     * key referencing a <code>String</code> value for display for each method
     */
    public static final TreeMap SEARCH_METHODS = new TreeMap();

    /**
     * Hex value for gray background color used throughout TAIR
     */
    public static final String BGCOLOR = "#D5D9DD";

    /**
     * Hex value for dark gray background color used throughout TAIR
     */
    public static final String DARK_BGCOLOR = "#AAAAAA";

    static {
        // db values & display equivalents for org types
        ORG_TYPES.put( "lab", "Lab" );
        ORG_TYPES.put( "stock_center", "Stock Center" );
        ORG_TYPES.put( "company", "Company" );
        ORG_TYPES.put( "database", "Database" );
        ORG_TYPES.put( "institute", "Institute" );
        ORG_TYPES.put( "committee", "Committee" );
        ORG_TYPES.put( "facility", "Facility" );
        ORG_TYPES.put( "collaboration", "Collaboration" );
        ORG_TYPES.put( "unknown", "Unknown" );
        ORG_TYPES.put( "4_year_college", "4 Year College" );
        ORG_TYPES.put( "community_college", "Community College" );
        ORG_TYPES.put( "university", "University" );
        ORG_TYPES.put( "professional_society", "Professional Society" );
        ORG_TYPES.put( "foundation", "Foundation" );
        ORG_TYPES.put( "center", "Center" );
        ORG_TYPES.put( "high_school", "High School" );
        ORG_TYPES.put( "middle_school", "Middle School" );
        ORG_TYPES.put( "primary_school", "Primary School" );
        ORG_TYPES.put( "project", "Project" );
        ORG_TYPES.put( "education_outreach_program",
                       "Education/Outreach Program" );
        ORG_TYPES.put( "other", "Other" );

        // state abbreviations (db values) & display equivalents for
        // US/Canada regions
        REGIONS.put( "AL", "Alabama" );
        REGIONS.put( "AK", "Alaska" );
        REGIONS.put( "AB", "Alberta" );
        REGIONS.put( "AZ", "Arizona" );
        REGIONS.put( "AR", "Arkansas" );
        REGIONS.put( "BC", "British Columbia" );
        REGIONS.put( "CA", "California" );
        REGIONS.put( "CZ", "Canal Zone" );
        REGIONS.put( "CO", "Colorado" );
        REGIONS.put( "CT", "Connecticut" );
        REGIONS.put( "DE", "Delaware" );
        REGIONS.put( "DC", "District of Columbia" );
        REGIONS.put( "FL", "Florida" );
        REGIONS.put( "GA", "Georgia" );
        REGIONS.put( "GU", "Guam" );
        REGIONS.put( "HI", "Hawaii" );
        REGIONS.put( "ID", "Idaho" );
        REGIONS.put( "IL", "Illinois" );
        REGIONS.put( "IN", "Indiana" );
        REGIONS.put( "IA", "Iowa" );
        REGIONS.put( "KS", "Kansas" );
        REGIONS.put( "KY", "Kentucky" );
        REGIONS.put( "LA", "Louisiana" );
        REGIONS.put( "ME", "Maine" );
        REGIONS.put( "MB", "Manitoba" );
        REGIONS.put( "MD", "Maryland" );
        REGIONS.put( "MA", "Massachusetts" );
        REGIONS.put( "MI", "Michigan" );
        REGIONS.put( "MN", "Minnesota" );
        REGIONS.put( "MS", "Mississippi" );
        REGIONS.put( "MO", "Missouri" );
        REGIONS.put( "MT", "Montana" );
        REGIONS.put( "NE", "Nebraska" );
        REGIONS.put( "NV", "Nevada" );
        REGIONS.put( "NB", "New Brunswick" );
        REGIONS.put( "NH", "New Hampshire" );
        REGIONS.put( "NJ", "New Jersey" );
        REGIONS.put( "NM", "New Mexico" );
        REGIONS.put( "NY", "New York" );
        REGIONS.put( "NF", "Newfoundland" );
        REGIONS.put( "NC", "North Carolina" );
        REGIONS.put( "ND", "North Dakota" );
        REGIONS.put( "NT", "Northwest Territories" );
        REGIONS.put( "NS", "Nova Scotia" );
        REGIONS.put( "NU", "Nunavut" );
        REGIONS.put( "OH", "Ohio" );
        REGIONS.put( "OK", "Oklahoma" );
        REGIONS.put( "ON", "Ontario" );
        REGIONS.put( "OR", "Oregon" );
        REGIONS.put( "PA", "Pennsylvania" );
        REGIONS.put( "PE", "Prince Edward Island" );
        REGIONS.put( "PR", "Puerto Rico" );
        REGIONS.put( "QC", "Quebec" );
        REGIONS.put( "RI", "Rhode Island" );
        REGIONS.put( "SK", "Saskatchewan" );
        REGIONS.put( "SC", "South Carolina" );
        REGIONS.put( "SD", "South Dakota" );
        REGIONS.put( "TN", "Tennessee" );
        REGIONS.put( "TX", "Texas" );
        REGIONS.put( "UT", "Utah" );
        REGIONS.put( "VT", "Vermont" );
        REGIONS.put( "VI", "Virgin Islands" );
        REGIONS.put( "VA", "Virginia" );
        REGIONS.put( "WA", "Washington" );
        REGIONS.put( "WV", "West Virginia" );
        REGIONS.put( "WI", "Wisconsin" );
        REGIONS.put( "WY", "Wyoming" );
        REGIONS.put( "YT", "Yukon Territory" );

        // create MENU_REGIONS from REGIONS -- just interchange keys & values
        Iterator iter = REGIONS.keySet().iterator();
        String abbrev = null;
        String display = null;
        while ( iter.hasNext() ) {
            abbrev = (String) iter.next();
            display = (String) REGIONS.get( abbrev );
            MENU_REGIONS.put( display, abbrev );
        }

        // search methods constants & display values
        SEARCH_METHODS.put( SEARCH_CONTAINS, "contains" );
        SEARCH_METHODS.put( SEARCH_STARTS, "starts with" );
        SEARCH_METHODS.put( SEARCH_ENDS, "ends with" );
        SEARCH_METHODS.put( SEARCH_EXACT, "exactly" );

    }

}
