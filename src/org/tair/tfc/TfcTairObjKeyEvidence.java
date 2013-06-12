//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.13 $
// $Date: 2003/11/03 18:59:16 $
//------------------------------------------------------------------------------ 

package org.tair.tfc;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.*;

import org.tair.utilities.*;

/**
 * This class maps to the TairObjKeyEvidence table in the tair database. Each instance
 * maps one row of data in TairObjKeyEvidence table.
 */


public class TfcTairObjKeyEvidence {   

    private Long tairobj_key_evidence_id;
    private Long tair_object_id;
    private Long keyword_id;
    private Long relationship_type_id;
    private BigInteger annotated_by_id;
    private Long evidence_description_id;
    private Long evidence_id;
    private Long reference_id;
    private String comment;
    private String evidence_with;
    private java.util.Date date_last_modified;



    /**
     * Creates an empty instance of TfcTairObjKeyEvidence
     */
    public TfcTairObjKeyEvidence() { }

    /**
     * Creates an instance of TfcTairObjKeyEvidence that reflects the data
     * referenced by submitted tairobj_key_evidence_id
     *
     * @param conn An active connection to the database
     * @param tairobj_key_evidence_id Id to retrieve data for
     * @throws SQLException in the case of an invalid operation or database error
     */
    public  TfcTairObjKeyEvidence( DBconnection conn, Long tairobj_key_evidence_id ) throws SQLException {
        String query = null;
        ResultSet results = null;
        boolean found = false;

        if ( tairobj_key_evidence_id != null ) {
            query =
                "SELECT tairobj_key_evidence_id, " +
                "tair_object_id," +
                "keyword_id, " +
                "relationship_type_id, " +
                "annotated_by_id, "+
                "evidence_id, "+
                "evidence_description_id, " +
                "toke_comment, " +
                "evidence_with, " +
                "reference_id, " +
                "date_last_modified " +
                "FROM TairObjKeyEvidence " +
                "WHERE tairobj_key_evidence_id = " + tairobj_key_evidence_id.toString();

            conn.setQuery( query );      
            results = conn.getResultSet();
            if ( results.next() ) {
                found = true;
                this.tairobj_key_evidence_id = new Long( results.getLong( "tairobj_key_evidence_id" ) );
                this.tair_object_id = new Long( results.getLong( "tair_object_id" ) );
                this.keyword_id = new Long( results.getLong( "keyword_id" ) );
                this.relationship_type_id = new Long( results.getLong( "relationship_type_id" ) );

                BigDecimal id = results.getBigDecimal( "annotated_by_id" ); 
                if ( !results.wasNull() ) {
                    this.annotated_by_id = id.toBigInteger();
                }

                Long refId = results.getLong( "reference_id" ); 
                if ( !results.wasNull() ) {
                    this.reference_id = refId;
                }

               
                this.evidence_id = new Long( results.getLong( "evidence_id" ) );
                this.evidence_description_id = new Long( results.getLong( "evidence_description_id" ) );
                this.evidence_with = results.getString( "evidence_with" );
                this.comment = results.getString( "toke_comment" );
                this.date_last_modified = results.getDate( "date_last_modified" );
            }
            conn.releaseResources();
        }

        if ( !found ) {
            throw new RecordNotFoundException( "No TairObjKeyEvidence found for " +
                                               "tairobj_key_evidence_id: " + tairobj_key_evidence_id );
        }
    }

    public void set_tairobj_key_evidence_id( Long value ) {  tairobj_key_evidence_id = value; }
    public Long get_tairobj_key_evidence_id() { return tairobj_key_evidence_id; }

    public void set_tair_object_id( Long value ) { tair_object_id = value; }
    public Long get_tair_object_id() { return tair_object_id; }

    public void set_keyword_id ( Long value ) { keyword_id = value; }
    public Long get_keyword_id() { return keyword_id; }

    public void set_relationship_type_id( Long value ) { relationship_type_id = value; }
    public Long get_relationship_type_id() { return relationship_type_id; }

    public void set_annotated_by_id( BigInteger value ) { annotated_by_id = value; }
    public BigInteger get_annotated_by_id() { return annotated_by_id; }

    public void set_evidence_id( Long value ) { evidence_id = value; }
    public Long get_evidence_id() { return evidence_id; }

    public void set_evidence_description_id( Long value ) { evidence_description_id = value; }
    public Long get_evidence_description_id() { return evidence_description_id; }

    public void set_evidence_with( String value ) { evidence_with = value; }
    public String get_evidence_with() { return evidence_with; }

    public void set_comment( String value ) { comment = value; }
    public String get_comment() { return comment; }

    public void set_reference_id( Long value ) { reference_id = value; }
    public Long get_reference_id() { return reference_id; }

    public void set_date_last_modified( java.util.Date value ) { date_last_modified = value; }
    public java.util.Date get_date_last_modified() { return date_last_modified; }

    /**
     * For unit testing only
     */
    public void test(){
        System.out.println( "****** TfcTairObjKeyEvidence content test ******" );

        System.out.println( "tairobj_key_evidence_id is " + get_tairobj_key_evidence_id() );
        System.out.println( "tair_object_id  is " + get_tair_object_id() );
        System.out.println( "keyword_id is " + get_keyword_id() );
        System.out.println( "relationship_type_id is " + get_relationship_type_id() );
        System.out.println( "annotated_by_id is " + get_annotated_by_id() );
        System.out.println( "evidence_id is " + get_evidence_id() );            
        System.out.println( "evidence_description_id is " + get_evidence_description_id() );    
        System.out.println( "evidence_with is " + get_evidence_with() );
        System.out.println( "comment is " + get_comment() );
        System.out.println( "reference_id  is " + get_reference_id() );
        System.out.println( "date_last_modified is " + get_date_last_modified() );

        /*
        System.out.println( "evidence_code is " + get_evidence_code() );
        System.out.println( "evidence_code_full is " + get_evidence_code_full() );      
        System.out.println( "description is " + get_description() );
        System.out.println( "keyword is " + get_keyword() );
        System.out.println( "keyword_type is " + get_keyword_type() );
        System.out.println( "relationship_type is " + get_relationship_type() );
        //System.out.println( "tair_object_name is " + get_tair_object_name() );        
        */

        System.out.println( "**** TfcTairObjKeyEvidence content test end ****" );
    }


    /**
     * For unit testing only
     */
    public static void main(String[] args){

        try{
            DBconnection conn = new DBconnection();
            Long test_id = null; 
            test_id = new Long( 59123 );  

            TfcTairObjKeyEvidence toke = new TfcTairObjKeyEvidence( conn, test_id );
            toke.test();

        } catch( Exception e ) {
            e.printStackTrace();
        }
    }

}
