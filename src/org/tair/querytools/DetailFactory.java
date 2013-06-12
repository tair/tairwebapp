//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.22 $
// $Date: 2004/05/03 19:07:48 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.tair.tfc.DBconnection;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.ObjectInfoCollection;
import org.tair.utilities.RecordNotFoundException;


/**
 * DetailFactory creates <code>Detail</code> objects for displaying information 
 * for a variety of types of objects found in the TAIR database. DetailFactory 
 * stores individual class names of classes that implement the Detail interface 
 * in a Map referenced by a <code>String</code> key.  This key can then be used 
 * by client code to have DetailFactory dynamically create the appropriate 
 * Detail object. Using DetailFactory to create these objects simplifies client
 * code by allowing objects to be created generically, without cumbersome 
 * if/else logic.
 *
 * <p>
 * DetailFactory also contains a collection of JSP URLs used for displaying
 * Detail objects.  Each URL is stored as a <code>String</code> referenced by 
 * the same <code>String</code> key used for object creation.  Client code can
 * then retrieve the appropriate URL to redirect to for displaying the object 
 * by calling the getDetailPage( String ) method.
 * 
 * <p>
 * Both the collections of Detail class names and associated JSPs are loaded 
 * from ObjectInfoCollection, which reads in the data from the detail config 
 * file. This is to avoid having to constantly recompile DetailFactory for each
 * different environment it is deployed, where the list of active detail objects
 * differs (test & production have different lists, for example, due to objects
 * that are not yet complete & in production).
 *
 * <p>
 * DetailFactory is used exclusively by TairServlet for the creation of objects
 * to use for  displaying data on the various detail pages of the TAIR site.
 */

public class DetailFactory {
    private Map classes;
    private Map pages;
    static private DetailCache cache = new DetailCache();
    static private List<String> cached_types = Arrays.asList("gene");

    /**
     * Creates an instance of DetailFactory and populates the internal 
     * collection of Detail objects that can be generically created using each
     * class's referenced <code>String</code> key. Also populates the internal 
     * collection of JSP URLs used to display Detail objects which can be 
     * retrieved through keys used for object creation.  Both of these 
     * collections are populated through ObjectInfoCollection, which reads in
     * the data from the detail config file (should be at 
     * $HOME/conf/detail.conf)
     * 
     * @see ObjectInfoCollection
     */
    public DetailFactory() throws IOException {
	ObjectInfoCollection info = new ObjectInfoCollection();
	info.loadDetailFile();
	classes = info.getDetailClasses();
	pages = info.getDetailPages();
    }

	public static DetailCache getCache(){
		return cache;
	}

    /**
     * Determines if submitted type is contained by DetailFactory's list of
     * object types and corresponding class names
     *
     * @return <code>true</code> if DetailFactory contains a class name for 
     * the requested type or <code>false</code> if no entry for submitted 
     * type exists.
     */
    public boolean containsType( String type ) {
	return ( classes.containsKey( type ) );
    }
  

	private Detail cache_fetch_type(String type, Long id)
	{
		if(type == null || id == null || !cached_types.contains(type))
			return null;
		return (Detail)cache.get(type+id.toString());
	}

	private void cache_put_type(String type, Long id, Detail object)
	{
		if(type == null || id == null || !cached_types.contains(type))
			return;
		cache.put(type+id.toString(), object);
	}

    /**
     * Creates a <code>Detail</code> object using the class name referenced by
     * type.  Detail objects are created using the default (no parameter) 
     * constructor and, in this method, are populated using the get_information()
     * method that takes a numeric id as a parameter.
     *
     * @param conn An active connection to the database
     * @param type Type of Detail object requested
     * @param id Primary key/id to use for populating object
     * @return Detail object of concrete type referenced by type, and containing 
     * data referenced  by id
     * @throws InvalidParameterException thrown if any object creation 
     * errors occur such as <code>ClassNotFoundException</code>, 
     * <code>InstantiationException</code> or <code>IllegalAccessException</code>,
     * or if submitted type is not contained in collection of class names
     * @throws RecordNotFoundException when the detail row is not found
     * @throws SQLException thrown if a database error occurs
     */  
    public Detail getDetail( DBconnection conn, String type, Long id ) 
	throws InvalidParameterException, RecordNotFoundException, SQLException {

	Detail detailObject = cache_fetch_type(type, id);
	if(detailObject != null)
		return detailObject;

	if ( !classes.containsKey( type ) ) {
	    throw new InvalidParameterException( "No Detail object defined " +
						 "for type: " + type );
	}

	try {

	    String detailClass = (String) classes.get( type );
	    Class<?> c = Class.forName( detailClass );
	    detailObject = (Detail) c.newInstance();
	    detailObject.get_information( conn, id );
	    cache_put_type(type, id, detailObject);

    } catch ( RecordNotFoundException e) {
      // Pass exception through for handling in record-not-found error page.
      throw new RecordNotFoundException( type + " object " + id + 
                                           " not found: " + e.getMessage());
	} catch ( ClassNotFoundException cnfe ) {      
	    throw new InvalidParameterException( "Class not found: " +
						 cnfe.getMessage() );
	} catch ( InstantiationException ise ) {
	    throw new InvalidParameterException( "Instantiation exception: " + 
						 ise.getMessage() );
	} catch ( IllegalAccessException iae ) {
	    throw new InvalidParameterException( "Illegal Access: " + 
						 iae.getMessage() );
	}
	return detailObject;
    }
  
    /**
     * Creates a <code>Detail</code> object using the class name referenced by
     * key.  Detail objects are created using the default (no parameter) 
     * constructor and, in this method, are populated using the get_information()
     * method that takes a <code>String</code> name as a parameter.
     *
     * @param conn An active connection to the database
     * @param type Type of Detail object requested
     * @param name Name to use for populating object
     * @return Detail object of concrete type referenced by type, and containing
     * data referenced by name
     * @throws RecordNotFoundException when the detail row is not found
     * @throws InvalidParameterException thrown if any object creation 
     * errors occur such as <code>ClassNotFoundException</code>, 
     * <code>InstantiationException</code> or <code>IllegalAccessException</code>,
     * or if submitted type is not contained in collection of class names
     * @throws SQLException thrown if a database error occurs
     */  
    public Detail getDetail( DBconnection conn, String type, String name ) 
	throws RecordNotFoundException, InvalidParameterException, SQLException {

	Detail detailObject = null;

	if ( !classes.containsKey( type ) ) {
	    throw new InvalidParameterException( "No Detail object defined " +
						 "for type: " + type );
	}

	try {

	    String detailClass = (String) classes.get( type );
	    Class c = Class.forName( detailClass );
	    detailObject = (Detail) c.newInstance();
	    detailObject.get_information( conn, name );
    } catch ( RecordNotFoundException e) {
      // Pass through RecordNotFoundException for direct display in UI
      throw new RecordNotFoundException( type + " object " + name + 
                                           " not found: " + e.getMessage());
    } catch ( RuntimeException e) {
      throw new InvalidParameterException( type + " object " + name + 
                                           " not found: " + e.getMessage());
	} catch ( ClassNotFoundException cnfe ) {      
	    throw new InvalidParameterException( "Class not found: " +
						 cnfe.getMessage() );
	} catch ( InstantiationException ise ) {
	    throw new InvalidParameterException( "Instantiation exception: " + 
						 ise.getMessage() );
	} catch ( IllegalAccessException iae ) {
	    throw new InvalidParameterException( "Illegal Access: " + 
						 iae.getMessage() );
	}

	return detailObject;
    }
  

    /**
     * Returns the URL of the JSP that should be used to display data for
     * Detail objects of submitted type.  Client code (TairServlet) can then
     * use this value to redirect the user to display results of data request.
     *
     * @param type Detail object type to get JSP URL for
     * @return URL of JSP to use for displaying Detail data
     */
    public String getDetailPage( String type ) {
	String page = null;

	if ( pages.containsKey( type ) ) {
	    page = (String) pages.get( type );
	}
	return page;
    }

}
