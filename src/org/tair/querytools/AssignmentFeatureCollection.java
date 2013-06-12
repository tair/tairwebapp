//-----------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2004/09/30 21:09:09 $
//-----------------------------------------------------------------------------

package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * AssignmentFeatureCollection is a custom collection that stores feature
 * assignments for a GlobalAssignment as a collection of
 * <code>TfcAssignmentFeature</code> objects.
 */

public class AssignmentFeatureCollection {

    private ArrayList assignmentFeatures;

    /**
     * Creates an empty instance of AssignmentFeatureCollection
     */

    public AssignmentFeatureCollection() {
        assignmentFeatures = new ArrayList();
    }

    /**
     * Creates an instance of AssignmentFeatureCollection that represents a
     * collection of feature assignments for submitted GlobalAssignment id. 
     * 
     * @param conn
     *            An active connection to the database
     * @param globalAssignmentId
     *            Assignment id to retrieve data for
     * @throws SQLException
     *             in the case of an invalid operation or database error
     */

    public AssignmentFeatureCollection( DBconnection conn, 
                                        Long globalAssignmentId )
        throws SQLException {

        assignmentFeatures = new ArrayList();
	populate( conn, globalAssignmentId );
    }


    /**
     * Retrieves feature assignments for assignment id; creates UTRs and 
     * introns manually
     */
    private void populate( DBconnection conn, Long globalAssignmentId )
        throws SQLException {

        ArrayList assignmentFeatureIDs = null;

        String query = 
	    "SELECT assignment_feature_id " + 
	    "FROM AssignmentFeature " + 
	    "WHERE global_assignment_id = ?";

	
        conn.setQuery( query );
	conn.setQueryVariable( globalAssignmentId );
	
        ResultSet results = conn.getResultSet();

        while ( results.next() ) {
            if ( assignmentFeatureIDs == null ) {
                assignmentFeatureIDs = new ArrayList();
            }

            assignmentFeatureIDs.
                add( new Long( results.getLong( "assignment_feature_id" ) ) );
        }

        conn.releaseResources();

        if ( assignmentFeatureIDs != null && 
             !assignmentFeatureIDs.isEmpty() ) {
            Iterator iter = assignmentFeatureIDs.iterator();

	    TfcAssignmentFeature assignmentFeature = null;
            while ( iter.hasNext() ) {
                assignmentFeature = 
                    new TfcAssignmentFeature( conn, ( Long ) iter.next() );
                assignmentFeatures.add( assignmentFeature );
            }

  
            Collections.sort( assignmentFeatures,
                              new AssignmentFeatureTypeComparator() );
            Collections.sort( assignmentFeatures,
                              new AssignmentFeatureComparator() );

            // Calculate features that aren't stored in the db

            calculateUTR();
            calculateIntrons();

        }
    }


    /**
     * Calculate UTR features by looking for exons that are outside of ORF
     */
	
    private void calculateUTR() {
        ArrayList utr5 = new ArrayList();
        ArrayList utr3 = new ArrayList();
        TfcAssignmentFeature orf = null;
        TfcAssignmentFeature feature = null;
        TfcAssignmentFeature utr = null;

        int orfStartPosition = -1;
        int orfEndPosition = -1;

        if ( !isEmpty() ) {
            int length = assignmentFeatures.size();

            for ( int i = 0; i < length; i++ ) {
                feature = elementAt( i );

                if ( feature.getType().equalsIgnoreCase( "ORF" ) ) {
                    orf = feature;
                    orfStartPosition = orf.getStartPosition().intValue();
                    orfEndPosition = orf.getEndPosition().intValue();
                    break;
                }
            }

            int exonStart = -1;
            int exonEnd = -1;

            if ( orf != null ) {
                for ( int i = 0; i < length; i++ ) {
                    feature = ( TfcAssignmentFeature ) elementAt( i );

                    if ( feature.getType().equalsIgnoreCase( "exon" ) ) {
                        exonStart = feature.getStartPosition().intValue();
                        exonEnd = feature.getEndPosition().intValue();

                        // If exon is before ORF

                        if ( orfStartPosition >= exonEnd ) {
                            utr = new TfcAssignmentFeature( feature );
                            utr.setType( "5' utr" );

                            // Recalculate feature length to account for new 
                            // end position

                            utr.calculateLength(); 
                            utr5.add( utr );
                        } 

                        // If ORF starts w/in exon

                        else if ( orfStartPosition > exonStart
                                   && orfStartPosition < exonEnd ) {
                            utr = new TfcAssignmentFeature( feature );
                            utr.setType( "5' utr" );
                            utr.setEndPosition( new 
                                                Float( orfStartPosition - 1 ));

                            // Recalculate feature length to account for new 
                            // end position

                            utr.calculateLength(); 
                            utr5.add( utr );
                        }

                        // If ORF ends w/in exon

                        if ( orfEndPosition >= exonStart
                            && orfEndPosition < exonEnd ) {
                            utr = new TfcAssignmentFeature( feature );
                            utr.setType( "3' utr" );
                            utr.setStartPosition( new 
                                                  Float( orfEndPosition + 1 ));

                            // Recalculate feature length to account for new 
                            // start position

                            utr.calculateLength(); 
                            utr3.add( utr );
                        } 

                        // If exon is completely after ORF

                        else if ( orfEndPosition <= exonStart ) {
                            utr = new TfcAssignmentFeature( feature );
                            utr.setType( "3' utr" );
                            utr.calculateLength();
                            utr3.add( utr );
                        }
                    }
                }
            }

            if ( utr5 != null && utr5.size() != 0 ) {
                length = size();
                int position = 0;

                for ( int i = 0; i < length; i++ ) {
                    feature = elementAt( i );

                    if ( feature.getType().equalsIgnoreCase( "ORF" ) ) {
                        position = i + 1;
                        break;
                    }
                }

                assignmentFeatures.addAll( position, utr5 );
            }

            if ( utr3 != null && utr3.size() != 0 ) {
                assignmentFeatures.addAll( utr3 );
            }
        }
    }

    /**
     * Manually create introns between exons in feature assignment
     */
	
    private void calculateIntrons() {
        TfcAssignmentFeature leftObject = null;
        TfcAssignmentFeature rightObject = null;
        String leftType = null;
        String rightType = null;

        // New list will contain newly created intron objs. in correct index
        // position

        ArrayList newList = new ArrayList();

        if ( !isEmpty() ) {
            int length = size();

            for ( int i = 1; i < length; i++ ) {
                leftObject = elementAt( i - 1 );
                rightObject = elementAt( i );
                leftType = leftObject.getType();
                rightType = rightObject.getType();

                // add leading exon no matter what

                newList.add( leftObject );

                // if two exons next to each other in collection, create intron
                // object to span the gap between them

                if ( leftType.equalsIgnoreCase( "exon" ) && 
                     rightType.equalsIgnoreCase( "exon" ) ) {
                    TfcAssignmentFeature intron = new TfcAssignmentFeature();
                    Float startPoint = 
                        new Float( leftObject.getEndPosition().floatValue() + 
                                   1 );
                    Float endPoint = 
                        new Float( rightObject.getStartPosition().
                                   floatValue() - 1 );

                    intron.setType( "intron" );
                    intron.setStartPosition( startPoint );
                    intron.setEndPosition( endPoint );
                    newList.add( intron );
                }

                // add ending exon if at end of list, otherwise we'll get it
                // next time through loop

                if ( i == length - 1 ) {
                    newList.add( rightObject );
                }
            }

            // replace original collection with new one that contains inserted
            // introns

            assignmentFeatures = newList;
        }
    }


    /**
     * Determines if collection contains an ORF.
     */
	
    private boolean hasORF() {
        TfcAssignmentFeature feature = null;
        boolean hasORF = false;
        Iterator iter = iterator();

        if ( iter != null ) {
            while ( iter.hasNext() ) {
                feature = ( TfcAssignmentFeature ) iter.next();
                if ( feature.getType().equalsIgnoreCase( "ORF" ) ) {
                    hasORF = true;
                    break;
                }
            }
        }

        return hasORF;
    }

    /**
     * Retrieve all elements in collection
     * 
     * @return Elements in collection as an <code>Iterator</code> of
     *         <code>TfcAssignmentFeature</code> objects, or <code>null</code>
     *         if no elements in collection
     */
	
    public Iterator iterator() {
        return !isEmpty() ? assignmentFeatures.iterator() : null;
    }

    /**
     * Returns feature assignments optionally excluding cds ( type =
     * "coding_region"  ) from returned values
     * 
     * @param checkCDs
     *            If <code>true</code>, feature assignment collection will
     *            first be examined to see if it contains an ORF; if so, cds
     *            will be excluded from Iterator, since they are redundant at
     *            that point; if <code>false</code>, all features will be
     *            returned
     * @return Feature assignments for this assignment as an
     *         <code>Iterator</code> of <code>TfcAssignmentFeature</code>
     *         objects, or <code>null</code> if no feature assignments for
     *         this assignment object.
     */
	
    public Iterator iterator( boolean checkCDs ) {
        Iterator iter = null;
        Iterator returnIter = null;
        ArrayList returnObjs = null;

        if ( !isEmpty() ) {
            iter = assignmentFeatures.iterator();

            // If checking CDs, and ORF in collection, then exclude CDs,
            // otherwise show all

            if ( !checkCDs || !hasORF() ) {
                returnIter = iter;

            } 
            else {
                while ( iter.hasNext() ) {
                    TfcAssignmentFeature feature = 
                        ( TfcAssignmentFeature ) iter.next();

                    if ( !feature.getType().
                         equalsIgnoreCase( "coding_region" ) ) {
                        if ( returnObjs == null ) {
                            returnObjs = new ArrayList();
                        }
                        returnObjs.add( feature );
                    }
                }

                if ( returnObjs != null && !returnObjs.isEmpty() ) {
                    returnIter = returnObjs.iterator();
                }
            }
        }

        return returnIter;
    }

    /**
     * Retrieves all feature assignments in collection that have submitted
     * feature assignment type
     * 
     * @return Feature assignments of submitted type as an 
     *         <code>Iterator</code> of <code>TfcAssignmentFeature</code> 
     *         objects or <code>null</code> if no features of requested 
     *         type are in collection
     */
	
    public Iterator iterator( String assignmentFeatureType ) {
        Iterator iter = null;
        Iterator returnIter = null;
        ArrayList returnObjs = null;

        if ( assignmentFeatureType != null ) {
            iter = iterator();

            if ( iter != null ) {
                while ( iter.hasNext() ) {
                    TfcAssignmentFeature feature = 
                        ( TfcAssignmentFeature ) iter.next();

                    if ( assignmentFeatureType.equals( feature.getType() ) ) {
                        if ( returnObjs == null ) {
                            returnObjs = new ArrayList();
                        }

                        returnObjs.add( feature );
                    }
                }

                if ( returnObjs != null && !returnObjs.isEmpty() ) {
                    returnIter = returnObjs.iterator();
                }
            }
        }

        return returnIter;
    }

    /**
     * Determines if collection has elements in it
     * 
     * @return <code>true</code> if collection has no elements in it, or
     *         <code>false</code> if collection has at least one element in it
     */
	
    public boolean isEmpty() {
        return ( assignmentFeatures != null && assignmentFeatures.isEmpty() );
    }

    /**
     * Determines number of elements in collection
     * 
     * @return Number of elements in collection
     */
	
    public int size() {
        return ( assignmentFeatures != null ) ? assignmentFeatures.size() : 0;
    }

    /**
     * Retrieves elements at submitted index
     * 
     * @param index
     *            Index of item to retrieve
     * @return Element at submitted index, or <code>null</code> if no element
     *         at requested index
     */
	
    public TfcAssignmentFeature elementAt( int index ) {
        return ( TfcAssignmentFeature ) assignmentFeatures.get( index );
    }

    /**
     * Sorts all elements in collection according to criteria set in comparator
     * 
     * @param comparator
     *            Comparator that defines criteria collection should be sorted
     *            by
     */
	
    public void sort( Comparator comparator ) {
        Collections.sort( assignmentFeatures, comparator );
    }

    /**
     * For unit testing only
     */
	
    public void test() {
        System.out.println( "****** AssignmentFeatureCollection " +
                            "content test ******" );

        if ( !isEmpty() ) {
            Iterator iter = iterator();

            while ( iter.hasNext() ) {
                TfcAssignmentFeature assignmentFeature = 
                    ( TfcAssignmentFeature ) iter.next();
                assignmentFeature.test();
            }
        }

        System.out.println( "**** AssignmentFeatureCollection " +
                            "content test end ****" );
    }

    /**
     * For unit testing only
     */
	
    public static void main( String[] args ) {
        try {
            DBconnection conn = new DBconnection();
            Long globalAssignmentId = new Long( 2 );
            AssignmentFeatureCollection features = 
                new AssignmentFeatureCollection( conn, globalAssignmentId );
            features.test();
        } 
        catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
