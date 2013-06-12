// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.34 $
// $Date: 2006/09/26 21:58:33 $
// ------------------------------------------------------------------------------

package org.tair.search;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.tair.bs.community.BsAttribution;
import org.tair.querytools.AttributionObjectCollection;
import org.tair.querytools.GeneAliasCollection;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcGene;
import org.tair.tfc.TfcGeneAlias;
import org.tair.tfc.TfcGeneModelType;
import org.tair.tfc.TfcGeneSymbolReference;
import org.tair.tfc.TfcKeyword;
import org.tair.tfc.TfcLocus;
import org.tair.tfc.TfcSymbol;
import org.tair.utilities.Accessible;
import org.tair.utilities.AccessionManager;
import org.tair.utilities.EmptyTextConverter;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;


/**
 * GeneSummary represents the information needed to display one gene record as
 * part of the gene search results returned by <code>GeneSearcher</code>.
 * GeneSummary contains all fields from the temp table used to hold gene search
 * results as well as collections of additional information (such as aliases &
 * assignments). In addition to being used for display, GeneSummary is used to
 * create downloads of gene data from the search results pages. provide obsolete
 * labels to genes and loci that have been obsoleted - mhm
 * 
 * <p>
 * GeneSummary implements Accessible interface to facilitate creation of the
 * object's TAIR accession number through <code>AccessionManager</code>
 */

public class GeneSummary implements Accessible {

  private Long tair_object_id;
  private Long map_element_id;
  private Long gene_id;
  private String name;
  private String description;
  private String locus;
  private String units;
  private Long locus_id;
  private Long gene_model_type_id;
  private String otherNames;
  private ArrayList nameList;
  private String keywords_as_list;
  private String highlightedKeywords;
  private String searchString;
  private String obsoleteLabel = " ";
  private String locusObsoleteLabel = " ";

  // gene model type for gene
  private TfcGeneModelType geneModelType;

  // gene aliases for gene - stored as TfcGeneAlias
  private GeneAliasCollection geneAliases;

  // symbols for gene - stored as TfcSymbol
  private Collection<TfcSymbol> symbols;

  // Attributions for gene - stored as BsAttribution
  private AttributionObjectCollection attributions;

  // composite value determined by combination of gene's NT sequence values
  private boolean has_full_length_cDNA = false;

  /**
   * Default constructor, creates an empty gene summary that you can populate by
   * calling accessors.
   */
  public GeneSummary() {
  }

  /**
   * Creates an instance of GeneSummary for a specified gene
   * 
   * @param conn an active connection to the database
   * @param gene_id identifier for the gene to summarize
   * @exception SQLException in the case of an invalid operation or database
   *              error
   */
  public GeneSummary(DBconnection conn, Long gene_id) throws SQLException {
    if (gene_id != null) {
      populateGene(conn, gene_id);
      get_information(conn); // get associated info for gene
    }
  }

  /**
   * Populate the object with basic gene information. The system calls this
   * method only if it created the object with a specific id, as opposed to
   * creating an empty object with the default constructor.
   * 
   * @param conn a valid database connection
   * @param gene_id a unique identifier for the gene
   * @throws SQLException when there is a problem querying information from the
   *           database
   */
  private void populateGene(DBconnection conn, Long gene_id)
      throws SQLException {
    String query = null;
    ResultSet results = null;
    boolean found = false;

    query =
        "SELECT DISTINCT g.map_element_id, "
            + "g.tair_object_id, "
            + "g.name, " 
            + "l.locus_id,"
            + "l.is_obsolete AS locus_is_obsolete," 
            + "g.gene_model_type_id, "
            + "g.gene_id, " 
            + "g.is_obsolete AS is_obsolete, " 
            + "g.units, "
            + "l.name AS locus " 
      + "FROM Gene g, MapElement_Locus mel, Locus l " 
      + "WHERE g.map_element_id = mel.map_element_id "
            + "AND mel.locus_id = l.locus_id " 
            + "AND g.gene_id = " + gene_id.toString();

    conn.setQuery(query);
    results = conn.getResultSet();
    if (results.next()) {
      found = true;

      set_map_element_id(new Long(results.getLong("map_element_id")));
      set_tair_object_id(new Long(results.getLong("tair_object_id")));
      set_gene_id(new Long(results.getLong("gene_id")));
      set_locus_id(new Long(results.getLong("locus_id")));
      setLocusObsoleteLabel(results.getString("locus_is_obsolete"));
      set_name(results.getString("name"));
      setObsoleteLabel(results.getString("is_obsolete"));
      set_gene_model_type_id(new Long(results.getLong("gene_model_type_id")));
      set_units(results.getString("units"));
      set_locus(results.getString("locus"));
    }
    conn.releaseResources();

    if (!found) {
      throw new RecordNotFoundException("No gene found with gene id: "
                                        + gene_id);
    }
  }

  // id here is locus_id since it reflects the row id on the results page
  // on the gene search results page a "row" is represented by a locus
  // and then the additional gene information is included -- there may
  // be multiple genes for each locus
  public String populateDownloadRow(DBconnection conn, Long locusId)
      throws SQLException {
    DBconnection conn2 = null;
    DBReadManager connectionPool = null;
    ResultSet results = null;
    StringBuffer export = new StringBuffer();
    String query = null;
    if (conn != null && locusId != null) {
      query =
          "SELECT DISTINCT ( g.gene_id ), g.map_element_id, "
              + "g.tair_object_id, "
              + "g.name, "
              + "l.locus_id,"
              + "l.is_obsolete AS locus_is_obsolete,"
              + "g.gene_model_type_id, "
              +
              // "g.gene_id, "+
              "g.is_obsolete AS is_obsolete, " + "g.units, "
              + "l.name AS locus " + "FROM Gene g, MapElement_Locus mel, "
              + "Locus l " + "WHERE g.map_element_id = mel.map_element_id "
              + "AND mel.locus_id = l.locus_id " + "AND l.locus_id = "
              + locusId.toString();
      conn.setQuery(query);
      results = conn.getResultSet();
      try {
        connectionPool = DBReadManager.getInstance();
        conn2 = connectionPool.get_connection();
        while (results.next()) {
          set_map_element_id(new Long(results.getLong("map_element_id")));
          set_tair_object_id(new Long(results.getLong("tair_object_id")));
          set_gene_id(new Long(results.getLong("gene_id")));
          set_locus_id(new Long(results.getLong("locus_id")));
          setLocusObsoleteLabel(results.getString("locus_is_obsolete"));
          set_name(results.getString("name"));
          setObsoleteLabel(results.getString("is_obsolete"));
          set_gene_model_type_id(new Long(results.getLong("gene_model_type_id")));
          set_units(results.getString("units"));
          set_locus(results.getString("locus"));
          get_information(conn2);
          populateGeneModelType();
          export.append(createExport(conn2));
        }
      } finally {
        if (conn2 != null) {
          connectionPool.return_connection(conn2);
        }
      }
    }
    return export.toString();
  }

  public void set_tair_object_id(Long id) {
    this.tair_object_id = id;
  }

  public Long get_tair_object_id() {
    return tair_object_id;
  }

  public void set_map_element_id(Long id) {
    this.map_element_id = id;
  }

  public Long get_map_element_id() {
    return map_element_id;
  }

  public void set_gene_id(Long id) {
    this.gene_id = id;
  }

  public Long get_gene_id() {
    return gene_id;
  }

  public void set_name(String name) {
    this.name = name;
  }

  public String get_name() {
    return name;
  }

  public void setObsoleteLabel(String isObsolete) {
    if (isObsolete.equalsIgnoreCase("T")) {
      obsoleteLabel = "(obsolete)";
    } else {
      obsoleteLabel = "";
    }
  }

  public String getObsoleteLabel() {
    return obsoleteLabel;
  }

  public void setLocusObsoleteLabel(String isObsolete) {
    if (isObsolete.equalsIgnoreCase("T")) {
      locusObsoleteLabel = "(obsolete)";
    } else {
      locusObsoleteLabel = "";
    }
  }

  public String getLocusObsoleteLabel() {
    return locusObsoleteLabel;
  }

  public void set_description(String descr) {
    this.description = descr;
  }

  public String get_description() {
    return description;
  }

  public void set_units(String units) {
    this.units = units;
  }

  public String get_units() {
    return units;
  }

  public void set_locus_id(Long id) {
    this.locus_id = id;
  }

  public Long get_locus_id() {
    return locus_id;
  }

  public void set_locus(String locus_name) {
    this.locus = locus_name;
  }

  public String get_locus() {
    return locus;
  }

  public boolean get_has_full_length_cDNA() {
    return has_full_length_cDNA;
  }

  public Long get_gene_model_type_id() {
    return gene_model_type_id;
  }

  /**
   * Sets value of gene model type id for gene. Gene model type itself must be
   * explicitly populated using the populateGeneModelType method
   */
  public void set_gene_model_type_id(Long id) {
    this.gene_model_type_id = id;
  }

  // 
  // TfcGeneModelType wrapper
  //
  public String get_gene_model_type() {
    return (geneModelType != null) ? geneModelType.get_gene_model_type() : null;
  }

  private void setSearchString(String searchString) {
    this.searchString = searchString;
  }

  public String getSearchString() {
    return searchString;
  }

  private void setKeywordList(DBconnection conn, boolean download, String keyword_types)
      throws SQLException {
    if (get_tair_object_id() != null) {

      StringBuffer kw_list = new StringBuffer(" ");
      boolean first = true;
      ResultSet results = null;

      String query =
          " SELECT CASE WHEN kd.display IS NULL THEN k.keyword ELSE kd.display END AS keyword"
              + " FROM Keyword k LEFT OUTER JOIN KeywordDisplay kd ON k.keyword_id = kd.keyword_id"
              + " WHERE EXISTS ( SELECT 'X' FROM TairObject_Keyword tok "
              + " WHERE k.keyword_id = tok.keyword_id AND "
              + " tok.tair_object_id = "
              + get_tair_object_id().toString()
              + " ) ";
      conn.setQuery(query);
      results = conn.getResultSet();

      while (results.next()) {
        if (!first) {
          kw_list.append(", ");
        }
	kw_list.append(results.getString("keyword"));
        first = false;
      }

      TfcLocus tfcLocus = new TfcLocus(conn,get_locus_id());  
      String locus_object_id = tfcLocus.get_tair_object_id().toString(); 
      Set locus_keywords = 
	  new TreeSet(TfcKeyword.retrieveKeywords(conn, locus_object_id, "with_nots", keyword_types)); 

      for (Object kw : locus_keywords) {
	  if (!first) {
	      kw_list.append(", ");
	  }
	  kw_list.append(kw);
	  first = false;
      }

      conn.releaseResources();
      keywords_as_list = new String(kw_list);
    }
  }

  private String getKeywordList() {
    return keywords_as_list;
  }
    
  /**
   * Returns a list of all keywords for this gene.
   * setHighlightedKeywordList should be called before this method.
   */  
  public List getKeywords() {
    List result = new ArrayList();

    if (keywords_as_list != null) {
      String[] keywords = keywords_as_list.split(",");
      for(int i=0; i < keywords.length; i++) {
        String keyword = keywords[i].trim();
	if (keyword.length() > 0) {
	  result.add(keyword);
	}
      }
    }

    return result;
  }

  public static String makeHighlightedKeywordList(Collection keywords, String searchString, 
						  String delimiter, boolean isExact) {

    StringBuffer sb = new StringBuffer();

    Iterator iter = keywords.iterator();
    while (iter.hasNext()) {
	String keyword = (String) iter.next();
	if (searchString != null) {
	    keyword = highlight(keyword, searchString, isExact);
	}
        sb.append(keyword);
        if (iter.hasNext()) {
            sb.append(delimiter);
        }
    }
     return sb.toString();

  }
  
  public static String makeHighlightedKeywordList(Collection keywords, String searchString, 
						  String delimiter, boolean isExact, String order) {

    StringBuffer sb = new StringBuffer();
    if ( order.equals("nots_in_back") ){
        StringBuffer notsb = new StringBuffer();
        Iterator iter = keywords.iterator();
        while (iter.hasNext() ) {
            String keyword = (String) iter.next();
            if (searchString != null){
	            keyword = highlight(keyword, searchString, isExact);
            }
            if (keyword.startsWith("NOT")){
                keyword = keyword.replaceAll("NOT", "<b>NOT</b>");
                notsb.append(keyword);
                if (iter.hasNext()) notsb.append(delimiter);
            }else{
                sb.append(keyword);
                if (iter.hasNext()) sb.append(delimiter);
            }
        }
        if (notsb.length() > 0){
            sb.append(delimiter);
            sb.append(notsb);
        }
    } else {
        Iterator iter = keywords.iterator();
        while (iter.hasNext()) {
	        String keyword = (String) iter.next();
	        if (searchString != null) {
	            keyword = highlight(keyword, searchString, isExact);
	        }
            sb.append(keyword);
            if (iter.hasNext()) {
                sb.append(delimiter);
            }
        }
    }
    return sb.toString();
  }


  public static String highlight(String keyword, String searchString, boolean isExact) {
     String highlightedString =
	 "<font class=\"emphasis\">" + searchString + "</font>";

     if (isExact && keyword.equalsIgnoreCase(searchString)) {
	 keyword = highlightedString;
     } else {
	 keyword = keyword.replaceAll("(?i:"+searchString+")", highlightedString);
     }

     return keyword;
  }


  // provides substitutions of * for the search string ( exact hits on
  // the keywords
  // are done via setKeywordList() as the keyword list is being built)
  // , if provided,
  // then inserts the highlighting wherever the substitions exist
  public void setHighlightedKeywordList(DBconnection conn, String searchString,
                                        boolean isExact) throws SQLException {
      setHighlightedKeywordList(conn, searchString, isExact, "all");
  }

  public void setHighlightedKeywordList(DBconnection conn, String searchString,
                            boolean isExact, String keyword_types) throws SQLException {
    setSearchString(searchString);
    // not for download
    setKeywordList(conn, false, keyword_types);
    if (getSearchString() != null) {
      StringBuffer sb = new StringBuffer(getKeywordList());
      String highlightedString =
          "<font class=\"emphasis\">" + getSearchString() + "</font>";
      String delim = "*";
      int startReplacePos = 0;

      if (!isExact) {
        // do additional substitutions before inserting highlighting
        startReplacePos =
            getKeywordList().indexOf(getSearchString(), startReplacePos);
        while (startReplacePos > -1) {
          sb.replace(startReplacePos, startReplacePos
                                      + getSearchString().length(), delim);
          startReplacePos =
              sb.toString().indexOf(getSearchString(), startReplacePos);
        }
      }

      startReplacePos = 0;
      startReplacePos = sb.toString().indexOf(delim, startReplacePos);
      while (startReplacePos > -1) {
        sb.replace(startReplacePos, startReplacePos + delim.length(),
                   highlightedString);
        startReplacePos = sb.toString().indexOf(delim, startReplacePos);
      }
      highlightedKeywords = sb.toString();

    } else { // if no search string provided, return the keyword
      // list as usual, unhighlighted
      highlightedKeywords = getKeywordList();
    }
  }

  public String getHighlightedKeywordList() {
    return highlightedKeywords;
  }
  
  /**
   * Retrieves associated information for gene including attributions, aliases
   * 
   * @param conn An active connection to the database
   */
  public void get_information(DBconnection conn) throws SQLException {
    /*
     * if ( this.tair_object_id != null ) { attributions = new
     * AttributionObjectCollection( conn, tair_object_id, "submitted_by" ); }
     */

    if (get_gene_id() != null) {
      this.geneAliases = new GeneAliasCollection(conn, get_gene_id());
      this.symbols = TfcGeneSymbolReference.symbols_for_gene(conn, get_gene_id());
      setOtherNames();
      set_description(TfcGene.retrieveDescription(conn, get_gene_id()));
      populateHasFullLengthCDNA(conn);
    }

  }

  /**
   * Populate gene model type. This is done separately from get_information
   * since the data is only needed when creating downloads of genes. This method
   * assumes basic gene data (including gene model type id) has already been
   * populated
   * 
   * @throws SQLException if a database error occurs
   */
  public void populateGeneModelType() throws SQLException {
    this.geneModelType = new TfcGeneModelType(get_gene_model_type_id());
  }

  //
  // retrieve NT sequences for gene to determine if gene is associated to
  // full length cDNA NT sequence directly, through its locus's clone, or
  // through gene's clone. This value is stored in the Gene_NTSequence_wrk
  // work table since runtime queries are very expensive.
  private void populateHasFullLengthCDNA(DBconnection conn) throws SQLException {
    this.has_full_length_cDNA = false;
    String query =
        "SELECT gene_id " + "FROM Gene_NTSequence_wrk " + "WHERE gene_id = "
            + get_gene_id().toString() + " " + "AND sequence_class = 'cDNA' "
            + "AND is_full_length = 'T' ";
    conn.setQuery(query);
    ResultSet results = conn.getResultSet();
    if (results.next()) {
      this.has_full_length_cDNA = true;
    }
    conn.releaseResources();
  }

  /**
   * Determines if gene has associated gene aliases
   * 
   * @return <code>true</code> if gene has associated gene aliases, or
   *         <code>false</code> if no gene aliases associated with gene
   */
  public boolean hasGeneAliases() {
    return (geneAliases != null && !geneAliases.isEmpty());
  }

  /**
   * Sets this.otherNames to have the original_alias for orf aliases and
   * symbols associated with this gene separated by semi-colons (;).
   */
  private void setOtherNames() throws SQLException {

    TreeSet uniqueNames = new TreeSet();
    Iterator aliasItr = geneAliases.getAliases( "orf" );

    while (aliasItr != null && aliasItr.hasNext()) {
        TfcGeneAlias alias = (TfcGeneAlias) aliasItr.next();
	
	if ( !uniqueNames.contains( alias.get_original_alias() ) ) { // or just alias?
	    uniqueNames.add( alias.get_original_alias() );
	}
    }
    
    // Add the symbols
    if ( this.symbols != null ) {
	for ( TfcSymbol symbol : this.symbols ) {
	    // add the symbol
	    if ( symbol.get_symbol() != null
		 && !uniqueNames.contains( symbol.get_symbol() ) ) {
		uniqueNames.add( symbol.get_symbol().toUpperCase() );
	    }
	    
	    // add the symbols full name
	    if ( symbol.get_full_name() != null
		 && !uniqueNames.contains( symbol.get_full_name() ) ) {
		uniqueNames.add( symbol.get_full_name().toUpperCase() );
	    }
	}
    } 

    String otherNames = "";
    if ( uniqueNames != null && !uniqueNames.isEmpty() ) {
      nameList = new ArrayList( uniqueNames );
      otherNames = TextConverter.join( "; ", nameList );
    }
 
    this.otherNames = otherNames;
  }

  private String getOtherNames() {
    return this.otherNames;
  }

  /**
   * Retrieves gene aliases for gene
   * 
   * @return gene aliases as an <code>Iterator</code> of
   *         <code>TfcGeneAlias</code> objects, or <code>null</code> if no
   *         gene aliases for this gene
   */
  public Iterator get_gene_aliases() {
    return (hasGeneAliases()) ? geneAliases.iterator() : null;
  }

  /**
   * Retrieves gene aliases as delimited string
   * 
   * @return All gene aliases for this gene as a semi-colon (";") delimited
   *         string, or <code>null</code> if no gene aliases for this gene
   */
  public String get_gene_alias_string() {
    StringBuffer buffer = null;
    String aliases = null;
    Iterator iter = get_gene_aliases();
    boolean first = true;

    if (iter != null) {
      while (iter.hasNext()) {
        TfcGeneAlias gene_alias = (TfcGeneAlias)iter.next();
        String type = gene_alias.get_alias_type();
        if (!(type.equals("gene") || type.equals("orf"))) {
          continue;
        }
        String new_alias = gene_alias.get_original_alias();
        if (new_alias != null && !new_alias.equals(get_name())) {
          if (buffer == null) {
            buffer = new StringBuffer();
          }
          if (!first) {
            buffer.append("; ");
          }
          buffer.append(new_alias);
          first = false;
        }
      }
      if (buffer != null) {
        aliases = buffer.toString();
      }
    }
    return aliases;
  }

  /**
   * Retrieves attributions for gene from the db
   * 
   * @param value the attributions
   */
  public void set_attributions(DBconnection conn) throws SQLException {
    if (this.tair_object_id != null) {
      attributions = new AttributionObjectCollection(conn, tair_object_id);
    }
  }

  /**
   * Determines if gene has associated attributions
   * 
   * @return <code>true</code> if gene has associated attributions, or
   *         <code>false</code> if no attributions associated to gene
   */
  public boolean hasAttributions() {
    return (attributions != null && !attributions.isEmpty());
  }

  /**
   * Retrieves attributions for gene
   * 
   * @return Attributions for this gene as an <code>Iterator</code> of
   *         <code>BsAttribution</code>s or <code>null</code> if no
   *         attributions for gene.
   */
  public List<BsAttribution> get_attributions() {
    return (hasAttributions()) ? attributions.getAttributions() : null;
  }

  /**
   * Retrieves attribution sources as delimited string
   * 
   * @return Attribution sources for this gene as a semicolon (";") delimited
   *         string, or <code>null</code> if no attributions for this gene
   * @throws SQLException when can't lazily load community for attribution
   */
  public String get_attribution_source_string() throws SQLException {
    return hasAttributions() ? attributions.get_attribution_source_string()
        : null;
  }

  /**
   * Retrieves TAIR accession number for this object. Implemented here to
   * satisfy the <code>Accessible</code> interface
   * 
   * @return TAIR accession number for this object
   */
  public final String getAccession() {
    return AccessionManager.getAccession(this);
  }

  /**
   * Retrieves element type of this object for use in creating TAIR accession
   * number. Implemented here to satisfy the <code>Accessible</code> interface
   * 
   * @return Object's element type (gene) for use in creating TAIR accession
   */
  public final String getElementType() {
    return "gene";
  }

  /**
   * Retrieves object's super id (tair_object_id) for use in creating TAIR
   * accession number. Implemented here to satisfy the <code>Accessible</code>
   * interface
   * 
   * @return ID to use for creating TAIR accession number for this object
   */
  public final Long getSuperID() {
    return get_tair_object_id();
  }

  /**
   * Creates tab delimited string of gene characteristics for download feature.
   * Gene data is in the following format:
   * <ul>
   * <li>TAIR Accession</li>
   * <li>Locus Name</li>
   * <li>Gene Model Name</li>
   * <li>Gene Type</li>
   * <li>Description</li>
   * <li>Other Name (Type) </li>
   * <li>Attribution Source(s)</li>
   * <li>Is full length cDNA</li>
   * </ul>
   * 
   * @return Tab-delimited string of gene data
   */
  public String createExport(DBconnection conn) throws SQLException {
    StringBuffer export = new StringBuffer();

    setKeywordList(conn, true, "all");
    //get_information(conn);
    populateGeneModelType();

    export.append(getAccession() + "\t");
    export.append(EmptyTextConverter.convert(get_locus())
                  + EmptyTextConverter.convert(getLocusObsoleteLabel()) + "\t");
    export.append(EmptyTextConverter.convert(get_name())
                  + EmptyTextConverter.convert(getObsoleteLabel()) + "\t");
    export.append(EmptyTextConverter.convert(get_gene_model_type()) + "\t");
    export.append(EmptyTextConverter.convert(get_description()) + "\t");
    export.append(EmptyTextConverter.convert(getOtherNames()) + "\t");
    // export.append( EmptyTextConverter.convert
    // ( get_attribution_source_string() ) + "\t" );
    export.append(EmptyTextConverter.convert(getKeywordList()) + "\t");
    export.append(get_has_full_length_cDNA() + "\n");
    return export.toString();
  }

  /**
   * Retrieves column order of gene export
   * 
   * @return Column order used when creating export as a tab-delimited string
   */
  public String getExportHeader() {
    String header =
        "TAIR Accession\t" + "Locus\t" + "Gene Model\t" + "Gene Type\t"
            + "Description\t" + "Other Name(Type)\t" +
            // "Source\t" +
            "Keywords\t" + "Is full length cDNA\n";
    return header;
  }

  /**
   * Returns HTML string to create table of gene aliases
   * 
   * @return HTML to create table of gene aliases
   */
  public String get_other_name_table() {
    StringBuffer other_name = null;
    String retString = null;
    
    other_name = new StringBuffer();
    other_name.append("<table valign=\"top\">");
    if (nameList != null ) {
    	Iterator iter = nameList.iterator(); 

    	while (iter.hasNext() ) {
      	String name = (String) iter.next();
      	if (!name.equals("")) {
        	other_name.append("<tr valign=\"top\">");
        	other_name.append("<td class=\"sm\">");
        	other_name.append(name);
        	other_name.append("</td>");
        	other_name.append("</tr>");
      	}
    	}
    }
    other_name.append("</table>");
    retString = other_name.toString();
    return retString;
  }

  /**
   * For unit testing only
   */
  public void test() {
    System.out.println("****** Gene content test ******");
    System.out.println("tair_object_id: " + get_tair_object_id());
    System.out.println("map_element_id: " + get_map_element_id());
    System.out.println("gene_id: " + get_gene_id());
    System.out.println("name: " + get_name());
    System.out.println("obsolete label: " + getObsoleteLabel());
    System.out.println("description: " + get_description());
    System.out.println("gene_model_type: " + get_gene_model_type());
    System.out.println("units: " + get_units());
    System.out.println("locus: " + get_locus());
    System.out.println("locus obsolete label: " + getLocusObsoleteLabel());
    System.out.println("locus_id: " + get_locus_id());
    System.out.println("gene_model_type_id: " + get_gene_model_type_id());
    System.out.println("has_full_length_cDNA: " + get_has_full_length_cDNA());
    System.out.println("keyword list: " + getKeywordList());
    System.out.println("otherNames: " + getOtherNames());
    System.out.println("otherName Table: " + get_other_name_table());

    if (hasGeneAliases()) {
      geneAliases.test();
    }

    if (hasAttributions()) {
      //attributions.test();
    }
    System.out.println("**** Gene content test end ****");

  }

  /**
   * For unit testing only
   */
  public static void main(String[] args) {
    try {

      DBconnection conn = new DBconnection();
      Long id = new Long(26826);
      GeneSummary gene = new GeneSummary(conn, id);
      gene.test();
      id = new Long(139365);
      gene = new GeneSummary(conn, id);
      gene.test();

    } catch (Exception e) {
      e.printStackTrace();
    }

  }

}
