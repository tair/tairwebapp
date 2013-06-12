/*
 * Copyright (c) 2011 Carnegie Institution for Science. All rights reserved.
 */

package org.tair.abrc.handler;


import java.math.BigInteger;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.tair.abrc.payment.InvoiceSearcher;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.PersonDelegate;
import org.tair.db.community.CommunityFactory;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.SearchSession;
import org.tair.utilities.InvalidActionException;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.InvalidSessionException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.TextConverter;
import org.tair.utilities.UnauthorizedRequestException;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * Do a user person invoice search based on a person id supplied by the user.
 * 
 * @author Robert J. Muller
 */
public class InvoicePersonSearchHandler extends InvoiceSearchHandler {

  @Override
  public RequestHandlerResponse process(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidLoginException,
      UnauthorizedRequestException, InvalidParameterException,
      SessionOutOfTimeException, InvalidSessionException,
      InvalidActionException {

    extractParameters(request);

    InvoiceSearcher searcher = new InvoiceSearcher(params);
    
    // Get an existing session or create a new session.
    SearchSession searchSession =
      SessionHandler.getSearchSession(request, type);

    setQueryId(searcher);

    RequestHandlerResponse response =
      search(searchSession, searcher, USER_SUMMARY);

    // Set the person object into the response attributes.
    response.setAttribute("person", getPersonFromParameters(request));

    return response;
  }

  /**
   * @param request
   * @return
   * @throws InvalidFormException
   */
  private BsPerson getPersonFromParameters(HttpServletRequest request)
      throws InvalidFormException {
    // Get the person id for a person-oriented search.
    BigInteger personId = null;
    BsPerson person = null;
    if (!TextConverter.isEmpty(request.getParameter("person_id"))) {
      personId = new BigInteger(request.getParameter("person_id"));
    }

    if (personId != null) {
      PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
      IPrimaryKey key = CommunityFactory.getPersonPrimaryKey(personId);
      person = delegate.getObject((SequencePrimaryKey)key);
    } else {
      throw new InvalidFormException("No person supplied for personal invoice search");
    }
    return person;
  }
}
