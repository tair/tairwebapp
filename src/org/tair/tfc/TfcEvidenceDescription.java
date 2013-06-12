//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.1 $
// $Date: 2003/09/05 16:27:31 $
//------------------------------------------------------------------------------ 

package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;

/**
 * This class maps to the EvidenceDescription in the tair database. 
 * Each instance maps one row of data in EvidenceDescription table. 
 * Each data object maps to on field of a row in the table. Each field 
 * has one set method and one get method for accessing from outside of class.
 */

public class TfcEvidenceDescription {   
    
    private Long evidence_description_id;
    private String evidence_code;
    private String evidence_code_full;
    private String description;
    private Long pub_id;
    
    public TfcEvidenceDescription() {  }

    /**
     * Creates an instance of TfcEvidenceDescription that reflects data
     * referenced by submitted evidence_description_id.
     *
     * @param conn An active connection to the database
     * @param evidence_description_id Evidence description id to retrieve data for
     * @throws SQLException in the case of an invalid operation or database error
     */
    public TfcEvidenceDescription( DBconnection conn, Long evidence_description_id ) 
        throws SQLException {

        boolean found = false;
        String query = 
            "SELECT evidence_description_id, " +
            "evidence_code, " +
            "evidence_code_full, " +
            "description, " +
            "pub_id " +
            "FROM EvidenceDescription " +
            "WHERE evidence_description_id = " + evidence_description_id;
        conn.setQuery( query );
        
        ResultSet results = conn.getResultSet();             
        if ( results.next() ) {
            found = true;
            set_evidence_description_id( evidence_description_id );
            set_evidence_code( results.getString( "evidence_code" ) );
            set_evidence_code_full( results.getString( "evidence_code_full" ) );
            set_description( results.getString( "description" ) );
            
            long id = results.getLong( "pub_id" );
            if ( !results.wasNull() ) {
                set_pub_id( new Long( id ) );
            }
        }
        conn.releaseResources();

        if ( !found ) {
            throw new RecordNotFoundException( "No evidence description found " +
                                               "for evidence description id: " + evidence_description_id );
        }
    }


    public void set_evidence_description_id( Long id ) { 
        this.evidence_description_id = id;
    }

    public Long get_evidence_description_id() {
        return evidence_description_id;
    }

    public void set_evidence_code( String code ) {
        this.evidence_code = code;
    }

    public String get_evidence_code() {
        return evidence_code;
    }

    public void set_evidence_code_full( String code ) {
        this.evidence_code_full = code;
    }
        
    public String get_evidence_code_full() {
        return evidence_code_full;
    }

    public void set_description( String description ) {
        this.description = description;
    }

    public String get_description() {
        return description;
    }

    public void set_pub_id( Long id ) {
        this.pub_id = id;
    }

    public Long get_pub_id() {
        return pub_id;
    }


    /**
     * For unit testing only
     */
    public void test(){
        System.out.println("****** TfcEvidenceDescription content test ******");
        System.out.println( "evidence_description id: " + get_evidence_description_id() );
        System.out.println( "evidence code: " + get_evidence_code() );
        System.out.println( "evidence code full: " + get_evidence_code_full() );
        System.out.println( "description: " + get_description() );
        System.out.println( "pub id: " + get_pub_id() );
        System.out.println("**** TfcEvidenceDescription content test end ****");
    }

    
    /**
     * For unit testing only
     */
    public static void main(String[] args){
        try{
            DBconnection conn = new DBconnection();
            Long test_id = new Long( 3 );
            TfcEvidenceDescription description = new TfcEvidenceDescription( conn, test_id );
            description.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }

    }
}
