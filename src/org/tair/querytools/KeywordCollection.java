/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * KeywordCollection is a custom collection that stores
 * all keywords associated to a given object type as a collection of 
 * <code>Keyword</code> objects. 
 * <p>
 * The Keyword objects may be extensions of Keyword that include 
 * the type specific information that makes sense for the linking table the keyword and child table 
 * id reside in.  For example, a collection of sub-classed Keyword objects might contain information 
 * specific to the TairObject_Keyword linking table so this would make sense to be created for use on a Gene detail page
 * where as a Publications detail page would create a KeywordCollection that would contain ReferenceKeyword object, 
 * sub-classed from Keyword
 */


public class KeywordCollection {
    private ArrayList keyword_objects;
    private Long annotation_type_id;
    private String linking_table_name;
    private String column_name;
    private String child_table_name;
    private ArrayList keyword_ids;

    /**
     * Creates an empty instance of KeywordCollection 
     */
    public KeywordCollection() {
	keyword_objects = new ArrayList();
    }
  
    /**
     * Creates an instance of KeywordCollection that contains all keywords
     * associated to a given child data element , where child data element are Gene, typically coming from the 'gene' detail page,
     * or Publication, coming from the 'publication' detail page  
     *
     * @param conn An active connection to the database
     * @param id ID of child data element to get the associated keyword ids for
     * @param child_table_name, to determine the specific Keyword objects to generate to populate the collection with  
     * @throws SQLException in the case of an invalid operation or database error
     */
    public KeywordCollection( DBconnection conn, Long id, String child_table_name ) throws SQLException {
	keyword_objects = new ArrayList();
	if ( id != null && child_table_name != null ) {
	    populate( conn, id, child_table_name );
	}
    }
    // queries the AnnotationType table and sets the values in keyword_classname, annotation_type_id, 
    // column name and linking_table_name needed
    // to generate the objects that the collection will hold 
    private void setAnnotationTypeInfo( DBconnection conn, String child_table_name ) throws SQLException {
	TfcAnnotationType tat = new TfcAnnotationType( conn, child_table_name );
	annotation_type_id = tat.getAnnotationTypeID();
	linking_table_name = tat.getLinkingTableName();
	column_name = tat.getColumnName();
	conn.releaseResources();
    }

    private Long getAnnotationTypeID() { return annotation_type_id; }
    private String getLinkingTableName() { return linking_table_name; } 
    private String getColumnName() { return column_name; }  
    private String getChildTableName() { return child_table_name; }  

    private void populate( DBconnection conn, Long id, String child_table_name ) throws SQLException {    
	if ( id != null && child_table_name != null ) {
	    this.child_table_name = child_table_name;
	    if ( child_table_name.equalsIgnoreCase( "Locus" ) ) {
		setAnnotationTypeInfo( conn, "Gene" );
		ArrayList genes = new ArrayList();
		String query = " select g.tair_object_id from Gene g, MapElement_Locus mel, Locus l where " +
		    " g.map_element_id = mel.map_element_id and mel.locus_id = l.locus_id and l.tair_object_id = " +
		    id.toString();
		conn.setQuery( query ); 
		Debugger.println( Debugger.logMsg( this, "associated genes query = " + query ) );         
		ResultSet results = conn.getResultSet();
		while ( results.next() ) {
		    genes.add( new Long( results.getLong( "tair_object_id" ) ) );
		} 
		conn.releaseResources();        
		for ( int i = 0; i < genes.size(); i ++ ) {
		    setKeywords( conn, ( Long ) genes.get( i ) ); 
		}
	    } else { 
		setAnnotationTypeInfo( conn, child_table_name );
		setKeywords( conn, id );
	    }
	}
    }

    // generate the list of keyword ids that will be used to create the Keyword objects for the collection 
    private void setKeywords( DBconnection conn, Long id )throws SQLException {
	if ( getAnnotationTypeID() != null ) { // will be null if no keywords exist for a given table
	    keyword_ids = new ArrayList();  
	    String query = "select annotation_type_id, keyword_id from " + getLinkingTableName() + " where " + getColumnName() + " = " + 
		id.toString() + " and annotation_type_id = " + getAnnotationTypeID().toString();
	    conn.setQuery( query );
	    //Debugger.println( Debugger.logMsg( this, "keyword id query = " + query ) );       
	    ResultSet results = conn.getResultSet();
	    while ( results.next() ) {
		keyword_ids.add( new Long( results.getLong( "keyword_id" ) ) );         
	    }
	    conn.releaseResources();
	    KeywordLite keyword = null;
	    for ( int i = 0; i < keyword_ids.size(); i ++ ) {
		if ( getLinkingTableName().equalsIgnoreCase( "TairObject_Keyword" ) ) {
		    keyword = new TairObjectKeyword();        
		} else if ( getLinkingTableName().equalsIgnoreCase( "Reference_Keyword" ) ) {
		    keyword = new ReferenceKeyword();         
		} else if ( getLinkingTableName().equalsIgnoreCase( "BioSample_Keyword" ) ) {
		    keyword = new BioSampleKeyword();
		}         
		keyword.populate( conn, ( Long ) keyword_ids.get( i ), id );
		keyword_objects.add( keyword ); 
	    }
	}
    }

    private ArrayList getKeywords() { return keyword_objects; }

    /**
     * Retrieves all keywords in collection that are joined to annotation object with
     * submitted relationship type
     *
     * @param relationshipType Relationship type to find keywords by
     * @return keywords joined to annotation object with relationship type as an 
     * <code>Iterator</code> of <code>KeywordLite</code> objects, or
     * <code>null</code> if no keywords found with submitted relationship type
     */
    public Iterator getRelationshipType( String relationshipType ) {

	// use map to ensure that keyword is only added once - if keyword
	// is associated to data object w/multiple relationship types,
	// will get added to list redundantly otherwise.
	HashMap subset = null;
	Iterator iter = null;
	Iterator subsetIter = null;
	KeywordLite keyword = null;

	if ( relationshipType != null && !isEmpty() ) {
	    iter = iterator();
	    while ( iter.hasNext() ) {
		keyword = (KeywordLite) iter.next();
		if ( keyword.hasRelationshipType( relationshipType ) ) {
		    if ( subset == null ) {
			subset = new HashMap();
		    } 
          
		    subset.put( keyword.getKeywordName(), keyword );
		}
	    }

	    if ( subset != null && !subset.isEmpty() ) {
		subsetIter = subset.values().iterator();
	    }
	}
	return subsetIter;
    }

    /**
     * Retrieves all keywords in collection of submitted keyword type
     *
     * @param keywordType Keyword type to find keywords by
     * @return keywords of submitted type as an <code>Iterator</code> of 
     * <code>KeywordLite</code> objects, or <code>null</code> if no keywords 
     * found with submitted keyword type
     */
    public Iterator getKeywordType( String keywordType ) {
	ArrayList subset = null;
	Iterator iter = null;
	Iterator subsetIter = null;
	KeywordLite keyword = null;

	if ( keywordType != null && !isEmpty() ) {
	    iter = iterator();
	    while ( iter.hasNext() ) {
		keyword = (KeywordLite) iter.next();
		if ( keywordType.equals( keyword.getKeywordType() ) ) {
		    if ( subset == null ) {
			subset = new ArrayList();
		    }
		    subset.add( keyword );
		}
	    }

	    if ( subset != null && !subset.isEmpty() ) {
		subsetIter = subset.iterator();
	    }
	}
	return subsetIter;
    }

  
    /**
     * Determines if collection has keywords in it
     *
     * @return <code>true</code> if collection has no polymorphisms in it; <code>false</code>
     * if collection has at least one element in it
     */
    public boolean isEmpty() { return keyword_objects.isEmpty(); }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { return keyword_objects.size(); }

    /**
     * Retrieve element at supplied index
     * 
     * @return Keyword at supplied index, or <code>null</code> if no element at supplied index
     */
    public KeywordLite elementAt( int index ) { return ( KeywordLite ) keyword_objects.get( index ); }

    /**
     * Determines if supplied element is in collection
     *
     * @return <code>true</code> if supplied element is in collection; <code>false</code>
     * if element is not found
     */
    public boolean contains( KeywordLite keyword_object ) { return keyword_objects.contains( keyword_object ); }

    /**
     * Retrieve all elements in collection 
     *
     * @return All keywords in collection as an <code>Iterator</code> of <code>Keywords</code>
     * objects, or <code>null</code> if no keywords in collection
     */
    public Iterator iterator() { return ( !keyword_objects.isEmpty() ) ? keyword_objects.iterator() : null; }

    /**
     * Sorts all elements in collection according to criteria set in comparator
     *
     * @param comparator Comparator that defines criteria collection should be sorted by
     */
    public void sort( Comparator comparator ) {
	Collections.sort( keyword_objects, comparator );
    }


    /**
     * For unit testing only
     */
    public void test(){
	System.out.println( "****** KeywordCollection content test ******" );
	System.out.println( "child table name = " + getChildTableName() );
	System.out.println( "annotation type id = " + getAnnotationTypeID() );
	System.out.println( "linking table name = " + getLinkingTableName() );
	if ( getLinkingTableName().equalsIgnoreCase( "TairObject_Keyword" ) ) {
	    TairObjectKeyword tok = null;
	    Iterator iter = iterator();
	    while ( iter.hasNext() ) {
		tok = ( TairObjectKeyword ) iter.next();
		tok.test();
	    }
	    System.out.println( "unsorted collection ");
	    iter = iterator();
	    while ( iter.hasNext() ) {
		tok = ( TairObjectKeyword ) iter.next();
		System.out.println( "gene name = " + tok.getTairObjectName() );
		System.out.println( "keyword type = " + tok.getKeywordType() );
		System.out.println( "keyword name = " + tok.getKeywordName() );
	    }
	    sort( new TairObjectKeywordComparator() );
	    System.out.println( "sorted collection " ); 
	    iter = iterator();
	    while ( iter.hasNext() ) {
		tok = ( TairObjectKeyword ) iter.next();
		System.out.println( "gene name = " + tok.getTairObjectName() );
		System.out.println( "keyword type = " + tok.getKeywordType() );
		System.out.println( "keyword name = " + tok.getKeywordName() );
	    } 
	} else if ( getLinkingTableName().equalsIgnoreCase( "Reference_Keyword" ) ) { 
	    ReferenceKeyword rk = null;
	    Iterator iter = iterator();
	    while ( iter.hasNext() ) {
		rk = ( ReferenceKeyword ) iter.next();
		rk.test();
	    }
	} 


	System.out.println( "**** KeywordCollection content test end ****" );
    
    }  

    /**
     * For unit testing only
     */
    public static void main( String[] args ){
	try{
	    DBconnection conn = new DBconnection();
	    Long id = new Long( 4370585 ); 
	    String child_table_name = "Gene"; 
	    KeywordCollection kwc = new KeywordCollection( conn, id, child_table_name );
	    kwc.test();
	    id = new Long( 501702822 ); 
	    child_table_name = "Publication"; 
	    kwc = new KeywordCollection( conn, id, child_table_name );
	    kwc.test();
	    id = new Long( 420 ); 
	    child_table_name = "BioSample"; 
	    kwc = new KeywordCollection( conn, id, child_table_name );
	    kwc.test();
	    id = new Long( 1005694820 ); 
	    child_table_name = "ExpressionSet"; 
	    kwc = new KeywordCollection( conn, id, child_table_name );
	    kwc.test();
	    id = new Long( 2017602 ); 
	    child_table_name = "Locus"; 
	    kwc = new KeywordCollection( conn, id, child_table_name );
	    kwc.test();

	} catch ( Exception e ) {
	    e.printStackTrace();
	}

    }

}
  








