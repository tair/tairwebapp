// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.3 $
// $Date: 2004/11/02 20:10:15 $
// ------------------------------------------------------------------------------
package org.tair.querytools;


import java.io.Serializable;
import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.tair.bs.community.AttributionDelegate;
import org.tair.bs.community.BsAttribution;
import org.tair.bs.community.BsTairObject;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.TairObjectDelegate;
import org.tair.db.community.CommunityFactory;
import org.tair.tfc.DBconnection;
import org.tair.utilities.InvalidActionException;

import com.poesys.bs.delegate.DelegateException;
import com.poesys.db.InvalidParametersException;
import com.poesys.db.dto.DtoStatusException;
import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * BsAttributionCollection is a custom collection class that stores all
 * attributions for a TairObject as a collection of <code>BsAttribution</code>
 * objects.
 */

public class AttributionObjectCollection implements Serializable {

  /** Serial version UID for Serializable class */
  private static final long serialVersionUID = 1L;

  private ArrayList<BigInteger> attributions;

  // list of attributions that have been removed from collection since
  // it was created -- these are held until store() is called at which
  // point they will be deleted from the database
  private ArrayList<BigInteger> removed;

  // attribution type id used to populate collection - this will be null
  // unless constructor that specifies a single attribution
  // type was used to populate object, or unless value has been set
  // specifically (if using collection to create new attributions, for
  // example)
  private BigInteger attributionTypeID;

  // display value of attribution type used to populate collection.
  private String attributionType;

  // tair object id for all attributions in collection
  private Long tairObjectID;

  /**
   * Creates an empty instance of BsAttributionCollection
   */
  public AttributionObjectCollection() {
    attributions = new ArrayList<BigInteger>();
  }

  /**
   * Creates an instance of BsAttributionCollection by populating the collection
   * with <code>BsAttribution</code> objects to represent all attributions to
   * the supplied tair object id
   * 
   * @param conn An active connection to the database
   * @param tair_object_id The tair object id to retrieve attributions for
   * @throws SQLException if a database error occurs
   */
  public AttributionObjectCollection(DBconnection conn, Long tair_object_id)
      throws SQLException {

    attributions = new ArrayList<BigInteger>();

    if (tair_object_id != null) {
      this.tairObjectID = tair_object_id;
      populate(conn);
    }
  }

  /**
   * Creates an instance of BsAttributionCollection by populating the collection
   * with <code>BsAttribution</code> objects to represent all attributions of
   * supplied attribution type for given tair object id.
   * 
   * @param conn An active connection to the database
   * @param tair_object_id Tair object id to retrieve attributions for
   * @param type Attribution type to retrieve
   * @throws SQLException if a database error occurs
   */
  public AttributionObjectCollection(DBconnection conn,
                                     Long tair_object_id,
                                     String type) throws SQLException {

    attributions = new ArrayList<BigInteger>();

    if (tair_object_id != null && type != null) {
      tairObjectID = tair_object_id;
      populate(conn, type);
    }
  }

  /**
   * Populates collection with attributions for tair object id
   * 
   * @param conn the SQL connection
   * @throws SQLException when there is a database problem
   */
  private void populate(DBconnection conn) throws SQLException {

    // TODO Replace with custom query of attribution by tair object id
    // in AttributionDelegate
    ArrayList<BigInteger> ids = null;
    String query =
      "SELECT attribution_id " + "FROM Attribution "
          + "WHERE tair_object_id = ?";

    conn.setQuery(query);
    conn.setQueryVariable(tairObjectID);

    ResultSet results = conn.getResultSet();
    while (results.next()) {
      if (ids == null) {
        ids = new ArrayList<BigInteger>();
      }
      ids.add(results.getBigDecimal("attribution_id").toBigInteger());
    }
    conn.releaseResources();

    queryAttributionsFromIds(ids);
  }

  /**
   * @param ids
   */
  private void queryAttributionsFromIds(ArrayList<BigInteger> ids) {
    if (ids != null && !ids.isEmpty()) {
      AttributionDelegate delegate =
        CommunityDelegateFactory.getAttributionDelegate();
      IPrimaryKey key = null;
      for (BigInteger id : ids) {
        key = CommunityFactory.getAttributionPrimaryKey(id);
        add(delegate.getObject((SequencePrimaryKey)key));
      }
    }
  }

  /**
   * Populates collection with attributions with given attribution type for tair
   * object id.
   * 
   * @param conn the SQL connection
   * @param type the attribution type
   * @throws SQLException when there is a database problem
   */
  private void populate(DBconnection conn, String type) throws SQLException {

    // TODO replace with custom query in AttributionDelegate
    ArrayList<BigInteger> ids = null;

    String query =
      "SELECT a.attribution_id, ay.attribution_type_id "
          + "FROM Attribution a, AttributionType ay "
          + "WHERE a.attribution_type_id = ay.attribution_type_id "
          + "AND a.tair_object_id = ? " + "AND ay.attribution_type = ?";

    conn.setQuery(query);
    conn.setQueryVariable(1, tairObjectID);
    conn.setQueryVariable(2, type);

    ResultSet results = conn.getResultSet();
    while (results.next()) {
      if (ids == null) {
        ids = new ArrayList<BigInteger>();
      }
      ids.add(results.getBigDecimal("attribution_id").toBigInteger());

      // save attribution type used to populate collection
      if (attributionTypeID == null) {
        BigInteger id =
          results.getBigDecimal("attribution_type_id").toBigInteger();
        setAttributionTypeID(id);
        setAttributionType(type);
      }

    }
    conn.releaseResources();

    queryAttributionsFromIds(ids);
  }

  /**
   * Retrieve all attribution sources as delimited string. The source is the
   * organization or person name.
   * 
   * @return All sources for attributions in collection as a semicolon delimited
   *         string
   * @throws SQLException when the community can't be lazily loaded
   */
  public String get_attribution_source_string() throws SQLException {

    StringBuilder sourceBuilder = null;
    BsAttribution attribution = null;
    String sep = "";

    if (attributions != null && attributions.size() > 0) {
      sourceBuilder = new StringBuilder();
      for (BigInteger id : attributions) {
        attribution = getAttribution(id);
        String source = attribution.getCommunity().getName();
        if (source != null) {
          sourceBuilder.append(sep);
          sourceBuilder.append(source);
          sep = "; ";
        }
      }
    }
    return sourceBuilder == null ? null : sourceBuilder.toString();
  }

  /**
   * Retrieves all attributions in collection that are the same attribution type
   * as submitted attributionType.
   * 
   * @param attributionType the kind of attributions to return
   * 
   * @return Attributions in collection that are of attributionType as an
   *         <code>Iterator</code> of <code>BsAttribution</code> objects, or
   *         <code>null</code> if no attributions found with attributionType, or
   *         if attributionType is <code>null</code>
   */
  public List<BsAttribution> getAttributions(String attributionType) {
    ArrayList<BsAttribution> tmpAttributions = new ArrayList<BsAttribution>();
    ;
    BsAttribution attribution = null;

    if (attributionType != null && !isEmpty()) {
      for (BigInteger id : attributions) {
        attribution = getAttribution(id);
        if (attributionType.equals(attribution.getType().getAttributionType())) {

          if (tmpAttributions == null) {
          }
          tmpAttributions.add(attribution);
        }
      }
    }

    return tmpAttributions;
  }

  /**
   * Determines if collection has elements in it or not
   * 
   * @return <code>true</code> if collection has no attributions in it;
   *         <code>false</code> if collection has at least one element in it
   */
  public boolean isEmpty() {
    return attributions.isEmpty();
  }

  /**
   * Retrieves number of elements in collection
   * 
   * @return Number of elements in collection
   */
  public int size() {
    return attributions.size();
  }

  /**
   * Retrieves element at supplied index
   * @param index the index into the array of attributions
   * 
   * @return BsAttribution at supplied index, or <code>null</code> if no element
   *         at supplied index
   */
  public BsAttribution get(int index) {
    AttributionDelegate delegate =
      CommunityDelegateFactory.getAttributionDelegate();
    BigInteger attributionId = attributions.get(index);
    IPrimaryKey key = CommunityFactory.getAttributionPrimaryKey(attributionId);
    BsAttribution attribution = delegate.getObject((SequencePrimaryKey)key);
    return attribution;
  }

  /**
   * Get an attribution object based on the unique primary key value
   * 
   * @param id a primary key value for an attribution
   * @return an attribution object corresponding to the primary key value
   */
  private static final BsAttribution getAttribution(BigInteger id) {
    BsAttribution attribution = null;
    if (id != null) {
      AttributionDelegate delegate =
        CommunityDelegateFactory.getAttributionDelegate();
      IPrimaryKey key = CommunityFactory.getAttributionPrimaryKey(id);
      attribution = delegate.getObject((SequencePrimaryKey)key);
    }
    return attribution;
  }

  /**
   * Get a list of the attributions contained in the collection.
   * 
   * @return a List<BsAttribution> object
   */
  public List<BsAttribution> getAttributions() {
    List<BsAttribution> tempAttrs =
      new ArrayList<BsAttribution>(attributions.size());
    for (BigInteger id : attributions) {
      tempAttrs.add(getAttribution(id));
    }
    return tempAttrs;
  }

  /**
   * Adds supplied element to collection. If adding a new attribution for a TAIR
   * object, store must be called before new row is actually written to the
   * database.
   * 
   * @param attribution BsAttribution to add to collection
   */
  public void add(BsAttribution attribution) {
    attributions.add(attribution.getAttributionId());
  }

  /**
   * Removes supplied element from collection. This will delete the attribution
   * for tair object next time store is called.
   * 
   * @param attribution BsAttribution to remove from collection
   */
  public void remove(BsAttribution attribution) {
    attributions.remove(attribution);

    // If attribution has an attribution_id, add to list of
    // items to be deleted next time store is called. If
    // id is null, no further action is necessary.
    if (attribution.getAttributionId() != null) {
      if (removed == null) {
        removed = new ArrayList<BigInteger>();
      }
      removed.add(attribution.getAttributionId());
    }
  }

  /**
   * Determines if supplied element is in collection
   * 
   * @param attribution the attribution to test against the collection
   * 
   * @return <code>true</code> if supplied element is in collection;
   *         <code>false</code> if element is not found
   */
  public boolean contains(BsAttribution attribution) {
    return attributions.contains(attribution);
  }

  /**
   * Sets attribution type id of attributions this collection represents. This
   * is useful when using collection to create new attributions for a tair
   * object; is also used internally when creating collection to represent a
   * single type of attribution.
   * 
   * @param id Attribution type id for collection
   */
  public void setAttributionTypeID(BigInteger id) {
    this.attributionTypeID = id;
  }

  /**
   * Sets display value for attribution type of attributions this collection
   * represents. This is useful when using collection to create new attributions
   * for a tair object; is also used internally when creating collection to
   * represent a single type of attribution.
   * 
   * @param type the type id for the attribution type
   */
  public void setAttributionType(String type) {
    this.attributionType = type;
  }

  /**
   * Retrieves attribution type id of attributions in collection. This will
   * return null if collection was created to represent all attributions for a
   * tair object regardless of type
   * 
   * @return attribution type id of attributions in collection, if collection is
   *         a single typed attribution collection
   */
  public BigInteger getAttributionTypeID() {
    return attributionTypeID;
  }

  /**
   * Retrieves display value of attribution type of attributions in collection.
   * This will return null if collection was created to represent all
   * attributions for a tair object regardless of type
   * 
   * @return attribution type of attributions in collection, if collection is a
   *         single typed attribution collection
   */
  public String getAttributionType() {
    return attributionType;
  }

  /**
   * Sets tair object id for all attributions in collection. This is used when
   * creating new attributions for a new tair object.
   * 
   * @param tair_object_id Tair object id to set for all attributions in
   *          collection
   */
  public void setTairObjectID(Long tair_object_id) {
    this.tairObjectID = tair_object_id;
    BigInteger tairObjectId = new BigInteger(tair_object_id.toString());
    TairObjectDelegate delegate =
      CommunityDelegateFactory.getTairObjectDelegate();
    IPrimaryKey key = CommunityFactory.getTairObjectPrimaryKey(tairObjectId);
    BsTairObject object = delegate.getObject((SequencePrimaryKey)key);

    if (!isEmpty()) {
      for (BigInteger id : attributions) {
        BsAttribution attribution = getAttribution(id);
        try {
          attribution.setTairObject(object);
        } catch (InvalidParametersException e) {
          throw new DelegateException("Null tair object id", e);
        } catch (DtoStatusException e) {
          throw new DelegateException("Could not set status to CHANGED", e);
        }
      }
    }
  }

  /**
   * Retrieves tair object id all attributions in collection are associated to
   * 
   * @return tair object id of tair object all attributions in collection are
   *         for
   */
  public Long getTairObjectID() {
    return tairObjectID;
  }

  /**
   * Sort the set of attributions using a comparator.
   * 
   * @param comparator the comparator to use to sort
   */
  public void sort(AttributionIdComparator comparator) {

    Collections.sort(attributions, comparator);
  }

  /**
   * Stores collection of attributions for a tair object to the database. Any
   * pre-existing attributions will be UPDATEd, any new attributions will be
   * inserted. Any attributions that were removed from collection since it was
   * created will now be DELETEd.
   * 
   * @param conn An active connection to the database
   * @throws SQLException if a database error occurs
   * @throws InvalidActionException if required info has not been set for any
   *           attributions in collection.
   */
  public void store(DBconnection conn) throws SQLException,
      InvalidActionException {

    AttributionDelegate delegate =
      CommunityDelegateFactory.getAttributionDelegate();
    BsAttribution attribution = null;

    // first delete any attributions removed since collection was created
    List<BsAttribution> list = new ArrayList<BsAttribution>(removed.size());
    if (removed != null) {
      for (BigInteger id : removed) {
        attribution = getAttribution(id);
        attribution.delete();
        list.add(attribution);
      }
    }

    // Process the deletes.
    delegate.process(list);
  }
}
