//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.2 $
// $Date: 2005/09/14 16:22:20 $
//------------------------------------------------------------------------------

package org.tair.community;

import java.io.Serializable;
import java.util.*;

/**
 * The community pages make use of a number of different parameters to navigate 
 * between pages & maintain correct status.  In addition to signalling which page
 * should be shown next, several of these parameters are used at a display level
 * to make sure that proper elements are shown at the correct time (i.e., show 
 * buttons correctly etc. ).
 * 
 * <p>
 * CommunityState acts as a container for all of these different state parameters. 
 * An instance of CommunityState is held in user's session throughout any multi-page
 * community maintenance action. Maintaining these values in a session object 
 * allows us to avoid passing parameters from page to page, which is difficult
 * to maintain.
 *
 * <p>
 * CommunityState parameters are read in a number of different contexts, often
 * at the JSP level.  CommunityState parameters are set primarily in the EditHandler
 * object, which instantiates BsCommunity objects before editing, and 
 * AffiliateHandler which may update the "type" parameter, however there are 
 * isolated JSPs where community state parameters are set directly. 
 *
 * <p>
 * CommunityState stores objects with a <code>String</code> key. CommunityState
 * technically can store any type of Object, however most values are simple 
 * String values; many are even just the String "true" which denotes a boolean 
 * true value - this is done since all HttpServletRequest parameters are received
 * as String.
 *
 * <p>
 * The commonly used State parameters are:
 *
 * <ul>    
 * <li>type - must be "person" or "organization" - flags what kind of community 
 * is being edited</li>
 *   
 * <li>new_person - flags whether a new person record is being created
 *
 * <li>new_org - flags whether a new organization record is being created
 * 
 * <li>first_person - flags whether new person registration is going through sequence
 *  of registration pages for the first time.  This value is used to redirect user
 *  force new registrations through certain actions, such as choosing lab affiliations</li>
 *
 * <li>first_org - flags whether new organization registration is going through sequence
 *  of registration pages for the first time.  This value is used to redirect user
 *  force new registrations through certain actions, such as choosing lab members</li>
 *
 * <li>phantom - set to "true" if a new person creates a new lab/organization as part of 
 *  their registration.</li>
 *    
 * <li>lab - used to differentiate lab registration from other organizations.  If "true", user
 *  will see lab-specific registration forms & language, if null or "false", user will see
 *  material for all other organizations
 *
 * <li>solo - if "true", the organization profile was added on its own, not as part of a 
 *   person's registration</li>
 *
 * </ul>
 */

public class CommunityState implements Serializable{

    private Map stateFlags;

    /**
     * Creates a new instance of CommunityState();
     */
    public CommunityState() {
        this.stateFlags = new HashMap();
    }

    /**
     * Retrieves state value for submitted key as an 
     * <code>Object</code>
     *
     * @param key State parameter name to retrieve value for
     * @return Value referenced by key 
     */
    public Object getStateValue( String key ) {
        return stateFlags.get( key );
    }

    /**
     * Stores submitted key value pair
     *
     * @param key State parameter name to store value as
     * @param value Value for state parameter 
     */
    public void setStateValue( String key, Object value ) {
        stateFlags.put( key, value );
    }

    /**
     * Convenience function to retrieve the stored value
     * for submitted key as a simple boolean value.  Since
     * many state params are flags stored as String value
     * of <code>true</code>, this method can be used to 
     * easily translate that value.  Requested value
     * must be a String, or a ClassCastException will occur.
     *
     * @param key State parameter to get boolean value for
     * @return <code>true</code> if value referenced by key
     * is equal to the String "true", <code>false</code> if value
     * is not equal to "true".
     */
    public boolean getBooleanValue( String key ) {
        String value = (String) stateFlags.get( key );
        return ( value != null && value.equals( "true" ) );
    }

    /**
     * Utility method to translate the submitted String value
     * into a simple boolean value.  This is helpful for parsing
     * flags submitted as servlet request parameters (which always
     * come in as String).
     *
     * @param value Value to translate to a boolean value
     * @return <code>true</code> if submitted value is equal to the 
     * String "true", <code>false</code> if value is not equal to "true".
     */
    public static boolean translateBooleanValue( String value ) {
        return ( value != null && value.equals( "true" ) );
    }

    /**
     * Convenience method to retrieve value referenced
     * by submitted key as a String. If state value for 
     * key is not stored as a String, ClassCastException will
     * be thrown
     *
     * @param key State parameter name to get String value for
     * @return Value referenced by key as a String
     */
    public String getStringValue( String key ) {
        return (String) stateFlags.get( key );
    }

    /**
     * Removes state entry for submitted key
     *
     * @param key State parameter name to remove
     */
    public void removeStateValue( String key ) {
        stateFlags.remove( key );
    }
    
}

