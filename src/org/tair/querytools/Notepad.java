// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.4 $
// $Date: 2004/04/27 22:49:46 $
// ------------------------------------------------------------------------------

package org.tair.querytools;


import java.io.Serializable;
import java.math.BigInteger;
import java.sql.SQLException;

import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.PersonDelegate;
import org.tair.db.community.CommunityFactory;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcNotepad;

import com.poesys.db.InvalidParametersException;
import com.poesys.db.dto.DtoStatusException;
import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * Notepad extends TfcNotepad to present more detail information about a notepad
 * entry. In addition to the data contained by the superclass, Notepad contains
 * information on the person who made the entry.
 * 
 * <p>
 * Notepad implements Serializable so that session objects can be persisted in
 * case of a server restart
 */

public class Notepad extends TfcNotepad implements Serializable {

  /**
   * Generated serial version UID for serializable object
   */
  private static final long serialVersionUID = 4745086286964730234L;

  /**
   * Create an empty Notepad object.
   */
  public Notepad() {
    super();
  }

  /**
   * Creates an instance of Notepad, querying the person by ID.
   * @param personId the id of the person making the comment
   */
  public Notepad(BigInteger personId) {
    super();
    // Synch up TfcNotepad parent before querying
    set_person_id(personId);
  }

  /**
   * Creates an instance of Notepad to reflect data for submitted notepad ID.
   * 
   * @param conn An active connection to the database
   * @param notepadID Notepad id to retrieve data for
   * @exception SQLException thrown if a database error occurs, or if no entry
   *              found for submitted notepadID
   */
  public Notepad(DBconnection conn, Long notepadID) throws SQLException {
    super(conn, notepadID);
    populate(conn, notepadID);
  }

  /**
   * Populates basic notepad data as well as data for person who created notepad
   * entry
   */
  protected void populate(DBconnection conn, Long notepadID)
      throws SQLException {
    if (get_notepad_id() == null) {
      super.populate(conn, notepadID);
    }
  }

  /**
   * Query and get the BsPerson person object using the parent TfcNotepad
   * person_id.
   * 
   * @return the person
   */
  private BsPerson getPerson() {
    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    IPrimaryKey key = CommunityFactory.getPersonPrimaryKey(get_person_id());
    BsPerson person = delegate.getObject((SequencePrimaryKey)key);
    return person;
  }

  /**
   * Query and set the BsPerson person object using a specified community id.
   * @param communityId 
   */
  private void queryPersonByCommunityId(BigInteger communityId) {
    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    super.set_person_id(delegate.getPersonByCommunityId(communityId).getPersonId());
  }

  /**
   * @param name
   * @throws InvalidParametersException
   * @throws DtoStatusException
   */
  public final void set_last_name(String name)
      throws InvalidParametersException, DtoStatusException {
    getPerson().setLastName(name);
  }

  /**
   * @param name
   * @throws DtoStatusException
   */
  public final void set_first_name(String name) throws DtoStatusException {
    getPerson().setFirstName(name);
  }

  /**
   * @param name
   * @throws DtoStatusException
   */
  /**
   * @param name
   * @throws DtoStatusException
   */
  public final void set_middle_name(String name) throws DtoStatusException {
    getPerson().setMiddleName(name);
  }

  /**
   * @param suffix
   * @throws DtoStatusException
   */
  public final void set_suffix(String suffix) throws DtoStatusException {
    getPerson().setSuffix(suffix);
  }

  /**
   * @param title
   * @throws DtoStatusException
   */
  public final void set_primary_job_title(String title)
      throws DtoStatusException {
    getPerson().setPrimaryJobTitle(title);
  }

  // keep notepad & person in synch; query person object from database
  public final void set_person_id(BigInteger id) {
    super.set_person_id(id);
  }

  /**
   * @return
   */
  public final String get_last_name() {
    return getPerson().getLastName();
  }

  /**
   * @return
   */
  public final String get_first_name() {
    return getPerson().getFirstName();
  }

  /**
   * @return
   */
  public final String get_middle_name() {
    return getPerson().getMiddleName();
  }

  /**
   * @return
   */
  public final String get_suffix() {
    return getPerson().getSuffix();
  }

  /**
   * @return
   */
  public final String get_primary_job_title() {
    return getPerson().getPrimaryJobTitle();
  }

  //
  // BsCommunity wrappers
  //
  /**
   * @param communityId
   */
  public final void set_community_id(BigInteger communityId) {
    queryPersonByCommunityId(communityId);
  }

  /**
   * @param community_type
   * @throws InvalidParametersException
   * @throws DtoStatusException
   */
  public final void set_community_type(String community_type)
      throws InvalidParametersException, DtoStatusException {
    getPerson().getCommunity().setCommunityType(community_type);
  }

  /**
   * @param email
   * @throws DtoStatusException
   */
  public final void set_email(String email) throws DtoStatusException {
    getPerson().setEmail(email);
  }

  /**
   * @return
   */
  public final BigInteger get_community_id() {
    return getPerson().getCommunityId();
  }

  /**
   * @return
   */
  public final String get_community_type() {
    return getPerson().getCommunity().getCommunityType();
  }

  /**
   * @return
   */
  public final String get_email() {
    return getPerson().getCommunity().getEmail();
  }

  /**
   * Convenience method to retrieve combined value of person's first and last
   * name
   * 
   * @return Single string containing user's first and last name
   */
  public String get_person_name() {
    return getPerson().getCommunity().getName();
  }
}
