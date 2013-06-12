//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2004/05/24 23:34:15 $
//------------------------------------------------------------------------------

package org.tair.search.dna;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.tair.search.GeneralSearcher;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;


/**
 * HostStrainSearcher is a concrete implementation of DNASearcher that handles 
 * type specific searches for host strains. HostStrainSearcher creates search 
 * SQL to retrieve strains given search parameters, and returns search results 
 * as arrays of <code>HostStrainSummary</code> objects. HostStrainSearcher also
 * handles validation of search parameters for a host strain search, and 
 * retrieval of selected items from total result set for downloading.
 *
 * <p>
 * HostStrainSearcher implements GeneralSearcher interface so that it can be 
 * used by GeneralSearchHandler to carry out host strain searches as part of 
 * the general search.
 */

public class HostStrainSearcher extends DNASearcher implements GeneralSearcher {

    /**
     * Retrieves URL to use for displaying search results
     *
     * @return URL of JSP to display host strain search results
     */  
    public String getSummaryPage() { 
        return "/jsp/search/dna/host_strain_summary.jsp"; 
    }


    /**
     * Get literal value for referring to temp table
     */
    private String getSearchType() { 
        return "strain"; 
    }


    /**
     * Executes a host strain search as part of the general search.  Search can
     * be done to just return number of matching host strain records, or to give
     * the first page of stock search results according to the submitted value
     * of doCounts.  This method should only be called by GeneralSearchHandler 
     * as part of the general search.  If requesting actual search results, 
     * searching will insert results into user's temp table, and redirect user
     * to normal DNA host strain summary page to display results. Subsequent 
     * requests for additional pages of results will be handled by search() 
     * method. Results are always returned as a SearchResultsCollection; if full
     * search info is requested, collection will contain an array of 
     * HostStrainSummary objects & other search info exactly as if search() were
     * called; if counts are requested, only the result size parameter of the 
     * collection will be populated
     *
     * @param searchParams Map containing search parameters
     * @param doCounts If <code>true</code>, only counts of matching host 
     * strains will be returned, if <code>false</code> first page of matching 
     * host strains will be returned
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
        
        String searchTerm = (String) searchParams.get( "searchTerm" );
        String method = (String) searchParams.get( "method" );
        String queryID = "";

        try {
            searchTerm = TextConverter.convertEnds( searchTerm.toUpperCase(), 
						    method );

            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.getSearchConnection();

            // if getting counts, just need number of distinct stock ids
            if ( doCounts ) {
                searchResults = doGeneralCounts( conn, searchTerm );

		// else need to insert result set into temp table and
		// get first page
            } else {
                queryID = (String) searchParams.get("query_id");

                if (firstSearch) {
                    doFullGeneralSearch( conn, searchTerm, queryID );
                }

                // get first page of results from temp table, sort by stock name
                ScrollParams scrollParams = ScrollCalculator.getDefaultScrollParams();
                searchResults = getResultSlice( conn, 
								scrollParams, 
								"name", 
                                queryID );

                // get links for scrolling through results
                if ( !searchResults.isEmpty() ) {
                    searchResults.setScrollLinks( 
		            ScrollCalculator.getTableScrollLinks( scrollParams.getSize(), 
						       scrollParams.getPage(), 
						       searchResults,
                               queryID ));
                }

                // get plain text version of search parameters
                if ( searchResults != null && !searchResults.isEmpty() ) {
                    searchResults.setSearchCriteria( 
			  getFormatSearchCriteria( searchParams, 
						   searchResults.getResultSize() ) );
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
    public String generateInsertLine( DBconnection conn, 
                                        Map searchParams, String type )
    throws SQLException {                                           
        String insert_query = "";
        return insert_query;
    }  

    /**
     * Retrieve distinct number of host strain ids where name equals 
     * search term
     * 
     * @param conn An active connection to the database
     * @param searchTerm Term to search for
     * @return SearchResultsCollection containing the number of ids
     * found for search term
     * @throws SQLException if a database error occurs
     */
    private SearchResultsCollection doGeneralCounts( DBconnection conn, 
                                                     String searchTerm ) 
        throws SQLException {

        int count = 0;

        StringBuffer query = new StringBuffer();    
        query.append( "SELECT DISTINCT h.host_strain_id " +
                      getBaseFrom() + ", HostStrainNameAlias hsna " +
                      getBaseWhere() +
                      "AND h.host_strain_id = hsna.host_strain_id " +
                      "AND hsna.name LIKE ?  ESCAPE '\\\'"
                      );
    
        conn.setQuery( query.toString() );
	conn.setQueryVariable( searchTerm );

        ResultSet results = conn.getResultSet();

        while ( results.next() ) {
            count++;
        }
        conn.releaseResources();

        SearchResultsCollection searchResults = new SearchResultsCollection();
        searchResults.setResultSize( count );

        return searchResults;
    }

    /**
     * Retrieve all host strains whose name matches search term; insert results
     * into temp table, retrieve first page of results, and get descriptive 
     * version of search criteria for display on summary page
     *
     * @param conn An active connection to the database
     * @param searchTerm Search term to look for
     * @param sessionID User's session id for creating temp table to hold
     * search results
     * @return SearchResultsCollection containing all data for displaying
     * first page of host strain search results
     * @throws SQLException if a database error occurs
     */
    private void doFullGeneralSearch( DBconnection conn, String searchTerm, 
                                                         String queryID ) 
        throws SQLException {
    
        StringBuffer query = new StringBuffer();
        query.append( getInsert() +
                      getBaseSelect( queryID ) +
                      getBaseFrom() +
                      ", HostStrainNameAlias a " +
                      getBaseWhere() + 
                      "AND h.host_strain_id = a.host_strain_id " +
                      "AND a.name LIKE ? ESCAPE '\\\'"
                      );
    
	    // execute search & insert results into temp table
        conn.setQuery( query.toString() );
	    conn.setQueryVariable( searchTerm );
        conn.executeUpdate();
        conn.releaseResources();
    
    }


    /**
     * Retrieves requested slice of total result set
     *
     * @param conn An active connection to the database
     * @param scrollParams ScrollParams object containing data defining floor 
     * and ceiling of result set
     * @param sessionID User's session id. Used to retrieve data from person
     * specific temp table
     * @param String orderBy Field to order search results by
     * @return DNA stock search results as an 
     * <code>SearchResultsCollection</code> containing an array of 
     * <code>StockSummary</code> objects and data on the complete result set
     * @throws SQLException thrown if a database error occurs
     */
    public SearchResultsCollection getResultSlice( DBconnection conn, 
                                                   ScrollParams scrollParams,
                                                   String orderBy,
                                                   String queryID ) 
        throws SQLException {


        SearchResultsCollection searchCollection = 
	    new SearchResultsCollection();

        int floor = scrollParams.getFloor();
        int ceiling = scrollParams.getCeiling();
        int rowCounter = 0;
    
        // create select query to retrieve data from temp table holding full 
	// result set 
        StringBuffer query = new StringBuffer();
        query.append( "SELECT " + getTableColumns( "result" ) + " " +
                      "FROM RESULT_STRAIN WHERE QUERY_ID = '" + queryID + "' " + 
                      "ORDER BY name " // Strains can only be sorted by name
                      );

        conn.setQuery( query.toString() );

	ArrayList found = null;
        HostStrainSummary strain = null;
	
        ResultSet results = conn.getResultSet();
        while ( results.next() ) {
            if ( rowCounter >= floor && rowCounter <= ceiling ) {
                strain = getRow( results );
                if ( found == null ) {
                    found = new ArrayList();
                }

                found.add( strain );
            } 

            rowCounter++;
        }
        conn.releaseResources();

        if ( found != null && !found.isEmpty() ) {
	    HostStrainSummary[] searchResults = makeArray( conn, found );
            searchCollection.setResults( searchResults );
            searchCollection.setResultSize( rowCounter );
            searchCollection.setFloor( floor + 1 );
            searchCollection.setCeiling( floor + found.size() );
        }

        // set JSP URL for displaying results
        searchCollection.setResultsPage( getSummaryPage() );
	
        return searchCollection;
    }


    /**
     * Retrieves selected host strain items as <code>HostStrainSummary</code>
     * objects, which implement the <code>DNASummary</code> interface, from 
     * result set using supplied ids. This method is used for downloading 
     * information for selected objects.
     *
     * @param conn An active connection to the database
     * @param hostStrainIDs Selected host strain ids to retrieve from total 
     * result set
     * @param sessionID User's session id. Used to retrieve data from person 
     * specific temp table
     * @return Array of <code>HostStrainSummary</code> objects
     * @throws SQLException thrown if a database error occurs 
     */
    public DNASummary[] getSelected( DBconnection conn, 
				     List hostStrainIDs, 
				     String queryID ) 
        throws SQLException {

	HostStrainSummary[] strains = null;

        String query = 
            "SELECT " + getTableColumns( "result" ) + " "+
            "FROM RESULT_STRAIN WHERE QUERY_ID = '" + queryID + "' " + 
            "AND host_strain_id = ?";

        conn.setQuery( query );

        ArrayList found = null;
        HostStrainSummary strain = null;
        ResultSet results = null;

        Iterator iter = hostStrainIDs.iterator();
        while ( iter.hasNext() ) {
            conn.setQueryVariable( (Long) iter.next() );
            results = conn.getResultSet();
            while ( results.next() ) {
                strain = getRow( results );

                if ( found == null ) {
                    found = new ArrayList();
                }

                found.add( strain );
            }
        }
        conn.releaseResources();

	
        if ( found != null && !found.isEmpty() ) {
            strains = makeArray( conn, found );
        }
        return strains;
    }

    /**
     * Save row of results as a HostStrainSummary object
     *
     * @param results ResultSet containing data to be stored in Summary object
     * @return HostStrainSummary object populated with data from a single
     * row in submitted ResultSet
     * @throws SQLException if a database error occurs
     */
    private HostStrainSummary getRow( ResultSet results ) throws SQLException {
        HostStrainSummary strain = new HostStrainSummary();

	strain.setHostStrainID( 
	     new Long( results.getLong( "host_strain_id" ) ) );

	strain.setTairObjectID(
             new Long( results.getLong( "tair_object_id" ) ) );

	strain.setTaxonID( new Long( results.getLong( "taxon_id" ) ) );
	strain.setName( results.getString( "name" ) );
	strain.setOriginalName( results.getString( "original_name" ) );

        return strain;
    }

    /**
     * Translate collection of search results into type specific array; get
     * stock description and donors for each element in array
     *
     * @param conn An active connection to the database
     * @param found List of HostStrainSummary objects representing search
     * results
     * @return Summary objects in submitted found list translated into
     * type specific array with any optional data required for display 
     * populated
     * @throws SQLException if a database error occurs
     */
    private HostStrainSummary[] makeArray( DBconnection conn, List found ) 
        throws SQLException {

        HostStrainSummary[] strains = null;

        if ( found != null && !found.isEmpty() ) {
            strains = new HostStrainSummary[ found.size() ];
            strains = (HostStrainSummary[]) found.toArray( strains );
            for ( int i = 0; i < strains.length; i++ ) {
                strains[ i ].populate( conn );
            }
        }

        return strains;
    }


    /**
     * Get temp table columns as string that can be inserted into SQL query
     */
    private String getTableColumns( String type ) {
        String columns =
            "host_strain_id, " +
	        "tair_object_id, " +
            "taxon_id, " +
            "name, " +
	        "original_name, " + 
            "query_id ";
        // need to check what kind of select it is. if it is result type (called in
        // getResultSlice, then we want to not return date_last_queried
        if (type.equalsIgnoreCase("all")){
            columns = columns + ", date_last_queried ";
        }
        return columns;
    }

    /**
     * Get base select for full search
     */
    private String getBaseSelect( String queryID ) {
        String select =
            "SELECT hs.host_strain_id, " +
	        "hs.tair_object_id, " +
            "hs.taxon_id, " +
            "hs.name, " +
            "hs.original_name ";
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
     * Get base from clause for full search
     */
    private String getBaseFrom() {
        return "FROM HostStrain hs ";
    }

    /**
     * Get base where clause for full search
     */
    private String getBaseWhere() {
        StringBuffer where = new StringBuffer();
        where.append( "WHERE hs.is_obsolete = 'F' " );
        return where.toString();
    }
  
    /**
     * Get statement to insert into temp table
    */
    public String getInsert() {
        String insert =
            "INSERT INTO RESULT_STRAIN " +
            " ( " + getTableColumns( "all" ) + " ) ";
        return insert;
    }

    public String getDelete(String query_id){
        String del =
            "DELETE FROM RESULT_STRAIN WHERE QUERY_ID = '" + query_id + "' ";
        return del;
    }


    /**
     * Adds criteria to search elements by host strain name
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search host strain names for
     */
    protected void searchHostStrainName( StringBuffer where, 
					 String term ) 
    { 
	where.append( "AND EXISTS(" +
		          "SELECT 'X' " +
		          "FROM HostStrainNameAlias hsna " +
		          "WHERE hs.host_strain_id = hsna.host_strain_id " +
		          "AND hsna.name LIKE " + term + 
		      " ESCAPE '\\\') " );
    }
    
    /**
     * Adds criteria to search elements by host strain description
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search host strain descriptions for
     */
    protected void searchHostStrainDescription( StringBuffer where, 
						String term ) 
    {
	where.append( "AND UPPER( hs.description ) LIKE " + term + " ESCAPE '\\\' " );
	
    }
    
    /**
     * Adds a join to the Stock table to current query for HostStrain
     * entries
     *
     * @param from FROM clause to add table to 
     * @param where WHERE clause to add table join to
     * @param joins Table join statements of WHERE clause
     */
    protected void addStock( StringBuffer from, 
			     StringBuffer where, 
			     StringBuffer joins ) 
    { 
	from.append( ", TairObject_Stock ts, Stock s " );
	joins.append( "AND ts.tair_object_id = hs.tair_object_id " +
		      "AND ts.stock_id = s.stock_id " );
	where.append( "AND s.is_obsolete = 'F' " );
    }


   /**
     * Creates SQL to retrieve dna stock given search parameters, and insert 
     * into temp table created for user with sessionID.  Query creation is 
     * handled by adding dna stock specific data to query here, and then using 
     * createQuery() in <code>DNASearcher</code> superclass to add all other 
     * search criteria to query
     *
     * @param searchParams Search criteria to use when retrieving result set
     * @param sessionID User's session id to use when creating temp table to 
     * hold user's search results
     * @return SQL query to retrieve dna stock given searchParams and insert 
     * into temp table
     */
    public String createQuery( Map searchParams, String queryID) {
        StringBuffer from = new StringBuffer();
        StringBuffer where = new StringBuffer();
        StringBuffer joins = new StringBuffer();


        // create base query
        from.append( getBaseSelect( queryID ) + getBaseFrom() );
        joins.append( getBaseWhere() );
        super.addTable( "HostStrain" );

        String subQuery = super.createQuery( searchParams, 
					     "hs", 
					     from, 
					     where, 
					     joins );

        return subQuery;
    }
  


    /**
     * Validates search parameters for a dna stock search. Any errors 
     * encountered are stored in errors Map with field name as 
     * <code>String</code> key referencing a <code>String</code> error
     * message
     *
     * @param searchParams Search parameters to validate
     * @param errors Map to hold all errors encountered while validating
     */    
    public void validateParams( Map searchParams, Map errors ) {

        String term_1 = (String) searchParams.get( "term_1" );
        String type_1 = (String) searchParams.get( "type_1" );
        String method_1 = (String) searchParams.get( "method_1" );

        String term_2 = (String) searchParams.get( "term_2" );
        String type_2 = (String) searchParams.get( "type_2" );
        String method_2 = (String) searchParams.get( "method_2" );

        String term_3 = (String) searchParams.get( "term_3" );
        String type_3 = (String) searchParams.get( "type_3" );
        String method_3 = (String) searchParams.get( "method_1" );

        String[] vector_type = (String[]) searchParams.get( "vector_type" );
        String[] insert_type = (String[]) searchParams.get( "insert_type" );

        String[] clone_end_type = 
	    (String[]) searchParams.get( "clone_end_type" );

        Boolean is_sequenced = (Boolean) searchParams.get( "is_sequenced" );

        Boolean is_genetic_marker = 
	    (Boolean) searchParams.get( "is_genetic_marker" );

        Boolean is_on_a_map = (Boolean) searchParams.get( "is_on_a_map" );

        Boolean is_full_length_cds =
	    (Boolean) searchParams.get( "is_full_length_cds" );

        String chromosome = (String) searchParams.get( "chromosome" );
        String map_type = (String) searchParams.get( "map_type" );
        String order = (String) searchParams.get( "order" );

        // Host strains stocks aren't map elements, so all map/sequence params
	// as well as join to GeneticMarker are invalid
        if ( is_sequenced != null && is_sequenced.booleanValue() ) {
            errors.put( "is sequenced", "Host strains cannot be sequenced" );
        }

        if ( ( is_on_a_map != null && is_on_a_map.booleanValue() ) ||
             !TextConverter.isEmpty( chromosome ) ||
             !TextConverter.isEmpty( map_type ) ||
             ( order != null && order.equals( "position" ) ) ) {
            errors.put( "Map position", 
			"Host strains cannot be searched or " +
			"sorted by map position" );
        }

        if ( is_genetic_marker != null && is_genetic_marker.booleanValue() ) {
            errors.put( "is genetic marker", 
			"Host strains cannot be genetic markers" );
        }

        if ( is_full_length_cds != null && is_full_length_cds.booleanValue() ) {
            errors.put( "is full length cDNA", 
			"Host strains cannot be full length cDNA" );
        }

        // if searching by vector type, insert type or clone end type...
        if ( ( vector_type != null && vector_type.length > 0 ) && 
             !vector_type[ 0 ].equalsIgnoreCase( "any" ) ) {
            errors.put( "Vector type", 
			"Host strains cannot be searched by vector type" );
        }
      
        if ( ( insert_type != null && insert_type.length > 0 ) && 
             !insert_type[ 0 ].equalsIgnoreCase( "any" ) ) {
            errors.put( "Insert type", 
			"Host strains cannot be searched by insert type" );
        }

        if ( ( clone_end_type != null && clone_end_type.length > 0 ) && 
             !clone_end_type[ 0 ].equalsIgnoreCase( "any" ) ) {
            errors.put( "Clone end type", 
			"Host strains cannot be searched by clone end type" );
        }
    
        if ( !validTermType( term_1, type_1 ) ) {
            errors.put( "term 1",
			"Host strains cannot be searched by " + type_1 );
        }

        if ( !validTermType( term_2, type_2 ) ) {
            errors.put( "term 2", 
			"Host strains cannot be searched by " + type_2 );
        }

        if ( !validTermType( term_3, type_3 ) ) {
            errors.put( "term 3", 
			"Host strains cannot be searched by " + type_3 );
        }
    
    }

    /**
     * Determine if selected search term type is valid for dna stock search
     */
    private boolean validTermType( String term, String type ) {
        boolean valid = true;

        if ( term != null && type != null ) {
            if ( type.equals( "clone" ) ) {
                valid = false;

            } else if ( type.equals( "clone_end" ) ) {
                valid = false;

            } else if ( type.equals( "library" ) ) {
                valid = false; 

            } else if ( type.equals( "vector" ) ) {
                valid = false;

            } else if ( type.equals( "accession" ) ) {
                valid = false;

            } else if ( type.equals( "genbank_gi" ) ) {
                valid = false;

            } else if ( type.equals( "filter" ) ) {
                valid = false;

            } else if ( type.equals( "locus" ) ) {
                valid = false;

            } else if ( type.equals( "gene" ) ) {
                valid = false;
            }

        }

        return valid;
    }


    /*
     * Returns description of search criteria used to create result set when searching
     * using general search.  This method is defined as an adapter method in DNASearcher
     * superclass, and must be implemented in each sub-class to allow for type-specific 
     * definition of search criteria.
     */
    protected String getGeneralSearchCriteria( Map searchParams, int resultSize ) {
        StringBuffer buffer = null;
        String criteria = null;

        if ( searchParams != null ) {
            buffer = new StringBuffer();

            String searchTerm = (String) searchParams.get( "searchTerm" );
            String method = (String) searchParams.get( "method" );
            buffer.append( "Your query for host strains where " );
        
            if ( !TextConverter.isEmpty( searchTerm ) ) {
                buffer.append( "name " + TextConverter.convertMethods( method ) +
                               " the term <font class=\"emphasis\">" + searchTerm + "</font> " );
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
