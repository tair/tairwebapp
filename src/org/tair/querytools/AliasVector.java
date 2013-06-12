//-----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
//-----------------------------------------------------------------------

package org.tair.querytools;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import org.jboss.logging.Logger;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAlias;

/** 
 * AliasVector is an extended version of <code>Vector</code> that stores
 * all aliases for a TairObject as a collection of <code>TfcAlias</code>
 * objects. Each TfcAlias object maps to one row in the Alias table.
 *
 * <p>
 * Implements Serializable so object data can be written to file for
 * stock catalog data files
 */

public class AliasVector extends Vector {
  private static final Logger logger = Logger.getLogger(AliasVector.class);

    /**
     * Creates an empty version of AliasVector for population externally.
     */
    public AliasVector()  {
        super();
    }


    /**
     * Creates an instance of AliasVector populated with <code>TfcAlias</code>
     * objects that are associated to the supplied tair object id. Aliases are 
     * retrieved using the get_information() method.
     *
     * @param conn An active connnection to the database
     * @param tair_object_id Tair object id to retrieve aliases for
     * @throws SQLException in the case of an invalid operation or database error
     */   
    public AliasVector( DBconnection conn, Long tair_object_id ) throws SQLException {
        if ( tair_object_id != null ) {
            get_information( conn, tair_object_id );
        }
    }


    /**
     * Retrieves aliases for supplied tair object id and populates vector
     * 
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id to retrieve aliases for
     * @throws SQLException in the case of an invalid operation or database error
     */
    private void get_information( DBconnection conn, Long tair_object_id ) throws SQLException {
        ArrayList ids = null;
        String query = null;

        if ( tair_object_id != null ) {
            query = 
                "SELECT alias_id "+
                "FROM Alias "+
                "WHERE tair_object_id = " + tair_object_id.toString();
            try {
              conn.setQuery( query );

              ResultSet results = conn.getResultSet();
              while ( results.next() ) {
                  if ( ids == null ) {
                      ids = new ArrayList();
                  }
                  ids.add( new Long( results.getLong( "alias_id" ) ) );
              }
            } finally {
              conn.releaseResources();
            }
            
            if ( ids != null && !ids.isEmpty() ) {
                createAliasObjects( conn, ids );
            }
        }
    }


    /**
     * Utility method to create TfcAlias objects for each alias id in List
     * and add them to inner collection
     */
    private void createAliasObjects( DBconnection conn, List ids ) throws SQLException {
        Iterator iter = ids.iterator();

        while ( iter.hasNext() ) {
            add( new TfcAlias( conn, (Long) iter.next() ) );
        }
    }

    

    /**
     * Returns all aliases for this TairObject as a delimited string
     * of aliases with semicolon (";") as a delimiter
     *
     * @return String containing all aliases for this TairObject, or
     * <code>null</code> if no aliases exists for this object
     */
    public String get_alias_string() {
        Iterator iter = iterator();
        StringBuffer aliasBuffer = null;
        String aliasString = null;

        if ( iter != null ) {
            boolean first = true;
            while ( iter.hasNext() ) {
                if ( aliasBuffer == null ) {
                    aliasBuffer = new StringBuffer();
                }
                TfcAlias alias = (TfcAlias) iter.next();
                if ( alias.get_original_alias() != null ) {
                    if ( !first ) {
                        aliasBuffer.append( "; " );
                    }
                    aliasBuffer.append( alias.get_original_alias() );
                }
                first = false;
            }
            if ( aliasBuffer != null ) {
                aliasString = aliasBuffer.toString();
            }
        }
        return aliasString;
    }


    /**
     * For unit testing only
     */
    public void test() {
        logger.debug( "****** test AliasVector content ******" );
        int length = this.size();
        TfcAlias object = null;

        for( int i=0; i< length; i++ ) {
            object = (TfcAlias) this.elementAt( i );
            object.test();
        }

        logger.debug( "alias string: " + get_alias_string() );
        logger.debug( "**** test AliasVector content end ****" );     
    }



    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        
        try {
            DBconnection conn = new DBconnection();
            Long test_id = new Long( 1946936 );
            AliasVector alias_vector = new AliasVector( conn, test_id );
            alias_vector.test();

        } catch( Exception e ) {
            e.printStackTrace();
        }
    }

}




