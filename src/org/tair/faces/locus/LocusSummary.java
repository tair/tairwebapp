/**
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.faces.locus;


import java.io.IOException;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import org.jboss.logging.Logger;
import org.tair.bs.locusdetail.BsLocusAnnotation;
import org.tair.bs.locusdetail.BsLocusDetail;
import org.tair.bs.locusdetail.BsLocusOtherName;
import org.tair.bs.locusdetail.LocusDetailDelegate;
import org.tair.bs.locusdetail.LocusdetailDelegateFactory;
import org.tair.faces.AbstractManagedBean;
import org.tair.querytools.LocusKeywordGroup;
import org.tair.utilities.StringList;

import com.poesys.bs.delegate.DelegateException;
import com.poesys.db.pk.NaturalPrimaryKey;


/**
 * A Faces managed bean that backs the Locus Summary display of a summary set of
 * information about the TAIR locus specified by name
 * 
 * @author Robert J. Muller
 */
@ManagedBean
@SessionScoped
public class LocusSummary extends AbstractManagedBean {
  /** Serial version UID for serializable class */
  private static final long serialVersionUID = 1L;
  /** Logger for this class */
  private static final Logger logger = Logger.getLogger(LocusSummary.class);
  /** the name of the locus to display */
  private String name;
  /** Delegate to use to get locus on demand (don't cache locus here) */
  transient LocusDetailDelegate delegate =
    LocusdetailDelegateFactory.getLocusDetailDelegate();
  NaturalPrimaryKey key = null;

  /**
   * Load the locus object using the locus id. This is a Faces action method
   * called by the PrettyFaces mapping to initialize the locus.
   * 
   * @return null (display the page)
   */
  public String load() {
    // Test-load the locus detail page object.
    try {
      BsLocusDetail locus = delegate.getLocusDetailByName(name);
      checkLocus(locus);
      // Save the primary key for cache lookup.
      key = (NaturalPrimaryKey)locus.getPrimaryKey();
    } catch (DelegateException e) {
      // Catch and log the error because PrettyFaces won't.
      logger.error("Delegate exception in PrettyFaces load of locus summary for "
                       + name + ": " + e.getMessage(),
                   e);
    } catch (RuntimeException e) {
      // Catch and log the error because PrettyFaces won't.
      logger.error("Runtime exception in PrettyFaces load of locus summary for "
                       + name + ": " + e.getMessage(),
                   e);
    }

    // Redisplay the page.
    return null;
  }

  /**
   * Set the name.
   * 
   * @param name a name
   */
  public void setName(String name) {
    this.name = name;
  }

  /**
   * Get the name.
   * 
   * @return a name
   */
  public String getName() {
    return name;
  }

  /**
   * Get the TAIR object id of the locus.
   * 
   * @return a TAIR object id
   */
  public Long getTairObjectId() {
    BsLocusDetail locus = delegate.getObject(key);
    return locus.getTairObjectId();
  }

  /**
   * Get a list of the other names for the locus.
   * 
   * @return the list of other names
   */
  public String getOtherNames() {
    BsLocusDetail locus = delegate.getObject(key);
    checkLocus(locus);
    // Extract the names into a list of strings.
    List<BsLocusOtherName> objects = locus.getOtherNames();
    List<String> names = new ArrayList<String>(objects.size());
    for (BsLocusOtherName object : objects) {
      names.add(object.getName());
    }
    return StringList.listToCommaString(names);
  }

  /**
   * Check whether the locus exists and throw an exception if not
   * 
   * @param locus the locus to check
   */
  private void checkLocus(BsLocusDetail locus) {
    if (locus == null) {
      throw new RuntimeException("No locus " + name + " available");
    }
  }

  /**
   * Get the representative gene description for the locus.
   * 
   * @return the gene description
   */
  public String getDescription() {
    BsLocusDetail locus = delegate.getObject(key);
    checkLocus(locus);
    return locus.getRepGeneDescription();
  }

  /**
   * Get the list of GO locus annotations.
   * 
   * @return the list of annotations
   */
  public List<BsLocusAnnotation> getAnnotations() {
    BsLocusDetail locus = delegate.getObject(key);
    checkLocus(locus);

    List<BsLocusAnnotation> list = extractGoAnnotations(locus);

    return list;
  }

  /**
   * Get the GO annotations of the locus in a list of annotation groups ordered
   * by category and relationship type. Each group contains a string that
   * implements a comma-separated list of <a> links for the keywords of the
   * annotation.
   * 
   * @return a list of locus annotation groups
   */
  public List<LocusKeywordGroup> getAnnotationGroups() {
    BsLocusDetail locus = delegate.getObject(key);
    checkLocus(locus);
    List<LocusKeywordGroup> groups = new ArrayList<LocusKeywordGroup>();
    List<BsLocusAnnotation> annotations = locus.getAnnotations();
    // Iterate through in order by category and relationship type.
    String currentCategory = null;
    String currentRelationshipType = null;
    List<String> keywords = null;
    for (BsLocusAnnotation annotation : annotations) {
      // GO groups only; they come first in the ordering of annotations.
      if (!annotation.getCategory().contains("GO")) {
        // No more GO categories, so ignore the rest.
        break;
      }

      // For GO annotations, build the category groups.
      if (currentCategory == null
          || !currentCategory.equals(annotation.getCategory())
          || !currentRelationshipType.equals(annotation.getRelationshipType())) {
        // Create the currently building group unless this is the first one.
        if (keywords != null) {
          groups.add(new LocusKeywordGroup(currentCategory,
                                           currentRelationshipType,
                                           keywords));
        }
        // Start the next group of keywords.
        currentCategory = annotation.getCategory();
        currentRelationshipType = annotation.getRelationshipType();
        keywords = new ArrayList<String>();
      }
      // Add the annotation keyword to the current group of keywords.
      keywords.add(annotation.getKeyword());
    }
    // Add the last group.
    if (keywords != null) {
      groups.add(new LocusKeywordGroup(currentCategory,
                                       currentRelationshipType,
                                       keywords));
    }
    return groups;
  }

  /**
   * Extract all the GO annotations from the list of all the annotations to the
   * locus.
   * 
   * @param locus the locus object from which to get the annotations
   * 
   * @return a new list of GO annotations
   */
  private List<BsLocusAnnotation> extractGoAnnotations(BsLocusDetail locus) {
    // Extract GO annotations into a list.
    List<BsLocusAnnotation> list = new ArrayList<BsLocusAnnotation>();
    for (BsLocusAnnotation annotation : locus.getAnnotations()) {
      if (annotation.getCategory().startsWith("GO")) {
        list.add(annotation);
      }
    }
    return list;
  }

  /**
   * Get the chromosome of the genes belonging to the locus.
   * 
   * @return a chromosome
   */
  public String getChromosome() {
    BsLocusDetail locus = delegate.getObject(key);
    checkLocus(locus);
    return locus.getChromosome();
  }

  /**
   * Get the "average" start position of the gene on the chromosome
   * 
   * @return the start position
   */
  public String getStart() {
    BsLocusDetail locus = delegate.getObject(key);
    checkLocus(locus);
    Long start = locus.getSpanStartPosition();
    if (start == null) {
      FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Null start position for locus", "Locus " + locus.getName());
      FacesContext.getCurrentInstance().addMessage(null, message);
      start = 0L;
    }
    return start.toString();
  }

  /**
   * Get the "average" end position of the gene on the chromosome
   * 
   * @return the end position
   */
  public String getEnd() {
    BsLocusDetail locus = delegate.getObject(key);
    checkLocus(locus);
    Long end = locus.getSpanEndPosition();
    if (end == null) {
      FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Null end position for locus", "Locus " + locus.getName());
      FacesContext.getCurrentInstance().addMessage(null, message);
      end = 0L;
    }
    return end.toString();
  }

  /**
   * Get the GBrowse gene-type argument, which is either null or ProteinCoding,
   * which GBrowse uses to format the proper gene model image.
   * 
   * @return null or ProteinCoding if there is a representative gene model type
   */
  public String getGeneType() {
    BsLocusDetail locus = delegate.getObject(key);
    checkLocus(locus);
    String type = null;
    if (locus.getRepGeneModelType() != null) {
      type = "ProteinCoding";
    }
    return type;
  }
  
  /**
   * Is this locus present in the database but obsolete? If it is obsolete,
   * various fields may be null (such as start/end).
   * 
   * @return true if obsolete, false if not
   */
  public Boolean getObsolete() {
    BsLocusDetail locus = delegate.getObject(key);
    checkLocus(locus);
    return locus.getObsolete();
  }

  /**
   * Re-establish the locus detail delegate after de-serialization.
   * 
   * @param in the input stream
   * @throws IOException when there is a problem reading the stream
   * @throws ClassNotFoundException when an object can't be instantiated
   */
  private void readObject(ObjectInputStream in) throws IOException,
      ClassNotFoundException {
    in.defaultReadObject();
    delegate = LocusdetailDelegateFactory.getLocusDetailDelegate();
  }
}
