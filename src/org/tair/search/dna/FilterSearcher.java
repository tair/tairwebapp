//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.19 $
// $Date: 2005/07/11 21:11:23 $
//------------------------------------------------------------------------------
package org.tair.search.dna;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.tair.tfc.DBconnection;
import org.tair.utilities.DataConstants;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;

/**
 * FilterSearcher is a concrete implementation of DNASearcher that handles
 * type specific searches for filters. FilterSearcher creates search SQL to
 * retrieve filters given search parameters, and returns search results as 
 * arrays of <code>FilterSummary</code> objects.  FilterSearcher also handles
 * validation of search parameters for a filter search, and retrieval of 
 * selected filters from total result set for downloading.
 *
 * <p>
 * Filters are actually stored in Stock table, but treated as a distinct sub
 * type of dna search
 */

public class FilterSearcher extends DNASearcher {


    /**
     * Retrieves requested slice of total result set
     *
     * @param conn An active connection to the database
     * @param scrollParams ScrollParams object containing data defining floor
     * and ceiling of result set
     * @param sessionID User's session id. Used to retrieve data from person
     * specific temp table
     * @param String orderBy Field to order search results by
     * @return filter search results as an <code>SearchResultsCollection</code>
     * containing an array of <code>FilterSummary</code> objects and data on 
     * the complete result set
     * @throws SQLException thrown if a database error occurs
     */
    public SearchResultsCollection getResultSlice( DBconnection conn, 
						   ScrollParams scrollParams, 
						   String orderBy,
                           String queryID ) 
	throws SQLException {

        FilterSummary[] searchResults = null;
        FilterSummary filter = null;
        ArrayList found = null;

        SearchResultsCollection searchCollection = 
	    new SearchResultsCollection();

        int floor = scrollParams.getFloor();
        int ceiling = scrollParams.getCeiling();
        int rowCounter = 0;

        // create query to select filters from temp table -
        // filters can only be sorted by filter name
        StringBuffer query = new StringBuffer();
        query.append( "SELECT " + getTableColumns( "result" ) +
                      "FROM RESULT_FILTER WHERE QUERY_ID = '" + queryID + "' " + 
                      "ORDER BY name " );

        conn.setQuery( query.toString() );
        ResultSet results = conn.getResultSet();
        while ( results.next() ) {
            if ( rowCounter >= floor && rowCounter <= ceiling ) {
                filter = getFilterRow( results );

                if ( found == null ) {
                    found = new ArrayList();
                }

                found.add( filter );
            } 

            rowCounter++;
        }
        conn.releaseResources();

        if ( found != null && !found.isEmpty() ) {
            searchResults = makeArray( conn, found );
            searchCollection.setResults( searchResults );
            searchCollection.setResultSize( rowCounter );
            searchCollection.setFloor( floor + 1 );
            searchCollection.setCeiling( floor + found.size() );
        }
        return searchCollection;
    }
    
    public String generateInsertLine( DBconnection conn, Map searchParams, String type )
    throws SQLException {
        if (type.equalsIgnoreCase("form") ) {
            String insert_query = createQuery( searchParams, "" );
            super.clearTables();
            return insert_query;
        } else if (type.equalsIgnoreCase("general")) {
            String searchTerm = (String) searchParams.get("searchTerm");
            String insert_query = "FILTER_QUICKSEARCH_" + searchTerm;
            super.clearTables();
            return insert_query;
        } else {
            String insert_query = createQuery( searchParams, "" );
            super.clearTables();
            return insert_query;
        }
    }

    /**
     * Retrieves selected filters as <code>FilterSummary</code> objects, which
     * implement the <code>DNASummary</code> interface, from result set using 
     * supplied ids. This method is used for downloading information for 
     * selected objects.
     *
     * @param conn An active connection to the database
     * @param stockIDs Selected stock ids to retrieve from total result set
     * @param sessionID User's session id. Used to retrieve data from person
     * specific temp table
     * @return Array of <code>FilterSummary</code> objects
     * @throws SQLException thrown if a database error occurs 
     */
    public DNASummary[] getSelected( DBconnection conn, 
				     List stockIDs, 
				     String queryID ) 
	throws SQLException {

        ArrayList found = null;
        FilterSummary[] filters = null;
        FilterSummary filter = null;
        ResultSet results = null;

        String query = 
            "SELECT " + getTableColumns( "result" ) + " " +
            "FROM RESULT_FILTER WHERE QUERY_ID = '" + queryID + "' " + 
            "AND stock_id = ?";
    
        conn.setQuery( query );

        Iterator iter = stockIDs.iterator();
        while ( iter.hasNext() ) {
            conn.setQueryVariable( (Long) iter.next() );
            results = conn.getResultSet();
            while ( results.next() ) {
                filter = getFilterRow( results );

                if ( found == null ) {
                    found = new ArrayList();
                }

                found.add( filter );
            }
        }
        conn.releaseResources();

    
        if ( found != null && !found.isEmpty() ) {
            filters = makeArray( conn, found );
        }
        return filters;
    }

    /**
     * save row of result set as FilterSummary object
     */
    private FilterSummary getFilterRow( ResultSet results ) 
	throws SQLException {

        FilterSummary filter = new FilterSummary();
        filter.set_tair_object_id( new Long( 
				      results.getLong( "tair_object_id" ) ) );

        filter.set_stock_id( new Long( results.getLong( "stock_id" ) ) );
        filter.set_name( results.getString( "name" ) );
        filter.set_stock_availability_type_id( 
	    new Long( results.getLong( "stock_availability_type_id" ) ) );

        filter.set_stock_availability_type( 
	    results.getString( "stock_availability_type" ) );

        return filter;
    }


    /**
     * Translate collection of search results into type-specific array; 
     * retrieve extra info. needed for display or results
     */
    private FilterSummary[] makeArray( DBconnection conn, List found ) 
	throws SQLException {

        FilterSummary[] filters = null;

        if ( found != null && !found.isEmpty() ) {
            filters = new FilterSummary[ found.size() ];
            filters = (FilterSummary[]) found.toArray( filters );

	    // get stock description for display
            for ( int i = 0; i < filters.length; i++ ) {
                filters[ i ].populate( conn ); 
            }
        }
        return filters;
    }

    /**
     * Get temp table columns as string that can be inserted into SQL query
     */
    private String getTableColumns( String type ) {
        String columns =
            "stock_id, " +
            "tair_object_id, " +
            "name, " +
            "stock_availability_type, " +
            "stock_availability_type_id, " + 
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
            "SELECT s.stock_id, " +
            "s.tair_object_id, " +
            "s.name, " +
            "sat.stock_availability_type, " +
            "s.stock_availability_type_id ";
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
        return "FROM Stock s, StockAvailabilityType sat, StockType st ";
    }

    /**
     * Get base where clause for full search
     */
    private String getBaseWhere() {
        String where =
            "WHERE s.stock_availability_type_id = " +
	    "sat.stock_availability_type_id " +
            "AND s.stock_type_id = st.stock_type_id " +
            "AND s.is_obsolete = 'F' " +
            "AND st.stock_type = 'filter' ";
        return where;
    }

    /**
     * Get statement to insert into temp table
    */
    public String getInsert() {
        String insert =
            "INSERT INTO RESULT_FILTER " +
            " ( " + getTableColumns( "all" ) + " ) ";
        return insert;
    }

    public String getDelete(String query_id){
        String del =
            "DELETE FROM RESULT_FILTER WHERE QUERY_ID = '" + query_id + "' ";
        return del;
    }
  
    /**
     * Retrieves URL to use for displaying search results
     *
     * @return URL of JSP to display filter search results
     */
    public String getSummaryPage() {
	return "/jsp/search/dna/filter_summary.jsp";
    }


    /**
     * Get literal value for referring to temp table
     */
    private String getSearchType() {
	return "filter";
    }


    /**
     * Adds criteria to search filters by donor name. Overridden from superclass 
     * since we don't need to sub-select on Stock when it's our starting point
     *
     * <p>
     * Search will search for donor Person or Organization according to the 
     * value of personSearch param.
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search donor names for 
     * @param prefix Table prefix to use when joining to donor criteria 
     * (ignored in this implementation, but need to keep it in param list so 
     * searching can still be done through polymorphic implementation of this 
     * method)
     * @param personSearch If <code>true</code> donor person last_name will be
     * searched, if <code>false</code> donor organization name will be searched
     */
    protected void searchDonorName( StringBuffer where, 
				    String term, 
				    String prefix, 
				    boolean personSearch ) 
    { 

	// use same table alias for simplicity
        String table = personSearch ? "Person p" : "Organization p";
        String searchColumn = personSearch ? "p.last_name_uc" : "p.name_uc";
        
        where.append( "AND EXISTS ( " +
                          "SELECT 'X' " +
                          "FROM Donor d, Community cm, " + table + " " +
                          "WHERE d.stock_id = s.stock_id " +
                          "AND d.community_id = cm.community_id " +
                          "AND cm.community_id = p.community_id " +
                          "AND d.community_id = p.community_id " +
                          "AND cm.is_obsolete = 'F' " +
                          "AND cm.status = " + 
		          TextConverter.dbQuote( 
			      DataConstants.getActiveStatus() ) + " " +
                          "AND " + searchColumn + " LIKE " + term +
                      " ESCAPE '\\\') "
                      );
    }
  
    /**
     * Adds criteria to search filters by donor stock number. Overridden from
     * superclass since we don't need to sub-select on Stock when it's our
     * starting point
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search donor stock numbers for 
     * @param prefix Table prefix to use when joining to donor criteria 
     * (ignored in this implementation, but need to keep it in param list so 
     * searching can still be done through polymorphic implementation of this 
     * method)
     */
    protected void searchDonorStockNumber( StringBuffer where, 
					   String term, 
					   String prefix )
    { 
        where.append( "AND EXISTS ( " +
                          "SELECT 'X' " +
                          "FROM Donor d " +
                          "WHERE d.stock_id = s.stock_id " +
  		          "AND d.donor_stock_number_uc LIKE " + term +
                      " ESCAPE '\\\') "
                      );
    }
  
    /**
     * Adds criteria to search filters by stock number. Overridden from 
     * superclass since we don't need to sub-select on Stock when it's our 
     * starting point
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search donor names for 
     * @param prefix Table prefix to use when joining to donor criteria (ignored
     * in this implementation, but need to keep it in param list so searching 
     * can  still be done through polymorphic implementation of this method)
     * @param filter If <code>true</code> then stock number must be for stock 
     * where type is "filter" (ignored in this implementations sincee filter 
     * stock type has already been specified in main select
     */
    protected void searchStockNumber( StringBuffer where, 
				      String term, 
				      String prefix, 
				      boolean filter ) 
    { 
        where.append( "AND EXISTS ( " +
                          "SELECT 'X' " +
                          "FROM StockNameAlias sna " +
                          "WHERE sna.stock_id = s.stock_id " +
                          "AND sna.name LIKE " + term +
                      " ESCAPE '\\\') " 
                      );  
    
    }
  
    /**
     * Adds criteria to search filters by stock description. Overridden from 
     * superclass since we don't need to sub-select on Stock when it's our 
     * starting point
     *
     * <p>
     * Description searching is done using description_uc specialized search
     * field
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search donor names for 
     * @param prefix Table prefix to use when joining to donor criteria (ignored
     * in this implementation, but need to keep it in param list so searching 
     * can still be done through polymorphic implementation of this method)
     */
    protected void searchStockDescription( StringBuffer where, 
					   String term, 
					   String prefix ) 
    { 
        where.append( "AND s.description_uc LIKE " + term + " ESCAPE '\\\' " );
    }


    /**
     * Creates SQL to retrieve filters given search parameters, and insert into
     * temp table created for user with queryID.  Query creation is handled by
     * adding filter specific data to query here, and then using createQuery() 
     * in <code>DNASearcher</code> superclass to add all other search criteria 
     * to query
     *
     * @param searchParams Search criteria to use when retrieving result set
     * @param queryID User's query id to use when creating temp table to
     * hold user's search results
     * @return SQL query to retrieve filters given searchParams and insert into 
     * temp table
     */
    public String createQuery( Map searchParams, String queryID ) {
        StringBuffer from = new StringBuffer();
        StringBuffer where = new StringBuffer();
        StringBuffer joins = new StringBuffer();

        // create base query with specific restriction where stock type = filter
        from.append( getBaseSelect( queryID ) + getBaseFrom() );
        joins.append( getBaseWhere() );
        super.addTable( "Stock" );

        String subQuery = super.createQuery( searchParams, 
					     "s", 
					     from, 
					     where, 
					     joins );

        return subQuery;
    }


    /**
     * Validates search parameters for a filter search. Any errors encountered
     * are stored in errors Map with field name as <code>String</code> key
     * referencing a <code>String</code> error message
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

        // filters aren't map elements, so all map/sequence params as well
	// as join to GeneticMarker are invalid
        if ( is_sequenced != null && is_sequenced.booleanValue() ) {
            errors.put( "is sequenced", "Filters cannot be sequenced" );
        }

        if ( ( is_on_a_map != null && is_on_a_map.booleanValue() ) ||
             !TextConverter.isEmpty( chromosome ) ||
             !TextConverter.isEmpty( map_type ) ||
             ( order != null && order.equals( "position" ) ) ) {
            errors.put( "Map position", 
			"Filters cannot be searched or sorted " +
			"by map position" );
        }

        if ( is_genetic_marker != null && is_genetic_marker.booleanValue() ) {
            errors.put( "is genetic marker", 
			"Filters cannot be genetic markers" );
        }

        if ( is_full_length_cds != null && is_full_length_cds.booleanValue() ) {
            errors.put( "is full length cDNA", 
			"Filters cannot be full length cDNA" );
        }

        // if searching by vector type, insert type or clone end type...
        if ( ( vector_type != null && vector_type.length > 0 ) && 
	     !vector_type[ 0 ].equalsIgnoreCase( "any" ) ) {
            errors.put( "Vector type", 
			"Filters cannot be searched by vector type" );
        }
      
        if ( ( insert_type != null && insert_type.length > 0 ) && 
	     !insert_type[ 0 ].equalsIgnoreCase( "any" ) ) {
            errors.put( "Insert type", 
			"Filters cannot be searched by insert type" );
        }

        if ( ( clone_end_type != null && clone_end_type.length > 0 ) && 
	     !clone_end_type[ 0 ].equalsIgnoreCase( "any" ) ) {
            errors.put( "Clone end type", 
			"Filters cannot be searched by clone end type" );
        }
    
        if ( !validTermType( term_1, type_1 ) ) {
            errors.put( "term 1", "Filters cannot be searched by " + type_1 );
        }

        if ( !validTermType( term_2, type_2 ) ) {
            errors.put( "term 2", "Filters cannot be searched by " + type_2 );
        }

        if ( !validTermType( term_3, type_3 ) ) {
            errors.put( "term 3", "Filters cannot be searched by " + type_3 );
        }
    
    }

  
    /**
     * Determine if selected search term type is valid for filter search
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

            } else if ( type.equals( "locus" ) ) {
                valid = false;

            } else if ( type.equals( "gene" ) ) {
                valid = false;

            } else if ( type.equals( "strain_name" ) ) {
		valid = false;
		
	    } else if ( type.equals( "strain_description" ) ) {
		valid = false;
	    }
        }

        return valid;
    }
  
}
