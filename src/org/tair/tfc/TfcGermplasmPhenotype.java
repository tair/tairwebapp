/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.tfc;

import java.sql.*;
import java.io.Serializable;

import org.tair.utilities.*;

/**
 * This class map to the table Germplasm_MapElement in the tair
 * database. Each instance maps one row of data in
 * Germplasm_MapElement table. Each data object
 * maps to one field of a row in the table. Each field has one set method and
 * one get method for accessing from outside of class.
 * @author tair (Chris Wilks, Jon Slenk)
 */
public class TfcGermplasmPhenotype implements Serializable
{
    private Long germplasm_id;
    private Long phenotype_id;
    private Long reference_id;

    /**
     * Creates an empty instance of TfcGermplasmPhenotype, of
     * very questionable usefulness.
     */
    public TfcGermplasmPhenotype() {}

    /**
     * Creates an instance of TfcGermplasmPhenotype that reflects
     * the data for the relationship between submitted germplasm_id
     * and phenotype_id. Queries null reference for relationships
     * that refer to the null_reference reference.
     *
     * @param connection An active connection to the database
     * @param germplasm_id Germplasm id to retrieve data for
     * @param phenotype_id Map element id to retrieve data for
     * @exception SQLException if a database error occurs, or if no
     * row found for germplasm_id and phenotype_id
     */
    public TfcGermplasmPhenotype( DBconnection connection, Long germplasm_id, Long phenotype_id )
        throws SQLException
    {
        String query =
            "SELECT gp.germplasm_id, gp.phenotype_id, " + 
                   "CASE WHEN r.reference_type = 'null_reference' THEN NULL ELSE gp.reference_id END AS reference_id" +
             " FROM Germplasm_Phenotype gp JOIN Reference r ON gp.reference_id = r.reference_id " +
            " WHERE gp.phenotype_id = ?" +
              " AND gp.germplasm_id = ?";

        try
        {
            connection.setQuery( query );
            connection.setQueryVariable( 1, phenotype_id );
            connection.setQueryVariable( 2, germplasm_id );

            ResultSet results = connection.getResultSet();
            if ( results.next() )
            {
                // the DB schema says these cannot be null.
                this.germplasm_id = new Long( results.getLong( "germplasm_id" ) );
                this.phenotype_id = new Long( results.getLong( "phenotype_id" ) );

                // however, reference_id is allowed to be null because of the CASE in the SQL statement.
                if( results.getObject( "reference_id" ) != null )
                {
                    this.reference_id = new Long( results.getLong( "reference_id" ) );
                }
            }
            else
            {
                throw new RecordNotFoundException();
            }
        }
        finally
        {
            connection.releaseResources();
        }
    }

    /** @return non-null germplasm id. */
    public Long get_germplasm_id() { return germplasm_id; }

    /** @return non-null phenotype id. */
    public Long get_phenotype_id() { return phenotype_id; }

    /** @return possibly null reference_id (refers to Reference.reference_id). */
    public Long get_reference_id() { return reference_id; }

    public void test()
    {
        System.out.println( "****** TfcGermplasmPhenotype content test *******" );
        System.out.println( "phenotype_id:" + get_phenotype_id() );
        System.out.println( "germplasm_id:" + get_germplasm_id() );
        System.out.println( "reference_id: " + get_reference_id() );
        System.out.println( "**** TfcGermplasmPhenotype content test end *****" );
    }

    /**
     * main function is used to for testing only
     */
    public static void main( String[] args )
    {
        try
        {

            DBconnection connection = new DBconnection();
            Long germplasm_id = new Long( 3485 );
            Long phenotype_id = new Long( 2479408 );
            TfcGermplasmPhenotype element = new TfcGermplasmPhenotype( connection, germplasm_id, phenotype_id );
            element.test();

        }
        catch ( Exception e )
        {
            e.printStackTrace();
        }
    }
}
