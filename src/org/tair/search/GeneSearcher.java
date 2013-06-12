// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.84 $
// $Date: 2006/03/15 22:15:53 $
// ------------------------------------------------------------------------------

package org.tair.search;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.Vector;

import org.tair.querytools.AnnotationCount;
import org.tair.querytools.AnnotationCountPopulator;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAnnotationType;
import org.tair.tfc.TfcGeneSymbolReference;
import org.tair.tfc.TfcKeyword;
import org.tair.tfc.TfcKeywordType;
import org.tair.tfc.TfcLocus;
import org.tair.tfc.TfcSymbol;
import org.tair.utilities.ScrollCalculator;
import org.tair.utilities.ScrollParams;
import org.tair.utilities.SearchResultsCollection;
import org.tair.utilities.TextConverter;


/**
 * GeneSearcher retrieves genes according to submitted search parameters. Search
 * results are stored in a temp table created for a particular user, and are
 * then returned one page at a time. GeneSearcher only inserts and selects from
 * temp table; creating, deleting and dropping table is done by
 * <code>SearchSession</code>. GeneSearcher retrieves the relevant table name to
 * use by querying <code>MasterTableInfo</code>.
 * 
 * <p>
 * GeneSearcher receives search parameters as retrieved from web submission by
 * <code>GeneSearchHandler</code>.
 * <p>
 * GeneSearcher additionally receives search parameters as received through
 * <code>GeneralSearchHandler</code>.
 * 
 * <p>
 * GeneSearcher implements GeneralSearcher interface so that it can be used by
 * GeneralSearchHandler to carry out gene searches as part of the general
 * search.
 * <p>
 * GeneSearcher implements AnnotationTypeSearcher interface so that it can be
 * used by GeneralSearchHandler to carry out gene searches as a link off
 * associated data count displays on various pages such as keyword_summary.jsp,
 * tree_viewer_kw.jsp, and keyword_detail.jsp.
 * 
 * mhm - modify to include obsolete genes in the search mhm - modify to display
 * all gene models associated to loci that match gene criteria - this is done in
 * all cases EXCEPT where the gene results is linked to from the tree view
 * counts for genes - in this case it only shows the genes that are reflected in
 * the displayed count field - this is found in the method required by interface
 * AnnotationTypeSearcher mhm - provide for linking from goslim results set with
 * the same input ( list of loci in stored in a temp table ) used for the goslim
 * search. the temp table that holds the loci is managed the same way the
 * results set temp tables are managed. the table name is Result_locigoslim
 * parameters used to indicate results should be generated for the linkfrom
 * goslim are: origin and slim_name mhm - merge changes made by dcw to handle
 * the new assignment table structure
 */

public class GeneSearcher implements GeneralSearcher, AnnotationTypeSearcher {

  // used for keyword search string highlighting
  private String keywordSearchString;
  private String extdb_id;
  private boolean isExact = false;
  private Boolean isObsolete;
  private String origin;
  private String originQueryID;
  private String slimName;

  /**
   * Creates an instance of GeneSearcher
   */
  public GeneSearcher() {
  }

  /**
   * Searches genes and returns a collection of genes for display on the gene
   * summary page. If this is the first search (i.e. if firstSearch is true), a
   * SQL query is created to retrieve genes according to submitted search
   * parameters and stores them in a temp table before returning the intial page
   * of results as defined by scroll parameters. On subsequent requests (when
   * firstSearch is false), results are assumed to already be in temp table and
   * the requested slice of the result set, as defined by scroll parameters, is
   * returned.
   * 
   * @param conn An active connection to the database
   * @param searchParams Search criteria submitted through the web search form,
   *          stored as field name as a <code>String</code> key referencing the
   *          search value.
   * @param scrollParams Scroll parameters to use when scrolling through
   *          multiple pages of results
   * @param firstSearch If <code>true</code>, execute full search and save
   *          results in temp table; if <code>false</code> assume results are
   *          already in temp table and return requested page of result set.
   * @return Gene search results as an <code>SearchResultsCollection</code>
   *         containing a vector of arrays of <code>GeneSummary</code> objects,
   *         where each element of the vector represents one locus that may have
   *         several individual genes associated with it.
   * @exception SQLException thrown if a database error occurs.
   */
  public SearchResultsCollection search(DBconnection conn, Map searchParams,
                                        ScrollParams scrollParams,
                                        boolean firstSearch)
      throws SQLException {
    SearchResultsCollection searchResults = null;

    // Set autocommit off to use row locks.
    conn.autoCommit(false);
    try {
      String query = null;
      String orderBy = (String)searchParams.get("order");
      String queryID = (String)searchParams.get("query_id");

      // to highlight in the keyword list on the result page
      if (searchParams.get("keyword_term") != null) {
        setKeywordSearchString((String)searchParams.get("keyword_term"));
        if (TextConverter.convertMethods((String)searchParams.get("keyword_method")).equalsIgnoreCase("matches exactly")) {
          isExact = true;
        }
      }

      if (searchParams.get("extdb_id") != null) {
        this.extdb_id = (String)searchParams.get("extdb_id");
      }

      // set the "origin" value to determine what join table
      //
      // needs to be included in the search
      // if the origin was from the goslim search results page
      // then the search sql needs to join to the
      // result table RESULT_LOCIGOSLIM table which
      // contains the locus names that were input into the goslim search
      if (searchParams.get("origin") != null) {
        setOrigin((String)searchParams.get("origin"));
        setOriginQueryID((String)searchParams.get("origin_identifier"));

      }

      // this is a parameter passed along where the origin = locigoslim
      if (searchParams.get("slim_name") != null) {
        setSlimName((String)searchParams.get("slim_name"));
      }

      // populate temp table with complete result set
      if (firstSearch) {

        // For first-time query, delete any existing rows. Use a row-
        // locking strategy to minimize waits. The query locks any rows with the
        // query id. If another session has already locked the rows, the query
        // gets an exception (NOWAIT). Otherwise, if the query finds rows,
        // delete them. If there are no rows to delete, close the result set and
        // move on to the search query. This strategy minimizes wait time by
        // only doing necessary DELETEs.
        String lock_query =
          "SELECT tair_object_id /* query 1 */ FROM Result_Gene WHERE query_id = '"
              + queryID
              + "' FOR UPDATE NOWAIT";
        conn.setQuery(lock_query);
        ResultSet rs = conn.getResultSet();
        if (rs.next()) {
          conn.releaseResources(); // close the lock query result set
          String del_query =
            "DELETE FROM RESULT_GENE WHERE QUERY_ID = '" + queryID + "' ";
          conn.setQuery(del_query);
          conn.executeUpdate();
          conn.commit();
        }
        conn.releaseResources();

        // populate result table w/results
        query = getInsert() + createQuery(conn, searchParams, queryID);
        conn.setQuery(query);
        conn.executeUpdate();
        conn.commit();
        conn.releaseResources();

        String name = (String)searchParams.get("name");
        if (name != null) {
          setOrderPriority(conn, name, queryID);
        }
      }

      // get requested subset of results from temp table
      searchResults = getResultSlice(conn, scrollParams, orderBy, queryID);

      // get plain text version of search parameters
      if (searchResults != null) {
        searchResults.setSearchCriteria(getFormatSearchCriteria(conn,
                                                                searchParams,
                                                                searchResults.getResultSize(),
                                                                searchResults.getSecondaryResultSize()));
      }
    } catch (SQLException e) {
      conn.rollback();
      throw e;
    } finally {
      // Reset autocommit to on.
      conn.autoCommit(true);
    }
    return searchResults;
  }

  /**
   * get the unique identifier query line of this search quick search will never
   * have multiple parameters, so instead of generating the query, we can just
   * return a unique identifier based on the thing searched
   */
  public String generateInsertLine(DBconnection conn, Map searchParams,
                                   String type) throws SQLException {
    String insert_query = "";
    setOrigin((String)searchParams.get("origin"));
    setOriginQueryID((String)searchParams.get("origin_identifier"));
    setSlimName((String)searchParams.get("slim_name"));

    if (type.equalsIgnoreCase("form")) {
      insert_query = createQuery(conn, searchParams, "");
    } else if (type.equalsIgnoreCase("general")) {
      String searchTerm = (String)searchParams.get("searchTerm");
      insert_query = "GENE_QUICKSEARCH_" + searchTerm;
      // String insert_query = createGeneralQuery ( conn, searchParams, "");
    } else if (type.equalsIgnoreCase("annotation")) {
      insert_query = createAnnotationQuery(searchParams);
    } else {
      insert_query = createQuery(conn, searchParams, "");
    }
    return insert_query;
  }

  /**
   * Executes a gene search as part of the general search. Search can be done to
   * just return number of matching gene records, or to give the first page of
   * gene search results according to the submitted value of doCounts. This
   * method should only be called by GeneralSearchHandler as part of the general
   * search. If requesting actual search results, searching will insert results
   * into user's temp table, and redirect user to normal gene summary page to
   * display results. Subsequent requests for additional pages of results will
   * be handled by search() method. Results are always returned as a
   * SearchResultsCollection; if full search info is requested, collection will
   * contain an array of GeneSummary objects & other search info exactly as if
   * search() were called; if counts are requested, only the result size
   * parameter of the collection will be populated
   * 
   * @param searchParams Map containing search parameters
   * @param doCounts If <code>true</code>, only counts of matching genes will be
   *          returned, if <code>false</code> first page of matching genes will
   *          be returned
   * @return SearchResultsCollection containing either number of matches, or
   *         first page of results
   * @exception SQLException thrown if a database error occurs
   */
  public SearchResultsCollection doGeneralSearch(Map searchParams,
                                                 boolean doCounts,
                                                 boolean firstSearch)
      throws SQLException {

    DBconnection conn = null;
    DBWriteManager connectionPool = null;
    ScrollParams scrollParams = null;
    SearchResultsCollection searchResults = null;

    String searchTerm = (String)searchParams.get("searchTerm");
    String method = (String)searchParams.get("method");
    String show_obsolete = "T";
    String queryID = "";

    if (searchParams.get("show_obsolete") != null) {
      show_obsolete = (String)searchParams.get("show_obsolete");
    }

    try {
      searchTerm = TextConverter.convertEnds(searchTerm.toUpperCase(), method);
      connectionPool = DBWriteManager.getInstance();
      conn = connectionPool.getSearchConnection();

      // if getting counts, just need number of distinct gene ids
      if (doCounts) {
        searchResults = doGeneralCounts(conn, searchTerm);

      } else { // else need to insert result set into temp table & get

        if (firstSearch) {
          queryID = (String)searchParams.get("query_id");
          doFullGeneralSearch(conn, searchTerm, show_obsolete, queryID);
        } else {
          queryID = (String)searchParams.get("query_id");
        }

        // get first page of results from temp table, sort by locus, gene name
        scrollParams = ScrollCalculator.getDefaultScrollParams();
        searchResults = getResultSlice(conn, scrollParams, "name", queryID);

        // get plain text version of search parameters
        if (searchResults != null) {
          searchResults.setSearchCriteria(getFormatSearchCriteria(conn,
                                                                  searchParams,
                                                                  searchResults.getResultSize(),
                                                                  searchResults.getSecondaryResultSize()));
        }

      }

    } finally {
      if (conn != null) {
        conn.releaseResources();
        DBWriteManager.return_connection(conn);
      }
    }

    return searchResults;
  }

  // retrieve distinct number of locus ids where gene name,
  // locus name or GenBank
  // accession number equals search term
  private SearchResultsCollection doGeneralCounts(DBconnection conn,
                                                  String searchTerm)
      throws SQLException {

    SearchResultsCollection searchResults = null;
    String query = null;
    ArrayList ids = new ArrayList(); // store distinct list of
    // ids from 3 queries
    StringBuffer from = new StringBuffer();
    StringBuffer where = new StringBuffer();

    // get initial criteria used for all queries
    from.append(getBaseFrom());
    where.append(getBaseWhere());
    from.append(" , MapElement_Locus ml, Gene g ");
    where.append(" AND g.map_element_id = ml.map_element_id ");
    where.append(" AND ml.locus_id = l.locus_id ");
    // search gene names & aliases
    query =
      "SELECT DISTINCT l.locus_id "
          + from.toString()
          + where.toString()
          + "AND EXISTS ("
          + "SELECT 'X' "
          + "FROM "
          + getGeneNameAliasTable()
          + " ga "
          + "WHERE g1.gene_id = ga.gene_id "
          + "AND upper(ga.name) LIKE "
          + TextConverter.dbQuote(searchTerm)
          + " ESCAPE '\\\')";
    addCount(conn, query, ids);

    // search gene descriptions
    query =
      "SELECT DISTINCT l.locus_id "
          + from.toString()
          + where.toString()
          + "AND g1.description_uc LIKE "
          + TextConverter.dbQuote(searchTerm)
          + " ESCAPE '\\\'";
    addCount(conn, query, ids);

    // search gen bank accession
    query =
      "SELECT DISTINCT l.locus_id "
          + from.toString()
          + where.toString()
          + "AND EXISTS ( "
          + "SELECT 'X' "
          + "FROM GenBankAccession_wrk gba "
          + "WHERE g1.map_element_id = gba.map_element_id "
          + "AND gba.map_element_type = 'gene' "
          + "AND gba.ic_accession LIKE "
          + TextConverter.dbQuote(searchTerm)
          + " ESCAPE '\\\')";
    addCount(conn, query, ids);

    // search locus name
    query =
      "SELECT DISTINCT l.locus_id "
          + from.toString()
          + where.toString()
          + "AND EXISTS( "
          + "SELECT 'X' "
          + "FROM LocusNameAliasAll lna "
          + "WHERE l.locus_id = lna.locus_id "
          + "AND lna.name LIKE "
          + TextConverter.dbQuote(searchTerm)
          + " ESCAPE '\\\') ";
    addCount(conn, query, ids);

    searchResults = new SearchResultsCollection();
    searchResults.setResultSize(ids.size());

    return searchResults;
  }

  // utility method to execute query and store any locus ids returned
  // from query in ids collection
  private void addCount(DBconnection conn, String query, ArrayList ids)
      throws SQLException {
    Long id = null;
    ResultSet results = null;

    conn.setQuery(query);
    results = conn.getResultSet();
    while (results.next()) {
      id = new Long(results.getLong("locus_id"));
      if (!ids.contains(id)) {
        ids.add(id);
      }
    }
    conn.releaseResources();
  }

  // retrieve all genes whose name, locus name or GenBank accession number
  // matches search term;
  // insert results into temp table, retrieve first page of results,
  // and get descriptive version
  // of search criteria for display on gene summary pages
  /**
   * Retrieve all genes whose name, locus name, or GenBank accession number
   * matches the search term; insert the results into the results table
   * Result_Gene, retrieve the first page of results, and get the descriptive
   * version of the search criteria for display on gene summary pages. The full,
   * general search requires clearing any preexisting query results from the
   * Result_Gene table, and the DELETE uses a row-locking strategy to minimize
   * table lock waits.
   * 
   * @param conn the SQL connection
   * @param searchTerm the search term
   * @param show_obsolete whether to show obsolete matches
   * @param queryID the query id of the existing query in the result table
   * @throws SQLException when there is a database query problem
   */
  private void doFullGeneralSearch(DBconnection conn, String searchTerm,
                                   String show_obsolete, String queryID)
      throws SQLException {

    // Set autocommit off to use row locking.
    conn.autoCommit(false);
    try {
      String query = null;
      String obsolete_wherestatement = "";
      StringBuffer from = new StringBuffer();
      StringBuffer where = new StringBuffer();

      if (show_obsolete.equalsIgnoreCase("F")) {
        obsolete_wherestatement = " AND not g1.is_obsolete='T' ";
      } else {
        obsolete_wherestatement = "";
      }

      // Clear the result table using a row-locking strategy. If any rows are
      // locked, delete them and commit. If another session has locked the rows,
      // fails with an exception (NOWAIT). If no rows are locked, close the
      // result set and continue to the search query.
      String lock_query =
        "SELECT tair_object_id /* query 2 */ FROM Result_Gene WHERE query_id = '"
            + queryID
            + "' FOR UPDATE NOWAIT";
      conn.setQuery(lock_query);
      ResultSet rs = conn.getResultSet();
      if (rs.next()) {
        conn.releaseResources(); // close lock query result set
        String del_query =
          "DELETE FROM RESULT_GENE WHERE QUERY_ID = '" + queryID + "'";
        conn.setQuery(del_query);
        conn.executeUpdate();
        conn.commit();
      }
      conn.releaseResources();

      // get initial criteria used for all queries
      from.append(getBaseFrom());
      where.append(getBaseWhere());
      from.append(" , MapElement_Locus ml, Gene g ");
      where.append(" AND g.map_element_id = ml.map_element_id ");
      where.append(" AND ml.locus_id = l.locus_id ");
      where.append(obsolete_wherestatement);
      query =
        getInsert()
            + getBaseSelect("NULL", queryID)
            + from.toString()
            + where.toString()
            + "AND EXISTS ("
            + "SELECT 'X' "
            + "FROM "
            + getGeneNameAliasTable()
            + " ga "
            + "WHERE g.gene_id = ga.gene_id "
            + "AND upper(ga.name) LIKE "
            + TextConverter.dbQuote(searchTerm)
            + " ESCAPE '\\\') ";

      conn.setQuery(query);
      conn.executeUpdate(); // execute search & insert results into temp table
      conn.commit();
      conn.releaseResources();

      // search gene descriptions
      query =
        getInsert()
            + getBaseSelect("NULL", queryID)
            + from.toString()
            + where.toString()
            + "AND g.description_uc LIKE "
            + TextConverter.dbQuote(searchTerm)
            + " ESCAPE '\\\'";
      conn.setQuery(query);
      conn.executeUpdate();
      conn.commit();
      conn.releaseResources();

      query =
        getInsert()
            + getBaseSelect("NULL", queryID)
            + from.toString()
            + where.toString()
            + "AND EXISTS ( "
            + "SELECT 'X' "
            + "FROM GenBankAccession_wrk gba "
            + "WHERE g1.map_element_id = gba.map_element_id "
            + "AND gba.map_element_type = 'gene' "
            + "AND gba.ic_accession LIKE "
            + TextConverter.dbQuote(searchTerm)
            + " ESCAPE '\\\')";
      conn.setQuery(query);
      conn.executeUpdate(); // execute search & insert results into temp table
      conn.commit();
      conn.releaseResources();

      query =
        getInsert()
            + getBaseSelect("NULL", queryID)
            + from.toString()
            + where.toString()
            + "AND EXISTS( "
            + "SELECT 'X' "
            + "FROM LocusNameAliasAll lna "
            + "WHERE l.locus_id = lna.locus_id "
            + "AND lna.name LIKE "
            + TextConverter.dbQuote(searchTerm)
            + " ESCAPE '\\\')";
      conn.setQuery(query);
      conn.executeUpdate(); // execute search & insert results into temp table
      conn.commit();
      conn.releaseResources();

      // uniprot id
      query =
        getInsert()
            + getBaseSelect("NULL", queryID)
            + from.toString()
            + " ,Gene_AASequence ga, AASequence a "
            + where.toString()
            + " AND ga.aa_sequence_id = a.aa_sequence_id "
            + " AND g1.gene_id = ga.gene_id "
            + " AND a.uniprot_id LIKE "
            + TextConverter.dbQuote(searchTerm)
            + " ESCAPE '\\\'";
      conn.setQuery(query);
      conn.executeUpdate(); // execute search & insert results into temp table
      conn.commit();
      conn.releaseResources();

    } catch (SQLException e) {
      conn.rollback();
    } finally {
      // Restore autocommit.
      conn.autoCommit(true);
    }
    // Do the updates after setting autocommit back on.
    setOrderPriority(conn, searchTerm, queryID);
  }

  /**
   * Retrieves JSP URL to use for displaying gene search results
   * 
   * @return JSP URL to use for displaying gene search results
   */
  public String getSummaryPage() {
    return "/jsp/search/gene_summary.jsp";
  }

  // search type literal for accessing temp table
  public String getSearchType() {
    return "gene";
  }

  // set search string input on search form in order to highlight the string
  // in the keyword list
  private void setKeywordSearchString(String keywordSearchString) {
    this.keywordSearchString = keywordSearchString;
  }

  // return the keyword search string in order to highlight the
  // string in the keyword list
  private String getKeywordSearchString() {
    return keywordSearchString;
  }

  // return the gene name alias table based on the value
  // option passed in as a user selected option
  private String getGeneNameAliasTable() {
    String geneNameAliasTable = "GeneNameAlias";
    if (isObsolete != null && isObsolete.booleanValue()) {
      geneNameAliasTable = "GeneNameAliasAll";
    } else {
      geneNameAliasTable = "GeneNameAlias";
    }
    return geneNameAliasTable;
  }

  private String getSymbolTable() {
    return TfcSymbol.TABLE_SYMBOL;
  }

  private String getGeneSymbolReferenceTable() {
    return TfcGeneSymbolReference.TABLE_GENE_SYMBOL_REFERENCE;
  }

  // set the origin of the search request from the input parameter
  private void setOrigin(String origin) {
    this.origin = origin;
  }

  private void setOriginQueryID(String originQueryID) {
    this.originQueryID = originQueryID;
  }

  // return the origin of the request
  private String getOrigin() {
    return origin;
  }

  private String getOriginQueryID() {
    return originQueryID;
  }

  // set the slim name of the search request from the input parameter
  private void setSlimName(String slimName) {
    this.slimName = slimName;
  }

  // return the slimName of the request
  private String getSlimName() {
    return slimName;
  }

  /**
   * Executes a gene search as an annotation type search - meaning the sql for
   * the searcher will be built based on params that came from a url, typically
   * a link off a displayed count field on a page that shows associated data
   * counts for a particular keyword. The value of the count field and
   * consequently the sql needed to return results that match that count, would
   * have been determined based on a scope such as 'term, 'children' or 'combo'
   * meaning counts of associated data (in this case genes ) to a keyword term
   * or a keyword's children or both. There may be new "scope" values in the
   * future. "scope" is therefore, a required parameter sent in the map along
   * with the "kw_id", keyword id, and the "table" parameter is used to access
   * annotation type info from the AnnotationType table which the
   * <code>AnnotationCountPopulator</code> object uses to construct the search
   * sql. Searching will insert results into user's temp table, and redirect
   * user to normal gene summary page to display results. Subsequent requests
   * for additional pages of results will be handled by search() method. Results
   * are always returned as a SearchResultsCollection; if full search info is
   * requested, collection will contain an array of GeneSummary objects & other
   * search info exactly as if search() were called
   * 
   * @param searchParams Map containing search parameters if <code>false</code>
   *          first page of matching genes will be returned
   * @return SearchResultsCollection containing either number of matches, or
   *         first page of results
   * @exception SQLException thrown if a database error occurs
   */
  public SearchResultsCollection doAnnotationTypeSearch(Map searchParams,
                                                        boolean firstSearch)
      throws SQLException {
    DBconnection conn = null;
    DBWriteManager connectionPool = null;
    SearchResultsCollection searchResults = null;
    Long keyword_id = (Long)searchParams.get("kw_id");
    String child_table_name = (String)searchParams.get("table");
    String scope = (String)searchParams.get("scope");
    String show_obsolete = "T";
    String obsolete_wherestatement = "";
    ScrollParams scrollParams = null;
    AnnotationCountPopulator acp = new AnnotationCountPopulator();
    StringBuffer query = new StringBuffer();

    if (searchParams.get("show_obsolete") != null) {
      show_obsolete = (String)searchParams.get("show_obsolete");
    }

    try {

      connectionPool = DBWriteManager.getInstance();
      conn = connectionPool.getSearchConnection();
      // Set autocommit off to use row locking.
      conn.autoCommit(false);
      // Get the SQL needed to generate the required result set based
      // on the input parameters. Pass in 'false' so the count attribute of the
      // AnnotationCount object is not populated
      acp.setAnnotationCount(conn, keyword_id, child_table_name, scope, false);
      searchParams.put("keyword_name",
                       ((AnnotationCount)acp.getAnnotationCount()).getKeywordName());
      searchParams.put("is_ann_type", new Boolean(true));

      // checks show_obsolete to see if show_obsolete is set to True or False.
      // if show_obsolete is null, or true, show both obsolete and not.
      // if show_obsolete is false, set obsolete_wherestatement to filter out
      // obsolete genes

      if (show_obsolete.equalsIgnoreCase("F")) {
        obsolete_wherestatement = " AND not g1.is_obsolete='T' ";
      } else {
        obsolete_wherestatement = "";
      }

      // to highlight in the keyword list on the result page
      setKeywordSearchString(((AnnotationCount)acp.getAnnotationCount()).getKeywordName());
      isExact = true;
      String queryID = (String)searchParams.get("query_id");

      if (firstSearch) {

        // Make sure the result table is empty using a row-locking strategy. If
        // another session has already locked the rows, the SELECT results in an
        // exception (NOWAIT). Otherwise, if there are locked rows, delete them.
        // If there are no locked rows, just close the result set and move on
        // to the search query. This strategy minimizes wait time by eliminating
        // all but necessary deletes.
        String lock_query =
          "SELECT tair_object_id /* query 3 */ FROM Result_Gene WHERE query_id = '"
              + queryID
              + "' FOR UPDATE NOWAIT";
        conn.setQuery(lock_query);
        ResultSet rs = conn.getResultSet();
        if (rs.next()) {
          conn.releaseResources(); // close the result set
          String del_query =
            "DELETE FROM RESULT_GENE WHERE QUERY_ID = '" + queryID + "' ";
          conn.setQuery(del_query);
          conn.executeUpdate();
          conn.commit();
        }
        conn.releaseResources();

        if (((AnnotationCount)acp.getAnnotationCount()).getSearchSql() != null) {
          query.append(getInsert()
                       + getBaseSelect("NULL", queryID)
                       + getBaseFrom()
                       + getBaseWhere()
                       + obsolete_wherestatement
                       + " AND "
                       + getTairObjectFilter(conn, acp, child_table_name));

          conn.setQuery(query.toString());
          conn.setQueryVariable(keyword_id);
          if (child_table_name.equalsIgnoreCase(TfcAnnotationType.LOCUS)) {
            conn.setQueryVariable(2, keyword_id);
          }
          conn.executeUpdate(); // execute search & insert results
          // into temp table
          conn.commit();
          conn.releaseResources();

          // get first page of results from temp table,
          // sort by locus, gene name
        }

      }
      scrollParams = ScrollCalculator.getDefaultScrollParams();
      searchResults = getResultSlice(conn, scrollParams, "name", queryID);
    } catch (SQLException e) {
      conn.rollback();
      throw e;
    } finally {
      if (conn != null) {
        conn.releaseResources();
        conn.autoCommit(true);
        DBWriteManager.return_connection(conn);
      }
    }

    // get plain text version of search parameters
    if (searchResults != null) {
      searchResults.setSearchCriteria(getFormatSearchCriteria(conn,
                                                              searchParams,
                                                              searchResults.getResultSize(),
                                                              searchResults.getSecondaryResultSize()));
    }
    return searchResults;
  }

  /*
   * get the string of the annotation query so we can assign it as a unique
   * identifier to this annotationQuery search.
   * 
   * @param Map searchParams of the filters that we are searching by
   * 
   * @return String query of the unique string identifier
   */
  public String createAnnotationQuery(Map searchParams) throws SQLException {

    DBconnection conn = null;
    DBWriteManager connectionPool = null;
    Long keyword_id = (Long)searchParams.get("kw_id");
    String child_table_name = (String)searchParams.get("table");
    String scope = (String)searchParams.get("scope");
    String show_obsolete = "T";
    String obsolete_wherestatement = "";
    AnnotationCountPopulator acp = new AnnotationCountPopulator();
    String query = "";

    if (searchParams.get("show_obsolete") != null) {
      show_obsolete = (String)searchParams.get("show_obsolete");
    }

    try {

      connectionPool = DBWriteManager.getInstance();
      conn = connectionPool.getSearchConnection();
      // get the sql needed to generate the required result set based
      // on params
      // pass in 'false' so the count attribute of the AnnotationCount
      // object is not populated
      acp.setAnnotationCount(conn, keyword_id, child_table_name, scope, false);
      searchParams.put("keyword_name",
                       ((AnnotationCount)acp.getAnnotationCount()).getKeywordName());
      searchParams.put("is_ann_type", new Boolean(true));

      // checks show_obsolete to see if show_obsolete is set to True or False.
      // if show_obsolete is null, or true, show both obsolete and not.
      // if show_obsolete is false, set obsolete_wherestatement to filter out
      // obsolete genes

      if (show_obsolete.equalsIgnoreCase("F")) {
        obsolete_wherestatement = " AND not g1.is_obsolete='T' ";
      } else {
        obsolete_wherestatement = "";
      }

      // to highlight in the keyword list on the result page
      setKeywordSearchString(((AnnotationCount)acp.getAnnotationCount()).getKeywordName());
      isExact = true;
      if (((AnnotationCount)acp.getAnnotationCount()).getSearchSql() != null) {
        query =
          getBaseSelect("NULL", "")
              + getBaseFrom()
              + getBaseWhere()
              + obsolete_wherestatement
              + " AND "
              + getTairObjectFilter(conn, acp, child_table_name);

        query.replaceFirst("\\?", keyword_id.toString());
        if (child_table_name.equalsIgnoreCase(TfcAnnotationType.LOCUS)) {
          query.replaceFirst("\\?", keyword_id.toString());
        }
      }
    } finally {
      if (conn != null) {
        conn.releaseResources();
        connectionPool.return_connection(conn);
      }
    }

    return query;
  }

  // Retrieve results and save as vectors, where each vector represents
  // a locus and contents
  // of vector are genes that are associated with locus.
  private SearchResultsCollection getResultSlice(DBconnection conn,
                                                 ScrollParams scrollParams,
                                                 String orderBy, String queryID)
      throws SQLException {

    StringBuffer query = null;
    Vector found = null;
    GeneSummary gene = null;
    ResultSet results = null;
    SearchResultsCollection searchResults = new SearchResultsCollection();
    Vector locus_gene_vector = new Vector();
    boolean more = false;
    long locus_id = 0;
    int floor = scrollParams.getFloor();
    int ceiling = scrollParams.getCeiling();
    int rowCounter = 0;
    HashSet gene_ids = new HashSet();
    Long id = null;

    query = new StringBuffer();
    query.append("SELECT distinct "
                 + getTableColumns("result")
                 + " "
                 + "FROM RESULT_GENE "
                 + "WHERE QUERY_ID = '"
                 + queryID
                 + "' ");

    // Result set needs to be grouped by locus, then by gene.
    // Order by params
    // on search form are all gene features. SQL clause below will
    // group results by
    // locus, then compute the minimum value of gene feature for each locus
    // group,
    // then sort locus groups by computed minimum value. Multiple genes
    // within
    // locus group are then sub-sorted by requested criteria

    if (orderBy != null && orderBy.equalsIgnoreCase("name")) {
      query.append("ORDER BY order_priority, locus, name ");
    } else if (orderBy != null && orderBy.equalsIgnoreCase("position")) {
      query.append(" ORDER BY order_priority, locus, position ");
    } else { // default to name
      query.append("ORDER BY order_priority, locus, name ");
    }
    conn.setQuery(query.toString());
    results = conn.getResultSet();
    more = results.next();
    if (more) {
      locus_id = results.getLong("locus_id");
    }

    while (more) {
      if (rowCounter >= floor && rowCounter <= ceiling) {
        gene = getGeneRow(results);
        locus_gene_vector.add(gene);
      }
      id = new Long(results.getLong("gene_id"));
      if (!gene_ids.contains(id))
        gene_ids.add(id);
      // move to next row, if locus id is different, save genes stored for
      // last locus id and create new collection for new id
      more = results.next();
      long tmp_locus_id = 0;
      if (more) {
        tmp_locus_id = results.getLong("locus_id");
      }

      if (tmp_locus_id == 0 || locus_id != tmp_locus_id) {
        if (rowCounter >= floor && rowCounter <= ceiling) {
          if (found == null) {
            found = new Vector();
          }
          found.addElement(locus_gene_vector);
          locus_gene_vector = new Vector();
        }
        locus_id = tmp_locus_id;
        rowCounter++; // increment row counter since we're on a new
        // locus
      }
    }
    conn.releaseResources();
    if (found != null && !found.isEmpty()) {

      int length = found.size();
      Iterator iter = null;
      for (int i = 0; i < length; i++) {
        locus_gene_vector = (Vector)found.elementAt(i);
        iter = locus_gene_vector.iterator();
        while (iter.hasNext()) {
          gene = (GeneSummary)iter.next();
          gene.get_information(conn); // get annotation info for
          // each individ. gene in locus
          gene.setHighlightedKeywordList(conn,
                                         getKeywordSearchString(),
                                         isExact,
                                         "GO");
        }
      }

      // add to search collection
      searchResults.setResults(found);
      searchResults.setResultSize(rowCounter);
      searchResults.setSecondaryResultSize(gene_ids.size());
      searchResults.setFloor(floor + 1);
      searchResults.setCeiling(floor + found.size());

      // get links for scrolling through multiple results pages,
      searchResults.setScrollLinks(ScrollCalculator.getTableScrollLinks(scrollParams.getSize(),
                                                                        scrollParams.getPage(),
                                                                        searchResults,
                                                                        queryID));
    }

    // set page for displaying results
    searchResults.setResultsPage(getSummaryPage());

    return searchResults;
  }

  /**
   * @param locusVector a vector of vectors containing geneSummary objects
   */
  public static Map makeLocusKeywordMap(Vector locusVector) {
    return makeLocusKeywordMap(locusVector, "all");
  }

  public static Map makeLocusKeywordMap(Vector locusVector, String keyword_types) {
    Map locus_keyword_map = new TreeMap();
    DBconnection conn = null;
    DBReadManager connectionPool = null;

    try {

      connectionPool = DBReadManager.getInstance();
      conn = connectionPool.get_connection();

      if (locusVector != null && !locusVector.isEmpty()) {
        Map locus_id_object_id_map = new HashMap();
        int length = locusVector.size();
        for (int i = 0; i < length; i++) {
          Vector locus_gene_vector = (Vector)locusVector.elementAt(i);
          Iterator iter = locus_gene_vector.iterator();
          while (iter.hasNext()) {
            GeneSummary gene = (GeneSummary)iter.next();
            String locus_id = gene.get_locus_id().toString();
            String locus_object_id = null;
            Set locus_keywords = null;

            if (locus_id_object_id_map.containsKey(locus_id)) {
              locus_object_id = (String)locus_id_object_id_map.get(locus_id);
              locus_keywords = (Set)locus_keyword_map.get(locus_id);
            } else {
              TfcLocus tfcLocus = new TfcLocus(conn, gene.get_locus_id());
              locus_object_id = tfcLocus.get_tair_object_id().toString();
              if (keyword_types != null) {
                locus_keywords =
                  new TreeSet(TfcKeyword.retrieveKeywords(conn,
                                                          locus_object_id,
                                                          "with_nots",
                                                          keyword_types));
              } else {
                locus_keywords =
                  new TreeSet(TfcKeyword.retrieveKeywords(conn,
                                                          locus_object_id,
                                                          "with_nots"));
              }
              locus_id_object_id_map.put(locus_id, locus_object_id);
              locus_keyword_map.put(locus_id, locus_keywords);
            }
            locus_keywords.addAll(gene.getKeywords());
          }
        }
      }
    } catch (SQLException e) {
      System.err.println("Could not makeLocusKeywordMap: " + e);
    } finally {
      if (conn != null) {
        conn.releaseResources();
        connectionPool.return_connection(conn);
      }
    }

    return locus_keyword_map;
  }

  /**
   * Retrieve genes using selected locus ids from search results. Used for
   * creating downloads for items in search results.
   * 
   * @param locusIDs Selected locus ids to retrieve data for
   * @param queryID User's query id. Used to access temp table for user's
   *          individual results.
   */
  public GeneSummary[] getSelected(Vector locusIDs, String queryID)
      throws SQLException {

    Vector found = null;
    GeneSummary[] genes = null;
    GeneSummary gene = null;
    String query = null;
    ResultSet results = null;
    Iterator iter = null;
    DBconnection conn = null;
    DBReadManager connectionPool = null;

    connectionPool = DBReadManager.getInstance();
    try {
      conn = connectionPool.get_connection();

      query =
        "SELECT DISTINCT "
            + getTableColumns("result")
            + " "
            + "FROM RESULT_GENE WHERE QUERY_ID = '"
            + queryID
            + "' "
            + "AND locus_id = ?";

      conn.setQuery(query);
      iter = locusIDs.iterator();
      while (iter.hasNext()) {
        conn.setQueryVariable((Long)iter.next());
        results = conn.getResultSet();
        while (results.next()) {
          gene = getGeneRow(results);
          if (found == null) {
            found = new Vector();
          }
          found.addElement(gene);
        }
      }
      conn.releaseResources();
    } finally {
      connectionPool.return_connection(conn);
    }

    if (found != null && !found.isEmpty()) {
      genes = new GeneSummary[found.size()];
      found.copyInto(genes);
      for (int i = 0; i < genes.length; i++) {

        // check out and return connection for each
        // result to avoid expiration by pool when
        // doing long exports for download all
        try {
          conn = connectionPool.get_connection();
          genes[i].get_information(conn);
          // get annotation info for each gene
          genes[i].populateGeneModelType();
          // get gene model type for downloads
        } finally {
          connectionPool.return_connection(conn);
        }
      }
    }
    return genes;
  }

  // create gene object from single row of result set - handy to encapsulate
  // this here since it's done in 2 places
  private GeneSummary getGeneRow(ResultSet results) throws SQLException {
    GeneSummary gene = new GeneSummary();
    gene.set_map_element_id(new Long(results.getLong("map_element_id")));
    gene.set_tair_object_id(new Long(results.getLong("tair_object_id")));
    gene.set_gene_id(new Long(results.getLong("gene_id")));
    gene.set_locus_id(new Long(results.getLong("locus_id")));
    gene.setLocusObsoleteLabel(results.getString("locus_is_obsolete"));
    gene.set_name(results.getString("name"));
    gene.setObsoleteLabel(results.getString("is_obsolete"));
    gene.set_gene_model_type_id(new Long(results.getLong("gene_model_type_id")));
    gene.set_units(results.getString("units"));
    gene.set_locus(results.getString("locus"));
    return gene;
  }

  // retrieves select statement used to get gene/locus info when executing
  // full search - helpful to keep here since it's used by both regular
  // gene search and general search methods
  private String getBaseSelect(String position, String queryID) {
    String select = null;

    // position will be non-null if sorting results by map location
    if (position == null) {
      position = "NULL";
    }

    select =
      "SELECT distinct g1.map_element_id, "
          + "g1.tair_object_id, "
          + "g1.gene_id, "
          + "l.locus_id, "
          + "l.is_obsolete AS locus_is_obsolete, "
          + "g1.name, "
          + "g1.gene_model_type_id, "
          + "g1.is_obsolete, "
          + "g1.units, "
          + "l.name, "
          + position
          + ", 3 ";
    if (queryID != null && queryID != "") {
      select = select + ", '" + queryID + "', CURRENT_DATE ";
    } else {
      select = select + ", '', '' ";
    }

    return select;
  }

  // retrieves initial table list used to get gene/locus info when executing
  // full search - helpful to keep here since it's used by both regular
  // gene search and general search methods
  private String getBaseFrom() {
    return "FROM Gene g1, Locus l, MapElement_Locus ml1 ";
  }

  // retrieves initial where clause that contains joins needed by base
  // from clause
  private String getBaseWhere() {
    String where =
      "WHERE g1.map_element_id = ml1.map_element_id "
          + "AND ml1.locus_id = l.locus_id ";
    return where;
  }

  // retrieves statement to insert result rows into temp table
  private String getInsert() {
    String insert =
      "INSERT INTO RESULT_GENE "
          + "( "
          + getTableColumns("all")
          + " ) ";
    return insert;
  }

  // retrieves list of columns in temp table that can be substituted
  // into either a select or insert statement
  private String getTableColumns(String type) {
    String columns =
      "map_element_id, "
          + "tair_object_id, "
          + "gene_id, "
          + "locus_id, "
          + "locus_is_obsolete, "
          + "name, "
          + "gene_model_type_id, "
          + "is_obsolete, "
          + "units, "
          + "locus, "
          + "position, "
          + "order_priority, "
          + "query_id";
    // need to check what kind of select it is. if it is result type (called in
    // getResultSlice, then we want to not return date_last_queried
    if (type.equalsIgnoreCase("all")) {
      columns = columns + ", date_last_queried ";
    }
    return columns;
  }

  private String getResultTableColumns() {
    String columns =
      "map_element_id, "
          + "tair_object_id, "
          + "gene_id, "
          + "locus_id, "
          + "locus_is_obsolete, "
          + "name, "
          + "gene_model_type_id, "
          + "is_obsolete, "
          + "units, "
          + "locus, "
          + "position, "
          + "order_priority, "
          + "query_id, "
          + "date_last_queried ";
    return columns;
  }

  // sets the order priority so that things matching the name show up on top.
  // Uses row-level locking to avoid table locking.
  private void setOrderPriority(DBconnection conn, String name, String queryID)
      throws SQLException {
    // Turn off autocommit.
    conn.autoCommit(false);
    try {
      String lock_auery =
        "SELECT query_id FROM Result_Gene WHERE query_id = "
            + TextConverter.dbQuote(queryID);

      // Lock all the query_id rows.
      conn.setQuery(lock_auery);
      conn.executeUpdate();
      // Do the priority 1 update without committing.
      String order_query =
        "UPDATE RESULT_GENE "
            + " SET order_priority = 1"
            + " WHERE gene_id IN "
            + " (SELECT distinct g.gene_id "
            + " from RESULT_GENE "
            + " g, "
            + getGeneNameAliasTable()
            + " gna "
            + " WHERE g.QUERY_ID = "
            + TextConverter.dbQuote(queryID)
            + " AND "
            + " g.gene_id = gna.gene_id "
            + " AND lower(gna.name) = lower("
            + TextConverter.dbQuote(name.replace("%", ""))
            + ") )"
            + " AND QUERY_ID = "
            + TextConverter.dbQuote(queryID);
      conn.setQuery(order_query);
      conn.executeUpdate();
      conn.releaseResources();

      // Do the priority 2 update and commit.
      order_query =
        "UPDATE RESULT_GENE "
            + " SET order_priority = 2 WHERE lower(locus) = lower("
            + TextConverter.dbQuote(name.replace("%", ""))
            + ") "
            + " AND QUERY_ID = "
            + TextConverter.dbQuote(queryID);
      conn.setQuery(order_query);
      conn.executeUpdate();
      conn.commit();
      conn.releaseResources();
    } catch (SQLException e) {
      conn.rollback();
      throw e;
    } finally {
      conn.autoCommit(true);
    }
  }

  private String getTairObjectFilter(DBconnection conn,
                                     AnnotationCountPopulator acp,
                                     String child_table_name)
      throws SQLException {
    String result = "";
    String searchSql =
      ((AnnotationCount)acp.getAnnotationCount()).getSearchSql();

    if (child_table_name.equalsIgnoreCase(TfcAnnotationType.LOCUS)) {
      // Should figure out how to move this into AnnotationCountPopulator...

      result =
        "(g1.tair_object_id IN ( "
            + searchSql
            + " ) "
            + " OR "
            + " l.tair_object_id IN ( "
            + searchSql
            + " ) )";
    } else {
      result = "g1.tair_object_id IN ( " + searchSql + " )";
    }

    return result;
  }

  // generate SQL query for executing full gene search
  private String createQuery(DBconnection conn, Map searchParams, String queryID)
      throws SQLException {

    String what = null;
    StringBuffer from = new StringBuffer();
    StringBuffer where = new StringBuffer();
    String position = null;

    // get initial criteria used for all queries
    from.append(getBaseFrom());
    where.append(getBaseWhere());

    // check for origin --if provided add in join and where clauses
    if (getOrigin() != null) {
      // Check for taxon and add search expression if there
      String taxon = (String)searchParams.get("taxon");
      if (taxon != null && !taxon.equalsIgnoreCase("any")) {
        where.append(" AND l.taxon_id = "
                     + taxon
                     + " AND g1.taxon_id = "
                     + taxon
                     + " ");
      }

      // Exclude obsoletes
      where.append(" AND g1.is_obsolete = 'F' ");
      where.append(" AND l.is_obsolete = 'F' ");

      if (getSlimName() != null) {
        where.append("AND EXISTS ( SELECT 'X' FROM ");
        where.append("RESULT_" + getOrigin() + " itt, LociGoslim_wrk lg ");
        where.append(" WHERE itt.QUERY_ID = '" + getOriginQueryID() + "' ");
        where.append(" AND l.locus_id = lg.locus_id");
        where.append(" AND lg.locus_name = itt.locus_name ");
        where.append(" AND lg.slim_name = ");
        where.append(TextConverter.dbQuote(getSlimName()));
        where.append(" ) ");
      }

    } else {
      // from.append( " , MapElement_Locus ml, Gene g " ) ;
      // where.append( " AND g.map_element_id = ml.map_element_id " );
      // where.append( " AND ml.locus_id = l.locus_id " );

      // check for keyword search criteria
      KeywordSearchHelper gene_helper = new KeywordSearchHelper();
      String gene_keywordSQL =
        gene_helper.getIncludeSql(conn, TfcAnnotationType.GENE, searchParams);

      KeywordSearchHelper locus_helper = new KeywordSearchHelper();
      String locus_keywordSQL =
        locus_helper.getIncludeSql(conn, TfcAnnotationType.LOCUS, searchParams);

      if (gene_keywordSQL != null && locus_keywordSQL != null) {
        where.append(" AND ( ");
        where.append(" g1.tair_object_id IN " + gene_keywordSQL);
        where.append(" OR ");
        where.append(" l.tair_object_id IN " + locus_keywordSQL);
        where.append(" ) ");
      } else if (gene_keywordSQL != null) {
        where.append(" AND g1.tair_object_id IN " + gene_keywordSQL);
      } else if (locus_keywordSQL != null) {
        where.append(" AND l.tair_object_id IN " + locus_keywordSQL);
      }

      // retrieve submitted search params
      String taxon = (String)searchParams.get("taxon");

      String name = (String)searchParams.get("name");
      String method = (String)searchParams.get("method");
      String name_type = (String)searchParams.get("name_type");

      String[] gene_model_type = (String[])searchParams.get("gene_model_type");

      Boolean is_predicted = (Boolean)searchParams.get("is_predicted");
      Boolean has_full_length_cDNA =
        (Boolean)searchParams.get("has_full_length_cDNA");
      Boolean is_sequenced = (Boolean)searchParams.get("is_sequenced");
      Boolean is_not_sequenced = (Boolean)searchParams.get("is_not_sequenced");
      Boolean is_genetic_marker =
        (Boolean)searchParams.get("is_genetic_marker");
      Boolean is_on_a_map = (Boolean)searchParams.get("is_on_a_map");
      this.isObsolete = (Boolean)searchParams.get("is_obsolete");
      Boolean has_cDNA_or_EST = (Boolean)searchParams.get("has_cDNA_or_EST");
      Boolean has_publication = (Boolean)searchParams.get("has_publication");

      java.util.Date limit_time =
        (java.util.Date)searchParams.get("limit_time");
      String chromosome = (String)searchParams.get("chromosome");
      String order = (String)searchParams.get("order");
      Units units = (Units)searchParams.get("units");
      String map_type = (String)searchParams.get("map_type");

      // assembly unit data will only be present if search was linked to from
      // assembly unit detail page
      String assembly_unit_name =
        (String)searchParams.get("assembly_unit_name");
      Long assembly_map_element_id =
        (Long)searchParams.get("assembly_map_element_id");

      // search by taxon
      if (taxon != null && !taxon.equalsIgnoreCase("any")) {
        where.append(" AND l.taxon_id = "
                     + taxon
                     + " AND g1.taxon_id = "
                     + taxon
                     + " ");
      }

      // filter obsolete genes & loci from search matches and
      // results unless obsolete items requested
      if (isObsolete == null || !isObsolete.booleanValue()) {
        where.append(" AND g1.is_obsolete = 'F' ");
        where.append(" AND l.is_obsolete = 'F' ");
        // where.append( " AND g1.is_obsolete = 'F' " );
      }

      // if sorting by position, select map start position from assignment,
      // otherwise leave blank to minimize duplication
      // of rows due to cardinality
      // between gene & assignment
      if (map_type != null && order != null && order.equals("position")) {
        position = " a.start_position";
      }

      // if requesting elements on map, this join will implicitly
      // fulfill the query
      // so don't need to check again
      //
      // if requesting elements for assembly unit, must look
      // through assignment only,
      // disregarding map
      boolean addMap =
        (map_type != null
         || (is_on_a_map != null && is_on_a_map.booleanValue()) || (order != null && order.equals("position")));
      boolean addAssignment =
        (addMap || (assembly_map_element_id != null && assembly_unit_name != null));
      if (addAssignment) {
        from.append(" , GlobalAssignment a ");
        where.append(" AND a.map_element_id = g1.map_element_id "
                     + " AND a.is_obsolete = 'F' ");
      }
      if (addMap) {
        from.append(" , Map mp ");
        where.append(" AND a.map_id = mp.map_id ");
      }
      if (assembly_map_element_id != null && assembly_unit_name != null) {
        where.append(" AND a.map_id = "
                     + assembly_map_element_id.toString()
                     + " ");
      }
      // restrict by gene model type by joining to GeneModelType
      if (gene_model_type != null && gene_model_type.length > 0) {

        from.append(" , GeneModelType gmt ");
        where.append(" AND g1.gene_model_type_id = gmt.gene_model_type_id");
        where.append(" AND gmt.gene_model_type IN (");

        boolean firstType = true;
        for (int i = 0; i < gene_model_type.length; i++) {
          if (!firstType) {
            where.append(", ");
          }
          where.append(TextConverter.dbQuote(gene_model_type[i]));
          firstType = false;
        }
        where.append(") ");
      }
      //
      // changed this work table to include obsoletes - mhm
      //
      // for both "has full length cDNA" and "has cDNA or EST" searches, use
      // Gene_NTSequence_wrk work table that contains genes that are related
      // to mrna NT cDNA or EST sequences in the following ways:
      // - gene is directly related to sequence
      // - gene has a clone related to sequence
      // - gene's locus has a clone related to sequence

      // for full length cDNA, need to further restrict by sequence class
      // and full length
      if (has_full_length_cDNA != null && has_full_length_cDNA.booleanValue()) {
        where.append(" AND EXISTS ( "
                     + " SELECT 'X' "
                     + " FROM Gene_NTSequence_wrk gw "
                     + " WHERE g1.gene_id = gw.gene_id "
                     + " AND gw.sequence_class = 'cDNA' "
                     + " AND gw.is_full_length = 'T' ) ");
      }
      // changed this work table to include obsoletes - mhm
      // table contains only links to cDNA or EST sequences, so can
      // fulfill this
      // just by checking for gene id in table without additional criteria
      if (has_cDNA_or_EST != null && has_cDNA_or_EST.booleanValue()) {
        where.append(" AND EXISTS ("
                     + " SELECT 'X' "
                     + " FROM Gene_NTSequence_wrk gw "
                     + " WHERE gw.gene_id = g1.gene_id ) ");
      }
      // name type searches
      if (name != null) {
        appendNameCriteria(from, where, name, name_type, method);
      }
      if (is_predicted != null && is_predicted.booleanValue()) {
        where.append(" AND g1.is_predicted='T' ");
      }
      if (is_sequenced != null && is_sequenced.booleanValue()) {
        where.append(" AND g1.is_sequenced = 'T' ");
      }
      if (is_genetic_marker != null && is_genetic_marker.booleanValue()) {
        where.append(" AND EXISTS ("
                     + " SELECT 'X' "
                     + " FROM Gene_MapElement gme_m, GeneticMarker gm "
                     + " WHERE g1.gene_id = gme_m.gene_id "
                     + " AND gme_m.map_element_id = gm.map_element_id ) ");
      }

      // is/is not sequenced flag are mutually exclusive, but form controls
      // allow both
      // to be submitted - if that happens, punish clueless user by
      // entering both
      // values which is guaranteed to return no results...(per Carnegie)
      if (is_sequenced != null && is_sequenced.booleanValue()) {
        where.append(" AND g1.is_sequenced = 'T' ");
      }
      if (is_not_sequenced != null && is_not_sequenced.booleanValue()) {
        where.append(" AND ( g1.is_sequenced = 'F'"
                     + " OR g1.is_sequenced IS NULL ) ");
      }
      // restrict to genes that have associated publications by joining
      // to publication through TairObj_Ref
      if (has_publication != null && has_publication.booleanValue()) {
        where.append(" AND EXISTS ("
                     + " SELECT 'X' "
                     + " FROM TairObj_Ref tr, Publication p "
                     + " WHERE tr.tair_object_id = g1.tair_object_id "
                     + " AND tr.reference_id = p.reference_id ) ");
      }
      if (limit_time != null) {
        where.append(" AND g1.date_last_modified >= "
                     + TextConverter.dbQuote(limit_time, "mm/dd/yyyy")
                     + " ");
      }
      // covers case both for is on a map & assignment queries
      if (map_type != null) {
        where.append(" AND mp.name LIKE "
                     + TextConverter.dbQuote(map_type.toUpperCase() + "%")
                     + " ESCAPE '\\\' ");
      }
      // use chromosome from search form if it's there
      if (!TextConverter.isEmpty(chromosome) && !chromosome.equals("any")) {
        where.append(" AND g1.chromosome LIKE "
                     + TextConverter.dbQuote("%" + chromosome + "%")
                     + " ESCAPE '\\\' ");
        // if no chromosome entered, check to see if one is implied
        // by the search by map location element search
      } else if (units != null && units.useAssignmentChromosome()) {
        where.append(" AND g1.chromosome LIKE "
                     + TextConverter.dbQuote("%"
                                             + units.getAssignmentChromosome()
                                             + "%")
                     + " ESCAPE '\\\' ");
      }
      if (units != null && map_type != null) {
        Double start = units.get_start();
        Double end = units.get_end();
        String low_unit = units.get_low_unit();
        String high_unit = units.get_high_unit();
        if (start != null && low_unit != null) {
          if (low_unit.equalsIgnoreCase("cm")) {
            where.append(" AND ( a.start_position >= "
                         + start
                         + " OR a.end_position >= "
                         + start
                         + " ) AND a.units = 'cM' ");

          } else if (low_unit.equalsIgnoreCase("kb")) {
            where.append(" AND ( "
                         + " ( (a.start_position >= "
                         + start
                         + " OR a.end_position >= "
                         + start
                         + ") "
                         + " AND a.units = "
                         + TextConverter.dbQuote(low_unit)
                         + " ) "
                         + " OR ( (a.start_position >="
                         + start.doubleValue()
                         * 1000
                         + " OR a.end_position >="
                         + start.doubleValue()
                         * 1000
                         + " ) "
                         + " AND ( a.units ='bp' OR a.units is null"
                         + " ) ) ) ");
          }
        }
        if (end != null && high_unit != null) {
          if (high_unit.equalsIgnoreCase("cm")) {
            where.append(" AND ( a.end_position <= "
                         + end
                         + " OR a.start_position <= "
                         + end
                         + " ) AND a.units = 'cM' ");
          } else if (high_unit.equalsIgnoreCase("kb")) {
            where.append(" AND ( ( ( a.end_position <= "
                         + end
                         + " OR a.start_position <= "
                         + end
                         + " ) AND a.units = "
                         + TextConverter.dbQuote(high_unit)
                         + " ) OR "
                         + " ( ( a.end_position <="
                         + end.doubleValue()
                         * 1000
                         + " OR a.start_position <="
                         + end.doubleValue()
                         * 1000
                         + " ) AND ( a.units = 'bp' OR a.units is null "
                         + " ) ) )");
          }
        }
      }
    } // end if ( getOrigin() != null )
    what = getBaseSelect(position, queryID);
    String query = what + from.toString() + where.toString();
    return query;
  }

  /**
   * Appends criteria for different types of name searches
   */
  private void appendNameCriteria(StringBuffer from, StringBuffer where,
                                  String name, String name_type, String method) {
    // search all types of gene & locus names/aliases
    if (name_type == null || name_type.equals("name")) {
      name = TextConverter.convertEnds(name.toUpperCase(), method);
      where.append(" AND EXISTS ( "
                   + " SELECT 'X' "
                   + " FROM "
                   + getGeneNameAliasTable()
                   + " gna "
                   + " WHERE g1.gene_id = gna.gene_id "
                   + " AND lower(gna.name) LIKE lower("
                   + TextConverter.dbQuote(name)
                   + ") ESCAPE '\\\' ) ");

    } else if (name_type.equals("description")) {
      // search gene description
      name = TextConverter.convertEnds(name.toUpperCase(), method);
      where.append(" AND g1.description_uc LIKE "
                   + TextConverter.dbQuote(name)
                   + " ESCAPE '\\\' ");

    } else if (name_type.equals("phenotype")) {
      // search gene phenotype
      // this makes use of the gene phenotype work table
      // which is a denormalization-for-speed table.
      name = TextConverter.convertEnds(name.toUpperCase(), method);
      from.append(", Germp_MapEl_Pheno_wrk mpwrk, Gene_MapElement gme ");
      where.append(" AND gme.gene_id = g1.gene_id ");
      where.append(" AND mpwrk.map_element_id = gme.map_element_id ");
      where.append(" AND mpwrk.phenotype_uc LIKE ");
      where.append(TextConverter.dbQuote(name) + " ESCAPE '\\\' ");
    } else if (name_type.equals("accession")) {
      // search by GenBank accession using NT sequence
      name = TextConverter.convertEnds(name.toUpperCase(), method);
      where.append(" AND EXISTS ( "
                   + " SELECT 'X' "
                   + " FROM NucleotideSequence n, "
                   + " NucleotideSequence_MapElement nm "
                   + " WHERE nm.map_element_id = g1.map_element_id "
                   + " AND nm.nucleotide_seq_id = n.nucleotide_seq_id "
                   + " AND n.ic_accession LIKE "
                   + TextConverter.dbQuote(name)
                   + " ESCAPE '\\\') ");

    } else if (name_type.equals("genbank_gi")) {
      // search by GenBank gi # using NT sequence
      name = TextConverter.convertEnds(name.toUpperCase(), method);
      where.append(" AND EXISTS ( "
                   + " SELECT 'X' "
                   + " FROM NucleotideSequence n, "
                   + " NucleotideSequence_MapElement nm "
                   + " WHERE nm.map_element_id = g1.map_element_id "
                   + " AND nm.nucleotide_seq_id = n.nucleotide_seq_id "
                   + " AND n.genbank_gi LIKE "
                   + TextConverter.dbQuote(name)
                   + " ESCAPE '\\\') ");
    }
  }

  /*
   * Returns description of search criteria used to create result set. This is a
   * convenience method to simplify life at the JSP search summary page. Include
   * information on total number of matches for complete description of result
   * set. Interpretation of search params is slightly different if doing general
   * search versus a stand-alone gene search; use isGeneral flag in searchParams
   * to determine which type of search was done.
   */
  private String getFormatSearchCriteria(DBconnection conn, Map _searchParams,
                                         int resultSize, int secondaryResultSize)
      throws SQLException {
    StringBuffer buffer = null;
    String criteria = null;
    Boolean isGeneral = null;
    Boolean is_ann_type = null;
    boolean isKeywordCriteria = false;

    Map searchParams = TextConverter.scrub(_searchParams);

    if (searchParams != null) {
      buffer = new StringBuffer();

      // do general search version of criteria
      isGeneral = (Boolean)searchParams.get("isGeneral");
      is_ann_type = (Boolean)searchParams.get("is_ann_type");

      if (isGeneral != null && isGeneral.booleanValue()) {
        String searchTerm = (String)searchParams.get("searchTerm");
        String method = (String)searchParams.get("method");

        buffer.append("Your query for genes where ");

        if (!TextConverter.isEmpty(searchTerm)) {
          buffer.append("gene name, description, phenotype, locus name, uniprot id or "
                        + "GenBank accession ");
          buffer.append(TextConverter.convertMethods(method));
          buffer.append(" the term <font class=\"emphasis\">"
                        + searchTerm
                        + "</font> ");
        }

        // else do annotation type search version of criteria
      } else if (is_ann_type != null && is_ann_type.booleanValue()) {
        String keyword_name = (String)searchParams.get("keyword_name");
        String scope = (String)searchParams.get("scope");
        buffer.append("Your query for genes where ");
        if (!TextConverter.isEmpty(keyword_name)) {
          buffer.append("associated to the ");
          buffer.append(scope);
          buffer.append(" of the keyword <font class=\"emphasis\">"
                        + keyword_name
                        + "</font> ");
        }

      } else { // otherwise show criteria for stand alone gene search

        String search_name = (String)searchParams.get("name");
        String search_method = (String)searchParams.get("method");
        String name_type = (String)searchParams.get("name_type");

        String[] gene_model_type =
          (String[])searchParams.get("gene_model_type");
        String taxon_name = (String)searchParams.get("taxon_name");

        Boolean is_predicted = (Boolean)searchParams.get("is_predicted");
        Boolean has_full_length_cDNA =
          (Boolean)searchParams.get("has_full_length_cDNA");
        Boolean is_sequenced = (Boolean)searchParams.get("is_sequenced");
        Boolean is_not_sequenced =
          (Boolean)searchParams.get("is_not_sequenced");
        Boolean is_genetic_marker =
          (Boolean)searchParams.get("is_genetic_marker");
        Boolean is_on_a_map = (Boolean)searchParams.get("is_on_a_map");
        isObsolete = (Boolean)searchParams.get("is_obsolete");
        Boolean has_cDNA_or_EST = (Boolean)searchParams.get("has_cDNA_or_EST");
        Boolean has_publication = (Boolean)searchParams.get("has_publication");

        java.util.Date limit_time =
          (java.util.Date)searchParams.get("limit_time");
        String chromosome = (String)searchParams.get("chromosome");
        String high_unit = (String)searchParams.get("high_unit");
        String high_range = (String)searchParams.get("high_range");
        String low_unit = (String)searchParams.get("low_unit");
        String low_range = (String)searchParams.get("low_range");
        String range_type = (String)searchParams.get("range_type");
        String map_type = (String)searchParams.get("map_type");
        Units units = (Units)searchParams.get("units");
        String keyword_term = null;
        String keyword_method = null;
        String keywordTypes = null;

        if (searchParams.get("keyword_term") != null) {
          keyword_term = (String)searchParams.get("keyword_term");
          keyword_method = (String)searchParams.get("keyword_method");
          isKeywordCriteria = true;
        } else {
          keyword_term = "any";
        }
        if (searchParams.get("keyword_type") != null) {
          TfcKeywordType type = null;
          String[] keywordTypeIDs = (String[])searchParams.get("keyword_type");
          for (int i = 0; i < keywordTypeIDs.length; i++) {
            type = new TfcKeywordType(conn, keywordTypeIDs[i]);
            keywordTypeIDs[i] = type.get_type();
          }
          keywordTypes = getMultipleFeatures(keywordTypeIDs);
          if (!keywordTypes.equalsIgnoreCase(" any")) {
            isKeywordCriteria = true;
          }
        }
        String evidence = null;
        if (searchParams.get("evidence") != null) {
          evidence =
            getMultipleFeatures((String[])searchParams.get("evidence"));
          if (!evidence.equalsIgnoreCase(" any")) {
            isKeywordCriteria = true;
          }
        }
        // assembly unit data will only be present if search was linked to from
        // assembly unit detail page
        String assembly_unit_name =
          (String)searchParams.get("assembly_unit_name");

        boolean first = true;
        buffer.append("Your query for genes where ");

        if (!TextConverter.isEmpty(search_name)) {
          if (name_type != null && name_type.equals("description")) {
            buffer.append("gene description ");
          } else if (name_type != null && name_type.equals("phenotype")) {
            buffer.append("gene phenotype ");
          } else if (name_type != null && name_type.equals("accession")) {
            buffer.append("GenBank accession ");
          } else if (name_type != null && name_type.equals("genbank_gi")) {
            buffer.append("GenBank gi ");
          } else {
            buffer.append("gene name ");
          }
          buffer.append(TextConverter.convertMethods(search_method));
          buffer.append(" the term <font class=\"emphasis\">"
                        + search_name
                        + "</font> ");
          first = false;
        }

        if (!TextConverter.isEmpty(taxon_name)) {
          first = appendComma(buffer, first);
          buffer.append(" taxon name is " + taxon_name);
        }
        if (!TextConverter.isEmpty(assembly_unit_name)) {
          first = appendComma(buffer, first);
          buffer.append("annotation unit is " + assembly_unit_name);
        }

        if (gene_model_type != null && gene_model_type.length > 0) {
          first = appendComma(buffer, first);
          buffer.append("gene model type is ");
          boolean firstType = true;
          for (int i = 0; i < gene_model_type.length; i++) {
            if (!firstType) {
              buffer.append(" or ");
            }
            buffer.append(gene_model_type[i]);
            firstType = false;
          }
        }

        if (has_publication != null && has_publication.booleanValue()) {
          first = appendComma(buffer, first);
          buffer.append("has associated literature");
        }

        if (is_predicted != null && is_predicted.booleanValue()) {
          first = appendComma(buffer, first);
          buffer.append("gene structure predicted");
        }

        if (has_full_length_cDNA != null && has_full_length_cDNA.booleanValue()) {
          first = appendComma(buffer, first);
          buffer.append("has full-length cDNA");
        }

        if (has_cDNA_or_EST != null && has_cDNA_or_EST.booleanValue()) {
          first = appendComma(buffer, first);
          buffer.append("has cDNA or EST");
        }

        if (is_sequenced != null && is_sequenced.booleanValue()) {
          first = appendComma(buffer, first);
          buffer.append("is sequenced");
        }

        if (is_not_sequenced != null && is_not_sequenced.booleanValue()) {
          first = appendComma(buffer, first);
          buffer.append("is not sequenced");
        }

        if (is_on_a_map != null && is_on_a_map.booleanValue()) {
          first = appendComma(buffer, first);
          buffer.append("is on a map");
        }

        if (isObsolete != null && isObsolete.booleanValue()) {
          first = appendComma(buffer, first);
          buffer.append("is obsolete");
        }

        if (is_genetic_marker != null && is_genetic_marker.booleanValue()) {
          first = appendComma(buffer, first);
          buffer.append("is genetic marker");
        }

        if (limit_time != null) {
          first = appendComma(buffer, first);
          buffer.append("entered after: "
                        + TextConverter.dateToString(limit_time));
        }

        if (map_type != null) {
          first = appendComma(buffer, first);
          buffer.append("map type is " + map_type);
        }

        if (chromosome != null) {
          first = appendComma(buffer, first);
          buffer.append("chromosome is "
                        + Units.translateChromosome(chromosome));
        }

        // if searching by element, format is element_type name,
        // else if searching by raw position format is position units
        String formatLowRange = null;
        String formatHighRange = null;
        if (low_range != null
            && low_unit != null
            && (low_unit.equalsIgnoreCase("kb") || low_unit.equalsIgnoreCase("cm"))) {
          formatLowRange = low_range + " " + low_unit;

        } else {
          formatLowRange = low_unit + " " + low_range;
        }

        if (high_range != null
            && high_unit != null
            && (high_unit.equalsIgnoreCase("kb") || high_unit.equalsIgnoreCase("cm"))) {
          formatHighRange = high_range + " " + high_unit;

        } else {
          formatHighRange = high_unit + " " + high_range;
        }

        if (range_type != null && range_type.equalsIgnoreCase("around")) {
          if (units != null) {
            first = appendComma(buffer, first);

            if (low_range != null) {
              buffer.append("around: " + formatLowRange + " within ");
              buffer.append(units.getVariance() + " " + units.get_low_unit());
            }
          }

        } else if (range_type != null && range_type.equalsIgnoreCase("between")) {
          first = appendComma(buffer, first);

          if (low_range != null || high_range != null) {
            buffer.append("range: ");
          }

          if (low_range != null) {
            buffer.append(formatLowRange);
          }

          if (low_range != null && high_range != null) {
            buffer.append(" to ");
          }

          if (high_range != null) {
            buffer.append(formatHighRange + " ");
          }
        }
        if (isKeywordCriteria) {
          if (!keyword_term.equalsIgnoreCase("any")) {
            first = appendComma(buffer, first);
            buffer.append("keyword ");
            buffer.append(TextConverter.convertMethods(keyword_method));
            buffer.append(" the term <font class=\"emphasis\">"
                          + keyword_term
                          + "</font> ");
          } else {
            first = appendComma(buffer, first);
            buffer.append("keyword term is ");
            buffer.append(" <font class=\"emphasis\">"
                          + keyword_term
                          + "</font> ");
          }
          if (extdb_id != null) {
            buffer.append(" and keyword external accession is ");
            buffer.append(" <font class=\"emphasis\">" + extdb_id + "</font>");
          }
          if (!keywordTypes.equalsIgnoreCase(" any")) {
            buffer.append(" and keyword types of " + keywordTypes);
          }
          if (!evidence.equalsIgnoreCase(" any")) {
            buffer.append(" and evidences of " + evidence);
          }
        }
      }

      if (resultSize == 1) {
        if (isKeywordCriteria) {
          buffer.append(" resulted in <font class=\"emphasis\">"
                        + resultSize
                        + "</font> locus match with "
                        + " <font class=\"emphasis\">"
                        + secondaryResultSize
                        + "</font> distinct gene model "
                        + "associated to the keyword or "
                        + "keyword children terms.");
        } else {
          buffer.append(" resulted in <font class=\"emphasis\">"
                        + resultSize
                        + "</font> locus match with "
                        + " <font class=\"emphasis\">"
                        + secondaryResultSize
                        + "</font> distinct gene model.");
        }
      } else {
        if (isKeywordCriteria) {
          buffer.append(" resulted in <font class=\"emphasis\">"
                        + resultSize
                        + "</font> loci matches with "
                        + " <font class=\"emphasis\">"
                        + secondaryResultSize
                        + "</font> distinct gene models "
                        + "associated to the keyword or "
                        + "keyword children terms.");
        } else {
          buffer.append(" resulted in <font class=\"emphasis\">"
                        + resultSize
                        + "</font> loci matches with "
                        + " <font class=\"emphasis\">"
                        + secondaryResultSize
                        + "</font> distinct gene models.");
        }
      }
      criteria = buffer.toString();

    }
    return criteria;
  }

  private String getMultipleFeatures(String[] features) {
    StringBuffer f_buffer = new StringBuffer(" ");
    for (int i = 0; i < features.length; i++) {
      if (i > 0) {
        f_buffer.append(" , ");
      }
      f_buffer.append(features[i]);
    }
    return (new String(f_buffer));
  }

  private final boolean appendComma(StringBuffer buffer, boolean first) {
    if (!first) {
      buffer.append(", ");
    } else {
      first = false;
    }
    return first;
  }

}
