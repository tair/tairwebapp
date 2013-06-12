/*
 * Copyright: (c) 2003-2010 Carnegie Institution for Science. All rights
 * reserved.
 */

package org.tair.querytools;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.tair.bs.locusdetail.BsAffectedLocusUpdateHistory;
import org.tair.bs.locusdetail.BsLocusAnnotation;
import org.tair.bs.locusdetail.BsLocusArrayElement;
import org.tair.bs.locusdetail.BsLocusAttribution;
import org.tair.bs.locusdetail.BsLocusComment;
import org.tair.bs.locusdetail.BsLocusCommunication;
import org.tair.bs.locusdetail.BsLocusDetail;
import org.tair.bs.locusdetail.BsLocusExternalLink;
import org.tair.bs.locusdetail.BsLocusGeneModel;
import org.tair.bs.locusdetail.BsLocusGermplasm;
import org.tair.bs.locusdetail.BsLocusGlobalAssignment;
import org.tair.bs.locusdetail.BsLocusMarker;
import org.tair.bs.locusdetail.BsLocusMarkerAlias;
import org.tair.bs.locusdetail.BsLocusMarkerGlobalAssignment;
import org.tair.bs.locusdetail.BsLocusNucleotideSequence;
import org.tair.bs.locusdetail.BsLocusOtherName;
import org.tair.bs.locusdetail.BsLocusPolymorphism;
import org.tair.bs.locusdetail.BsLocusProteinSequence;
import org.tair.bs.locusdetail.BsLocusTranscriptCount;
import org.tair.bs.locusdetail.BsLocusTransposon;
import org.tair.bs.locusdetail.BsLocusUpdateHistory;
import org.tair.bs.locusdetail.BsPublication;
import org.tair.bs.locusdetail.LocusDetailDelegate;
import org.tair.bs.locusdetail.LocusdetailDelegateFactory;
import org.tair.db.locusdetail.LocusdetailFactory;
import org.tair.tfc.DBconnection;
import org.tair.utilities.Accessible;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.StringList;

import com.poesys.bs.delegate.DelegateException;
import com.poesys.db.Message;
import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.NaturalPrimaryKey;


/**
 * <p>
 * LocusDetail is a backing bean for the Locus Detail page. It contains a
 * BsLocusDetail business object and methods to extract elements of that object
 * or to perform various computations on that object. The Locus Detail JSP uses
 * these methods.
 * </p>
 * <p>
 * This class implements the two interfaces Detail and Accessible to interface
 * with the JSP servlet system. The DetailFactory uses the Detail interface to
 * instantiate the detail page with the relevant name or id. The get_information
 * methods perform this function. In this implementation, the methods simply
 * call JDBC to get the TAIR object id, which is the primary key of the
 * implementing business model classes in tair-db.
 * </p>
 * <p>
 * Note that the DetailFactory class will cache LocusDetail objects when it
 * creates them.
 * </p>
 * <p>
 * TODO: Remove these interfaces and have the DetailFactory create the backing
 * bean directly; alternatively, move to Faces and have PrettyFaces call a load
 * method to set up the bean. In any case, get this out of the servlet-based
 * architecture and make it more modular.
 * </p>
 */
public class LocusDetail implements Detail, Accessible {
  private static final int SHOW_COMMENT_LIMIT = 5;
  /**
   * The LocusDetail delegate for querying loci through the default JNDI data
   * source
   */
  private LocusDetailDelegate delegate =
    LocusdetailDelegateFactory.getLocusDetailDelegate();

  /**
   * The locus detail object that constitutes the data view for the user
   * interface
   */
  private BsLocusDetail detail;

  private long tairObjectId;

  /**
   * Flag letting the DetailFactory know this object has been loaded with data
   * from the database, so that loading only happens once.
   */
  private boolean loaded = false;

  public void get_information(DBconnection conn, String name)
      throws RecordNotFoundException, SQLException {
    /*
     * Use the name to query the TAIR object id from the Locus table. The
     * LocusDetail class uses the TAIR object id as the primary key of the
     * LocusDetail view and its children to query everything. The class does not
     * use the input connection any further as tair-db takes over from here.
     */
    String query = "SELECT tair_object_id FROM Locus WHERE name = ?";
    conn.setQuery(query);
    conn.setQueryVariable(name);
    ResultSet rs = conn.getResultSet();
    if (rs != null && rs.next()) {
      tairObjectId = rs.getLong("tair_object_id");
    } else {
      throw new RuntimeException("Could not find locus " + name);
    }
  }

  public void get_information(DBconnection conn, Long locusId)
      throws RecordNotFoundException, SQLException {
    /*
     * Use the locus id to query the TAIR object id from the Locus table. The
     * LocusDetail class uses the TAIR object id as the primary key of the
     * LocusDetail view and its children to query everything. The class does not
     * use the input connection any further as tair-db takes over from here.
     */
    String query = "SELECT tair_object_id FROM Locus WHERE locus_id = ?";
    conn.setQuery(query);
    conn.setQueryVariable(locusId);
    ResultSet rs = conn.getResultSet();
    if (rs != null && rs.next()) {
      tairObjectId = rs.getLong("tair_object_id");
    } else {
      throw new RuntimeException("Could not find locus " + locusId);
    }
  }

  public String getElementType() {
    // Return the "MapElementType", which is "locus"
    return "locus";
  }

  public Long getSuperID() {
    // Return the TAIR object id for the locus.
    return tairObjectId;
  }

  /**
   * Has this object's <code>load()</code> method been called? The caller should
   * call this to determine whether the object has already been loaded with
   * business-object data to prevent further loading.
   * 
   * @return true if <code>load()</code> called, false if not
   */
  public boolean hasLoaded() {
    return loaded;
  }

  /**
   * Load the business-object data into the object. This method interfaces with
   * the "old" TAIR servlet code. It does not actually use the input connection
   * but rather uses the new tair-db business delegate to get the business data.
   * The two limits are also ignored, now being enforced entirely in the JSP. If
   * tair-db fails to get the detail object, this method now throws a runtime
   * exception to that effect.
   * 
   * @param conn ignored
   * @param germLimit ignored
   * @param polyLimit ignored
   */
  public void load(DBconnection conn, long germLimit, long polyLimit) {
    IPrimaryKey key = LocusdetailFactory.getLocusDetailPrimaryKey(tairObjectId);
    try {
      detail = delegate.getObject((NaturalPrimaryKey)key);
    } catch (DelegateException e) {
      String message = Message.getMessage(e.getMessage(), null);
      throw new RuntimeException(message, e);
    }
    if (detail != null) {
      loaded = true;
    } else {
      throw new RuntimeException("Could not load data for locus detail--TAIR object id "
                                 + tairObjectId);
    }
  }

  // BsLocusDetail wrappers

  /**
   * Get the unique TAIR object identifier for the locus.
   * 
   * @return a TAIR object id
   */
  public Long getTairObjectId() {
    return tairObjectId;
  }

  /**
   * Get the locus name.
   * 
   * @return the locus name
   */
  public String getLocusName() {
    checkDetail();
    return detail.getName();
  }

  /**
   * Is the locus obsolete?
   * 
   * @return true if the locus is obsolete, false otherwise
   */
  public Boolean isObsolete() {
    checkDetail();
    return detail.getObsolete();
  }

  /**
   * Get the chromosome on which the locus appears.
   * 
   * @return the chromosome name
   */
  public String getChromosome() {
    checkDetail();
    return detail.getChromosome();
  }
  
  public String getGbrowseChromosome() { 
	  String chromo =  this.getChromosome(); 
	  if(isAlyMap())
	  {
		//just need the number at the end (i.e scaffold_8)
		chromo = chromo.substring(9);
	  }
	  else if(isAgiMap())
	  {
	    chromo = "Chr" + chromo;
	  }
    return chromo;
  }
  
  public String getGbrowseSource() 
  {
   String source = "";
	 if(isAgiMap()) source = "arabidopsis"; 
	 if(isAlyMap()) source = "gb_ensembl_alyrata";
	 return source;
	}

  /**
   * Get the date on which someone last modified the locus information.
   * 
   * @return the last-modified date
   */
  public java.util.Date getDateLastModified() {
    checkDetail();
    return detail.getDateLastModified();
  }

  /**
   * Is this locus in the Arabidopsis thaliana taxon?
   * 
   * @return true if taxon id is GeneDetail.ATH_TAXON_ID, false otherwise
   */
  public boolean isArabidopsisThaliana() {
    boolean retVal = false;
    checkDetail();
    if (detail.getTaxonId() != null) {
      retVal = detail.getTaxonId().equals(GeneDetail.ATH_TAXON_ID);
    }
    return retVal;
  }

  /**
   * Is this locus in the Arabidopsis lyrata taxon?
   * 
   * @return true if taxon id is GeneDetail.ALY_TAXON_ID, false otherwise
   */
  public boolean isArabidopsisLyrata() {
    boolean retVal = false;
    checkDetail();
    if (detail.getTaxonId() != null) {
      retVal = detail.getTaxonId().equals(GeneDetail.ALY_TAXON_ID);
    }
    return retVal;
  }

  /**
   * Get the start position of the span on the chromosome that covers all the
   * gene models of the locus.
   * 
   * @return the start position
   */
  public Long getSpanStartPosition() {
    checkDetail();
    return detail.getSpanStartPosition();
  }

  /**
   * Get the end position of the span on the chromosome that covers all the gene
   * models of the locus.
   * 
   * @return the end position
   */
  public Long getSpanEndPosition() {
    checkDetail();
    return detail.getSpanEndPosition();
  }

  // Wrappers for child object counts

  /**
   * Get the number of polymorphisms associated with the locus.
   * 
   * @return a count
   */
  public Long getPolymorphismCount() {
    checkDetail();
    return detail.getPolymorphismCount();
  }

  /**
   * Get the number of germplasms associated with the locus.
   * 
   * @return a count
   */
  public Long getGermplasmCount() {
    checkDetail();
    return detail.getGermplasmCount();
  }

  /**
   * Get the number of publications associated with the locus.
   * 
   * @return acount
   */
  public Long getPublicationCount() {
    checkDetail();
    return detail.getPublicationCount();
  }

  // GeneModel wrappers for representative gene model

  /**
   * Get the unique gene identifier for the representative gene model.
   * 
   * @return a gene id
   */
  public Long getRepresentativeGeneId() {
    checkDetail();
    return detail.getRepGeneId();
  }

  /**
   * Get the name of the representative gene model for the locus
   * 
   * @return Name for representative gene model, or <code>null</code> if no
   *         representative gene model exists for locus
   */
  public String getRepresentativeGeneName() {
    checkDetail();
    return detail.getRepGeneName();
  }

  /**
   * Get the gene model type of the representative gene model for the locus
   * 
   * @return Gene model type for locus's representative gene model, or
   *         <code>null</code> if no representative gene model exists for locus
   */
  public String getRepresentativeGeneModelType() {
    checkDetail();
    return detail.getRepGeneModelType();
  }

  /**
   * Get description for representative gene model of locus
   * 
   * @return Description for locus's representative gene model, or
   *         <code>null</code> if no representative gene model exists for locus
   */
  public String getRepresentativeGeneDescription() {
    checkDetail();
    return detail.getRepGeneDescription();
  }

  /**
   * Does the locus have any sequences for its representative gene model?
   * 
   * @return true if there are sequences, false if not
   */
  public boolean hasRepresentativeGeneSequences() {
    checkDetail();
    return detail.getSequences().size() > 0 ? true : false;
  }

  /**
   * Get nucleotide sequence links for representative gene model of locus
   * 
   * @return Sequence links for locus's representative gene model as an
   *         <code>Collection</code> of <code>BsLocusNucleotideSequence</code>
   *         objects, or <code>null</code> if no representative gene model
   *         exists for locus or no sequences exist for representative gene
   *         model.
   */
  public Collection<BsLocusNucleotideSequence> getRepresentativeGeneSequences() {
    checkDetail();
    return detail.getSequences();
    // return (representative != null) ? representative.get_sequences() : null;
  }

  /**
   * Does the locus have any protein ("AA") sequences for its representative
   * gene model?
   * 
   * @return true if there are such sequences, false if not
   */
  public boolean hasRepresentativeGeneAaSequences() {
    checkDetail();
    return detail.getProteinSequences().size() > 0 ? true : false;
  }

  /**
   * Get protein ("AA") sequence links for representative gene model of locus
   * 
   * @return Protein sequence links for locus's representative gene model as an
   *         <code>Collection</code> of <code>BsLocusProteinSequence</code>
   *         objects, or <code>null</code> if no representative gene model
   *         exists for locus or no protein sequences exist for representative
   *         gene model.
   */
  public Collection<BsLocusProteinSequence> getRepresentativeGeneAaSequences() {
    checkDetail();
    return detail.getProteinSequences();
    // return (representative != null) ? representative.get_sequences() : null;
  }

  /**
   * Get the TAIR object id for representative gene model of locus
   * 
   * @return TAIR object id of representative gene model for locus, or
   *         <code>null</code> if no representative gene model exists for locus.
   *         This is useful for creating links to SeqViewer for locus using gene
   *         model info.
   */
  public Long getRepresentativeGeneModelTairObjectId() {
    checkDetail();
    return detail.getRepGeneTairObjectId();
  }

  /**
   * Get unique names, aliases and symbols of gene models associated with locus
   * that have gene alias type of "orf" or are associated with a symbol. String
   * contains gene names, aliases and symbols ordered alphabetically and
   * separated by commas. String will not contain names, aliases or symbols of
   * the representative gene model or any splice variant names (locus name with
   * numeric suffix other than than of the representative gene model).
   * 
   * @return String of names, aliases and symbols of associated gene models or
   *         <code>null</code> if no gene models are associated with this locus
   */
  public String getOtherNames() {
    checkDetail();
    // Convert the list of "other names" to a list of string names.
    List<String> strings = new ArrayList<String>(detail.getOtherNames().size());
    for (BsLocusOtherName name : detail.getOtherNames()) {
      strings.add(name.getName());
    }
    // Now convert the list of strings to a comma-delimited string.
    return StringList.listToCommaString(strings);
  }

  private void checkDetail() {
    if (detail == null) {
      throw new RuntimeException("No locus detail object in database for TAIR object "
                                 + tairObjectId);
    }
  }

  /**
   * Determines if submitted name is a splice variant name of locus name. If
   * submitted name has a numeric suffix greater than ".1", and base name is
   * equal to locus name, then submitted name is determined to be a splice
   * variant of locus name
   * @param name the name to examine
   * 
   * @return <code>true</code> if submitted name is a splice variant of locus
   *         name, <code>false</code> if submitted name is not a splice variant
   *         of locus name
   */
  public boolean isSpliceVariant(String name) {
    checkDetail();
    boolean isVariant = false;

    // if name has a "." in it, see if suffix is ".1" - if
    // not, suffix must be greater than 1 and a splice variant
    int dotPos = name.indexOf(".");
    if (dotPos > -1 && !name.endsWith(".1")
        && name.substring(0, dotPos).equalsIgnoreCase(detail.getName())) {
      isVariant = true;
    }
    return isVariant;
  }

  /**
   * get ATGDB external link of this locus A Locus object has ATGDB link if it's
   * name has this format : AT_G___
   * 
   * @return ATGDB link as <code>String</code> if locus has ATGDB link,
   *         otherwise, return null
   */
  public String getATGDBLink() {
    checkDetail();
    StringBuilder builder =
      new StringBuilder("http://www.plantgdb.org/AtGDB-cgi/findRegion.pl?id=");
    String name = detail.getName().toUpperCase();
    String link = null;

    if (name.length() >= 4 && name.startsWith("AT") && name.charAt(3) == 'G') {
      // ATGDB only accepts name like this format: At1g23456
      builder.append("A");
      builder.append(name.toLowerCase().substring(1));
      link = builder.toString();
    }
    return link;
  }

  /**
   * Whether the locus has associated genetic markers
   * 
   * @return true if there are genetic markers, false if not
   */
  public boolean hasGeneticMarkers() {
    checkDetail();
    return detail.getGeneticMarkers().size() > 0;
  }

  /**
   * Retrieves all genetic markers for this locus
   * 
   * @return GeneticMarkers associated with this locus as an
   *         <code>Iterator</code> of <code>GeneticMarker</code> objects, or
   *         <code>null</code> if no genetic markers associated with this locus.
   * @see GeneticMarker
   */
  public Collection<BsLocusMarker> getGeneticMarkers() {
    checkDetail();
    return detail.getGeneticMarkers();
  }

  /**
   * Get a comma-separated list of the aliases of the genetic marker for the
   * locus.
   * 
   * @param marker the marker for which to generate the comma-separated list
   * @return the comma-separated list of aliases for the marker
   */
  public String getMarkerAliasString(BsLocusMarker marker) {
    Collection<BsLocusMarkerAlias> aliases = marker.getAliases();
    Collection<String> strings = new ArrayList<String>(aliases.size());
    for (BsLocusMarkerAlias alias : aliases) {
      strings.add(alias.getAlias());
    }
    return StringList.listToCommaString(strings);
  }

  /**
   * Get the polymorphisms associated with the locus.
   * 
   * @return
   */
  public List<BsLocusPolymorphism> getPolymorphisms() {
    checkDetail();
    return detail.getPolymorphisms();
  }

  /**
   * Determines whether there are any germplasms associated with this locus's
   * representative gene
   * 
   * @return <code>true</code> if representative gene has associated germplasms,
   *         <code>false</code> if no germplasms are associated with this
   *         locus's representative gene
   */
  public boolean hasGermplasms() {
    checkDetail();
    return detail.getGermplasms().size() > 0;
  }

  /**
   * Determines whether there are any transposons associated with this locus
   * 
   * @return <code>true</code> if locus has transposons associated
   */
  public boolean hasTransposons() {
    checkDetail();
    return detail.getTransposons().size() > 0 ? true : false;
  }

  /**
   * Retrieves germplasms associated with this locus
   * 
   * @return Germplasms associated with this locus as as a <code>List</code> of
   *         <code>BsLocusGermplasm</code> objects or an empty <code>List</code>
   *         if no germplasms are associated with this locus
   */
  public List<BsLocusGermplasm> getGermplasms() {
    return detail.getGermplasms();
  }

  /**
   * Does the locus have annotations?
   * 
   * @return true if has annotations, false if it doesn't
   */
  public boolean hasAnnotations() {
    checkDetail();
    return detail.getAnnotations().size() > 0;
  }

  /**
   * Get the annotations of the locus in a list of annotation groups ordered by
   * category and relationship type. Each group contains a string that
   * implements a comma-separated list of <a> links for the keywords of the
   * annotation.
   * 
   * @return a list of locus annotation groups
   */
  public List<LocusAnnotationGroup> getAnnotationGroups() {
    checkDetail();
    List<LocusAnnotationGroup> groups = new ArrayList<LocusAnnotationGroup>();
    List<BsLocusAnnotation> annotations = detail.getAnnotations();
    // Iterate through in order by category and relationship type.
    String currentCategory = null;
    String currentRelationshipType = null;
    List<String> links = null;
    for (BsLocusAnnotation annotation : annotations) {
      if (currentCategory == null
          || !currentCategory.equals(annotation.getCategory())
          || !currentRelationshipType.equals(annotation.getRelationshipType())) {
        // Create the currently building group unless this is the first one.
        if (links != null) {
          groups.add(new LocusAnnotationGroup(currentCategory,
                                              currentRelationshipType,
                                              links));
        }
        // Start the next group of links.
        currentCategory = annotation.getCategory();
        currentRelationshipType = annotation.getRelationshipType();
        links = new ArrayList<String>();
      }
      // Add the annotation link to the current group of links.
      links.add(annotation.getKeywordLink());
    }
    // Add the last group.
    if (links != null) {
      groups.add(new LocusAnnotationGroup(currentCategory,
                                          currentRelationshipType,
                                          links));
    }
    return groups;
  }

  /**
   * Retrieves single channel microarray elements associated to locus
   * 
   * @return Microarray elements associated to locus as a
   *         <code>Collection</code> of <code>BsLocusArrayElement</code>
   *         objects, or <code>null</code> if no microarray elements associated
   *         to locus
   */
  public Collection<BsLocusArrayElement> getSingleChannelArrayElements() {
    checkDetail();

    Collection<BsLocusArrayElement> allElements = detail.getArrayElements();
    Collection<BsLocusArrayElement> singleChannelElements =
      new ArrayList<BsLocusArrayElement>();
    for (BsLocusArrayElement element : allElements) {
      if (element.getSingle()) {
        singleChannelElements.add(element);
      }
    }
    return singleChannelElements;
  }

  /**
   * Determines if locus has associated single channel microarray elements
   * 
   * @return <code>true</code> if locus has associated array elements, or
   *         <code>false</code> if no array elements associated to locus
   */
  public boolean hasSingleChannelArrayElements() {
    boolean hasElement = false;

    checkDetail();

    for (BsLocusArrayElement element : detail.getArrayElements()) {
      if (element.getSingle()) {
        hasElement = true;
        break;
      }
    }
    return hasElement;
  }

  /**
   * Retrieves dual channel microarray elements associated to locus
   * 
   * @return Microarray elements associated to locus as a
   *         <code>Collection</code> of <code>BsLocusArrayElement</code>
   *         objects, or as an empty collection if no microarray elements
   *         associated to locus
   */
  public Collection<BsLocusArrayElement> getDualChannelArrayElements() {

    checkDetail();

    Collection<BsLocusArrayElement> allElements = detail.getArrayElements();
    Collection<BsLocusArrayElement> dualChannelElements =
      new ArrayList<BsLocusArrayElement>();
    for (BsLocusArrayElement element : allElements) {
      if (!element.getSingle()) {
        dualChannelElements.add(element);
      }
    }
    return dualChannelElements;
  }

  /**
   * Determines if locus has associated dual channel microarray elements
   * 
   * @return <code>true</code> if locus has associated array elements, or
   *         <code>false</code> if no array elements associated to locus
   */
  public boolean hasDualChannelArrayElements() {
    boolean hasElement = false;

    checkDetail();

    for (BsLocusArrayElement element : detail.getArrayElements()) {
      if (!element.getSingle()) {
        hasElement = true;
        break;
      }
    }
    return hasElement;
  }

  /**
   * Determines whether locus has associated global assignments
   * 
   * @return <code>true</code> if locus has associated assignments, or
   *         <code>false</code> if locus has no global assignments
   */
  public boolean hasGlobalAssignments() {
    checkDetail();

    return detail.getGlobalAssignments().size() > 0;
  }

  /**
   * Get a collection of global assignments for the locus.
   * 
   * @return a Collection of BsLocusGlobalAssignment objects, possibly empty
   */
  public Collection<BsLocusGlobalAssignment> getLocusGlobalAssignments() {
    checkDetail();

    return detail.getGlobalAssignments();
  }

  /**
   * Should the Locus Detail page show the MapViewer link? This is true if this
   * is an AGI map for a gene, locus, genetic marker, or assembly unit or if
   * this is not an AGI map.
   * 
   * @return true if the page should show the MapViewer link, false if not
   */
  public boolean showMapViewerLink() {
    boolean show = false;
    checkDetail();
    // Show the MapViewer if this is an AGI map for a gene, locus, genetic
    // marker, or assembly unit or if this is not an AGI map.
    for (BsLocusGlobalAssignment ga : detail.getGlobalAssignments()) {
      if (ga.getMapName().equals("AGI")
          && (ga.getMapElementType().equals("gene")
              || ga.getMapElementType().equals("locus")
              || ga.getMapElementType().equals("genetic_marker") || ga.getMapElementType().equals("assembly_unit"))) {
        show = true;
      } else if (!ga.getMapName().equals("AGI")) {
        show = true;
      }
    }
    return show;
  }

  /**
   * Determine whether the representative gene model is on the AGI map, which is
   * instrumental in deciding whether to display SeqViewer links.
   * 
   * @return true if the representative gene model in on the AGI map, false if
   *         not
   */
  public boolean isAgiMap() {
    boolean isAgi = false;
    checkDetail();
    // Determine whether the representative gene model is on the AGI map, which
    // is instrumental in deciding whether to display SeqViewer links.
    for (BsLocusGlobalAssignment ga : detail.getGlobalAssignments()) {
      if (ga.getMapName().equals("AGI")) {
        isAgi = true;
        break;
      }
    }
    return isAgi;
  }
  
  public boolean isAlyMap() {
	    boolean isAly = false;
	    checkDetail();
	    // Determine whether the representative gene model is on the AGI map, which
	    // is instrumental in deciding whether to display SeqViewer links.
	    for (BsLocusGlobalAssignment ga : detail.getGlobalAssignments()) {
	      if (ga.getMapName().equals("LYRATA")) {
	        isAly = true;
	        break;
	      }
	    }
	    return isAly;
	  }

  /**
   * Get a String array of AGI chromosomes from the global assignments for the
   * locus. The Locus Detail page uses these strings in the SeqViewer links.
   * 
   * @return a String array of chromosome names
   */
  public String[] getAGIChromosomes() {
    ArrayList<String> chromosomes = new ArrayList<String>(1);
    checkDetail();

    // Pull the chromosomes out of the global assignments for use in creating
    // SeqViewer links.
    for (BsLocusGlobalAssignment assignment : detail.getGlobalAssignments()) {
      chromosomes.add(assignment.getChromosome());
    }
    return chromosomes.toArray(new String[chromosomes.size()]);
  }

  /**
   * Pull the chromosomes out of the marker global assignments. The Locus Detail
   * page uses these strings in the SeqViewer links.
   * 
   * @param marker the marker for which to pull chromosomes
   * @return a String array of chromosome names
   */
  public String[] getMarkerAGIChromosomes(BsLocusMarker marker) {
    ArrayList<String> chromosomes = new ArrayList<String>(1);
    checkDetail();

    // Pull the chromosomes out of the global assignments for use in creating
    // SeqViewer links. Add only the AGI-map chromosomes.
    for (BsLocusMarkerGlobalAssignment assignment : marker.getGlobalAssignments()) {
      if (assignment.getMapName().equalsIgnoreCase("AGI")) {
        chromosomes.add(assignment.getChromosome());
      }
    }
    return chromosomes.toArray(new String[chromosomes.size()]);
  }

  /**
   * Determines if locus or its gene models have associated publications.
   * Overrides implementation in TairObjectDetail to use locus specific
   * collection of references
   * 
   * @return <code>true</code> if publications associated to locus or its gene
   *         models; <code>false</code> if no publications associated to locus
   *         or its gene models.
   */
  public boolean hasPublications() {
    boolean hasPublications = false;
    checkDetail();
    try {
      hasPublications = detail.getPublication().size() > 0;
    } catch (SQLException e) {
      // Some kind of SQL problem lazily loading the publication, ignore and
      // return false.
      e.printStackTrace();
    }
    return hasPublications;
  }

  /**
   * Returns an ordered list of publications associated with the locus.
   * 
   * @return a <code>List</code> of <code>BsLocusPublication</code> objects
   */
  public List<BsPublication> getPublications() {
    List<BsPublication> list = null;
    checkDetail();
    try {
      list = detail.getPublication();
    } catch (SQLException e) {
      // Some kind of SQL problem lazily loading the publication, ignore and
      // return false.
      e.printStackTrace();
    }
    return list;
  }

  /**
   * Determines if locus or its gene models have associated communication
   * references. Overrides implementation in TairObjectDetail to use locus
   * specific collection of references
   * 
   * @return <code>true</code> if communication references associated to locus
   *         or its gene models; <code>false</code> if no communications
   *         associated to locus or its gene models.
   */
  public boolean hasCommunicationReferences() {
    checkDetail();
    return detail.getCommunications().size() > 0;
  }

  /**
   * Get the ordered list of communications (ordered by communication date).
   * 
   * @return a <code>List</code> of <code>BsLocusCommunication</code> objects
   */
  public List<BsLocusCommunication> getCommunications() {
    checkDetail();
    return detail.getCommunications();
  }

  /**
   * Does the locus have any transcripts associated with it?
   * 
   * @return true if there are transcripts, false if not
   */
  public boolean hasTranscriptCounts() {
    checkDetail();
    return detail.getCounts().size() > 0;
  }

  /**
   * Returns objects that contain the counts of different kinds of transcripts
   * associated with the locus.
   * 
   * @return a collection of transcript count objects
   */
  public Collection<BsLocusTranscriptCount> getTranscriptCounts() {
    checkDetail();
    return detail.getCounts();
  }

  /**
   * Does the locus have any non-representative gene models?
   * 
   * @return true if there are gene models, false if not.
   */
  public boolean hasGeneModels() {
    checkDetail();
    return detail.getGeneModels().size() > 0 ? true : false;
  }

  /**
   * Get the TAIR accession string for the locus.
   * 
   * @return a TAIR access string
   */
  public String getAccession() {
    checkDetail();
    return detail.getAccession();
  }

  // New methods that provide access to detail collections and lists

  /**
   * Does the locus have an update history?
   * 
   * @return true if it does, false if it doesn't
   */
  public boolean hasUpdateHistory() {
    checkDetail();
    return detail.getUpdateHistories().size() > 0;
  }

  /**
   * Get a collection of update histories for the locus (updates to the locus).
   * 
   * @return a collection of update histories
   */
  public Collection<BsLocusUpdateHistory> getUpdateHistories() {
    checkDetail();
    return detail.getUpdateHistories();
  }

  /**
   * Does the locus participate in another locus's update history?
   * 
   * @return true if it does, false if it doesn't
   */
  public boolean hasAffectedUpdateHistory() {
    checkDetail();
    return detail.getAffectedUpdateHistories().size() > 0;
  }

  /**
   * Get a collection of update histories for other loci that affect this locus.
   * 
   * @return a collection of affected-update histories
   */
  public Collection<BsAffectedLocusUpdateHistory> getAffectedUpdateHistories() {
    checkDetail();
    return detail.getAffectedUpdateHistories();
  }

  /**
   * Get a collection of transposons for the locus.
   * 
   * @return a collection of transposons
   */
  public Collection<BsLocusTransposon> getTransposons() {
    checkDetail();
    return detail.getTransposons();
  }

  /**
   * Return the set of gene models associated with the locus that are not the
   * representative gene model for the locus.
   * 
   * @return the non-representative gene models for the locus
   */
  public Collection<BsLocusGeneModel> getGeneModels() {
    checkDetail();
    return detail.getGeneModels();
  }

  /**
   * Return the set of external links associated with the locus.
   * 
   * @return a collection of external links
   */
  public Collection<BsLocusExternalLink> getExternalLinks() {
    checkDetail();
    return detail.getExternalLinks();
  }

  /**
   * Does the locus have any comments associated with it?
   * 
   * @return true if there are comments, false otherwise
   * @throws SQLException
   */
  public boolean hasComments() throws SQLException {
    checkDetail();
    return detail.getComments().size() > 0;
  }

  /**
   * Get the list of comments in descending order by date.
   * 
   * @param showAll if false, show only the first few comments; if true, show
   *          all the comments.
   * @return the list of comments
   * @throws SQLException
   */
  public List<BsLocusComment> getComments(boolean showAll) throws SQLException {
    checkDetail();
    List<BsLocusComment> comments = null;
    if (showAll) {
      comments = detail.getComments();
    } else {
      // show only five
      int count = 0;
      comments = new ArrayList<BsLocusComment>(SHOW_COMMENT_LIMIT);
      for (BsLocusComment comment : detail.getComments()) {
        comments.add(comment);
        count++;
        if (count >= SHOW_COMMENT_LIMIT) {
          break;
        }
      }
    }
    return comments;
  }

  /**
   * Does the locus have any attributions?
   * 
   * @return true if there are attributions, false if not
   */
  public boolean hasAttributions() {
    checkDetail();
    return detail.getAttributions().size() > 0;
  }

  /**
   * Get a collection of the attributions of the locus (the community members to
   * which the locus is attributed).
   * 
   * @return a Collection of BsLocusAttribution objects
   */
  public Collection<BsLocusAttribution> getAttributions() {
    checkDetail();
    return detail.getAttributions();
  }
}
