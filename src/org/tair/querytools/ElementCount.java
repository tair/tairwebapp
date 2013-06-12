/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.io.Serializable;

public class ElementCount implements Serializable {
  private String elementType;
  private String searchLink;
  private int count;

  public ElementCount() { }

  public ElementCount( String elementType, int count, String searchLink ) {
    this.elementType = elementType;
    this.count = count;
    this.searchLink = searchLink;
  }

  public String getElementType() { return elementType; }
  public String getSearchLink() { return searchLink; }
  public int getCount() { return count; }
  
  public void setElementType( String type ) { this.elementType = type; }
  public void setCount( int count ) { this.count = count; }
  public void setSearchLink( String link ) { this.searchLink = link; }
					      
  public boolean hasCount() {
    return ( getCount() > 0 );
  }


}
