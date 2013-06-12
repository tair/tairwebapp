//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.6 $
// $Date: 2004/11/24 22:32:04 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;

/**
 * ArrayElement is a class to generically represent a map element that is used
 * as part of microarray experiments.  ArrayElement data may ultimately come 
 * from Clone, DnaFragment, or Unknown tables, but the ArrayElement table is 
 * used as a central point to store minimal data on these elements as they're
 * used in microarray experiments.  This class adds additional type specific
 * data to the basic data in superclass.
 */


public class ArrayElement extends TfcArrayElement {

    // aliases for ArrayElement (as tair object)
    private AliasVector aliases;

    // flag to record whether ArrayElement has data in Expression Viewer -
    // this is used to determine whether to show a link to viewer 
    // when displaying element data
    private boolean hasViewerData = false;


    /**
     * Creates an instance of ArrayElement that contains data for submitted 
     * array element id
     *
     * @param conn An active connection to the database
     * @param array_element_id Array element id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public ArrayElement( DBconnection conn, Long array_element_id ) 
	throws SQLException {

        super( conn, array_element_id );

        this.aliases = new AliasVector( conn, get_tair_object_id() ); 
	
        // determine if element has expression viewer data -- only check
	// for Afgc array elements to avoid expensive query
	if ( super.isAfgcElement() ) {
	    hasViewerData = 
		TfcArrayElement.hasViewerData(conn, array_element_id ); 
	}
    }

    /**
     * Determines whether array element has data that can be displayed using
     * the AFGC expression viewer. 
     * 
     * @return <code>true</code> if array element has expression viewer data,
     * or <code>false</code> if no expression viewer data for array element
     */
    public boolean hasViewerData() {
        return hasViewerData;
    }

    /**
     * Determines whether array element has one or more associated aliases
     *
     * @return <code>true</code> if object has associated aliases, or
     * <code>false</false> if object has no associated aliases
     */
    public boolean hasAliases() {
        return ( aliases != null && !aliases.isEmpty() );
    }

    /**
     * Retrieves aliases for array element
     *
     * @return aliases as an <code>Iterator</code> of <code>TfcAlias</code>s
     * or <code>null</code> if no aliases for array element
     */
    public Iterator getAliases() {
        return hasAliases() ? aliases.iterator() : null;
    }
   

    /**
     * Retrieves TAIR accession number for this element (composed of table name and
     * tair object id).  This number can be used for creating hyperlinks to element's
     * type specific detail pages (i.e. clone detail page). However, since there
     * are currently no detail pages for Unknown or DnaFragment elements, hasDetailPage
     * method should be called to make sure a detail page exists for an element before
     * creating the link
     *
     * @return TAIR accession number for this element
     */
    public String getTAIRAccession() {
        return get_table_name() + ":" + get_tair_object_id();
    }


    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** ArrayElement ******" );
        super.test();

        if ( hasAliases() ) {
            aliases.test();
        }

        System.out.println( "****** ArrayElement end ******" );
    }

    
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{
            DBconnection conn = new DBconnection();

            // clone
            Long arrayElementID = new Long( 6076 );
            ArrayElement element = new ArrayElement( conn, arrayElementID );
            element.test();

            // unknown
            arrayElementID = new Long( 11426 );
            element = new ArrayElement( conn, arrayElementID );
            element.test();

            // dna fragment
            arrayElementID = new Long( 8206 );
            element = new ArrayElement( conn, arrayElementID );
            element.test();

            
        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }
}
