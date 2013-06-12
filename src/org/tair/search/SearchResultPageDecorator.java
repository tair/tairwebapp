/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


/**
 * Decorates a Search Result Manager collection with the ability to retrieve a
 * list of search results that constitute a specific page based on page size and
 * number.
 * 
 * @author Robert J. Muller
 * @param <T> the type of the search result
 * @param <K> the type of the key of the search result
 */
public class SearchResultPageDecorator<T extends ISearchResult<K>, K> extends
    SearchResultsManagerDecorator<T, K> {

  /** Serial version UID for Serializable class */
  private static final long serialVersionUID = 1L;

  /** the number of rows in a display page */
  private final Integer pageSize;
  /** the current page to display */
  private Integer page;
  /** the list of rows in the displayed page */
  private List<T> list;

  /**
   * Create a InvoiceSearchResultsPageDecorator object with the decorated
   * component, the number of results per page (size), and the specific page
   * desired.
   * 
   * @param component the decorated InvoiceSearchResultsManager
   * @param pageSize the number of results per page
   * @param page the page desired
   */
  public SearchResultPageDecorator(ISearchResultsManager<T, K> component,
                                   Integer pageSize,
                                   Integer page) {
    super(component);
    this.pageSize = pageSize;

    // Set the list up right here.
    this.setPage(page);
  }

  @Override
  public Iterator<T> iterator() {
    return list.iterator();
  }

  /**
   * Iterate through the component's list of invoice results to the required
   * page, then build a list with the desired results.
   */
  private void buildPage() {
    list = new ArrayList<T>(pageSize);
    int rowsToSkip = (page - 1) * pageSize;
    int counter = 0;
    for (T result : component) {
      counter++;
      if (counter > rowsToSkip + pageSize) {
        // At end of desired page, stop iterating.
        break;
      } else if (counter > rowsToSkip) {
        // At beginning of desired page, add to results list.
        list.add(result);
      }
    }
  }

  @Override
  public int currentPageSize() {
    // Return the size of the current page of results, not the full set.
    return list.size();
  }

  @Override
  public int pages() {
    // Number of pages is full result set count divided by page size.
    int pages = component.size() / pageSize;
    if (component.size() % pageSize > 0) {
      // there are fewer rows on the last page than would fill it, so add
      // another page to the size to accommodate them, as the integer division
      // will have truncated the remainder.
      pages++;
    }
    return pages;
  }

  @Override
  public void setPage(Integer page) {
    this.page = page;
    buildPage();
  }

  @Override
  public void setResults(Map<K, T> results) {
    component.setResults(results);
  }

  @Override
  public ISearchResultsManager<T, K> decorateBase(ISearchResultsManager<T, K> manager) {
    // Not a base manager, pass to component.
    ISearchResultsManager<T, K> base = component.decorateBase(manager);
    
    // Check whether component has been removed.
    if (component.isRemoved()) {
      // Removed, so set component to input manager to remove it from the chain.
      component = manager;
    }
    
    return base;
  }
}
