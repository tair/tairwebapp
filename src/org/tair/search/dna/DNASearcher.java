//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.55 $
// $Date: 2005/07/11 21:11:22 $
//------------------------------------------------------------------------------

package org.tair.search.dna;

import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.tair.search.Units;
import org.tair.tfc.DBconnection;
import org.tair.utilities.DataConstants;
import org.tair.utilities.Debugger;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;

/**
 * DNASearcher is an abstract parent class for the type specific searcher 
 * classes that handle type specific processing for the DNA search.  DNA 
 * implements several common functions used by all type specific sub-classes 
 * and abstractly defines several methods that sub-classes must implement so 
 * that shared functions will work properly regardless of specific type of
 * search being executed.  
 *
 * <p>
 * DNASearcher provides a search() method that clients can use to get type 
 * specific results. This method is implemented here, with type specific details 
 * being handled through calls to abstract methods defined here in the super 
 * class
 *
 * <p>
 * A key shared function implemented in DNASearcher is the createQuery method.
 * Even though different types have different sets of relevant search 
 * parameters (map location parameters are not valid for Filter searches for 
 * instance), the creation of the search query shares enough common elements
 * that centralizing  the code offers is helpful, even given the hoops we need
 * to jump through to make sure all search types can use the same method to 
 * create the query. While the tables used to create the query is limited to a
 * small set, how a given term is searched for depends on the search type.  To
 * get around this problem, DNASearcher defines methods to be used for adding 
 * search criteria for different search term types (such as clone name) to the
 * query.  Each sub-class can then implement the methods it needs for its own
 * search to search for the requested search term in a way that makes sense in
 * each type specific context.  DNASearcher keeps track internally of what 
 * tables are already in the query.  When a search parameter is encountered that
 * requires a join to a new table, DNASearcher first checks to see if that table
 * is already in the query, then adds it using the type specific method so that
 * the table is joined correctly.
 *
 * <p>
 * To retrieve the search query, DNASearcher calls the abstract createQuery 
 * method, which is implemented by each sub class.  The type specific 
 * implementation of createQuery creates the initial query for the dna search 
 * object, and then adds the common search parameters by calling the 
 * createQuery( Map, String, StringBuffer, StringBuffer ) method defined here 
 * in DNASearcher. DNASearcher makes no decisions about what criteria is 
 * relevant for a given search type - this should be done by validating the 
 * search parameters in a type specific way through a call to the 
 * validateParams( Map, Map ) method (defined abstractly here & implemented 
 * separately by all sub-classes).  This order of execution allows createQuery()
 * to blindly create the search query using the search parameters supplied 
 * without applying type specific rules.
 *
 * <p>
 * DNASearcher also implements the getFormatSearchCriteria() method which 
 * creates a natural language version of the search parameters used to create 
 * the current result set. Like createQuery(), this method makes no decisions 
 * about the validity of parameters, it just blindly creates a string to 
 * describe the  contents of the search parameters collection it receives.
 */


public abstract class DNASearcher {

    // Maintain list(s) of table already joined into query. This makes it easier
    // to quickly check whether a given table is already included in query.
    private ArrayList queryTables = new ArrayList();

    /**
     * Gateway method to creating search query. This method will end up calling
     * createQuery in DNASearcher to handle most of query creation, but need to
     * start here to properly add on type specific select clauses
     *
     * @param searchParams Search parameters to search by
     * @param session_id User's session id.  Used to retrieve data from person
     * specific temp table
     * @return SQL query to retrieve search results given search parameters
     */
    protected abstract String createQuery( Map searchParams, String queryID ) 
        throws InvalidFormException;

    protected abstract String getInsert();
    protected abstract String getDelete( String query_id );

    public abstract String generateInsertLine( DBconnection conn, Map searchParams,
                                      String type)
    throws InvalidFormException, SQLException;

    /**
     * Retrieves requested slice of total result set
     *
     * @param conn An active connection to the database
     * @param scrollParams ScrollParams object containing data defining floor 
     * and ceiling of result set
     * @param session_id User's session id. Used to retrieve data from person
     * specific temp table
     * @param String orderBy Field to order search results by
     * @return DNA type specifc search results as an 
     * <code>SearchResultsCollection</code> containing an array of type specific
     * summary objects and data on the complete result set
     * @throws SQLException thrown if a database error occurs
     */
    protected abstract SearchResultsCollection getResultSlice( DBconnection conn, 
                                                               ScrollParams scrollParams, 
                                                               String orderBy,
                                                               String query_id) 
        throws SQLException;
    
    /**
     * Retrieves selected summary objects from result set using supplied ids. 
     * This method is used for downloading information for selected objects.  
     * Returned Summary objects implement the  <code>DNASummary</code> interface
     * which defines methods for creating exports.  The specific field 
     * referenced by dnaIDs will be different depending on dna sub type (clones
     * will use clone_id, libraries will use library_id etc.)
     *
     * @param conn An active connection to the database
     * @param dnaIDs Selected ids to retrieve from total result set
     * @param session_id User's session id. Used to retrieve data from person 
     * specific temp table
     * @return Array of objects implementing the DNASummary interface.  Concrete
     * type of summary object will depend on dna sub type (clone will use 
     * CloneSummary  objects, library will use LibrarySummary etc).
     * @throws SQLException thrown if a database error occurs 
     */
    public abstract DNASummary[] getSelected( DBconnection conn, 
                                              List dnaIDs, 
                                              String session_id ) 
        throws SQLException;
    
    
    /**
     * Retrieves URL of JPS used for displaying search results
     *
     * @return URL of JSP that should be used for display of type specific 
     * search results
     */
    public abstract String getSummaryPage();
    
    /**
     * Validates search parameters according to type specific rules. search 
     * parameter validation should should be called before createQuery() to 
     * ensure no inappropriate search params are included in search query
     *
     * @param searchParams Search parameters to validate
     * @param errors Map to hold all errors encountered while validating
     */
    public abstract void validateParams( Map searchParams, Map errors );
    
    
    /**
     * Determines whether submitted table is already in search query
     *
     * @param tableName Table to look for in list of tables in query
     * @return <code>true</code> if submitted tableName is found in list
     * of tables already added to query, or <code>false</code> if 
     * tableName not found in list of tables
     */
    protected boolean hasTable( String tableName ) {
        return ( queryTables.contains( tableName ) );
    }
    
    /**
     * Adds the submitted table name to the internal collection of tables
     * used in search query. This list is used to keep track of which tables
     * are in query so tables can be added to query as necessary w/out fear
     * of duplication
     * 
     * @param tableName Table to add to list of tables in query
     */
    protected void addTable( String tableName ) {
        if ( !queryTables.contains( tableName ) ) {
            queryTables.add( tableName );
        }
    }
    
    protected void clearTables(){
        queryTables = new ArrayList();
    }
   
    /**
     * Executes type specific search using submitted search parameters and 
     * returns slice of result set according to parameters defined in 
     * scrollParams.  Search query is retrieved using type specific 
     * createQuery() method; search results are retrieved using type 
     * specific getResultSlice method. When initially searching, results
     * are stored in a person specific temp table. Subsequent calls will 
     * then retrieve from temp table to show current page of result set
     * 
     * @param conn An active connection to the database
     * @param searchParams Search params to use for retrieving result set
     * @param scrollParams ScrollParams object containing data defining floor
     * and ceiling of result set
     * @param session_id User's session id. Used to retrieve data from person
     * specific temp table
     * @param firstSearch If <code>true</code> this is the first time this 
     * search has been executed, so full search should be executed w/results
     * being stored in a temp table for later retrieval. If <code>false</code>, 
     * temp table has already been populated, so can simply retrieve requested
     * slice of result set
     * @return DNA type specifc search results as a
     * <code>SearchResultsCollection</code>  containing an array of type
     * specific summary objects and data on the complete result set
     * @throws SQLException thrown if a database error occurs
     * @throws InvalidFormException thrown if invalid search parameters received
     */
    public SearchResultsCollection search( DBconnection conn, 
                                           Map searchParams, 
                                           ScrollParams scrollParams, 
                                           boolean firstSearch ) 
        throws InvalidFormException, SQLException {

        SearchResultsCollection searchResults = null;
        String query = null;
        String orderBy = (String) searchParams.get( "order" );
        String query_id = (String) searchParams.get("query_id");
        // do first search to populate temp table with full result set 
        
        if ( firstSearch ) {
            
            // do preliminary table drop first. should need it here, but just in case
            String del_query = getDelete( query_id );
            conn.setQuery(del_query);
            conn.executeUpdate();
            conn.releaseResources();
            
            // populate temp table
            query = getInsert() + createQuery( searchParams, query_id );
            conn.setQuery( query );
            conn.executeUpdate();
            conn.releaseResources();
        }
    
        // get requested subset, links for scrolling through multiple results
	    // pages, and plain text version of search parameters
        searchResults = getResultSlice( conn, scrollParams, orderBy, query_id ); 
        if ( searchResults != null ) { 
            if ( !searchResults.isEmpty() ) {
                searchResults.setScrollLinks(
		            ScrollCalculator.getTableScrollLinks( scrollParams.getSize(),
					scrollParams.getPage(), searchResults, query_id ) );
            }

            searchResults.setSearchCriteria( 
		    getFormatSearchCriteria( searchParams, 
				searchResults.getResultSize() ) );
        }
        return searchResults;
    }

    /**
     * Returns description of search criteria used to create result set. This
     * is a convenience method to simplify life at the JSP search summary page. 
     * Include information on total number of matches for complete description 
     * of result set. This method may get called when result set was retrieved
     * using the general search.  If this is true, the specialized method 
     * getGeneralSearchCriteria() is called to create the criteria.  
     * getGeneralSearchCriteria() is defined here in DNASearcher as an adapter
     * method that can be overridden by any sub-class that needs to specially 
     * define general search criteria according to type specific rules.
     *
     * @param searchParams Field names and values used to create search results
     * @param resultSize Total number of results
     * @return String describing search criteria used to create result set.
     */
    public String getFormatSearchCriteria( Map _searchParams, int resultSize ) {
        StringBuffer buffer = null;
        String criteria = null;
        Boolean isGeneral = null;

		Map searchParams = TextConverter.scrub(_searchParams);

        if ( searchParams != null ) {
            buffer = new StringBuffer();

            // if results are from general search instead of stand-alone
            // search, use specialized method to get criteria
            isGeneral = (Boolean) searchParams.get( "isGeneral" );
            if ( isGeneral != null && isGeneral.booleanValue() ) {
                criteria = getGeneralSearchCriteria( searchParams,
						     resultSize );

            } else { // otherwise create criteria for stand-alone search

                String dna_type = (String) searchParams.get( "dna_type" );
                String term_1 = (String) searchParams.get( "term_1" );
                String type_1 = (String) searchParams.get( "type_1" );
                String method_1 = (String) searchParams.get( "method_1" );

                String term_2 = (String) searchParams.get( "term_2" );
                String type_2 = (String) searchParams.get( "type_2" );
                String method_2 = (String) searchParams.get( "method_2" );
      
                String term_3 = (String) searchParams.get( "term_3" );
                String type_3 = (String) searchParams.get( "type_3" );
                String method_3 = (String) searchParams.get( "method_3" );
      
                // get display values for vector, not literal values used 
                // for searching (in searchParams as "vector_type")
                String[] vector_display_type = 
                    (String[]) searchParams.get( "vector_display_type" );

                String[] insert_type = 
		    (String[]) searchParams.get( "insert_type" );

                String[] clone_end_type = 
		    (String[]) searchParams.get( "clone_end_type" );
      
                Boolean is_sequenced = 
		    (Boolean) searchParams.get( "is_sequenced" );

                Boolean is_genetic_marker = 
		    (Boolean) searchParams.get( "is_genetic_marker" );

                Boolean is_on_a_map = 
		    (Boolean) searchParams.get( "is_on_a_map" );

                Boolean is_abrc_stock =
		    (Boolean) searchParams.get( "is_abrc_stock" );

                Boolean is_full_length_cds = 
		    (Boolean) searchParams.get( "is_full_length_cds" );
      
                java.util.Date restrict_date_from = 
                    (java.util.Date ) searchParams.get( "restrict_date_from" );

                java.util.Date restrict_date_to = 
                    (java.util.Date ) searchParams.get( "restrict_date_to" );
      
                String high_unit = (String) searchParams.get( "high_unit" );
                String high_range = (String) searchParams.get( "high_range" );
                String low_unit = (String) searchParams.get( "low_unit" );
                String low_range = (String) searchParams.get( "low_range" );
                String range_type =(String) searchParams.get( "range_type" ); 
                String map_type =(String) searchParams.get( "map_type" );
                String chromosome = (String) searchParams.get( "chromosome" );
                Units units = (Units) searchParams.get( "units" );

                // assembly unit data will only be present if search was linked
		// to from assembly unit detail page
                String assembly_unit_name = 
		    (String) searchParams.get( "assembly_unit_name" );

                Long assembly_map_element_id = 
		    (Long) searchParams.get( "assembly_map_element_id" );

               // taxon stuff 
                Long taxon_id = (Long) searchParams.get("taxon_id");
                
                // locus data will only be present if search was linked to 
		// from locus detail page
                String locus_name = (String) searchParams.get( "locus_name" );
                Long locus_id = (Long) searchParams.get( "locus_id" );

                // stock pool/set parent data will only be present if search 
		// was linked to from stock detail page
                String parentName = (String) searchParams.get( "parent_name" );

      
                boolean first = true;
                buffer.append( "Your query for <font class=\"emphasis\">" + 
                               translateDNAType( dna_type ) + 
			       "</font> where " );

                if ( !TextConverter.isEmpty( term_1 ) ) {
                    first = false;
                    buffer.append( translateTermType( type_1 ) + " " + 
                                   TextConverter.convertMethods( method_1 ) );
                    buffer.append( " the term <font class=\"emphasis\">" + 
				   term_1 + 
				   "</font> " );
                } 

                if ( !TextConverter.isEmpty( term_2 ) ) {
                    if ( !first ) {
                        buffer.append( ", and " );
                    }
                    first = false;
                    buffer.append( translateTermType( type_2 ) + " " + 
                                   TextConverter.convertMethods( method_2 ) );
                    buffer.append( " the term <font class=\"emphasis\">" + 
				   term_2 + 
				   "</font> " );
                } 

                if ( !TextConverter.isEmpty( term_3 ) ) {
                    if ( !first ) {
                        buffer.append( ", and " );
                    }
                    first = false;  
                    buffer.append( translateTermType( type_3 ) + " " + 
                                   TextConverter.convertMethods( method_3 ) );
                    buffer.append( " the term <font class=\"emphasis\">" + 
				   term_3 + "</font> " );

                } 


                if ( !TextConverter.isEmpty( assembly_unit_name ) ) {
                    first = appendComma( buffer, first );
                    buffer.append( "annotation unit is " + 
				   assembly_unit_name  + " " );
                }

                if ( !TextConverter.isEmpty( parentName ) ) {
                    first = appendComma( buffer, first );
                    buffer.append( "stock set or pool is " +
                                   "<a href=\"" +
				   "TairObject?type=stock&name=" + 
                                   URLEncoder.encode( parentName ) + "\"> " + 
                                   parentName + "</a> " );
                }

                if ( !TextConverter.isEmpty( locus_name ) ) {
                    first = appendComma( buffer, first );
                    buffer.append( "locus is " + locus_name  + " " );
                }


                // use appendVectorType to translate "virtual" form values
                if ( vector_display_type != null && 
                     vector_display_type.length > 0 && 
                     !vector_display_type[ 0 ].equals( "any" ) ) {

                    first = appendComma( buffer, first );
                    appendVectorType( buffer, vector_display_type );
                }
      
                if ( insert_type != null &&
                     insert_type.length > 0 &&
                     !insert_type[ 0 ].equals( "any" ) ) {

                    first = appendComma( buffer, first );
                    appendMultipleCriteria( buffer, 
					    "insert_type", 
					    insert_type );
                }

                if ( clone_end_type != null && 
                     clone_end_type.length > 0 &&
                     !clone_end_type[ 0 ].equals( "any" ) ) {

                    first = appendComma( buffer, first );
                    appendMultipleCriteria( buffer, 
					    "clone end type", 
					    clone_end_type );
                }
      
                if ( is_sequenced != null && 
		     is_sequenced.booleanValue() ) {       

                    first = appendComma( buffer, first );
                    buffer.append( "is sequenced" );
                }
      
                if ( is_genetic_marker != null && 
		     is_genetic_marker.booleanValue() ) {

                    first = appendComma( buffer, first );
                    buffer.append( "is genetic marker" );
                }
      
                if ( is_on_a_map != null && is_on_a_map.booleanValue() ) {
                    first = appendComma( buffer, first );
                    buffer.append( "is_on_a_map" );
                }
                if ( is_abrc_stock != null && is_abrc_stock.booleanValue() ) {
                    first = appendComma( buffer, first );
                    buffer.append( "is ABRC stock" );
                }
      
                if ( is_full_length_cds != null && 
		     is_full_length_cds.booleanValue() ) {

                    first = appendComma( buffer, first );
                    buffer.append( "is full length cDNA" );
                }

                if ( restrict_date_from != null ) {
                    first = appendComma( buffer, first );
                    buffer.append( "entered on or after: " + 
                                   TextConverter.dateToString( 
				       restrict_date_from ) );
                }

                if ( restrict_date_to != null ) {
                    first = appendComma( buffer, first );
                    buffer.append( "entered on or before: " + 
                                   TextConverter.dateToString( 
				       restrict_date_to ) );
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
                            buffer.append( "around: " + 
					   formatLowRange + 
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
      
                buffer.append( " resulted in <font class=\"emphasis\">" + 
                               resultSize + "</font> " );
                if ( resultSize == 1 ) {
                    buffer.append( "match." );
                } else {
                    buffer.append( "matches." );
                }
                criteria = buffer.toString();
            }
        }
        return criteria;
    }

    /**
     * Adapter method to create plain text version of serach parameters used to
     * create result set, when search was done using the general search instead 
     * of the stand-alone search.  This method should be overridden by any 
     * sub-class that is part of the general search so that criteria can be 
     * created using type-specific rules of interpretation of the search 
     * parameters.
     *
     * @param searchParams Field names and values used to create search results
     * @param resultSize Total number of results
     * @return String describing search criteria used to create result set.
     */
    protected String getGeneralSearchCriteria( Map searchParams, 
					       int resultSize ) 
    { 
        return ""; 
    }
    

    /**
     * Convenience method to append multiple values for single column 
     * name in SQL query
     */
    protected void appendMultiple( StringBuffer query, 
                                   String columnName, 
                                   String[] values, 
                                   boolean addAnd ) 
    {
        if ( values != null && values.length > 0 ) {
            if ( addAnd ) {
                query.append( "AND " );
            }
            query.append( columnName + " IN (" );
            boolean first = true;
            for ( int i = 0; i < values.length; i++ ) {
                if ( !first ) {
                    query.append( ", " );
                }
                query.append( TextConverter.dbQuote( values[ i ] ) );
                first = false;
            }
            query.append( ") " );
        }
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
     * Translate form values that may include "virtual" vector types made up of
     * multiple literal vector type values into formatted string
     */
    private void appendVectorType( StringBuffer buffer, 
				   String[] vector_display_type ) 
    {
        ArrayList types = null;
        boolean hasAll = false;
        boolean hasBAC = false;
        boolean first = true;
        Iterator iter = null;

        if ( vector_display_type != null & vector_display_type.length > 0 ) {
            types = new ArrayList();
            for ( int i = 0; i < vector_display_type.length; i++ ) {
                if ( vector_display_type[ i ] != null && 
                     !vector_display_type[ i ].equals( "any" ) ) {
                    if ( vector_display_type[ i ].equals( "BAC_ALL" ) ) {
                        hasAll = true;
                    } else if ( vector_display_type[ i ].equals( "BAC" ) ) {
                        hasBAC = true;
                    }
                    types.add( vector_display_type[ i ] );
                } 
            }

            buffer.append( "vector type is " );

            // translate "BAC_ALL" and "BAC" to explain what actual types were
            // searched, then just iterate through remaining selected types and
	    // append
            if ( hasAll ) {
                first = false;
                types.remove( "BAC_ALL" );
                buffer.append( "all BACS (including TAC, P1 & BiBAC) " );

                // remove literal sub types so they're not included 2x
                if ( types.contains( "BAC" ) ) {
                    types.remove( "BAC" );
                }

                if ( types.contains( "P1" ) ) {
                    types.remove( "P1" );
                }
                if ( types.contains( "TAC" ) ) {
                    types.remove( "TAC" );
                }
            }

            if ( hasBAC ) {
                if ( !first ) {
                    buffer.append( " or " );
                } else {
                    first = false;
                }
                buffer.append( "BAC (including BiBAC) " );
                if ( types.contains( "BAC" ) ) {
                    types.remove( "BAC" );
                }
            }


            iter = types.iterator();
            while ( iter.hasNext() ) {
                if ( !first ) {
                    buffer.append( " or " );
                } else {
                    first = false;
                }
                buffer.append( (String) iter.next() );
            }
        }
    }

  
    /**
     * Convenience method to append multiple values for single field in plain 
     * text description of search values
     */
    private void appendMultipleCriteria( StringBuffer buffer, 
                                         String fieldName, 
                                         String[] values ) 
    {
        buffer.append( fieldName + " is " );
    
        boolean first = true;
        for ( int i = 0; i < values.length; i++ ) {
            if ( !first ) {
                buffer.append( "or " );
            }
            buffer.append( values[ i ] + " " );
            first = false;
        }
    }
  

    /**
     * Translates form value of dna search type to plain text formatted version 
     * for display
     */
    private String translateDNAType( String type ) {
        String translatedType = null;
        if ( type != null ) {
            if ( type.equals( "clone" ) ) {
                translatedType = "clones";

            } else if ( type.equals( "clone_end" ) ) {
                translatedType = "clone ends";

            } else if ( type.equals( "library" ) ) {
                translatedType = "libraries";

            } else if ( type.equals( "vector" ) ) {
                translatedType = "vectors";

            } else if ( type.equals( "pool" ) ) {
                translatedType = "pooled genomic dna";

            } else if ( type.equals( "filter" ) ) {
                translatedType = "filters";

            } else if ( type.equals( "stock" ) ) {
                translatedType = "stocks";

            } else if ( type.equals( "strain" ) ) {
		translatedType = "host strain";

	    } else {
		translatedType = type;
	    }
        }
        return translatedType;
    }

  
    /**
     * Translates form value of search term type to plain text formatted
     * version for display
     */
    private String translateTermType( String type ) {
        String translatedType = null;
        if ( type != null ) {
            if ( type.equals( "clone" ) ) {
                translatedType = "clone name";

            } else if ( type.equals( "clone_end" ) ) {
                translatedType = "clone end name";

            } else if ( type.equals( "locus" ) ) {
                translatedType = "locus name";

            } else if ( type.equals( "gene" ) ) {
                translatedType = "gene name";

            } else if ( type.equals( "library" ) ) {
                translatedType = "library name";

            } else if ( type.equals( "vector" ) ) {
                translatedType = "vector name";

            } else if ( type.equals( "filter" ) ) {
                translatedType = "filter name";

            } else if ( type.equals( "donor_person" ) ) {
                translatedType = "donor last name";

            } else if ( type.equals( "donor_organization" ) ) {
                translatedType = "donor organization name";

            } else if ( type.equals( "accession" ) ) {
                translatedType = "GenBank accession";

            } else if ( type.equals( "genbank_gi" ) ) {
                translatedType = "GenBank gi";

            } else if ( type.equals( "stock_number" ) ) {
                translatedType = "stock number";

            } else if ( type.equals( "stock_description" ) ) {
                translatedType = "stock description";

            } else if ( type.equals( "strain_name" ) ) {
		translatedType = "host strain name";

	    } else if ( type.equals( "strain_description" ) ) {
		translatedType = "host strain description";

	    } else {
		translatedType = type;
	    }
	    

        }
        return translatedType;
    }


    //
    // Search methods - each type of name search has its own search method. 
    // In several cases, an implementation is provided here in the superclass 
    // and is selectively overriden by inheriting classes if necessary.  Other 
    // methods have empty implementations and must be overridden by inheriting 
    // classes if that sub-type can be searched by that criteria. Having empty 
    // implementation here saves us from adding empty methods to all sub-classes
    // when they're not always needed by each dna search type
    // 
    // All methods are used to search by particular term types either through 
    // a sub-select or through a table join
    //


    /**
     * Adds criteria to search elements by stock donor name. This implementation
     * is overridden by FilterSearcher, StockSearcher and PooledGenomicSearcher 
     * to do name search directly instead of as sub-select (since they're both 
     * in Stock table to begin with). CloneEndSearcher also overrides this
     * method since clone ends search stocks through their associated clone; 
     * CloneEndSearcher will do this by simply calling this superclass 
     * implementation, substituting in Clone table prefix ("c") for CloneEnd 
     * prefix ("ce") that will be  originally received
     *
     * <p>
     * Search will search for donor Person or Organization according to the 
     * value of personSearch param.
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search donor names for 
     * @param prefix Table prefix to use when joining to stock donor criteria
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

        where.append( "AND EXISTS (" +
		      "SELECT 'X' " +
		      "FROM TairObject_Stock ts, Donor d, Community cm, " + 
		      table + " " +
		      "WHERE ts.tair_object_id = " + 
		      prefix + ".tair_object_id " +
		      "AND ts.stock_id = d.stock_id " +
		      "AND d.community_id = cm.community_id " +
		      "AND cm.community_id = p.community_id " +
		      "AND d.community_id = p.community_id " +
		      "AND cm.is_obsolete = 'F' " +
		      "AND cm.status = " + 
		      TextConverter.dbQuote( DataConstants.getActiveStatus() ) + 
		      " " +
		      "AND " + searchColumn + " LIKE " + term + 
                      " ESCAPE '\\\') "
                      );
    }


    /**
     * Adds criteria to search elements by donor stock number. This implementation
     * is overridden by FilterSearcher, StockSearcher and PooledGenomicSearcher 
     * to do donor search directly instead of as sub-select (since they're both 
     * in Stock table to begin with). CloneEndSearcher also overrides this
     * method since clone ends search stocks through their associated clone; 
     * CloneEndSearcher will do this by simply calling this superclass 
     * implementation, substituting in Clone table prefix ("c") for CloneEnd 
     * prefix ("ce") that will be  originally received
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search donor stock numbers for
     * @param prefix Table prefix to use when joining to stock donor criteria
     */
    protected void searchDonorStockNumber( StringBuffer where, 
					   String term, 
					   String prefix )
    { 

        where.append( "AND EXISTS (" +
		      "SELECT 'X' " +
		      "FROM TairObject_Stock ts, Donor d " + 
		      "WHERE ts.tair_object_id = " + 
		      prefix + ".tair_object_id " +
		      "AND ts.stock_id = d.stock_id " +
		      "AND d.donor_stock_number_uc LIKE " + term + 
                      " ESCAPE '\\\') "
                      );
    }




    /**
     * Add criteria to search by locus name - implementation here should work 
     * for all sub-classes that use locus search by substituting in the relevant
     * table prefix into sub-select on locus name
     */
    private void searchLocus( StringBuffer where, String term, String prefix ) {
        where.append( "AND EXISTS ( " +
		      "SELECT 'X' " +
		      "FROM MapElement_Locus ml, LocusNameAlias lna " +
		      "WHERE ml.map_element_id = " +  
		      prefix + ".map_element_id " +
		      "AND ml.locus_id = lna.locus_id " +
		      "AND lna.name LIKE " + term +
                      " ESCAPE '\\\') "
                      );
    }

    /**
     * Add criteria to search using locus id -- this will be called only if 
     * search is being linked to from locus detail page.  This implementation 
     * should work for all sub-classes by substituting in the relevant table 
     * prefix 
     */
    private void searchLocusID( StringBuffer where, 
				Long locus_id, 
				String prefix ) 
    {
        where.append( "AND EXISTS ( " +
		      "SELECT 'X' " +
		      "FROM MapElement_Locus ml " +
		      "WHERE ml.map_element_id = " + 
		      prefix + ".map_element_id " +
		      "AND ml.locus_id = " + locus_id.toString() + 
                      ") "
                      );
    }

    /**
     * Add criteria to search by gene name - implementation here should work
     * for all sub-classes that use gene search by substituting in the relevant
     * table prefix into sub-select on gene name
     */
    private void searchGene( StringBuffer where, String term, String prefix ) { 
        where.append( "AND EXISTS ( " +
		      "SELECT 'X' " +
		      "FROM Gene_MapElement gm, GeneNameAlias gna " +
		      "WHERE gm.map_element_id = " + 
		      prefix + ".map_element_id " +
		      "AND gm.gene_id = gna.gene_id " +
		      "AND gna.name LIKE " + term +
                      " ESCAPE '\\\') "
                      );
    }
    

    /**
     * Add criteria to search by vector name - implementation here relies on 
     * polymorphically joining to Vector - this should  work for all sub-classes
     * that search vector name without exception
     */
    private void searchVector( StringBuffer from, 
                               StringBuffer where, 
                               StringBuffer joins, 
                               String term ) 
    {
        addVector( from, where, joins );
        where.append( "AND EXISTS ( " +
		      "SELECT 'X' " +
		      "FROM VectorNameAlias vna " +
		      "WHERE v.vector_id = vna.vector_id " +
		      "AND vna.name LIKE " + term +
                      " ESCAPE '\\\') "
                      );
    }

    /**
     * Adds criteria to search by vector type - implementation here relies on 
     * polymorphically joining to Vector - this should work vector and library
     * search, but will be overridden by clone and clone end to search vector 
     * type field in Clone
     *
     * @param from FROM clause to add table to 
     * @param where WHERE clause to add table join to
     * @param joins Table join statements of WHERE clause
     * @param vector_type List of vector types to search for
     */
    protected void searchVectorType( StringBuffer from, 
                                     StringBuffer where, 
                                     StringBuffer joins, 
                                     String[] vector_type ) 
    {
        addVector( from, where, joins );
        appendMultiple( where, "v.vector_type", vector_type, true );
    }
    
    /**
     * Adds criteria to search elements by GenBank accession number.  This 
     * implementation searches the NucleotideSequence.ic_accession field, which
     * should work for all sub-types except Vector, which overrides method to 
     * search Vector.accession
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search GenBank accessions for 
     * @param prefix Table prefix to use when joining to accession criteria
     */
    protected void searchGenBankAccession( StringBuffer where, 
					   String term, 
					   String prefix ) 
    { 
        where.append( "AND EXISTS (" +
		      "SELECT 'X' " +
		      "FROM NucleotideSequence_MapElement nm, " +
		      "NucleotideSequence n " +
		      "WHERE nm.map_element_id = " + 
		      prefix + ".map_element_id " +
		      "AND nm.nucleotide_seq_id = n.nucleotide_seq_id " +
		      "AND n.is_obsolete = 'F' " +
		      "AND n.ic_accession LIKE " + term +
                      " ESCAPE '\\\') "
                      );
    }

    /**
     * Adds criteria to search elements by GenBank gi #.  This implementation 
     * searches the NucleotideSequence.ic_accession field, which should work 
     * for all sub-types except Vector, which overrides method to search 
     * Vector.accession
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search GenBank gi #s for 
     * @param prefix Table prefix to use when joining to accession criteria
     */  
    protected void searchGenBankGI( StringBuffer where, 
				    String term, 
				    String prefix ) 
    {
        where.append( "AND EXISTS ( " +
		      "SELECT 'X' " +
		      "FROM NucleotideSequence_MapElement nm, " +
		      "NucleotideSequence n " +
		      "WHERE nm.map_element_id = " + 
		      prefix + ".map_element_id " +
		      "AND nm.nucleotide_seq_id = n.nucleotide_seq_id " +
		      "AND n.is_obsolete = 'F' " +
		      "AND n.genbank_gi LIKE " + term + 
                      " ESCAPE '\\\') "
                      );
    }

    
    /**
     * Adds criteria to search elements by stock number. This implementation is
     * overridden by FilterSearcher and PooledGenomicSearcher to do name search 
     * directly instead of as sub-select (since they're both in Stock table to 
     * begin with). CloneEndSearcher also overrides this method since clone ends 
     * search stocks through their associated clone; CloneEndSearcher will do 
     * this by simply calling this superclass implementation, substituting in 
     * Clone table prefix ("c") for CloneEnd prefix ("ce") that will be 
     * originally received
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search GenBank accessions for 
     * @param prefix Table prefix to use when joining to accession criteria
     * @param filter If <code>true</code> stock name to search must be for 
     * stocks of type "filter"; if <code>false</code> no stock type restriction
     * is added to name search
     */
    protected void searchStockNumber( StringBuffer where, 
                                      String term, 
                                      String prefix, 
                                      boolean filter ) 
    { 
        where.append( "AND EXISTS ( " +
		      "SELECT 'X' " +
		      "FROM TairObject_Stock ts, Stock s, StockNameAlias sna "
                      );
        
        if ( filter ) {
            where.append( ", StockType st " );
        }
        


        where.append(     "WHERE ts.tair_object_id = " + 
			  prefix + ".tair_object_id " +
                          "AND ts.stock_id = s.stock_id " +
                          "AND s.stock_id = sna.stock_id " +
                          "AND ts.stock_id = sna.stock_id " +
                          "AND sna.name LIKE " + term + " ESCAPE '\\\' "
			  );

        if ( filter ) {
            where.append( "AND s.stock_type_id = st.stock_type_id " +
                          "AND st.stock_type = 'filter' " 
                          );
        }
        where.append( ") " );  

    }


    /**
     * Adds criteria to search elements by stock description. This 
     * implementation is overridden by FilterSearcher and 
     * PooledGenomicSearcher to do description search directly instead
     * of as sub-select (since they're both in Stock table to begin with). 
     * CloneEndSearcher also override this method since clone ends search
     * stocks through their associated clone; CloneEndSearcher will do this
     * by simply calling this superclass implementation, substituting in 
     * Clone table prefix ("c") for CloneEnd prefix ("ce") that will be 
     * originally received.
     *
     * <p>
     * Description searching actually searches the "description_uc" search
     * field, which allows us to easily do a case-insensitive search; this
     * field is also a varchar which is searched much more quickly than
     * the description field itself (which is TEXT)
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search GenBank accessions for 
     * @param prefix Table prefix to use when joining to accession criteria
     */
    protected void searchStockDescription( StringBuffer where, 
                                           String term, 
                                           String prefix ) 
    {
	where.append( "AND EXISTS ( " +
		      "SELECT 'X' " +
		      "FROM TairObject_Stock ts, Stock s " +
		      "WHERE ts.tair_object_id = " +
		      prefix + ".tair_object_id " +
		      "AND ts.stock_id = s.stock_id " +
		      "AND s.is_obsolete = 'F' " +
		      "AND s.description_uc LIKE " + term + " ESCAPE '\\\' " +
		      ") "
                      );
    }

  
    /**
     * Adds criteria to search elements by clone name
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search clone names for 
     */
    protected void searchClone( StringBuffer where, String term ) { }

    /**
     * Adds criteria to search elements by clone end name
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search clone end names for 
     */
    protected void searchCloneEndName( StringBuffer where, String term ) { }
    
    /**
     * Adds criteria to search elements by clone end type. 
     *
     * @param where WHERE clause to add criteria to
     * @param clone_end_type List of clone end types to search for
     */
    protected void searchCloneEndType( StringBuffer where, 
				       String[] clone_end_type ) { }

    /**
     * Adds criteria to search elements by clone insert type. 
     *
     * @param where WHERE clause to add criteria to
     * @param insert_type List of insert types to search for
     */
    protected void searchInsertType( StringBuffer where, 
				     String[] insert_type ) { }

    /**
     * Adds criteria to search elements by library name
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search clone names for 
     */
    protected void searchLibrary( StringBuffer where, String term ) { }


    /**
     * Adds criteria to search elements by host strain name.  This
     * method should only apply to the HostStrain sub type.
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search host strain names for
     */
    protected void searchHostStrainName( StringBuffer where, 
					 String term ) 
    { 
    
    }

    /**
     * Adds criteria to search elements by host strain description. This
     * method should only apply to the HostStrain sub type.
     *
     * @param where WHERE clause to add criteria to
     * @param term Term to search host strain descriptions for
     */
    protected void searchHostStrainDescription( StringBuffer where, 
						String term ) 
    {

    }


    /**
     * Adds a join to the Vector table to current query in a type specific 
     * manner
     *
     * @param from FROM clause to add table to 
     * @param where WHERE clause to add table join to
     * @param joins Table join statements of WHERE clause
     */
    protected void addVector( StringBuffer from, 
			      StringBuffer where, 
			      StringBuffer joins ) { }

    /**
     * Adds a join to the Stock table to current query in a type specific
     * manner
     *
     * @param from FROM clause to add table to 
     * @param where WHERE clause to add table join to
     * @param joins Table join statements of WHERE clause
     */
    protected void addStock( StringBuffer from, 
			     StringBuffer where, 
			     StringBuffer joins ) { }

 
    /**
     * Convenience method to append SQL criteria for each of different
     * search term types. This method relies on the proper implementation 
     * of the search/addTable (searchClone, addStock etc.) methods to work.
     */
    private void appendSearchTerm( StringBuffer from, 
                                   StringBuffer where, 
                                   StringBuffer joins, 
                                   String term, 
                                   String type, 
                                   String method, 
                                   String prefix ) 
    {

        if ( type != null ) {


	    // quote search term and add wildcards to match
	    // selected search method
	    term = TextConverter.dbQuote( 
		       TextConverter.convertEnds( term.toUpperCase(), method )
		    ); 


            if ( type.equals( "clone" ) ) {
                searchClone( where, term );

            } else if ( type.equals( "clone_end" ) ) {
                searchCloneEndName( where, term );

            } else if ( type.equals( "locus" ) ) {
                searchLocus( where, term, prefix );

            } else if ( type.equals( "gene" ) ) {
                searchGene( where, term, prefix );

            } else if ( type.equals( "library" ) ) {
                searchLibrary( where, term );

            } else if ( type.equals( "vector" ) ) { 
                searchVector( from, where, joins, term );

            } else if ( type.equals( "filter" ) ) {
                searchStockNumber( where, term, prefix, true );

            } else if ( type.equals( "donor_person" ) ) {
                searchDonorName( where, term, prefix, true );

            } else if ( type.equals( "donor_organization" ) ) {
                searchDonorName( where, term, prefix, false );

	    } else if ( type.equals( "donor_stock_number" ) ) {
		searchDonorStockNumber( where, term, prefix );

            } else if ( type.equals( "accession" ) ) {
                searchGenBankAccession( where, term, prefix );

            } else if ( type.equals( "genbank_gi" ) ) {
                searchGenBankGI( where, term, prefix );

            } else if ( type.equals( "stock_number" ) ) {
                searchStockNumber( where, term, prefix, false );

            } else if ( type.equals( "stock_description" ) ) {
                searchStockDescription( where, term, prefix );

            } else if ( type.equals( "strain_name" ) ) {
		searchHostStrainName( where, term );

	    } else if ( type.equals( "strain_description" ) ) {
		searchHostStrainDescription( where, term );
	    }
        }
    }

    
    /**
     * Creates SQL query to search for dna sub types given search parameters. 
     * Creation of query from submitted search parameters is localized here to 
     * make maintenance easier, however doing this means that the query must be 
     * able to incorporate all possible search parameters, regardless of whether
     * they make sense when searching for a specific dna sub type.  Before 
     * creating search query, client code should be sure to validate 
     * searchParams using the type specific validateParams() method 
     * implemented in each sub class of DNASearcher.
     *
     * <p>
     * This method is normally called by the createQuery method implemented 
     * in sub-classes after type specific information has already been added to 
     * the query being created.  This method relies on the proper implementation 
     * of the search/addTable (searchClone, addStock etc.) methods in sub 
     * classes to work.
     *
     * <p>
     * This method takes a tablePrefix parameter, which is used to create 
     * generic joins (for instance, to TairObject if searching by submission 
     * date). Not all possible joins will work if attempted - joining to map 
     * element data when searching for Vectors will fail, for example. However,
     * if search parameters have been validated before creating query, there 
     * should be no conflicts.  Tables used in the search query use the same 
     * alias prefix regardles of dna search type.  Although this leaves us a 
     * little vulnerable to name clashes, since the overall definition of the
     * SQL query happens between DNASearcher & sub-classes, the overall benefit
     * of having the bulk of query creation located here in one place outweighs
     * the downsides.
     *
     * The tables and aliases used are:
     *
     * <ul>
     * <li>Assignment - a</li>
     * <li>Clone - c</li>
     * <li>CloneEnd - ce</li>
     * <li>Community - cm</li>
     * <li>Donor - d</li>
     * <li>HostStrain - hs</li>
     * <li>Library - l</li>
     * <li>Map - mp</li>
     * <li>MapElement_Locus - ml</li>
     * <li>NucleotideSequence - n</li>
     * <li>NuceotidSequence_MapElement - nm</li>
     * <li>Person - p</li>   
     * <li>Stock - s</li>
     * <li>StockAvailabilityType - sat</li>
     * <li>StockType - st</li>
     * <li>TairObject_Stock - ts</li>
     * <li>TairObject - t</li>
     * <li>Vector - v</li>
     * </ul>
     *
     * @param searchParams Submitted search criteria to use to select result set
     * @param tablePrefix Type specific table prefix used when making generic 
     * joins.
     * @param from FROM clause to add tables to
     * @param where WHERE clause to add table joins and search criteria to
     * @param joins Join portion of WHERE clause to add table joins to
     * @return SQL query to retrieve search results given search criteria
     */
    protected String createQuery( Map searchParams, 
                                  String tablePrefix, 
                                  StringBuffer from, 
                                  StringBuffer where, 
                                  StringBuffer joins ) 
    {
        String query = null;
        
        String term_1 = (String) searchParams.get( "term_1" );
        String type_1 = (String) searchParams.get( "type_1" );
        String method_1 = (String) searchParams.get( "method_1" );

        String term_2 = (String) searchParams.get( "term_2" );
        String type_2 = (String) searchParams.get( "type_2" );
        String method_2 = (String) searchParams.get( "method_2" );

        String term_3 = (String) searchParams.get( "term_3" );
        String type_3 = (String) searchParams.get( "type_3" );
        String method_3 = (String) searchParams.get( "method_3" );

        String[] vector_type = (String[]) searchParams.get( "vector_type" );
        String[] insert_type = (String[]) searchParams.get( "insert_type" );

        String[] clone_end_type = 
	    (String[]) searchParams.get( "clone_end_type" );

        Boolean is_sequenced = (Boolean) searchParams.get( "is_sequenced" );

        Boolean is_genetic_marker = 
	    (Boolean) searchParams.get( "is_genetic_marker" );

        Boolean is_on_a_map = (Boolean) searchParams.get( "is_on_a_map" );
        Boolean is_abrc_stock = (Boolean) searchParams.get( "is_abrc_stock" );

        Boolean is_full_length_cds = 
	    (Boolean) searchParams.get( "is_full_length_cds" );

        java.util.Date restrict_date_from = 
            (java.util.Date ) searchParams.get( "restrict_date_from" );
        java.util.Date restrict_date_to = 
            (java.util.Date ) searchParams.get( "restrict_date_to" );

        String chromosome = (String) searchParams.get( "chromosome" );
        String map_type = (String) searchParams.get( "map_type" );
        String order = (String) searchParams.get( "order" );
        String position = null;
        Units units = (Units) searchParams.get( "units" );

        // assembly unit data will only be present if search was linked to
	// from assembly unit detail page
        Long assembly_map_element_id = 
	    (Long) searchParams.get( "assembly_map_element_id" );

        // taxon stuff 
        Long taxon_id = (Long) searchParams.get("taxon_id");

        // locus id will only be present if search was linked to from
	// locus detail page
        Long locus_id = (Long) searchParams.get( "locus_id" );


        // parent stock pool/set data will only be present if search was
	// linked to from dna stock detail page - should only apply when
	// dna sub type = stock
        Long parentTairObjectID = (Long) searchParams.get( "parent_id" );


        if ( !TextConverter.isEmpty( term_1 ) && 
	     !TextConverter.isEmpty( type_1 ) ) {

            appendSearchTerm( from, 
			      where, 
			      joins, 
			      term_1, 
			      type_1, 
			      method_1, 
			      tablePrefix );
        }

        if ( !TextConverter.isEmpty( term_2 ) && 
	     !TextConverter.isEmpty( type_2 ) ) {

            appendSearchTerm( from, 
			      where, 
			      joins, 
			      term_2, 
			      type_2, 
			      method_2, 
			      tablePrefix );
        }


        if ( !TextConverter.isEmpty( term_3 ) && 
	     !TextConverter.isEmpty( type_3 ) ) {

            appendSearchTerm( from, 
			      where, 
			      joins, 
			      term_3, 
			      type_3, 
			      method_3, 
			      tablePrefix );
        }

        // if requesting elements on map, this join will implicitly fulfill
	// the query so don't need to check again
        //
        // if requesting elements for assembly unit, must look through 
	// assignment only, disregarding map

        boolean addMap = ( map_type != null  || 
                           ( is_on_a_map != null && 
                             is_on_a_map.booleanValue() ) );
    
        boolean addAssignment = ( addMap || assembly_map_element_id != null );

        if ( addAssignment ) {
            from.append( ", GlobalAssignment a " );
            joins.append( "AND a.map_element_id = " + 
			  tablePrefix + ".map_element_id " );
            where.append( "AND a.is_obsolete = 'F' " );

        }

        if ( addMap ) {
            from.append( ", Map mp " );
            joins.append( "AND a.map_id = mp.map_id " );
        }


        // retrieve elements associated to assembly unit - will only be called
	// if linking to search from assembly unit detail page

        if ( assembly_map_element_id != null ) {
            from.append( ", LocalAssignment la " );
            joins.append( "AND a.global_assignment_id = " +
                          "la.global_assignment_id " );
            where.append( "AND la.super_map_element_id = " + 
			  assembly_map_element_id.toString() + " " );
        }

        // retrieve member stocks of parent pool/set using parent tair object 
        // id

        if ( parentTairObjectID != null ) {
            // stock should already be in query since this data should only
            // be present if dna sub type = stock, but might as well be safe...
            addStock( from, joins, where ); 
            from.append( ", TairObject_Stock ts " );
            joins.append( "AND s.stock_id = ts.stock_id " );
            where.append( "AND ts.tair_object_id = " + 
			  parentTairObjectID.toString() );
        }
    
        if (taxon_id != null) {
            where.append( " AND c.taxon_id = " + taxon_id + " ");
        }

        // retrieve elements associated to locus - will only be called if
	// linking to search from locus detail page
        if ( locus_id != null ) {
            searchLocusID( where, locus_id, tablePrefix );
        }

        if ( is_sequenced != null && is_sequenced.booleanValue() ) {
            where.append( " AND " + tablePrefix + ".is_sequenced='T' " );
        }
    
        if ( is_genetic_marker != null && is_genetic_marker.booleanValue() ) {
            from.append( ", GeneticMarker gm " );
            joins.append( "AND gm.made_from_id = " + 
			  tablePrefix + ".map_element_id " ); 
            where.append( "AND gm.is_obsolete = 'F' " );
        }
    
        if ( is_abrc_stock != null && is_abrc_stock.booleanValue() ) {
            addStock( from, where, joins );
        }

        if ( is_full_length_cds != null && 
	     is_full_length_cds.booleanValue() ) {

            where.append( "AND EXISTS ( " +
			  "SELECT 'X' " +
			  "FROM NucleotideSequence_MapElement nm, " +
			  "NucleotideSequence n " +
			  "WHERE nm.map_element_id = " + 
			  tablePrefix + ".map_element_id " +
			  "AND nm.nucleotide_seq_id = n.nucleotide_seq_id " +
			  "AND n.is_obsolete = 'F' " +
			  "AND n.cds_is_full_length = 'T' " +
			  "AND n.nucleotidesequence_type = 'mrna' " +
			  "AND n.sequence_class = 'cDNA' " +
                          ") " 
                          );
        }
        
        // covers case both for is on a map & assignment queries
        if ( map_type != null ) {
            where.append( "AND mp.name LIKE " + 
                          TextConverter.dbQuote( map_type.toUpperCase() + 
						 "%" ) + " ESCAPE '\\\' " );
        }

        if ( vector_type != null 
             && vector_type.length > 0 
             && !vector_type[ 0 ].equalsIgnoreCase( "any" ) ) {
        
            searchVectorType( from, where, joins, vector_type );
        }

        if ( insert_type != null && 
             insert_type.length > 0 && 
             !insert_type[ 0 ].equalsIgnoreCase( "any" ) ) {

            searchInsertType( where, insert_type );
        }

        if ( clone_end_type != null && 
             clone_end_type.length > 0 && 
             !clone_end_type[ 0 ].equalsIgnoreCase( "any" ) ) {

            searchCloneEndType( where, clone_end_type );
        }

        if ( restrict_date_from != null ) {
            where.append( " AND " + tablePrefix + ".date_last_modified >= " + 
                          TextConverter.dbQuote( restrict_date_from, "mm/dd/yyyy" ) );
        }

        if ( restrict_date_to != null ) {
            where.append( " AND " + tablePrefix + ".date_last_modified <= " + 
                          TextConverter.dbQuote( restrict_date_to, "mm/dd/yyyy" ) );
        }
   
        if ( !TextConverter.isEmpty( chromosome ) && 
	     !chromosome.equals( "any" ) ) {

            where.append( " AND " + tablePrefix + ".chromosome LIKE " + 
                          TextConverter.dbQuote( "%" + chromosome + "%" ) + 
			  " ESCAPE '\\\' " );
   
            // if no chromosome entered, check to see if one is implied
            // by the search by map location element search
        } else if ( units != null && units.useAssignmentChromosome() ) {
            where.append( " AND " + tablePrefix + ".chromosome LIKE " + 
                          TextConverter.dbQuote( "%" + 
						 units.
                                                 getAssignmentChromosome() + 
						 "%" ) 
                          + " ESCAPE '\\\' " );
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
				  end.doubleValue()*1000+
                                  " OR a.start_position <=" + 
				  end.doubleValue()*1000+
                                  " ) AND ( a.units = 'bp' OR " +
				  "a.units is null ) ) )" );
                }
            }
        }
        query = from.toString() + joins.toString() + where.toString();
        Debugger.println( query );

        return query;
    }

}
