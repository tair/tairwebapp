//------------------------------------------------------------------------------
//Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.3 $
// $Date: 2005/05/03 21:05:24 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data.factory;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.tair.processor.microarray.data.LoadableTairObjectKeyword;
import org.tair.processor.microarray.data.LoadableBioSampleKeyword;
import org.tair.processor.microarray.data.LoadableReferenceKeyword;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcKeyword;

/**
 * KeywordFactory handles the validation of keyword literal values by looking
 * up keyword ids for a submitted value.  KeywordFactory returns results as
 * a populated LoadableTairObjectKeyword or LoadableBioSampleKeyword that
 * can be used by microarray loading programs to store associations to keywords.
 *
 * <p>
 * KeywordFactory maintains a record of all previous keywords that have been
 * looked up (successfully and unsuccessfully) during the object's lifetime.
 * This is done to skip actual database lookups whenever possible, since the
 * quantity of data processed during microarray loading can be large, and since
 * multiple elements are often associated to the same small number of keywords.
 */


public class KeywordFactory {

    // map of keywords that have already been verified in the database stored
    // as keyword String as key referencing a populated TfcKeyword object -
    // keyword is stored all upper case to allow for case insensitivity
    private Map keywords;

    // list of keywords that were searched for and not found in the database
    private List notFound;

    /**
     * Creates a new instance of KeywordFactory
     */
    public KeywordFactory() {
	keywords = new HashMap();
	notFound = new ArrayList();
    }


    /**
     * Translates submitted keyword literal value into a 
     * LoadableTairObjectKeyword object populated with all keyword data 
     * from the database.  This object can then be used to create an
     * association between a tair object and the keyword.
     *
     * @param conn An active connection to the database
     * @param keyword Keyword to look up
     * @return LoadableTairObjectKeyword populated with keyword data, 
     * <code>null</code> if keyword was not found in the database
     * @throws SQLException if a database error occurs
     */
    public LoadableTairObjectKeyword getTairObjectKeyword( DBconnection conn,
							   String keyword , String type )
	throws SQLException {

	LoadableTairObjectKeyword tairObjKeyword = null;
	List keywordObjs = lookupKeyword( conn, keyword, type );

	// create new loadable object that contains keyword data
	// along with tair object association info out of
	// base keyword object
      
	if ( keywordObjs != null &&  keywordObjs.size() == 1  ) {
	    tairObjKeyword = new LoadableTairObjectKeyword();
	    ((TfcKeyword)keywordObjs.get(0)).copyInto( tairObjKeyword);
	}


	return tairObjKeyword;
    }

    /**
     * Translates submitted keyword literal value into a 
     * LoadableBioSampleKeyword object populated with all keyword data 
     * from the database.  This object can then be used to create an
     * association between a tair object and the keyword.
     *
     * @param conn An active connection to the database
     * @param keyword Keyword to look up
     * @param type The type of the keyword
     
     * @return LoadableBioSampleKeyword populated with keyword data, 
     * <code>null</code> if keyword was not found in the database
     * @throws SQLException if a database error occurs
     */
    public LoadableBioSampleKeyword getBioSampleKeyword( DBconnection conn,
							 String keyword, List types )
	throws SQLException {

	LoadableBioSampleKeyword bioSampleKeyword = null;
         
	List keywordObjs  = new ArrayList();
      
        for (int i=0; i<  types.size(); i++){
	    String type = (String)types.get(i);  
            List tfcKeywords = lookupKeyword( conn, keyword, type );
            keywordObjs.addAll( tfcKeywords );
        }

	// create new loadable object that contains keyword data
	// along with bio sample association info out of
	// base keyword object
       
	if ( keywordObjs != null  &&  keywordObjs.size() == 1  ) {
	    bioSampleKeyword = new LoadableBioSampleKeyword();
	    ((TfcKeyword)keywordObjs.get(0)).copyInto( bioSampleKeyword );
	}
	return bioSampleKeyword;
    }

     public LoadableReferenceKeyword getReferenceKeyword( DBconnection conn,
							 String keyword, String type )
	throws SQLException {

	LoadableReferenceKeyword refKeyword = null;
	List keywordObjs  = lookupKeyword( conn, keyword, type );

	// create new loadable object that contains keyword data
	// along with reference association info out of
	// base keyword object
	if ( keywordObjs != null  &&  keywordObjs.size() == 1  ) {
	    refKeyword = new LoadableReferenceKeyword();
	    ((TfcKeyword)keywordObjs.get(0)).copyInto( refKeyword );
	}


	return refKeyword;
    }

    

    /**
     * Translates submitted keyword string into a list of TfcKeyword object.
     * If keyword has been looked up before, keyword object will be
     * returned by keywords cache, otherwise a database lookup will
     * be executed. 
     *
     * <p>
     * After lookup, submitted keyword will be saved for future
     * reference in either found keywords map or not found list.
     *
     * @param conn An active connection to the database
     * @param keyword Keyword to look up
     * @return TfcKeyword instance representing all data on submitted
     * keyword, or <code>null</code> if keyword was not found in the
     * database
     * @throws SQLException if a database error occurs
     */
    private List lookupKeyword( DBconnection conn, String keyword , String type) 
	throws SQLException {

	ArrayList tfcKeywords =  new ArrayList();
	// uppercase input term 
	String keywordLookUpKey = keyword.toUpperCase() + "|"+ type ;
      
	if ( keywords.containsKey(keywordLookUpKey  ) ) {
	    tfcKeywords = (ArrayList) (keywords.get( keywordLookUpKey )) ; 
	} else if (notFound.contains( keywordLookUpKey ) ) {
            // do nothing: we know the keywordObject doesn't exist in the database
	} else {
      	    List  keywordIDs= TfcKeyword.retrieveKeywordID( conn, 
							    keyword,
							    type );
	   
	    if ( keywordIDs != null && keywordIDs.size() > 0 ) {

                for ( int i =0; i< keywordIDs.size(); i++ ){
                    Long keywordID =(Long)( keywordIDs.get(i) );
           
                    tfcKeywords.add( new TfcKeyword( conn, keywordID ) );
                }
	   	// save keyword in all upper case for use next time 
		// it's requested
		keywords.put( keywordLookUpKey, tfcKeywords );
                // if keyword not found, save in not found list
		// to save time looking again later
	    } else {
           	notFound.add( keywordLookUpKey );
	    }
	}

	return tfcKeywords;
    }

}
