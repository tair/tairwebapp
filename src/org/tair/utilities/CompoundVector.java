/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.util.*;

/**
  * CompoundVector is a custom collection class that stores key/value pairs similar
  * to a <code>Map</code>.  CompoundVector allows the same key to be used multiple
  * times and stores its elements in the order they were entered.  CompoundVector
  * handles its storage by using a pair of <code>Vector</code> objects.  Iteration
  * through CompoundVector should be done the same as if iterating through an array,
  * that is, through a loop that uses an incrementing index to retrieve both keys and
  * values.  Example:
  *
  * <p>
  * CompoundVector myVector;<br>
  * for ( int i = 0; i < myVector.size(); i++ ) { <br>
  *    System.out.println( "Key: " + myVector.getKeyAt( i ) );<br>
  *    System.out.println( "Value: " + myVector.getValueAt( i ) );<br>
  * }<br>
  *<br>
  *
  * CompoundVector is used for a variety of Order functions, for example to store
  * the values for a submission retrieved by CompoundWebFormField, where the same
  * order number must be stored multiple times in reference to different values.
  *
  * @see CompoundWebFormField
  */


public class CompoundVector {
  private Vector keys;
  private Vector values;

  /**
    * Creates an empty instance of CompoundVector
    */
  public CompoundVector() {  
    keys = new Vector();
    values = new Vector();
  }


  
  /**
    * Adds a key/value pair to the CompoundVector. Elements can only
    * be added to the collection through this method; limiting addition 
    * to this method forces both key and value collections to stay the
    * same size, meaning that accessing by index will be guaranteed to 
    * return the correct pair. If either key or value is null, neither
    * element will be added to collection.
    *
    * @param key Object to store as a key
    * @param value Object to store as value referenced by key
    */
  public void put( Object key, Object value ) {
    keys.addElement( key );
    values.addElement( value );
  }
			
  
  /**
    * Retrieves the value at the supplied index as <code>Object</code>
    *
    * @return Object value stored at the supplied index, or <code>null</code>
    * if no object stored at that index, or if index exceeds collection size
    */
  public Object getValueAt( int index ) {
    Object returnValue = null;
    if ( values.size() >= index ) {
      returnValue = values.elementAt( index );
    }
    return returnValue;
  }
  

  /**
    * Retrieves the key at the supplied index as <code>Object</code>
    *
    * @return Object key stored at the supplied index, or <code>null</code>
    * if no object stored at that index, or if index exceeds collection size
    */
  public Object getKeyAt( int index ) {
    Object returnValue = null;
    if ( keys.size() >= index ) {
      returnValue = keys.elementAt( index );
    }
    return returnValue;
  }
  

  /**
    * Retrieves the number of key/value pairs currently being stored.
    *
    * @return Number of key/value pairs in CompoundVector.
    */
  public int size() {
    // since keys & values added together, key size should
    // be the same as value size, making this an accurate
    // measurement of CompoundVector size
    return keys.size();
  }


  /**
    * Determines whether this object is completely empty of 
    * keys and values.
    *
    * @return <code>true</code> if no keys or values are currently stored
    * or <code>false</code> if inner collections are not empty
    */
  public boolean isEmpty() {
    return ( values.isEmpty() && keys.isEmpty() );
  }
  

  /**
    * Converts key/value pairs into a <code>HashMap</code>.  If a single key is stored
    * multiple times with different values, returned Map will compress the entries
    * so that only the last instance of key will appear in collection, meaning that
    * previous values for key will be lost. This is necessary since Map will not allow
    * same key to be used more than once.
    *
    * @return HashMap containing key/value pairs, or <code>null</code> if no key/value
    * pairs are currently being stored.
    */
  public HashMap toHashMap() {
    HashMap returnMap = null;
    if ( !isEmpty() ) {
      returnMap = new HashMap();
      for ( int i = 0; i < keys.size(); i++ ) {
	returnMap.put( getKeyAt( i ), getValueAt( i ) );
      }
    }
    return returnMap;
  }


  
  /**
    * Returns all values stored as an Object array
    *
    * @return Object[] containing all values currently stored, in the order they
    * were originally added.
    */
  public Object[] getAllValues() {
    Object[] valuesArr = null;
    if ( !isEmpty() ) {
      valuesArr = new Object[ values.size() ];
      values.copyInto( valuesArr );
    }
    return valuesArr;
  }


  /**
    * Returns all keys stored as an Object array
    *
    * @return Object[] containing all keys currently stored, in the order they
    * were originally added.
    */
  public Object[] getAllKeys() {
    Object[] keysArr = null;
    if ( !isEmpty() ) {
      keysArr = new Object[ keys.size() ];
      keys.copyInto( keysArr );
    }
    return keysArr;
  }



  /**
    * Retrieves all values for a single key as an Object array. 
    *
    * @return Object[] containing all values referenced by supplied key, or 
    * <code>null</code> if there are no stored values for this key.
    */
  public Object[] getValuesFor( Object key ) {
    Vector found = null;
    Object[] valuesArr = null;
    
    if ( !isEmpty() && keys.contains( key ) ) {
      found = new Vector();
      int keyPosition = 0;

      while ( keyPosition < keys.size() ) {
	keyPosition = keys.indexOf( key, keyPosition );
	if ( keyPosition > -1 ) {
	  found.addElement( values.elementAt( keyPosition++ ) );
	} else {
	  break;
	}
      }
    }

    if ( found != null && !found.isEmpty() ) {
      valuesArr = new Object[ found.size() ];
      found.copyInto( valuesArr );
    }

    return valuesArr;
  }


  /**
    * Retrieves the index of the last occurrence of key in the keys collection.
    *
    * @return Last index of key in collection, or -1 if key not found.
    */
  public int lastKeyIndex( Object key ) {
    int lastIndex = -1;
    if ( keys != null && keys.contains( key ) ) {
      lastIndex = keys.lastIndexOf( key );
    }
    return lastIndex;
  }


  /**
    * Retrieves the index of the last occurrence of value in the values collection.
    *
    * @return Last index of value in collection, or -1 if value not found.
    */
  public int lastValueIndex( Object value ) {
    int lastIndex = -1;
    if ( values != null && values.contains( value ) ) {
      lastIndex = values.lastIndexOf( value );
    }
    return lastIndex;
  }


  /**
    * Retrieves the index of the first occurrence of key in the keys collection.
    *
    * @return First index of value in collection, or -1 if key not found.
    */
  public int firstKeyIndex( Object key ) {
    int firstIndex = -1;
    if ( keys != null && keys.contains( key ) ) {
      firstIndex = keys.indexOf( key );
    }
    return firstIndex;
  }


  /**
    * Retrieves the index of the first occurrence of value in the values collection.
    *
    * @return First index of value in collection, or -1 if value not found.
    */
  public int firstValueIndex( Object value ) {
    int firstIndex = -1;
    if ( values != null && values.contains( value ) ) {
      firstIndex = values.indexOf( value );
    }
    return firstIndex;
  }

 


  /**
    * For unit testing only
    */
  public static void main( String[] args ) {
    CompoundVector compound = new CompoundVector();
    compound.put( "key1", "value1" );
    compound.put( "key1", "value2" ); 
    compound.put( "key1", "value3" );
    compound.put( "key2", "value1" );
    compound.put( "key2", "value2" );
    compound.put( "key3", "value4" );

    Object[] values = compound.getValuesFor( "key1" );
    System.out.println( "Values for key1" );
    for ( int i = 0; i < values.length; i++ ) {
      String casted = (String) values[ i ];
      System.out.println( "value " + i + ": " + casted );
    }

  }


}
