// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.53 $
// $Date: 2004/06/16 17:30:53 $
// ------------------------------------------------------------------------------

package org.tair.querytools;


import java.sql.*;
import java.util.*;

import org.tair.bs.community.BsAttribution;
import org.tair.bs.community.BsUrl;
import org.tair.tfc.*;
import org.tair.utilities.*;

import com.poesys.bs.delegate.DelegateException;


/**
 * TairObjectDetail is a composite class to represent information and meta-data
 * associated with an entry in the TairObject table. This class is used as a
 * superclass for child elements (map element etc.). TairObjectDetail contains a
 * reference to a concrete child instance of <code>TfcTairObject</code> for
 * referencing TairObject conceptual data as well as collections of aliases,
 * attributions, annotations, keywords, references and update history associated
 * with this tair object
 * 
 * <p>
 * TairObjectDetail and all child classes implement the <code>Detail</code>
 * interface which simply forces objects to provide external get_information()
 * methods that allow objects to be populated while using the empty constructor.
 * This allows TairObjects to be instantiated generically using the
 * <code>DetailFactory</code>
 * 
 * <p>
 * TairObjectDetail uses its own get_information() method to populate all
 * internal collections data. This method uses the populateXXX methods to
 * individually populate different data. This is done so that subclasses can use
 * get_information() as a gateway method to retrieve all data at once if
 * desired, or can singly populate only those collections needed using the
 * populateXXX methods individually. The populateXXX themselves can be
 * overridden by sub-classes if type-specific population logic is required.
 * 
 * <p>
 * TairObjectDetail implements Accessible interface to facilitate creation of
 * the object's TAIR accession number through <code>AccessionManager</code>.
 * Sub-classes of TairObjectDetail must override the getElementType() method to
 * return the proper type parameter for the sub-class
 */

public abstract class TairObjectDetail implements Detail, Accessible {

  // Base reference for this object instance. Will actually reference a
  // concrete instance of a child class such as TfcClone, TfcAASequence
  // etc.
  private TfcTairObject tair_object;

  // Aliases for tair object - stored as TfcAlias
  private AliasVector aliases;

  // Attributions for tair object - stored as AttributionObject
  private AttributionObjectCollection attributions;

  // Publications associated to tair object - stored as PublicationObject.
  // Given protected access so child classes can populate according
  // to type specific logic
  protected PublicationObjectCollection publications;

  // Analysis references associated to tair object - stored as
  // TfcAnalysisReference
  private AnalysisReferenceCollection analysisReferences;

  // Database references associated to tair object - stored as
  // TfcDatabaseReference
  private DatabaseReferenceCollection databaseReferences;

  // Communications associated to tair object - stored as
  // CommunicationObject
  private CommunicationObjectCollection communications;

  // Update history for tair object - stored as TfcUpdateHistory objects
  private UpdateHistoryCollection updateHistory;

  // Update history for this tair object as
  // an affected tair object - stored as TfcUpdateHistory objects
  private UpdateHistoryCollection affectedUpdateHistory;

  // Annotations - stored as AnnotationObjects
  private AnnotationObjectCollection annotations;

  // a collection of external links associated to a tair object - stored
  // as ExternalLinkObjects
  private ExternalLinkObjectCollection externalLinks;

  // notepad entries (user annotations) for tair object - stored as
  // Notepad objects
  private NotepadCollection notes;

  // images for tair object - stored as TfcImage
  private ImageCollection images;

  // urls for tair object - stored as URL objects
  private URLCollection urls;

  /**
   * Empty constructor provided so that sub-classes can provide the no argument
   * constructor with no problems.
   */
  public TairObjectDetail() {
  }

  /**
   * Default implementation of constructor that creates an instance of a
   * concrete TairObjectDetail sub-class that reflects data referenced by
   * submitted numeric id
   * 
   * @param conn An active connection to the database
   * @param id ID to retrieve data for
   * @throws RecordNotFoundException if no record found for submitted id
   * @throws SQLException thrown if a database error occurs
   */
  public TairObjectDetail(DBconnection conn, Long id)
      throws RecordNotFoundException, SQLException {

    get_information(conn, id);
  }

  /**
   * Gateway method to retrieve all TairObject level data. This method uses the
   * populateXXX methods to retrieve data. This method assumes that concrete
   * child of TfcTairObject has already been created in sub-class and a
   * reference has been set here in superclass using populateBaseObject method.
   * 
   * @param conn An active connection to the database
   * @param id ID to retrieve data for
   * @throws RecordNotFoundException if no data found for submitted id
   * @throws SQLException in the case of an invalid operation or database error
   */
  public final void getTairObjectInformation(DBconnection conn)
      throws RecordNotFoundException, SQLException {

    populateAliases(conn, get_tair_object_id());
    populateAttributions(conn, get_tair_object_id());
    populateUpdateHistory(conn, get_tair_object_id());
    populateAnnotations(conn, get_tair_object_id());
    populateExternalLinks(conn, get_tair_object_id());
    populateNotepad(conn, get_tair_object_id());
    populateImages(conn, get_tair_object_id());
    populateURL(conn, get_tair_object_id());

    populatePublications(conn, get_tair_object_id());
    populateAnalysisReferences(conn, get_tair_object_id());
    populateDatabaseReferences(conn, get_tair_object_id());
    populateCommunications(conn, get_tair_object_id());

  }

  /**
   * Set internal reference for TfcTairObject to concrete class (inheriting from
   * TfcTairObject) created in sub-class
   * 
   * @param tairObject Object to set as tair object reference
   */
  protected void populateBaseObject(TfcTairObject tairObject) {
    this.tair_object = tairObject;
  }

  /**
   * Populate collection of aliases for submitted tair object id
   * 
   * @param conn An active connection to the database
   * @param tair_object_id Tair object id to retrieve data for
   * @throws SQLException when there is a database problem
   */
  protected void populateAliases(DBconnection conn, Long tair_object_id)
      throws SQLException {

    this.aliases = new AliasVector(conn, tair_object_id);
  }

  /**
   * Populate collection of attributions for submitted tair object id
   * 
   * @param conn An active connection to the database
   * @param tair_object_id Tair object id to retrieve data for
   * @throws SQLException when there is a database problem
   */
  protected void populateAttributions(DBconnection conn, Long tair_object_id)
      throws SQLException {

    this.attributions = new AttributionObjectCollection(conn, tair_object_id);
  }

  /**
   * Populate collection of UpdateHistory objects for submitted tair object id
   * Additionally, populate collection of UpdateHistory objects for submitted
   * tair object id as affected_tair_object_id in the UpdateHistory table
   * 
   * @param conn An active connection to the database
   * @param tair_object_id Tair object id to retrieve data for
   * @throws SQLException when there is a database problem
   */
  protected void populateUpdateHistory(DBconnection conn, Long tair_object_id)
      throws SQLException {

    this.updateHistory =
      new UpdateHistoryCollection(conn, tair_object_id, false);
    this.affectedUpdateHistory =
      new UpdateHistoryCollection(conn, tair_object_id, true);
  }

  /**
   * Populate collection of annotations for submitted tair object id
   * 
   * @param conn An active connection to the database
   * @param tair_object_id Tair object id to retrieve data for
   * @throws SQLException when there is a database problem
   */
  protected void populateAnnotations(DBconnection conn, Long tair_object_id)
      throws SQLException {
    this.annotations = new AnnotationObjectCollection(conn, tair_object_id);
  }

  /**
   * Populates collection of publications for submitted tair_object_id
   * 
   * @param conn An active connection to the database
   * @param tair_object_id Tair object id to retrieve data for
   * @throws SQLException if a database error occurs
   */
  protected void populatePublications(DBconnection conn, Long tair_object_id)
      throws SQLException {

    publications =
      new PublicationObjectCollection(conn, tair_object_id, "tair_object");
  }

  /**
   * Populates collection of analysis references for submitted tair_object_id
   * 
   * @param conn An active connection to the database
   * @param tair_object_id Tair object id to retrieve data for
   * @throws SQLException if a database error occurs
   */
  protected void populateAnalysisReferences(DBconnection conn,
                                            Long tair_object_id)
      throws SQLException {

    analysisReferences = new AnalysisReferenceCollection(conn, tair_object_id);
  }

  /**
   * Populates collection of database references for submitted tair_object_id
   * 
   * @param conn An active connection to the database
   * @param tair_object_id Tair object id to retrieve data for
   * @throws SQLException if a database error occurs
   */
  protected void populateDatabaseReferences(DBconnection conn,
                                            Long tair_object_id)
      throws SQLException {

    databaseReferences =
      new DatabaseReferenceCollection(conn, tair_object_id, "tair_object");
  }

  /**
   * Populates collection of communication references for submitted
   * tair_object_id
   * 
   * @param conn An active connection to the database
   * @param tair_object_id Tair object id to retrieve data for
   * @throws SQLException if a database error occurs
   */
  protected void populateCommunications(DBconnection conn, Long tair_object_id)
      throws SQLException {

    communications = new CommunicationObjectCollection(conn, tair_object_id);
  }

  /**
   * Populate collection of external links for submitted tair object id
   * 
   * @param conn An active connection to the database
   * @param tair_object_id Tair object id to retrieve data for
   * @throws SQLException when there is a database problem
   */
  protected void populateExternalLinks(DBconnection conn, Long tair_object_id)
      throws SQLException {

    this.externalLinks = new ExternalLinkObjectCollection(conn, tair_object_id);
  }

  /**
   * Populate collection of notepad entries (user annotations) for submitted
   * tair object id
   * 
   * @param conn An active connection to the database
   * @param tair_object_id Tair object id to retrieve data for
   * @throws SQLException when there is a database problem
   */
  protected void populateNotepad(DBconnection conn, Long tair_object_id)
      throws SQLException {

    this.notes = new NotepadCollection(conn, tair_object_id);
  }

  /**
   * Populate collection of images for submitted tair object id
   * 
   * @param conn An active connection to the database
   * @param tair_object_id Tair object id to retrieve data for
   * @throws SQLException when there is a database problem
   */
  protected void populateImages(DBconnection conn, Long tair_object_id)
      throws SQLException {

    this.images = new ImageCollection(conn, tair_object_id);
  }

  /**
   * Populate collection of URLs for submitted tair object id
   * 
   * @param conn An Active connection to the database
   * @param tair_object_id Tair object id to retrieve data for
    * @throws SQLException when there is a database problem
  */
  protected void populateURL(DBconnection conn, Long tair_object_id)
      throws SQLException {

    this.urls = new URLCollection(conn, tair_object_id);
  }

  //
  // TfcTairObject wrappers
  //
  /**
   * Get the TAIR object type.
   * 
   * @return the object type id
   */
  public String get_tair_object_type() {
    return tair_object.get_tair_object_type();
  }

  /**
   * Get the TAIR object id for the object.
   * 
   * @return the TAIR object id
   */
  public Long get_tair_object_id() {
    return tair_object.get_tair_object_id();
  }

  /**
   * Determines if TairObject has associated aliases
   * 
   * @return <code>true</code> if tair object has associated aliases, or
   *         <code>false</code> if no aliases exist for tair object
   */
  public boolean hasAliases() {
    return (aliases != null && !aliases.isEmpty());
  }

  /**
   * Returns aliases for this TairObject as an <code>Iterator</code> of
   * <code>TfcAlias</code> objects
   * 
   * @return an <code>Iterator</code> of <code>TfcAlias</code> objects, or
   *         <code>null</code> if no aliases for this TairObject
   * @see TfcAlias
   */
  public Iterator<?> get_aliases() {
    return (hasAliases()) ? aliases.iterator() : null;
  }

  /**
   * Returns all aliases for this TairObject as a delimited string of aliases
   * with semicolon (";") as a delimiter
   * 
   * @return String containing all aliases for this TairObject, or
   *         <code>null</code> if no aliases exists for this object
   */
  public String get_alias_string() {
    return (hasAliases()) ? aliases.get_alias_string() : null;
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
  public List<BsAttribution> get_attributions() {
    return (hasAttributions()) ? attributions.getAttributions() : null;
  }

  /**
   * Retrieves attributions sources for TairObject as delimited string
   * 
   * @return Attribution sources for this TairObject as a semicolon (";")
   *         delimited string, or <code>null</code> if no attributions for this
   *         tair object.
   */
  public String get_attribution_source_string() {
    try {
      return hasAttributions() ? attributions.get_attribution_source_string()
          : null;
    } catch (SQLException e) {
      throw new DelegateException("Can't lazily load community for attribution",
                                  e);
    }
  }

  /**
   * Retrieves all attributions of submitted type associated to TairObject
   * @param attributionType the kind of attribution for which to search
   * 
   * @return Attributions of submitted type associated to TairObject as an
   *         <code>Iterator</code> of <code>BsAttribution</code> objects, or
   *         an empty list if no attributions of attributionType are
   *         associated to TairObject
   * @see BsAttribution
   */
  public List<BsAttribution> get_attributions(String attributionType) {
    return hasAttributions() ? attributions.getAttributions(attributionType)
        : new ArrayList<BsAttribution>();
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
  public Iterator<?> get_publications() {
    return hasPublications() ? publications.iterator() : null;
  }

  /**
   * Determines whether collection of publications was abbreviated so that it
   * contains only the maximum number of publications to display on a detail
   * page. Sub-classes of TairObject (such as GeneDetail) may override
   * populatePublications to populate collection in abbreviated mode. This is
   * done since some elements have so many associated publications that
   * displaying them all is unwieldly on a detail page; this method can then be
   * used to determine whether a "show all" link should be provided
   * 
   * @return <code>true</code> if collection only contains a partial list of all
   *         publications for a given data element, or <code>false</code> if
   *         collection is a full list of all publications retrieved by
   *         population methods
   */
  public boolean publicationsAbbreviated() {
    return hasPublications() ? publications.isAbbreviatedList() : false;
  }

  /**
   * Retrieve total number of publications associated to a tair object. If
   * publicationsAbbreviated returns true, this method can be used to to
   * determine the total number of publications associated to a tair object even
   * though collection does not contain full list of publication objects.
   * 
   * @return Total number of publications associated to tair object
   */
  public int getPublicationsFullCount() {
    return hasPublications() ? publications.getFullCount() : 0;
  }

  /**
   * Retrieve number of publications associated to a tair object that are
   * actually in publications collection. This number may be different than the
   * total number of publications for a tair object as returned by
   * getPublicationsFullCount if the publications collection was abbreviated.
   * 
   * @return Number of publications associated to tair object currently
   *         contained by TairObject's publication collection
   */
  public int getPublicationsSize() {
    return hasPublications() ? publications.size() : 0;
  }

  /**
   * Determines if TairObject has associated analysis references
   * 
   * @return <code>true</code> if tair object has associated analysis
   *         references, or <code>false</code> if no analysis references exist
   *         for tair object
   */
  public boolean hasAnalysisReferences() {
    return (analysisReferences != null && !analysisReferences.isEmpty());
  }

  /**
   * Gets Analysis References as an <code>Iterator</code> of
   * <code>TfcAnalysisReference</code> objects.
   * 
   * @return <code>Iterator</code> of <code>TfcAnalysisReference</code> objects,
   *         or <code>null</code> if no analysis references associated to tair
   *         object
   * @see TfcAnalysisReference
   */
  public Iterator<?> get_analysis_references() {
    return hasAnalysisReferences() ? analysisReferences.iterator() : null;
  }

  /**
   * Determines if TairObject has associated database references
   * 
   * @return <code>true</code> if tair object has associated database
   *         references, or <code>false</code> if no database references exist
   *         for tair object
   */
  public boolean hasDatabaseReferences() {
    return (databaseReferences != null && !databaseReferences.isEmpty());
  }

  /**
   * Gets database references as an <code>Iterator</code> of
   * <code>TfcDatabaseReference</code> objects.
   * 
   * @return <code>Iterator</code> of <code>TfcDatabaseReference</code> objects,
   *         or <code>null</code> if no database references associated to tair
   *         object
   * @see TfcDatabaseReference
   */
  public Iterator<?> get_database_references() {
    return hasDatabaseReferences() ? databaseReferences.iterator() : null;
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
  public Iterator<?> get_communication_references() {
    return hasCommunicationReferences() ? communications.iterator() : null;
  }

  /**
   * Determines if TairObject has associated update history
   * 
   * @return <code>true</code> if tair object has associated update history, or
   *         <code>false</code> if no update history exists for tair object
   */
  public boolean hasUpdateHistory() {
    return (updateHistory != null && !updateHistory.isEmpty());
  }

  /**
   * Gets the update_history as an <code>Iterator</code> of
   * <code>TfcUpdateHistory</code> objects.
   * 
   * @return a <code>Iterator</code> of <code>TfcUpdateHistory</code> objects or
   *         <code>null</code> if no update history
   * @see TfcUpdateHistory
   */
  public Iterator<?> get_update_history() {
    return hasUpdateHistory() ? updateHistory.iterator() : null;
  }

  /**
   * Determines if TairObject has associated update history where tair_object_id
   * is the affected_tair_object_id in UpdateHistory table
   * 
   * @return <code>true</code> if tair object has associated update history, or
   *         <code>false</code> if no update history exists for tair object
   */
  public boolean hasAffectedUpdateHistory() {
    return (affectedUpdateHistory != null && !affectedUpdateHistory.isEmpty());
  }

  /**
   * Gets the affectedUpdateHistory as an <code>Iterator</code> of
   * <code>TfcUpdateHistory</code> objects.
   * 
   * @return a <code>Iterator</code> of <code>TfcUpdateHistory</code> objects or
   *         <code>null</code> if no update history
   * @see TfcUpdateHistory
   */
  public Iterator<?> getAffectedUpdateHistory() {
    return hasAffectedUpdateHistory() ? affectedUpdateHistory.iterator() : null;
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
  public Iterator<?> get_annotations() {
    return hasAnnotations() ? annotations.iterator() : null;
  }

  /**
   * Retrieves all elements in collection
   * 
   * @return All annotations in collection as an <code>Iterator</code> of
   *         <code>String</code> objects, or <code>null</code> if no annotation
   *         sources in collection
   */
  public Iterator<?> getAnnotationSources() {
    return annotations.getAnnotationSources();
  }

  /**
   * Retrieves all annotations in collection for submitted source
   * @param source the publication source
   * 
   * @return All annotations in collection as an <code>Iterator</code> of
   *         <code>AnnotationObject</code> objects for a given source , or
   *         <code>null</code> if no annotations in collection
   */
  public Iterator<?> getAnnotations(String source) {
    return annotations.getAnnotations(source);
  }

  /**
   * Determines if tair object has any external links associated to it
   * 
   * @return <code>true</code> if tair object has external links associated with
   *         it, or <code>false</code> if no external links for tair object
   */
  public boolean has_external_links() {
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
  public Iterator<?> get_external_links() {
    return (has_external_links()) ? externalLinks.iterator() : null;
  }

  /**
   * Determines if tair object has notepad entries associated to it
   * 
   * @return <code>true</code> if tair object has associated notepad entries;
   *         <code>false</code> if no notepad entries associated to tair object
   */
  public boolean hasNotepad() {
    return (notes != null && !notes.isEmpty());
  }

  /**
   * Retrieves notepad entries (user annotations) for this tair object,
   * optionally restricting entries to only most recent 5
   * 
   * @param showAll If <code>true</code> all entries for this object will be
   *          returned; if <code>false</code> only most recent 5 entries will be
   *          returned
   * @return Notepad entries for tair object as an <code>Iterator</code> of
   *         <code>Notepad</code> objects, or <code>null</code> if no notepad
   *         entries for this tair object
   */
  public Iterator<?> getNotepad(boolean showAll) {
    return hasNotepad() ? notes.iterator(showAll) : null;
  }

  /**
   * Determines if tair object has associated images
   * 
   * @return <code>true</code> if tair object has associated images, or
   *         <code>false</code> if no images associated with tair object
   */
  public boolean hasImages() {
    return (images != null && !images.isEmpty());
  }

  /**
   * Retrieve images associated with tair object
   * 
   * @return Images associated with this tair object as an <code>Iterator</code>
   *         of <code>TfcImage</code> objects, or <code>null</code> if no images
   *         for this vector
   */
  public Iterator<?> getImages() {
    return hasImages() ? images.iterator() : null;
  }

  /**
   * Determines if tair object has associated urls
   * 
   * @return <code>true</code> if tair object has associated urls, or
   *         <code>false</code> if no urls associated with tair object
   */
  public boolean hasURLs() {
    return (urls != null && !urls.isEmpty());
  }

  /**
   * Retrieve urls associated with tair object
   * 
   * @return URLs associated with this tair object as an <code>Iterator</code>
   *         of <code>URL</code> objects, or <code>null</code> if no urls for
   *         this tair object
   */
  public Iterator<BsUrl> getURLs() {
    return hasURLs() ? urls.iterator() : null;
  }

  /**
   * Retrieves TAIR accession number for this object. Implemented here to
   * satisfy the <code>Accessible</code> interface
   * 
   * @return TAIR accession number for this object
   */
  public final String getAccession() {
    return AccessionManager.getAccession(this);
  }

  /**
   * Retrieves element type of this object for use in creating TAIR accession
   * number. Implemented here to satisfy the <code>Accessible</code> interface.
   * This implementation returns the tair object type of the object. This method
   * should be overridden by sub-classes if more specific type value is needed
   * (as in MapElementDetail)
   * 
   * @return Object's element type (tair object type) for use in creating TAIR
   *         accession
   */
  public String getElementType() {
    return get_tair_object_type();
  }

  /**
   * Retrieves object's super id (tair_object_id) for use in creating TAIR
   * accession number. Implemented here to satisfy the <code>Accessible</code>
   * interface
   * 
   * @return ID to use for creating TAIR accession number for this object
   */
  public final Long getSuperID() {
    return get_tair_object_id();
  }

  /**
   * For unit testing only
   */
  public void test() {
    System.out.println("****** TairObjectDetail content test ******");
    System.out.println("accession: " + getAccession());

    if (tair_object != null) {
      tair_object.test();
    }

    if (hasAliases()) {
      aliases.test();
    }
    if (hasAttributions()) {
      // attributions.test();
    }

    if (hasPublications()) {
      publications.test();
    }

    if (hasAnalysisReferences()) {
      analysisReferences.test();
    }

    if (hasDatabaseReferences()) {
      databaseReferences.test();
    }

    if (hasCommunicationReferences()) {
      communications.test();
    }

    if (hasUpdateHistory()) {
      updateHistory.test();
    }

    if (hasAffectedUpdateHistory()) {
      affectedUpdateHistory.test();
    }

    if (hasAnnotations()) {
      annotations.test();
    }

    if (has_external_links()) {
      externalLinks.test();
    }

    System.out.println("**** TairObjectDetail content test end ****");
  }

}
