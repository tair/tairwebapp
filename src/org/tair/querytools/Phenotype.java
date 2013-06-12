/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;


import java.io.Serializable;
import java.sql.SQLException;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAnalysisReference;
import org.tair.tfc.TfcCommunication;
import org.tair.tfc.TfcGermplasmPhenotype;
import org.tair.tfc.TfcPhenotype;
import org.tair.tfc.TfcPublication;
import org.tair.tfc.TfcReference;


/**
 * Represents a Phenotype linked to a particular Germplasm (not a free-standing
 * phenotype as the name might indicate). The Phenotype contains the
 * TfcGermplasmPhenotype object that represents the link plus objects that
 * represent the reference for the link. A link reference may be a publication,
 * a communication, or an analysis reference. The reference itself is a
 * superclass object that has a type and table name. You can use that
 * information to figure out which sub-object is likely to have available
 * reference information of the appropriate type.
 */
public class Phenotype extends TfcPhenotype implements Serializable {
  /** Generated serial version UID required by Java. */
  private static final long serialVersionUID = -1060688047678720703L;

  private TfcGermplasmPhenotype germplasmPhenotype;
  private TfcReference reference = null;
  private TfcPublication publication = null;
  private TfcCommunication communication = null;
  private TfcAnalysisReference analysisReference = null;

  public Phenotype() {
    super();
  }

  /**
   * Create a germplasm-phenotype link by querying it from the database using
   * the specified keys.
   * 
   * @param connection the SQL connection to use to query the database
   * @param phenotype_id the unique id for a phenotype
   * @param germplasm_id the unique id for a germplasm
   * @throws SQLException if there is a query problem
   */
  public Phenotype(DBconnection connection, Long phenotype_id, Long germplasm_id)
      throws SQLException {
    super(connection, phenotype_id);

    this.germplasmPhenotype =
        new TfcGermplasmPhenotype(connection, germplasm_id, phenotype_id);

    /*
     * Long publication_id = this.germplasmPhenotype.get_publication_id(); if(
     * publication_id != null ) { Long reference_id =
     * TfcPublication.get_super_id( connection, publication_id );
     * this.publication = new TfcPublication( connection, reference_id ); }
     */
    // Get the reference, use it to get a publication, communication, or
    // analysis reference.
    Long reference_id = this.germplasmPhenotype.get_reference_id();
    if (reference_id != null) {
      reference = new TfcReference(connection, reference_id);
      String type = reference.get_reference_type();

      // Based on the type, create the appropriate subclass data member.
      if (type.compareToIgnoreCase("publication") == 0) {
        publication = new TfcPublication(connection, reference_id);
      } else if (type.compareToIgnoreCase("communication") == 0) {
        communication = new TfcCommunication(connection, reference_id);
      } else if (type.compareToIgnoreCase("analysis_reference") == 0) {
        analysisReference = new TfcAnalysisReference(connection, reference_id);
      } else {
        // unsupported reference type, set the ref to null.
        reference = null;
      }
    }

  }

  /**
   * @return can be null (e.g. default constructor used), else a
   *         TfcGermplasmPhenotype for the pivot table entry which was used to
   *         construct the object. (The TfcGermplasmPhenotype contains the
   *         associated publication id, if any.)
   */
  public TfcGermplasmPhenotype get_germplasm_phenotype() {
    return (this.germplasmPhenotype);
  }

  /**
   * Get any publication associated with the germplasm-phenotype link. The
   * publication may be null, but one of the other reference types may contain a
   * reference. Check whether there is a reference, then go through all three or
   * use the reference type to figure out what kind of reference to get.
   * 
   * @return a TfcPublication for the link, or null if there is no publication
   *         for this link
   */
  public TfcPublication get_publication() {
    return (publication);
  }

  /**
   * Get any communication associated with the germplasm-phenotype link. The
   * communication may be null, but one of the other reference types may contain
   * a reference. Check whether there is a reference, then go through all three
   * or use the reference type to figure out what kind of reference to get.
   * 
   * @return a TfcCommunication for the link, or null if there is no
   *         communication for this link
   */
  public TfcCommunication get_communication() {
    return (communication);
  }

  /**
   * Get any analysis reference associated with the germplasm-phenotype link.
   * The analysis reference may be null, but one of the other reference types
   * may contain a reference. Check whether there is a reference, then go
   * through all three or use the reference type to figure out what kind of
   * reference to get.
   * 
   * @return a TfcAnalysisReference for the link, or null if there is no
   *         analysis reference for this link
   */
  public TfcAnalysisReference get_analysis_reference() {
    return (analysisReference);
  }

  /**
   * Get any reference associated with the germplasm-phenotype link. The
   * reference may be null, indicating there is no reference for the link.
   * Otherwise, the reference might be a communication, a publication, or an
   * analysis reference. Use the appropriate method to retrieve the right kind
   * of Tfc object. You can use the reference.get_reference_type() method to see
   * what kind of reference is actually associated with the link.
   * 
   * @return a TfcReference for the link, or null if there is no reference
   */
  public TfcReference get_reference() {
    return (reference);
  }
}
