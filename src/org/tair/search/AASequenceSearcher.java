//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.27 $
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
import org.tair.tfc.TfcStructuralClassType;
import org.tair.utilities.Debugger;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;

/**
 * AASequenceSearcher retrieves protein sequences according to submitted 
 * search parameters. Search results are stored in a temp table created 
 * for a particular user, and are then returned one page at a time. 
 * AASequenceSearcher only inserts and selects from temp table; creating, 
 * deleting and dropping table is done by <code>SearchSession</code>.  
 * AASequenceSearcher retrieves the relevant table name to use by querying 
 * <code>QueryIDFactory</code>.
 *
 * <p>
 * AASequenceSearcher receives search parameters as retrieved from web 
 * submission by <code>AASequenceSearchHandler</code>. 
 *
 * <p>
 * AASequenceSearcher implements GeneralSearcher interface so that it can be 
 * used by GeneralSearchHandler to carry out protein searches as part of the
 * general search.
 */

public class AASequenceSearcher implements GeneralSearcher {
    private String searchType = "protein";

    // keep track of tables when creating search query
    private ArrayList tables; 


    /**
     * Retrieves URL to use for displaying search results
     *
     * @return URL of JSP to display clone end search results
     */
    public String getSummaryPage() { 
	return "/jsp/search/aa_sequence_summary.jsp";
    }
    
    /**
     * Get literal value for referring to temp table
     */
    private String getSearchType() {
	return "protein";
    }


    /**
     * Executes search using submitted search parameters and returns slice 
     * of result set according to parameters defined in scrollParams. When
     * initially searching, results are stored in a person specific temp 
     * table. Subsequent calls will then retrieve from temp table to show 
     * current page of result set
     * 
     * @param conn An active connection to the database
     * @param searchParams Search params to use for retrieving result set
     * @param scrollParams ScrollParams object containing data defining floor 
     * and ceiling of result set
     * @param firstSearch If <code>true</code> this is the first time this 
     * search has been executed, so full search should be executed w/results 
     * being stored in a temp table for later retrieval. If <code>false</code>,
     * temp table has already been populated, so can simply retrieve requested
     * slice of result set
     * @return Search results as an <code>SearchResultsCollection</code> 
     * containing an array of AASequenceSummary objects and data on the complete
     * result set
     * @throws SQLException thrown if a database error occurs
     */
    public SearchResultsCollection search( DBconnection conn, 
					   Map searchParams, 
					   ScrollParams scrollParams, 
					   boolean firstSearch ) 
	throws SQLException {

	// do first search to populate temp table with full result set 
        String queryID = (String) searchParams.get("query_id");
        if ( firstSearch ) { 
            String query = createQuery( searchParams, queryID );
            conn.setQuery( getInsert() + query );
            conn.executeUpdate();
            conn.releaseResources();
        }
    
        // get requested subset, links for scrolling through multiple results 
	// pages, and plain text version of search parameters
        String order = (String) searchParams.get( "order" );
        SearchResultsCollection searchResults = 
	    getResultSlice( conn, scrollParams, order, queryID ); 

	if ( !searchResults.isEmpty() ) {
	    String links = 
		ScrollCalculator.getTableScrollLinks( scrollParams.getSize(), 
						      scrollParams.getPage(), 
						      searchResults,
                              queryID );
	    searchResults.setScrollLinks( links );
	}
	
	String criteria = 
	    getFormatSearchCriteria( searchParams, 
				     searchResults.getResultSize() );
	
	searchResults.setSearchCriteria( criteria  );
	
        return searchResults;
    }


    /**
     * Executes a protein search as part of the general search.  Search can be 
     * done to just return number of matching AA sequence records, or to give 
     * the first page of AA sequence search results according to the submitted
     * value of doCounts.  This method should only be called by '
     * GeneralSearchHandler as part of the general search.  If requesting
     * actual search results, searching will insert results into user's temp 
     * table, and redirect user to normal amino acid summary page to display 
     * results. Subsequent requests for additional pages of results will be 
     * handled by search() method. Results are always returned as a 
     * SearchResultsCollection; if full search info is requested, collection
     * will contain an array of AASequenceSummary objects & other search
     * info exactly as if search() were called; if counts are requested, only
     * the result size parameter of the collection will be populated
     *
     * @param searchParams Map containing search parameters
     * @param doCounts If <code>true</code>, only counts of matching AA 
     * sequences will be returned, if <code>false</code> first page of matching 
     * amino acids will be returned
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
        String queryID = (String) searchParams.get("query_id");

        try {
            searchTerm = TextConverter.convertEnds( searchTerm.toUpperCase(), 
						    method );
	    
            connectionPool = DBWriteManager.getInstance();
            conn = connectionPool.get_connection();

            // if getting counts, just need number of distinct aa sequence ids
            if ( doCounts ) {
                searchResults = doGeneralCounts( conn, searchTerm );

		// else need to insert result set into temp table & get first page
            } else {
		        if (firstSearch){
                    doFullGeneralSearch( conn, searchTerm, queryID );
                }
                ScrollParams scrollParams = null;
                // get first page of results from temp table, sort by amino acid name
                scrollParams = ScrollCalculator.getDefaultScrollParams();
                searchResults = getResultSlice( conn, scrollParams, "name", queryID );

                // get links for scrolling through results
                if ( !searchResults.isEmpty() ) {
	                String links = 
		                ScrollCalculator.getTableScrollLinks( scrollParams.getSize(), 
					    scrollParams.getPage(), 
					    searchResults,
                        queryID);
                    searchResults.setScrollLinks( links );
                }

                // get plain text version of search parameters
                if ( searchResults != null ) {
		    String criteria = 
			getFormatSearchCriteria( searchParams, 
						 searchResults.getResultSize() );
		    
                    searchResults.setSearchCriteria( criteria );
                }
            }
	    
        } finally {
            if ( conn != null ) {
                conn.releaseResources();
                connectionPool.return_connection( conn );
            }
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
        if (type.equalsIgnoreCase( "form") ){
            insert_query = createQuery(searchParams, "");
        }else if (type.equalsIgnoreCase("general") ){
            String searchTerm = (String) searchParams.get("searchTerm");
            insert_query = "PROTEIN_QUICKSEARCH_" + searchTerm;
        }else{
            insert_query = createQuery(searchParams, "");
        }
        return insert_query;                                                                
    }
    
    /**
     * Retrieve distinct number of amino acid ids where gene name, locus name,
     * or interpro/domain/aa sequence accession equals search term
     */
    private SearchResultsCollection doGeneralCounts( DBconnection conn, 
						     String searchTerm ) 
        throws SQLException {

        SearchResultsCollection searchResults = null;

        ArrayList resultsList = new ArrayList(); 

	Long aa_seq_id = null;
	
        String query =
            "SELECT a.aa_sequence_id " +
            getBaseFrom() + ", ProteinAccession_wrk pw " +
            getBaseWhere() +
	    "AND a.aa_sequence_id = pw.aa_sequence_id " +
            "AND pw.accession LIKE " + 
	    TextConverter.dbQuote( searchTerm ) + " ESCAPE '\\\' ";    
        conn.setQuery( query );
	
        ResultSet results = conn.getResultSet();
        while ( results.next() ) {
	    aa_seq_id = new Long( results.getLong( "aa_sequence_id" ) );
	    resultsList.add( aa_seq_id );
	}
        conn.releaseResources();

        query =
            "SELECT a.aa_sequence_id " +
            getBaseFrom() + 
            getBaseWhere() +
            " AND EXISTS ( " +
            "SELECT 'X' " +
            "FROM Gene_AASequence ga, GeneNameAlias gna " +
            "WHERE a.aa_sequence_id = ga.aa_sequence_id " +
	    "AND ga.gene_id = gna.gene_id " +
            "AND gna.name LIKE " + 
	    TextConverter.dbQuote( searchTerm ) + " ESCAPE '\\\')";

        conn.setQuery( query );
        results = conn.getResultSet();
        while ( results.next() ) {
            aa_seq_id = new Long( results.getLong( "aa_sequence_id" ) );         
            if ( !resultsList.contains( aa_seq_id ) ) {
		resultsList.add( aa_seq_id );
	    }
        }
        conn.releaseResources();

        query =
            "SELECT a.aa_sequence_id " +
            getBaseFrom() + 
            getBaseWhere() +
            " AND EXISTS (" +
            "SELECT 'X' " +
            "FROM Gene_AASequence ga, " +
	    "Gene g, " +
	    "MapElement_Locus ml, " +
	    "LocusNameAlias lna " +
            "WHERE a.aa_sequence_id = ga.aa_sequence_id " +
	    "AND ga.gene_id = g.gene_id " +
            "AND g.is_obsolete = 'F' " +
            "AND g.map_element_id = ml.map_element_id " +
            "AND ml.locus_id = lna.locus_id " +
            "AND lna.name LIKE " + 
	    TextConverter.dbQuote( searchTerm ) + " ESCAPE '\\\') ";

        conn.setQuery( query );
        results = conn.getResultSet();
        while ( results.next() ) {
            aa_seq_id = new Long( results.getLong( "aa_sequence_id" ) );         
            if ( !resultsList.contains( aa_seq_id ) ) {
		resultsList.add( aa_seq_id );
	    }
        } 
        conn.releaseResources();
	
        searchResults = new SearchResultsCollection();
        searchResults.setResultSize( resultsList.size() );
        return searchResults;
    }

    /**
     * Retrieve all amino acids whose gene name, locus name,
     * or interpro/domain/aa sequence accession equals search term
     * insert results into temp table, retrieve  first page of results, 
     * and get descriptive version of search criteria for display on summary
     * page
     */
    private void doFullGeneralSearch( DBconnection conn, String searchTerm, 
    String queryID ) throws SQLException {

        SearchResultsCollection searchResults = null;
        String query = 
            getBaseSelect( "NULL", "NULL", queryID ) +
            getBaseFrom() + 
            getBaseWhere() +
	        " AND a.uniprot_id LIKE " + 
        TextConverter.dbQuote( searchTerm ) + " ESCAPE '\\\'";    
        conn.setQuery( getInsert() + query );
        conn.executeUpdate(); // execute search & insert results into temp table
        conn.releaseResources();


        query =
            getBaseSelect( "NULL", "NULL", queryID ) +
            getBaseFrom() + ", ProteinAccession_wrk pw " +
            getBaseWhere() +
	    "AND a.aa_sequence_id = pw.aa_sequence_id " +
            "AND pw.accession LIKE " + 
	    TextConverter.dbQuote( searchTerm ) + " ESCAPE '\\\'";    

        conn.setQuery( getInsert() + query );
        conn.executeUpdate(); // execute search & insert results into temp table
        conn.releaseResources();

        query =
            getBaseSelect( "NULL", "NULL", queryID ) +
            getBaseFrom() + 
            getBaseWhere() +
            " AND EXISTS ( " +
            "SELECT 'X' " +
            "FROM Gene_AASequence ga, GeneNameAlias gna " +
            "WHERE a.aa_sequence_id = ga.aa_sequence_id " +
	    "AND ga.gene_id = gna.gene_id " +
            "AND gna.name LIKE " + 
	    TextConverter.dbQuote( searchTerm ) + " ESCAPE '\\\')"; 

        conn.setQuery( getInsert() + query );
        conn.executeUpdate(); // execute search & insert results into temp table
        conn.releaseResources();

        query =
            getBaseSelect( "NULL", "NULL", queryID ) +
            getBaseFrom() + 
            getBaseWhere() +
            " AND EXISTS (" +
            "SELECT 'X' " +
            "FROM Gene_AASequence ga, " +
	    "Gene g, " +
	    "MapElement_Locus ml, " +
	    "LocusNameAlias lna " +
            "WHERE a.aa_sequence_id = ga.aa_sequence_id " +
	    "AND ga.gene_id = g.gene_id " +
            "AND g.is_obsolete = 'F' " +
            "AND g.map_element_id = ml.map_element_id " +
            "AND ml.locus_id = lna.locus_id " +
            "AND lna.name LIKE " + 
	    TextConverter.dbQuote( searchTerm ) + " ESCAPE '\\\') ";

        conn.setQuery( getInsert() + query );
        conn.executeUpdate(); // execute search & insert results into temp table
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
     * @param String order Field to order search results by
     * @return AA Sequence search results as a SearchResultsCollection 
     * containing an array of <code>AASequenceSummary</code> objects and data
     * on the complete result set
     * @throws SQLException thrown if a database error occurs
     */
    public SearchResultsCollection getResultSlice( DBconnection conn, 
                                                   ScrollParams scrollParams, 
                                                   String order,
                                                   String queryID) 
	throws SQLException {

        SearchResultsCollection searchCollection = 
	    new SearchResultsCollection();

        int floor = scrollParams.getFloor();
        int ceiling = scrollParams.getCeiling();
        int rowCounter = 0;
    
	StringBuffer query = new StringBuffer();
	query.append( "SELECT " + getTableColumns( "result") +
                      "FROM RESULT_PROTEIN WHERE QUERY_ID = '" + queryID + "' ");
	
        if ( order != null ) {
            if ( order.equals( "name" ) ) {
                query.append( "ORDER BY name" );

            } else if ( order.equals( "position" ) ) {
                query.append( "ORDER BY position" );
            } else if ( order.equals( "locus" ) ) {
                query.append( "GROUP BY aa_sequence_id, " + getTableColumns( "result" ) + " " + 
			      "ORDER BY MIN( locus_name ), aa_sequence_id " );
            }
      
        } else { // default to aa sequence name
            query.append( "ORDER BY name " );
        }
    
        long lastID = 0;
        ArrayList found = null;
        AASequenceSummary sequence = null;

        conn.setQuery( query.toString() );
	ResultSet results = conn.getResultSet();
        while ( results.next() ) {
            if ( lastID != results.getLong( "aa_sequence_id" ) ) {
                if ( rowCounter >= floor && rowCounter <= ceiling ) {
                    sequence = saveRow( results );
		    
                    if ( found == null ) {
                        found = new ArrayList();
                    }
		    
                    found.add( sequence );
                }
                rowCounter++;
            }
            lastID = results.getLong( "aa_sequence_id" );
        }
        conn.releaseResources();
	
        if ( found != null && !found.isEmpty() ) {
	    // create array with data for summary page
            AASequenceSummary[] sequences = makeArray( conn, found, false ); 
            searchCollection.setResults( sequences );
            searchCollection.setResultSize( rowCounter );
            searchCollection.setFloor( floor + 1 );
            searchCollection.setCeiling( floor + sequences.length );
        }

        // set JSP URL for displaying results
        searchCollection.setResultsPage( getSummaryPage() );

        return searchCollection;
    }


    /**
     * Retrieve aa sequences using selected aa sequence ids from search results.
     * Used for creating downloads for items in search results.
     *
     * @param conn  An active connection to the database
     * @param aaSequenceIDs Selected aa sequence ids to retrieve data for
     * @param sessionID User's session id. Used to access temp table for 
     * user's individual results.
     */
    public AASequenceSummary[] getSelected( DBconnection conn, 
                                            List aaSequenceIDs, 
                                            String queryID )
	throws SQLException {


        AASequenceSummary sequence = null;

        ArrayList found = null;

        String query = 
            "SELECT " + getTableColumns( "result") + 
            "FROM RESULT_PROTEIN WHERE QUERY_ID = '" + queryID + "' " + 
	        "AND aa_sequence_id = ?";

        conn.setQuery( query );

        ResultSet results = null;
	
        Iterator iter = aaSequenceIDs.iterator();
        while ( iter.hasNext() ) {
            conn.setQueryVariable( (Long) iter.next() );
            results = conn.getResultSet();
            if ( results.next() ) {
                sequence = saveRow( results );
                if ( found == null ) {
                    found = new ArrayList();
                }
        
                found.add( sequence );
            }
            results.close();
        }
        conn.releaseResources();


	AASequenceSummary[] sequences = null;
        if ( found != null && !found.isEmpty() ) {
	    // create array with all data for download
	    sequences = makeArray( conn, found, true );
        }
        return sequences;
    }
  

    /**
     * Retrieve temp table columns for use in any one of larger queries
     */
    private String getTableColumns (String type) {
        String columns = 
            "tair_object_id, " +
            "aa_sequence_id, " +
            "name, " +
            "position, " +
            "locus_name, " +
            "calc_MW, " +
            "calc_pI, " +
            "length, " +
            "date_last_modified, " + 
            "query_id ";
        // need to check what kind of select it is. if it is result type (called in
        // getResultSlice, then we want to not return date_last_queried
        if (type.equalsIgnoreCase("all")){
            columns = columns + ", date_last_queried ";
        }
        return columns;
    }


    /**
     * Get base select for full search - position & locusName will be 
     * literal string "NULL" unless sorting result set by map location 
     * or locus name
     */
    private String getBaseSelect( String position, String locusName, String queryID ) {
        String select =
            "SELECT distinct a.tair_object_id, " +
            "a.aa_sequence_id, " +
            "a.name, " +
            position + ", " +
            locusName + ", " +
            "a.calc_MW, " +
            "a.calc_pI, " +
            "a.length, " +
            "a.date_last_modified ";
        if (queryID != null && queryID != ""){
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
        return "FROM AASequence a ";
    }

    /**
     * Get base where clause for full search
     */
    private String getBaseWhere() {
        return "WHERE a.is_obsolete = 'F' ";
    }

    /**
     * Get statement to insert into temp table
     */
    private String getInsert() {
        String insert = "INSERT INTO RESULT_PROTEIN ( " 
            + getTableColumns( "all" ) + " ) ";
        return insert;
    }
    
    private String getDelete(String query_id){
        String del = 
            "DELETE FROM RESULT_PROTEIN WHERE QUERY_ID = '" + query_id + "' ";
        return del;
    }

    /**
     * Save single row of result set as AASequenceSummary object
     */
    private AASequenceSummary saveRow( ResultSet results ) 
	throws SQLException {

        AASequenceSummary sequence = new AASequenceSummary();
	Long tairObjID = new Long( results.getLong( "tair_object_id" ) );
        sequence.setTairObjectID( tairObjID );

	Long aaSeqID = new Long( results.getLong( "aa_sequence_id" ) );
        sequence.setAASequenceID( aaSeqID );

        sequence.setName( results.getString( "name" ) );
        sequence.setDateLastModified( results.getDate( "date_last_modified" ) );

        int i = results.getInt( "length" );
        if ( !results.wasNull() ) {
            sequence.setLength( new Integer( i ) );
        }

        float f = results.getFloat( "calc_MW" );
        if ( !results.wasNull() ) {
            sequence.setCalcMW( new Float( f ) );
        }

        f = results.getFloat( "calc_pI" );
        if ( !results.wasNull() ) {
            sequence.setCalcPI( new Float( f ) );
        }

	
        return sequence;
    }


    /**
     * Translate list of search results into array of AASequenceSummary objects.
     * Helpful to isolate this action here since it's used 2x. Extra data 
     * included in download, but not shown on summary page will be populated
     * according to the submitted download flag
     */
    private AASequenceSummary[] makeArray( DBconnection conn, 
					   ArrayList found, 
					   boolean download ) 
	throws SQLException {

        AASequenceSummary[] sequences = new AASequenceSummary[ found.size() ];
        sequences = (AASequenceSummary[]) found.toArray( sequences );
        for ( int i = 0; i < sequences.length; i++ ) {
	    // get associated data not in temp table
            sequences[ i ].populate( conn ); 
            
            if ( download ) {
                sequences[ i ].populateAttributions( conn );
            }

        }
        return sequences;
    }

    /**
     * Convenience method to add join to gene table if needed
     */
    private void addGene( StringBuffer from, 
			  StringBuffer joins, 
			  StringBuffer where ) 
    {

        if ( !tables.contains( "Gene" ) ) {
            addGeneAASequence( from, joins, where );
            from.append( ", Gene g " );
            joins.append( "AND ga.gene_id = g.gene_id " );
            where.append( "AND g.is_obsolete = 'F' " );
            tables.add( "Gene" );
        }
    }

    /**
     * Convenience method to add join to Gene_AASequence linking table
     * if needed
     */
    private void addGeneAASequence( StringBuffer from, 
				    StringBuffer joins, 
				    StringBuffer where ) 
    {
        if ( !tables.contains( "Gene_AASequence" ) ) {
            from.append( ", Gene_AASequence ga " );
            joins.append( "AND a.aa_sequence_id = ga.aa_sequence_id " );
            tables.add( "Gene_AASequence" );
        }
    }
    



    /**
     * Convenience method to add join to GlobalAssignment table if needed - 
     * assignment searching is done through gene, since AASequence itself
     * is not a map element
     */
    private void addAssignment( StringBuffer from, 
				StringBuffer joins,
				StringBuffer where ) 
    {
        if ( !tables.contains( "GlobalAssignment" ) ) {
            addGene( from, joins, where );
            from.append( ", GlobalAssignment an " );
            joins.append( "AND g.map_element_id = an.map_element_id " );
            where.append( "AND an.is_obsolete = 'F' " );
            tables.add( "GlobalAssignment" );
        }
    }

    /**
     * Convenience method to add join to Locus table -- this is done if 
     * results must be sorted by locus name or if searching by locus name
     */
    private void addLocus( StringBuffer from, 
			   StringBuffer joins, 
			   StringBuffer where ) 
    {
        // get to locus through gene
        addGene( from, joins, where );

        if ( !tables.contains( "Locus" ) ) {
            from.append( ", MapElement_Locus ml, Locus l " );
            joins.append( "AND g.map_element_id = ml.map_element_id " +
                          "AND ml.locus_id = l.locus_id " );
            where.append( "AND l.is_obsolete = 'F' " );
            tables.add( "Locus" );
        }
    }
  

    /**
     * Create SQL to retrieve records according to searchParams
     */
    private String createQuery( Map searchParams, String queryID ) {

        // get submitted search params
        String name = (String) searchParams.get( "name");
        String name_method = (String) searchParams.get( "name_method");
        String name_type = (String) searchParams.get( "name_type");

        TfcStructuralClassType[] structural_class_type = 
            (TfcStructuralClassType[]) searchParams.get( "structural_class_type" );
    
        Boolean search_length = (Boolean) searchParams.get( "search_length" );
        Integer length_from = (Integer) searchParams.get( "length_from" );
        Integer length_to = (Integer) searchParams.get( "length_to" );
    
        Boolean search_MW = (Boolean) searchParams.get( "search_MW" );
        Float calc_MW_from = (Float) searchParams.get( "calc_MW_from" );
        Float calc_MW_to = (Float) searchParams.get( "calc_MW_to" );
    
        Boolean search_pI = (Boolean) searchParams.get( "search_pI" );
        Float calc_pI_from = (Float) searchParams.get( "calc_pI_from" );
        Float calc_pI_to = (Float) searchParams.get( "calc_pI_to" );

        String domain_name_1 = (String) searchParams.get( "domain_name_1");
        String domain_type_1 = (String) searchParams.get( "domain_type_1");

        String domain_element_1 = 
	    (String) searchParams.get( "domain_element_1");

        String domain_method_1 = (String) searchParams.get( "domain_method_1");

        String domain_match_method_1 = 
	    (String) searchParams.get( "domain_match_method_1" );

        Integer domain_match_1 = (Integer) searchParams.get( "domain_match_1" );
    
        String domain_name_2 = (String) searchParams.get( "domain_name_2");
        String domain_type_2 = (String) searchParams.get( "domain_type_2");
        String domain_element_2 = 
	    (String) searchParams.get( "domain_element_2");

        String domain_method_2 = (String) searchParams.get( "domain_method_2");

        String domain_match_method_2 = 
	    (String) searchParams.get( "domain_match_method_2" );

        Integer domain_match_2 = (Integer) searchParams.get( "domain_match_2" );
    
        String domain_name_3 = (String) searchParams.get( "domain_name_3");
        String domain_type_3 = (String) searchParams.get( "domain_type_3");

        String domain_element_3 = 
	    (String) searchParams.get( "domain_element_3");

        String domain_method_3 = (String) searchParams.get( "domain_method_3");

        String domain_match_method_3 = 
	    (String) searchParams.get( "domain_match_method_3" );

        Integer domain_match_3 = (Integer) searchParams.get( "domain_match_3" );

        java.util.Date restrict_date_from = 
	    (java.util.Date) searchParams.get( "restrict_date_from" );

        java.util.Date restrict_date_to = 
	    (java.util.Date) searchParams.get( "restrict_date_to" );
    
        String order = (String) searchParams.get( "order" );

        String chromosome = (String) searchParams.get( "chromosome" );
        String map_type = (String) searchParams.get( "map_type" );
        Units units = (Units) searchParams.get( "units" );
    
        StringBuffer from = new StringBuffer();
        StringBuffer joins = new StringBuffer();
        StringBuffer where = new StringBuffer();

        // include position in select statement if needed for sorting by 
        // position when getting results from temp table
        String position = (order != null && order.equals( "position" )) ? 
	    "an.start_position" : "NULL";
    
        // include locus name in select statement if needed for sorting
        String locusName = (order != null && order.equals( "locus" )) ? 
	    "l.name" : "NULL";

        tables = new ArrayList();// keep track of tables added to query

        // track whether search criteria besides protein domain criteria
        // has been submitted - needed to determine best method of searching
        // domain info
        boolean otherCriteria = false; 

        from.append( getBaseSelect( position, locusName, queryID ) + 
                     getBaseFrom() );

        joins.append( getBaseWhere() );


        // join to assignment if criteria requires it
        if ( order != null && order.equals( "position" ) ) {
            addAssignment( from, joins, where );
      
            // join to locus if criteria requires it
        } else if ( order != null && order.equals( "locus" ) ) {
            addLocus( from, joins, where );
        }
    
        if ( name != null ) {
            appendNameCriteria( from, 
				joins, 
				where, 
				name, 
				name_method,
				name_type );
        }
    

        if ( structural_class_type != null && 
	     structural_class_type.length > 0 ) {

	    where.append( "AND EXISTS ( " +
			      "SELECT 'X' " +
			      "FROM ProteinDomain_wrk pdw " +
			      "WHERE pdw.aa_sequence_id = a.aa_sequence_id " +
			      "AND pdw.structural_class_type_id IN (" 
			  );

	    String id = null;
            for ( int i = 0; i < structural_class_type.length; i ++ ) {
                if ( i > 0 ) {
                    where.append( ", " );
                }
		id = structural_class_type[ i ].get_structural_class_type_id();
                where.append( TextConverter.dbQuote( id ) );
            }
            where.append( ") ) " );
        }

        if ( search_length != null && search_length.booleanValue() ) {
            if ( length_from != null ) {
                where.append( "AND a.length >= " + 
			      length_from.toString() + " " );
            }
      
            if ( length_to != null ) {
                where.append( "AND a.length <= " + 
			      length_to.toString() + " " );
            }
        }

        // calc MW form values are in kilo-Daltons, but db value is Daltons 
        // multiply by 1000 to equalize scale
        if ( search_MW != null && search_MW.booleanValue() ) {
            if ( calc_MW_from != null ) {
                float mwFrom = calc_MW_from.floatValue() * 1000;
                where.append( "AND a.calc_MW >= " + mwFrom + " " );
            }
      
            if ( calc_MW_to != null ) {
                float mwTo = calc_MW_to.floatValue() * 1000;
                where.append( "AND a.calc_MW <= " + mwTo + " " );
            }
        }
    
        if ( search_pI != null && search_pI.booleanValue() ) {
            if ( calc_pI_from != null ) {
                where.append( "AND a.calc_pI >= " + 
			      calc_pI_from.toString() + " " );
            }
      
            if ( calc_pI_to != null ) {
                where.append( "AND a.calc_pI <= " + 
			      calc_pI_to.toString() + " " );
            }
        }

    
        if ( restrict_date_from != null ) {
            where.append( "AND a.date_last_modified >= " + 
                          TextConverter.dbQuote( restrict_date_from, "mm/dd/yyyy" ) + " " );
        }
    
        if ( restrict_date_to != null ) {
            where.append( "AND a.date_last_modified <= " + 
                          TextConverter.dbQuote( restrict_date_to, "mm/dd/yyyy" ) + 
			  " " );
        }



        // Search by chromosome using associated gene's value, since aa sequence
	// itself is not a map element
        //
        // if entered, use search form chromosome value
        //
        // if no chromosome entered, check to see if one is implied
        // by the search by map location element search
        if ( !TextConverter.isEmpty( chromosome ) && 
	     !chromosome.equals( "any" ) ) {

            addGene( from, joins, where );
            where.append( " AND g.chromosome LIKE " + 
                          TextConverter.dbQuote( "%" + chromosome + "%" ) + 
			  " ESCAPE '\\\' " );
	    
        } else if ( units != null && units.useAssignmentChromosome() ) {
            addGene( from, joins, where );
            where.append( " AND g.chromosome LIKE " + 
                          TextConverter.dbQuote( "%" + 
						 units.getAssignmentChromosome() + 
						 "%" ) + " ESCAPE '\\\' " );
        }
   
        if ( map_type != null ) {
            addAssignment( from, joins, where );
            from.append( ", Map m " );
            joins.append( "AND an.map_id = m.map_id " );
            where.append( "AND m.name = " + 
			  TextConverter.dbQuote( map_type ) + " " );
        }

        // restrict by map location by adding join to assignment where map 
	// element associated to germplasm matches map location criteria
        if ( units != null && map_type != null ) {
            addAssignment( from, joins, where );

            Double start = units.get_start();
            Double end = units.get_end();
            String low_unit = units.get_low_unit();
            String high_unit = units.get_high_unit();
      
            // should already be joined to assignment from above
            if ( start != null && low_unit != null ) {
                if ( low_unit.equalsIgnoreCase( "cm" ) ) {
                    where.append( "AND ( an.start_position >= " + start + 
                                  " OR an.end_position >= " + start + " ) " +
				  "AND an.units = 'cM' " );
         
         
                } else if ( low_unit.equalsIgnoreCase( "kb" ) ) {
                    where.append( "AND ( " +
                                  "( (an.start_position >= " + start + 
                                  " OR an.end_position >= " + start +") " +
                                  " AND an.units = " + 
				  TextConverter.dbQuote( low_unit ) + " ) " + 
                                  " OR ( (an.start_position >=" + 
				  start.doubleValue() * 1000 +
                                  " OR an.end_position >=" + 
				  start.doubleValue() * 1000+ " ) " +
                                  " AND ( an.units ='bp' OR an.units IS NULL ) ) ) " 
                                  );
                }       
            }
     
            if ( end != null && high_unit != null ) {
                if ( high_unit.equalsIgnoreCase( "cm" ) ) {
                    where.append( "( an.end_position <= " + end +
                                  " OR an.start_position <= " + end +
                                  " ) AND an.units = 'cM' " );    
                } else if ( high_unit.equalsIgnoreCase( "kb" ) ) {
                    where.append( "AND ( ( ( an.end_position <= " + end +
                                  " OR an.start_position <= " + end +
                                  " ) AND an.units = " + 
				  TextConverter.dbQuote( high_unit ) + " ) OR "+
                                  " ( ( an.end_position <=" + 
				  end.doubleValue() * 1000 +
                                  " OR an.start_position <=" + 
				  end.doubleValue() * 1000 +
                                  " ) AND " +
				  "( an.units = 'bp' or " +
				  "an.units IS NULL ) ) ) " );
                }
            }
        }
    
        //
        // Add protein domain criteria as one sub-select for each group/row
	// of search data entered
        //
        // ProteinDomain info is searched using denormallized work table 
	// ProteinDomain_wrk thad cuts out table joins to help with searching.  
        //
        // Isolate all domain logic in appendDomainCriteria - encapsulation 
	// makes it worth the ridiculous argument list...
        //
        if ( domain_name_1 != null || domain_match_1 != null ) {
            appendDomainCriteria( where, 
				  domain_name_1,
				  domain_type_1, 
				  domain_element_1, 
				  domain_method_1,
				  domain_match_1,
				  domain_match_method_1 );
        }
    
        if ( domain_name_2 != null || domain_match_2 != null ) {
            appendDomainCriteria( where, 
				  domain_name_2,
				  domain_type_2, 
				  domain_element_2, 
				  domain_method_2,
				  domain_match_2,
				  domain_match_method_2 );
	    
        }
    
        if ( domain_name_3 != null || domain_match_3 != null ) {
            appendDomainCriteria( where, 
				  domain_name_3,
				  domain_type_3, 
				  domain_element_3, 
				  domain_method_3,
				  domain_match_3,
				  domain_match_method_3 );
        }


        // combine buffers to create single query
        StringBuffer query = new StringBuffer();
        query.append( from.toString() + 
                      joins.toString() +
                      where.toString()
                      );

        Debugger.println( query.toString() );    
    
        return query.toString();
    }

  
    /**
     * Add appropriate name search criteria according to type of name 
     * being searched
     */
    private void appendNameCriteria( StringBuffer from, 
                                     StringBuffer joins, 
                                     StringBuffer where, 
                                     String name, 
                                     String method, 
                                     String name_type ) 
    {

        if ( name_type != null ) {
      
            // quote and wildcard search term according to requested 
	    // search method - use special char class encoding if searching 
	    // text field (gene description)
            boolean searchTextField = 
		( name_type.equals( "gene_description" ) );
	    
	    name = TextConverter.convertEnds( name.toUpperCase(), 
					       method, 
					       searchTextField );
	    name = TextConverter.dbQuote( name );
	    
            if ( name_type.equals( "gene_symbol" ) ) { 
                addGeneAASequence( from, joins, where );
                where.append( "AND ga.gene_id IN (" +
                              "SELECT gene_id " +
                              "FROM GeneNameAlias " +
                              "WHERE name_type = 'symbol' " +
                              "AND name LIKE " + name +
                              " ESCAPE '\\\') " 
                              );
        
            } else if ( name_type.equals( "locus" ) ) { 
                addLocus( from, joins, where );
                where.append( "AND l.locus_id IN (" +
                              "SELECT locus_id " +
                              "FROM LocusNameAlias " +
                              "WHERE name LIKE " + name + 
                              " ESCAPE '\\\') "
                              );
        
                // equals gene name where type = 'gene_product'
            } else if ( name_type.equals( "gene_product" ) ) {
                addGeneAASequence( from, joins, where );
                where.append( "AND ga.gene_id IN (" +
                              "SELECT gene_id " +
                              "FROM GeneNameAlias " +
                              "WHERE name_type = 'gene_product' " +
                              "AND name LIKE " + name +
                              " ESCAPE '\\\') "
                              );
        

            } else if ( name_type.equals( "gene_description" ) ) {
                addGene( from, joins, where );
                where.append( "AND g.description LIKE " + name + " ESCAPE '\\\' " );

            } else if ( name_type.equals( "genpept" ) ) { 
                where.append( "AND a.genbank_protein_id LIKE " + name + " ESCAPE '\\\' " );

                //
                //  No data for EC number, PIR ID, or SwissProt ID now 
                // options commented out on search form so name_type should
                // never equal these values, but keep these code branches
                // for future use when data is populated.
                //
            } else if ( name_type.equals( "EC_number" ) ) { 
                where.append( "AND a.ec_number LIKE " + name + " ESCAPE '\\\' " );
		
            } else if ( name_type.equals( "pir" ) ) { 
                where.append( "AND a.PIR_accession LIKE " + name + " ESCAPE '\\\' " );
        
            } else if ( name_type.equals( "swissprot" ) ) { 
                where.append( "AND a.swissprot_id LIKE " + name + " ESCAPE '\\\' " );
            }
        }
    }

  
    /**
     * Add protein domain criteria as sub-select of main query
     *
     * @param where WHERE clause of search query (excluding joins)
     * @param name Domain search name entered
     * @param type Protein domain type selected
     * @param element Domain element to search (name, accession)
     * @param method Search method for name (starts with, contains etc.)
     * @param domainMatch Number of domain matches to search for
     * @param domainMethod Domain search method (less than, equals, etc.)
     */
    private void appendDomainCriteria( StringBuffer where, 
                                      String name,
                                      String type,
                                      String element,
                                      String method,
                                      Integer domainMatch,
                                      String domainMethod )
    {
	
	where.append( "AND ( SELECT COUNT(*) " +
		      "FROM ProteinDomain_wrk pd " +
		      "WHERE pd.aa_sequence_id = a.aa_sequence_id " );
	
	
	// add name criteria
	if ( name != null && element != null ) {
	    appendDomainName( where, 
			      name, 
			      method,
			      type, 
			      element );
	}
	
	// add domain type criteria
	appendDomainType( where, type );
	
	// close sub-select parens 
	where.append( ") " );

	// append criteria to find specific number of matches -- if specific
	// number of matches is not specified, "> 0" will be used 
	appendDomainMatch( where, domainMethod, domainMatch );
    }
  

    /**
     * Adds protein domain/interpro name criteria to protein domain sub-select
     * within main query. Name or accession field will be searched according 
     * to value of element argument.
     *
     * <p>
     * Interpro is not an actual ProteinDomain type - retrieve interpro
     * matches using data originally retrieved from Interpro table and
     * incorporated to domain work table
     *
     * @param query Query to add domain name criteria to
     * @param name Domain name to search for, as entered in search form
     * @param method Search method to use (starts with, contains etc.)
     * @param type  Domain type to search for (pfam, interpro etc.)
     * @param element Name field to search; this should always be "name" or 
     * "accession".
     */
    private void appendDomainName( StringBuffer query, 
				   String name, 
				   String method,
				   String type, 
				   String element ) 
    {
	query.append( "AND " );

	if ( type.equals( "interpro" ) ) {
	    
	    if ( element.equals( "name" ) ) {
		query.append( "pd.interpro_name " );
	    } else if ( element.equals( "accession" ) ) {
		query.append( "pd.interpro_accession " );
	    }
	    
	} else {
	    if ( element.equals( "name" ) ) {
		query.append( "pd.domain_name " );
	    } else if ( element.equals( "accession" ) ) {
		query.append( "pd.domain_accession " );
	    }
	}
	
	// uppercase search term and add wildcards before adding to query
	name = TextConverter.convertEnds( name.toUpperCase(), method );
	query.append( "LIKE " +  TextConverter.dbQuote( name ) + " ESCAPE '\\\' "    );
    }
    

    /**
     * Append protein domain type criteria to protein domain sub-select within
     * main query. If "interpro" is selected, define as having interpro 
     * id != null, since interpro is not an actual domain type as stored in db
     *
     * @param query Query to add domain type criteria to
     * @param type  Domain type to search for (pfam, interpro etc.)
     */
    private void appendDomainType( StringBuffer query, String type ) {

	query.append( "AND " );

	// Since interpro is not a domain type, use non-NULL value
	// of interpro_id to define interpro matches
        if ( type.equals( "interpro" ) ) {
            query.append( "pd.interpro_id IS NOT NULL " );

	    // if type not interpro, use submitted type as domain type
        } else {
            query.append( "pd.proteindomain_wrk_type = " + TextConverter.dbQuote( type ) + " " );
            
        }
    }

    
    /**
     * Add criteria to find a specific number of domain matches to protein
     * domain sub-select of main search query. If a specific number of matches
     * is not requested (i.e. user did not enter any match numbers, but entered
     * type or name data), "> 0" will be used to find sequences with at least
     * one domain match with submitted name and type criteria.
     *
     * @param query Query to add domain match criteria to
     * @param domainMethod Match method to search with (greater than, less than,
     * etc.)
     * @param domainMatch Number of matches to find
     */
    private void appendDomainMatch( StringBuffer query, 
                                    String domainMethod, 
                                    Integer domainMatch ) 
    {

	// append specific number of matches if requested
	if ( domainMatch != null ) {
	    if ( domainMethod.equals( "less than" ) ) {
		query.append( "< " );
		
	    } else if ( domainMethod.equals( "greater than" ) ) {
		query.append( "> " );
		
	    } else if ( domainMethod.equals( "equals" ) ) {
		query.append( "= " );
	    }
	    
	    query.append( domainMatch.toString() + " " );

	    // if no criteria specified, use > 0 so search is done
	    // for aa sequence with any number of matches for submitted 
	    // name/type values
	} else {
	    query.append( "> 0 " );
	}
    }


    /**
     * Utility method to determine whether AND should be added to query when
     * appending criteria - should only skip AND first time
     */
    private boolean appendAnd( StringBuffer query, boolean addAnd ) {
        if ( addAnd ) {
            query.append( "AND " );
        } else { // else don't add it this time, but will need it next time
            addAnd = true;
        }
        return addAnd;
    }


    /**
     * Returns description of search criteria used to create result set. This
     * is a convenience method to simplify life at the JSP search summary page.
     * Include information on total number of matches for complete description
     * of result set. Interpretation of search params is slightly different if
     * doing general search versus a stand-alone gene search; use isGeneral
     * flag in searchParams to determine which type of search was done.
     *
     * @param searchParams Field names and values used to create search results
     * @param resultSize Total number of results
     * @return String describing search criteria used to create result set.
     */
    public String getFormatSearchCriteria( Map _searchParams, int resultSize ) {
        String criteria = null;
        Boolean isGeneral = null;

        Map searchParams = TextConverter.scrub(_searchParams);

        // long hideous method that translates search fields into sort-of 
	// English. bleah....

        if ( searchParams != null ) {
            String name_type = (String) searchParams.get( "name_type" );
            String name = (String) searchParams.get( "name" );
            String name_method = (String) searchParams.get( "name_method" );

            TfcStructuralClassType[] structural_class_type = 
                (TfcStructuralClassType[]) searchParams.get( "structural_class_type" );
            
            String domain_name_1 = (String) searchParams.get( "domain_name_1");
            String domain_type_1 = (String) searchParams.get( "domain_type_1");
	    
            String domain_element_1 = 
		(String) searchParams.get( "domain_element_1");

            String domain_method_1 = 
		(String) searchParams.get( "domain_method_1");

            String domain_match_method_1 = 
		(String) searchParams.get( "domain_match_method_1" );

            Integer domain_match_1 = 
		(Integer) searchParams.get( "domain_match_1" );

            String domain_name_2 = (String) searchParams.get( "domain_name_2");
            String domain_type_2 = (String) searchParams.get( "domain_type_2");

            String domain_element_2 = 
		(String) searchParams.get( "domain_element_2");
	    
            String domain_method_2 = 
		(String) searchParams.get( "domain_method_2");
	    
            String domain_match_method_2 = 
		(String) searchParams.get( "domain_match_method_2" );

            Integer domain_match_2 = 
		(Integer) searchParams.get( "domain_match_2" );

            String domain_name_3 = (String) searchParams.get( "domain_name_3");
            String domain_type_3 = (String) searchParams.get( "domain_type_3");
	    
            String domain_element_3 = 
		(String) searchParams.get( "domain_element_3");
	    
            String domain_method_3 = 
		(String) searchParams.get( "domain_method_3");
	    
            String domain_match_method_3 = 
		(String) searchParams.get( "domain_match_method_3" );
	    
            Integer domain_match_3 = 
		(Integer) searchParams.get( "domain_match_3" );

            java.util.Date restrict_date_from = 
		(java.util.Date) searchParams.get( "restrict_date_from" );
	    
            java.util.Date restrict_date_to = 
		(java.util.Date) searchParams.get( "restrict_date_to" );

            Boolean search_length = 
		(Boolean) searchParams.get( "search_length" );
	    
            Integer length_from = (Integer) searchParams.get( "length_from" );
            Integer length_to = (Integer) searchParams.get( "length_to" );

            Boolean search_MW = (Boolean) searchParams.get( "search_MW" );
            Float calc_MW_from = (Float) searchParams.get( "calc_MW_from" );
            Float calc_MW_to = (Float) searchParams.get( "calc_MW_to" );

            Boolean search_pI = (Boolean) searchParams.get( "search_pI" );
            Float calc_pI_from = (Float) searchParams.get( "calc_pI_from" );
            Float calc_pI_to = (Float) searchParams.get( "calc_pI_to" );

            String high_unit = (String) searchParams.get( "high_unit" );
            String high_range = (String) searchParams.get( "high_range" );
            String low_unit = (String) searchParams.get( "low_unit" );
            String low_range = (String) searchParams.get( "low_range" );
            String range_type =(String) searchParams.get( "range_type" );
            String chromosome = (String) searchParams.get( "chromosome" );
            String map_type = (String) searchParams.get( "map_type" );
            Units units = (Units) searchParams.get( "units"  );

            StringBuffer buffer = new StringBuffer();

            // do general search version of criteria
            isGeneral =(Boolean) searchParams.get( "isGeneral" );
            if ( isGeneral != null && isGeneral.booleanValue() ) {
                String searchTerm = (String) searchParams.get( "searchTerm" );
                String method = (String) searchParams.get( "method" );

                buffer.append( "Your query for proteins where " );
        
                if ( !TextConverter.isEmpty( searchTerm ) ) {
                    buffer.append( "locus name, gene name, " +
				   "GenBank accession, SwissProt accession, " +
				   "protein domain accession, uniprot id or interpro " +
				   "accession ");
                    buffer.append( TextConverter.convertMethods( method ) );
                    buffer.append( " the term <font class=\"emphasis\">" +
				   searchTerm + "</font> " );
                }

            } else { // otherwise show criteria for stand alone protein search
        
                boolean first = true;
                buffer.append( "Your query for proteins where " );

                if ( !TextConverter.isEmpty( name ) ) {
                    first = false;
                    buffer.append( translateTermType( name_type ) + " " + 
                                   TextConverter.convertMethods( name_method ) );
                    buffer.append( " the term <font class=\"emphasis\">" + 
				   name + "</font>" );
                } 
      

                if ( structural_class_type != null && 
		     structural_class_type.length > 0 ) {

                    first = appendComma( buffer, first );
                    buffer.append( "structural class type is " );
                    
		    String type = null;
                    for ( int i = 0; i < structural_class_type.length; i++ ) {
                        if ( i > 0 ) {
                            buffer.append( " or " );
                        }
			
			type = structural_class_type[ i ].get_description();
                        buffer.append( type );
                    }
                    buffer.append( " " );
                }

                // add domain name criteria
                if ( domain_name_1 != null ) {
                    first = appendComma( buffer, first );
                    buffer.append( translateDomainType( domain_type_1 ) + " " + 
                                   domain_element_1 + " " +
                                   TextConverter.convertMethods( domain_method_1 ) + 
				   " " + domain_name_1 );
		    
                }

                if ( domain_name_2 != null ) {
                    first = appendComma( buffer, first );
                    buffer.append( translateDomainType( domain_type_2 ) + " " + 
                                   domain_element_2 + " " +
                                   TextConverter.convertMethods( domain_method_2 ) + 
				   " " + domain_name_2 );

                }

                if ( domain_name_3 != null ) {
                    first = appendComma( buffer, first );
                    buffer.append( translateDomainType( domain_type_3 ) + " " + 
                                   domain_element_3 + " " +
                                   TextConverter.convertMethods( domain_method_3 ) + 
				   " " + domain_name_3 );

                }

                // add domain match criteria
                if ( domain_match_1 != null ) {
                    first = appendComma( buffer, first );
                    appendFormatDomainCriteria( buffer, 
                                                domain_match_1, 
                                                domain_match_method_1, 
                                                domain_type_1 );
                }

                if ( domain_match_2 != null ) {
                    first = appendComma( buffer, first );
                    appendFormatDomainCriteria( buffer, 
                                                domain_match_2, 
                                                domain_match_method_2,
                                                domain_type_2 );
                }

                if ( domain_match_3 != null ) {
                    first = appendComma( buffer, first );
                    appendFormatDomainCriteria( buffer, 
                                                domain_match_3,
                                                domain_match_method_3, 
                                                domain_type_3 );
                }


                if ( restrict_date_from != null ) {
                    first = appendComma( buffer, first );
                    buffer.append( "last modified on or after: " + 
                                   TextConverter.dateToString( restrict_date_from ) );
                }

                if ( restrict_date_to != null ) {
                    first = appendComma( buffer, first );
                    buffer.append( "last modified on or before: " + 
                                   TextConverter.dateToString( restrict_date_to ) );
                }

                if ( search_length != null && search_length.booleanValue() ) {
                    if ( length_from != null ) {
                        first = appendComma( buffer, first );
                        buffer.append( "sequence length is greater than " +
				       "or equal to " + 
                                       length_from.toString() + " residues " );
                    }

                    if ( length_to != null ) {
                        first = appendComma( buffer, first );
                        buffer.append( "sequence length is less than or " +
				       "equal to " + 
                                       length_to.toString() + " residues " );
                    }
                }

		
                if ( search_MW != null && search_MW.booleanValue() ) {

                    if ( calc_MW_from != null ) {
                        first = appendComma( buffer, first );
                        buffer.append( "calculated MW is greater than or " +
				       "equal to " + 
                                       calc_MW_from.toString() + " kDa ");
                    }
        
                    if ( calc_MW_to != null ) {
                        first = appendComma( buffer, first );
                        buffer.append( "calculated MW is less than or " +
				       "equal to " + 
                                       calc_MW_to.toString() + " kDa " );
                    }
                }
		
                if ( search_pI != null && search_pI.booleanValue() ) {
                    if ( calc_pI_from != null ) {
                        first = appendComma( buffer, first );
                        buffer.append( "calculated PI is greater than or " +
				       "equal to " + 
                                       calc_pI_from.toString() );
                    }
        
                    if ( calc_pI_to != null ) {
                        first = appendComma( buffer, first );
                        buffer.append( "calculated PI is less than or " +
				       "equal to " + 
                                       calc_pI_to.toString() );
                    }
                }
      
                // search by map location criteria
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
                if ( low_range != null && 
		     low_unit != null && 
		     ( low_unit.equalsIgnoreCase( "kb" ) || 
		       low_unit.equalsIgnoreCase( "cm" ) ) ) {
		    
                    formatLowRange = low_range + " " + low_unit;

                } else {
                    formatLowRange = low_unit + " " + low_range;
                }

                if ( high_range != null && 
		     high_unit != null && 
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
                            buffer.append( "around: " + 
					   formatLowRange + " within " );
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

            buffer.append( " resulted in <font class=\"emphasis\">" + 
			   resultSize + "</font> " );
            if ( resultSize == 1 ) {
                buffer.append( "match." );
            } else {
                buffer.append( "matches." );
            }
      
            criteria = buffer.toString();
        }
        return criteria;
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
  
    /**
     * Translate form value of search term type to plain text formatted version
     * for display
     */
    private String translateTermType( String type ) {
        String translatedType = null;
    
        if ( type != null ) {
            if ( type.equals( "gene_symbol" ) ) { 
                translatedType = "gene symbol";

            } else if ( type.equals( "locus" ) ) { 
                translatedType = "locus name";

            } else if ( type.equals( "gene_product" ) ) { 
                translatedType = "product name";

            } else if ( type.equals( "gene_description" ) ) {
                translatedType = "gene description";

            } else if ( type.equals( "EC_number" ) ) { 
                translatedType = "EC number";

            } else if ( type.equals( "pir" ) ) { 
                translatedType = "PIR ID";

            } else if ( type.equals( "swissprot" ) ) { 
                translatedType = "SwissPROT ID";

            } else if ( type.equals( "genpept" ) ) { 
                translatedType = "GenPept ID";

            } else if ( type.equals( "gene_family" ) ) { 
                translatedType = "gene family name";
        
            } else { // else form value is fine for display
                translatedType = type;
            }
        }
        return translatedType;
    }

    /**
     * Translate requested domain name type for printing search criteria
     */
    private String translateDomainType( String type ) {
        String translatedType = null;

        if ( type != null ) {
            if ( type.equals( "interpro" ) ) {
                translatedType = "Interpro";
        
            } else if ( type.equals( "pfam" ) ) { 
                translatedType = "Pfam";

            } else if ( type.equals( "prints" ) ) {
                translatedType = "PrintsProsite";

            } else if ( type.equals( "prosite" ) ) { 
                translatedType = "Prosite";

            } else if ( type.equals( "prodom" ) ) { 
                translatedType = "ProDom";

            } else if ( type.equals( "smart" ) ) { 
                translatedType = "SMART";

            } else if ( type.equals( "superfam" ) ) { 
                translatedType = "Superfamily";
            }
        }

        return translatedType;
    }
  
    /**
     * Append formatted version of domain match criteria
     */
    private void appendFormatDomainCriteria( StringBuffer buffer, 
                                             Integer matches, 
                                             String method,
                                             String type ) 
    {

        if ( method.equals( "equals" ) ) {
            buffer.append( "having " + matches.toString() + " " );
        } else {
            buffer.append( "having " + method + " " + 
			   matches.toString() + " " );
        }

        buffer.append( translateDomainType( type ) + " matches " );
    }

}
