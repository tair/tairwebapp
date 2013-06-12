//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.6 $
// $Date: 2003/09/05 20:31:39 $
//------------------------------------------------------------------------------ 

package org.tair.querytools;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.tair.tfc.DBconnection;
import org.tair.utilities.TextConverter;


/**
 * TairObjKeyEvidenceCollection is a custom collection that stores
 * all TairObjKeyEvidence objects associated to a given tair_object_id + 
 * keyword_id + relationship_type_id as a collection of 
 * <code>TairObjKeyEvidence</code> objects. 
 */


public class TairObjKeyEvidenceCollection {
    private ArrayList tairobj_key_evidence_objects;
    private boolean created_by_keyword;
    private String keyword_name;
    private String extdb_id;

    /**
     * Creates an empty instance of TairObjKeyEvidenceCollection 
     */
    public TairObjKeyEvidenceCollection() {
        tairobj_key_evidence_objects = new ArrayList();
    }
  
    /**
     * Creates an instance of TairObjKeyEvidenceCollection that contains all 
     * tairobj_key_evidence_objects associated to a given tair_object_id + 
     * keyword_id + relationship_type
     *
     * @param conn An active connection to the database
     * @param tair_object_id ID to get the associated tairobj_key_evidence_objects for
     * @param keyword_id ID to get the associated tairobj_key_evidence_objects for
     * @param relationship_type String to get the associated tairobj_key_evidence_objects for
     * @throws SQLException in the case of an invalid operation or database error
     */
    public TairObjKeyEvidenceCollection( DBconnection conn, 
                                         Long tair_object_id, 
                                         Long keyword_id, 
                                         String relationship_type ) throws SQLException {
        tairobj_key_evidence_objects = new ArrayList();
        if ( tair_object_id != null && keyword_id != null && relationship_type != null ) {  
            populate( conn, tair_object_id, keyword_id, relationship_type );
        }
    }

    /**
     * Creates an instance of TairObjKeyEvidenceCollection that contains all 
     * tairobj_key_evidence_objects associated to a given keyword_id or the 
     * keyword id's children depending on the boolean flag, children
     *
     * @param conn An active connection to the database
     * @param keyword_id ID to get the associated tairobj_key_evidence_objects for
     * @param children boolean to indicate whether the collection should be built for the 
     * keyword's children instead of for the keyword
     * @throws SQLException in the case of an invalid operation or database error
     */
    public TairObjKeyEvidenceCollection( DBconnection conn, Long keyword_id ) throws SQLException {
        tairobj_key_evidence_objects = new ArrayList();
        if ( keyword_id != null ) {
            populate( conn, keyword_id );
            setCreatedByKeywordInfo( conn, keyword_id );
        }
    }

    /**
     * Creates an instance of TairObjKeyEvidenceCollection that contains all 
     * tairobj_key_evidence_objects associated to a given keyword_id + reference_id
     *
     * @param conn An active connection to the database
     * @param keyword_id ID to get the associated tairobj_key_evidence_objects for
     * @param reference_id ID to get the associated tairobj_key_evidence_objects for
     * @throws SQLException in the case of an invalid operation or database error
     */
    public TairObjKeyEvidenceCollection( DBconnection conn, Long keyword_id, Long reference_id ) 
        throws SQLException {
        tairobj_key_evidence_objects = new ArrayList();
        if ( keyword_id != null && reference_id != null ) { 
            populate( conn, keyword_id, reference_id );
        }
    }


    /**
     * Creates an instance of TairObjKeyEvidenceCollection that contains all 
     * tairobj_key_evidence objects for submitted tair_object_ids where relationship
     * type is in submitted list of relationship types
     *
     * @param conn An active connection to the database
     * @param tair_object_ids Tair object ids to retrieve data for
     * @param relationship_types List of relationship types to retrieve data for.
     * @throws SQLException if a database error occurs
     */
    public TairObjKeyEvidenceCollection( DBconnection conn, 
                                         Long[] tair_object_ids, 
                                         String[] relationship_types ) throws SQLException {
        tairobj_key_evidence_objects = new ArrayList();
        if ( tair_object_ids != null && tair_object_ids.length > 0 &&
             relationship_types != null && relationship_types.length > 0 ) {
            populate( conn, tair_object_ids, relationship_types );
        }

    }


    /**
     * Populates collection with objects that represent join between submitted 
     * tair object and keyword ids with submitted value of relationship type. 
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id to retrieve data for
     * @param keyword_id ID to get the associated tairobj_key_evidence_objects for
     * @param relationship_type Relationship type to retrieve data for.
     * @throws SQLException if a database error occurs
     */
    public void populate( DBconnection conn, Long tair_object_id, Long keyword_id, String relationship_type ) 
        throws SQLException {       

        if ( tair_object_id != null && keyword_id != null && relationship_type != null ) {

            created_by_keyword = false;
            String query = 
                "SELECT toke.tairobj_key_evidence_id AS tairobj_key_evidence_id " +
                "FROM TairObjKeyEvidence toke, RelationshipType rt " +
                "WHERE toke.relationship_type_id = rt.relationship_type_id " + 
                "AND toke.tair_object_id = " + tair_object_id.toString() + " " +
                "AND toke.keyword_id = " + keyword_id.toString() + " " +
                "AND rt.relationshiptype_type = " + TextConverter.dbQuote( relationship_type );
            populate( conn, query );
        }
    }

    // population method to get all objects for submitted keyword id
    private void populate( DBconnection conn, Long keyword_id ) throws SQLException {      
        if ( keyword_id != null ) { 
            created_by_keyword = true;
            String query = 
                "SELECT toke.tairobj_key_evidence_id AS tairobj_key_evidence_id " +
                "FROM TairObjKeyEvidence toke " +
                "WHERE toke.keyword_id = " + 
                keyword_id.toString();
            populate( conn, query );
        }
    }

    // population method to get all objects for combination of keyword id and reference id
    private void populate( DBconnection conn, Long keyword_id, Long reference_id ) throws SQLException {   
        if ( keyword_id != null && reference_id != null ) {
            created_by_keyword = false;
            String query = 
                "SELECT toke.tairobj_key_evidence_id AS tairobj_key_evidence_id " +
                "FROM TairObjKeyEvidence toke " +
                "WHERE toke.keyword_id = " + keyword_id.toString() + " " +
                "AND toke.reference_id = " + reference_id.toString();
            populate( conn, query );

        }
    }


    // population method to get all objects for tair object id where relationship type
    // is included in submitted list of relationship types
    private void populate( DBconnection conn, Long[] tair_object_ids, String[] relationship_types ) 
        throws SQLException {

        StringBuffer query = new StringBuffer();
        query.append( "SELECT toke.tairobj_key_evidence_id " +
                      "FROM TairObjKeyEvidence toke, RelationshipType rt " +
                      "WHERE toke.relationship_type_id = rt.relationship_type_id " );



        query.append( "AND tair_object_id IN (" );
        int i = 0;
        for ( i = 0; i < tair_object_ids.length; i++ ) {
            if ( i > 0 ) {
                query.append( ", " );
            }
            query.append( tair_object_ids[ i ].toString() );
        }
        query.append( ") " );
            
        query.append( "AND rt.relationship_type IN (" );
        for ( i = 0; i < relationship_types.length; i++ ) {
            if ( i > 0 ) {
                query.append( ", " );
            }
            query.append( TextConverter.dbQuote( relationship_types[ i ] ) );
        }
        query.append( ") " );
        populate( conn, query.toString() );
    }
    


    // utility population method that executes SQL query to retrieve tair_object_key_evidence_ids
    // according to specific logic of populate() methods; ids are then used to create objects
    // which are added to collection
    private void populate( DBconnection conn, String query ) throws SQLException {
        if ( query != null ) {
            conn.setQuery( query );
            ArrayList tairobj_key_evidence_ids = new ArrayList();
            ResultSet results = conn.getResultSet();
            while ( results.next() ) {
                tairobj_key_evidence_ids.add( new Long( results.getLong( "tairobj_key_evidence_id" ) ) );       
            }
            conn.releaseResources();
            for ( int i = 0; i < tairobj_key_evidence_ids.size(); i ++ ) {  
                tairobj_key_evidence_objects.add( new TairObjKeyEvidence( conn, (Long)tairobj_key_evidence_ids.get( i ) ) );
            }
        }
    }     

    private void setCreatedByKeywordInfo( DBconnection conn, Long keyword_id ) throws SQLException {      
        if ( keyword_id != null ) { 
            String query = 
                "SELECT keyword, extdb_id " +
                "FROM Keyword " +
                "WHERE keyword_id = " + 
                keyword_id.toString();
            conn.setQuery( query );

            ResultSet results = conn.getResultSet();
            if ( results.next() ) {
                keyword_name = results.getString( "keyword" );  
                extdb_id = results.getString( "extdb_id" );     
            }
            conn.releaseResources();
        }
    }

    /**
     * @return <code>String</code> keyword name of keyword id that created the collection
     */
    public String getCreatedByKeywordName() { return keyword_name; }

    /**
     * @return <code>String</code> extdb_id of keyword id that created the collection
     */
    public String getCreatedByKeywordExtdbId() { return extdb_id; }

    /**
     * @return <code>integer</code> count of tair object key evidence objects created by keyword id
     * returns -1 if not created by a keyword id
     */
    public int getCountForCreatedByKeyword() { return ( createdByKeyword() ) ? size() : -1; }     

    /**
     * Determines if collection was created by a keyword id only 
     *
     * @return <code>true</code> if collection was created by a keyword; <code>false</code>
     * if collection was created with other params
     */
    public boolean createdByKeyword() { return created_by_keyword; }

    /**
     * Determines if collection has tairobj_key_evidence_objects in it
     *
     * @return <code>true</code> if collection has no tairobj_key_evidence_objects in it; <code>false</code>
     * if collection has at least one element in it
     */
    public boolean isEmpty() { return tairobj_key_evidence_objects.isEmpty(); }

    /**
     * Retrieves number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { return tairobj_key_evidence_objects.size(); }

    /**
     * Retrieve element at supplied index
     * 
     * @return TairObjKeyEvidence at supplied index, or <code>null</code> if no element at supplied index
     */
    public TairObjKeyEvidence elementAt( int index ) { 
        return (TairObjKeyEvidence) tairobj_key_evidence_objects.get( index ); 
    }

    /**
     * Determines if supplied element is in collection
     *
     * @return <code>true</code> if supplied element is in collection; <code>false</code>
     * if element is not found
     */
    public boolean contains( TairObjKeyEvidence tairobj_key_evidence_object ) { 
        return tairobj_key_evidence_objects.contains( tairobj_key_evidence_object ); 
    }

    /**
     * Retrieve all elements in collection 
     *
     * @return All TairObjKeyEvidence objects in collection as an <code>Iterator</code> of <code>TairObjKeyEvidence</code>
     * objects, or <code>null</code> if no TairObjKeyEvidence in collection
     */
    public Iterator iterator() { 
        return !tairobj_key_evidence_objects.isEmpty() ? tairobj_key_evidence_objects.iterator() : null; 
    }

    /**
     * For unit testing only
     */
    public void test(){
        System.out.println( "****** TairObjKeyEvidenceCollection content test ******" );
        Iterator iter = iterator();
        TairObjKeyEvidence toke = null;
        if ( createdByKeyword() ) {
            System.out.println( "keyword name = " + getCreatedByKeywordName() );
            System.out.println( "count for created by keyword = " + getCountForCreatedByKeyword() ); 
            System.out.println( "extdb_id = " + getCreatedByKeywordExtdbId() ); 
        }
        if ( iter != null ) {
            while ( iter.hasNext() ) {
                toke = ( TairObjKeyEvidence ) iter.next();
                toke.test();
            } 
        }
        System.out.println( "**** TairObjKeyEvidenceCollection content test end ****" );    
    }  

    /**
     * For unit testing only
     */
    public static void main( String[] args ){
        try{
            DBconnection conn = new DBconnection();

            Long k_id = new Long( 7816 ); 
            //Long t_id = new Long( 505006084 ); 
            //String rel_type = "expressed in"; 
            //TairObjKeyEvidenceCollection tokec = new TairObjKeyEvidenceCollection( conn, t_id, k_id, rel_type );
            TairObjKeyEvidenceCollection tokec = new TairObjKeyEvidenceCollection( conn, k_id );
            tokec.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }

    }

}
