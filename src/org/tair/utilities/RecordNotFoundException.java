/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.sql.*;

/**
  * RecordNotFoundException is thrown if no record is found for a specific SQL query, for
  * instance if a submitted ID is invalid for the requested type of object and there
  * were no valid results for the query. RecordNotFoundException inherits from SQLException
  * so that method signatures can stay simple, while top-level error handling can respond
  * differently to the case where and invalid parameter caused the error instead of 
  * a database error
  */

public class RecordNotFoundException extends SQLException {
  private String name;
  private Long id;
  private String type;


  /**
    * Creates an instance of RecordNotFoundException with the supplied error message
    * 
    * @message Error message for this exception
    */
  public RecordNotFoundException( String errMsg ) {
    super( errMsg );
  }

  /**
    * Creates an empty instance of RecordNotFoundException
    */
  public RecordNotFoundException( ) {
    super();
  }

  public void setName( String name ) { this.name = name; }
  public void setID( Long id ) { this.id = id; }
  public void setType( String type ) { this.type = type; }

  public String getName() { return name; }
  public Long getID() { return id; }
  public String getType() { return type; }
  

}
