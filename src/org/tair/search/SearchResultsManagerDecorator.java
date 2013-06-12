/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.search;


import java.util.Comparator;
import java.util.Iterator;
import java.util.List;


/**
 * An abstract class that implements the ISearchResultsManager interface as the
 * base class for a set of Invoice Search decorators.
 * 
 * @author Robert J. Muller
 * @param <T> the type of the search result data transfer object (DTO)
 * @param <K> the type of the key to each search result DTO
 */
public abstract class SearchResultsManagerDecorator<T extends ISearchResult<K>, K>
    implements ISearchResultsManager<T, K> {

  /** Serial version UID for Serializable class */
  private static final long serialVersionUID = 1L;

  /** the decorated component search results manager */
  protected ISearchResultsManager<T, K> component;
  
  /** Whether this manager has been removed from the chain */
  protected boolean removed = false;

  /**
   * Create a SearchResultsManagerDecorator object, decorating a nested
   * component manager.
   * 
   * @param component the decorated search results manager
   */
  public SearchResultsManagerDecorator(ISearchResultsManager<T, K> component) {
    this.component = component;
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
  public String export() {
    return component.export();
  }

  @Override
  public Iterator<T> iterator() {
    return component.iterator();
  }

  @Override
  public int size() {
    return component.size();
  }

  @Override
  public int pages() {
    return component.pages();
  }

  @Override
  public void setPage(Integer page) {
    // Pass the page request to the nested component.
    component.setPage(page);
  }

  @Override
  public void setManager(ISearchResultsManager<T, K> manager) {
    this.component = manager;
  }
  
  @Override
  public boolean isRemoved() {
    return removed;
  }
}
