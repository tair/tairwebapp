//------------------------------------------------------------------------------ 
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.4 $
// $Date: 2005/09/14 16:22:51 $
//------------------------------------------------------------------------------ 

package org.tair.handler;

import java.util.HashMap;

import org.tair.utilities.InvalidParameterException;


/**
 * HandlerFactory creates <code>RequestHandler</code> objects for processing 
 * servlet requests. HandlerFactory stores individual class names of classes 
 * that implement the RequestHandler interface in a Map referenced by a 
 * <code>String</code> key.  This key can then be used by client code to have 
 * HandlerFactory dynamically create the appropriate RequestHandler object to 
 * service a request. Using HandlerFactory to create these objects simplifies
 * client code, and allows RequestHandlers to be created only when they are 
 * needed, eliminating the need to keep objects lingering on the heap that 
 * are used infrequently
 *
 * <p>
 * Since different servlets have different RequestHandlers associated with 
 * them, HandlerFactory's collection of RequestHandler classes and keys must
 * be explicitly populated using the addHandler() method before using the 
 * factory for object creation. Since HandlerFactory creates classes using the
 * Class.newInstance() method, all RequestHandler objects used by the factory 
 * must only use the default, no parameter constructor.
 */


public class HandlerFactory {

    private HashMap handlers;

    /**
     * Creates an instance of HandlerFactory with an empty collection of 
     * RequestHandler class names.
     */
    public HandlerFactory() {
	handlers = new HashMap();
    }

    /**
     * Adds a <code>RequestHandler</code> class name and key to be used when 
     * requesting objects of this type to HandlerFactory's collection of 
     * RequestHandler class names.
     *
     * @param key Key to use when requesting objects of type referenced by 
     * className
     * @param Full class name of RequestHandler object (i.e. 
     * org.tair.community.UpdateHandler) to create when request for an object 
     * referenced by key is received
     */
    public void addHandler( String key, String className ) {
	handlers.put( key, className );
    }

    /**
     * Determines if HandlerFactory has a Handler class mapping defined for
     * submitted key
     *
     * @return <code>true</code> if HandlerFactory contains submitted key
     * or <code>false</code> if key is not found
     */
    public boolean containsKey( String key ) {
	return ( handlers.containsKey( key ) );
    }


    /**
     * Creates a <code>RequestHandler</code> object using the class name 
     * referenced by key. RequestHandler objects are created using the default
     * (no parameter) constructor.
     *
     * @param key Key used to retrieve requested class name for object creation
     * @return RequestHandler object of concrete type referenced by key
     * @throws InvalidParameterException thrown if any object creation errors 
     * occur such as <code>ClassNotFoundException</code>, 
     * <code>InstantiationException</code> or <code>IllegalAccessException</code>,
     * or if submitted key is not contained in collection of class names
     */
    public RequestHandler getHandler( String key ) 
	throws InvalidParameterException {

	RequestHandler handler = null;
	try {
	    if ( handlers.containsKey( key ) ) {
		String handlerClass = (String) handlers.get( key );
		Class c = Class.forName( handlerClass );
		handler = (RequestHandler) c.newInstance();
	    } else {
		throw new InvalidParameterException( "Invalid handler " +
						     "requested: " + key );
	    }

	} catch ( ClassNotFoundException cnfe ) {
	    throw new InvalidParameterException( cnfe.getMessage() );
	} catch ( InstantiationException ise ) {
	    throw new InvalidParameterException( ise.getMessage() );
	} catch ( IllegalAccessException iae ) {
	    throw new InvalidParameterException( iae.getMessage() );
	}
	return handler;
    }
  
}

