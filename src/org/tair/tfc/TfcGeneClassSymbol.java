// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.12 $
// $Date: 2004/06/18 16:03:19 $
// ------------------------------------------------------------------------------
package org.tair.tfc;


import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.tair.bs.community.AttributionDelegate;
import org.tair.bs.community.AttributionTypeDelegate;
import org.tair.bs.community.BsAttribution;
import org.tair.bs.community.BsAttributionType;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.PersonDelegate;
import org.tair.utilities.Debugger;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

import com.poesys.bs.delegate.DelegateException;


/**
 * This class maps to the GeneClassSymbol table in the tair database. Each
 * instance maps one row of data in GeneClassSymbol table. Each data object maps
 * to one field of a row in the table. Each field has one set method and one get
 * method for accessing from outside of class.
 */

public class TfcGeneClassSymbol extends TfcTairObject {

  /**
   * Generated serial version UID for serializable object
   */
  private static final long serialVersionUID = 7027996211715101912L;
  private Long gene_class_symbol_id;
  private String symbol;
  private String descriptive_symbol;
  private String description;
  private Boolean has_mutant_phenotype;
  private String mutant_phenotype_class;
  private String comments;
  private java.util.Date reservation_date;
  private java.util.Date date_last_modified;
  private String submitter_info;
  private String status;
  private String associated_loci_count;
  private BigInteger submitter_id;
  private BigInteger maintainer_id;
  private BigInteger approver_id;
  private BigInteger reviewer_id;
  private String original_name;
  private java.util.Date date_entered;

  private String submitter_name;

  // these are used when you want to get ALL the names and not just one
  private ArrayList<String> all_submitter_names;
  private ArrayList<String> all_reviewer_names;
  private ArrayList<BigInteger> all_submitter_ids = new ArrayList<BigInteger>();
  private ArrayList<BigInteger> all_maintainer_ids =
    new ArrayList<BigInteger>();
  private ArrayList<BigInteger> all_approver_ids = new ArrayList<BigInteger>();
  private ArrayList<BigInteger> all_reviewer_ids = new ArrayList<BigInteger>();
  private ArrayList<java.sql.Date> all_submitter_dates =
    new ArrayList<java.sql.Date>();
  private ArrayList<java.sql.Date> all_maintainer_dates =
    new ArrayList<java.sql.Date>();
  private ArrayList<java.sql.Date> all_approver_dates =
    new ArrayList<java.sql.Date>();
  private ArrayList<java.sql.Date> all_reviewer_dates =
    new ArrayList<java.sql.Date>();

  /**
   * Creates an empty instance of TfcGeneClassSymbol
   */
  public TfcGeneClassSymbol() {
    super();
  }

  /**
   * Creates an instance of TfcGeneClassSymbol that contains all data for the
   * GeneClassSymbol with the submitted tair object id
   * 
   * @param conn An active connection to the database
   * @param tair_object_id ID to retreive data for
   * @throws RecordNotFoundException if no row found for submitted id
   * @throws SQLException in the case of an invalid operation or database error
   */
  public TfcGeneClassSymbol(DBconnection conn, Long tair_object_id)
      throws RecordNotFoundException, SQLException {

    super(conn, tair_object_id);
    setAttributionInfor(conn);
  }

  /**
   * Implements abstract method in superclass to return "GeneClassSymbol" as
   * name of database table this class represents.
   * 
   * @return Name of database table this class represents
   */
  public final String getTableName() {
    return "GeneClassSymbol";
  }

  /**
   * Implements abstract method in superclass to return "tair_object_id" as name
   * of primary key column to use when creating SQL statement for object
   * population.
   * 
   * @return Name of primary key column to use in SQL SELECT statement
   */
  public final String getKeyColumn() {
    return "tair_object_id";
  }

  /**
   * Implements abstract method in superclass to return full list of all
   * GeneClassSymbol specific columns to be included in SQL SELECT statement
   * when populating object.
   * 
   * @return String array of all GeneClassSymbol specific columns to include in
   *         SELECT statement when populating object.
   */
  public final String[] getColumns() {
    String[] localClassColumns =
      new String[] { "gene_class_symbol_id", "tair_object_id", "symbol",
                    "descriptive_symbol", "description",
                    "has_mutant_phenotype", "mutant_phenotype_class",
                    "comments", "reservation_date", "date_last_modified",
                    "status", "submitter_info", "date_entered",
                    "original_name", "associated_loci_count" };

    return localClassColumns;
  }

  /**
   * Retrieves GeneClassSymbol specific data from result set and stores in
   * member variables.
   * 
   * @param results ResultSet to populate member variables with
   * @throws SQLException if a database error occurs
   */
  public final void populate(ResultSet results) throws SQLException {
    long id = results.getLong("gene_class_symbol_id");
    if (!results.wasNull()) {
      this.gene_class_symbol_id = new Long(id);
    }

    this.symbol = results.getString("symbol");
    this.descriptive_symbol = results.getString("descriptive_symbol");
    this.has_mutant_phenotype =
      TextConverter.stringToBoolean(results.getString("has_mutant_phenotype"));

    this.mutant_phenotype_class = results.getString("mutant_phenotype_class");

    this.comments = results.getString("comments");
    this.reservation_date = results.getDate("reservation_date");
    this.description = results.getString("description");
    this.date_last_modified = results.getDate("date_last_modified");
    this.status = results.getString("status");
    this.submitter_info = results.getString("submitter_info");
    this.associated_loci_count = results.getString("associated_loci_count");

    set_original_name(results.getString("original_name"));
    set_date_entered(results.getDate("date_entered"));
  }

  /**
   * set the attribution information for this gene class symbol valid
   * attribution type are: submitted_by (for the person who submitted this
   * symbol) , maintained_by (for submitter's lab id, might different than
   * person't affiliated lab), approved_by(curator's community id who apporved
   * this symbol), reviewd_by( curator's community's id who reviewed this symbol
   * but didn't approve)
   * 
   * @param conn An active connection to the database
   * @throws SQLException in the case of an invalid operation or database error
   */

  public void setAttributionInfor(DBconnection conn) throws SQLException {

    submitter_id = setAttributionInfor(conn, "submitted_by");
    all_submitter_ids = setAllAttributionInfor(conn, "submitted_by");
    submitter_name = getPersonNameFromId(conn, submitter_id);
    all_submitter_names = getAllPersonNameFromId(conn, all_submitter_ids);
    maintainer_id = setAttributionInfor(conn, "maintained_by");
    all_maintainer_ids = setAllAttributionInfor(conn, "maintained_by");
    approver_id = setAttributionInfor(conn, "approved_by");
    all_approver_ids = setAllAttributionInfor(conn, "approved_by");
    reviewer_id = setAttributionInfor(conn, "reviewed_by");
    all_reviewer_ids = setAllAttributionInfor(conn, "reviewed_by");
    all_reviewer_names = getAllPersonNameFromId(conn, all_reviewer_ids);
    all_submitter_dates = setAllAttributionDatesr(conn, "submitted_by");
    all_maintainer_dates = setAllAttributionDatesr(conn, "maintained_by");
    all_approver_dates = setAllAttributionDatesr(conn, "approved_by");
    all_reviewer_dates = setAllAttributionDatesr(conn, "reviewed_by");
  }

  /**
   * Get multiple users names my their community_id
   * 
   * @param conn An active connection to the database
   * @param a list of community_ids
   * @throws SQLException in the case of an invalid operation or database error
   */
  public ArrayList<String> getAllPersonNameFromId(DBconnection conn,
                                                  ArrayList<BigInteger> ids)
      throws SQLException {
    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();

    String name = null;
    ArrayList<String> person_names = new ArrayList<String>();
    for (int i = 0; i < ids.size(); i++) {
      if (ids.get(i) != null) {
        BigInteger id = new BigInteger(ids.get(i).toString());
        BsPerson person = delegate.getPersonByCommunityId(id);
        if (person.getFirstName() != null) {
          name = person.getFirstName();
        }
        if (person.getMiddleName() != null) {
          name += (" " + person.getMiddleName());
        }
        if (person.getLastName() != null) {
          name += (" " + person.getLastName());
        }
        person_names.add(name);
      }
    }
    return person_names;
  }

  /**
   * Get a community member 's name by member's community_id
   * 
   * @param conn An active connection to the database
   * @param id member's community_id
   * @throws SQLException in the case of an invalid operation or database error
   */
  public String getPersonNameFromId(DBconnection conn, BigInteger id)
      throws SQLException {
    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    String name = null;

    if (id != null) {
      BsPerson person = delegate.getPersonByCommunityId(id);
      if (person.getFirstName() != null) {
        name = person.getFirstName();
      }
      if (person.getMiddleName() != null) {
        name += (" " + person.getMiddleName());
      }
      if (person.getLastName() != null) {
        name += (" " + person.getLastName());
      }
    }
    return name;
  }

  /**
   * A private helper function to populate ALL the dates of an attribution of a
   * single symbol
   * 
   * @param conn An active connection to the database
   * @param attribution_type
   * @throws SQLException in the case of an invalid operation or database error
   */
  private ArrayList<java.sql.Date> setAllAttributionDatesr(
                                                           DBconnection conn,
                                                           String attribution_type)
      throws SQLException {
    ArrayList<java.sql.Date> ids = new ArrayList<java.sql.Date>();
    if (get_tair_object_id() != null) {
      String query =
        "SELECT a.attribution_date from Attribution a JOIN AttributionType at ON a.attribution_type_id = at.attribution_type_id WHERE at.attribution_type = ? AND a.tair_object_id = ?";
      conn.setQuery(query);
      conn.setQueryVariable(1, attribution_type);
      conn.setQueryVariable(2, get_tair_object_id());
      ResultSet results = conn.getResultSet();
      while (results.next()) {
        java.sql.Date id = results.getDate("attribution_date");
        ids.add(id);
      }
      conn.releaseResources();
    }
    return ids;
  }

  /**
   * A private helper function to populate ALL the attributions of a single
   * symbol
   * 
   * @param conn An active connection to the database
   * @param attribution_type
   * @throws SQLException in the case of an invalid operation or database error
   */
  private ArrayList<BigInteger> setAllAttributionInfor(DBconnection conn,
                                                       String attribution_type)
      throws SQLException {
    ArrayList<BigInteger> ids = new ArrayList<BigInteger>();
    if (get_tair_object_id() == null) {
      return null;
    }
    String query =
      "SELECT community_id from Attribution a JOIN AttributionType at ON a.attribution_type_id = at.attribution_type_id WHERE at.attribution_type = ? AND a.tair_object_id = ?";
    conn.setQuery(query);
    conn.setQueryVariable(1, attribution_type);
    conn.setQueryVariable(2, get_tair_object_id());
    ResultSet results = conn.getResultSet();
    while (results.next()) {
      BigInteger id = results.getBigDecimal("community_id").toBigInteger();
      ids.add(id);
    }
    conn.releaseResources();
    return ids;
  }

  /**
   * A private helper function to populate the symbol's attribution
   * 
   * @param conn An active connection to the database
   * @param attribution_type
   * @throws SQLException in the case of an invalid operation or database error
   */
  private BigInteger setAttributionInfor(DBconnection conn,
                                         String attribution_type)
      throws SQLException {
    BigInteger id = null;
    if (get_tair_object_id() != null) {
      String query =
        "SELECT community_id from Attribution a JOIN AttributionType at ON a.attribution_type_id = at.attribution_type_id WHERE at.attribution_type = ? AND a.tair_object_id = ?";
      conn.setQuery(query);
      conn.setQueryVariable(1, attribution_type);
      conn.setQueryVariable(2, get_tair_object_id());
      ResultSet results = conn.getResultSet();
      if (results.next()) {
        id = results.getBigDecimal("community_id").toBigInteger();
      }
      conn.releaseResources();
    }
    return id;
  }

  public void set_gene_class_symbol_id(Long value) {
    gene_class_symbol_id = value;
  }

  public Long get_gene_class_symbol_id() {
    return gene_class_symbol_id;
  }

  public void set_symbol(String value) {
    this.symbol = value;
  }

  public String get_symbol() {
    return symbol;
  }

  public void set_descriptive_symbol(String value) {
    descriptive_symbol = value;
  }

  public String get_descriptive_symbol() {
    return descriptive_symbol;
  }

  public void set_description(String value) {
    description = value;
  }

  public String get_description() {
    return description;
  }

  public void set_has_mutant_phenotype(Boolean value) {
    has_mutant_phenotype = value;
  }

  public Boolean get_has_mutant_phenotype() {
    return has_mutant_phenotype;
  }

  public void set_mutant_phenotype_class(String value) {
    mutant_phenotype_class = value;
  }

  public String get_mutant_phenotype_class() {
    return mutant_phenotype_class;
  }

  public void set_comments(String value) {
    comments = value;
  }

  public String get_comments() {
    return comments;
  }

  public void set_reservation_date(java.util.Date value) {
    reservation_date = value;
  }

  public java.util.Date get_reservation_date() {
    return reservation_date;
  }

  public void set_date_last_modified(java.util.Date value) {
    date_last_modified = value;
  }

  public java.util.Date get_date_last_modified() {
    return date_last_modified;
  }

  public void set_status(String value) {
    status = value;
  }

  public String get_status() {
    return status;
  }

  public void set_submitter_info(String value) {
    submitter_info = value;
  }

  public String get_submitter_info() {
    return submitter_info != null ? submitter_info : submitter_name;
  }

  public void set_associated_loci_count(String count) {
    associated_loci_count = count;
  }

  public String get_associated_loci_count() {
    return associated_loci_count;
  }

  public void set_submitter_id(BigInteger value) {
    this.submitter_id = value;
  }

  public void set_submitter_name(String value) {
    this.submitter_name = value;
  }

  public void set_all_maintainer_ids(ArrayList<BigInteger> value) {
    this.all_maintainer_ids = value;
  }

  public void set_all_submitter_ids(ArrayList<BigInteger> value) {
    this.all_submitter_ids = value;
  }

  public void set_all_approver_ids(ArrayList<BigInteger> value) {
    this.all_approver_ids = value;
  }

  public void set_all_reviewer_ids(ArrayList<BigInteger> value) {
    this.all_reviewer_ids = value;
  }

  public void set_all_submitter_names(ArrayList<String> value) {
    this.all_submitter_names = value;
  }

  public void set_all_reviewer_names(ArrayList<String> value) {
    this.all_reviewer_names = value;
  }

  public void set_maintainer_id(BigInteger value) {
    this.maintainer_id = value;
  }

  public void set_approver_id(BigInteger value) {
    this.approver_id = value;
  }

  public void set_reviewer_id(BigInteger id) {
    this.reviewer_id = id;
  }

  public void set_submitter_ids(ArrayList<BigInteger> id) {
    this.all_submitter_ids = id;
  }

  public void set_all_submitter_dates(ArrayList<java.sql.Date> value) {
    this.all_submitter_dates = value;
  }

  public void set_all_maintainer_dates(ArrayList<java.sql.Date> value) {
    this.all_maintainer_dates = value;
  }

  public void set_all_reviewer_dates(ArrayList<java.sql.Date> value) {
    this.all_reviewer_dates = value;
  }

  public void set_all_approver_dates(ArrayList<java.sql.Date> value) {
    this.all_approver_dates = value;
  }

  public BigInteger get_submitter_id() {
    return submitter_id;
  }

  public ArrayList<BigInteger> get_all_submitter_ids() {
    return all_submitter_ids;
  }

  public BigInteger get_reviewer_id() {
    return reviewer_id;
  }

  public ArrayList<BigInteger> get_all_reviewer_ids() {
    return all_reviewer_ids;
  }

  public BigInteger get_maintainer_id() {
    return maintainer_id;
  }

  public ArrayList<BigInteger> get_all_maintainer_ids() {
    return all_maintainer_ids;
  }

  public BigInteger get_approver_id() {
    return approver_id;
  }

  public ArrayList<BigInteger> get_all_approver_ids() {
    return all_approver_ids;
  }

  public String get_submitter_name() {
    return submitter_name;
  }

  public ArrayList<String> get_all_submitter_names() {
    return all_submitter_names;
  }

  public ArrayList<String> get_all_reviewer_names() {
    return all_reviewer_names;
  }

  public ArrayList<java.sql.Date> get_all_submitter_dates() {
    return all_submitter_dates;
  }

  public ArrayList<java.sql.Date> get_all_approver_dates() {
    return all_approver_dates;
  }

  public ArrayList<java.sql.Date> get_all_maintainer_dates() {
    return all_maintainer_dates;
  }

  public ArrayList<java.sql.Date> get_all_reviewer_dates() {
    return all_reviewer_dates;
  }

  public void set_original_name(String name) {
    this.original_name = name;
  }

  public String get_original_name() {
    return original_name;
  }

  public void set_date_entered(java.util.Date date) {
    this.date_entered = date;
  }

  public java.util.Date get_date_entered() {
    return date_entered;
  }

  /**
   * Stores contents of object to database. If gene_class_symbol_id is not null,
   * executes update, otherwise, inserts new info. and sets newly created gene
   * class symbol id. This method itself does not use transaction handling to
   * make sure TairObject's updates happen together with GeneClassSymbol
   * updates, so transaction control must be done externally (which it is in
   * CompositeGeneClassSymbol through which all GeneClassSymbol inserts/updates
   * should be being done).
   * 
   * <p>
   * UPDATE and INSERT statements on GeneClassSymbol are created using utility
   * methods defined in superclass. Local column names and values are defined by
   * creating a Map to represent GeneClassSymbol specific column names and
   * values to store, then passes that to superclass methods.
   * 
   * @param conn An active connection to the database. Connection must have
   *          INSERT and UPDATE permissions on the GeneClassSymbol table, or an
   *          exception will be thrown
   * @throws RecordNotFoundException if no row found for tair_object_id while
   *           doing an update.
   * @throws SQLException thrown if an error occurs while updating the database
   * @throws InvalidActionException thrown if the required parameters is missing
   */
  public void store(DBconnection conn) throws RecordNotFoundException,
      SQLException, InvalidActionException {

    // Print error if getting null symbol
    if (get_symbol() == null) {
      java.util.Date nowDate = new java.util.Date();
      Debugger.println(nowDate.toString()
                       + " - Null symbol received for gene class symbol id: "
                       + get_gene_class_symbol_id());
    }

    // insert if primary key is null, else update
    if (get_gene_class_symbol_id() == null) {
      insertGeneClassSymbol(conn);

    } else {
      updateGeneClassSymbol(conn);
    }

    //
    //
    // MOVE ATTRIBUTION STORAGE TO NEW SUB-CLASS OF GENE SYMBOL
    //
    //

    // save symbol's attributions, for fisrt time , will save submitter and
    // maintainer infor into
    // attribution table, for later on : user may change his lab, curators may
    // reassign symbol to
    // some other person if the original association is not right
    if (get_submitter_id() != null) {
      saveAttribution(conn, "submitted_by");
    }

    if (get_maintainer_id() != null) {
      saveAttribution(conn, "maintained_by");
    }
  }

  /**
   * Inserts a new GeneClassSymbol record. New TairObject record will be
   * inserted by calling store method defined in superclass, then new row will
   * be inserted into GeneClassSymbol.
   * 
   * <p>
   * INSERT SQL statement is created in superclass by passing Map containing all
   * GeneClassSymbol specific column names and values. INSERTs will always will
   * take care of adding tair_object_id column, and will include a call to
   * select newly created gene_class_symbol_id (SELECT
   * 
   * @@IDENTITY). This value will be saved into local member variable after
   *              INSERT for future reference.
   * 
   * @param conn An active connection to the database with INSERT permissions
   * @throws InvalidActionException if tair_object_type cannot be determined for
   *           this record (shouldn't happen)
   * @throws SQLException if a database error occurs
   */
  private void insertGeneClassSymbol(DBconnection conn) throws SQLException,
      InvalidActionException {

    // manually set reservation date and date_entered
    // to current time on insert
    java.util.Date rightNow = new java.util.Date();
    set_date_entered(rightNow);
    set_reservation_date(rightNow);

    // make sure to insert TairObject before inserting
    // GeneClassSymbol to ensure we have a tair_object_id
    super.store(conn);

    // get map of GeneClassSymbol specific field names and values
    // and create INSERT statement with utility method
    // defined in superclass - SQL will include a call to get
    // newly created gene_class_symbol_id
    Map<String, String> localValues = getLocalValuesMap();
    String insertQuery =
      createChildTableInsert(localValues,
                             "GENE_CLASS_SYMBOL_ID",
                             "GENECLASSSYMBOL_SEQ");

    // execute insert and save newly created gene_class_symbol_id
    conn.setInsertQuery(insertQuery, "GENE_CLASS_SYMBOL_ID");
    Long id = conn.executeInsert();
    set_gene_class_symbol_id(id);
    conn.releaseResources();
  }

  /**
   * Updates an existing GeneClassSymbol record. TairObject table will be
   * updated by calling store method defined in superclass, then row will be
   * updated in GeneClassSymbol.
   * 
   * <p>
   * UPDATE statement is created by utility method in superclass that uses Map
   * containing GeneClassSymbol specific column names and values to create SQL
   * string for updating. UPDATE statement will always be created to use
   * tair_object_id as primary key in WHERE statement.
   * 
   * @param conn An active connection to the database with UPDATE permissions
   * @throws RecordNotFoundException if no row exists with tair_object_id
   * @throws SQLException if a database error occurs
   * @throws InvalidActionException if no tair object type can be determined for
   *           GeneClassSymbol (shouldn't happen)
   */
  private void updateGeneClassSymbol(DBconnection conn)
      throws RecordNotFoundException, SQLException, InvalidActionException {

    // make sure to update TairObject
    super.store(conn);

    // get map of GeneClassSymbol specific field names and values
    // and create UPDATE statement with utility method defined in
    // superclass - UPDATE will always be done using tair_object_id
    // as primary key column in WHERE clause
    Map<String, String> localValues = getLocalValuesMap();
    String updateQuery = createChildTableUpdate(localValues);
    conn.setQuery(updateQuery);

    int rowsAffected = conn.executeUpdate();
    conn.releaseResources();

    if (rowsAffected <= 0) {
      throw new RecordNotFoundException("Update on GeneClassSymbol "
                                        + "failed: No row found for "
                                        + "tair object id: "
                                        + get_tair_object_id());
    }
  }

  /**
   * Retrieves values to store for a GeneClassSymbol entry as a Map of column
   * names and values to store for each column using current values of member
   * variables. This Map is used by utility methods defined in superclass that
   * create INSERT and UPDATE SQL statements for GeneClassSymbol.
   * 
   * <p>
   * Column names and values must be stored in Map as String. Values must be
   * stored with any quotation marks around values included in String so that
   * they can be directly included in SQL created in superclass.
   * 
   * @return Map of column names for GeneClassSymbol table as String keys
   *         referencing values for each column name.
   */
  @SuppressWarnings("unchecked")
  private Map<String, String> getLocalValuesMap() {
    Map localValues = new HashMap<String, String>();

    localValues.put("symbol", TextConverter.dbQuote(get_symbol()));
    localValues.put("descriptive_symbol",
                    TextConverter.dbQuote(get_descriptive_symbol()));

    localValues.put("description", TextConverter.dbQuote(get_description()));

    localValues.put("has_mutant_phenotype",
                    TextConverter.dbQuote(get_has_mutant_phenotype()));

    localValues.put("mutant_phenotype_class",
                    TextConverter.dbQuote(get_mutant_phenotype_class()));

    localValues.put("comments", TextConverter.dbQuote(get_comments()));

    localValues.put("associated_loci_count",
                    TextConverter.dbQuote(get_associated_loci_count()));

    localValues.put("status", TextConverter.dbQuote(get_status()));

    localValues.put("submitter_info",
                    TextConverter.dbQuote(get_submitter_info()));

    localValues.put("date_last_modified",
                    TextConverter.dbQuote(new java.util.Date(), "mm/dd/yyyy"));

    localValues.put("reservation_date",
                    TextConverter.dbQuote(get_reservation_date(), "mm/dd/yyyy"));

    localValues.put("date_entered", TextConverter.dbQuote(get_date_entered(),
                                                          "mm/dd/yyyy"));

    localValues.put("original_name", TextConverter.dbQuote(get_original_name()));

    return localValues;
  }

  /**
   * Save the attribution into the Attribution table. If the combination of TAIR
   * object id and attribution type exists in the database, this is an update;
   * otherwise it's an insert.
   * 
   * @param conn the connection for the ongoing symbol transaction
   * @param attributionType the kind of attribution (submitted_by or
   *          maintained_by), which sets the community id for the attribution
   * @throws SQLException when there is a problem saving the data
   */
  private void saveAttribution(DBconnection conn, String attributionType)
      throws SQLException {

    BigInteger attributionId = getAttributionId(conn, attributionType);
    BigInteger communityId = getCommunityId(attributionType);
    if (attributionId != null) {
      updateAttribution(conn, attributionId, communityId);
    } else {
      BigInteger tairObjectId = new BigInteger(get_tair_object_id().toString());
      attributionId =
        insertAttribution(conn, attributionType, tairObjectId, communityId);
    }
    conn.releaseResources();
  }

  /**
   * Get the community id for the attributee based on the attribution type.
   * 
   * @param attributionType the kind of attribution (submitted_by,
   *          maintained_by)
   * @return the community the community id for the person or organization to
   *         which the object is being attributed (the attributee)
   */
  private BigInteger getCommunityId(String attributionType) {
    BigInteger communityId = null;
    if (attributionType.equals("submitted_by")) {
      communityId = get_submitter_id();
    } else if (attributionType.equals("maintained_by")) {
      communityId = get_maintainer_id();
    }
    return communityId;
  }

  /**
   * Insert a new attribution with a specific attribution type and
   * 
   * @param conn the connection to use to insert the attribution
   * @param attributionType the kind of attribution (submitted_by or
   *          maintained_by)
   * @param attributionId a unique identifier for the attribution
   * @param tairObjectId the id for the TAIR object being attributed
   * @param communityId the id for the attributee
   * @throws SQLException when there is a problem inserting the data
   */
  private BigInteger insertAttribution(DBconnection conn,
                                       String attributionType,
                                       BigInteger tairObjectId,
                                       BigInteger communityId)
      throws SQLException {
    BigInteger attributionId = null;
    BigInteger attrTypeId = getAttributionTypeId(attributionType);

    attributionId = generateAttributionId(conn);

    conn.setQuery("INSERT INTO Attribution (attribution_id, attribution_date, attribution_comment, tair_object_id, attribution_type_id, community_id) VALUES (?, ?, ?, ?, ?, ?)");
    conn.setQueryVariable(1, attributionId);
    conn.setQueryVariable(2, new java.sql.Timestamp(System.currentTimeMillis()));
    conn.setNullStringQueryVariable(3);
    conn.setQueryVariable(4, tairObjectId);
    conn.setQueryVariable(5, attrTypeId);
    conn.setQueryVariable(6, communityId);
    // Use execute update here, not executeInsert, to avoid sequence generation
    // return using the JDBC generated key operation, which returns a Long
    // rather than the required BigInteger for attribution_id.
    conn.executeUpdate();

    return attributionId;
  }

  /**
   * Generate a new attribution id using a database sequence.
   * 
   * @param conn the connection with which to generate a new id
   * @return the new BigInteger attribution id
   * @throws SQLException when there is a problem generating the id
   */
  private BigInteger generateAttributionId(DBconnection conn)
      throws SQLException {
    BigInteger attributionId = null;
    conn.setQuery("SELECT Attribution_Seq.nextVal FROM Dual");
    ResultSet rs = conn.getResultSet();
    if (rs.next()) {
      attributionId = rs.getBigDecimal(1).toBigInteger();
    }
    conn.releaseResources();
    return attributionId;
  }

  /**
   * Update an attribution identified by an attribution id with new date and
   * community id.
   * 
   * @param conn the connection to use
   * @param attributionId a unique identifier for the attribution
   * @param communityId the new attributee for the attribution
   * @throws SQLException when there is a problem updating the table
   */
  private void updateAttribution(DBconnection conn, BigInteger attributionId,
                                 BigInteger communityId) throws SQLException {
    conn.setQuery("UPDATE Attribution SET attribution_date = ?, community_id = ? WHERE attribution_id = ?");
    conn.setQueryVariable(1, new java.sql.Timestamp(System.currentTimeMillis()));
    conn.setQueryVariable(2, communityId);
    conn.setQueryVariable(3, attributionId);
    conn.executeUpdate();
  }

  /**
   * Get the unique database identifier for an attribution type based on the
   * type string.
   * 
   * @param attributionType the kind of attribution (submitted_by or
   *          maintained_by)
   * @return a BigInteger identifier for the attribution type
   */
  private BigInteger getAttributionTypeId(String attributionType) {
    BsAttributionType type;
    BigInteger attrTypeId;
    AttributionTypeDelegate typeDel =
      CommunityDelegateFactory.getAttributionTypeDelegate();
    type = typeDel.getAttributionTypeByAttributionType(attributionType);
    attrTypeId = type.getAttributionTypeId();
    return attrTypeId;
  }

  /**
   * A private helper function to get attribution_id for this symbol
   * 
   * @param conn An active connection to the database
   * @param attribution_type the kind of attribution (submitted_by or
   *          maintained_by)
   * @throws SQLException in the case of an invalid operation or database error
   */

  private BigInteger getAttributionId(DBconnection conn, String attribution_type)
      throws SQLException {
    BigInteger id = null;
    if (get_tair_object_id() != null) {
      String query =
        "SELECT attribution_id from Attribution a JOIN AttributionType at ON a.attribution_type_id = at.attribution_type_id WHERE at.attribution_type = ? AND a.tair_object_id = ?";
      conn.setQuery(query);
      conn.setQueryVariable(1, attribution_type);
      conn.setQueryVariable(2, get_tair_object_id());
      ResultSet results = conn.getResultSet();
      if (results.next()) {
        id = results.getBigDecimal("attribution_id").toBigInteger();
      }
      conn.releaseResources();
    }
    return id;
  }

  /**
   * Set gene class symbol's approval status, either approved, reviewed (for
   * pending status), or obsoleted
   * 
   * @param conn An active connection to the database. Connection must have
   *          INSERT and UPDATE permissions on the GeneClassSymbol and
   *          Attribution table, or an exception will be thrown
   * @param approval_action approved or rejected
   * @throws SQLException thrown if an error occurs while updating the database
   */
  public void setApprovalStatus(DBconnection conn, String approval_action,
                                String reason) throws SQLException,
      InvalidActionException {
    AttributionDelegate del = CommunityDelegateFactory.getAttributionDelegate();
    AttributionTypeDelegate typeDel =
      CommunityDelegateFactory.getAttributionTypeDelegate();
    BsAttributionType type = null;
    List<BsAttribution> list = new ArrayList<BsAttribution>(1);
    if (get_approver_id() == null || get_tair_object_id() == null) {
      java.util.Date nowDate = new java.util.Date();
      Debugger.println(nowDate.toString()
                       + " - Error from curator review/approve symbol : "
                       + get_gene_class_symbol_id());
      return;
    }

    if (approval_action.equals("approved")) {
      type = typeDel.getAttributionTypeByAttributionType("approved_by");
    } else if (approval_action.equals("pending")) {
      type = typeDel.getAttributionTypeByAttributionType("reviewed_by");
    } else if (approval_action.equals("obsolete")) {
      type = typeDel.getAttributionTypeByAttributionType("obsoleted_by");
    }

    if (type == null) {
      throw new DelegateException("Problem getting attribution type for "
                                  + approval_action);
    }

    // Create the attribution, generating a new id with null.
    BsAttribution attr =
      del.createAttribution(null,
                            new java.sql.Timestamp(System.currentTimeMillis()),
                            reason,
                            new BigInteger(get_tair_object_id().toString()),
                            type.getAttributionTypeId(),
                            get_approver_id());

    list.add(attr);
    del.insert(list);

    // store to GeenClassSymbol table
    set_status(approval_action);
    store(conn);
    conn.releaseResources();
  }

  /**
   * For unit testing only
   */
  public void test() {
    super.test();
    System.out.println("****** TfcGeneClassSymbol content test ******");
    System.out.println("gene_class_symbol_id: " + get_gene_class_symbol_id());
    System.out.println("tair_object_id: " + get_tair_object_id());
    System.out.println("symbol: " + get_symbol());
    System.out.println("descriptive_symbol: " + get_descriptive_symbol());
    System.out.println("description: " + get_description());
    System.out.println("has_mutant_phenotype: " + get_has_mutant_phenotype());
    System.out.println("mutant_phenotype_class: "
                       + get_mutant_phenotype_class());
    System.out.println("comments: " + get_comments());
    System.out.println("reservation_date: " + get_reservation_date());
    System.out.println("date_last_modified: " + get_date_last_modified());
    System.out.println("submitter_info: " + get_submitter_info());
    System.out.println("status: " + get_status());
    System.out.println("associated_loci_count: " + get_associated_loci_count());
    System.out.println("submitter_id: " + get_submitter_id());
    System.out.println("maintainer_id: " + get_maintainer_id());
    System.out.println("approver_id: " + get_approver_id());
    System.out.println("reviewer_id: " + get_reviewer_id());
    System.out.println("submitter_name: " + get_submitter_name());
    System.out.println("original_name: " + get_original_name());
    System.out.println("date_entered " + get_date_entered());
    System.out.println("****** TfcGeneClassSymbol content end ******");
  }

  /**
   * For unit testing only
   */
  public static void main(String[] args) {

    try {

      DBconnection conn = new DBconnection();
      Long test_id = new Long(1005832709);
      TfcGeneClassSymbol symbol = new TfcGeneClassSymbol(conn, test_id);
      symbol.test();

    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
