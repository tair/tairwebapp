/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.payment;


import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.tair.search.ISearchResultsManager;
import org.tair.search.SearchResultsManagerDecorator;


/**
 * A concrete search results manager that implements the manager interface given
 * a basic map of Invoice Search results keyed on invoice id. The Iterable
 * implementation iterates over the value list of the map in the internal order
 * established by the map. This manager serves as the base manager for a
 * decorated hierarchy of managers in an invoice search.
 * 
 * @author Robert J. Muller
 */
public class InvoiceSearchResultsManager extends
    SearchResultsManagerDecorator<InvoiceSearchResult, Long>{
  /** Serial version UID for serializable class */
  private static final long serialVersionUID = 1L;
  
  private Map<Long, InvoiceSearchResult> map;

  /**
   * Create a BaseInvoiceSearchResultsManager object.
   * 
   * @param map a <code>Map</code> of <code>InvoiceSearchResult</code> objects
   *          keyed on the <code>BigInteger</code> invoice id
   */
  public InvoiceSearchResultsManager(Map<Long, InvoiceSearchResult> map) {
    // Base manager, no component
    super(null);
    this.map = map;
  }

  @Override
  public InvoiceSearchResult getResultByKey(Long key) {
    return map.get(key);
  }

  @Override
  public Iterator<InvoiceSearchResult> iterator() {
    return map.values().iterator();
  }

  @Override
  public List<InvoiceSearchResult> getSortedList(Comparator<InvoiceSearchResult> comparator) {
    List<InvoiceSearchResult> list =
      new ArrayList<InvoiceSearchResult>(map.values());
    Collections.sort(list, comparator);
    return list;
  }

  @Override
  public String export() {
    // Export the entire list in tab-delimited format
    StringBuilder builder = new StringBuilder();
    boolean addedHeader = false;

    // Add all the results.
    for (InvoiceSearchResult result : map.values()) {
      if (!addedHeader) {
        result.getExportHeader(builder);
        addedHeader = true;
      }
      result.getExport(builder);
    }
    return builder.toString();
  }

  @Override
  public int size() {
    // size is the number of elements in the values array list
    return map.values().size();
  }

  @Override
  public int currentPageSize() {
    // page size is the number of elements in the values array list
    return map.values().size();
  }

  @Override
  public int pages() {
    // The base manager does not paginate, so return 1 page.
    return 1;
  }

  @Override
  public void setPage(Integer page) {
    // Ignore the page request, which should have been handled before this
    // if there was a paging decorator.
  }

  @Override
  public void setManager(ISearchResultsManager<InvoiceSearchResult, Long> manager) {
    // Does nothing; no nested manager
  }

  @Override
  public void setResults(Map<Long, InvoiceSearchResult> results) {
    map = results;
  }

  @Override
  public ISearchResultsManager<InvoiceSearchResult, Long> decorateBase(ISearchResultsManager<InvoiceSearchResult, Long> manager) {
    // This is a base manager, so return self to caller.
    return this;
  }
}
