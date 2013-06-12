//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.7 $
// $Date: 2005/04/11 20:31:48 $
//------------------------------------------------------------------------------ 
package org.tair.search;

import org.tair.querytools.*;
import org.tair.tfc.*;
import org.tair.utilities.*;

import java.sql.*;
import java.util.*;

/**
 * ProtocolSummary represents the information needed to display one protocol
 * record as part of the protocol search results returned by 
 * <code>ProtocolSearcher</code>. ProtocolSummary contains all fields from 
 * the temp table used to hold protocol search  results. In addition to being
 * used for display, ProtocolSummary is used to create downloads of protocol
 * data from the search results pages.
 *
 * <p>
 * ProtocolSummary implements Accessible interface to facilitate creation of
 * the object's TAIR accession number through <code>AccessionManager</code>
 */

public class ProtocolSummary implements Accessible {

    private Long reference_id;
    private String authors;
    private String title;
    private int pubmed_id;
    private String description;
    private String usage;
    private String methods;
    private String keywordsAsList;
    private String highlightedKeywords;
    private String searchString;
    private ArrayList pdf_links; 
    /**
     * Creates an empty instance of ProtocolSummary for population externally
     */
    public ProtocolSummary() {}
 


    public final Long get_reference_id() {
	return reference_id;
    }
 
    public final String get_authors() {
	return authors;
    }
 
    public final String get_title() {
	return title;
    }
 
    public final String get_description() {
	return description;
    }
 
    public final String get_usage() {
	return usage;
    }
 
    public final int get_pubmed_id() {
	return pubmed_id;
    }
 
    public final String get_methods() {
	return methods;
    }
    
    private ArrayList get_pdf_links(){
        return pdf_links;
    }

    /**
     * Determine if a protocol has pdf_link associated to it or not
     */
    public final boolean hasPdfLink(){
        return ( pdf_links!=null && pdf_links.size() > 0) ? true:false ;
    }
   
    /**
     * Get pdf_links associated to protocol as an Iterator of Strings
     */
    public final Iterator getPdfLinks(){
        return ( pdf_links!=null && pdf_links.size() > 0) ?  pdf_links.iterator() : null; 
    }
 
    /**
     * Get a comma delimted list of the pdf_links associated to 
     * the protocol
     */
    public final String getPdfLinksAsString(){
        return TextConverter.join(",", pdf_links); 
    }
    public final void set_reference_id(Long reference_id) {
	this.reference_id = reference_id;
    }
 
    public final void set_authors(String authors) {
	this.authors = authors;
    }
 
    public final void set_title(String title) {
	this.title = title;
    }
 
    public final void set_description(String description) {
	this.description = description;
    }
 
    public final void set_usage(String usage) {
	this.usage = usage;
    }
 
    public final void set_methods(String methods) {
	this.methods = methods;
    }
 
    public final void set_pubmed_id(int pubmed_id) {
	this.pubmed_id = pubmed_id;
    }
 
    private void setSearchString(String searchString) {
	this.searchString = searchString;
    }
 
    private String getSearchString() {
	return searchString;
    }
 
    /**
     * creates a comma delimted list of the keywords associated to 
     * the protocol and substitutes an * for an exact
     * match on the provided search string, if there is a search string
     * @param conn -- DB connection
     */
    private void setKeywordList(DBconnection conn) throws SQLException {
	
	StringBuffer kwList = new StringBuffer(" ");
	boolean first = true;
	
	String query = 
	    "SELECT k.keyword AS keyword " +
	    "FROM Keyword k, Reference_Keyword rk, AnnotationType a " +
	    "WHERE k.keyword_id = rk.keyword_id " +
	    "AND  a.annotation_type_id = rk.annotation_type_id " +
	    "AND rk.reference_id = ?";

	conn.setQuery(query);
	conn.setQueryVariable( get_reference_id() );

	ResultSet results = conn.getResultSet();
	while (results.next()) {
	    if (!first) {
		kwList.append(", ");
	    }
	    String ss = getSearchString();
	    if ( ss != null) {
		if (results.getString("keyword").equalsIgnoreCase(ss)) {
		    kwList.append("*");
		} else {
		    kwList.append(results.getString("keyword"));
		}
	    } else {
		kwList.append(results.getString("keyword"));
	    }
	    first = false;
	}
	conn.releaseResources();
	keywordsAsList = new String(kwList);
    }
 
    public String getKeywordList() {
	return keywordsAsList;
    }
 
    /**
     * provides substitutions of * for the search string (
     * exact hits on the keywords are done via setKeywordList() as
     * the keyword list is being built) , if provided,
     * then inserts the highlighting wherever the substitions exist
     * @param conn -- DBconnection
     * @param searchString -- search string
     * @param isExact -- if the search string is an exact match
     * @throws SQLException  when db error occurs
     */
    public void setHighlightedKeywordList(DBconnection conn, 
					  String searchString,
					  boolean isExact) 
 	throws SQLException {
 
	setSearchString(searchString);
	setKeywordList(conn);
	if (getSearchString() != null) {
	    StringBuffer sb = new StringBuffer(getKeywordList());
	    String highlightedString = "<font class=\"emphasis\">" +
		getSearchString() + "</font>";
	    String delim = "*";
	    int startReplacePos = 0;

	    if (!isExact) {
		// do additional substitutions before inserting highlighting
		startReplacePos = getKeywordList().indexOf(getSearchString(),
							   startReplacePos);
		while (startReplacePos > -1) {
		    sb.replace(startReplacePos,
			       startReplacePos + 
			getSearchString().length(), delim);
		    startReplacePos = sb.toString().indexOf(getSearchString(),
							    startReplacePos);
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
	}
	else {
	    // if no search string provided,
	    // return the keyword list as usual, unhighlighted
	    highlightedKeywords = getKeywordList();
	}
    }
 
    public String getHighlightedKeywordList() {
	return highlightedKeywords;
    }
    /**
     * Set pdf links for protocol
     * @param conn -- DBconnection
     * @throws SQLException  when db error occurs
     */  
    public void set_pdf_links (DBconnection conn )throws SQLException {
        StringBuffer link_buffer = new StringBuffer(" ");
       	
	String query = 
	    "SELECT url "+ 
            "FROM  URL, Reference_URL, Protocol " +  
            "WHERE URL.url_id = Reference_URL.url_id "+ 
            "AND Protocol.reference_id  =   Reference_URL.reference_id  "+ 
            "AND url like  " +
            TextConverter.dbQuote( "%pdf" ) +
	    " AND Protocol.reference_id = ?";
       
	conn.setQuery(query);
	conn.setQueryVariable( get_reference_id() );

	ResultSet results = conn.getResultSet();
        if ( pdf_links == null ){
	    pdf_links = new ArrayList();
        }
	while (results.next()) {
            String pdf_link = results.getString("url");
            pdf_links.add(pdf_link);
	}
	conn.releaseResources();
    }

    /**
     * Populates object with data needed for display, but not stored in temp
     * table that caches search results.  This includes author and title data
     * (which are not in temp table to cut down on overhead when inserting
     * TEXT fields). This method should be called only after basic
     * pub information (i.e. reference id) has been populated.
     *
     * @param conn -- an active connection to the database
     * @exception SQLException thrown if a database error occurs
     */
    public final void populate(DBconnection conn) throws SQLException {
	retrieveFields(conn);
    }
 

    /**
     * Get fields needed for download,  populated separately when creating
     * objects from search results since extra fields slows searching
     */
    private void retrieveFields(DBconnection conn) 
  	throws SQLException {

	String query =
	    "SELECT description, " +
	    "usage, " +
	    "methods, " +
	    "pubmed_id " +
	    "FROM Protocol " +
	    "WHERE reference_id = ?";

	conn.setQuery(query);
	conn.setQueryVariable( get_reference_id() );
	
	ResultSet results = conn.getResultSet();
	if (results.next()) {
	    set_description(results.getString("description"));
	    set_usage(results.getString("usage"));
	    set_methods(results.getString("methods"));
	    set_pubmed_id(results.getInt("pubmed_id"));
	}
	conn.releaseResources();
    }
 
    /**
     * Retrieves TAIR accession number for this object.  Implemented here
     * to satisfy the <code>Accessible</code> interface
     *
     * @return TAIR accession number for this object
     */
    public final String getAccession() {
	return AccessionManager.getAccession(this);
    }
 
    /**
     * Retrieves element type of this object for use in creating TAIR 
     * accession  number. Implemented here to satisfy the 
     * <code>Accessible</code> interface
     *
     * @return Object's element type (protocol) for use in 
     * creating TAIR accession
     */
    public final String getElementType() {
	return "protocol";
    }
 
    /**
     * Retrieves object's super id (reference_id) for use in creating 
     * TAIR accession number. Implemented here to satisfy the 
     * <code>Accessible</code> interface
     * @return ID to use for creating TAIR accession number 
     */
    public final Long getSuperID() {
	return get_reference_id();
    }
  
    /**
     * Creates a tab-delimited string of this Protocol's data for 
     * downloading.  
     * The data is returned in the following column order:
     * <ul>
     * <li>title</li>
     * <li>description</li>
     * <li>author names</li>
     * <li>PDF link URL</li>
     * </ul>
     *
     * @return Tab-delimited string of protocol data
     */
    public final String createExport() {
	StringBuffer export = new StringBuffer();
	export.append(EmptyTextConverter.convert(get_authors()) + "\t");
	export.append(EmptyTextConverter.convert(get_title()) + "\t");
	export.append(EmptyTextConverter.convert(get_description()) + "\t");
	export.append(EmptyTextConverter.convert(get_usage()) + "\t");
	export.append(EmptyTextConverter.convert(get_methods()) + "\t");
	export.append(EmptyTextConverter.convert(getKeywordList()) + "\t") ;
        export.append(EmptyTextConverter.convert(getPdfLinksAsString()) + "\n") ;
	return export.toString();
    }
  
    /**
     * Retrieves column order for tab-delimited exports
     * @return Column order used when creating export as a 
     * tab-delimited string
     */
    public String getExportHeader() {
      	String header =
	    "Authors\t" +
	    "Title\t" +
	    "Description\t" +
	    "Pubmed_id\t" +
	    "Usage\t" +
	    "Methods\t" +
	    "Keywords\t" + 
            "PDF_links\n";
	return header;
    }
  
    /**
     * For unit testing only
     */
    public void test() {
	System.out.println("#########Testing protocol content##########");
	System.out.println("reference_id: " + get_reference_id());
	System.out.println("authors: " + get_authors());
	System.out.println("title: " + get_title());
	System.out.println("description: " + get_description());
	System.out.println("pubmed_id: " + get_pubmed_id());
	System.out.println("methods: " + get_methods());
	System.out.println("getHighlightedKeywordList: " +
			   getHighlightedKeywordList());
	System.out.println("############################################");
    }
}
