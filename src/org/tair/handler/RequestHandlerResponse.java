// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.3 $
// $Date: 2005/05/26 20:37:05 $
// ------------------------------------------------------------------------------

package org.tair.handler;


import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;


/**
 * RequestHandlerResponse encapsulates parameters to be returned to the caller
 * of <code>RequestHandler</code>'s process method. RequestHandlerResponse
 * contains a collection of attributes stored as <code>Object</code> with a
 * <code>String</code>key for retrieval, along with a <code>String</code> that
 * represents the JSP or HTML page user should be forwarded to when their
 * request has been processed.
 * 
 * @see RequestHandler
 */

public class RequestHandlerResponse implements Iterable<String> {

  private Map<String, Object> responseObjects;
  private String nextPage;

  /**
   * Stores any <code>Object</code> with a key for reference and retrieval
   * 
   * @param key key for stored object.
   * @param obj Object to be stored in private collection of attributes
   */
  public void setAttribute(String key, Object obj) {
    if (responseObjects == null) {
      responseObjects = new HashMap<String, Object>();
    }
    responseObjects.put(key, obj);
  }

  /**
   * Retrieves Object referenced by key from private collection of attributes;
   * creates the empty internal map of attributes if not already there
   * 
   * @param key key to be used to retrieve stored object.
   * @return Object referenced by given key. Null if no object exists in inner
   *         collection with this key.
   */
  public Object getAttribute(String key) {
    Object obj = null;

    if (responseObjects != null) {
      obj = responseObjects.get(key);
    } else {
      // create the map
      responseObjects = new HashMap<String, Object>();
    }

    return obj;
  }

  /**
   * Set value for page to be forwarded to when processing is complete
   * 
   * @param page String value of next page
   */
  public void setPage(String page) {
    nextPage = page;
  }

  /**
   * Return value of page to be forwarded to when processing is complete
   * 
   * @return String value of next page
   */
  public String getPage() {
    return nextPage;
  }

  /**
   * Flags whether instance of object has attributes stored in it.
   * 
   * @return <code>true</code> if private collection of attributes has elements
   *         in it, <code>false</code> if collection is null or empty
   */
  public boolean hasAttributes() {
    return (responseObjects != null && !responseObjects.isEmpty());
  }

  /**
   * Get all keys of attributes stored in this object
   * 
   * @return Iterator of keys of private collection of attributes, null if
   *         collection is null or empty
   */
  public Iterator<String> getAttributeKeys() {
    return hasAttributes() ? responseObjects.keySet().iterator() : null;
  }

  @Override
  public Iterator<String> iterator() {
    // Get all the keys of attributes stored in the response object.
    return hasAttributes() ? responseObjects.keySet().iterator() : null;
  }
}
