//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.12 $
// $Date: 2004/04/26 21:31:08 $
//------------------------------------------------------------------------------
package org.tair.search;

import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.tair.tfc.DBconnection;
import org.tair.utilities.Accessible;
import org.tair.utilities.AccessionManager;
import org.tair.utilities.EmptyTextConverter;
import org.tair.utilities.RecordNotFoundException;

/**
 * PublicationSummary represents the information needed to display one 
 * publication record as part of the publication search results returned by 
 * <code>PublicationSearcher</code>. PublicationSummary contains all fields
 * from the temp table used to hold publication search results. In addition
 * to being used for display, PublicationSummary is used to create downloads
 * of publication data from the search results pages.
 *
 * <p>
 * PublicationSummary implements Accessible interface to facilitate creation
 * of the object's TAIR accession number through <code>AccessionManager</code>
 */

public class PublicationSummary implements Accessible {   
  
    private BigInteger reference_id;
    private String authors;
    private String title;
    private Integer year;
    private String volume;
    private String page_start;
    private String pubSourceName;
    private String keywordsAsList;
    private String highlightedKeywords;
    private String searchString;

    /**
     * Creates an empty instance of PublicationSummary 
     */
    public PublicationSummary() {  }


    /**
     * Creates an instance of PublicationSummary to represent the publication 
     * with submitted reference id
     *
     * @param conn An active connection to the database
     * @param reference_id Reference id to retrieve information for
     * @throws RecordNotFoundException if no row found with submitted id
     * @throws SQLException if a database error occurs
     */  
    public PublicationSummary( DBconnection conn, Long reference_id ) 
	throws SQLException {   

        boolean found = false;
	String query = 
	    "SELECT p.reference_id, " +
	    "p.authors, " +
	    "p.title, " +
	    "p.year, " +
	    "p.volume, " +
	    "p.page_start, " +
	    "s.name " +
	    "FROM Publication p, PubSource s " +
	    "WHERE p.pub_source_id = s.pub_source_id " +
	    "AND p.reference_id = " + reference_id.toString();
	
	conn.setQuery( query );
	
	ResultSet results = conn.getResultSet();
	if ( results.next() ) {
	    found = true;
	    set_reference_id( results.getBigDecimal( "reference_id" ).toBigInteger() );
	    set_authors( results.getString( "authors" ) );
	    set_title( results.getString( "title" ) );
	    int tmpYear = results.getInt( "year" );
	    if ( !results.wasNull() ) {
		set_year( new Integer( tmpYear ) );
	    }
	    set_volume( results.getString( "volume" ) );
	    set_page_start( results.getString( "page_start" ) );
	    set_pub_source_name( results.getString( "name" ) );
	}
	conn.releaseResources();
	setKeywordList( conn );

	if ( !found ) {
	    throw new RecordNotFoundException( "No publication found with " +
					       "reference id: " + reference_id );
	}
    }

    public final BigInteger get_reference_id() { 
return reference_id;
 }
    public final String get_authors() {
 return authors; 
}
    public final String get_title() {
 return title; 
}
    public final Integer get_year() {
 return year;
 }
    public final String get_volume() {
 return volume;
 }
    public final String get_page_start() { 
return page_start; 
}
    public final String get_pub_source_name() {
 return pubSourceName; 
}
  
    public final void set_reference_id( BigInteger reference_id ) { 
this.reference_id = reference_id; 
}
    public final void set_authors( String authors ) {
 this.authors = authors;
 }
    public final void set_title( String title ) {
 this.title = title;
 }
    public final void set_year( Integer year ) { 
this.year = year; 
}
    public final void set_volume( String volume ) {
 this.volume = volume; 
}
    public final void set_page_start( String page_start ) {
 this.page_start = page_start;
 }
    public final void set_pub_source_name( String name ) {
 this.pubSourceName = name; 
}

    private void setSearchString( String searchString) { 
this.searchString = searchString; 
}

    private String getSearchString() { 
return searchString; 
}

    /**
     * Creates a comma delimted list of the keywords associated to the 
     * publication and substitutes an * for an exact match on the provided 
     * search string, if there is a search string
     */

    private void setKeywordList( DBconnection conn ) throws SQLException {
        if ( get_reference_id() != null ) { 

            StringBuffer kwList = new StringBuffer(" ");
            boolean first = true;
            ResultSet results = null;

            String query = 
		" SELECT k.keyword" + 
                " FROM Keyword k, Reference_Keyword rk" +
                " WHERE k.keyword_id = rk.keyword_id AND " +
                " rk.reference_id = ?";
            conn.setQuery( query );
	    conn.setQueryVariable( get_reference_id() );

            results = conn.getResultSet();
            while ( results.next() ) {
                if ( !first ) kwList.append( ", " );
                if ( getSearchString() != null ) {
                    if ( results.getString( "keyword" ).equalsIgnoreCase( 
			      getSearchString() ) ) {

                        kwList.append( "*" );
                    } else {
                        kwList.append( results.getString( "keyword" ) );
                    }
                } else {
                    kwList.append( results.getString( "keyword" ) );
                }
                first = false;
            }
            conn.releaseResources();
            keywordsAsList = new String( kwList );
        }
    }

    private String getKeywordList() { 
	return keywordsAsList; 
    }

    /**
     * Provides substitutions of * for the search string ( exact hits on the 
     * keywords are done via setKeywordList() as the keyword list is being 
     * built) , if provided, then inserts the highlighting wherever the 
     * substitions exist
     */
    public void setHighlightedKeywordList( DBconnection conn, 
					   String searchString, 
					   boolean isExact ) 
	throws SQLException {

        setSearchString( searchString );
        setKeywordList( conn );
        if ( getSearchString() != null ) {
            StringBuffer sb = new StringBuffer( getKeywordList() ); 
            String highlightedString = 
		"<font class=\"emphasis\">" + 
		getSearchString() + "</font>";

            String delim = "*";
            int startReplacePos = 0;

	    // do additional substitutions before inserting highlighting
            if ( !isExact ) { 
                startReplacePos = getKeywordList().indexOf( getSearchString(), 
							    startReplacePos );    
                while ( startReplacePos > -1 ) {
                    sb.replace( startReplacePos, 
				startReplacePos + getSearchString().length(), 
				delim );

                    startReplacePos = sb.toString().indexOf( getSearchString(), 
							     startReplacePos );
                }
            }
            startReplacePos = 0;
            startReplacePos = sb.toString().indexOf( delim, startReplacePos );    
            while ( startReplacePos > -1 ) {
                sb.replace( startReplacePos, 
			    startReplacePos + delim.length(), 
			    highlightedString );
                startReplacePos = sb.toString().indexOf( delim,
							 startReplacePos );
            }
            highlightedKeywords = sb.toString();       

	    // if no search string provided, return the keyword list as 
	    // usual, unhighlighted
        } else {
            highlightedKeywords = getKeywordList();
        }
    }

    public String getHighlightedKeywordList() {
	return highlightedKeywords; 
    }

    /**
     * Populates object with data needed for display, but not stored in temp 
     * table that caches search results.  This includes author data (which is
     * not in temp table to cut down on overhead when inserting TEXT fields). 
     * This method should be called only after basic pub information (i.e. 
     * reference id) has been populated.
     *
     * @param conn An active connection to the database
     * @throws SQLException thrown if a database error occurs
     */
    public final void populate( DBconnection conn ) throws SQLException {
        if ( get_reference_id() != null ) {
            retrieveTextFields( conn );
        }
    }


    /**
     * Get text fields needed for display (author - populated separately when
     * creating objects from search results since TEXT fields slows searching
     */
    private void retrieveTextFields( DBconnection conn ) throws SQLException {
        String query = null;
        ResultSet results = null;

        if ( get_reference_id() != null ) {
            query = 
                "SELECT authors " +
                "FROM Publication " +
                "WHERE reference_id = " + get_reference_id().toString();
            conn.setQuery( query );
            results = conn.getResultSet();
            if ( results.next() ) {
                set_authors( results.getString( "authors" ) );
            }
            conn.releaseResources();
        }
    }


    /**
     * Retrieves TAIR accession number for this object.  Implemented here
     * to satisfy the <code>Accessible</code> interface
     * 
     * @return TAIR accession number for this object
     */
    public final String getAccession() { 
return AccessionManager.getAccession( this ); 
}

    /**
     * Retrieves element type of this object for use in creating TAIR accession 
     * number. Implemented here to satisfy the <code>Accessible</code> interface
     *
     * @return Object's element type (publication) for use in creating TAIR 
     * accession
     */
    public final String getElementType() { 
return "publication"; 
}

    /**
     * Retrieves object's super id (reference_id) for use in creating TAIR 
     * accession number. Implemented here to satisfy the <code>Accessible</code>
     * interface
     *
     * @return ID to use for creating TAIR accession number for this object
     */
    public final Long getSuperID() { 
	return get_reference_id().longValue(); 
    }

    /**
     * Creates a tab-delimited string of this pubblication's data for 
     * downloading. The data is returned in the following column order:
     * <ul>
     * <li>TAIR Accession</li>
     * <li>author names</li>
     * <li>title</li>
     * <li>pub source name</li>
     * <li>year</li>
     * <li>volume</li>
     * <li>page start</li>
     * </ul>
     * 
     * @return Tab-delimited string of publication data
     */
    public final String createExport() {
        StringBuffer export = new StringBuffer();
        export.append( getAccession() + "\t" );
        export.append( EmptyTextConverter.convert( get_authors() ) + "\t" );
        export.append( EmptyTextConverter.convert( get_title() ) + "\t" );
        export.append( EmptyTextConverter.convert( get_pub_source_name() ) + 
		       "\t" );
        export.append( EmptyTextConverter.convert( get_year() ) + "\t" );
        export.append( EmptyTextConverter.convert( get_volume() ) + "\t" );
        export.append( EmptyTextConverter.convert( getKeywordList() ) + "\t" );
        export.append( EmptyTextConverter.convert( get_page_start() ) + "\n" );
        return export.toString();
    }

    /**
     * Retrieves column order for tab-delimited exports
     *
     * @return Column order used when creating export as a tab-delimited string
     */
    public String getExportHeader() {
        String header = 
            "TAIR Accession\t" +
            "Authors\t" +
            "Title\t" +
            "Publication Name\t" +
            "Year\t" +
            "Volume\t" +
            "Keywords\t" +
            "Page start\n";
        return header;
    }



    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "#########Testing publication content##########" );
        System.out.println( "reference_id: " + get_reference_id() );
        System.out.println( "authors: " + get_authors() );
        System.out.println( "title: " + get_title() );
        System.out.println( "year: " + get_year() );
        System.out.println( "volume: " + get_volume() );
        System.out.println( "page_start: " + get_page_start() );
        System.out.println( "pub source name: " + get_pub_source_name() );
        System.out.println( "getHighlightedKeywordList: " + 
			    getHighlightedKeywordList() );
        System.out.println( "############################################" );
    }


    /**
     * For unit testing only
     */
    public static void main( String args[] ) {
        DBconnection conn = null;
        Long id = null;
        PublicationSummary publication = null;

        try {
            conn = new DBconnection();
            id = new Long( 501682489 );
            publication = new PublicationSummary( conn, id );
            publication.setHighlightedKeywordList( conn, "sili", false );
            publication.test();
            id = new Long( 501682917 );
            publication = new PublicationSummary( conn, id );
            publication.setHighlightedKeywordList( conn, "leaf", false );
            publication.test();
            id = new Long( 501683471 );
            publication = new PublicationSummary( conn, id );
            publication.setHighlightedKeywordList( conn, "leaf", true );
            publication.test();
        } catch ( Exception e ) {
            e.printStackTrace();
        }
    
    }
}
