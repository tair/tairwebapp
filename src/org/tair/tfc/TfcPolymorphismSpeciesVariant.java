package org.tair.tfc;

import org.tair.utilities.*;
import java.sql.*;

/**
 * This class maps to the PolymorphismSpeciesVariant table in the tair 
 * database. Each instance maps one row of data in PolymorphismSpeciesVariant 
 * table. Each data object maps to one field of a row in the table. Each 
 * field has one set method and one get method for accessing from outside of 
 * class.
 * 
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */


public class TfcPolymorphismSpeciesVariant {   

    private Long species_variant_id;
    private Long polymorphism_id;
    private Boolean is_sequenced;
    private Boolean is_verified;
    private String verification_method;
    private Long tair_object_id;
    
    /**
     * Creates an empty instance of TfcPolymorphismSpeciesVariant
     */
    public TfcPolymorphismSpeciesVariant() { }

    /**
     * Creates an instance of TfcPolymorphismSpeciesVariant that reflects the join
     * between submitted polymorphism_id and species_variant_id
     *
     * @param conn An active connection to the database
     * @param polymorphism_id Polymorphism id to retrieve data for
     * @param species_variant_id Species variant id to retrieve data for
     * @throws SQLException in the case of an invalid operation or database error
     */
    public TfcPolymorphismSpeciesVariant( DBconnection conn, 
                                          Long polymorphism_id, 
                                          Long species_variant_id ) throws SQLException {
        boolean found = false;
        String query =
            "SELECT p.polymorphism_id, "+
            "p.species_variant_id, "+
            "p.is_sequenced, " +
            "p.is_verified, " +
            "p.verification_method, " +
            //adding for attribution from Polymorphism_SpeciesVariant
            "p.tair_object_id, " +
            "a.community_id,a2.community_id " +
            "FROM Polymorphism_SpeciesVariant p" +
            " LEFT OUTER JOIN Attribution a ON a.tair_object_id=p.tair_object_id, " +
            " Polymorphism poly LEFT OUTER JOIN Attribution a2 ON a2.tair_object_id=poly.tair_object_id " +
            "WHERE poly.polymorphism_id = p.polymorphism_id and p.polymorphism_id = " + polymorphism_id.toString() + " " +
            "AND p.species_variant_id = " + species_variant_id.toString();

        conn.setQuery( query );
        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            found = true;
            long id = results.getLong( "polymorphism_id" );
            if ( !results.wasNull() ) {
                this.polymorphism_id = new Long( id );
            }
            
            id = results.getLong( "species_variant_id" );
            if ( !results.wasNull() ) {
                this.species_variant_id = new Long( id );
            }
            verification_method  = results.getString( "verification_method" );
            is_verified = TextConverter.stringToBoolean( results.getString( "is_verified" ) );
            is_sequenced = TextConverter.stringToBoolean( results.getString( "is_sequenced" ) );
            tair_object_id = results.getLong( "tair_object_id" );
        }
        conn.releaseResources();

        if ( !found ) {
            throw new RecordNotFoundException( "No join found between polymorphism id: " + polymorphism_id +
                                               " and species variant id: " + species_variant_id );
        }
    }
  	
    public void set_species_variant_id ( Long value ) { 
        species_variant_id = value; 
    }

    public Long get_species_variant_id() { 
        return species_variant_id; 
    }
    
    public void set_polymorphism_id ( Long value ) {
        polymorphism_id = value; 
    }

    public Long get_polymorphism_id() { 
        return polymorphism_id; 
    }
    
    public void set_is_verified ( Boolean value ) { 
        is_verified = value; 
    }

    public Boolean get_is_verified() { 
        return is_verified; 
    }
    
    public void set_verification_method ( String value ) { 
        verification_method = value; 
    }

    public String get_verification_method() { 
        return verification_method; 
    }
    
    public void set_is_sequenced ( Boolean value ) { 
        is_sequenced = value; 
    }

    public Boolean get_is_sequenced() { 
        return is_sequenced; 
    }
    
    //added for the attribution of Polymorphism_SpeciesVariant
	public Long getTairObjectID() {
		return tair_object_id;
	}

	public void setTairObjectID(Long poly2species_toid) {
		this.tair_object_id = poly2species_toid;
	}

    
    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** TfcPolymorphismSpeciesVariant content test ******" );
        System.out.println( "species_variant_id: " + this.get_species_variant_id() );
        System.out.println( "polymorphism_id: " + this.get_polymorphism_id() );
        System.out.println( "is_verified: " + get_is_verified() );
        System.out.println( "verification_method: " + get_verification_method() );
        System.out.println( "is_sequenced: " + get_is_sequenced() );
        System.out.println( "tair_object_id: " + getTairObjectID() );
        System.out.println( "**** TfcPolymorphismSpeciesVariant content test end ****" );

    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
    
        try{
            DBconnection connection = new DBconnection();
            Long poly_id = new Long( 467 );
            Long specVar_id = new Long( 321 );
            TfcPolymorphismSpeciesVariant species_poly_state = new TfcPolymorphismSpeciesVariant( connection, poly_id, specVar_id );
            species_poly_state.test();
        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }


}
