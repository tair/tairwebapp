/*-----------------------------------------------------------------------
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*-----------------------------------------------------------------------
 */

package org.tair.querytools;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.Iterator;
import java.util.Vector;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcFlankingSequence;

/**
 * FlankingSequenceVector is an extended version of <code>Vector</code> that
 * stores all flanking sequences associated to a map element as a collection of
 * <code>TfcFlankingSequence</code> objects.
 */

public class FlankingSequenceVector extends Vector {

    /**
     * Creates an empty instance of FlankingSequenceVector
     */
    public FlankingSequenceVector() {
    }

    /**
     * Creates an instance of FlankingSequenceVector populated by flanking
     * sequences associated to submitted map element id. Flanking sequences are
     * stored internally as <code>TfcFlankingSequence</code> objects.
     * 
     * @param db
     *            An active connection to the database
     * @param map_element_id
     *            Map element id to retrieve data for
     * @throws SQLException
     *             in the case of an invalid operation or database error
     */
    public FlankingSequenceVector( DBconnection db, Long map_element_id ) throws SQLException {
        if ( map_element_id != null ) {
            get_information( db, map_element_id );
        }
    }

    /**
     * Retrieves information for supplied map element id
     * 
     * @param db
     *            An active connection to the database
     * @param map_element_id
     *            Map element id to retrieve data for
     * @throws SQLException
     *             in the case of an invalid operation or database error
     */
    public void get_information( DBconnection db, Long map_element_id )
        throws SQLException {
        Vector flank_sequences_id = new Vector();
        String query = null;
        if ( map_element_id != null ) {
            query = "select flank_sequences_id "
                    + "from FlankingSequence_MapElement "
                    + "where map_element_id = "
                    + map_element_id.toString();
            db.setQuery( query );
            ResultSet results = db.getResultSet();
            while ( results.next() ) {
                Long id = 
                    new Long( results.getLong( "flank_sequences_id" ) );
                flank_sequences_id.add( id );
            }
            db.releaseResources();

            if ( flank_sequences_id != null && flank_sequences_id.size() != 0 ) {
                int length = flank_sequences_id.size();
                for ( int i = 0; i < length; i++ ) {
                    TfcFlankingSequence tfc_flanking_sequence = new TfcFlankingSequence( db,
                                                                                         (Long) flank_sequences_id
                                                                                                                  .elementAt( i ) );
                    if ( tfc_flanking_sequence != null
                         && tfc_flanking_sequence.get_flank_sequences_id() != null ) {
                        add( tfc_flanking_sequence );
                    }
                }
            }
        }
    }

    /**
     * @return All flanking sequences with submitted type as an
     *         <code>Iterator</code> of <code>TfcFlankingSequence</code>
     *         objects, or <code>null</code> if no sequences of requested type
     *         exist in collection
     */
    public Iterator get_flanking_sequences( String type ) {
        Iterator iter = null;
        Iterator returnIter = null;
        TfcFlankingSequence sequence = null;
        String seqType = null;
        Vector returnCollection = null;

        if ( type != null && !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                sequence = (TfcFlankingSequence) iter.next();
                seqType = sequence.get_flankingsequence_type();
                if ( seqType != null && seqType.equals( type ) ) {
                    if ( returnCollection == null ) {
                        returnCollection = new Vector();
                    }
                    returnCollection.addElement( sequence );
                }
            }
            if ( returnCollection != null && !returnCollection.isEmpty() ) {
                returnIter = returnCollection.iterator();
            }
        }
        return returnIter;
    }

    /**
     * test FlankingSequenceVector content
     */
    public void test() {
        System.out.println( "** FlankingSequenceVector content test **" );
        if ( this != null && this.size() != 0 ) {
            int length = this.size();
            TfcFlankingSequence object = null;
            for ( int i = 0; i < length; i++ ) {
                object = (TfcFlankingSequence) this.elementAt( i );
                object.test();
            }
        }
        System.out.println( "**** FlankingSequenceVector test end ****" );
    }

    public static void main( String[] args ) {
        try {
            DBconnection connection = new DBconnection();
            Long test_id = new Long( 1012991 );
            FlankingSequenceVector vector = 
                new FlankingSequenceVector( connection, test_id );
            vector.test();
            System.out.println( "***********************************" );
        } catch ( Exception e ) {
            e.printStackTrace();
        }

    }

}
