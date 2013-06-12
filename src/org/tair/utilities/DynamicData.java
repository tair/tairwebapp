//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.10 $
// $Date: 2005/03/11 00:07:03 $
//------------------------------------------------------------------------------

package org.tair.utilities;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


/**
 * DynamicData is a class to provide client code with collections of data
 * that are periodically refreshed from the data by DataPopulatorThread.  
 * This is useful for cases where a search form menu options are dynamically
 * created each time from valid values in the database. DynamicData contains
 * an instance of DataPopulatorThread, and queries the Thread object directly
 * for the data client code is requesting.  DataPopulatorThread is responsible
 * for periodically refreshing the data from the db - the actual interval
 * is set in WebApp.
 *
 * <p>
 * DynamicData creates its instance of DataPopulatorThread and calls its start()
 * method upon initialization.
 */

public class DynamicData implements java.util.EventListener {
  
    private static DataPopulatorThread populator;

    static { // create populator thread and start it running
	populator = new DataPopulatorThread();
	populator.start();
    }

    /**
     * Retrieves a collection of taxons that are associated to at least
     * one species variant record in the database.  Taxons are returned in a map
     * with taxon id referencing the taxon's scientific name.  Data is retrieved
     * from DataPopulatorThread, which periodically refreshes the data from the 
     * database
     *
     * @return Map containing taxons associated to species variant records as
     * a <code>String</code> taxon_id referencing a <code>String</code> 
     * scientific name
     * @throws SQLException if a database error occurs
     */
    public static Map<String, String> getSpeciesVariantTaxons() throws SQLException {
	return populator.getSpeciesVariantTaxons();
    }

    /**
     * Retrieves a list of taxons that are associated to at least one
     * species variant record in the database for use in searching for germplasms.
     * The list contains an ordered list of taxons, each of which contains a
     * scientific name and a taxon id. The list is ordered alphabetically with
     * Arabidopsis thaliana at the top.
     * 
     * @return List containing taxons
     * @throws SQLException if a database error occurs
     */
    public static List<DataPopulatorThread.Taxon> getGermplasmTaxons() 
    throws SQLException {
      return populator.getGermplasmTaxons();
    }

  /**
   * Retrieves a collection of taxons that are associated to at least one clone
   * record in the database, as well as any associated aliases for taxon
   * records. Taxons are returned in a map with taxon's scientific name
   * referencing the taxon id - this is done so that the scientific name key can
   * be used for easy alphabetical ordering.
   * 
   * @return a Map containing taxons associated to clone records as
   *         <code>String</code> taxon_id referencing a <code>String</code>
   *         scientific name
   * @throws SQLException if a database error occurs
   */
    public static Map<String, String> getCloneTaxons() throws SQLException {
    return populator.getCloneTaxons();
    }
  
    /**
     * Retrieves a collection of species variants that are associated to at 
     * least one germplasm record in the database.  Species variants are 
     * returned in a map with base name as both the key and value. Data is 
     * retrieved from DataPopulatorThread, which periodically refreshes the 
     * data from the database
     *
     * @return Array of species variant base names associated to germplasm 
     * records
     * @throws SQLException if a database error occurs
     */
    public static String[] getGermplasmSpeciesVariants() throws SQLException {
	return populator.getGermplasmSpeciesVariants();
    }

    /**
     * Retrieves a collection of countries that at least one record in the 
     * species variant table was collected in.  Countries are returned as a 
     * List containing country names as a String. Data is retrieved from 
     * DataPopulatorThread which periodically refreshes the data from the
     * database
     *
     * @return Array of distinct country names in SpeciesVariant
     * @throws SQLException if a database error occurs
     */
    public static String[] getSpeciesVariantCountries() throws SQLException {
	return populator.getSpeciesVariantCountries();
    }


    /**
     * Retrieves a org.tair.utilities.DefinitionsLookup object that can be
     * used to lookup a definition_id of any non-null definition.  Data
     * is refresh()ed by DataPopulatorThread periodically from the
     * database.
     *
     * @return A org.tair.utilities.DefinitionsLookup object.
     * @throws SQLException if a database error occurs
     */
    public static DefinitionsLookup getDefinitionsLookup() throws SQLException {
	return populator.getDefinitionsLookup();
    }

    /**
     * Retrieves a list of stock types that have at least stock order.
     *
     * @return Array of distinct stock types that have orders for them.
     * @throws SQLException if a database error occurs
     */
    public static String[] getStockOrderTypes() throws SQLException {
	return populator.getStockOrderTypes();
    }



    /**
     * Retrieves a collection of keywords that are associated to at least one
     * ExpressionSet with relationship type of "experiment category".  
     *
     * @return Map of experiment category keywords as a <code>Map</code> with
     * keyword <code>String</code> referencing a <code>String</code> keyword id
     * @throws SQLException if a database error occurs
     */
    public static Map<String,String> getExperimentCategories() throws SQLException {
	return populator.getExperimentCategories();
    }


    /**
     * Retrieves a collection of keywords that are associated to Protocol
     *
     * @return Map of Protocol keywords as a <code>Map</code> with
     * keyword <code>String</code> 
     * referencing a <code>String</code> keyword id
     * @throws SQLException if a database error occurs
     */
    public static Map<String, String> getProtocolKeywords() throws SQLException {
	return populator.getProtocolKeywords();
    }

}
