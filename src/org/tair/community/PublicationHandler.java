/**
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.community;


import java.math.BigInteger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.PersonDelegate;
import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.PublicationSearchHandler;
import org.tair.search.SearchSession;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.TextConverter;


/**
 * PublicationHandler handles requests to add or edit a community's associations
 * to publications
 */

public class PublicationHandler implements RequestHandler {

  /**
   * Unlike other community Handlers, PublicationHandler should only apply to
   * person profile maintenance (not organization).
   * 
   * <p>
   * Updates a person's associations to publications by either adding new
   * publications to person's collection, or by removing existing publication
   * associations from collection, and commits changes to database.
   * 
   * <p>
   * Person record (including any new or altered publication associations) will
   * be stored to the database following each add or edit publications action.
   * 
   * <p>
   * PublicationHandler determines whether user is adding or deleting
   * publications based on the "pub_action" request parameter. Values may be:
   * 
   * <ul>
   * <li>associate_pubs - add new publications to user profile</li>
   * <li>edit_pubs - deletes publications</li>
   * </ul>
   * 
   * @param request HttpServletRequest from CommunityServlet
   * @return RequestHandlerResponse with next page to be forwared to
   * @throws InvalidParameterException thrown if invalid publication id received
   * @throws SQLException thrown if database error occurs
   * @throws InvalidSessionException thrown if necessary BsPerson object
   *           not found in user's session
   */
  public RequestHandlerResponse process(HttpServletRequest request)
      throws InvalidParameterException, SQLException, InvalidSessionException,
      InvalidFormException {

    RequestHandlerResponse response = null;

    String pubAction = request.getParameter("pub_action");

    if (pubAction != null && pubAction.equals("associate_pubs")) {
      response = addPublications(request);

    } else if (pubAction != null && pubAction.equals("edit_pubs")) {
      response = editPublications(request);

    } else { // missing or invalid action requested
      throw new InvalidParameterException("Invalid publication action requested: "
                                          + pubAction);
    }

    return response;

  }

  /**
   * Adds new associations between person and selected publications. Input is
   * usually received from the publication search results page. Reference ids
   * for selected publications are received as the "id" param in the servlet
   * request.
   * 
   * @param request <code>HttpServletRequest</code> from CommunityServlet
   * @return RequestHandlerResponse containing URL of JSP to redirect user to
   * @throws InvalidFormException when there is invalid form data
   * @throws SQLException when there is a database problem
   * @throws InvalidSessionException when the person is not in the session
   * @throws InvalidParameterException when there is invalid parameter data
   */
  private RequestHandlerResponse addPublications(HttpServletRequest request)
      throws InvalidFormException, SQLException, InvalidSessionException,
      InvalidParameterException {
    BsPerson person = SessionHandler.getPerson(request);

    // get all submitted ids to add to person record - will
    // throw exception if no ids found in current request or
    // from user's search session object
    List<BigInteger> referenceIDs = getCombinedReferenceIds(request);
    
    // Add the publications to the person and commit to the database.
    PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
    delegate.addPublications(person, referenceIDs);

    RequestHandlerResponse response = new RequestHandlerResponse();
    response.setPage(CommunityPageHolder.getPersonProfilePage());

    return response;

  }

  /**
   * Updates person's existing associations to publications by deleting any
   * selected associations
   * 
   * @param request HttpServletRequest from CommunityServlet
   * @return RequestHandlerResponse containing URL of JSP to redirect user to
   * @throws InvalidSessionException if person not found in session
   * @throws InvalidParameterException if invalid reference id received
   * @throws SQLException if database error occurs while storing person record
   *           to the database
   */
  private RequestHandlerResponse editPublications(HttpServletRequest request)
      throws InvalidSessionException, InvalidParameterException, SQLException {

    BsPerson person = SessionHandler.getPerson(request);

    if (!TextConverter.isEmpty(request.getParameter("delete"))) {
      List<BigInteger> ids = TextConverter.stringToBigIntList(request.getParameterValues("delete"));
      PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
      delegate.removePublications(person, ids);
    }

    RequestHandlerResponse response = new RequestHandlerResponse();
    response.setPage(CommunityPageHolder.getPersonProfilePage());

    return response;

  }

  /**
   * Retrieves selected reference ids of publications to associate to user. IDs
   * may be in current request, but also may be in user's SearchSession from
   * being saved page by page as user scrolled through multiple pages of
   * publication results. This method combines both sets of ids into a single
   * list.
   * 
   * @param request HTTP request containing list of reference ids from form
   * @return a list of <code>BigInteger</code> reference ids
   * @throws InvalidParameterException If an invalid reference id is received
   * @throws InvalidFormException if no reference ids found to associate person
   *           to
   * @throws SQLException if a database error occurs while retrieving
   *           SearchSession
   */
  private List<BigInteger> getCombinedReferenceIds(HttpServletRequest request)
      throws InvalidParameterException, InvalidFormException {

    // list to hold all reference ids of publications to associate
    List<BigInteger> ids = null;

    // Get all submitted reference ids from form submission
    String[] formIDs = request.getParameterValues("id");

    // check for any ids stored in user's search session as they
    // scrolled through pages of results
    SearchSession searchSession = SessionHandler.getSearchSession(request);

    // searchSession should never be null unless session has expired, in
    // which case retrieving person object from session above should have
    // already caused an error; use Vector to bridge to old code
    Vector<Long> v =
      searchSession.getDownload(PublicationSearchHandler.getSearchType());
    if (v == null) {
      v = new Vector<Long>();
    }

    // combine previously selected with selections from current page
    if (formIDs != null && formIDs.length > 0) {

      try {
        for (int i = 0; i < formIDs.length; i++) {
          v.add(new Long(formIDs[i]));
        }
      } catch (NumberFormatException nfe) {
        throw new InvalidParameterException("Invalid reference id: "
                                            + nfe.getMessage());
      }
    }

    if (v == null || v.isEmpty()) {
      throw new InvalidFormException("No publications selected");
    } else {
      // Build the list of BigInteger ids.
      ids = new ArrayList<BigInteger>(v.size());
      for (Long longId : v) {
        BigInteger id = new BigInteger(longId.toString());
        ids.add(id);
      }
    }

    return ids;
  }
}
