/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search;


import java.io.Serializable;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;


/**
 * A SearchResultsManager is an object that manages the results for a search.
 * Search results have an underlying data representation (a data transfer object
 * or "Result" class) plus a series of Decorator classes that implement the
 * ISearchResultsManager interface. The Decorator classes get initialized with
 * the base data collection (usually some kind of map keyed on an identifier for
 * the result) and the Decorator subclasses perform various operations such as
 * sorting, selecting for download, or paging.
 * 
 * @author Robert J. Muller
 * @param <T> the type of the search result data transfer object (DTO)
 * @param <K> the type of the key of the result object
 */
public interface ISearchResultsManager<T extends ISearchResult<K>, K> extends
    Iterable<T>, Serializable {

  /**
   * Get a particular result from the internal result collection using a key.
   * This method may return null if the key is not represented in the internal
   * collection of results, either because that object is not there or because
   * the internal representation is not keyed.
   * 
   * @param key the key value of type K to use to look up the result object
   * @return a result object of type T
   */
  T getResultByKey(K key);

  /**
   * Given a comparator, return the search results as a sorted list.
   * 
   * @param comparator the comparator
   * @return the search results list sorted by the comparator
   */
  List<T> getSortedList(Comparator<T> comparator);

  /**
   * Get a textual external representation of the search results. This method is
   * mainly used for download decorators that export search results in delimited
   * formats based on a list of ids, but you can create any kind of export
   * decorator that returns a specific format.
   * 
   * @return a textual representation of the search results
   */
  String export();

  /**
   * Get the number of results the manager will return in total.
   * 
   * @return the result set size
   */
  int size();

  /**
   * Get the number of results the manager will return in an iterator (the
   * number of results to display on the current page).
   * 
   * @return the current page size
   */
  int currentPageSize();

  /**
   * Get the number of pages the manager will return. This is the maximum page
   * number that the JSP can request.
   * 
   * @return the total number of pages
   */
  int pages();

  /**
   * Set the current page number. This sets the page to display when a new page
   * is requested and there is a page decorator in the stack of decorators.
   * 
   * @param page the page to display
   */
  void setPage(Integer page);

  /**
   * Set the nested manager for this manager. This method lets you change the
   * nesting of managers.
   * 
   * @param manager the manager to nest within this manager
   * @see #getManagers(LinkedList)
   */
  void setManager(ISearchResultsManager<T, K> manager);

  /**
   * Set a new map of search results into the manager.
   * 
   * @param results the map of T results keyed on type K
   */
  void setResults(Map<K, T> results);
  
  /**
   * Decorate the base manager of this manager with the input manager. If this
   * manager is a base manager, return this manager; otherwise, pass the
   * request to the component manager, which will return the base manager. If
   * the component manager has been removed from the chain, set the component
   * manager to be the input manager (replacing the old component with the new
   * component).
   * 
   * @param manager the manager that needs to decorate the base manager
   * @return the base manager
   */
  ISearchResultsManager<T, K> decorateBase(ISearchResultsManager<T, K> manager);
  
  /**
   * Has this manager been marked as removed from the chain?
   * 
   * @return true if the manager has been removed, false if not
   */
  boolean isRemoved();
}
