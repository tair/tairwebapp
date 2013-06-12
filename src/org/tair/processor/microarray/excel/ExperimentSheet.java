// ------------------------------------------------------------------------------
// Copyright: (c) 2003 National Center for Genome Resources (NCGR)
// All Rights Reserved.
// $Revision: 1.4 $
// $Date: 2005/05/03 21:40:09 $
// ------------------------------------------------------------------------------

package org.tair.processor.microarray.excel;


import java.math.BigInteger;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import org.tair.bs.community.AttributionDelegate;
import org.tair.bs.community.AttributionTypeDelegate;
import org.tair.bs.community.BsAttribution;
import org.tair.bs.community.BsAttributionType;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.community.ListCommunity;
import org.tair.processor.genesymbol.TairObjectPublication;
import org.tair.processor.microarray.data.LoadableTairObjectKeyword;
import org.tair.processor.microarray.data.factory.CommunityFactory;
import org.tair.processor.microarray.data.factory.KeywordFactory;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcPublication;
import org.tair.utilities.TextConverter;


/**
 * ExperimentSheet is a concrete implementation of DataSheet that is used to
 * parse and validate data from the "Experiments" sheet of the microarray data
 * loading Excel sheet. ExperimentSheet parses data entered in this sheet,
 * transforms values from sheet into database objects, and populates an instance
 * of LoadableExpressionSet with data.
 */

public class ExperimentSheet extends DataSheet {

  // delimiter used for columns with multiple entries
  private final String DELIMITER = "|";

  // columns in Experiment sheet
  private final int NAME = 0;
  private final int EXTERNAL_ID = 1;
  private final int DESCRIPTION = 2;
  private final int IS_SERIES = 3;
  private final int SERIES_TYPE = 4;
  private final int ENVIRONMENT_IS_VARIABLE = 5;
  private final int PLANT_MATERIAL_IS_VARIABLE = 6;
  private final int PROBE_TYPE_IS_VARIABLE = 7;
  private final int HARVESTING_IS_VARIABLE = 8;
  private final int PUB_MED_ID = 9;
  private final int DATE = 10;
  private final int AUTHORS = 11;
  private final int CONTACT = 12;
  private final int CATEGORY = 13;
  private final int GOAL = 14;
  private final int EXPERIMENTAL_FACTOR = 15;
  private final int NUMBER_REP_SETS = 16;
  private final int NUMBER_SAMPLES = 17;
  private final int NUMBER_SLIDES = 18;

  // map of series types with value expected from Excel sheet
  // referencing rule value to use for db insert
  private Map seriesTypes;

  /**
   * Creates an instance of ExperimentSheet that can be used to parse the
   * "Experiments" data sheet of microarray Excel file.
   * 
   * @param sheetName Literal name of Experiments sheet as it appears in Excel
   *          data file. This name is used to retrieve Sheet object that
   *          contains all data as it appears in Excel file.
   */
  public ExperimentSheet(String sheetName) {
    super(sheetName);
    initializeSeriesTypes();
  }

  /**
   * Initializes list for validating expression set series type values with all
   * acceptable values from database rule.
   */
  private void initializeSeriesTypes() {
    seriesTypes = new HashMap();
    seriesTypes.put("dose response", "dose_response");
    seriesTypes.put("time course", "time_course");
  }

  /**
   * Parses Experiments data sheet from Excel file and populates expression set
   * object with data from sheet. As data is parsed, it is validated and
   * transformed into database objects that can be used to store newly created
   * expression set to the database.
   * 
   * <p>
   * References to member variables in super class (such as Sheet and expression
   * set) must have already been set before this method is called.
   * 
   * @param conn An active connection to the database for translating submitted
   *          sheet values to database values
   * @throws SQLException if a database error occurs
   */
  public void parseSheet(DBconnection conn) throws SQLException {

    // Set current row of data being processed to allow universal
    // visibility. Experiment sheet should have only one data row.
    // Skip header and use 2nd row (index 1) to get data
    setCurrentRow(1);

    // Create data cell objects for retrieving data for this
    // sheet and doing basic validation for each cell.
    ExcelDataCell[] dataCells = createDataCells();

    // retrieve and validate current row of data using
    // validation method defined in superclas
    Map rowData = validateDataCells(dataCells);

    populateExpressionSet(rowData);
    populatePublication(conn, rowData);
    populateCommunity(conn, rowData);
    populateKeywords(conn, rowData);
    populateDataCounts(rowData);

  }

  /**
   * Creates list of data cell objects used for retrieving and validating data
   * from Experiments Excel data sheet. Each cell object is populated with its
   * field name, the column index it exists at in the datasheet, and whether it
   * is a required field or not
   * 
   * @return Array of ExcelDataCell objects that can be used to retrieve and
   *         validate data from Experiments data sheet
   */
  private ExcelDataCell[] createDataCells() {
    ExcelDataCell[] cells = new ExcelDataCell[19];

    cells[0] = new ExcelDataCell("experiment name", NAME, true);

    // not used currently
    cells[1] = new ExcelDataCell("external id", EXTERNAL_ID, true);

    cells[2] = new ExcelDataCell("description", DESCRIPTION, true);
    cells[3] = new BooleanDataCell("is series", IS_SERIES, true);
    cells[4] = new ExcelDataCell("series type", SERIES_TYPE, false);
    cells[5] =
      new BooleanDataCell("environment is variable",
                          ENVIRONMENT_IS_VARIABLE,
                          true);

    cells[6] =
      new BooleanDataCell("plant material is variable",
                          PLANT_MATERIAL_IS_VARIABLE,
                          true);

    cells[7] =
      new BooleanDataCell("probe type is variable",
                          PROBE_TYPE_IS_VARIABLE,
                          true);

    cells[8] =
      new BooleanDataCell("harvesting is variable",
                          HARVESTING_IS_VARIABLE,
                          true);

    cells[9] =
      new DelimitedDataCell("pub med id", PUB_MED_ID, false, DELIMITER);

    cells[10] = new DateDataCell("experiment date", DATE, false);

    cells[11] = new DelimitedDataCell("authors", AUTHORS, true, DELIMITER);

    cells[12] = new DelimitedDataCell("contact", CONTACT, true, DELIMITER);

    cells[13] = new DelimitedDataCell("category", CATEGORY, true, DELIMITER);

    cells[14] = new DelimitedDataCell("goal", GOAL, true, DELIMITER);

    cells[15] =
      new DelimitedDataCell("experimental factor",
                            EXPERIMENTAL_FACTOR,
                            true,
                            DELIMITER);

    cells[16] = new IntegerDataCell("number rep. sets", NUMBER_REP_SETS, true);

    cells[17] = new IntegerDataCell("number samples", NUMBER_SAMPLES, true);

    cells[18] = new IntegerDataCell("number slides", NUMBER_SLIDES, true);

    return cells;
  }

  /**
   * Populates expression set object with experiment specific data entered in
   * Excel spreadsheet
   * 
   * @param rowData Map of column data for single row of Excel file
   */
  private void populateExpressionSet(Map rowData) {

    // set formatted version of name as original name, set name
    // as all upper case for case-insensitive searching
    String name = (String)rowData.get("experiment name");
    expressionSet.set_original_name(name);
    expressionSet.set_name(name.toUpperCase());

    expressionSet.set_description((String)rowData.get("description"));

    // ensure validity of series type submissions
    Boolean isSeries = (Boolean)rowData.get("is series");
    String seriesType = (String)rowData.get("series type");
    validateSeriesType(isSeries, seriesType);

    expressionSet.set_environment_is_variable((Boolean)rowData.get("environment is variable"));

    expressionSet.set_plant_material_is_variable((Boolean)rowData.get("plant material is variable"));

    expressionSet.set_probe_type_is_variable((Boolean)rowData.get("probe type is variable"));

    expressionSet.set_harvesting_is_variable((Boolean)rowData.get("harvesting is variable"));

    expressionSet.set_exp_date((java.util.Date)rowData.get("experiment date"));
  }

  /**
   * Validates series type data for expression set. Ensures that series type has
   * a value is is_series is true, and ensures that submitted value can be
   * translated to value acceptable to series type rule in the database.
   * Expression set will be set with submitted value for is series, and for
   * series type only if a valid entry is received.
   * 
   * @param isSeries Submitted value for is series
   * @param seriesType Submitted value for series type
   */
  private void validateSeriesType(Boolean isSeries, String seriesType) {

    expressionSet.set_is_series(isSeries);

    if (isSeries != null && isSeries.booleanValue()) {

      if (seriesType == null) {
        addError("series type",
                 "Series type cannot be null if is series is true");

        // else, translate series type to db rule value
      } else {
        if (seriesTypes.containsKey(seriesType)) {
          seriesType = (String)seriesTypes.get(seriesType);
          expressionSet.set_series_type(seriesType);
        } else {
          addError("series type", "Invalid series type: " + seriesType);
        }
      }
    }
  }

  /**
   * Creates publication objects from submitted pub med ids for expression set.
   * If pub med id is found in database, a new TairObjectPublication object will
   * be created and added to expression set.
   * 
   * <p>
   * If pub med id is not found, error message is added to collection of
   * messages
   * 
   * @param conn An active connection to the database
   * @param rowData Map of column data for single row of Excel file
   * @throws SQLException if a database error occurs while retrieving
   *           publication data
   */
  private void populatePublication(DBconnection conn, Map rowData)
      throws SQLException {

    String[] ids = (String[])rowData.get("pub med id");

    if (ids != null) {

      // set is_published flag on expression set if
      // pub med ids entered on excel sheet - do this regardless
      // of whether publication is found in TAIR db
      expressionSet.set_is_published(new Boolean(true));

      // translate pub med ids into reference ids and
      // create publication objects for each reference id
      // found for pub med id (should always only be one,
      // but allow for mutliples just in case)
      Long[] referenceIDs = null;
      for (int i = 0; i < ids.length; i++) {
        referenceIDs = TfcPublication.pubMedToReferenceID(conn, ids[i]);

        if (referenceIDs != null) {
          for (int j = 0; j < referenceIDs.length; j++) {
            TairObjectPublication pub =
              new TairObjectPublication(conn, referenceIDs[j]);

            expressionSet.addPublication(pub);
          }

          // add warning message if pub med id not found
        } else {
          addWarning("pub med id", "pub med id: " + ids[i] + " not found");
        }
      }
    }
  }

  /**
   * Creates community objects for community ids submitted for "authors" and
   * "contact" using CommunityFactory and adds "experiment_done_by" attributions
   * for found community data to expression set
   * 
   * <p>
   * If a community record is not found, error message is added to collection of
   * messages
   * 
   * @param conn An active connection to the database
   * @param rowData Map of column data for single row of Excel file
   * @throws SQLException if a database error occurs while retrieving community
   *           data
   */
  private void populateCommunity(DBconnection conn, Map rowData)
      throws SQLException {

    String[] authors = (String[])rowData.get("authors");

    if (authors != null) {
      // query attribution type for "experiment_done_by"
      String attribType = "experiment_done_by";
      AttributionTypeDelegate typeDelegate =
        CommunityDelegateFactory.getAttributionTypeDelegate();
      BsAttributionType type =
        typeDelegate.getAttributionTypeByAttributionType(attribType);
      BsAttribution attrib = null;
      ListCommunity community = null;

      // get factory for validating community records from
      // masterFactory in super class
      CommunityFactory communityFactory = masterFactory.getCommunityFactory();

      for (int i = 0; i < authors.length; i++) {

        // transform String to BigInteger -- log error if
        // invalid numeric value received
        BigInteger id = null;
        try {
          if (!TextConverter.isEmpty(authors[i])) {
          id = new BigInteger(authors[i]);
          } else {
            addWarning("authors", "Missing community id");
          }
        } catch (NumberFormatException nfe) {
          addWarning("authors", "Invalid community id: " + authors[i]);
        }

        if (id != null) {
          community = communityFactory.getCommunityRecord(id);

          if (community != null) {
            AttributionDelegate attribDelegate =
              CommunityDelegateFactory.getAttributionDelegate();
            Timestamp attributionDate =
              new Timestamp(System.currentTimeMillis());
            BigInteger tairObjectId =
              new BigInteger(expressionSet.get_tair_object_id().toString());
            // Create new attribution, generating id with null.
            attrib =
              attribDelegate.createAttribution(null,
                                               attributionDate,
                                               null,
                                               tairObjectId,
                                               type.getAttributionTypeId(),
                                               id);
            expressionSet.addAttribution(attrib);
          } else {

            // add as warning and allow curator discretion,
            // since community records may exist in production
            // without being in test
            addWarning("authors", "Community accession " + authors[i]
                                  + " not found");
          }
        }
      }
    }

  }

  /**
   * Creates keyword objects for values entered for experiment category,
   * experimental goals and experimental factors and adds them to expression
   * set.
   * 
   * <p>
   * If a keyword is not found, error message is added to collection of messages
   * 
   * @param conn An active connection to the database
   * @param rowData Map of column data for single row of Excel file
   * @throws SQLException if a database error occurs while retrieving keyword
   *           data
   */
  private void populateKeywords(DBconnection conn, Map rowData)
      throws SQLException {

    // get factory for validating keywords from
    // masterFactory in super class
    KeywordFactory keywordFactory = masterFactory.getKeywordFactory();

    String[] category = (String[])rowData.get("category");
    if (category != null) {
      populateCategory(conn, keywordFactory, category);
    }

    String[] goals = (String[])rowData.get("goal");
    if (goals != null) {
      populateExperimentalGoals(conn, keywordFactory, goals);
    }

    String[] factors = (String[])rowData.get("experimental factor");

    if (factors != null) {
      populateExperimentalFactors(conn, keywordFactory, factors);
    }
  }

  /**
   * Translates all keywords in submitted list into keyword objects using
   * KeywordFactory and adds to expression set as category keywords. If any
   * keyword is not found in the database, an error message is added to error
   * list.
   * 
   * @param conn An active connection to the database
   * @param keywordFactory Keyword factory to handle population of keyword
   *          objects
   * @param category Category keywords
   * @throws SQLException if a database error occurs
   */
  private void populateCategory(DBconnection conn,
                                KeywordFactory keywordFactory, String[] category)
      throws SQLException {

    LoadableTairObjectKeyword keyword = null;
    // ExpressionSet 's catagory_keywords are always of type "meth"
    for (int i = 0; i < category.length; i++) {
      keyword = keywordFactory.getTairObjectKeyword(conn, category[i], "meth");
      if (keyword != null) {
        expressionSet.addExperimentCategory(keyword);
      } else {
        String errorMessage =
          "keyword not found or multiple keywords found: " + category[i];
        addError("category", errorMessage);
      }
    }
  }

  /**
   * Translates all keywords in submitted list into keyword objects using
   * KeywordFactory and adds to expression set as experimental goal keywords. If
   * any keyword is not found in the database, an error message is added to
   * error list.
   * 
   * @param conn An active connection to the database
   * @param keywordFactory Keyword factory to handle population of keyword
   *          objects
   * @param category Category keywords
   * @throws SQLException if a database error occurs
   */
  private void populateExperimentalGoals(DBconnection conn,
                                         KeywordFactory keywordFactory,
                                         String[] goals) throws SQLException {

    LoadableTairObjectKeyword keyword = null;
    for (int i = 0; i < goals.length; i++) {
      keyword = keywordFactory.getTairObjectKeyword(conn, goals[i], "proc");
      if (keyword != null) {
        expressionSet.addExperimentalGoal(keyword);
      } else {
        String errorMessage =
          "keyword not found or multiple keywords found: " + goals[i];
        addError("goal", errorMessage);
      }
    }
  }

  /**
   * Translates all keywords in submitted list into keyword objects using
   * KeywordFactory and adds to expression set as experimental factor keywords.
   * If any keyword is not found in the database, an error message is added to
   * error list.
   * 
   * @param conn An active connection to the database
   * @param keywordFactory Keyword factory to handle population of keyword
   *          objects
   * @param category Category keywords
   * @throws SQLException if a database error occurs
   */
  private void populateExperimentalFactors(DBconnection conn,
                                           KeywordFactory keywordFactory,
                                           String[] factors)
      throws SQLException {

    LoadableTairObjectKeyword keyword = null;

    for (int i = 0; i < factors.length; i++) {

      keyword = keywordFactory.getTairObjectKeyword(conn, factors[i], "user");
      if (keyword == null) {
        keyword = keywordFactory.getTairObjectKeyword(conn, factors[i], "stru");
      }
      if (keyword != null) {
        expressionSet.addExperimentalFactor(keyword);
      } else {
        String errorMessage =
          "keyword not found or multiple keywords found: " + factors[i];
        addError("experimental factor", errorMessage);
      }
    }
  }

  /**
   * Populates expression set's data counts for total number of replicate sets
   * (hyb descriptions), data slides (hyb data) and bio samples. Individual data
   * objects for each element will be added in the parsing of ReplicateSet,
   * Samples and Slides data sheets.
   * 
   * @param rowData Map of column data for single row of Excel file
   */
  private void populateDataCounts(Map rowData) {
    Integer numberRepSets = (Integer)rowData.get("number rep. sets");
    if (numberRepSets != null) {
      expressionSet.setNumberHybDescriptions(numberRepSets.intValue());
    }

    Integer numberSamples = (Integer)rowData.get("number samples");
    if (numberSamples != null) {
      expressionSet.setNumberBioSamples(numberSamples.intValue());
    }

    Integer numberSlides = (Integer)rowData.get("number slides");
    if (numberSlides != null) {
      expressionSet.setNumberHybDataSlides(numberSlides.intValue());
    }

  }

}
