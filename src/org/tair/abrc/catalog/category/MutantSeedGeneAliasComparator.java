// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// -----------------------------------------------------------------------
package org.tair.abrc.catalog.category;


import java.util.Comparator;

import org.apache.log4j.Logger;
import org.tair.tfc.TfcGeneAlias;


/**
 * MutantSeedGeneAliasComparator is a custom comparator for sorting aliases of
 * genes associated to polymorphisms associated to germplasm, associated to
 * stock in mutant seed category. This comparator sorts gene aliases by their
 * type then by their alias. Sorting aliases using this comparator means that
 * several layers of wrapper methods must be written to access gene alias
 * collection from CatalogStock, but the flexibility allowed by using any
 * comparator is worth the overhead.
 */

public class MutantSeedGeneAliasComparator implements Comparator<TfcGeneAlias> {
  private static final Logger logger =
    Logger.getLogger(MutantSeedGeneAliasComparator.class);

  /**
   * Compares two TfcGeneAlias objects and sorts them by alias type, then by the
   * alias itself using a string comparison.
   * 
   * @return -1 if o1 should sort before o2, 1 if o2 should sort before o1, or 0
   *         if items are equal
   */
  public int compare(TfcGeneAlias o1, TfcGeneAlias o2) {

    TfcGeneAlias alias_1 = (TfcGeneAlias)o1;
    TfcGeneAlias alias_2 = (TfcGeneAlias)o2;

    String aliasType_1 = alias_1.get_alias_type();
    String aliasType_2 = alias_2.get_alias_type();

    int result = aliasType_1.compareTo(aliasType_2);

    // If the type are the same order by the actual alias
    if (result == 0) {
      result = alias_1.get_alias().compareTo(alias_2.get_alias());
    }

    return result;
  }

  /**
   * For unit testing only
   * @param args 
   */
  public static void main(String[] args) {
    try {

      org.tair.tfc.DBconnection conn = new org.tair.tfc.DBconnection();
      java.util.TreeSet<TfcGeneAlias> lst =
        new java.util.TreeSet<TfcGeneAlias>(new MutantSeedGeneAliasComparator());

      int[] ids =
        { 1001117990, 1001117994, 1001117995, 1001117996, 1001117999,
         1001118000, 1001118004, 1001118005 };

      logger.debug("****** MutantSeedGeneAliasComparator test ****** ");

      for (int i = 0; i < ids.length; i++) {
        Long id = new Long(ids[i]);
        TfcGeneAlias alias = new TfcGeneAlias(conn, id);
        logger.debug("adding type:"
                     + alias.get_alias_type()
                     + " alias:"
                     + alias.get_alias());
        lst.add(alias);
      }

      logger.debug("****** ordered? ****** ");

      for (TfcGeneAlias alias : lst) {
        logger.debug("type:"
                     + alias.get_alias_type()
                     + " alias:"
                     + alias.get_alias());
      }

      logger.debug("****** MutantSeedGeneAliasComparator test Complete!****** ");

    } catch (Exception e) {
      e.printStackTrace();
    }
  }

}
