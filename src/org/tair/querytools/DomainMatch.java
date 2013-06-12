//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.6 $
// $Date: 2004/09/02 22:10:34 $
//------------------------------------------------------------------------------ 
package org.tair.querytools;

import java.sql.SQLException;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcDomainMatch;
import org.tair.tfc.TfcInterpro;
import org.tair.tfc.TfcProteinDomain;
import org.tair.tfc.TfcStructuralClassType;

/**
 * DomainMatch is a composite class to show collected information
 * for a given protein domain match.  DomainMatchComposite collects data
 * from the domain match joins in reverse, meaning it contains the domain
 * match info., then the associated protein domain info. for the match, 
 * then the associated interpro data for protein domain
 *
 * <p>
 * DomainMatch also contains structural class data for associated protein
 * domain.
 */

public class DomainMatch extends TfcDomainMatch {

    private TfcProteinDomain proteinDomain;
    private TfcInterpro interpro;

    // structural class type info for protein domain
    private TfcStructuralClassType structuralClassType;


  
    /**
     * Creates an empty instance of DomainMatch
     */
    public DomainMatch() {  
        super();
        this.proteinDomain = new TfcProteinDomain();
        this.interpro = new TfcInterpro();
	this.structuralClassType = new TfcStructuralClassType();
    }


    /**
     * Creates an instance of DomainMatch to reflect the information
     * represented by submitted evidence id
     *
     * @param conn An active connection to the database
     * @param evidence_id Domain match id to retrieve data for
     * @throws SQLException thrown if a database error occurs
     */
    public DomainMatch( DBconnection conn, Long evidence_id ) 
	throws SQLException {

        super( conn, evidence_id );
        this.proteinDomain = 
	    new TfcProteinDomain( conn, get_protein_domain_id() );

        this.interpro = 
	    new TfcInterpro( conn, proteinDomain.get_interpro_id() );

	String structuralClassID = 
	    proteinDomain.get_structural_class_type_id();

        if ( structuralClassID != null ) {
            this.structuralClassType = 
		new TfcStructuralClassType( conn, structuralClassID );
        }

    }

    //
    // TfcProteinDomain wrappers
    //

    public void set_domain_accession( String accession ) { 
	proteinDomain.set_accession( accession );
    }

    public void set_domain_name( String name ) { 
	proteinDomain.set_name( name );
    }

    public void set_domain_type( String type ) { 
	proteinDomain.set_type( type ); 
    }

    public void set_domain_date_last_modified( java.util.Date dateModified ) {
	proteinDomain.set_date_last_modified( dateModified );
    }

    public String get_domain_accession() { 
	return proteinDomain.get_accession();
    }

    public String get_domain_name() { 
	return proteinDomain.get_name(); 
    }

    public String get_domain_type() {
	return proteinDomain.get_type(); 
    }

    public java.util.Date get_domain_date_last_modified() { 
	return proteinDomain.get_date_last_modified(); 
    }


    //
    // TfcInterpro wrappers
    //

    public void set_interpro_description( String description ) {
	interpro.set_description( description );
    }

    public void set_interpro_accession( String accession ) {
	interpro.set_accession( accession );
    }

    public void set_interpro_parent_id( Integer id ) {
	interpro.set_parent_id( id );
    }

    public void set_interpro_name( String name ) { 
	interpro.set_name( name ); 
    }

    public Long get_interpro_id() {
	return interpro.get_interpro_id();
    }

    public String get_interpro_description() { 
	return interpro.get_description(); 
    }

    public String get_interpro_accession() { 
	return interpro.get_accession(); 
    }

    public Integer get_interpro_parent_id() {
	return interpro.get_parent_id();
    }

    public String get_interpro_name() { 
	return interpro.get_name(); 
    }

    /**
     * Overloads method in superclass to keep protein domain id 
     * for domain match & protein domain in synch.
     *
     * @param id Protein domain id to set
     */
    public void set_protein_domain_id ( Long id ) { 
        super.set_protein_domain_id( id );
        proteinDomain.set_protein_domain_id( id ); 
    }

    /**
     * Sets interpro id for both protein domain record and interpro
     * record
     *
     * @param id Interpro id to set
     */
    public void set_interpro_id ( Long id ) { 
        interpro.set_interpro_id( id );
        proteinDomain.set_interpro_id( id ); 
    }


    //
    // TfcStructuralClassType wrappers
    //

    /**
     * Sets structural class type id for protein domain record
     * 
     * @param id Structural class type id to set
     */
   
    public void set_structural_class_type_id( String id ) { 
        proteinDomain.set_structural_class_type_id( id ); 
        structuralClassType.set_structural_class_type_id( id );
    }

    public String get_structural_class_type_description() {
        return ( structuralClassType != null ) ?
	    structuralClassType.get_description() : null;
    }

    public void set_structural_class_type_description( String description ) {
        if ( structuralClassType == null ) {
            structuralClassType = new TfcStructuralClassType();
        }
        structuralClassType.set_description( description );
    }



    /**
     * For unit testing only
     */
    public void test() {
        super.test();
        if ( proteinDomain != null ) {
            proteinDomain.test();
        }

        if ( interpro != null ) {
            interpro.test();
        }

	if ( structuralClassType != null ) {
	    structuralClassType.test();
	}

    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

        try {

            DBconnection conn = new DBconnection();
            Long id = new Long( 500309947 );
            DomainMatch match = new DomainMatch( conn, id );
            match.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }

    }


}
