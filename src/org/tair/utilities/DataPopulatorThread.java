//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.13 $
// $Date: 2005/03/11 00:07:03 $
//------------------------------------------------------------------------------

package org.tair.utilities;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.jboss.logging.Logger;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;

/**
 * DataPopulatorThread is responsible for maintaining collections of data 
 * that must be periodically refreshed from the database.  DataPopulatorThread
 * extend Thread so that it can sleep a given period of time, and then
 * repopulate any collections in use.  This is useful for cases where collections
 * of data should be dynamic, but where we want to avoid querying the database
 * repeatedly for it. For example, the germplasm search needs a dynamic list of
 * distinct species variant base names that have a corresponding germplasm record;
 * this query is fairly expensive and not likely to change often, but it must be 
 * dynamic so that only species variants w/matching germplasm data can be searched.  
 * Storing collections like this here allows us to cache the data so that it's dynamic
 * and immediately available when requested, but is also updated frequently so that 
 * db data changes are reflected. 
 *
 * <p>
 * The refresh interval is specified (in milliseconds) in the WebApp property 
 * "DATA_INTERVAL". If no value for DATA_INTERVAL is found, a default of 24 hours
 * used.  When refreshing data, only collections that have been previously initialized
 * through a request for the data from client code will be refreshed. This is done
 * to minimize the amount of updating done, so that only active data collections are \
 * maintained.
 *
 * <p>
 * NOTE: At some point, it would be good to refactor this so that data collections 
 * are not defined here, but are defined within individual data classes (as 
 * DefinitionsLookup is done).  Nice way to do that would be to define an interface
 * like DynamicDataCache that specifies populate() method, then hold a list of 
 * collections to be refreshed. Have to do this some other day, though...
 */


public class DataPopulatorThread extends Thread {
  private static final Logger logger = 
    Logger.getLogger(DataPopulatorThread.class);

    // taxons associated to species variants - stored as scientific_name -> taxon_id
    private TreeMap<String,String> speciesVariantTaxons;
    private List<Taxon> germplasmTaxons;
    private TreeMap<String,String> cloneTaxons;

    // species variants associated to germplasms - stored as base_name
    private String[] germplasmSpeciesVariants;

    // distinct countries found in species variant
    private String[] speciesVariantCountries;


    // distinct stock types that have at least one stock order
    private String[] stockOrderTypes;
  
    // keywords that are joined to at least one ExpressionSet with relationship type
    // of "experiment category" - stored as keyword -> keyword_id
    private TreeMap<String,String> experimentCategories;
  
    // keywords that related to Protocol
    private TreeMap<String,String> protocolKeywords;

    // definitionsLookup provides a lookupDefinitionId() function for quick
    // access to the Definitions database table.
    private DefinitionsLookup definitionsLookup;

	    
    // interval to sleep (in milliseconds) before refreshing data - 
    // this value is translated to an int from String value stored
    // in WebApp - probably around 24 hours (86400000 seconds)
    private int interval;
  

    /**
     * Creates an instance of DataPopulatorThread. When called, this constructor
     * will determine the proper interval to refresh data on by looking for the
     * WebApp property DATA_INTERVAL. If no value for DATA_INTERVAL can
     * be found, a default of 24 hours (86400000 milliseconds) is used.
     */
    public DataPopulatorThread() {

	// translate config file value into more useful integer value
	String confInterval = WebApp.getProperty( "DATA_INTERVAL" );
	if ( confInterval != null ) {
	    this.interval = Integer.parseInt( confInterval );

	} else { // if for any reason this value is missing, default to 24 hours
	    this.interval = 86400000;
	}

    }


    /**
     * Main run method for the thread. Unless interrupted, thread execution will
     * re-populate any collections that have been previously initialized, then
     * sleep for the refresh interval determined when the object's constructor 
     * is called.  Any exceptions that occur while updating data will be
     * printed to STDERR.
     */
    public void run() {
    
	try {

	    while ( !interrupted() ) {
		populate(); // repopulate any collections that have already been initialized

		// sleep for a while, then refresh data
		sleep( interval );
	    }

	} catch ( InterruptedException e ) {
      logger.error("Data Populator Thread interrupted: " + e.getMessage(), e);
	} catch ( SQLException se ) {
      logger.error("SQL Exception in data populator: " + se.getMessage(), se);
	}

    }

    // gateway method to populate all data collections that have been initialized
    private void populate() throws SQLException {
	DBconnection conn = null;
	DBReadManager connectionPool = null;
    
	try {
      
	    connectionPool = DBReadManager.getInstance();
	    conn = connectionPool.get_connection();
      
	    // only keep objects updated that have been initialized
	    // already -- leave others to be initialized when they're
	    // first requested
	      if (speciesVariantTaxons != null) {
	        populateSpeciesVariantTaxons(conn);
	      }

	      if (germplasmTaxons != null) {
	        populateGermplasmTaxons(conn);
	      }
	          
        if (cloneTaxons != null) {
        populateCloneTaxons(conn);
        }
	    
        if ( germplasmSpeciesVariants != null ) {
		populateGermplasmSpeciesVariants( conn );
	    }

	    if ( speciesVariantCountries != null ) {
		populateSpeciesVariantCountries( conn );
	    }
      
	    if ( definitionsLookup != null ) {
		definitionsLookup.refresh(conn);
	    }

	    if ( stockOrderTypes != null ) {
		populateStockOrderTypes( conn );
	    }

	    if ( experimentCategories != null ) {
		populateExperimentCategories( conn );
	    }

	    if ( protocolKeywords != null ) {
		populateProtocolKeywords( conn );
	    }
	    
	} finally {
	    if ( conn != null ) {
		conn.releaseResources();
		DBReadManager.return_connection( conn );
	    }
	}
    }

  
    /**
     * Retrieve collection of taxons that have at least one associated 
     * species variant record
     */
    private void populateSpeciesVariantTaxons( DBconnection conn ) 
	throws SQLException {

	String query = null;
	ResultSet results = null;
	TreeMap<String,String> tmpTaxons;

	Debugger.println( "Populating taxons..." );

	// create temporary collection to hold updated results
	tmpTaxons = new TreeMap<String, String>();

	query = 
	    "SELECT DISTINCT t.taxon_id, t.scientific_name " +
	    "FROM Taxon t, SpeciesVariant s " +
	    "WHERE t.taxon_id = s.taxon_id " +
	    "AND s.is_obsolete = 'F' " +
	    "ORDER BY t.scientific_name";
	conn.setQuery( query );
	results = conn.getResultSet();
	while ( results.next() ) {

	    // store id as string to avoid problems when creating HTML widgets
	    Long id = new Long( results.getLong( "taxon_id" ) );
	    tmpTaxons.put( results.getString( "scientific_name" ), id.toString() );
	}
	conn.releaseResources();

	// get any taxon aliases
	query =
	    "SELECT DISTINCT t.taxon_id, a.original_alias " +
	    "FROM Taxon t, Alias a, SpeciesVariant s " +
	    "WHERE t.taxon_id = s.taxon_id " +
	    "AND t.tair_object_id = a.tair_object_id " +
	    "AND s.is_obsolete = 'F' " +
	    "ORDER BY a.original_alias";
	conn.setQuery( query );
	results = conn.getResultSet();
	while ( results.next() ) {
	    Long id = new Long( results.getLong( "taxon_id" ) );
	    tmpTaxons.put( results.getString( "original_alias" ), id.toString() );
	}
	conn.releaseResources();

	// replace previous collection w/new collection
	this.speciesVariantTaxons = tmpTaxons;
    }

    /**
     * Helper class to manage lists of taxons with ids and scientific names
     */
    public class Taxon {
      /** scientific name for the taxon, mixed case */
      private String scientificName;
      /** unique identifier for the taxon as a string for use in HTML */
      private String taxonId;
      public Taxon(String name, String id) {
        scientificName = name;
        taxonId = id;
      }
      /**
       * Get the scientific name for the taxon.
       * 
       * @return a String scientific name
       */
      public String getScientificName() {
        return scientificName;
      }
      
      /**
       * Get the taxon id for the taxon as a string to be used in HTML.
       * 
       * @return a String taxon id
       */
      public String getTaxonId() {
        return taxonId;
      }
    }

  /**
   * Retrieve a collection of active taxons that have at least one associated
   * species variant record ordered by scientific name, but with Arabidopsis
   * thaliana at the top.
   */
  private void populateGermplasmTaxons(DBconnection conn) throws SQLException {

    String query = null;
    ResultSet results = null;
    List<Taxon> tmpTaxons;

    Debugger.println("Populating germplasm taxons...");

    // create temporary collection to hold updated results
    tmpTaxons = new ArrayList<Taxon>();
    
    // Initialize the list with Arabidopsis.
    tmpTaxons.add(new Taxon("Arabidopsis thaliana", "1"));

    // Query taxons and aliases, excluding Arabidopsis thaliana.
    query =
      "SELECT t.taxon_id, t.scientific_name "
          + "FROM Taxon t JOIN Germplasm_Pedigree_wrk gp ON t.taxon_id = gp.taxon_id "
          + "WHERE t.taxon_id != 1 "
          + "UNION "
          + "SELECT t.taxon_id, a.original_alias "
          + "FROM Taxon t JOIN Alias a ON t.tair_object_id = a.tair_object_id JOIN "
          + "Germplasm_Pedigree_wrk gp ON t.taxon_id = gp.taxon_id "
          + "ORDER BY 2";
    conn.setQuery(query);
    results = conn.getResultSet();
    
    while (results.next()) {
      Taxon taxon =
        new Taxon(results.getString("scientific_name"),
                  (new Long(results.getLong("taxon_id")).toString()));
      tmpTaxons.add(taxon);
    }
    
    conn.releaseResources();

    // replace previous collection w/new collection
    germplasmTaxons = tmpTaxons;
  }

    /**
     * Retrieve collection of taxons that have at least one associated 
     * taxon
     */
    private void populateCloneTaxons( DBconnection conn ) 
	throws SQLException {

	String query = null;
	ResultSet results = null;
	TreeMap<String,String> tmpTaxons;

	Debugger.println( "Populating taxons..." );

	// create temporary collection to hold updated results
	tmpTaxons = new TreeMap<String,String>();

	query =
        " select distinct t.taxon_id, t.scientific_name " +
        " from Taxon t, Clone c " + 
        " WHERE t.taxon_id = c.taxon_id " +
        " ORDER BY t.scientific_name";
	conn.setQuery( query );
	results = conn.getResultSet();
	while ( results.next() ) {

	    // store id as string to avoid problems when creating HTML widgets
	    Long id = new Long( results.getLong( "taxon_id" ) );
	    tmpTaxons.put( results.getString( "scientific_name" ), id.toString() );
	}
	conn.releaseResources();

	// replace previous collection w/new collection
	this.cloneTaxons = tmpTaxons;
    }


    /**

    /**
     * Retrieve collection of distinct species variant base names that have at 
     * least one associated germplasm record - records are sorted by number of 
     * associated germplasms, then alphabetically, so that variant w/highest 
     * number of associated germplasms should be listed first
     */
    private void populateGermplasmSpeciesVariants( DBconnection conn ) 
	throws SQLException {

	String query = null;
	ResultSet results = null;
	ArrayList<String> tmpVariants = null;
	String[] tmpVariantArray = null;
    
	Debugger.println( "Populating species variants..." );
    
	// create temporary collection to hold updated results
	tmpVariants = new ArrayList<String>();
    
	// select using work table that flattens Pedigree table
	query = 
	    "SELECT DISTINCT base_name, count( germplasm_id ) AS germplasm_count " +
	    "FROM Germplasm_Pedigree_wrk " +
	    "WHERE base_name IS NOT NULL " +
	    "GROUP BY base_name " +
	    "ORDER BY germplasm_count DESC, base_name ";
	conn.setQuery( query );
	results = conn.getResultSet();
	while ( results.next() ) {
	    tmpVariants.add( results.getString( "base_name" ) );
	}
	conn.releaseResources();

	// translate from List to string array and replace previous collection 
	// w/new collection
	tmpVariantArray = new String[ tmpVariants.size() ];
	tmpVariantArray = (String[]) tmpVariants.toArray( tmpVariantArray );
	this.germplasmSpeciesVariants = tmpVariantArray;
    }
  
  
    /**
     * Retrieve collection of distinct countries in species variant
     */
    private void populateSpeciesVariantCountries( DBconnection conn ) 
	throws SQLException {

	String query = null;
	ResultSet results = null;
	ArrayList<String> tmpCountries = null;
	String[] tmpCountryArray = null;

	Debugger.println( "Populating species variant countries..." );

	// create temporary collection to hold updated results
	tmpCountries = new ArrayList<String>();
    
	query = 
	    "SELECT DISTINCT country " +
	    "FROM SpeciesVariant " +
	    "WHERE is_obsolete = 'F' " +
	    "AND country IS NOT NULL " +
	    "ORDER BY country";

	conn.setQuery( query );
	results = conn.getResultSet();
	while ( results.next() ) {
	    tmpCountries.add( results.getString( "country" ) );
	}
	conn.releaseResources();

	// translate from List to string array and replace previous 
	// collection w/new collection
	tmpCountryArray = new String[ tmpCountries.size() ];
	tmpCountryArray = (String[]) tmpCountries.toArray( tmpCountryArray );
	this.speciesVariantCountries = tmpCountryArray;
    }

    /**
     * Retrieve collection of stock order types in use
     */
    private void populateStockOrderTypes( DBconnection conn ) throws SQLException {
	String query = null;
	ResultSet results = null;
	ArrayList<String> tmpTypes = null;
	String[] tmpTypesArray = null;

	Debugger.println( "Populating stock order types..." );

	// create temporary collection to hold updated results
	tmpTypes = new ArrayList<String>();
    
	query = 
	    "SELECT DISTINCT st.stock_type " +
	    "FROM StockType st, Stock s, Orders_Stock os " +
	    "WHERE st.stock_type_id = s.stock_type_id " +
	    "AND s.stock_id = os.stock_id " +
	    "ORDER BY stock_type";

	conn.setQuery( query );
	results = conn.getResultSet();
	while ( results.next() ) {
	    tmpTypes.add( results.getString( "stock_type" ) );
	}
	conn.releaseResources();

	// translate from List to string array and replace previous collection 
	// w/new collection
	tmpTypesArray = new String[ tmpTypes.size() ];
	tmpTypesArray = (String[]) tmpTypes.toArray( tmpTypesArray );
	this.stockOrderTypes = tmpTypesArray;
    }


    /**
     * Retrieve collection of keywords associated to at least one expression set 
     * with relationship type of "experiment category"
     */
    private void populateExperimentCategories( DBconnection conn ) 
	throws SQLException {

	String query = null;
	ResultSet results = null;
	TreeMap<String,String> tmpCategories = null;

	Debugger.println( "Populating experiment categories..." );

	// create temporary collection to hold updated results
	tmpCategories = new TreeMap<String,String>();

	query = 
	    "SELECT DISTINCT k.keyword_id, k.keyword " +
	    "FROM Keyword k, RelationshipType rt, TairObject_Keyword tk, ExpressionSet e " +
	    "WHERE k.keyword_id = tk.keyword_id " +
	    "AND tk.relationship_type_id = rt.relationship_type_id " +
	    "AND tk.tair_object_id = e.tair_object_id " +
	    "AND rt.relationshiptype_type = 'experiment category' " +
	    "ORDER BY k.keyword ";
	conn.setQuery( query );
	results = conn.getResultSet();
	while ( results.next() ) {
      
	    // store id as string to avoid problems when creating HTML widgets
	    Long id = new Long( results.getLong( "keyword_id" ) );
	    String keyword = results.getString( "keyword" );
	    tmpCategories.put( keyword , id.toString() );
	}
	conn.releaseResources();

	// replace previous collection w/new collection
	this.experimentCategories = tmpCategories;
    }

    /**
     * Retrieve collection of keywords associated to Protocol 
     * @param conn DB connection	
     */
    private void populateProtocolKeywords( DBconnection conn ) 
	throws SQLException {

	String query = null;
	ResultSet results = null;
	TreeMap<String,String> tmp_kw = null;

	Debugger.println( "Populating Protocol Keywords..." );

	// create temporary collection to hold updated results
	tmp_kw = new TreeMap<String,String>();

	query = 
	    "SELECT DISTINCT k.keyword_id, k.keyword " +
	    "FROM Keyword k, RelationshipType rt, " +
	    "Reference_Keyword tk, AnnotationType a " +
	    "WHERE k.keyword_id = tk.keyword_id " +
	    "AND tk.relationship_type_id = rt.relationship_type_id " +
	    "AND tk.annotation_type_id = a.annotation_type_id " +
	    "AND rt.relationshiptype_type = 'describes method' " +
	    "AND rt.table_name = 'Protocol' " +
	    "AND a.child_table_name = 'Protocol' " +
	    "ORDER BY k.keyword ";
	conn.setQuery( query );
	results = conn.getResultSet();
	while ( results.next() ) {
      
	    String id = results.getString( "keyword_id" );
	    String keyword = results.getString( "keyword" );
	    tmp_kw.put( id, keyword);
	}
	conn.releaseResources();

	// replace previous collection w/new collection
	this.protocolKeywords = tmp_kw;
    }

    /**
     * Retrieves a collection of taxons that are associated to at least
     * one species variant record in the database, as well as any associated aliases 
     * for taxon records. Taxons are returned in a map with taxon's scientific 
     * name referencing the taxon id - this is done so that the scientific name 
     * key can be used for easy alphabetical ordering
     *
     * @return Map containing taxons associated to species variant records as
     * a <code>String</code> scientific name referencing a <code>String</code> taxon_id
     */
  public Map<String, String> getSpeciesVariantTaxons() throws SQLException {
    DBReadManager connectionPool = null;
    DBconnection conn = null;

    if (speciesVariantTaxons == null) {
      try {
        connectionPool = DBReadManager.getInstance();
        conn = connectionPool.get_connection();
        populateSpeciesVariantTaxons(conn);
      } finally {
        if (conn != null) {
          conn.releaseResources();
          DBReadManager.return_connection(conn);
        }
      }
    }
    return speciesVariantTaxons;
  }

  /**
   * Retrieves a collection of taxons that are associated to at least one
   * species variant record in the database and that are relevant for searching
   * for germplasms, as well as any associated aliases
   * for taxon records. The method returns the taxons in a List of Taxon
   * objects that contain the scientific name and id, with the list sorted
   * in alphabetic order with Arabidopsis thaliana at the top. 
   * 
   * @return Map containing taxons associated to species variant records as a
   *         <code>String</code> taxon id keyed on a
   *         <code>String</code> scientific name
   */
  public List<Taxon> getGermplasmTaxons() throws SQLException {
    DBReadManager connectionPool = null;
    DBconnection conn = null;

    if (germplasmTaxons == null) {
      try {
        connectionPool = DBReadManager.getInstance();
        conn = connectionPool.get_connection();
        populateGermplasmTaxons(conn);
      } finally {
        if (conn != null) {
          conn.releaseResources();
          DBReadManager.return_connection(conn);
        }
      }
    }
    return germplasmTaxons;
  }

    /**
     * Retrieves a collection of taxons that are associated to at least
     * one clone record in the database, as well as any associated aliases 
     * for taxon records. Taxons are returned in a map with taxon's scientific 
     * name referencing the taxon id - this is done so that the scientific name 
     * key can be used for easy alphabetical ordering
     *
     * @return Map containing taxons associated to species variant records as
     * a <code>String</code> scientific name referencing a <code>String</code> taxon_id
     */
    public Map<String,String> getCloneTaxons() throws SQLException {
	DBReadManager connectionPool = null;
	DBconnection conn = null;

	if ( cloneTaxons == null ) {
	    try {
		connectionPool = DBReadManager.getInstance();
		conn = connectionPool.get_connection();
		populateCloneTaxons( conn );
	    } finally {
		if ( conn != null ) {
		    conn.releaseResources();
		    DBReadManager.return_connection( conn );
		}
	    }
	}
	return cloneTaxons;
    }
    /**
     * Retrieves a list of species variants that are associated to at least
     * one germplasm record in the database. Species variants are ordered by the number
     * of associated germplasms, so that the base with name the most germplasm records
     * derived from it should be listed first
     *
     * @return String array containing species variants associated to germplasm records
     */
    public String[] getGermplasmSpeciesVariants() throws SQLException {
	DBReadManager connectionPool = null;
	DBconnection conn = null;

	if ( germplasmSpeciesVariants == null ) {
	    try {
		connectionPool = DBReadManager.getInstance();
		conn = connectionPool.get_connection();
		populateGermplasmSpeciesVariants( conn );
	    } finally {
		if ( conn != null ) {
		    conn.releaseResources();
		    DBReadManager.return_connection( conn );
		}
	    }
	}
	return germplasmSpeciesVariants;
    }

    /**
     * Retrieves a collection of countries that at least one record in the species 
     * variant table was collected in.  Countries are returned as a string array of
     * country names
     *
     * @return Array of distinct country names in SpeciesVariant
     */
    public String[] getSpeciesVariantCountries() throws SQLException {
	DBReadManager connectionPool = null;
	DBconnection conn = null;

	if ( speciesVariantCountries == null ) {
	    try {
		connectionPool = DBReadManager.getInstance();
		conn = connectionPool.get_connection();
		populateSpeciesVariantCountries( conn );
	    } finally {
		if ( conn != null ) {
		    conn.releaseResources();
		    DBReadManager.return_connection( conn );
		}
	    }
	}
	return speciesVariantCountries;
    }


    /**
     * Retrieves a list of stock types that have at least stock order.
     *
     * @return Array of distinct stock types that have orders for them.
     */
    public String[] getStockOrderTypes() throws SQLException {
	DBReadManager connectionPool = null;
	DBconnection conn = null;
    
	if ( stockOrderTypes == null ) {
	    try {
		connectionPool = DBReadManager.getInstance();
		conn = connectionPool.get_connection();
		populateStockOrderTypes( conn );
	    } finally {
		if ( conn != null ) {
		    conn.releaseResources();
		    DBReadManager.return_connection( conn );
		}
	    }
	}
	return stockOrderTypes;
    }

    /**
     * Retrieves a collection of keywords that are associated to at least one
     * ExpressionSet with relationship type of "experiment category".  
     *
     * @return Map of experiment category keywords as a <code>Map</code> with
     * keyword <code>String</code> referencing a <code>String</code> keyword id
     */
    public Map<String,String> getExperimentCategories() throws SQLException {
	DBReadManager connectionPool = null;
	DBconnection conn = null;
    
	if ( experimentCategories == null ) {
	    try {

		connectionPool = DBReadManager.getInstance();
		conn = connectionPool.get_connection();
		populateExperimentCategories( conn );

	    } finally {
		if ( conn != null ) {
		    conn.releaseResources();
		    DBReadManager.return_connection( conn );
		}
	    }
	}
	return experimentCategories;
    }

    /**
     * Retrieves a collection of keywords that are associated to Protocol
     *
     * @return Map of Protocol keywords as a <code>Map</code> with
     * keyword <code>String</code> 
     * referencing a <code>String</code> keyword id
     */
    public Map<String,String> getProtocolKeywords() throws SQLException {
	DBReadManager connectionPool = null;
	DBconnection conn = null;
    
	if ( protocolKeywords == null ) {
	    try {

		connectionPool = DBReadManager.getInstance();
		conn = connectionPool.get_connection();
		populateProtocolKeywords( conn );

	    } finally {
		if ( conn != null ) {
		    conn.releaseResources();
		    DBReadManager.return_connection( conn );
		}
	    }
	}
	return protocolKeywords;
    }


    /**
     * Returns a org.tair.utilities.DefinitionsLookup object that provides
     * quick and easy access to definition_ids, given a table_name and
     * field_name.
     *
     * @return DefinitionsLookup object to search for definition_ids.
     */
    public DefinitionsLookup getDefinitionsLookup() throws SQLException {
	DBReadManager connectionPool = null;
	DBconnection conn = null;
    
	if (definitionsLookup == null) {
	    try {
		connectionPool = DBReadManager.getInstance();
		conn = connectionPool.get_connection();
		definitionsLookup = new DefinitionsLookup();
		definitionsLookup.refresh(conn);
	    } finally {
		if (conn != null) {
		    conn.releaseResources();
		    DBReadManager.return_connection( conn );
		}
	    }
	}
	return definitionsLookup;
    }
}
