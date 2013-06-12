//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.13 $
// $Date: 2004/04/06 18:30:28 $
//------------------------------------------------------------------------------ 

package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * SequenceDetail is a composite class to represent all information
 * associated with an entry in the NucleotideSequence table for display
 * on the sequence detail page. SequenceDetail contains an instance of 
 * <code>TfcNucleotideSequence</code, and all information in 
 * <code>TairObjectDetail</code> superclass.
 */


public class SequenceDetail extends TairObjectDetail {

    // NT sequence -- created to include full text of sequence
    private TfcNucleotideSequence sequence;

    /**
     * Creates an empty instance of SequenceDetail
     */ 
    public SequenceDetail() { }


    /**
     * Creates an instance of SequenceDetail to reflect the data 
     * referenced by the submitted nucleotide_seq_id
     *
     * @param conn An active connection to the database
     * @param nucleotide_seq_id Nucleotide sequence id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public SequenceDetail( DBconnection conn, Long nucleotide_seq_id )
	throws RecordNotFoundException, SQLException {

	get_information( conn, nucleotide_seq_id );
    }

    /**
     * Creates an instance of SequenceDetail to reflect the data 
     * referenced by the submitted nucleotide_sequence name
     * 
     * @param conn An active connection to the database
     * @param name Nucleotide sequence name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public SequenceDetail( DBconnection conn, String name ) 
	throws RecordNotFoundException, SQLException {
	
	get_information( conn, name );
    }


  
   /**
     * Retrieve data associated with submitted nucleotide sequence name and
     * store in member variables
     *
     * @param conn An active connection to the database
     * @param name Nucleotide sequence name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name ) 
	throws SQLException {

	Long id = TfcNucleotideSequence.retrieveNucleotideSeqID( conn, name );

	if ( id == null ) {
	    throw new RecordNotFoundException( "No NT sequence found " +
					       "with name: " + name );
	}

	get_information( conn, id );
    }


    /**
     * Retrieve data associated with submitted nucleotide sequence id and
     * store in member variables
     *
     * @param conn An active connection to the database
     * @param nucleotide_seq_id Nucleotide sequence id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, Long nucleotide_seq_id )
	throws SQLException {

        // create full version of TfcNucleotideSequence that includes 
	// sequence text
        sequence = new TfcNucleotideSequence( conn, nucleotide_seq_id, true );

	// populate superclass data
        super.populateBaseObject( sequence );
        getTairObjectInformation( conn );
    }




    //
    // TfcNucleotideSequence wrappers
    //

    public String get_definition() { 
	return sequence.get_definition(); 
    }

    public String get_sequence() {
	return sequence.get_sequence(); 
    }

    public String get_name() { 
	return sequence.get_name(); 
    }

    public Long get_nucleotide_seq_id() { 
	return sequence.get_nucleotide_seq_id(); 
    }

    public String get_ic_accession() { 
	return sequence.get_ic_accession(); 
    }

    public java.util.Date get_date_last_modified() { 
	return sequence.get_date_last_modified(); 
    }

    public Long get_translation_tables_id() { 
	return sequence.get_translation_tables_id(); 
    }

    public String get_sequence_type() { 
	return sequence.get_nucleotidesequence_type(); 
    }

    public String get_genome_type() { 
	return sequence.get_genome_type(); 
    }

    public String get_genbank_gi() {
	return sequence.get_genbank_gi(); 
    }

    public Integer get_a_count() { 
	return sequence.get_a_count(); 
    }

    public Integer get_c_count() { 
	return sequence.get_c_count(); 
    }

    public Integer get_g_count() { 
	return sequence.get_g_count(); 
    }

    public Integer get_t_count() { 
	return sequence.get_t_count(); 
    }

    public Integer get_other_count() { 
	return sequence.get_other_count(); 
    }

    public Integer get_length() { 
	return sequence.get_length(); 
    }

    public Integer get_version() { 
	return sequence.get_version(); 
    }

    public java.util.Date get_date_made_public() { 
	return sequence.get_date_made_public(); 
    }

    public Boolean get_is_cds() { 
	return sequence.get_is_cds(); 
    }

    public Boolean get_cds_is_full_length() { 
	return sequence.get_cds_is_full_length(); 
    }

    public Boolean get_cds_is_transpliced() { 
	return sequence.get_cds_is_transpliced(); 
    }

    public Boolean get_cds_is_est() { 
	return sequence.get_cds_is_est(); 
    }

    public java.util.Date get_date_entered() { 
        return sequence.get_date_entered();
    }
    
    public String get_original_name() { 
        return sequence.get_original_name();
    }


    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** SequenceDetail content test ******" );
        super.test();
        sequence.test();
        System.out.println( "**** SequenceDetail content test end ****" );
    }



    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

        try {
            DBconnection connection = new DBconnection();
            Long test_id = new Long( 27947 );
            SequenceDetail object = new SequenceDetail( connection,test_id );
            object.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
  








