//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.39 $
// $Date: 2005/07/08 20:50:07 $
//------------------------------------------------------------------------------
package org.tair.search;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.Debugger;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;

/**
 * GeneticMarkerSearcher retrieves genetic markers according to submitted 
 * search parameters. Search results are stored in a temp table created for
 * a particular user, and are then returned one page at a time. 
 * GeneticMarkerSearcher only inserts and selects from temp table; creating, 
 * deleting and dropping table is done by <code>SearchSession</code>.  
 * GeneticMarkerSearcher retrieves the relevant table name to use by querying 
 * <code>MasterTableInfo</code>.
 *
 * <p>
 * GeneticMarkerSearcher receives search parameters as retrieved from web 
 * submission by <code>GeneticMarkerSearchHandler</code>. Results are returned
 * as  <code>SearchResultsCollection</code> object containing an array of 
 * <code>GeneticMarkerSummary</code> objects. 
 *
 * <p>
 * GeneticMarkerSearcher implements GeneralSearcher interface so that it can be
 * used by GeneralSearchHandler to carry out genetic marker searches as part of
 * the general search.
 */


public class GeneticMarkerSearcher implements GeneralSearcher {   

    /**
     * Searches genetic markers and returns a collection of markers for display
     * on the genetic marker summary page. If this is the first search (i.e. if
     * firstSearch is true), a SQL query is created to retrieve markers 
     * according to submitted search parameters and stores them in a temp table
     * before returning the intial page of results as defined by scroll 
     * parameters. On subsequent requests (when firstSearch is false), results 
     * are assumed to already be in temp table and the requested slice of the 
     * result set, as defined by scroll parameters, is returned.
     *
     * @param conn An active connection to the database
     * @param searchParams Search criteria submitted through the web search 
     * form, stored as field name as a <code>String</code> key referencing the 
     * search value.
     * @param scrollParams Scroll parameters to use when scrolling through 
     * multiple pages of results
     * @param firstSearch If <code>true</code>, execute full search and save 
     * results in temp table; if <code>false</code> assume results are already 
     * in temp table and return requested page of result set.
     * @return Genetic marker search results as a
     * <code>SearchResultsCollection</code> containing an array of 
     * <code>GeneticMarkerSummary</code> objects
     * @throws SQLException thrown if a database error occurs.
     */
    public SearchResultsCollection search( DBconnection conn, 
					   Map searchParams, 
					   ScrollParams scrollParams, 
					   boolean firstSearch ) 
	throws SQLException {

	SearchResultsCollection searchResults = null;
    String queryID = (String) searchParams.get("query_id");

	if ( firstSearch ) {  // populate temp table with complete result set
	    //do preliminary table drops first. should never get here buy just in case
        String del_query = getDelete( queryID );
        conn.setQuery( del_query );
        conn.executeUpdate();
        conn.releaseResources();
        
        String query = getInsert() + createQuery( searchParams, queryID );
	    conn.setQuery( query );
	    conn.executeUpdate();
	    conn.releaseResources();
	}
    
	// get requested subset of results from temp table
	searchResults = getResultSlice( conn, scrollParams, searchParams, queryID );

	// get plain text version of search parameters
	if ( searchResults != null ) {
	    String criteria = 
		getFormatSearchCriteria( searchParams, 
					 searchResults.getResultSize() );
	    searchResults.setSearchCriteria( criteria );
	}

	return searchResults;
    }


    /**
     * Executes a genetic marker search as part of the general search.  Search 
     * can be done to just return number of matching marker records, or to give 
     * the first page of marker search results according to the submitted value
     * of doCounts.  This method should only be called by GeneralSearchHandler
     * as part of the general search.  If requesting actual search results, 
     * searching will insert results into user's temp table, and redirect user
     * to normal genetic marker summary page to display results. Subsequent 
     * requests for additional pages of results will be handled by search() 
     * method. Results are always returned as a SearchResultsCollection; if full
     * search info is requested, collection will contain an array of 
     * GeneticMarkerSummary objects & other search info exactly as if search()
     * were called; if counts are requested, only the result size parameter of
     * the collection will be populated
     *
     * @param searchParams Map containing search parameters
     * @param doCounts If <code>true</code>, only counts of matching genetic 
     * markers will be returned, if <code>false</code> first page of matching 
     * genetic markers will be returned
     * @return SearchResultsCollection containing either number of matches, or
     * first page of results
     * @throws SQLException thrown if a database error occurs
     */
    public SearchResultsCollection doGeneralSearch( Map searchParams, 
						    boolean doCounts, boolean firstSearch ) 
	throws SQLException {

	DBconnection conn = null;
	DBWriteManager connectionPool = null;
	SearchResultsCollection searchResults = null;
    String queryID = "";

	try {
	    connectionPool = DBWriteManager.getInstance();
	    conn = connectionPool.getSearchConnection();

	    // if getting counts, just need number of distinct genetic marker ids
	    if ( doCounts ) {
		searchResults = doGeneralCounts( conn, searchParams );

		// else need to insert result set into temp table 
		// and get first page
	    } else {
		    queryID = (String) searchParams.get("query_id");

            if (firstSearch){
                doFullGeneralSearch( conn, searchParams, queryID );
            }
	        
            // get first page of results from temp table, sort by name
	        ScrollParams scrollParams = ScrollCalculator.getDefaultScrollParams();

	        searchResults = getResultSlice( conn, scrollParams, searchParams, queryID );
            
            // get plain text version of search parameters
		    if ( searchResults != null ) {
		        String criteria = 
			        getFormatSearchCriteria( searchParams, searchResults.getResultSize() );
		            searchResults.setSearchCriteria( criteria );
		    }
    	}

	} finally {
	    connectionPool.return_connection( conn );
	}

	return searchResults;
    }

    /**
    * get the unique identifier query line of this search
    * quick search will never have multiple parameters, 
    * so instead of generating the query, we can just return 
    * a unique identifier based on the thing searched
    */
    public String generateInsertLine( DBconnection conn, Map searchParams, String type )
    throws SQLException {                                                      
        String insert_query = "";                                                   
        if (type.equalsIgnoreCase( "form" )){
            insert_query = createQuery ( searchParams, "" );
        } else if (type.equalsIgnoreCase( "general" )) {
            String searchTerm = (String) searchParams.get( "searchTerm" );
            insert_query = "MARKER_QUICKSEARCH_" + searchTerm;
        } else {
            insert_query = createQuery ( searchParams, "" );
        }
        return insert_query;                                                                
    }
    
    /**
     * Retrieve genetic markers using selected marker ids from search results. 
     * Used for creating downloads
     *
     * @param conn  An active connection to the database
     * @param markerIDs Selected genetic marker ids to retrieve data for
     * @param sessionID User's session id. Used to access temp table for user's
     * individual results.
     */
    public GeneticMarkerSummary[] getSelected( DBconnection conn, 
					       List markerIDs, 
					       Map searchParams,
                           String queryID) 
	throws SQLException {


	GeneticMarkerSummary[] markers = null;


	//
	// if restricting by map type or chromosome, use search
	// values when creating summary Assignment collection so
	// that only assignments on requested map type & chromosome display
	//
	String map_type = (String) searchParams.get( "map_type" ); 
	String chromosome = (String) searchParams.get( "chromosome" );

	String query = 
	    "SELECT " + getTableColumns( "result" ) + " " +
	    "FROM RESULT_MARKER WHERE QUERY_ID = '" + queryID + "' " +
	    "AND genetic_marker_id = ?";

	ResultSet results = null;
	GeneticMarkerSummary marker = null;	
	ArrayList found = null;

	conn.setQuery( query );
	for ( Iterator iter = markerIDs.iterator(); iter.hasNext(); ) {
	    conn.setQueryVariable( (Long) iter.next() );
	    results = conn.getResultSet();
	    while ( results.next() ) {
		marker = getMarkerRow( results );
		if ( found == null ) {
		    found = new ArrayList();
		}
		found.add( marker );
	    }
	}
	conn.releaseResources();

	if ( found != null && !found.isEmpty() ) {
	    markers = new GeneticMarkerSummary[ found.size() ];
	    markers = (GeneticMarkerSummary[]) found.toArray( markers );

	    // get assignments & aliases for each marker; pass in map type & 
	    // chromosome for correct retrieval of Assignments 
	    // Retrieve flanking sequences as well for download
	    for ( int i = 0; i < markers.length; i++ ) {
		markers[ i ].retrieve_information( conn, map_type, chromosome, true ); 
	    }
	}
	return markers;
    }

    /**
     * Retrieve distinct number of genetic markers where name matches search
     * term
     */
    private SearchResultsCollection doGeneralCounts( DBconnection conn, 
						     Map searchParams ) 
	throws SQLException {

	SearchResultsCollection searchResults = null;
	int count = 0;

	String searchTerm = (String) searchParams.get( "searchTerm" );
	String method = (String) searchParams.get( "method" );
	
	String converted = TextConverter.convertEnds( searchTerm.toUpperCase(),
						      method );
	String quoted = TextConverter.dbQuote( converted );

	StringBuffer query = new StringBuffer();    
	query.append( "SELECT DISTINCT g.genetic_marker_id " +
		      getBaseFrom() +
		      getBaseWhere() +
		      "AND ( " + getMarkerNameCriteria( searchTerm, method ) +
		      "OR UPPER( g.geneticmarker_type ) LIKE " +
		      quoted + " ESCAPE '\\\') "
		      );
    
	conn.setQuery( query.toString() );

	ResultSet results = conn.getResultSet();
	while ( results.next() ) {
	    count++;
	}
	conn.releaseResources();
	searchResults = new SearchResultsCollection();
	searchResults.setResultSize( count );

	return searchResults;
    }


    /**
     * Retrieve all genes whose name or GenBank accession number matches search
     * term; insert results into temp table, retrieve first page of results, and
     * get descriptive version of search criteria for display on gene summary 
     * pages
     */
    private void doFullGeneralSearch( DBconnection conn, Map searchParams, String queryID ) 
	throws SQLException {


	String searchTerm = (String) searchParams.get( "searchTerm" );
	String method = (String) searchParams.get( "method" );

	String converted = TextConverter.convertEnds( searchTerm.toUpperCase(),
						      method );
	String quoted = TextConverter.dbQuote( converted );


	StringBuffer query = new StringBuffer();
	query.append( getInsert() +
		      getBaseSelect( "NULL", queryID ) +
		      getBaseFrom() +
		      getBaseWhere() +
		      "AND ( " + getMarkerNameCriteria( searchTerm, method ) + " " +
		      "OR UPPER( g.geneticmarker_type ) LIKE " + quoted + " ESCAPE '\\\')" );
    
	conn.setQuery( query.toString() );
	conn.executeUpdate(); // execute search & insert results into temp table
	conn.releaseResources();
    
    }
  
    /**
     * Get records in temp table and save requested result slice as defined 
     * by scrollParams
     */
    private SearchResultsCollection getResultSlice( DBconnection conn, 
						    ScrollParams scrollParams, 
						    Map searchParams,
                            String queryID ) 
	throws SQLException {


	SearchResultsCollection searchCollection = new SearchResultsCollection();

	String orderBy = (String) searchParams.get( "order" );
	int floor = scrollParams.getFloor();
	int ceiling = scrollParams.getCeiling();

	int rowCounter = 0;

	// if restricting by map type or chromosome, use search
	// values when creating summary Assignment collection so
	// that only assignments on requested map type & chromosome display
	String map_type = (String) searchParams.get( "map_type" ); 
	String chromosome = (String) searchParams.get( "chromosome" );

	StringBuffer query = new StringBuffer();
	query.append( "SELECT DISTINCT " + getTableColumns( "result" ) +
		      "FROM RESULT_MARKER WHERE QUERY_ID = '" + queryID + "' ");
	
	if ( orderBy != null && orderBy.equalsIgnoreCase( "name" ) ) {
	    query.append( "ORDER BY name " );
      
	} else if ( orderBy != null && orderBy.equalsIgnoreCase( "position" ) ) {
	    query.append( "ORDER BY chromosome, position " );

	} else if ( orderBy != null && orderBy.equalsIgnoreCase( "geneticmarker_type" ) ) {
	    query.append( "ORDER BY geneticmarker_type " );

	} else { 
	    query.append( "ORDER BY chromosome, name " );
	}

	conn.setQuery( query.toString() );

	ArrayList found = null;
	GeneticMarkerSummary marker = null;

	ResultSet results = conn.getResultSet();
	while ( results.next() ) {			
	    if ( rowCounter >= floor && rowCounter <= ceiling ) {
		marker = getMarkerRow( results );
		if ( found == null ) {
		    found = new ArrayList();
		}
		found.add( marker );
	    }
	    rowCounter++;
	}
	conn.releaseResources();

	if ( found != null && !found.isEmpty() ) {
	    GeneticMarkerSummary[] searchResults = 
		new GeneticMarkerSummary[ found.size() ];

	    searchResults = 
		(GeneticMarkerSummary[]) found.toArray( searchResults );
      
	    // get assignments & aliases for each marker; pass in map type & 
	    // chromosome for correct retrieval of Assignments
	    for ( int i = 0; i < searchResults.length; i++ ) {
		searchResults[ i ].retrieve_information( conn,
							 map_type, 
							 chromosome, 
							 false ); 
	    }
      
	    searchCollection.setResults( searchResults );
	    searchCollection.setResultSize( rowCounter );
	    searchCollection.setFloor( floor + 1 );
	    searchCollection.setCeiling( floor + found.size() );

	    // get links for scrolling through multiple results pages,
	    String links = 
		ScrollCalculator.getTableScrollLinks( scrollParams.getSize(), 
						      scrollParams.getPage(), 
						      searchCollection,
                              queryID );
	    searchCollection.setScrollLinks( links );
	}

	// set page for displaying results
	searchCollection.setResultsPage( getSummaryPage() );    

	return searchCollection;
    }

    /**
     * Store a single row of result set as a GeneticMarkerSummary object
     */
    private GeneticMarkerSummary getMarkerRow( ResultSet results ) 
	throws SQLException {

	GeneticMarkerSummary marker = new GeneticMarkerSummary();

	Long mapElementID = new Long( results.getLong( "map_element_id" ) );
	marker.set_map_element_id( mapElementID );

	Long tairObjectID = new Long( results.getLong( "tair_object_id" ) );
	marker.set_tair_object_id( tairObjectID );
	
	marker.set_name( results.getString( "name" ) );
	marker.set_geneticmarker_type( results.getString( "geneticmarker_type" ) );
	marker.set_chromosome( results.getString( "chromosome" ) );

	Long markerID = new Long( results.getLong( "genetic_marker_id" ) );
	marker.set_genetic_marker_id( markerID );

	return marker;
    }


    /**
     * Retrieves JSP URL to use for displaying gene search results
     *
     * @return JSP URL to use for displaying gene search results
     */
    public String getSummaryPage() { 
	return "/jsp/search/genetic_marker_summary.jsp";
    }


    /**
     * Get search key value to use when retrieving temp table name
     */
    private String getSearchType() {
	return "marker";
    }
  
    /**
     * Get select clause for full search
     */
    private String getBaseSelect( String position, String queryID ) {
	String select = null;

	if ( position == null ) {
	    position = "NULL";
	}

	select =
	    "SELECT distinct g.map_element_id, " +
	    "g.tair_object_id, " +
	    "g.name, " +
	    "g.geneticmarker_type, " +		       
	    "g.units, " +
	    "g.chromosome, " +
	    "g.genetic_marker_id, " +
	    position + " ";
    if ( queryID != null && queryID != ""){
        select = select +
        ", '" + queryID + "', CURRENT_DATE ";
    }else{
        select = select +
        ", '', '' ";
    }
	return select;
    }

    /**
     * Get basic from clause for full search
     */
    private String getBaseFrom() {
	return "FROM GeneticMarker g ";
    }

    /**
     * Get basic where clause for full search
     */
    private String getBaseWhere() {
	return "WHERE g.is_obsolete = 'F' ";
    }


    /**
     * Get list of columns in temp table as a string that can be added to 
     * any larger query
     */
    private String getTableColumns( String type ) {
	String columns = 
	    "map_element_id, " +
	    "tair_object_id, " +
	    "name, " +
	    "geneticmarker_type, " +
	    "units, " +
	    "chromosome, " +
	    "genetic_marker_id, " +
	    "position, " + 
        "query_id ";
    // need to check what kind of select it is. if it is result type (called in
    // getResultSlice, then we want to not return date_last_queried
    if (type.equalsIgnoreCase("all")){
        columns = columns + ", date_last_queried ";
    }
	return columns;
    }

    private String getDelete( String queryID ) {
        String delete = 
            "DELETE FROM RESULT_MARKER WHERE QUERY_ID = '" + queryID + "'";
        return delete;
    }
    
    /**
     * Get statement to insert results into temp table
     */
    private String getInsert() {
	String insert = 
	    "INSERT /*+ APPEND */ INTO RESULT_MARKER " + 
	    " ( " + getTableColumns( "all" ) + " ) ";

	return insert;
    }

    /**
     * Get search criteria for marker name using name finder to search names
     * and aliases
     */
    private String getMarkerNameCriteria( String name, String method ) {
	String nameCriteria = null;

	NameFinder nameFinder = new NameFinder();
	nameFinder.setNameFinder( "GeneticMarker", 
				  "genetic_marker_id", 
				  name, 
				  method );

	nameCriteria = "g.genetic_marker_id IN " + nameFinder.getNameSql() + " ";

	return nameCriteria;
    }

    /**
     * Create SQL to find markers matching submitted search params and insert
     * them into temp table
     */
    private String createQuery( Map searchParams, String queryID ) {
	String query = null;
	String name = (String) searchParams.get( "name" );
	String name_type = (String) searchParams.get( "name_type" );
	String method = (String) searchParams.get( "method" );
	String[] marker_type = (String[]) searchParams.get( "marker_type" );
	Boolean is_PCR = (Boolean) searchParams.get( "is_PCR" );
	    
	String low_ecotype = (String) searchParams.get( "low_ecotype" );
	String high_ecotype = (String) searchParams.get( "high_ecotype" );
	    
	String map_element_type =
	    (String) searchParams.get( "map_element_type" );

	String chromosome = (String) searchParams.get( "chromosome" );
	String map_type = (String) searchParams.get( "map_type" );

	java.util.Date limit_time = 
	    (java.util.Date) searchParams.get( "limit_time" );

	String order = (String) searchParams.get( "order" );
	    
	Units units = (Units) searchParams.get( "units" );

	String what = null;
	StringBuffer from = new StringBuffer();
	StringBuffer where = new StringBuffer();
	String position = null;


	// assembly unit data will only be present if search was linked to from
	// assembly unit detail page
	Long assembly_map_element_id = 
	    (Long) searchParams.get( "assembly_map_element_id" );
    
	boolean addMap = ( map_type != null || 
			   ( order != null && order.equals( "position" ) ) );

	boolean addAssignment = ( addMap ||assembly_map_element_id != null );

	if ( map_type != null && order != null && order.equals( "position" ) ) {
	    position = "a.start_position";
	}

	// common elements for all selects
	what = getBaseSelect( position, queryID );
	from.append( getBaseFrom() );
	where.append( getBaseWhere() );


	if ( addAssignment ) {
	    from.append( ", GlobalAssignment a " );
	    where.append( "AND a.map_element_id = g.map_element_id " +
			  "AND a.is_obsolete = 'F' " );
	}

	if ( addMap ) {
	    from.append( ", Map mp " );
	    where.append( "AND a.map_id = mp.map_id " );
	}

	// covers case both for is on a map & assignment queries
	if ( map_type != null ) {
	    where.append( "AND mp.name LIKE " + 
			  TextConverter.dbQuote( map_type.toUpperCase() + "%" ) + 
			  " ESCAPE '\\\' " );
	}


	// retrieve markers assigned onto assembly unit - only happens if 
	// coming from assembly unit detail page
	if ( assembly_map_element_id != null ) {
	    // assembly unit assignments in LocalAssignment 
	    from.append( ", LocalAssignment la " );
	    where.append( "AND la.sub_map_element_id = g.map_element_id " +
			  "AND la.super_map_element_id = " + 
			  assembly_map_element_id.toString() + " " );
	}
   
    
	if ( is_PCR != null && is_PCR.booleanValue() ) {
	    where.append( " AND g.is_pcr_marker='T'" );
	}
    
	if ( marker_type != null && marker_type.length > 0 ) {
	    where.append( " AND  g.geneticmarker_type in ( " );
	    boolean first = true;
	    for ( int i = 0; i < marker_type.length; i++ ) {
		if ( !first ) {
		    where.append( ", " );
		} else {
		    first = false;
		}

		where.append( TextConverter.dbQuote( marker_type[ i ] ) );
	    }
	    where.append( " ) " );
	}
    
	if ( limit_time != null ) {
	    where.append( " AND g.date_last_modified >= " + 
			  TextConverter.dbQuote( limit_time, "mm/dd/yyyy" ) );
	}
    
	// use form chromosome if it's there
	if ( !TextConverter.isEmpty( chromosome ) && 
	     !chromosome.equals( "any" ) ) {
	    where.append( " AND g.chromosome LIKE " + 
			  TextConverter.dbQuote( "%" + chromosome + "%" ) + 
			  " ESCAPE '\\\' " );
      
	    // if no chromosome entered, check to see if one is implied
	    // by the search by map location element search
	} else if ( units != null && units.useAssignmentChromosome() ) {
	    where.append( " AND g.chromosome LIKE " +
			  TextConverter.dbQuote( "%" + 
						 units.getAssignmentChromosome() + 
						 "%" ) + 
			  " ESCAPE '\\\' " );
	}
	
    
	// link to Polymorphism & Species Variant for ecotype info
	if ( low_ecotype != null && !low_ecotype.equalsIgnoreCase( "any" ) ) {
	    from.append( ", Polymorphism lp, " +
			 "Polymorphism_SpeciesVariant lps, " +
			 "SpeciesVariant lsv " );
	    where.append(
			 " AND lp.genetic_marker_id = g.genetic_marker_id " +
			 "AND lp.polymorphism_id = lps.polymorphism_id " +
			 "AND lps.species_variant_id = lsv.species_variant_id " +
			 "AND Upper( lsv.abbrev_name ) like " + 
			 TextConverter.dbQuote( "%" + 
						low_ecotype.toUpperCase() + 
						"%" ) + " ESCAPE '\\\' "
			 );
	}
    
	if ( high_ecotype != null && !high_ecotype.equalsIgnoreCase( "any" ) ) {
	    from.append( ", Polymorphism hp, " +
			 "Polymorphism_SpeciesVariant hps, " +
			 "SpeciesVariant hsv " );
	    where.append( 
			 " AND hp.genetic_marker_id = g.genetic_marker_id " +
			 "AND hp.polymorphism_id = hps.polymorphism_id " +
			 "AND hps.species_variant_id = hsv.species_variant_id " +
			 "AND Upper( hsv.abbrev_name ) like " + 
			 TextConverter.dbQuote( "%" +
						high_ecotype.toUpperCase() + 
						"%" ) + " ESCAPE '\\\' " 
			 );
	    
	    if ( low_ecotype != null && 
		 !low_ecotype.equalsIgnoreCase( "any" ) ) {

		where.append( " AND hp.polymorphism_id != lp.polymorphism_id " );
	    }
	}


	if ( units != null && map_type != null ) {
	    Double start = units.get_start();
	    Double end = units.get_end();
	    String low_unit = units.get_low_unit();
	    String high_unit = units.get_high_unit();
     
	    if ( start != null && low_unit != null ) {
		if ( low_unit.equalsIgnoreCase( "cm" ) ) {
		    where.append( " AND ( a.start_position >= " + start + 
				  " OR a.end_position >= " + start + 
				  " ) AND a.units = 'cM' " );
	 
	  
		} else if ( low_unit.equalsIgnoreCase( "kb" ) ) {
		    where.append( " AND ( " +
				  "( (a.start_position >= " + start + 
				  " OR a.end_position >= " + start +") " +
				  " AND a.units = " + 
				  TextConverter.dbQuote( low_unit ) + " ) " + 
				  " OR ( (a.start_position >=" + 
				  start.doubleValue() * 1000 +
				  " OR a.end_position >=" + 
				  start.doubleValue() * 1000+ " ) " +
				  " AND ( a.units ='bp' OR " +
				  "a.units is null ) ) ) " 
				  );
		}	
	    }
     
	    if ( end != null && high_unit != null ) {
		if ( high_unit.equalsIgnoreCase( "cm" ) ) {
		    where.append( " AND ( a.end_position <= " + end +
				  " OR a.start_position <= " + end +
				  " ) AND a.units = 'cM' " );	
		} else if ( high_unit.equalsIgnoreCase( "kb" ) ) {
		    where.append( " AND ( ( ( a.end_position <= " + end +
				  " OR a.start_position <= " + end +
				  " ) AND a.units = " + 
				  TextConverter.dbQuote( high_unit ) + 
				  " ) OR "+
				  " ( ( a.end_position <=" + 
				  end.doubleValue() * 1000 +
				  " OR a.start_position <=" + 
				  end.doubleValue() * 1000 +
				  " ) AND ( a.units = 'bp' " +
				  "OR a.units is null ) ) )" );
		}
	    }
	}

	// search combo. NameAlias table for name searches
	if ( name != null && name_type != null ) {
	    NameFinder nameFinder =  null;
      

	    // if searching by genetic marker name
	    if ( name_type.equals( "marker" ) ) { 
		where.append( " AND " + getMarkerNameCriteria( name, method ) );
	
		// if searching by gene name
	    } else if ( name_type.equals( "gene" ) ) {
		from.append( ", Gene_MapElement gme " );
		where.append( "AND g.map_element_id = gme.map_element_id " );
		nameFinder = new NameFinder();
		nameFinder.setNameFinder( "Gene", "gene_id", name, method );
		where.append( "AND gme.gene_id IN " + 
			      nameFinder.getNameSql() + " " );
	
		// if searching by locus name
	    } else if ( name_type.equals( "locus" ) ) {
		from.append( ", MapElement_Locus ml " );
		where.append( "AND g.map_element_id = ml.map_element_id " );
		nameFinder = new NameFinder();
		nameFinder.setNameFinder( "Locus", "locus_id", name, method );
		where.append( "AND ml.locus_id IN " + 
			      nameFinder.getNameSql() + " " );
	    }
      
	}
    
	query = 
	    what + 
	    from.toString() + 
	    where.toString();

	Debugger.println( query );

	return query;
    }

    /**
     * Method to decide whether to append comma for separating search criteria
     * based on whether current value is first in list or not; returns new value
     * of flag which tracks this
     */
    private final boolean appendComma( StringBuffer buffer, boolean first ) {
	if ( !first ) {
	    buffer.append( ", " );
	} else {
	    first = false;
	}
	return first;
    }


    /*
     * Returns description of search criteria used to create result set. This
     * is a convenience method to simplify life at the JSP search summary page.
     * Include information on total number of matches for complete description 
     * of result set. Interpretation of search params is slightly different if
     * doing general search versus a stand-alone genetic marker search; use 
     * isGeneral flag in searchParams to determine which type of search was 
     * done.
     */
    private String getFormatSearchCriteria( Map _searchParams, int resultSize ) {
	StringBuffer buffer = null;
	String criteria = null;

	Map searchParams = TextConverter.scrub(_searchParams);
	if ( searchParams != null ) {
	    buffer = new StringBuffer();

	    // if searching from general search, get specialized version
	    // of params
	    Boolean isGeneral = (Boolean) searchParams.get( "isGeneral" );
	    if ( isGeneral != null && isGeneral.booleanValue() ) {
		String searchTerm = (String) searchParams.get( "searchTerm" );
		String method = (String) searchParams.get( "method" );

		buffer.append( "Your query for genetic markers where " );
	
		if ( !TextConverter.isEmpty( searchTerm ) ) {
		    buffer.append( "name or marker type " + 
				   TextConverter.convertMethods( method ) +
				   " the term <font class=\"emphasis\">" + 
				   searchTerm + "</font> " );
		}


		// otherwise give params as if they were submitted for full 
		// marker search
	    } else { 

		String search_name = (String) searchParams.get( "name" );
		String search_method = (String) searchParams.get( "method" );
		String name_type = (String) searchParams.get( "name_type" );
	
		String[] marker_type = 
		    (String[]) searchParams.get( "marker_type" );

		Boolean is_PCR = (Boolean) searchParams.get( "is_PCR" );
	    
		String low_ecotype = (String) searchParams.get( "low_ecotype" );
		String high_ecotype = 
		    (String) searchParams.get( "high_ecotype" );
    
		String map_element_type = 
		    (String) searchParams.get( "map_element_type" );
		
		String map_type = (String) searchParams.get( "map_type" );
		if( map_type != null ){
		    map_type = map_type.toLowerCase(  );
		}
		String chromosome = (String) searchParams.get( "chromosome" );

		java.util.Date limit_time = 
		    (java.util.Date) searchParams.get( "limit_time" );
		
		String high_unit = (String) searchParams.get( "high_unit" );
		String high_range = (String) searchParams.get( "high_range" );
		String low_unit = (String) searchParams.get( "low_unit" );
		String low_range = (String) searchParams.get( "low_range" );
		String range_type =(String) searchParams.get( "range_type" );
		Units units = (Units) searchParams.get( "units" );

		// assembly unit data will only be present if search was linked
		// to from assembly unit detail page
		String assembly_unit_name = 
		    (String) searchParams.get( "assembly_unit_name" );
		
		Long assembly_map_element_id = 
		    (Long) searchParams.get( "assembly_map_element_id" );
    
		boolean first = true; 
		buffer.append( "Your query for genetic markers where " );

		if ( !TextConverter.isEmpty( search_name ) && 
		     !TextConverter.isEmpty( name_type ) ) {

		    if ( name_type.equals( "marker" ) ) {
			buffer.append( "marker name " );
		    } else if ( name_type.equals( "gene" ) ) {
			buffer.append( "gene name " );
		    } else if ( name_type.equals( "locus" ) ) {
			buffer.append( "locus name " );
		    }
		    buffer.append( TextConverter.convertMethods( search_method ) );
		    buffer.append( " the term <font class=\"emphasis\">" + 
				   search_name + "</font> " );
		    first = false;
		} 

		if ( !TextConverter.isEmpty( assembly_unit_name ) ) {
		    first = appendComma( buffer, first );
		    buffer.append( "annotation unit is " + assembly_unit_name );
		}

		
		if ( ( is_PCR != null && is_PCR.booleanValue() ) ||
		     ( marker_type != null && marker_type.length > 0 ) ) {
		    
		    first = appendComma( buffer, first );

		    boolean firstType = true;	
		    buffer.append( "marker type is " );

		    if ( marker_type != null ) {
			for ( int i = 0; i < marker_type.length; i++ ) {
			    if ( !firstType ) {
				buffer.append( " or " );
			    } else {
				firstType = false;
			    }
			    buffer.append( marker_type[ i ] );
			}
		    }

		    if ( is_PCR != null && is_PCR.booleanValue() ) {
			if ( !firstType ) {
			    buffer.append( " or " );
			}
			buffer.append( "all PCR " );
		    }
		}   
    
		if ( low_ecotype != null ) {
		    first = appendComma( buffer, first );
		    buffer.append( "low ecotype is " + low_ecotype + " " );
		}
    
		if ( high_ecotype != null ) {
		    first = appendComma( buffer, first );
		    buffer.append( "high ecotype is " + high_ecotype + " " );
		}
    
		if ( limit_time != null ) {
		    first = appendComma( buffer, first );
		    buffer.append( "entered after " + 
				   TextConverter.dateToString( limit_time ) );
		}
    
		if ( map_type != null ) {
		    first = appendComma( buffer, first );
		    buffer.append( "map type is " + map_type );
		}
    
		if ( chromosome != null ) {
		    first = appendComma( buffer, first );
		    buffer.append( "chromosome is " + 
				   Units.translateChromosome( chromosome ) );
		}
    
		// if searching by element, format is element_type name, 
		// else if searching by raw position format is position units
		String formatLowRange = null;
		String formatHighRange = null;
		if ( low_range != null && low_unit != null && 
		     ( low_unit.equalsIgnoreCase( "kb" ) || 
		       low_unit.equalsIgnoreCase( "cm" ) ) ) {

		    formatLowRange = low_range + " " + low_unit;
		} else {
		    formatLowRange = low_unit + " " + low_range;
		}

		if ( high_range != null && high_unit != null && 
		     ( high_unit.equalsIgnoreCase( "kb" ) ||
		       high_unit.equalsIgnoreCase( "cm" ) ) ) {
		    formatHighRange = high_range + " " + high_unit;
		} else {
		    formatHighRange = high_unit + " " + high_range;
		}

		if ( range_type != null && 
		     range_type.equalsIgnoreCase( "around" ) ) {

		    if ( units != null ) {
			first = appendComma( buffer, first );
			if ( low_range != null ) {
			    buffer.append( "around: " + formatLowRange + 
					   " within " );
			    buffer.append( units.getVariance() + " " + 
					   units.get_low_unit() );
			}
		    }

		} else if ( range_type != null && 
			    range_type.equalsIgnoreCase( "between" ) ) {

		    first = appendComma( buffer, first );
		    if ( low_range != null || high_range != null ) {
			buffer.append( "range: " );
		    }
	
		    if ( low_range != null ) {
			buffer.append( formatLowRange );
		    }

		    if ( low_range != null && high_range != null ) {
			buffer.append( " to " );
		    }
	
		    if ( high_range != null ) {
			buffer.append( formatHighRange + " " );
		    }
		}

	    }

	    if ( resultSize == 1 ) {
		buffer.append( " resulted in <font class=\"emphasis\">" + 
			       resultSize + "</font> match." );
	    } else {
		buffer.append( " resulted in <font class=\"emphasis\">" + 
			       resultSize + "</font> matches." );
	    }
	    criteria = buffer.toString();
	}
	return criteria;
    }
}
