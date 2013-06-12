/**
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.search.germplasm;

import java.math.BigInteger;

/**
 * A data transfer object (DTO) for rows in the Germplasm_Pedigree_wrk table
 * <p>
 * The working table contains these columns:
 * <ul>
 * <li>germplasm id</li>
 * <li>taxon id</li>
 * <li>species variant id</li>
 * <li>base name</li>
 * <li>abbrev name</li>
 * </ul>
 * </p>
 * 
 * @author Robert J. Muller
 */
public class GermplasmPedigree {
  private final BigInteger germplasmId;
  private final BigInteger taxonId;
  private final BigInteger speciesVariantId;
  private final String baseName;
  private final String abbrevName;
  
  /**
   * Create a GermplasmPedigree object.
   * @param germplasmId the unique identifier for a germplasm
   * @param taxonId the unique identifier for the taxon of the germplasm
   * @param speciesVariantId the unique identifier for the species variant of the germplasm
   * @param baseName the base (full) name of the species variant
   * @param abbrevName the abbreviated name of the species variant
   */
  public GermplasmPedigree(BigInteger germplasmId, BigInteger taxonId, BigInteger speciesVariantId, String baseName, String abbrevName) {
    this.germplasmId = germplasmId;
    this.taxonId = taxonId;
    this.speciesVariantId = speciesVariantId;
    this.baseName = baseName;
    this.abbrevName = abbrevName;
  }

  /**
   * Get the germplasmId.
   * @return a germplasmId
   */
  public BigInteger getGermplasmId() {
    return germplasmId;
  }

  /**
   * Get the taxonId.
   * @return a taxonId
   */
  public BigInteger getTaxonId() {
    return taxonId;
  }

  /**
   * Get the speciesVariantId.
   * @return a speciesVariantId
   */
  public BigInteger getSpeciesVariantId() {
    return speciesVariantId;
  }

  /**
   * Get the baseName.
   * @return a baseName
   */
  public String getBaseName() {
    return baseName;
  }

  /**
   * Get the abbrevName.
   * @return a abbrevName
   */
  public String getAbbrevName() {
    return abbrevName;
  }
}
