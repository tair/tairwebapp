/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import org.tair.tfc.*;

/**
 * PolymorphismSpeciesVariant extends TfcSpeciesVariant to represent data 
 * for a species variant in terms of its relationship to a polymorphism.  
 * PolymorphismSpeciesVariant contains association-specific information 
 * in an instance of <code>TfcPolymorphismSpeciesVariant</code>
 */

public class PolymorphismSpeciesVariant extends TfcSpeciesVariant {

    private TfcPolymorphismSpeciesVariant polySpecVariant;

    /**
     * Creates an empty instance of PolymorphismSpeciesVariant
     */
    public PolymorphismSpeciesVariant() { 
        super();
        polySpecVariant = new TfcPolymorphismSpeciesVariant();
    }
  

    /**
     * Creates an empty instance of PolymorphismSpeciesVariant that reflects species
     * variant data for submitted species_variant_id and its association to polymorphism_id
     *
     * @param conn An active connection to the database
     * @param polymorphism_id Polymorphism id to retrieve data for
     * @param species_variant_id Species variant id to retrieve data for
     */
    public PolymorphismSpeciesVariant( DBconnection conn, 
                                       Long polymorphism_id, 
                                       Long species_variant_id) throws SQLException 
    {
        super( conn, species_variant_id );
        polySpecVariant = new TfcPolymorphismSpeciesVariant( conn, polymorphism_id, species_variant_id );
    }


    // TfcPolymorphismSpeciesVariant wrappers

    /**
     * Overloads set_species_variant_id from superclass to keep value
     * of species variant in synch. between TfcPolymorphismSpeciesVariant
     * and TfcSpeciesVariant classes
     * 
     * @param id Species variant id to set
     */
    public void set_species_variant_id ( Long id ) { 
        super.set_species_variant_id( id );
        if ( polySpecVariant != null ) {
            polySpecVariant.set_species_variant_id( id );
        }
    }

    public void set_polymorphism_id ( Long id ) {
        polySpecVariant.set_polymorphism_id( id );
    }

    public Long get_polymorphism_id() { 
        return polySpecVariant.get_polymorphism_id(); 
    }
    
    public void set_is_verified ( Boolean is_verified ) { 
        polySpecVariant.set_is_verified( is_verified );
    }

    public Boolean get_is_verified() { 
        return polySpecVariant.get_is_verified(); 
    }
    
    public void set_verification_method ( String method ) { 
        polySpecVariant.set_verification_method( method ); 
    }

    public String get_verification_method() { 
        return polySpecVariant.get_verification_method(); 
    }
    
    public void set_is_sequenced ( Boolean is_sequenced ) { 
        polySpecVariant.set_is_sequenced( is_sequenced ); 
    }

    public Boolean get_is_sequenced() { 
        return polySpecVariant.get_is_sequenced(); 
    }
    
    //added for the attribution of Polymorphism_SpeciesVariant
	public Long getTairObjectID() {
		return polySpecVariant.getTairObjectID();
	}

	public void setTairObjectID(Long poly2species_toid) {
		this.polySpecVariant.setTairObjectID(poly2species_toid);
	}

    
    /**
     * For unit testing only
     */
    public void test() {
        super.test();

        if ( polySpecVariant != null ) {
            polySpecVariant.test();
        }
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try {
            DBconnection conn = new DBconnection();
            Long polyID = new Long( 500227708 );
            Long specVarID = new Long( 217 );
            PolymorphismSpeciesVariant poly = new PolymorphismSpeciesVariant( conn, polyID, specVarID );
            poly.test();
        } catch ( Exception e ) {
            e.printStackTrace();
        }
   
    }


}
