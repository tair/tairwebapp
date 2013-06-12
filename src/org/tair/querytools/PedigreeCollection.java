//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.7 $
// $Date: 2006/01/10 21:11:18 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import org.tair.tfc.DBconnection;
import org.tair.utilities.TextConverter;
import org.tair.utilities.EmptyTextConverter;
/**
 * PedigreeCollection is a custom collection class that stores parents or
 * children of a given germplasm as a collection of <code>Pedigree</code>
 * objects.
 * 
 * <p>
 * Implements Serializable for writing stock catalog data to disk.
 */

public class PedigreeCollection implements Serializable {

    private ArrayList pedigrees;

    // maximum number of children to retrieve
    private final int MAX_CHILDREN = 10;

    // flag to track whether collection is abbreviated; this
    // will be true if creating a collection of child germplasms and
    // the total number of children exceeds the value of MAX_CHILDREN
    // In this case, collection will only contain the number of children
    // that will be used for display.
    private boolean abbreviated = false;

    // number to track how many children total are associated to a parent
    // germplasm. This is needed since if this number exceeds the value of
    // MAX_CHILDREN, collection will only contain children for display though
    // we still need to be able to display how many children in total
    // are associated to parent.
    private int totalNumberChildren = 0;

    /**
     * Creates an empty instance of PedigreeCollection
     */
    public PedigreeCollection() {
        pedigrees = new ArrayList();
    }

    /**
     * Creates an instance of PedigreeCollection that contains submitted
     * germplasm_id's parents or children depending on the value of submitted
     * getParents flag.
     * 
     * <p>
     * Since the number of child germplasms for a given parent can be very
     * large, when collection is populated with children, a count is first made
     * to determine how many children exist for the parent. If that number
     * exceeds the maximum allowed for display (currently 10), only the first 10
     * will actually be retrieved and the "isAbbreviated" flag will be set to
     * true so that client code will know that collection contents do not
     * contain all data for this parent. This is done to allow the display of
     * child germplasms on the germplasm detail page while displaying a link to
     * view the full list.
     * 
     * @param conn
     *            An active connection to the database
     * @param germplasm_id
     *            Germplasm id to retrieve pedigree records for
     * @param getParents
     *            If <code>true</code> collection will contain parents of
     *            submitted germplasm_id; if <code>false</code> collection
     *            will contain children of germplasm_id.
     * @exception SQLException
     *                in the case of an invalid operation or database error
     */
    public PedigreeCollection( DBconnection conn,
                              Long germplasm_id,
                              boolean getParents ) throws SQLException {

        pedigrees = new ArrayList();

        if ( getParents ) {
            populateParents( conn, germplasm_id );
        } else {
            populateChildren( conn, germplasm_id );
        }
    }

    /**
     * Creates an instance of PedigreeCollection that contains submitted
     * germplasm_id's parents or children depending on the value of submitted
     * getParents flag, where parent and child are related to each other with
     * the submitted value for generative method. This is helpful for defining a
     * specific set of germplasms to retrieve (such as single plant progeny for
     * a natural variant).
     * 
     * <p>
     * This constructor will never abbreviate contents of collection as does the
     * version of constructor that does not include generativeMethod. Including
     * generative method as criteria should always restrict the result set to a
     * manageable size, and so further restriction is assumed to be unnecessary.
     * Also, since this method current serves the the single purpose of
     * displaying single plant progeny on the natural variant stock catalog
     * pages, restriction of size is not required.
     * 
     * @param conn
     *            An active connection to the database
     * @param germplasm_id
     *            Germplasm id to retrieve pedigree records for
     * @param getParents
     *            If <code>true</code> collection will contain parents of
     *            submitted germplasm_id; if <code>false</code> collection
     *            will contain children of germplasm_id.
     * @param generativeMethod
     *            Generative method of records to retrieve
     * @exception SQLException
     *                in the case of an invalid operation or database error
     */
    public PedigreeCollection( DBconnection conn,
                              Long germplasm_id,
                              boolean getParents,
                              String generativeMethod ) throws SQLException {

        pedigrees = new ArrayList();
        populateGenerativeMethod( conn,
                                  germplasm_id,
                                  getParents,
                                  generativeMethod );
    }

    /**
     * Retrieve associated parent germplasms and create Pedigree objects for
     * each
     */
    private void populateParents( DBconnection conn, Long germplasm_id )
        throws SQLException {
        String query = null;
        ResultSet results = null;
        ArrayList ids = null;

        query = "SELECT parent_germplasm_id AS germplasm_id "
                + "FROM Pedigree "
	        + "WHERE child_germplasm_id = ? ";

        conn.setQuery( query );
	conn.setQueryVariable( germplasm_id.toString() );
        results = conn.getResultSet();
        while ( results.next() ) {
            if ( ids == null ) {
                ids = new ArrayList();
            }
            ids.add( new Long( results.getLong( "germplasm_id" ) ) );
        }
        conn.releaseResources();

        // create Pedigree objects for each id retrieved - create
        // to reflect parent data
        createPedigreeObjects( conn, germplasm_id, ids, true );

    }

    /**
     * Retrieves child germplasms associated to submitted germplasm id. Since
     * the number of children can be very large, the number of Pedigree objects
     * actually created and added to collection will not exceed the value of
     * MAX_CHILDREN. The actual number of children will always be saved in the
     * totalNumberChildren member variable; if this number exceeds MAX_CHILDREN
     * the abbreviated flag will be set to true so client code knows that
     * collection does not contain all children for germplasm
     * 
     * @param conn
     *            An active connection to the database
     * @param germplasm_id
     *            Parent germplasm id to retrieve children for
     */
    private void populateChildren( DBconnection conn, Long germplasm_id )
        throws SQLException {

        ResultSet results = null;

        // determine the total number of associated children
        StringBuffer query = new StringBuffer();
        query.append( "SELECT COUNT( child_germplasm_id ) AS child_count " );
        query.append( "FROM Pedigree " );
        query.append( "WHERE parent_germplasm_id = ? " );

        conn.setQuery( query.toString() );
	conn.setQueryVariable( germplasm_id.toString() );
        results = conn.getResultSet();
        if ( results.next() ) {
            this.totalNumberChildren = results.getInt( "child_count" );
        }
        conn.releaseResources();

        // retrieve ids to create child Pedigree objects from. If number
        // of associated children exceeds max for display, limit results using
        // SET ROWCOUNT to avoid retrieving all ids. NOTE: THIS IS SYBASE/T-SQL
        // SPECIFIC!!!
        query = new StringBuffer();
        if ( totalNumberChildren > MAX_CHILDREN ) {
            this.abbreviated = true;
            query.append( "SET ROWCOUNT " + MAX_CHILDREN + " " );
        }
        query.append( "SELECT child_germplasm_id " );
        query.append( "FROM Pedigree " );
        query.append( "WHERE parent_germplasm_id = ? ");

        if ( abbreviated ) {
            query.append( "SET ROWCOUNT 0" );
        }

        ArrayList ids = null;

        conn.setQuery( query.toString() );
	conn.setQueryVariable( germplasm_id.toString() );
        results = conn.getResultSet();
        while ( results.next() ) {
            if ( ids == null ) {
                ids = new ArrayList();
            }
            ids.add( new Long( results.getLong( "child_germplasm_id" ) ) );

        }
        conn.releaseResources();

        // create objects to reflect child data
        createPedigreeObjects( conn, germplasm_id, ids, false );

    }

    /**
     * Retrieves child or parent germplasms (as flagged by getParents) that are
     * associated to germplasm id with the submitted value of generative method.
     * All matching items will be retrieved and stored in collection.
     * 
     * @param conn
     *            An active connection to the database
     * @param germplasm_id
     *            Germplasm id to retrieve pedigree data for
     * @param getParents
     *            If <code>true</code> germplasm id is a child id to retrieve
     *            parents for, if <code>false</code> germplasm id is a parent
     *            id to retrieve children for
     * @param generativeMethod
     *            Generative method value to restrict entries to
     * @throws SQLException
     *             if a database error occurs
     */
    private void populateGenerativeMethod( DBconnection conn,
                                          Long germplasm_id,
                                          boolean getParents,
                                          String generativeMethod )
        throws SQLException {

        ArrayList ids = null;
        ResultSet results = null;
        String query = null;

        // determine which column should be retrieved and which should be
        // used to restrict entries in WHERE clause according to whether
        // we're getting parents or children for germplasm_id
        String selectColumn = getParents ? "parent_germplasm_id"
                                        : "child_germplasm_id";
        String whereColumn = getParents ? "child_germplasm_id"
                                       : "parent_germplasm_id";

        query = "SELECT "
                + selectColumn
                + " AS germplasm_id "
                + "FROM Pedigree "
                + "WHERE "
                + whereColumn
                + " = ? "
   	        + "AND generative_method = ? ";

        conn.setQuery( query );
	conn.setQueryVariable( 1, germplasm_id.toString() );
	conn.setQueryVariable( 2, generativeMethod );
        results = conn.getResultSet();
        while ( results.next() ) {
            if ( ids == null ) {
                ids = new ArrayList();
            }
            ids.add( new Long( results.getLong( "germplasm_id" ) ) );
        }

        conn.releaseResources();
        createPedigreeObjects( conn, germplasm_id, ids, getParents );

        // if getting children this way, manually set value for total number
        // of children to avoid any confusion
        if ( !getParents && ids != null ) {
            this.totalNumberChildren = ids.size();
        }

    }

    /**
     * Create Pedigree objects to reflect association between germplasm id and
     * submitted ids. Ids will represent germplasm_ids associated parent or
     * child germplasms according to the value of createParents
     */
    private void createPedigreeObjects( DBconnection conn,
                                       Long germplasm_id,
                                       List ids,
                                       boolean createParents )
        throws SQLException {

        if ( ids != null && !ids.isEmpty() ) {
            Iterator iter = ids.iterator();

            Long childID = null;
            Long parentID = null;
            while ( iter.hasNext() ) {

                if ( createParents ) {
                    childID = germplasm_id;
                    parentID = (Long) iter.next();
                } else {
                    childID = (Long) iter.next();
                    parentID = germplasm_id;
                }

                add( new Pedigree( conn, parentID, childID, createParents ) );
            }
        }
    }

    /**
     * Populates collection of loci for each Pedigree object in collection
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populateLocus( DBconnection conn ) throws SQLException {
        Iterator iter = null;
        Pedigree pedigree = null;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                pedigree = (Pedigree) iter.next();
                pedigree.populateLocus( conn );
            }
        }
    }

    /**
     * Populates collection of polymorphisms for each Pedigree object in
     * collection
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populatePolymorphisms( DBconnection conn ) throws SQLException {
        Iterator iter = null;
        Pedigree pedigree = null;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                pedigree = (Pedigree) iter.next();
                pedigree.populatePolymorphisms( conn );
            }
        }
    }

    /**
     * Populates species variant data for each Pedigree object in collection.
     * Species variant data can be related to germplasm object of Pedigree
     * object either directly, or through germplasm's own records in Pedigree
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    public void populatePedigreeSpeciesVariants( DBconnection conn )
        throws SQLException {

        Iterator iter = null;
        Pedigree pedigree = null;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() ) {
                pedigree = (Pedigree) iter.next();
                pedigree.populatePedigreeSpeciesVariants( conn );
            }
        }
    }

    /**
     * Determines if contents of collection have been abbreviated. If collection
     * has been created to contain child germplasms, and the number of children
     * exceeds the maximum number for display, this value will be true and
     * collection will only contain elements for display. In this case, the
     * total number of children associated to the parent germplasm can be
     * determined through the value of getTotalNumberChildren rather than the
     * size() method.
     * 
     * @return <code>true</code> if collection has been abbreviated to only
     *         contain the maximum number of child germplasms allowed for
     *         display, or <code>false</code> if contents of collection
     *         represent the total number of associated germplasms through
     *         Pedigree
     */
    public boolean isAbbreviated() {
        return abbreviated;
    }

    /**
     * Retrieves the total number of child germplasms associated to the parent
     * germplasm id used when collection was created. If collection was created
     * to contain parent germplasms, this value will be zero. If number of
     * associated children exceeds the maximum number allowed for display,
     * isAbbreviated will return <code>true</code> and this value should be
     * used to determine the total number of children instead of the size()
     * method, since size() will only return the number of elements actually in
     * the collection
     * 
     * @return Number of child germplasms associated to parent germplasm. If
     *         collection was created to contain parents, this value will be
     *         zero.
     */
    public int getTotalNumberChildren() {
        return totalNumberChildren;
    }

    /**
     * Determines if any pedigree object has data for the "parent_gender" field.
     * This info. can be used at the JSP level to determine whether to show the
     * gender column when displaying the entire collection.
     * 
     * @return <code>true</code> if at least one element in collection has a
     *         non-null value for parent gender
     */
    public boolean hasParentGenderData() {
        boolean hasData = false;

        if ( !isEmpty() ) {
            Pedigree pedigree = null;
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                pedigree = (Pedigree) iter.next();
                if ( pedigree.get_parent_gender() != null ) {
                    hasData = true;
                    break;
                }
            }
        }

        return hasData;
    }

    /**
     * Determines if any pedigree object has data for the "generation" field.
     * This info. can be used at the JSP level to determine whether to show the
     * generation column when displaying the entire collection.
     * 
     * @return <code>true</code> if at least one element in collection has a
     *         non-null value for generation
     */
    public boolean hasGenerationData() {
        boolean hasData = false;

        if ( !isEmpty() ) {
            Pedigree pedigree = null;
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                pedigree = (Pedigree) iter.next();
                if ( pedigree.get_generation() != null ) {
                    hasData = true;
                    break;
                }
            }
        }

        return hasData;
    }

    /**
     * Determines if any pedigree object has data for the "generative_method"
     * field. This info. can be used at the JSP level to determine whether to
     * show the generation column when displaying the entire collection.
     * 
     * @return <code>true</code> if at least one element in collection has a
     *         non-null value for generative method
     */
    public boolean hasGenerativeMethodData() {
        boolean hasData = false;

        if ( !isEmpty() ) {
            Pedigree pedigree = null;
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                pedigree = (Pedigree) iter.next();
                if ( pedigree.get_generative_method() != null ) {
                    hasData = true;
                    break;
                }
            }
        }

        return hasData;
    }


    /**
     * Determines if any pedigree object has data for the "background"
     * field. This info. can be used at the JSP level to determine whether to
     * show the generation column when displaying the entire collection.
     * 
     * @return <code>true</code> if at least one element in collection has a
     *         non-null value for generative method
     */
    public boolean hasPedigreeSpeciesVariants() {
        boolean hasData = false;

        if ( !isEmpty() ) {
            Pedigree pedigree = null;
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                pedigree = (Pedigree) iter.next();
                if ( pedigree.getPedigreeSpeciesVariants() != null ) {
                    hasData = true;
                    break;
                }
            }
        }

        return hasData;
    }

    /**
     * Determines if any pedigree object has data for the "Locus Associations"
     * field. This info. can be used at the JSP level to determine whether to
     * show the generation column when displaying the entire collection.
     * 
     * @return <code>true</code> if at least one element in collection has a
     *         non-null value for generative method
     */
    public boolean hasLocusAssociations() {
        boolean hasData = false;

        if ( !isEmpty() ) {
            Pedigree pedigree = null;
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                pedigree = (Pedigree) iter.next();
		if (pedigree.hasLocus()) {
		    Iterator locusItr = pedigree.getLocus();
		    while ( locusItr.hasNext() ) {
			Locus l = (Locus) locusItr.next();
			if (!EmptyTextConverter.convert(l.get_name()).equals("")) {
			    return true;
			}
		    }
                }
            }
        }

        return hasData;
    }

    /**
     * Determines if collection has elements in it
     * 
     * @return <code>true</code> if collection has no elements in it;
     *         <code>false</code> if collection has at least one element in it
     */
    public boolean isEmpty() {
        return pedigrees.isEmpty();
    }

    /**
     * Retrieves number of elements in collection. If isAbbreviated() returns
     * <code>true</code>, this value should not be used to determine how many
     * child germplasms are associated to a parent, since it only records how
     * many elements are actually in the collection. In this case, the number of
     * associated children can be determined using the getTotalNumberChildren
     * method.
     * 
     * @return Number of elements in collection
     */
    public int size() {
        return pedigrees.size();
    }

    /**
     * Retrieves element at supplied index
     * 
     * @return Element at supplied index, or <code>null</code> if no element
     *         at supplied index
     */
    public Pedigree get( int index ) {
        return (Pedigree) pedigrees.get( index );
    }

    /**
     * Adds supplied element to collection
     * 
     * @param pedigree
     *            Pedigree record to add to collection
     */
    public void add( Pedigree pedigree ) {
        pedigrees.add( pedigree );
    }

    /**
     * Removes supplied element from collection. If element is not in collection
     * request is silently ignored
     * 
     * @param pedigree
     *            Pedigree record to remove from collection
     */
    public void remove( Pedigree pedigree ) {
        pedigrees.remove( pedigree );
    }

    /**
     * Determines if supplied element is in collection
     * 
     * @return <code>true</code> if supplied element is in collection;
     *         <code>false</code> if element is not found
     */
    public boolean contains( Pedigree pedigree ) {
        return pedigrees.contains( pedigree );
    }

    /**
     * Retrieves all elements in collection
     * 
     * @return All pedigree records in collection as an <code>Iterator</code>
     *         of <code>Pedigree</code> objects, or <code>null</code> if no
     *         records in collection
     */
    public Iterator iterator() {
        return ( !pedigrees.isEmpty() ) ? pedigrees.iterator() : null;
    }

    /**
     * Sorts all elements in collection according to criteria set in comparator
     * 
     * @param comparator
     *            Comparator that defines criteria collection should be sorted
     *            by
     */
    public void sort( Comparator comparator ) {
        Collections.sort( pedigrees, comparator );
    }

    /**
     * For unit testing only
     */
    public void test() {

        System.out.println( "****** PedigreeCollection content test ******" );

        System.out.println( "is abbreviated: " + isAbbreviated() );
        System.out.println( "total number children: "
                            + getTotalNumberChildren() );
        System.out.println( "collection size: " + size() );

        Iterator iter = iterator();
        if ( iter != null ) {
            while ( iter.hasNext() ) {
                Pedigree pedigree = (Pedigree) iter.next();
                pedigree.test();
            }
        }
        System.out.println( "**** PedigreeCollection content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try {
            DBconnection conn = new DBconnection();

            System.out.println( "Creating parent collection..." );
            Long childID = new Long( 1444 );
            PedigreeCollection pedigrees = new PedigreeCollection( conn,
                                                                   childID,
                                                                   true );
            pedigrees.test();

            System.out.println( "\nCreating child collection..." );
            Long parentID = new Long( 1441 );
            pedigrees = new PedigreeCollection( conn, parentID, false );
            pedigrees.test();

            System.out.println( "\nCreating child collection with "
                                + "generative method..." );
            parentID = new Long( 836 );
            String generativeMethod = "single_plant_selection";
            pedigrees = new PedigreeCollection( conn,
                                                parentID,
                                                false,
                                                generativeMethod );
            pedigrees.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }
}
