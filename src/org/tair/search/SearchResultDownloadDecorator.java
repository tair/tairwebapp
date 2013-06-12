/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


/**
 * Decorates a Search Result collection with the ability to retrieve the search
 * results in tab-delimited format. The decorator builds the list in the same
 * order that the decorated component has; therefore, to retrieve the results in
 * a particular order, decorate the results collection with a sort decorator
 * first, then decorate it with a download decorator to iterate through the
 * results. This class downloads all results; use the
 * SearchResultDownloadSelectionDecorator to download just selected results.
 * 
 * @author Robert J. Muller
 * @param <T> the ISearchResult implementation type
 * @param <K> the type of the key for the search result
 */
public class SearchResultDownloadDecorator<T extends ISearchResult<K>, K>
    extends SearchResultsManagerDecorator<T, K> {
  /** Serial version UID for Serializable class */
  private static final long serialVersionUID = 1L;
  
  protected List<T> list = null;

  /**
   * Create a InvoiceDownloadDecorator object with the decorated component.
   * 
   * @param component the decorated component
   */
  public SearchResultDownloadDecorator(ISearchResultsManager<T, K> component) {
    super(component);
  }

  @Override
  public Iterator<T> iterator() {
    if (list == null) {
      // List not yet generated, build it in order.
      list = new ArrayList<T>();
      for (T result : component) {
        list.add(result);
      }
    }
    return null;
  }

  @Override
  public String export() {
    // Export the entire list in tab-delimited format
    StringBuilder builder = new StringBuilder();
    boolean addedHeader = false;

    // Add all the results.
    for (T result : component) {
      if (!addedHeader) {
        result.getExportHeader(builder);
        addedHeader = true;
      }
      builder = result.getExport(builder);
    }
    return builder.toString();
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
