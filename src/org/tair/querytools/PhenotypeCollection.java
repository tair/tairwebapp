/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;
import java.io.Serializable;

import org.tair.tfc.*;
import org.tair.utilities.*;

/**
 * Contains multiple Phenotype (which extends TfcPhenotype) objects.
 * Constructor supports loading phenotypes related to a given germplasm.
 */
public class PhenotypeCollection implements Serializable
{
    // empty rather than null when there are no phenotypes.
    private List phenotypes;

    /** presumably required for testing. */
    public PhenotypeCollection()
    {
        this.phenotypes = new ArrayList();
    }

    /** get phenotypes for a given germplasm. */
    public PhenotypeCollection( DBconnection conn, Long germplasm_id )
        throws SQLException
    {
        this();

        addPhenotypes( conn, germplasm_id );
    }

    private void addPhenotypes( DBconnection conn, Long germplasm_id )
        throws SQLException
    {
        // TODO: in order to get the full set of phenotypes, we do two queries.
        // (the other option is to do one query, then do all the sorting in Java.)

        // first: get all phenotypes that have publications (because
        // we are interested in showing the authors names + publication date)
        // the second is to get all remaining phenotypes.
        addPhenotypesHavingReferences( conn, germplasm_id );

        // second: since this must avoid those with publications, it
        // requires the previous query to have run so we can include
        // a list of ids to avoid.
        addPhenotypesWithoutReferences( conn, germplasm_id );
    }

    private void addPhenotypesHavingReferences( DBconnection conn, Long germplasm_id )
        throws SQLException
    {
        String query =
            "SELECT pt.phenotype_id AS phenotype_result_alias" +
            " FROM Germplasm g, Germplasm_Phenotype gppt, Phenotype pt, Reference ref" +
            " WHERE g.germplasm_id = ? " + 
            " AND gppt.germplasm_id = g.germplasm_id" +
            " AND gppt.phenotype_id = pt.phenotype_id" +
            // NOTE: this ordering is used to show references on
            // germplasm_detail.jsp per curatorial desire. If anything
            // ever needs a different ordering, either make different
            // constructors or move the ordering out into post-processing
            // via Java.
            // RJM 2007-06-27 Removed order by because publication replaced
            // by reference, as reference has no year or author list. If we 
            // need ordering, it should be done on the queried reference data 
            // that includes year and authors as relevant.
            " AND gppt.reference_id = ref.reference_id" +
            " AND ref.reference_type <> 'null_reference'";

        //java.lang.System.out.println( "query = " + query );

        conn.setQuery( query );
	conn.setQueryVariable( germplasm_id.toString() );
        addPhenotypesForQueryConnection( conn, germplasm_id );
    }

    private void addPhenotypesWithoutReferences( DBconnection conn, Long germplasm_id )
        throws SQLException
    {
        StringBuffer query = new StringBuffer(
            "SELECT pt.phenotype_id AS phenotype_result_alias" +
            " FROM Germplasm g, Germplasm_Phenotype gppt, Phenotype pt " +
            " WHERE g.germplasm_id = ? " +
            " AND gppt.germplasm_id = g.germplasm_id" +
            " AND gppt.phenotype_id = pt.phenotype_id" );

        if( this.phenotypes.size() > 0 )
        {
            query.append( " AND pt.phenotype_id NOT IN (" );

            boolean bFirst = true;
            Iterator iter = this.phenotypes.iterator();
            while( iter.hasNext() )
            {
                if( bFirst )
                {
                    bFirst = false;
                }
                else
                {
                    query.append( ", " );
                }

                Phenotype phenotype = (Phenotype)iter.next();
                query.append( phenotype.get_phenotype_id() );
            }

            query.append( ")" );
        }

        //java.lang.System.out.println( "query = " + query );

        conn.setQuery( query.toString() );
	conn.setQueryVariable( germplasm_id.toString() );
        addPhenotypesForQueryConnection( conn, germplasm_id );
    }

    private void addPhenotypesForQueryConnection( DBconnection conn, Long germplasm_id )
        throws SQLException
    {
        ResultSet results = conn.getResultSet();

        // run through all the hits and get the phenotype ids.
        ArrayList resultIDs = new ArrayList();
        while( results.next() )
        {
            Long phenotypeID = new Long( results.getLong( "phenotype_result_alias" ) );
            resultIDs.add( phenotypeID );
        }
        conn.releaseResources();

        // use the phenotype ids to retrieve the actual phenotypes.
        Iterator iter = resultIDs.iterator();
        while( iter.hasNext() )
        {
            Long pid = (Long)iter.next();
            Phenotype phenotype = new Phenotype( conn, pid, germplasm_id );
            this.phenotypes.add( phenotype );
        }
    }

    /** Returns true if this collection contains no Phenotypes, false otherwise. */
    public boolean isEmpty()
    {
        return( this.phenotypes.isEmpty() );
    }

    /** Returns the number of Phenotypes in this collection. */
    public int size()
    {
        return( this.phenotypes.size() );
    }

    /** Returns an iterator over the Phenotypes in this collection.
     * If there are no items in the collection the Iterator will
     * still be non-null, but will produce no items. */
    public Iterator iterator()
    {
        return( this.phenotypes.iterator() );
    }

    public void test()
    {
        boolean empty = isEmpty();
        int size = size();
        if( empty && size != 0 ) { throw new RuntimeException( "count mismatch" ); }
        if( !empty && size == 0 ) { throw new RuntimeException( "count mismatch" ); }
        if( iterator() == null ) { throw new RuntimeException( "null iterator found" ); }
    }
}
