/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.utilities;

/**
 * An interface that represents a field, which is a string field accompanied by
 * an identifier.
 * 
 * @author Robert J. Muller
 */
public interface Field {

  /**
   * Get the field.
   * 
   * @return a field
   */
  String getField();

  /**
   * Set the field.
   * 
   * @param field a field
   */
  void setField(String field);
  
  /**
   * Get the identifier for the object.
   * 
   * @return an identifier string
   */
  String getId();
  
  /**
   * Set the identifier for the object.
   * 
   * @param id the identifier
   */
  void setId(String id);

}