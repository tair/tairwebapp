/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.querytools;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcPubSource;
import org.tair.tfc.TfcPublication;


/**
 * PublicationObject extends TfcPublication to present detailed data on a
 * publication including publication source name. PublicationObject implements
 * the <code>Comparable</code> interface so that PublicationObjects can be
 * stored as keys in TreeMap in order by publication year.
 * 
 */
public class PublicationObject extends TfcPublication implements
    Comparable<Object> {

  /** Generated serial version UID for Serializable implementation */
  private static final long serialVersionUID = 1800240649731356271L;

  // Pub source
  private TfcPubSource pubSource;
  // Max number of loci to display in UI; public so UI can use number
  public static final int MAX_LOCI = 20;
  private ArrayList<String> loci = new ArrayList<String>(MAX_LOCI + 1);

  /**
   * Creates an empty instance of PublicationObject
   */
  public PublicationObject() {
  }

  /**
   * Creates an instance of PublicationObject that reflects data referenced by
   * submitted reference id
   * 
   * @param db An active connection to the database
   * @param reference_id Reference id to retrieve data for
   * @throws SQLException in the case of an invalid operation or database error
   */
  public PublicationObject(DBconnection db, Long reference_id)
      throws SQLException {
    super(db, reference_id);
    get_information(db, get_pub_source_id());
  }

  /**
   * Gets the pub source name
   * 
   * @return a <code>String</code> value specifying the pub_source_name
   */
  public String get_pub_source_name() {
    return (pubSource != null) ? pubSource.get_name() : null;
  }

  /**
   * Retrieves pub source info. for publication
   * 
   * @param db An active connection to the database
   * @param pub_source_id Pub source id to retrieve data for
   * @exception SQLException in the case of an invalid operation or database
   *              error
   */
  public void get_information(DBconnection db, Long pub_source_id)
      throws SQLException {
    ResultSet results = null;
    if (pub_source_id != null) {
      this.pubSource = new TfcPubSource(db, pub_source_id);
    }

    // Get all loci names associated with the publication (including gene model
    // associations); only the names are needed by the UI. UNION gets the 
    // unique names in the two types of association.
    String query =
      "SELECT DISTINCT l.name FROM TairObj_Ref r JOIN Publication p ON r.reference_id = p.reference_id JOIN Locus l ON r.tair_object_id = l.tair_object_id WHERE l.is_obsolete = 'F' AND  p.publication_id = "
          + get_publication_id()
          + " UNION SELECT DISTINCT l.name FROM TairObj_Ref r JOIN Publication p ON r.reference_id = p.reference_id JOIN Gene g ON r.tair_object_id = g.tair_object_id JOIN MapElement_Locus mel ON g.map_element_id = mel.map_element_id JOIN Locus l ON mel.locus_id = l.locus_id WHERE g.is_obsolete = 'F' AND p.publication_id = "
          + get_publication_id() + " ORDER BY 1";
    db.setQuery(query);
    results = db.getResultSet();
    int lociCount = 0;
    while (results.next()) {
      loci.add(results.getString("name"));
      lociCount++;
      // Stop after one more than the max number of loci required by
      // the user interface (optimization). Eliminates strings that
      // will never be seen in the UI, just thrown away.
      // NOTE: must keep MAX_LOCI in synch with value in locus_detail.jsp
      if (lociCount > MAX_LOCI) {
        break;
      }
    }
    db.releaseResources();
  }

  /**
   * Does the publication have associated loci?
   * 
   * @return true if there are loci, false if not
   */
  public final boolean has_associated_loci() {
    return (loci != null) ? loci.isEmpty() : false;
  }

  /**
   * Get the associated locus names.
   * 
   * @return an iterator over the array of locus names ordered by name
   */
  public final Iterator<String> get_associated_loci() {
    return (loci != null) ? loci.iterator() : null;
  }

  /**
   * Implementation of compareTo() to satisfy Comparable interface. This
   * interface is necessary to implement to store PublicationObjects in a
   * TreeMap. This is done is LocusDetail so that publications can be displayed
   * in order by date. This implementation returns the int results of comparing
   * this object's year with the year of the submitted PublicationObject. If
   * submitted object is not an instance of PublicationObject, a
   * ClassCastException will be thrown.
   * 
   * @param o Object to compare this PublicationObject to.
   * @return A value less than 0 if submitted object's year is greater than this
   *         publication's year, or if this publication's year is null; and a
   *         value greater than 0 if the submitted object's year is less than
   *         this publication's year. If years are equal, publication title's
   *         are compared and the result is returned. This means that a value of
   *         zero (or equality) will only be returned if submitted publication
   *         has an identical reference id or year and title of this object
   */
  public int compareTo(Object o) {
    PublicationObject pub = (PublicationObject)o;
    Integer compareYear = pub.get_year();
    Integer thisYear = get_year();

    // if same reference id, same object value
    if (get_reference_id() != null
        && get_reference_id().equals(pub.get_reference_id())) {
      return 0;

      // else compare by year
    } else if (thisYear != null) {
      int result = thisYear.compareTo(compareYear);

      // if years match, compare by title
      if (result == 0) {
        String title = get_title();
        if (title != null) {
          result = title.compareTo(pub.get_title());
        } else {
          result = -1;
        }
      }
      return result;
    } else {
      return -1;
    }
  }

  public boolean equals(Object obj) {

    if (obj == null || obj.getClass() != this.getClass())
      return false;

    PublicationObject pub = (PublicationObject)obj;
    return get_reference_id() != null
           && get_reference_id().equals(pub.get_reference_id());

  }

  public int hashCode() {
    int hashcode = 0;

    if (get_reference_id() != null) {
      hashcode = get_reference_id().hashCode();
    }

    return hashcode;
  }
}
