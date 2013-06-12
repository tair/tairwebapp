// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.3 $
// $Date: 2004/04/26 17:03:16 $
// ------------------------------------------------------------------------------

package org.tair.querytools;


import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import org.tair.bs.community.BsAttribution;
import org.tair.tfc.DBconnection;
import org.tair.utilities.ObjectTyper;
import org.tair.utilities.RecordNotFoundException;


/**
 * AttributionDetail represents all information needed to show attributions of a
 * TairObject on the attribution detail page. AttributionDetail contains
 * collections of tair object's attributions, annotations, external links and
 * references (publications and communications) along with minimal specific
 * information about the tair object itself
 */

public class AttributionDetail implements Detail {

  private Long tairObjectID;

  // TairObject child database table for tairObjectID
  private String childTable;

  // minimal data from childTable needed for display
  private String originalName;
  private java.util.Date dateEntered;

  // Attributions for tair object - stored as BsAttribution
  private AttributionObjectCollection attributions;

  // Annotations - stored as AnnotationObjects
  private AnnotationObjectCollection annotations;

  // a collection of external links associated to a tair object - stored
  // as ExternalLinkObjects
  private ExternalLinkObjectCollection externalLinks;

  // Publications associated to tair object - stored as PublicationObject.
  protected PublicationObjectCollection publications;

  // Communications associated to tair object - stored as
  // CommunicationObject
  private CommunicationObjectCollection communications;

  /**
   * Creates an empty instance of AttributionDetail
   */
  public AttributionDetail() {

  }

  /**
   * Creates an instance of AttributionDetail that represents the data
   * associated to the submitted tair_object_id.
   * 
   * @param conn An active connection to the database
   * @param tair_object_id Tair object id to retrieve data
   * @throws RecordNotFoundException if no row found for submitted id
   * @throws SQLException if a database error occurs
   */
  public AttributionDetail(DBconnection conn, Long tair_object_id)
      throws RecordNotFoundException, SQLException {

    get_information(conn, tair_object_id);
  }

  /**
   * Implementation of name population method to satisfy the Detail interface.
   * However, without knowing a specific TairObject child table, population by
   * name is impossible, so RecordNotFoundException will always be thrown if
   * attempting to populate with this method.
   * 
   * @param conn An active connection to the database
   * @param name Name to retrieve data for
   * @throws RecordNotFoundException ---- WILL ALWAYS BE THROWN if this method
   *           is invoked, since population by name is not possible in this
   *           context
   */
  public void get_information(DBconnection conn, String name)
      throws RecordNotFoundException, SQLException {

    throw new RecordNotFoundException("Cannot populate AnnotationDetail "
                                      + "by name alone");
  }

  /**
   * Retrieves data for submitted tair object id and stores in member objects
   * 
   * @param conn An active connection to the database
   * @param tair_object_id ID to retrieve data for
   * @throws RecordNotFoundException if no row found for submitted id
   * @throws SQLException if a database error occurs
   */
  public void get_information(DBconnection conn, Long tair_object_id)
      throws RecordNotFoundException, SQLException {

    // get child table specific data such as name for id
    populateChildTableData(conn, tair_object_id);

    this.attributions = new AttributionObjectCollection(conn, tair_object_id);

    this.annotations = new AnnotationObjectCollection(conn, tair_object_id);

    this.externalLinks = new ExternalLinkObjectCollection(conn, tair_object_id);

    this.publications =
      new PublicationObjectCollection(conn, tair_object_id, "tair_object");
    this.communications =
      new CommunicationObjectCollection(conn, tair_object_id);
  }

  /**
   * Retrieves data stored in child table of TairObject. This includes
   * original_name and date_entered, which should be in all TairObject child
   * tables.
   * 
   * @param conn An active connection to the database
   * @param tair_object_id ID to retrieve data for
   * @throws RecordNotFoundException if no row found for id
   * @throws SQLException if a database error occurs
   */
  private void populateChildTableData(DBconnection conn, Long tair_object_id)
      throws RecordNotFoundException, SQLException {

    // determine child table data is stored in
    this.tairObjectID = tair_object_id;

    // use ObjectTyper to do the dirty work of determining
    // what table to go to for data
    this.childTable = ObjectTyper.getTairObjectTable(conn, tair_object_id);

    // throw exception if id doesn't point to a valid
    // child table record
    if (childTable == null) {
      throw new RecordNotFoundException("No record found for "
                                        + "tair object id: " + tair_object_id);
    }

    // use ObjectTyper to get name and data info. from child table
    this.originalName =
      ObjectTyper.getTairObjectName(conn, childTable, tair_object_id);

    this.dateEntered =
      ObjectTyper.getTairObjectDateEntered(conn, childTable, tair_object_id);
  }

  /**
   * Determines if TairObject has associated attributions
   * 
   * @return <code>true</code> if tair object has associated attributions, or
   *         <code>false</code> if no attributions exist for tair object
   */
  public boolean hasAttributions() {
    return (attributions != null && !attributions.isEmpty());
  }

  /**
   * Gets attributions for this TairObject as an <code>Iterator</code> of
   * <code>BsAttribution</code> objects.
   * 
   * @return an <code>Iterator</code>of <code>BsAttribution</code> objects, or
   *         <code>null</code> if no attributions for this TairObject
   * @see BsAttribution
   */
  public List<BsAttribution> getAttributions() {
    return hasAttributions() ? attributions.getAttributions() : null;
  }

  /**
   * Retrieves all attributions of submitted type associated to TairObject
   * 
   * @return Attributions of submitted type associated to TairObject as an
   *         <code>Iterator</code> of <code>BsAttribution</code> objects, or
   *         <code>null</code> if no attributions of attributionType are
   *         associated to TairObject
   * @see BsAttribution
   */
  public List<BsAttribution> getAttributions(String attributionType) {
    return hasAttributions() ? attributions.getAttributions(attributionType)
        : null;
  }

  /**
   * Determines if TairObject has associated publications
   * 
   * @return <code>true</code> if tair object has associated publications, or
   *         <code>false</code> if no publications exist for tair object
   * @see PublicationObject
   */
  public boolean hasPublications() {
    return (publications != null && !publications.isEmpty());
  }

  /**
   * Gets Publications as an <code>Iterator</code> of
   * <code>PublicationObject</code>s.
   * 
   * @return <code>Iterator</code> of <code>PublicationObject</code>s, or
   *         <code>null</code> if no publications associated to tair object
   */
  public Iterator getPublications() {
    return hasPublications() ? publications.iterator() : null;
  }

  /**
   * Determines if TairObject has associated communication references
   * 
   * @return <code>true</code> if tair object has associated communication
   *         references, or <code>false</code> if no communication references
   *         exist for tair object
   */
  public boolean hasCommunicationReferences() {
    return (communications != null && !communications.isEmpty());
  }

  /**
   * Gets communication references as an <code>Iterator</code> of
   * <code>CommunicationObject</code> objects.
   * 
   * @return <code>Iterator</code> of <code>CommunicationObject</code> objects,
   *         or <code>null</code> if no communications associated to tair object
   * @see CommunicationObject
   */
  public Iterator getCommunicationReferences() {
    return hasCommunicationReferences() ? communications.iterator() : null;
  }

  /**
   * Determines if TairObject has associated annotations
   * 
   * @return <code>true</code> if tair object has associated annotations, or
   *         <code>false</code> if no annotations exist for tair object
   */
  public boolean hasAnnotations() {
    return (annotations != null && !annotations.isEmpty());
  }

  /**
   * Gets annotations for this TairObject as an <code>Iterator</code> of
   * <code>AnnotationObject</code>s
   * 
   * @return <code>Iterator</code> of <code>AnnotationObject</code>s or
   *         <code>null</code> if no annotations for this tair object.
   * @see AnnotationObject
   */
  public Iterator getAnnotations() {
    return hasAnnotations() ? annotations.iterator() : null;
  }

  /**
   * Determines if tair object has any external links associated to it
   * 
   * @return <code>true</code> if tair object has external links associated with
   *         it, or <code>false</code> if no external links for tair object
   */
  public boolean hasExternalLinks() {
    return (externalLinks != null && !externalLinks.isEmpty());
  }

  /**
   * Gets external links for this TairObject as an <code>Iterator</code> of
   * <code>ExternalLinkObject</code>s
   * 
   * @return <code>Iterator</code> of <code>ExternalLinkObject</code>s or
   *         <code>null</code> if no external links for this tair object.
   * @see ExternalLinkObject
   */
  public Iterator getExternalLinks() {
    return hasExternalLinks() ? externalLinks.iterator() : null;
  }

  /**
   * Retrieves original name for TairObject whose attributions are being
   * displayed
   * 
   * @return Original name (from TairObject child table) for TairObject whose
   *         attributions are being displayed
   */
  public String getOriginalName() {
    return originalName;
  }

  /**
   * Retrieves date entered for TairObject whose attributions are being
   * displayed
   * 
   * @return Date entered (from TairObject child table) for TairObject whose
   *         attributions are being displayed
   */
  public java.util.Date getDateEntered() {
    return dateEntered;
  }

  /**
   * Retrieves tair_object_id of TairObject whose attributions are being
   * displayed
   * 
   * @return tair_object_id of TairObject whose attributions are being displayed
   */
  public Long getTairObjectID() {
    return tairObjectID;
  }

  /**
   * For unit testing only
   */
  public void test() {

    System.out.println("****** AttributionDetail content test ******");

    System.out.println("original name: " + getOriginalName());
    System.out.println("date entered: " + getDateEntered());
    System.out.println("tair_object_id: " + getTairObjectID());

    if (hasAttributions()) {
      // attributions.test();
    }

    if (hasAnnotations()) {
      annotations.test();
    }

    if (hasExternalLinks()) {
      externalLinks.test();
    }

    if (hasPublications()) {
      publications.test();
    }

    if (hasCommunicationReferences()) {
      communications.test();
    }
    System.out.println("**** AttributionDetail content test end ****");
  }

  /**
   * For unit testing only
   */
  public static void main(String[] args) {
    try {

      DBconnection conn = new DBconnection();
      Long id = new Long(3987107);
      AttributionDetail attrib = new AttributionDetail(conn, id);
      attrib.test();

    } catch (Exception e) {
      e.printStackTrace();
    }
  }

}
