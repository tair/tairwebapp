/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

/**
  * ScrollParams encapsulates the common request parameters used for scrolling through multiple
  * pages of search results
  *
  * @see ScrollCalculator#getScrollParams( HttpServletRequest )
  */


public class ScrollParams {

  private int page;
  private int size;
  private int floor;
  private int ceiling;

  /**
    * Creates an instance of ScrollParams that populates all member variables
    *
    * @param page Current page number of results being requested
    * @param size Number of results to show on each page
    * @param floor The bottom result number of the current subset of result set being shown. In 
    * "Displaying 25 to 50 of 100", floor equals 25
    * @param ceiling The top results number of the current subset of result set being shown. In
    * "Displaying 25 to 50 of 100", ceiling equals 50
    */
  public ScrollParams( int page, int size, int floor, int ceiling) {
    this.page = page;
    this.size = size;
    this.floor = floor;
    this.ceiling = ceiling;
  }


  /**
    * Creates an instance of ScrollParams with member variables to be populated externally
    */
  public ScrollParams() {}

  public int getPage(){ return page; }
  public int getSize(){ return size; }
  public int getFloor(){ return floor; }
  public int getCeiling(){ return ceiling; }

  public void setPage( int page ){ this.page = page; }
  public void setSize( int size ){ this.size = size; }
  public void setFloor( int floor ){  this.floor = floor; }
  public void setCeiling( int ceiling ){ this.ceiling = ceiling; }

}
