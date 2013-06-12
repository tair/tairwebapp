/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search;


import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


/**
 * <p>
 * Decorates a Search Result collection with the ability to retrieve a list of
 * search results sorted according to a comparator object. To use this class, it
 * must decorate a class that produces a sorted list, such as the
 * InvoiceSearchResultsManager. You should have comparator classes for all the
 * sorts you want to do, then have the search handler instantiate the desired
 * one before decorating the base results object with the sort decorator.
 * </p>
 * <p>
 * The sort will only occur if the class of the last comparator used is
 * different from the class of the current comparator. This behavior optimizes
 * sorting when the user is paging through the same list of results.
 * </p>
 * <p>
 * There are two sorting methods, one which returns an iterator over the sorted
 * results and one that returns a list of sorted results. The iterator uses the
 * internal comparator set by the constructor. The getSortedList() method uses
 * the comparator passed in and resets the internal comparator to the new
 * comparator. Calling the iterator thus always results in no change to the
 * comparator, while calling the getSortedList() method can change the
 * internal comparator for the next iterator sort.
 * </p>
 * 
 * @author Robert J. Muller
 * @param <T> the type of the search result DTO
 * @param <K> the type of the key for the search result
 */
public class SearchResultsSortDecorator<T extends ISearchResult<K>, K> extends
    SearchResultsManagerDecorator<T, K> {

  /** Serial version UID for Serializable class */
  private static final long serialVersionUID = 1L;
  
  private Comparator<T> comparator;
  private List<T> list;

  /**
   * Create a SearchResultsSortDecorator object with the decorated component and
   * the comparator with which to sort.
   * 
   * @param component the decorated component
   * @param comparator the <code>Comparator</code> with which to sort
   */
  public SearchResultsSortDecorator(ISearchResultsManager<T, K> component,
                                    Comparator<T> comparator) {
    // Set the component to the input component for now.
    super(component);
    
    // Check that comparator is valid.
    if (comparator == null) {
      throw new RuntimeException("No comparator supplied for sorting");
    }
    
    // A new sort decorator needs to wrap a base manager directly, replacing
    // any existing sort decorator. Replace the decorated component with the
    // base component in the chain.
    this.component = component.decorateBase(this);
    
    // Set the comparator for re-sorting later.
    this.comparator = comparator;
    
    // Sort the current list using the comparator.
    list = getSortedList(comparator);
  }

  @Override
  public Iterator<T> iterator() {
    return getSortedList(comparator).iterator();
  }

  @Override
  public List<T> getSortedList(Comparator<T> comparator) {
    // Can just return the list if it's there.
    if (list == null) {
      // No list yet, use the input comparator rather than the class member
      // to "pass through" the sort request (re-sort the results).
      list = component.getSortedList(comparator);
      this.comparator = comparator;
    } else if (!comparator.getClass().equals(this.comparator.getClass())) {
      // Not the same comparator as the class member, so re-sort the list.
      Collections.sort(list, comparator);
      this.comparator = comparator;
    }
    // Finalize the list after sorting.
    finalizeList(list);
    return list;
  }

  /**
   * Finalize the list of results after sorting. This method currently just
   * updates the sort row id (as opposed to the underlying row id, the original
   * sort order). It is intended to handle any updates after sorting that the
   * ISearchResult interface supports.
   * 
   * @param list the sorted list
   */
  private void finalizeList(List<T> list) {
    if (list != null) {
      int rowId = 0;
      for (T result : list) {
        // Add sorted row id.
        result.setSortRowId(rowId);
        rowId++;
      }
    }
  }

  @Override
  public int currentPageSize() {
    return list.size();
  }

  @Override
  public void setResults(Map<K, T> results) {
    component.setResults(results);
  }

  @Override
  public ISearchResultsManager<T, K> decorateBase(ISearchResultsManager<T, K> manager) {
    // Sort always decorates a base manager, so remove this manager from the chain.
    removed = true;
    // Sort is not a base manager, pass to component to get base.
    ISearchResultsManager<T, K> base = component.decorateBase(manager);
    // Remove the current component to completely unlink it.
    component = null;
    // Return the base manager to the nesting manager.
    return base;
  }
}
