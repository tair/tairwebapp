/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.DataConstants;
import org.tair.utilities.Debugger;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;

/**
   *  PolyAlleleSearcher retrieves polymorphisms according to submitted search parameters. Search results are
   *  stored in a temp table <code>PolyAlleleTableInfo</code> which is created for a particular user based on session id
   *  and search type (polyallele). For temp table definition see <code>PolyAlleleTableInfo</code>.  PolyAlleleSearcher
   *  only inserts into temp table; creating, deleting and dropping table is done by <code>SearchSession</code>. Selecting
   *  from temp table is done by <code>ResultsFetcher</code> via the summary jsp for search results and via
   *  <code>PolyAlleleSearchHandler</code> for download results. PolyAlleleSearcher retrieves the relevant
   *  table name to use by querying <code>MasterTableInfo</code>.
 */

public class PolyAlleleSearcher implements GeneralSearcher {

    private String temp_tbl_name;
    private final String search_type = "polyallele";
    private final String results_page = "/jsp/search/polyallele_summary.jsp";
    private HashMap params;
    private boolean is_SNP;
    private boolean gene_feature_site = true;
    private boolean mutation_site = false ;
    private ArrayList tables = new ArrayList();
    private String position_str =  " null AS position_requested, " ;
    //place holder for position info -- needed for formatting logic in lookup class
    private String units_str = " ' ' AS units_requested, ";
    //** place holder for inits info -- needed for formatting logic in lookup class
    private String map_str = " 'none' AS map_type_requested ";
    //** place holder for map info -- needed for sorting and seqviewer logic in lookup class
    //** no comma at the end of this string because its the last item in the select clause
    private StringBuffer from_clause;
    // used by PolyAlleleSearchHandler search
    private StringBuffer where_clause;
    // used by PolyAlleleSearchHandler search
    private StringBuffer orderBy_clause;
    // used by PolyAlleleSearchHandler search
    private StringBuffer select_clause;
    // used for both types of temp table sql
    private SearchResultsCollection search_results;
    private int result_size;
    private String search_criteria;
    private boolean is_general;
    private boolean counts_only;
    private String count_select_clause;
    // count sql used for both parts of union
    private String general_from_clause_1;
    // general search from clause first part of union
    private String general_from_clause_2;
    // general search from clause first part of union
    private StringBuffer general_where_1;
    // general search where clause first part of union
    private StringBuffer general_where_2;
    // general search where clause second part of union
    private DBWriteManager connectionPool;


    public PolyAlleleSearcher() throws SQLException {}

    /**
     * Creates SQL query using submitted search parameters and stores polymorphisms that match criteria
     * in temp table.  Each row in the temp table represents a unique polymorphism used for display on the summary page
     * or for downloading to browser.  Each column is populated with a polymorphism attribute cooresponding to that
     * the rows polymorphism id (column name = ID).  Where compound information is associated with one polymorphism, a unique id
     * is stored to be used for lookup into the appropriate table at the time the complete row's data is requested for display
     * or download via <code>ResultsFetcher</code>.  For example, where many aliases are associated to one polymorphism id, the
     * value stored in the temp table's "Aliases" column is the polymorphism's tair_object_id which will be used as the lookup key
     * when the data is requested for display, one page at a time or for download, a set of polymorphisms selected by the user.
     *
     * @param searchParams Search criteria submitted through the web search form, stored as field name
     * as a <code>String</code> key referencing the search value.
     * @param session_id User's session id. Used to access temp table for user's individual results.
     * @exception SQLException thrown if a database error occurs.
     */
    public void doSearch( HashMap search_params ) throws SQLException {
        
        is_general = false;
        setParams( search_params );
        String queryID = (String) search_params.get( "query_id" );
        //setTempTblName( search_type, session_id );
        processSearch( queryID );
    }

    public SearchResultsCollection doGeneralSearch( Map general_params, boolean get_counts, boolean firstSearch ) 
    throws SQLException {
        search_results = new SearchResultsCollection();
        search_results.setResultsPage( getResultsPage() );
        is_general = true;
        setParams( ( HashMap )general_params );
        String queryID = (String) general_params.get("query_id");
        //if ( ( String )getParams().get( "sessionID" ) != null ) setTempTblName( getSearchType(), ( String )getParams().get( "sessionID" ) );
        if ( get_counts ) {
            counts_only = true;

        } else {
            counts_only = false;
        }
        if (firstSearch) {
            processSearch( queryID );
        }
        search_results.setResultSize( getResultSize() );
        search_results.setSearchCriteria( getSearchCriteria() );
        return search_results;
    }
    
    /**
    * get the unique identifier query line of this search
    * quick search will never have multiple parameters, 
    * so instead of generating the query, we can just return 
    * a unique identifier based on the thing searched
    */
    public String generateInsertLine( DBconnection conn, Map search_params, String type )
    throws SQLException {                                                      
        String insert_query = "";                                                   
        if (type.equalsIgnoreCase( "form" ) ){
            setParams( (HashMap)search_params );
            insert_query = createSearchSQL( "" );
        } else if (type.equalsIgnoreCase ("general") ){
            setParams( (HashMap)search_params );
            insert_query = createGeneralSearchSQL( "" );
        } else {
            setParams( (HashMap)search_params );
            insert_query = createSearchSQL( "" );
        } 
        emptyTableList();
        return insert_query;                                                                
    }
    
    // returns the search type
    private String getSearchType() { return search_type; }

    // returns the results page name, needed for the general search
    private String getResultsPage() { return results_page; }

    // returns the select clause for the counts only sql initiated from the GeneralSearchHandler - is not dynamic
    private String getCountSelect() { return count_select_clause; }

    // returns whether the searcher has been invoked from the general search handler or the type specific search handler
    private boolean isGeneral() { return is_general; }

    // returns whether only a count on the results is needed or the results should be written to temp table
    private boolean countsOnly() { return counts_only; }

    // gets a pooled connection to the database
    private DBconnection getConnection() throws SQLException {
        connectionPool = DBWriteManager.getInstance();
        return connectionPool.getSearchConnection();
    }

    // releases a connection back to the database pool
    private void returnConnection( DBconnection conn ) throws SQLException { connectionPool.return_connection( conn ); }

    // sets the result size
    private void setResultSize( int hits ) {
        result_size = hits;
    }

    // returns the result size
    private int getResultSize() { return result_size; }

    // sets the search criteria - textual representation of the general search params
    private void setSearchCriteria() {
        if ( getParams() != null ) {
            StringBuffer buffer = new StringBuffer();
            String searchTerm = (String) getParams().get( "searchTerm" );
            String method = (String) getParams().get( "method" );
            buffer.append( "Your query for polymorphisms where " );
            if ( !TextConverter.isEmpty( searchTerm ) ) {
                buffer.append( "name " + TextConverter.convertMethods( method ) +
                               " the term  " + searchTerm + "  OR GenBank accession " +
                               TextConverter.convertMethods( method ) + " the term  " + searchTerm + "  yielded " );
            }
            search_criteria = buffer.toString();
        }
    }

    // returns the search criteria
    private String getSearchCriteria() { return search_criteria; }

    /*
    // sets the temp table name
    private void setTempTblName(String type, String session_id) {
        temp_tbl_name = MasterTableInfo.getFullTableName( search_type, session_id );
        //temp_tbl_name = "tempdb..polyallele_" + session_id;
    }

    // returns the temp table name
    private String getTempTblName() { return temp_tbl_name; }
    */

    // returns the list of tables in the from clause
    private ArrayList getTableList() { return tables; }

    private void emptyTableList() { tables = new ArrayList(); }

    // sets the the string that populates the requested map type column of the temp table
    //private void setMapTypeRequested( String map ) { map_str = map; }

    //** returns the string that populates the map_type_requested column of the temp table
    private String getMapTypeRequested() { return map_str; }

    //** sets the string that designates the position part of the select clause
    private void setPosition(String position) { position_str = position; }

    //** returns the string that designates the position part of the select clause
    private String getPosition() { return position_str; }

    //** sets the string that designates the units part of the select clause
    //** private void setUnits(String units) { units_str = units; }

    //** returns the string that designates the units part of the select clause
    private String getUnits() { return units_str; }

    // sets the map object of search params the user entered
    private void setParams( HashMap params ) { this.params = params; }

    // returns the map object of search params the user entered
    private HashMap getParams() { return params; }

    // sets whether or not SNP was chosen as a polymorphism type to search on -- special logic is required, if true
    private void setSNP( boolean is_SNP ) { this.is_SNP = is_SNP; }

    // returns whether or not SNP was chosen as a polymorphism type to search on -- special logic is required, if true
    private boolean isSNP() { return is_SNP; }

    // sets whether or not a Gene_MapElement.gene_feature_site should be searched vs Polymorphism.mutation_site
    // depending on what the user selected
    private void setGeneFeatureSite( boolean gene_feature_site ) { this.gene_feature_site = gene_feature_site; }

    // returns whether or not a Gene_MapElement.gene_feature_site should be searched vs Polymorphism.mutation_site
    // depending on what the user selected
    private boolean useGeneFeatureSite() { return gene_feature_site; }

    // sets whether or not a Gene_MapElement.gene_feature_site should be searched vs Polymorphism.mutation_site
    // depending on what the user selected
    private void setMutationSite( boolean mutation_site ) { this.mutation_site = mutation_site; }

    // returns whether or not a Gene_MapElement.gene_feature_site should be searched vs Polymorphism.mutation_site
    // depending on what the user selected
    private boolean useMutationSite() { return mutation_site; }

    // turns the search parameter entries into a sql search string that will be used for the search
    // this is sql generated for a search initiated through PolyAlleleSearchHandler and uses a temp table for results
    private String createSearchSQL( String queryID ) throws SQLException {
        // initial values of sql buffers
        select_clause = new StringBuffer(" SELECT DISTINCT" +
                                         " p.polymorphism_id AS id, p.name AS name, p.tair_object_id AS tair_object_id, " +
                                         " p.polymorphism_type AS polymorphism_type, p.chromosome AS chromosome, p.map_element_id AS map_element_id," +
                                         " p.is_allele AS is_allele, ");
        from_clause = new StringBuffer("FROM Polymorphism p JOIN Polymorphism p1 ON p.polymorphism_id = p1.ref_polymorphism_id ");
        where_clause = new StringBuffer ("WHERE p.is_obsolete = 'F' ");
        //where_clause = new StringBuffer("WHERE p.polymorphism_id = p1.ref_polymorphism_id AND p.is_obsolete = 'F' ");
        orderBy_clause = new StringBuffer(" ");

        // minimum tables to use for search
        // place table name in table list to use later to prevent multiple additions of tables to 'from clause'
        tables.add(new String(" Polymorphism p "));
        tables.add(new String(" , Polymorphism p1 "));
        // following methods append the from, where and order by clauses according to user options stored in getParams()
        applyOutputOptions();
        applySearchByName();
        applyRestrictByFeatures();
        applyTimeRestriction();
        applyRestrictByMapLocation();

        //** add on position, units, map type
        select_clause.append( getPosition() + getUnits() + getMapTypeRequested() );
        if (queryID != null && queryID != "") { 
            select_clause.append(", '" + queryID + "', CURRENT_DATE ");
        }else{
            select_clause.append(select_clause + ", '', '' ");
        }

        return ( select_clause.toString() + from_clause.toString() + where_clause.toString() + orderBy_clause.toString());
    }

  /**
   * Convert user-designated output options from JSP into an ORDER BY clause.
   */
  private void applyOutputOptions() {
    if (orderBy_clause == null) {
      orderBy_clause = new StringBuffer(" ");
    }
    String orderVal = (String)getParams().get("order");
    if (orderVal != null) {
      if (orderVal.equals("name"))
        orderBy_clause.append(" ORDER BY name");
      if (orderVal.equals("type"))
        orderBy_clause.append(" ORDER BY polymorphism_type");
      if (orderVal.equals("position")) {
        setPosition(" MIN( a.start_position ) AS position_requested, ");
        orderBy_clause.append(" GROUP BY p.polymorphism_id, p.name, p.tair_object_id, p.polymorphism_type, "
                              + " p.chromosome, p.map_element_id, p.is_allele ORDER BY position_requested");
      }
    }
  }

    /** The user gave us a phenotype string, we use it to restrict
     * the search for poly/allele hits. */
    private void applySearchByPhenotype( String phenotypeStr_withMethod )
    {
        if( phenotypeStr_withMethod != null && false == phenotypeStr_withMethod.trim().equals( "" ) )
        {
            //from_clause.append( ", Germp_MapEl_Pheno_wrk wrk " );
            from_clause.append(" JOIN Germp_MapEl_Pheno_wrk wrk ON p.map_element_id = wrk.map_element_id ");
            where_clause.append( "AND wrk.phenotype_uc LIKE " );
            where_clause.append( TextConverter.dbQuote( phenotypeStr_withMethod ) );
            where_clause.append( " ESCAPE '\\\' " );
            //where_clause.append( "AND p.map_element_id = wrk.map_element_id " );
        }
    }

    // convert user designated "Search By Name" options (parameters from form jsp) into additions to the 'from' and 'where'
    // clauses in the search sql
    private void applySearchByName() throws SQLException {
        generateNameSql( (String)getParams().get("name_type1"), (String)getParams().get("term1"), (String)getParams().get("method1") );
        generateNameSql( (String)getParams().get("name_type2"), (String)getParams().get("term2"), (String)getParams().get("method2") );
    }

    private void generateNameSql( String name_type_val, String name_term, String method ) throws SQLException {
        if ( name_term != null ) {
            String table_name = null;
            StringBuffer name_where_sql = new StringBuffer(" ");
            StringBuffer name_from_sql = new StringBuffer(" ");
            NameFinder nf = new NameFinder();
            if (name_type_val == null) {
              throw new IllegalArgumentException("Poly-Allele Searcher passed null name type to SQL name generation");
            } else if ( name_type_val.equals( "gene_name" ) ) {
                nf.setNameFinder( "Gene", "gene_id", name_term, method );
                if ( nf.getNameSql() != null ) {
                    table_name = " , Gene_MapElement gme ";
                    if ( !getTableList().contains( table_name ) ) {
                        getTableList().add( table_name );
                        name_from_sql.append(" JOIN Gene_MapElement gme ON p1.map_element_id = gme.map_element_id "); 
                        //name_from_sql.append( table_name );
                        //name_where_sql.append( " AND p1.map_element_id = gme.map_element_id " );
                    }
                    name_where_sql.append( " AND gme.gene_id IN " + nf.getNameSql() );
                }
            } else if ( name_type_val.equals( "name" ) ) {
                table_name = " , PolymorphismNameAlias pna ";
                if ( !getTableList().contains(table_name) ) {
                    getTableList().add( table_name );
                    name_from_sql.append(" JOIN PolymorphismNameAlias pna ON p1.polymorphism_id = pna.polymorphism_id ");
                    //name_from_sql.append( table_name );
                    //name_where_sql.append( " AND p1.polymorphism_id = pna.polymorphism_id " );
                }
                name_where_sql.append( " AND pna.name LIKE " );
                name_where_sql.append( TextConverter.dbQuote(TextConverter.convertEnds( name_term.toUpperCase(), method ) ) );
                name_where_sql.append(" ESCAPE '\\\'");
            } else if ( name_type_val.equals("locus_name") ) {
                nf.setNameFinder( "Locus", "locus_id", name_term, method );
                if ( nf.getNameSql() != null ) {
                    table_name = " , MapElement_Locus mel ";
                    if ( !getTableList().contains( table_name ) ) {
                        getTableList().add( table_name );
                        name_from_sql.append(" JOIN MapElement_Locus mel ON p1.map_element_id = mel.map_element_id ");
                        //name_from_sql.append( table_name );
                        //name_where_sql.append( " AND p1.map_element_id = mel.map_element_id " );
                    }
                    name_where_sql.append( " AND mel.locus_id IN " + nf.getNameSql() );
                }
            } else if ( name_type_val.equals( "phenotype" ) ) {
                String phenotypeStr_withMethod = TextConverter.convertEnds( name_term.toUpperCase(), method );
                applySearchByPhenotype( phenotypeStr_withMethod );
            } else if ( name_type_val.equals( "submitter" ) ) {
                table_name = " , Attribution att ";
                if ( !getTableList().contains(table_name) ) {
                    getTableList().add( table_name );
                    name_from_sql.append(" JOIN Attribution att ON p1.tair_object_id = att.tair_object_id ");
                    //name_from_sql.append( table_name );
                    //name_where_sql.append( " AND p1.tair_object_id = att.tair_object_id " );
                }
                table_name = " , AttributionType aty ";
                if ( !getTableList().contains(table_name) ) {
                    getTableList().add( table_name );
                    name_from_sql.append(" JOIN AttributionType aty ON att.attribution_type_id = aty.attribution_type_id ");
                    //name_from_sql.append( table_name );
                    //name_where_sql.append( " AND att.attribution_type_id = aty.attribution_type_id " );
                }
                table_name = " , Community c ";
                if ( !getTableList().contains(table_name) ) {
                    getTableList().add( table_name );
                    name_from_sql.append(" JOIN Community c ON att.community_id = c.community_id AND c.is_obsolete = 'F' ");
                    name_from_sql.append(" AND c.status = " + TextConverter.dbQuote(DataConstants.getActiveStatus()));
                    //name_from_sql.append( table_name );
                    //name_where_sql.append( " AND att.community_id = c.community_id " );
                    //name_where_sql.append( " AND c.is_obsolete = 'F' " );
                    //name_where_sql.append( " AND c.status = " + TextConverter.dbQuote(DataConstants.getActiveStatus()) );
                }
                name_where_sql.append( " AND aty.attribution_type = 'submitted_by' " );
                table_name = " , Person pe ";
                if ( !getTableList().contains( table_name ) ) {
                    getTableList().add( table_name );
                    name_from_sql.append(" JOIN Person pe ON att.community_id = pe.community_id AND c.community_id = pe.community_id ");
                    //name_from_sql.append( table_name );
                    //name_where_sql.append( " AND att.community_id = pe.community_id " );
                    //name_where_sql.append( " AND c.community_id = pe.community_id " );
                }
                name_where_sql.append( " AND pe.last_name_uc LIKE " );
                name_where_sql.append( TextConverter.dbQuote(TextConverter.convertEnds( name_term.toUpperCase(), method ) ) );
                name_where_sql.append( " ESCAPE '\\\' " );
            } else if ( name_type_val.equals( "submitter_org" ) ) {
                table_name = " , Attribution att ";
                if ( !getTableList().contains(table_name) ) {
                    getTableList().add( table_name );
                    name_from_sql.append(" JOIN Attribution att ON p1.tair_object_id = att.tair_object_id ");
                    //name_from_sql.append( table_name );
                    //name_where_sql.append( " AND p1.tair_object_id = att.tair_object_id " );
                }
                table_name = " , AttributionType aty ";
                if ( !getTableList().contains(table_name) ) {
                    getTableList().add( table_name );
                    name_from_sql.append(" JOIN AttributionType aty ON att.attribution_type_id = aty.attribution_type_id ");
                    //name_from_sql.append( table_name );
                    //name_where_sql.append( " AND att.attribution_type_id = aty.attribution_type_id " );
                }
                table_name = " , Community c ";
                if ( !getTableList().contains(table_name) ) {
                    getTableList().add( table_name );
                    name_from_sql.append(" JOIN Community c ON att.community_id = c.community_id AND c.is_obsolete = 'F' ");
                    name_from_sql.append(" AND c.status = " + TextConverter.dbQuote(DataConstants.getActiveStatus()) );
                    //name_from_sql.append( table_name );
                    //name_where_sql.append( " AND att.community_id = c.community_id " );
                    //name_where_sql.append( " AND c.is_obsolete = 'F' " );
                    //name_where_sql.append( " AND c.status = " + TextConverter.dbQuote(DataConstants.getActiveStatus()) );
                }
                name_where_sql.append( " AND aty.attribution_type = 'submitted_by' " );
                table_name = " , Organization o ";
                if ( !getTableList().contains( table_name ) ) {
                    getTableList().add( table_name );
                    name_from_sql.append(" JOIN Organization o ON att.community_id = o.community_id AND c.community_id = o.community_id ");
                    //name_from_sql.append( table_name );
                    //name_where_sql.append( " AND att.community_id = o.community_id " );
                    //name_where_sql.append( " AND c.community_id = o.community_id " );
                }
                name_where_sql.append( " AND o.name_uc LIKE " );
                name_where_sql.append( TextConverter.dbQuote(TextConverter.convertEnds( name_term.toUpperCase(), method ) ) );
                name_where_sql.append( " ESCAPE '\\\' " );
            } else if ( name_type_val.equals( "vector_name" ) ) {
                nf.setNameFinder( "Vector", "vector_id", name_term, method );
                if ( nf.getNameSql() != null ) name_where_sql.append( " AND p1.vector_id IN " + nf.getNameSql() );
            } else if ( name_type_val.equals("clone_name" ) ) {
                nf.setNameFinder( "Clone", "clone_id", name_term, method );
                if ( nf.getNameSql() != null ) name_where_sql.append( " AND p1.clone_id IN " + nf.getNameSql() );
            } else if ( name_type_val.equals( "accession" ) ) {
                table_name = " , GenBankAccession_wrk gba ";
                if ( !getTableList().contains(table_name) ) {
                    getTableList().add( table_name );
                    name_from_sql.append(" JOIN GenBankAccession_wrk gba ON p1.map_element_id = gba.map_element_id ");
                    name_from_sql.append(" AND gba.map_element_type = 'polymorphism'");
                    //name_from_sql.append( table_name );
                    //name_where_sql.append( " AND p1.map_element_id = gba.map_element_id" +
                    //        " AND gba.map_element_type = 'polymorphism'" );
                }
                name_where_sql.append( " AND gba.ic_accession LIKE " );
                name_where_sql.append( TextConverter.dbQuote(TextConverter.convertEnds( name_term.toUpperCase(), method ) ) );
                name_where_sql.append( " ESCAPE '\\\' " );
            }
            from_clause.append( name_from_sql );
            where_clause.append( name_where_sql );
        }
    }

    // convert user designated "Restrict By Features" options (parameters from form jsp) into additions to the 'from'
    // and 'where' clauses in the search sql
    private void applyRestrictByFeatures() {
        if ( getParams().get("poly_type") != null ) processMultiSelectFeature("poly_type");
        if ( getParams().get("poly_site") != null ) processMultiSelectFeature("poly_site");
        if ( getParams().get("insertion_type") != null ) processMultiSelectFeature("insertion_type");
        if ( getParams().get("mutagen") != null ) processMultiSelectFeature("mutagen");
        //if ( getParams().get("allele_mode") != null ) processMultiSelectFeature("allele_mode");
        if ( getParams().get("transgene") != null ) processMultiSelectFeature("transgene");
        processCheckBoxFeatures();
        processRadioButtonFeatures();
        processPolyBetween();
        if ( getParams().get("inheritance") != null ) processSingleSelectFeatures("inheritance");
    }

    // build the sql for the multiple selection drop down menu for the supplied feature type
    private void processMultiSelectFeature(String feature_type) {
        String predicate = getMultiSelectorPredicate((String[]) getParams().get(feature_type));
        if (predicate.equals(" ANY")){
        } else {
            where_clause.append(getFeatureQualifier(feature_type));
            if ( feature_type.equals("poly_site") ) {
                if ( useMutationSite() && !useGeneFeatureSite() ) {
                    // only mutation site , intergenic_region, selected
                    // need to reset the predicate with = 'intergenic_region'
                    predicate = " = 'intergenic_region' ";
                }
            }
            where_clause.append(predicate);
            // if poly_type = SNP, value on form is 'substitution' so this will be part of the IN clause, however,
            // we need add type = 'insertion' plus insertion_type = 'short' to the where clause
            if ( feature_type.equals("poly_type") && isSNP() ) {
                where_clause.append(" OR ( p1.polymorphism_type = 'insertion' AND p1.insertion_type = 'short' ) " );
            }
            if ( feature_type.equals("poly_type") ) where_clause.append(" ) " );
            if ( feature_type.equals("poly_site") ) {
                if ( useGeneFeatureSite() && useMutationSite() ) {
                    where_clause.append(" OR ( p1.mutation_site = 'intergenic_region' ) ) " );
                }
            }
        }
    }

    // build the sql for the predicate part of the 'where' clause based on selected features for a particular feature type
    private String getMultiSelectorPredicate(String[] features) {
        StringBuffer in_buffer = new StringBuffer(" IN (  ");
        boolean is_any = false;
        for ( int i = 0; i < features.length; i ++) {
            if ( i > 0 ) in_buffer.append(" , ");
            if (features[i].equals("any")) {
                is_any = true;
            } else {
                // poly_type = SNP, include 'substitution' so this will be part of the IN clause, however,
                // we need to flag this so 'insertion' plus insertion_type = 'short' is added to the where clause
                if (features[i].equals("SNP")) {
                    in_buffer.append(TextConverter.dbQuote("substitution"));
                    in_buffer.append(" , ");
                    setSNP( true );
                }
                if (features[i].equals("ionizing radiation")) {
                    // mutagen = ionizing radiation which has a value of ionizing radiation should include
                    // HZE C, HZE Kr, HZE Ne, HZE U in the IN clause
                    in_buffer.append(TextConverter.dbQuote("HZE C"));
                    in_buffer.append(" , ");
                    in_buffer.append(TextConverter.dbQuote("HZE Kr"));
                    in_buffer.append(" , ");
                    in_buffer.append(TextConverter.dbQuote("HZE Ne"));
                    in_buffer.append(" , ");
                    in_buffer.append(TextConverter.dbQuote("HZE U"));
                    in_buffer.append(" , ");
                }
                if (features[i].equals("intergenic_region")) {
                    // poly site = intergenic_region, useMutationSite = T, use Polymorphism.mutation_site = 'intergenic_region'
                    // poly site = other values, useGeneFeatureSite = T, use Gene_MapElement.gene_feature_site IN list
                    setMutationSite( true );
                    if ( features.length == 1 ) setGeneFeatureSite( false );
                }
                in_buffer.append(TextConverter.dbQuote(features[i]));
            }
        }
        if (!is_any) {
            in_buffer.append(" ) ");
        } else {
            in_buffer.replace(1, in_buffer.length(), "ANY");
        }
        return (new String(in_buffer));
    }

    // build the sql for the 'from' and 'where' clauses based on a particular feature type
    private String getFeatureQualifier(String feature_type) {
        String featureQualifier = null;
        String table_name = null;
        // where_clause.append(" AND ");
        if (feature_type.equals("poly_type")) featureQualifier = " AND ( p1.polymorphism_type ";
        if (feature_type.equals("poly_site")) {
            if ( useGeneFeatureSite() && !useMutationSite() ) {
                table_name = " , Gene_MapElement gme ";
                if (!getTableList().contains(table_name)) {
                    getTableList().add(table_name);
                    from_clause.append(" JOIN Gene_MapElement gme ON p1.map_element_id = gme.map_element_id " );
                    //from_clause.append(table_name);
                    //where_clause.append(" AND p1.map_element_id = gme.map_element_id ");
                }
                featureQualifier = " AND gme.gene_feature_site ";
            }
            if ( useGeneFeatureSite() && useMutationSite() ) {
                table_name = " , Gene_MapElement gme ";
                if (!getTableList().contains(table_name)) {
                    getTableList().add(table_name);
                    from_clause.append(" JOIN Gene_MapElement gme ON p1.map_element_id = gme.map_element_id " );
                    //from_clause.append(table_name);
                    //where_clause.append(" AND p1.map_element_id = gme.map_element_id ");
                }
                featureQualifier = " AND ( gme.gene_feature_site ";
            }
            if ( !useGeneFeatureSite() && useMutationSite() ) {
                featureQualifier = " AND p1.mutation_site ";
            }
        }
        if (feature_type.equals("insertion_type")) featureQualifier = " AND p1.polymorphism_type = 'insertion' AND p1.insertion_type ";
        if (feature_type.equals("mutagen")) featureQualifier = " AND p1.mutagen ";
        //if (feature_type.equals("allele_mode")) featureQualifier = " AND p1.allele_mode ";
        if (feature_type.equals("transgene")) {
            table_name = " , Clone c ";
            if (!getTableList().contains(table_name)) {
                getTableList().add(table_name);
                from_clause.append(" JOIN Clone c ON p1.clone_id = c.clone_id ");
                //from_clause.append(table_name);
                //where_clause.append(" AND p1.clone_id = c.clone_id ");
            }
            featureQualifier = " AND c.construct_type ";
        }
        if (feature_type.equals("inheritance")) featureQualifier = " AND p1.inheritance ";
        return featureQualifier;
    }

    // build the sql for the 'from' and 'where' clauses based on the selected check box features
    private void processCheckBoxFeatures() {
        if ((String)getParams().get("has_marker") != null) {
            if (((String)getParams().get("has_marker")).equals("true")) {
                where_clause.append(" AND p1.genetic_marker_id > 0 ");
            }
        }
        if ((String)getParams().get("has_observable_phenotype") != null) {
            if (((String)getParams().get("has_observable_phenotype")).equals("true")) {
                where_clause.append(" AND p1.has_observable_phenotype = 'T' ");
            }
        }
        /*if ((String)getParams().get("has_ABRC_stock") != null) {
          // needs to change !!!!!!!, currently deactivated
          if (((String)getParams().get("has_ABRC_stock")).equals("true")) {
          String table_name = " , Stock s ";
          if (!getTableList().contains(table_name)) {
          getTableList().add(table_name);
          from_clause.append(table_name);
          where_clause.append(" AND p1.tair_object_id = s.tair_object_id ");
          }
          where_clause.append(" AND ( s.is_obsolete = 'F' OR s.is_obsolete is NULL )");
          }
          }*/
    }

  // build the sql for the 'from' and 'where' clauses based on the selected
  // ecotypes for the polymorphic between feature
  private void processPolyBetween() {
    String low_ecotype = (String)getParams().get("ecoLow");
    String high_ecotype = (String)getParams().get("ecoHi");
    if (low_ecotype != null && high_ecotype != null) {
      if (!low_ecotype.equalsIgnoreCase("any")
          && !high_ecotype.equalsIgnoreCase("any")) {
        from_clause.append(" JOIN ");
        from_clause.append(" (select HP.polymorphism_id ");
        from_clause.append(" From Polymorphism LP,Polymorphism_SpeciesVariant LPS, SpeciesVariant LSV, ");
        from_clause.append(" Polymorphism HP,Polymorphism_SpeciesVariant HPS, SpeciesVariant HSV ");
        from_clause.append(" WHERE LP.polymorphism_id = LPS.polymorphism_id AND LPS.species_variant_id = LSV.species_variant_id AND ");
        from_clause.append(" HP.polymorphism_id = HPS.polymorphism_id AND HPS.species_variant_id = HSV.species_variant_id AND ");
        from_clause.append(" ((LSV.name = "
                           + TextConverter.dbQuote(low_ecotype)
                           + " AND HSV.name = "
                           + TextConverter.dbQuote(high_ecotype)
                           + ") ");
        from_clause.append(" OR (LSV.name = "
                           + TextConverter.dbQuote(high_ecotype)
                           + " AND HSV.name = "
                           + TextConverter.dbQuote(low_ecotype)
                           + ")) ");
        from_clause.append(" AND HP.ref_polymorphism_id = LP.ref_polymorphism_id AND NOT HP.polymorphism_id = LP.polymorphism_id) ");
        from_clause.append(" p2 ON p1.polymorphism_id = p2.polymorphism_id ");
      } else if (!low_ecotype.equalsIgnoreCase("any")
                 && high_ecotype.equalsIgnoreCase("any")) {
        from_clause.append(", Polymorphism LP, Polymorphism_SpeciesVariant LPS, SpeciesVariant LSV ");
        where_clause.append(" AND p1.polymorphism_id = LP.polymorphism_id "
                            + " AND (( LP.polymorphism_id = LPS.polymorphism_id "
                            + " AND LPS.species_variant_id = LSV.species_variant_id "
                            + " AND LSV.name = "
                            + TextConverter.dbQuote(low_ecotype)
                            + ") ");
        where_clause.append(" ) ");
      } else if (low_ecotype.equalsIgnoreCase("any")
                 && !high_ecotype.equalsIgnoreCase("any")) {
        from_clause.append(", Polymorphism HP, Polymorphism_SpeciesVariant HPS, SpeciesVariant HSV ");
        where_clause.append(" AND ( HP.polymorphism_id = HPS.polymorphism_id "
                            + " AND HPS.species_variant_id = HSV.species_variant_id "
                            + " AND HSV.name = "
                            + TextConverter.dbQuote(high_ecotype)
                            + ") ");
        where_clause.append(" AND p1.polymorphism_id = HP.polymorphism_id ");
      }
    }
    }

    // build the sql for the single selection drop down menu for the supplied feature type
    private void processSingleSelectFeatures(String feature_type) {
        String predicate = getSingleSelectorPredicate((String) getParams().get(feature_type));
        if (predicate.equals(" ANY")){
        } else {
            where_clause.append(getFeatureQualifier(feature_type));
            where_clause.append(predicate);
        }
    }

    // build the sql for the predicate part of the 'where' clause based on the selected feature for a particular feature type
    private String getSingleSelectorPredicate(String feature) {
        String predicate = null;
        if (feature.equals("any")) {
            predicate = " ANY";
        } else {
            predicate = " = " + TextConverter.dbQuote(feature);
        }
        return predicate;
    }

  /**
   * Based on the radio button features, build the SQL expressions for the
   * WHERE clause that specify whether to query for alleles or not. If the
   * radio button feature is null, assume both (no WHERE-clause expression).
   */
  private void processRadioButtonFeatures() {
    String allele = (String)getParams().get("allele");
    if (allele != null && allele.equals("is")) {
      where_clause.append(" AND p1.is_allele = 'T' ");
    } else if (allele != null && allele.equals("not")) {
      where_clause.append(" AND ( p1.is_allele = 'F' OR p1.is_allele IS NULL ) ");
    }
  }

    // convert user designated "Search By Time Restriction" option (parameters from form jsp) into additions to the
    //  'from' and 'where' clauses in the search sql
    private void applyTimeRestriction() {
        if ((String)getParams().get("limit_time") != null) {
            java.util.Date today = new java.util.Date();
            if (((String)getParams().get("limit_time")).equals("60")) {
                where_clause.append(" AND p1.date_last_modified > " + TextConverter.dbQuote(today, "mm/dd/yyyy") + " -60 ");
                //dateadd(dd, -60, " + TextConverter.dbQuote( TextConverter.dateToString( today ) ) + " ) ");
            }
        }
    }

    // convert user designated "Restrict By Map Location" options (parameters from form jsp) into additions to the 'from'
    // and 'where' clauses in the search sql
    private void applyRestrictByMapLocation() throws SQLException {
        // check chromosome field
        // use value from search form if it's there
        String chromosome = (String)getParams().get( "chromosome" );
        String table_name = null;
        boolean add_end = false;

        // logic from GeneticMarkerSearcher
        // translate assignments from input, directly on map, to db values which
        // are on another MapElement (not necessarily Map)
        Units units = null;
        String map_type = (String)getParams().get( "map_type" );
        
        // make sure units is null unless valid input is received
        if ( Units.validMapType( map_type ) ) {
            DBconnection conn = null;
            try {
                conn = getConnection();

                try {
                    units = new Units( conn, getParams() );
                } catch ( InvalidFormException ife ) {
                    //          ife.printStackTrace();
                    throw new SQLException( "InvalidFormException: " + ife.getMessage() );
                }
            } finally {
                if ( conn != null ) returnConnection( conn );
            }
            // append tables needed for map location restriction logic
            // is table name in list? we don't want duplicate tables in from clause
            table_name = " , GlobalAssignment a ";
            if (!getTableList().contains(table_name)) {
                getTableList().add(table_name);
                from_clause.append( " JOIN (SELECT ga.map_element_id, ga.start_position FROM GlobalAssignment ga, Map MP ");
                from_clause.append(" WHERE ga.is_obsolete = 'F' AND ga.map_id = MP.map_id ");
                add_end = true;
                //where_clause.append(" AND a.map_element_id = p1.map_element_id  ");
                //where_clause.append(" AND a.is_obsolete != 'T' ");
            }
            
            // check see if chromosome value for results of map location
            // search should be used to restrict results -- if so, chromosome
            // value from search form (retrieved above) should be null
            if ( units.useAssignmentChromosome() ) {
                //table_name = " , Map MP ";
                //if ( !getTableList().contains( table_name ) ) {
                 //   getTableList().add( table_name );
                 //   from_clause.append( table_name );
                 //   where_clause.append(" AND a.map_id = MP.map_id ");
                //}
                //where_clause.append( " AND MP.chromosome = " + TextConverter.dbQuote(units.getAssignmentChromosome()) + " " );
                from_clause.append( " AND MP.chromosome = " + TextConverter.dbQuote(units.getAssignmentChromosome()) + " " );
            }
        
            if ( chromosome != null ) {
                //table_name = " , Map MP ";
                //if ( !getTableList().contains( table_name ) ) {
                //    getTableList().add( table_name );
                //    from_clause.append( table_name );
                //    where_clause.append(" AND a.map_id = MP.map_id ");
                //}
                //where_clause.append( " AND MP.chromosome = " + TextConverter.dbQuote(chromosome) + " " );
                from_clause.append( " AND MP.chromosome = " + TextConverter.dbQuote(chromosome) + " " );
            }
        }
        if ( units != null && map_type != null ) {
            Double start = units.get_start();
            Double end = units.get_end();
            String low_unit = units.get_low_unit();
            String high_unit = units.get_high_unit();
            if ( start != null && low_unit != null ) {
                if ( low_unit.equalsIgnoreCase( "cm" ) && high_unit.equalsIgnoreCase("cm" )) {
                    from_clause.append( " AND  " +
                        " ((ga.start_position >= " + start + " AND ga.end_position <= " + end + ") OR "+
                        " (ga.start_position >= " + end + " AND ga.end_position <= " + start + " )) "+
                        " AND ga.units = 'cm' ");
                } else if ( low_unit.equalsIgnoreCase( "kb" ) && high_unit.equalsIgnoreCase("kb")) {
                    //where_clause.append( " AND ( " +
                    from_clause.append( " AND  " +
                        " ((ga.start_position >= CASE WHEN ga.units = 'kb' THEN " + start + 
                        " WHEN ga.units = 'bp' THEN " + start.doubleValue() * 1000 + " END AND " + 
                        " ga.end_position <= CASE WHEN ga.units = 'kb' THEN " + end + 
                        " WHEN ga.units = 'bp' THEN " + end.doubleValue() * 1000 + " END) OR " + 
                        " (ga.end_position >= CASE WHEN ga.units = 'kb' THEN " + start + 
                        " WHEN ga.units = 'bp' THEN " + start.doubleValue() * 1000 + " END AND " + 
                        " ga.start_position <= CASE WHEN ga.units = 'kb' THEN " + end + 
                        " WHEN ga.units = 'bp' THEN " + end.doubleValue() * 1000 + " END)) ");
                // otherwise either start will be null or end will be null. so check both sides
                } else if ( ( (start != null && low_unit != null) && (end == null && high_unit == null) ) ||
                    ( ( end != null && high_unit != null ) && (start == null && low_unit == null ) ) ){
                    if ( low_unit.equalsIgnoreCase( "cm" ) ) {
                        from_clause.append( " AND ( a.start_position >= " + start +
                            " OR a.end_position >= " + start +
                            " ) AND a.units = 'cM' " );
                     } else if ( low_unit.equalsIgnoreCase( "kb" ) ) {
                        from_clause.append( " AND " + 
                            " ((ga.start_position >= CASE WHEN ga.units = 'kb' THEN " + start +
                            " WHEN ga.units = 'bp' THEN " + start.doubleValue() * 1000 + " END ) OR " + 
                            " (ga.end_position >= CASE WHEN ga.units = 'kb' THEN " + start +
                            " WHEN ga.units = 'bp' THEN " + start.doubleValue() * 1000 + " END )) ");
                    }
                }
            }
        }
        if (add_end == true){
            from_clause.append( ") a ON a.map_element_id = p1.map_element_id ");
        }
    }

    // convert user specified search criteria into additions to the 'where'
    // clause for the general search sql -- both counts and temp table sql
    private void applyGeneralSearchParams() throws SQLException {
        String search_term = null;
        String search_method = null;
        if ( ( String )getParams().get( "searchTerm" ) != null ) {
            // search PolymorphismAlias table
            search_term = ( String )getParams().get( "searchTerm" );
            search_method = ( String )getParams().get( "method" );
            general_where_1.append( " AND pna.name LIKE " );
            general_where_1.append( TextConverter.dbQuote(TextConverter.convertEnds( search_term.toUpperCase(), search_method ) ) );
            general_where_1.append( " ESCAPE '\\\' " );
            general_where_2.append( " AND gba.ic_accession LIKE " );
            general_where_2.append( TextConverter.dbQuote(TextConverter.convertEnds( search_term.toUpperCase(), search_method ) ) );
            general_where_2.append( " ESCAPE '\\\' " );
        }
    }

    // turns the search parameter entries into a sql search string that will be used for the search
    // this is sql generated for a search initiated through GeneralSearchHandler and uses a temp table for results
    // also uses a union to obtain search results against name and ic_accession
    private String createGeneralSearchSQL( String queryID ) throws SQLException {
        StringBuffer union_sql = new StringBuffer();
        // initial values of sql buffers
        select_clause = new StringBuffer(" SELECT p.polymorphism_id AS id, p.name AS name," +
                                         " p.tair_object_id AS tair_object_id, p.polymorphism_type AS polymorphism_type, p.chromosome AS chromosome," +
                                         " p.map_element_id AS map_element_id, p.is_allele AS is_allele, ");
        select_clause.append( getPosition() + getUnits() + getMapTypeRequested() );
        if (queryID != null && queryID != "") { 
            select_clause.append(", '" + queryID + "', CURRENT_DATE ");
        }else{
            select_clause.append(", '', '' ");
        }  
        
        // general_from_clause_1 and general_from_clause_2 are used in the union
        general_from_clause_1 = " FROM Polymorphism p, Polymorphism p1, PolymorphismNameAlias pna ";
        general_from_clause_2 = " FROM Polymorphism p, Polymorphism p1, GenBankAccession_wrk gba ";
        general_where_1 = new StringBuffer("WHERE p.polymorphism_id = p1.ref_polymorphism_id AND p.is_obsolete = 'F' ");
        general_where_1.append( " AND p1.polymorphism_id = pna.polymorphism_id " );
        general_where_2 = new StringBuffer("WHERE p.polymorphism_id = p1.ref_polymorphism_id AND p.is_obsolete = 'F' ");
        general_where_2.append( "AND p1.map_element_id = gba.map_element_id AND gba.map_element_type = 'polymorphism' " );
        orderBy_clause = new StringBuffer(" ORDER BY name ");

        applyGeneralSearchParams();

        // builds the textual representation of the requested search params -- currently done in the handler
        // for the searches invoked from the PolyAlleleSearchHandler
        setSearchCriteria();

        union_sql.append( select_clause.toString() );
        union_sql.append( general_from_clause_1.toString() );
        union_sql.append( general_where_1.toString() );
        union_sql.append( " UNION " );
        union_sql.append( select_clause.toString() );
        union_sql.append( general_from_clause_2.toString() );
        union_sql.append( general_where_2.toString() );
        union_sql.append( orderBy_clause.toString() );
        return union_sql.toString();
    }

    // turns the search parameter entries into a sql count string that will be used for the search
    // this is sql generated for a search initiated through GeneralSearchHandler and uses union for count results
    private String createCountSQL() throws SQLException {
        StringBuffer union_sql = new StringBuffer();
        // initial values of sql buffers
        count_select_clause = " SELECT DISTINCT p.polymorphism_id AS poly_id ";
        // general_from_clause_1 and general_from_clause_2 are used in the union
        general_from_clause_1 = " FROM Polymorphism p, Polymorphism p1, PolymorphismNameAlias pna ";
        general_from_clause_2 = " FROM Polymorphism p, Polymorphism p1, GenBankAccession_wrk gba ";
        general_where_1 = new StringBuffer("where p.polymorphism_id = p1.ref_polymorphism_id AND p.is_obsolete = 'F' ");
        general_where_1.append( " AND p1.polymorphism_id = pna.polymorphism_id " );
        general_where_2 = new StringBuffer("where p.polymorphism_id = p1.ref_polymorphism_id AND p.is_obsolete = 'F' ");
        general_where_2.append( "AND p1.map_element_id = gba.map_element_id AND gba.map_element_type = 'polymorphism' " );
        applyGeneralSearchParams();

        // builds the textual representation of the requested search params -- currently done in the handler
        // for the searches invoked from the PolyAlleleSearchHandler
        setSearchCriteria();

        union_sql.append( count_select_clause );
        union_sql.append( general_from_clause_1.toString() );
        union_sql.append( general_where_1.toString() );
        union_sql.append( " UNION " );
        union_sql.append( count_select_clause );
        union_sql.append( general_from_clause_2.toString() );
        union_sql.append( general_where_2.toString() );
        return union_sql.toString();
    }

    // invokes a method to write the results of the search sql to the temp table
    private void processSearch( String queryID ) throws SQLException {
        if ( isGeneral() && countsOnly() ) {
            executeQuery( createCountSQL() );
        } else if ( isGeneral() ) {
            writeToTempTbl( createGeneralSearchSQL( queryID ), queryID );
        } else {
            writeToTempTbl( createSearchSQL( queryID ), queryID );
        }
    }
    private String getDelete( String queryID ) { 
        return "DELETE FROM RESULT_POLYALLELE WHERE QUERY_ID = '" + queryID + "'";
    }

    private String getInsertClause() { 
        return "INSERT /*+ APPEND */ INTO RESULT_POLYALLELE ";
    }
    private String getTableColumns() {
        String columns = 
            "id, " +
            "name, " + 
            "tair_object_id, " + 
            "polymorphism_type, " +
            "chromosome, " +
            "map_element_id, " +
            "is_allele, " +
            "position_requested, " +
            "units_requested, " +
            "map_type_requested, " +
            "query_id, " +
            "date_last_queried ";
        return columns;
    }

    // writes search results to temp table
    private void writeToTempTbl( String stmt, String query_id ) throws SQLException {
        Debugger.println( Debugger.logMsg( this, "writeToTempTbl, SQL = " + stmt ) );
        DBconnection conn = null;
        try {
            conn = getConnection();
            
            //do preliminary table drops first. should never get here but just inc ase
            String del_query = getDelete( query_id );
            conn.setQuery( del_query );
            conn.executeUpdate();
            conn.releaseResources();
            
            //populate temp table w/ results
            String insert_query = getInsertClause() + "(" + getTableColumns() + ") " + stmt;
            System.out.println("insert query : " + insert_query );
            conn.setQuery( insert_query );
            conn.executeUpdate();
        } finally {
            if ( conn != null ) returnConnection( conn );
        }
    }

    // executes count sql, tallies up the count
    private void executeQuery( String stmt ) throws SQLException {
        //java.lang.System.out.println( "? = " + stmt );
        Debugger.println( Debugger.logMsg( this, "executeQuery, SQL = " + stmt ) );
        int results_count = 0;
        DBconnection conn = null;
        try {
            conn = getConnection();
            conn.setQuery( stmt );
            ResultSet results = conn.getResultSet();
            while ( results.next() ) {
                results_count ++;
            }
        } finally {
            if ( conn != null ) returnConnection( conn );
        }
        setResultSize( results_count );
    }

    /*     main method for stand alone test
     */

    public static void main(String[] args){

    }

}


