package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;
import java.util.*;


/**
 * This class map to the table Phenotype in the tair database. Each instance
 * maps one row of data in Phenotype table. Each data object maps to one field
 * of a row in the table. Each field has one set method and one get method for
 * accessing from outside of class.
 * @author tair (Chris Wilks, Jon Slenk)
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/
public class TfcPhenotype
{
    private Long phenotype_id;
    private String phenotype;

    /**
     * Creates an empty instance of TfcPhenotype, of very
     * questionable usefulness.
     */
    public TfcPhenotype() {}

    /**
     * TfcPhenotype constructor initializes each field according to the value
     * of the object id in the database.  The DBconnection instance is
     * required for database access.  If no row is found corresponding to this
     * object, the instance of TfcPhenotype is null
     * @param connection the instance of DBconnection
     * @param phenotype_id the object id of a row in the Phenotype table
     * @throws SQLException in the case of an invalid operation or database error
     */
    public TfcPhenotype( DBconnection connection, Long phenotype_id )
        throws SQLException
    {
        String query =
            "SELECT phenotype_id, phenotype" +
            " FROM Phenotype" +
            " WHERE phenotype_id = ?";

        try
        {
            connection.setQuery( query );
            connection.setQueryVariable( 1, phenotype_id );

            ResultSet results = connection.getResultSet();
            if( results.next() )
            {
                // the DB schema says these are non-null.
                this.phenotype_id = new Long( results.getLong( "phenotype_id" ) );
                this.phenotype = results.getString( "phenotype" );
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

    /** @return non-null id. */
    public Long get_phenotype_id() { return phenotype_id; }

    /** @return non-null (but possibly empty) phenotype. */
    public String get_phenotype() { return phenotype;  }

    public void test()
    {
        System.out.println( "****** TfcPhenotype content test ******" );
        System.out.println( "phenotype_id: " + get_phenotype_id() );
        System.out.println( "phenotype: " + get_phenotype() );
        System.out.println( "**** TfcPhenotype content test end ****" );
    }

    /**
     * main function is used to for testing only
     */
    public static void main( String[] args )
    {
        try
        {
            DBconnection connection = new DBconnection();
            Long test_id = new Long( 2 );
            TfcPhenotype ad = new TfcPhenotype( connection, test_id );
            ad.test();
            System.out.println( "test completed " );
        }
        catch ( Exception e )
        {
            e.printStackTrace();
        }
    }
}
