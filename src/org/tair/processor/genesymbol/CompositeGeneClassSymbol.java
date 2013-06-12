// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.genesymbol;


import java.io.ObjectInputStream;
import java.math.BigInteger;
import java.sql.*;
import java.util.*;
import java.text.*;
import org.tair.tfc.*;
import org.tair.utilities.*;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.db.community.CommunityFactory;
import org.tair.querytools.*;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * CompositeGeneClassSymbol is a concrete class that represents all information
 * for a GeneClassSymbol's record. CompositeGeneClassSymbol contains:
 * <ul>
 * <li>All attributions associated with this gene class symbol
 * <li>All Publications this GeneClassSymbol associates through TairObje_Ref
 * table
 * <li>All loci this GeneClassSymbol associates through GeneClassSymbol_Locus
 * table
 * </ul>
 * 
 */

public class CompositeGeneClassSymbol extends TfcGeneClassSymbol {

  private TairObjectPublicationCollection publications;
  private GeneSymbolLocusCollection loci;
  private BigInteger communityId;

  public CompositeGeneClassSymbol() {
    super();

    publications = new TairObjectPublicationCollection();
    loci = new GeneSymbolLocusCollection();
  }

  public CompositeGeneClassSymbol(DBconnection conn, Long tair_object_id)
      throws SQLException {
    super(conn, tair_object_id);
    get_information(conn, tair_object_id);

  }

  /**
   * Retrieves all information for GeneClassSymbol with supplied tair_object_id.
   * 
   * @param conn An active connection to the database
   * @param tair_object_id to retrieve data for
   * @exception SQLException thrown if a database error occurs while retrieving
   *              data
   */
  public void get_information(DBconnection conn, Long tair_object_id)
      throws SQLException {
    publications = new TairObjectPublicationCollection(conn, tair_object_id);
    loci = new GeneSymbolLocusCollection(conn, get_gene_class_symbol_id());
    if (get_maintainer_id() != null) {
      OrganizationDelegate delegate =
        CommunityDelegateFactory.getOrganizationDelegate();
      IPrimaryKey key =
        CommunityFactory.getOrganizationPrimaryKey(get_maintainer_id());
      BsOrganization org = 
        delegate.getOrganizationByCommunityId(get_maintainer_id());
      if (org == null) {
        throw new RuntimeException("No organization found with community id "
                                   + get_maintainer_id());
      }
      communityId = org.getCommunityId();
    }
  }

  /**
   * set submitter's associated organization
   */
  public void setAssociatedOrg(BsOrganization org) {
    this.communityId = org.getCommunityId();
  }

  public BsOrganization getAssociatedOrg() {
    OrganizationDelegate delegate =
      CommunityDelegateFactory.getOrganizationDelegate();
    return delegate.getOrganizationByCommunityId(communityId);
  }

  /**
   * get submitter's associated organization's name
   * 
   * @return String submitter's associated organization's name
   */

  public String getAssociatedOrgName() {
    BsOrganization org = getAssociatedOrg();
    return (org != null && org.getName() != null) ? org.getName() : null;
  }

  public BigInteger getAssociatedOrgId() {
    BsOrganization org = getAssociatedOrg();
    return (org != null && org.getOrganizationId() != null) ? org.getOrganizationId()
        : null;
  }

  /**
   * Get submiiter's associated organization's contact person ;s community_id
   * 
   * @return Long contact person's community id
   */
  public BigInteger getAssociatedOrgContactPerson() {
    BigInteger id = null;
    BsOrganization org = getAssociatedOrg();
    try {
      id =
        (org != null && org.getContactPerson().getCommunityId() != null) ? org.getContactPerson().getCommunityId()
            : null;
    } catch (SQLException e) {
      // Problem lazily loading contact person; just return null
    }
    return id;
  }

  /**
   * Store this CompositeGeneClassSymbol object into database, sequentially, it
   * will store GeneClassSymbol into GeneClassSymbol table, store references
   * into TairObject_reference table, store loci into GeneClassSymbol_locus
   * table, if any of the steps fails, roll back
   * 
   * @param conn An active connection to the database
   */
  public void store(DBconnection conn) throws SQLException {

    try {
      // take off auto-commit to do storing as a single transaction
      conn.remove_auto_commit_mode();
      BsOrganization org = getAssociatedOrg();
      if (org != null && org.getCommunityId() != null) {
        set_maintainer_id(org.getCommunityId());
      }
      super.store(conn);

      loci.store(conn);
      publications.store(conn);
      conn.commit(); // commit changes if no problems

    } catch (Exception e) { // rollback changes if any errors occur
      if (conn != null) {
        conn.rollback();
      }
      e.printStackTrace();
      // propagate exception as SQLException so rest of world knows about error
      throw new SQLException("Error storing GeneClassSymbol: " + e.getMessage());

    } finally {
      if (conn != null) {
        conn.set_auto_commit_mode(); // set auto commit back on
      }
    }
  }

  public void set_gene_class_symbol_id(Long gene_class_symbol_id) {
    super.set_gene_class_symbol_id(gene_class_symbol_id);
    if (hasLoci()) {
      loci.set_gene_class_symbol_id(gene_class_symbol_id);
    }
  }

  public void set_tair_object_id(Long tair_object_id) {
    super.set_tair_object_id(tair_object_id);
    if (hasPublication()) {
      publications.set_tair_object_id(tair_object_id);
    }
  }

  public TairObjectPublicationCollection getPublications() {
    return publications;
  }

  public GeneSymbolLocusCollection getLoci() {
    return loci;
  }

  public void addPublication(TairObjectPublication pub) {
    if (!publications.contains(pub)) {
      publications.add(pub);
    }
  }

  public void addLocus(GeneSymbolLocus locus) {
    if (!loci.contains(locus)) {
      loci.add(locus);
    }
  }

  public void removeLocus(GeneSymbolLocus locus) {
    if (loci.contains(locus)) {
      loci.remove(locus);
    }
  }

  /**
   * Returns loci as an iterator of GeneSymbolLocus objects
   */
  /*
   * public Iterator getLoci() { return ( hasLoci() ) ? loci.iterator() : null;
   */

  public boolean hasLoci() {
    return (loci != null && !loci.isEmpty());
  }

  public boolean hasPublication() {
    return (publications != null && !publications.isEmpty());
  }

  public void removePublication(TairObjectPublication pub) {
    if (publications.contains(pub)) {
      publications.remove(pub);
    }
  }

}
