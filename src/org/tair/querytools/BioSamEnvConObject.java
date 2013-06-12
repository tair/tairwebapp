//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.8 $
// $Date: 2004/11/18 20:31:04 $
//------------------------------------------------------------------------------
package org.tair.querytools;

import java.sql.SQLException;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcEnvironmentalCondition;
import org.tair.tfc.TfcBioSampleEnvCond;

import org.tair.utilities.InvalidActionException;
import org.tair.utilities.TextConverter;

/**
 * BioSamEnvConObject extends TfcEnvironmental condition to show environmental
 * condition data along with its join specific data to a given bio sample entry
 */

public class BioSamEnvConObject extends TfcEnvironmentalCondition {

    // join table info
    private TfcBioSampleEnvCond bioSampleEnvCond;

    /**
     * Creates an empty instance of BioSamEnvConObject
     */         
    public BioSamEnvConObject() { 
        super();
        bioSampleEnvCond = new TfcBioSampleEnvCond();
    }


    /**
     * Creates an instance of BioSamEnvConObject to reflect data
     * referenced by submitted bio_sample_id and environmental_condition_id.
     *
     * @param conn An active connection to the database
     * @param bio_sample_id part of composite key of BioSample_EnvCond to 
     * retrieve data for
     * @param environmental_condition_id part of composite key of 
     * BioSample_EnvCond to retrieve data for
     * @throws SQLException if a database error occurs
     */      
    public BioSamEnvConObject( DBconnection conn, 
			       Long bio_sample_id, 
			       Long environmental_condition_id ) 
	throws SQLException {

        super( conn, environmental_condition_id );
	
        bioSampleEnvCond = 
	    new TfcBioSampleEnvCond( conn, 
				     bio_sample_id, 
				     environmental_condition_id );
    }

    
    /**
     * Overrides superclass method to ensure that both super class
     * member variable and object for associating bio sample to
     * environmental condition are set with submitted id
     *
     * @param id Environmental condition id to set
     */
    public void set_environmental_condition_id( Long id ) {
	super.set_environmental_condition_id( id );

	// join object may be null if this method is called in 
	// super class constructor, so check; not a problem if
	// null, will be initialized later, just head off
	// NullPointer
	if ( bioSampleEnvCond != null ) {
	    bioSampleEnvCond.set_environmental_condition_id( id );
	}
    }


    //
    // TfcBioSampleEnvCond wrappers
    //
    public void set_bio_sample_id( Long id ) {
	bioSampleEnvCond.set_bio_sample_id( id );
    }

    public Long get_bio_sample_id() {
	return bioSampleEnvCond.get_bio_sample_id(); 
    }

    public void set_order_number( Integer order ) {
	bioSampleEnvCond.set_order_number( order );
    }

    public Integer get_order_number() { 
	return bioSampleEnvCond.get_order_number(); 
    }

    public void set_is_experimental_variable( Boolean is_variable ) {
	bioSampleEnvCond.set_is_experimental_variable( is_variable );
    }

    public Boolean get_is_experimental_variable() { 
	return bioSampleEnvCond.get_is_experimental_variable(); 
    }


    /**
     * Determines if this object has condition value 
     * This is useful at the JSP level 
     *
     * @return <code>true</code> if this object's condition_value is not empty
     * <code>false</code> if it is
     */
    public boolean hasConditionValue() {
        return  !TextConverter.isEmpty( get_condition_value() );
    }

    /**
     * Determines if this object has condition duration 
     * This is useful at the JSP level 
     *
     * @return <code>true</code> if this object's condition_duration is not empty
     * <code>false</code> if it is
     */
    public boolean hasConditionDuration() {
        return  !TextConverter.isEmpty( get_condition_duration() );
    }
    
    /**
     * Stores data on both environmental condition as well as its association
     * to bio sample to the database.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if any data required for insert/update
     * is missing
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
    	throws InvalidActionException, SQLException {
    
	super.store( conn );
	bioSampleEnvCond.store( conn );
    }
    /**
     * Deletes data for both environmental condition as well as its association
     * to bio sample from the database.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    public void  delete ( DBconnection conn )	throws SQLException {
 	bioSampleEnvCond.delete( conn );
        // delete this env cond only if it doesn't associated to other biosample
        if ( ! TfcBioSampleEnvCond.hasBioSamples ( conn, get_environmental_condition_id() )){        
	    super.delete(conn);
        }
    }
   

    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** BioSamEnvConObject content test ******" );
        super.test();
        if ( bioSampleEnvCond != null ) {
            bioSampleEnvCond.test();
        }
        System.out.println( "**** BioSamEnvConObject content test end ****" );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try {

            DBconnection conn = new DBconnection();
            Long bioSampleID = new Long( 2 );
            Long envCondID = new Long( 5 );
            BioSamEnvConObject bseco = 
		new BioSamEnvConObject( conn, bioSampleID, envCondID );
            bseco.test();

        } catch( Exception e ) {
            e.printStackTrace();
        }
    }

}
  
