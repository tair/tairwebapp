//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.3 $
// $Date: 2004/04/27 22:49:21 $
//------------------------------------------------------------------------------

package org.tair.tfc;

import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.tair.bs.locusdetail.BsLocusDetail;
import org.tair.bs.locusdetail.LocusDetailDelegate;
import org.tair.bs.locusdetail.LocusdetailDelegateFactory;
import org.tair.db.locusdetail.LocusdetailFactory;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.NaturalPrimaryKey;

public class TfcNotepad {

    private Long notepad_id;
    private Long tair_object_id;
    private BigInteger person_id;
    private String comment;
    private String status;
    private java.util.Date date_entered;

  
    /**
     * Creates an empty instance of TfcNotepad
     */
    public TfcNotepad() { }

    /**
     * Creates an instance of TfcNotepad that reflects the  data for the 
     * notepad item with submitted notepadID. 
     *
     * @param conn An active connection to the database
     * @param notepadID Notepad ID to retrieve data for
     * @throws RecordNotFoundException if no corresponding row found for
     * submitted notepadID
     * @throws SQLException thrown if a database error occurs, or if no
     * entry found for submitted notepadID
     */
    public TfcNotepad( DBconnection conn, Long notepadID ) throws SQLException {
        if ( notepadID != null ) {
            String query = 
		getBaseQuery() +
		"WHERE notepad_id = " + notepadID.toString();
	    
            processResults( conn, query );

            if ( get_notepad_id() == null ) {
                throw new RecordNotFoundException( "No notepad entry found " +
						   "for notepad id: " + 
						   notepadID );
            }
        }
    }

    /**
     * Retrieve base SELECT statement without WHERE clause for populating
     * object
     *
     * @return SELECT statement without WHERE clause for populating object
     * instance
     */
    private String getBaseQuery() {
	String query =
	    "SELECT tair_object_id, " +
	    "notepad_id, " +
	    "person_id, " +
	    "notepad_comment, " +
	    "status, " +
	    "date_entered " +
	    "FROM Notepad ";

	return query;
    }


    /**
     * Method for subclasses to populate object outside of constructor.  This 
     * is useful in the specific case of org.tair.querytools.Notepad which can be 
     * created in DetailFactory using no param constructor, but then needs 
     * population later
     *
     * @param conn An active connection to the database
     * @param notepadID ID to retrieve data for
     * @throws SQLException thrown if a database error occurs, or if no 
     * notepad entry found for submitted id
     */
    protected void populate( DBconnection conn, Long notepadID ) 
	throws SQLException {

	String query = 
	    getBaseQuery() +
	    "WHERE notepad_id = " + notepadID.toString();

	processResults( conn, query );
      
	if ( get_notepad_id() == null ) {
	    throw new RecordNotFoundException( "No notepad entry found for " +
					       "notepad id: " + notepadID );
        }
    }
    
    /**
     * Executes query and saves results in member variables
     */
    private void processResults( DBconnection conn, String query ) 
	throws SQLException {

        conn.setQuery( query );
        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            this.notepad_id = new Long( results.getLong( "notepad_id" ) );

            long id = results.getLong( "tair_object_id" );
            if ( !results.wasNull() ) {
                this.tair_object_id = new Long( id );
            }

            BigInteger personId = results.getBigDecimal( "person_id" ).toBigInteger();
            if ( !results.wasNull() ) {
                this.person_id = personId;
            }

            this.comment = results.getString( "notepad_comment" );
            this.status = results.getString( "status" );
            this.date_entered = results.getDate( "date_entered" );
        }
        conn.releaseResources();
    }
  

    //
    // Get 'em and set 'em
    //

    public Long get_notepad_id() { 
	return notepad_id; 
    }

    public Long get_tair_object_id() {
	return tair_object_id;
    }

    public BigInteger get_person_id() {
	return person_id;
    }

    public String get_comment() {
	return comment;
    }

    public String get_status() {
	return status; 
    }

    public java.util.Date get_date_entered() {
	return date_entered;
    }
  
    public void set_notepad_id( Long id ) { 
	this.notepad_id = id;
    }

    public void set_tair_object_id( Long id ) {
	this.tair_object_id = id;
    }

    public void set_person_id( BigInteger id ) {
	this.person_id = id;
    }

    public void set_comment( String comment ) { 
	this.comment = comment;
    }

    public void set_status( String status ) {
	this.status = status;
    }

    public void set_date_entered( java.util.Date date_entered ) { 
	this.date_entered = date_entered; 
    }

  /**
   * Stores contents of notepad entry to database as either an INSERT or UPDATE
   * depending on whether notepad id is NULL or not. Notepad entry must have
   * tair object id and person id set or exception will be thrown. If storing is
   * done as an INSERT, newly created notepad_id will be saved in member
   * variable for future reference
   * 
   * @param conn Database connection with UPDATE/INSERT privileges
   * @throws SQLException if a database error occurs
   * @throws InvalidActionException If notepad entry is missing data
   * @throws RecordNotFoundException if no row found with notepad id when
   *           UPDATEing
   */
  public void store(DBconnection conn) throws RecordNotFoundException,
      SQLException, InvalidActionException {

    String query = null;
    ResultSet results = null;
    boolean updated = false;

    if (get_tair_object_id() == null || get_person_id() == null) {
      throw new InvalidActionException("Cannot store notepad entry "
                                       + "without tair object id or "
                                       + "person id");
    }

    // insert if new entry -- let db populate date_entered field
    if (get_notepad_id() == null) {
      query =
        "INSERT INTO Notepad ( " + "notepad_id, " + "tair_object_id, "
            + "person_id, " + "status, " + "notepad_comment " + " ) VALUES ( "
            + "NOTEPAD_seq.nextval, " + get_tair_object_id().toString() + ", "
            + get_person_id().toString() + ", "
            + TextConverter.dbQuote(get_status()) + ", "
            + TextConverter.dbQuote(get_comment()) + " " + " )";

      conn.setInsertQuery(query, "NOTEPAD_ID");
      Long nid = conn.executeInsert();
      set_notepad_id(new Long(nid)); // save new id
      conn.releaseResources();
      updated = true;
    } else { // else update existing record

      query =
        "UPDATE Notepad SET " + "tair_object_id = "
            + get_tair_object_id().toString() + ", " + "person_id = "
            + get_person_id().toString() + ", " + "status = "
            + TextConverter.dbQuote(get_status()) + ", " + "notepad_comment = "
            + TextConverter.dbQuote(get_comment()) + ", " + "date_entered = "
            + TextConverter.dbQuote(get_date_entered(), "mm/dd/yyyy") + " "
            + "WHERE notepad_id = " + get_notepad_id().toString();
      conn.setQuery(query);
      int rowsAffected = conn.executeUpdate();
      conn.releaseResources();

      if (rowsAffected <= 0) {
        throw new RecordNotFoundException("Update action failed: "
                                          + "No row found for " + "notepad id "
                                          + get_notepad_id());
      }
      updated = true;

    }

    if (updated) {
      // Tell locus detail to requery comments
      // TODO: replace entire notepad with comment-based facility
      updateLocusDetail(get_tair_object_id());
    }
  }

    /**
     * Update the LocusDetail object corresponding to a specified TAIR object id
     * with the new notepad information. This method hacks up an interface
     * between the old Notepad system and the new LocusDetail/LocusComment
     * system based on database views. It resets the association in the cached
     * LocusDetail object, forcing it to re-query the comments as a lazy load
     * when the JSP requests them.
     * 
     * @param getTairObjectId the TAIR object id
     */
    private void updateLocusDetail(Long id) {
      // Look up the LocusDetail based on the TAIR object id.
      LocusDetailDelegate delegate = 
        LocusdetailDelegateFactory.getLocusDetailDelegate();
      IPrimaryKey key = LocusdetailFactory.getLocusDetailPrimaryKey(id);
      BsLocusDetail locus = delegate.getObject((NaturalPrimaryKey)key);
      if (locus != null) {
        delegate.clearComments(locus);        
      }
    }

    /**
     * Deletes notepad entry from the database.  Object instance must
     * have already been populated with notepad id at minimum.
     *
     * @param conn DB connection with DELETE privileges
     * @throws SQLException if a database error occurs
     * @throws InvalidActionException if no notepad id set for object
     * @throws RecordNotFoundException if no row found with notepad id
     */
    public void delete( DBconnection conn ) 
	throws RecordNotFoundException, SQLException, InvalidActionException {

	if ( get_notepad_id() == null ) {
	    throw new InvalidActionException( "Cannot delete notepad entry " +
					      "without notepad id" );
	}

	String query = "DELETE Notepad WHERE notepad_id = ?";
	conn.setQuery( query );
	conn.setQueryVariable( get_notepad_id() );
	
	int rowsAffected = conn.executeUpdate();

	if ( rowsAffected <= 0 ) {
	    throw new RecordNotFoundException( "Delete failed: " +
					       "No notepad row found " +
					       "with notepad id: " + 
					       get_notepad_id() );
	}

    }


       
    

    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "notepad id: " + get_notepad_id() );
        System.out.println( "tair object id: " +  get_tair_object_id() );
        System.out.println( "person id: " + get_person_id() );
        System.out.println( "comment: " + get_comment() );
        System.out.println( "status: " + get_status() );
        System.out.println( "date entered: " + get_date_entered() );
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try {
            DBconnection conn = new DBconnection();
            Long id = new Long( 1 );
            TfcNotepad note = new TfcNotepad( conn, id );
            note.test();
        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
