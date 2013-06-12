//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.12 $
// $Date: 2004/09/13 18:31:27 $
//------------------------------------------------------------------------------
package org.tair.utilities;

import java.io.Serializable;

import java.util.HashMap;
import java.util.Map;

/**
  * SearchResultsCollection holds collection of search results along with 
  * associated data to use for displaying results, especially when scrolling
  * through multiple pages of results.  SearchResultsCollection maintains 
  * collection of search results as <code>Object</code> for flexibility. Client
  * receiving a SearchResultsCollection must know the appropriate class to
  * cast the result to before utilizing the search results.
  *
  * <p>
  * Implements Serializable so collection can be written to disk to save ABRC 
  * stock catalog data.  For serialization to succeed, concrete class that 
  * represents results Object must implement Serializable as well.
  */

public class SearchResultsCollection implements Serializable {

    // search result collection
    private Object results;

    // total number of results search yielded
    private int resultSize;

    // secondary count within the result set 
    private int secondaryResultSize;

    //
    // floor & ceiling together show slice of result set ( i.e. 1 to 25 of 
    // 1000 results )
    //

    // where in total result set does current result collection start 
    private int floor;

    // where in total result set does current result collection end
    private int ceiling;

    // number of pages needed to display result set given result size 
    // and page size
    private int totalPages;

    // string with HTML to create links to scroll through results
    private String scrollLinks;

    // plain text version of search criteria used to create result set
    private String searchCriteria;

    // JSP URL to redirect to for displaying search results
    private String resultsPage;

    private Map<String,String> pageLinks = new HashMap<String,String>();

    /**
     * Creates an instance of SearchResultsCollection with all member
     * variables to be populated externally
     */
    public SearchResultsCollection() { }


    /**
     * Creates an instance of SearchResultsCollection with member variables 
     * populated by method arguments
     *
     * @param results Collection of search results.  Type left as object for use
     * with any type of collection
     * @param resultSize Total number of search results. In "Displaying 25 to 
     * 50 of 100", resultSize  equals 100
     * @param floor The bottom end of the subset of total results being 
     * displayed. In "Displaying 25 to 50 of 100",  floor equals 25
     * @param ceiling The top end of the subset of total results being 
     * displayed. In "Displaying 25 to 50 of 100", ceiling equals 50
     * @param scrollLinks <code>String</code> containing HTML to create 
     * hyperlinks to scroll through multiple page resultset
     */
    public SearchResultsCollection( Object results, 
                                    int resultSize, 
                                    int floor, 
                                    int ceiling, 
                                    int totalPages, 
                                    String scrollLinks ) 
    {
        setResults( results );
        setResultSize( resultSize );
        setFloor( floor );
        setCeiling( ceiling );
        setScrollLinks( scrollLinks );
        setTotalPages( totalPages );
    }

    public void setPageLinks(Map<String,String> m){
        this.pageLinks = m;
    }

    public Map<String,String> getPageLinks(){
        return this.pageLinks;
    }

    public void setResults( Object results ) { 
        this.results = results; 
    }

    public Object getResults() { 
        return results; 
    }

    public void setResultSize( int resultSize ) { 
        this.resultSize = resultSize; 
    }

    public int getResultSize() { 
        return resultSize; 
    }

    public void setSecondaryResultSize( int secondaryResultSize ) { 
        this.secondaryResultSize = secondaryResultSize; 
    }

    public int getSecondaryResultSize() { 
        return secondaryResultSize; 
    }

    public void setFloor( int floor ) { 
        this.floor = floor; 
    }

    public int getFloor() { 
        return floor; 
    }

    public void setCeiling( int ceiling ) { 
        this.ceiling = ceiling; 
    }

    public int getCeiling() { 
        return ceiling; 
    }

    public void setScrollLinks( String links ) { 
        this.scrollLinks = links; 
    }

    public String getScrollLinks() { 
        return scrollLinks; 
    }

    public void setTotalPages( int pages ) { 
        this.totalPages = pages; 
    }

    public int getTotalPages() { 
        return totalPages; 
    }

    public void setSearchCriteria( String criteria ) { 
        this.searchCriteria = criteria; 
    }

    public String getSearchCriteria() { 
        return searchCriteria; 
    }
    
    /**
     * Sets value of JSP URL to redirect to for displaying search results.
     * This value is usually set by Searchers, and used by SearchHandlers 
     * to redirect to proper display page.
     *
     * @param page JSP URL to redirect to for displaying search results
     */
    public void setResultsPage( String page ) { 
	this.resultsPage = page; 
    }


    /**
     * Retrieves JSP URL to redirect to for displaying search results.  
     * This value is usually set by Searchers and used by SearchHandlers to
     * redirect to proper display page
     * 
     * @return JSP URL to redirect to for displaying search results
     */
    public String getResultsPage() {
	return resultsPage; 
    }


    /**
     * Determines whether current search yielded any results. If internal
     * collection of search results is not null, or if the result size property
     * of the collection is greater than zero, collection will be determined to
     * be not empty. Examining the result size property is done to account
     * for cases when results collection holds the results of a count or 
     * statistics type of search where there is no actual list of results 
     * objects
     *
     * @return <code>true</code> if there are search results in this object, 
     * <code>false</code> if there are no search results
     */
    public boolean isEmpty() {
        return ( results == null && getResultSize() <= 0 );
    }


}
