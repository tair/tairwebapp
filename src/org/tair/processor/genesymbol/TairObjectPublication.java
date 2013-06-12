//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.8 $
// $Date: 2004/07/06 16:30:44 $
//------------------------------------------------------------------------------
package org.tair.processor.genesymbol;

import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

/** 
 * TairObjectPublication is a composite class that stores TairObjectRef and its 
 * corresponding publication information.
 */

public class TairObjectPublication extends TfcPublication {

    private TfcTairObjRef tairObjectRef;
   
    /**
     * Creates an empty instance of TairObjectPublication
     */
    public TairObjectPublication ( ) {  
	tairObjectRef = new TfcTairObjRef();
    }
  
    /**
     * Creates an instance of TairObjectPublication that contains only
     * publication data for submitted reference id.  This is most often
     * used when creating publications to be associated to a tair object.
     * Tair object id for association must be set externally before storing
     * object to the database
     *
     * @param conn An active connection to the database
     * @param reference_id Reference id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public TairObjectPublication( DBconnection conn, Long reference_id )
	throws SQLException  {  

	super( conn, reference_id );

	tairObjectRef = new TfcTairObjRef();
	tairObjectRef.set_reference_id( reference_id );
    }
  
    /**
     * Creates an instance of TairObjectPublication that contains publication
     * info. along with join specific data for publication's association to
     * a tair object
     * 
     * @param conn An active connection to the database
     * @param reference id Reference id of publication to retrieve data for
     * @param tair_obj_ref_id ID for unique join between publication and tair
     * object
     * @throws SQLException if a database error occurs
     */
    public TairObjectPublication( DBconnection conn,
				  Long reference_id, 
				  Long tair_obj_ref_id )  
	throws SQLException{
	
        super ( conn, reference_id );
	tairObjectRef = new  TfcTairObjRef( conn, tair_obj_ref_id );
    }


    //
    // TfcTairObjRef wrappers
    //
    public void set_tair_object_id( Long id ) { 
	tairObjectRef.set_tair_object_id( id ); 
    }
 
    public Long get_tair_object_id( ) { 
	return tairObjectRef.get_tair_object_id( ); 
    }

    public Long get_tairobj_ref_id() {
	return tairObjectRef.get_tairobj_ref_id();
    }


    /**
     * Stores association between tair object and publication to the database.
     * NOTE: publication data itself is not altered in this operation.
     *
     * @param conn A db connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     * @throws InvalidActionException if required data has not been set for
     * tair object/publication association
     */
    public void store( DBconnection conn ) 
	throws SQLException, InvalidActionException {

	tairObjectRef.store(conn) ;
    }
  

    /**
     * Deletes association between tair object and publication in the 
     * database. NOTE: publication data itself is not altered in this
     * operation
     * @param conn A db connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    public void delete( DBconnection conn ) throws SQLException {
	tairObjectRef.delete( conn );
    }
     

    public boolean equals( Object publication){
       
        TairObjectPublication pub = (TairObjectPublication)publication;
        return TairObjectEquals( pub) &&  publicationEquals (pub);
    }     
     
    private boolean TairObjectEquals ( TairObjectPublication pub ){
        if (this.get_tair_object_id()== null && pub.get_tair_object_id()== null){
	    return true;
        }else if (this.get_tair_object_id()!=null && pub.get_tair_object_id()!=null ){
            return this.get_tair_object_id().equals(pub.get_tair_object_id());
        }else {
            return false;
        }
    } 

    private boolean publicationEquals ( TairObjectPublication pub ){
        if (this.get_publication_id()== null && pub.get_publication_id()== null){
	    return true;
        }else if (this.get_publication_id()!=null && pub.get_publication_id()!=null ){
            return this.get_publication_id().equals(pub.get_publication_id());
        }else {
            return false;
        }
    } 


    /**
     * For unit testing only
     */
    public void test() {
	super.test();
	tairObjectRef.test();
    }

}
