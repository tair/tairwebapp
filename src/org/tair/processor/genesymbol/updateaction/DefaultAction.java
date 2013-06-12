// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.genesymbol.updateaction;


import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.tair.bs.community.BsCommunity;
import org.tair.bs.community.CommunityDelegate;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.db.community.CommunityFactory;
import org.tair.handler.RequestHandlerResponse;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.UnauthorizedRequestException;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


public class DefaultAction extends UpdateAction {
  public DefaultAction() {
    super();
  }

  /**
   * The default action of Gene class symbol will direct user to symbol submit
   * start page
   * 
   * @param request HttpServletRequest forwarded from GeneSymbolHandler Servlet
   * @return RequestHandlerResponse containing URL to forward user to
   * @exception InvalidLoginException thrown if user is not logged in
   * @exception SQLException thrown if a database error occurs
   * @exception InvalidParameter exception thrown if invalid update_action, id
   *              or data received
   * @exception UnauthorizedRequestException thrown if non-curator user attempts
   *              to access
   * @exception SessionOutOfTimeException thrown if session out of time
   */

  public RequestHandlerResponse execute(HttpServletRequest request)
      throws SQLException, UnauthorizedRequestException, InvalidLoginException,
      SessionOutOfTimeException {
    RequestHandlerResponse response = new RequestHandlerResponse();

    CommunityDelegate delegate =
      CommunityDelegateFactory.getCommunityDelegate();
    IPrimaryKey key =
      CommunityFactory.getCommunityPrimaryKey(SessionHandler.getCommunityID(request));
    BsCommunity community = delegate.getObject((SequencePrimaryKey)key);
    if (community.getEmail() != null) {
      response.setAttribute("email", community.getEmail());
      response.setAttribute("submitter_id",
                            SessionHandler.getCommunityID(request));
    } else {
      response.setAttribute("email", null);
      response.setAttribute("submitter_id",
                            SessionHandler.getCommunityID(request));
    }

    response.setPage("/jsp/processor/genesymbol/input_symbol.jsp");

    return response;
  }
}
