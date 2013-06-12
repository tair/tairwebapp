/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search;


import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;


/**
 * Decorates a Search Result collection with the ability to retrieve the
 * selected list of search results in tab-delimited format. The decorator builds
 * the list in the same order that the decorated component has; therefore, to
 * retrieve the results in a particular order, decorate the results collection
 * with a sort decorator first, then decorate it with a download decorator to
 * iterate through the results. This class downloads selected results; use the
 * SearchResultDownloadDecorator to download all results.
 * 
 * @author Robert J. Muller
 * @param <T> the ISearchResult implementation type
 * @param <K> the type of the key for the search result
 */
public class SearchResultDownloadSelectionDecorator<T extends ISearchResult<K>, K>
    extends SearchResultDownloadDecorator<T, K> {

  /** Serial version UID for Serializable class */
  private static final long serialVersionUID = 1L;
  
  private final List<K> ids;

  /**
   * Create a SearchResultDownloadSelecttionDecorator object.
   * 
   * @param component the decorated search result manager
   * @param ids the list of ids of selected results
   */
  public SearchResultDownloadSelectionDecorator(ISearchResultsManager<T, K> component,
                                                 List<K> ids) {
    super(component);
    this.ids = ids;
  }

  @Override
  public Iterator<T> iterator() {
    if (list == null) {
      // List not yet generated, build it in order.
      list = new ArrayList<T>(ids.size());
      for (T result : component) {
        if (ids.contains(result.getId())) {
          list.add(result);
        }
      }
    }
    return null;
  }

  @Override
  public String export() {
    // Export the selection list in tab-delimited format
    StringBuilder builder = new StringBuilder();
    boolean addedHeader = false;

    // Add all the results.
    for (T result : component) {
      if (!addedHeader) {
        result.getExportHeader(builder);
        addedHeader = true;
      }
      if (ids.contains(result.getId())) {
        builder = result.getExport(builder);
      }
    }
    return builder.toString();
  }

  @Override
  public T getResultByKey(K key) {
    return component.getResultByKey(key);
  }

  @Override
  public List<T> getSortedList(Comparator<T> comparator) {
    return component.getSortedList(comparator);
  }

  @Override
  public int size() {
    return list.size();
  }

  @Override
  public int pages() {
    return component.pages();
  }
}
