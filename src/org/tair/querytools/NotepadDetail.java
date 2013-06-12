// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.3 $
// $Date: 2004/04/27 22:49:46 $
// ------------------------------------------------------------------------------
package org.tair.querytools;


import java.math.BigInteger;
import java.sql.SQLException;

import org.tair.tfc.DBconnection;
import org.tair.utilities.AccessionManager;
import org.tair.utilities.ObjectTyper;
import org.tair.utilities.RecordNotFoundException;


/**
 * NotepadDetail extends Notepad to present more detail information about a
 * notepad entry. In addition to the notepad data contained by TfcNotepad, and
 * information on the person who made the entry contained in Notepad,
 * NotepadDetail includes information on the type and name, and TAIR accession
 * number of the TAIR object the note references
 */

public class NotepadDetail extends Notepad implements Detail {

  /**
   * Generated serial version UID for serializable object
   */
  private static final long serialVersionUID = -7561050661567034694L;

  // type of object notepad entry references
  private String objectType;

  // name of object
  private String objectName;

  // TAIR accession number - for providing easy links back
  // original detail page
  private String accessionNumber;
  
  /**
   * Create an empty NotepadDetail object.
   */
  public NotepadDetail() {
    super();
  }

  /**
   * Creates an instance of NotepadDetail for a specific person by person id
   */
  public NotepadDetail(BigInteger persondId) {
    super(persondId);
  }

  /**
   * Creates an instance of NotepadDetail to reflect data for submitted notepad
   * ID.
   * 
   * @param conn An active connection to the database
   * @param notepadID Notepad id to retrieve data for
   * @throws SQLException thrown if a database error occurs, or if no entry
   *           found for submitted notepadID
   */
  public NotepadDetail(DBconnection conn, Long notepadID) throws SQLException {

    super(conn, notepadID);
    get_information(conn, notepadID);
  }

  /**
   * Populates notepad object with data for submitted notepadID. This method is
   * implemented to satisfy the Detail interface, which allows this object to be
   * created through TairObject servlet for display on a detail page
   * 
   * @param conn An active connection to the database
   * @param notepadID Notepad ID to retrieve data for
   * @throws SQLException thrown if a database error occurs
   */
  public void get_information(DBconnection conn, Long notepadID)
      throws SQLException {

    // only call superclass population method if superclass data
    // is empty - this may or may not be true depending on how
    // object was constructed
    if (get_notepad_id() == null) {
      super.populate(conn, notepadID);
    }

    getObjectData(conn);
  }

  /**
   * Retrieves object type & name as well as tair accession number for data
   * element notepad entry references
   * 
   * @param conn An active connection to the database
   * @throws SQLException if a database error occurs
   */
  private void getObjectData(DBconnection conn) throws SQLException {

    // get most specific type for object
    this.objectType = ObjectTyper.getTairObjectType(conn, get_tair_object_id());

    // get table to query for type-specific info and query for object name
    String tableName =
      ObjectTyper.getTairObjectTable(conn, get_tair_object_id());

    this.objectName =
      ObjectTyper.getTairObjectName(conn, tableName, get_tair_object_id());

    // create accession # from specific object type
    this.accessionNumber =
      AccessionManager.getAccession(objectType, get_tair_object_id());
  }

  /**
   * Implementation to satisfy Detail interface. Since notepad entries cannot be
   * retrieved by name, this method will always throw RecordNotFoundException.
   * 
   * @throws RecordNotFoundException everytime method is invoked, since notepad
   *           entries cannot be created by name
   */
  public void get_information(DBconnection conn, String name)
      throws RecordNotFoundException, SQLException {

    throw new RecordNotFoundException("Notepad entries cannot "
                                      + "be created by name alone");

  }

  /**
   * Retrieves name of object notepad entry is for
   * 
   * @return Object name of notepad entry
   */
  public final String getObjectName() {
    return objectName;
  }

  /**
   * Retrieves specific object type notepad entry is for (i.e. clone, gene etc.)
   * 
   * @return Object type of notepad entry
   */
  public final String getObjectType() {
    return objectType;
  }

  /**
   * Retrieves TAIR accession number of object
   * 
   * @return TAIR accession number for object
   */
  public final String getAccession() {
    return accessionNumber;
  }

  /**
   * Sets object name for notepad entry
   * 
   * @param name Object name
   */
  public final void setObjectName(String name) {
    this.objectName = name;
  }

  /**
   * Sets specific object type for entry (i.e. clone etc.)
   * 
   * @param type Object type
   */
  public final void setObjectType(String type) {
    this.objectType = type;
  }

  /**
   * Sets TAIR accession number for object
   * 
   * @param accession Accession number
   */
  public final void setAccession(String accession) {
    this.accessionNumber = accession;
  }

  /**
   * For unit testing only
   */
  public static void main(String[] args) {
    try {

      DBconnection conn = new DBconnection();
      Long id = new Long(2);// aa sequence
      NotepadDetail detail = new NotepadDetail(conn, id);

      System.out.println("type: " + detail.getObjectType());
      System.out.println("name: " + detail.getObjectName());
      System.out.println("accession: " + detail.getAccession());

    } catch (Exception e) {
      e.printStackTrace();
    }
  }

}
