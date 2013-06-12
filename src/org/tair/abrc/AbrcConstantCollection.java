// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.2 $
// $Date: 2005/09/14 16:20:36 $
// ------------------------------------------------------------------------------

package org.tair.abrc;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.tair.tfc.DBconnection;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.TfcAbrcConstant;
import org.tair.utilities.InvalidActionException;


/**
 * AbrcConstantCollection is a custom collection that stores different constants
 * used in the ABRC stock ordering tools as a collection of
 * <code>TfcAbrcConstant</code> objects.
 * 
 * <p>
 * Constants collection is implemented as a singleton to allow easy access to
 * all client code. Since all updating of constant values should be done using
 * this class itself, registering with DataPopulatorThread to periodically
 * refresh from the db shouldn't be necessary - can be added later if this
 * causes problems, but be aware that this can lead to threading problems as
 * unit tests and other stand alone code that uses collection will not terminate
 * correctly after populator thread is kicked off.
 */

public class AbrcConstantCollection {
  private ArrayList<TfcAbrcConstant> constants;

  // static singleton reference
  private static AbrcConstantCollection constantCollection;

  /**
   * Creates an instance of AbrcConstantCollection that represents the full
   * collection of Abrc constants in the database. Constructor is private to
   * enable collection as a singleton. Client code should get a reference to the
   * singleton using the getInstance method.
   * 
   * @param conn An active connection to the database
   * @throws SQLException if a database error occurs
   */
  private AbrcConstantCollection(DBconnection conn) throws SQLException {
    this.constants = new ArrayList<TfcAbrcConstant>();

    populate(conn);
  }

  /**
   * Retrieves a reference to the singleton instance of collection. Collection
   * will be initialized and populated if it hasn't been done already.
   * 
   */
  public static AbrcConstantCollection getInstance() {

    if (constantCollection == null) {
      DBReadManager connectionPool = null;
      DBconnection conn = null;

      try {

        connectionPool = DBReadManager.getInstance();
        conn = connectionPool.get_connection();
        constantCollection = new AbrcConstantCollection(conn);

      } catch (SQLException sqe) {
        // Throw a runtime exception to avoid checked exception propagation.
        throw new RuntimeException(sqe);
      } finally {
        DBReadManager.return_connection(conn);
      }
    }

    return constantCollection;
  }

  /**
   * Populates collection with all constant values in the database. Collection
   * is populated by retrieving all abrc_constant_ids and creating
   * TfcAbrcConstant objects for each.
   * 
   * @param conn An active connection to the database
   * @throws SQLException if a database error occurs
   */
  private void populate(DBconnection conn) throws SQLException {
    // retrieve all abrc_constant_ids and create TfcAbrcConstant
    // objects for each
    ArrayList<Long> ids = new ArrayList<Long>();

    String query = "SELECT abrc_constant_id FROM AbrcConstant";

    conn.setQuery(query);

    ResultSet results = conn.getResultSet();
    while (results.next()) {
      ids.add(new Long(results.getLong("abrc_constant_id")));
    }
    conn.releaseResources();

    Iterator<Long> iter = ids.iterator();
    while (iter.hasNext()) {
      add(new TfcAbrcConstant(conn, (Long)iter.next()));
    }
  }

  /**
   * Determines if collection contains elements or not
   * 
   * @return <code>true</code> if collection has no elements in it, or
   *         <code>false</code> if collection has at least one element in it
   */
  public boolean isEmpty() {
    return constants.isEmpty();
  }

  /**
   * Determines number of elements in collection
   * 
   * @return Number of elements in collection
   */
  public int size() {
    return constants.size();
  }

  /**
   * Retrieves all elements in collection
   * 
   * @return Elements in collection as an <code>Iterator</code> of
   *         <code>TfcAbrcConstant</code> objects, or <code>null</code> if no
   *         elements in collection
   */
  public Iterator<TfcAbrcConstant> iterator() {
    return !isEmpty() ? constants.iterator() : null;
  }

  /**
   * Retrieves element at submitted index
   * 
   * @param index Index of item to retrieve
   * @return Element at submitted index, or <code>null</code> if no element at
   *         requested index
   */
  public TfcAbrcConstant get(int index) {
    return (TfcAbrcConstant)constants.get(index);
  }

  /**
   * Retrieves constant with submitted abrc_constant_id
   * 
   * @param id Id of constant to return
   * @return Constant with submitted id, or <code>null</code> if id not found
   */
  public TfcAbrcConstant get(Long id) {
    TfcAbrcConstant constant = null;

    if (!isEmpty()) {
      TfcAbrcConstant tmpConstant = null;
      for (Iterator<TfcAbrcConstant> iter = iterator(); iter.hasNext();) {
        tmpConstant = (TfcAbrcConstant)iter.next();
        if (id.equals(tmpConstant.get_abrc_constant_id())) {
          constant = tmpConstant;
          break;
        }
      }
    }

    return constant;
  }

  /**
   * Retrieves constant with submitted name
   * 
   * @param name Name of constant to retrieve
   * @return Constant with submitted name, or <code>null</code> if name not
   *         found
   */
  public TfcAbrcConstant get(String name) {
    TfcAbrcConstant constant = null;

    if (!isEmpty()) {
      TfcAbrcConstant tmpConstant = null;
      for (Iterator<TfcAbrcConstant> iter = iterator(); iter.hasNext();) {
        tmpConstant = (TfcAbrcConstant)iter.next();
        if (name.equalsIgnoreCase(tmpConstant.get_name())) {
          constant = tmpConstant;
          break;
        }
      }
    }

    return constant;
  }

  /**
   * Retrieves constant value for constant with submitted name. This is a
   * convenience method for easily accessing constant values in client code.
   * 
   * @param name Name of constant to retrieve value for
   * @return Currently stored constant value for constant of submitted name
   */
  public Float getValue(String name) {
    Float value = null;
    TfcAbrcConstant constant = get(name);
    
    if (constant != null) {
      value = constant.get_constant();
    }

    return value;
  }

  /**
   * Determines index of submitted object in collection
   * 
   * @param constant Constant object to retrieve index of
   * @return index of constant within collection
   */
  public int indexOf(TfcAbrcConstant constant) {
    return constants.indexOf(constant);
  }

  /**
   * Adds supplied element to collection
   * 
   * @param constant Constant to add to collection
   */
  public void add(TfcAbrcConstant constant) {
    constants.add(constant);
  }

  /**
   * Determines if supplied element is in collection
   * 
   * @return <code>true</code> if supplied element is in collection;
   *         <code>false</code> if element is not found
   */
  public boolean contains(TfcAbrcConstant constant) {
    return constants.contains(constant);
  }

  /**
   * Stores contents of collection to the database.
   * 
   * @param conn A database connection with UPDATE/INSERT/DELETE privileges
   * @throws InvalidActionException if required data has not been set for any
   *           data element
   * @throws SQLException if a database error occurs
   */
  public void store(DBconnection conn) throws InvalidActionException,
      SQLException {

    if (!isEmpty()) {
      TfcAbrcConstant constant = null;
      for (Iterator<TfcAbrcConstant> iter = iterator(); iter.hasNext();) {
        constant = (TfcAbrcConstant)iter.next();
        constant.store(conn);
      }
    }
  }

  /**
   * For unit testing only
   */
  public void test() {
    System.out.println("****** AbrcConstantCollection content ******");
    if (!isEmpty()) {
      Iterator<TfcAbrcConstant> iter = iterator();
      while (iter.hasNext()) {
        TfcAbrcConstant constant = (TfcAbrcConstant)iter.next();
        constant.test();
      }
    }
    System.out.println("**** AbrcConstantCollection content end ****");
  }

  /**
   * For unit testing only
   */
  public static void main(String[] args) {
    try {

      DBconnection conn = new DBconnection();
      AbrcConstantCollection constants = new AbrcConstantCollection(conn);

      constants.test();

    } catch (Exception e) {
      e.printStackTrace();
    }
  }

}
