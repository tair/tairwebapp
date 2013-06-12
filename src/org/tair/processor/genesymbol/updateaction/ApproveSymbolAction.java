// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.genesymbol.updateaction;


import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.tair.bs.community.BsCommunity;
import org.tair.bs.community.CommunityDelegate;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.db.community.CommunityFactory;
import org.tair.handler.RequestHandlerResponse;
import org.tair.processor.genesymbol.CompositeGeneClassSymbol;
import org.tair.processor.genesymbol.SymbolMailer;
import org.tair.tfc.DBWriteManager;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.UnauthorizedRequestException;
import org.tair.utilities.WebFormField;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * this class check permission and execute curator approve symbol, includes :
 * write curator decision to database and send email to user to inform curator's
 * decision
 */

public class ApproveSymbolAction extends UpdateAction {
  /**
   * Create a ApproveSymbolAction object.
   */
  public ApproveSymbolAction() {
    super("approve_symbol");
  }

  /**
   * verify authorization permission for this action: only curator can execute
   * this action
   * 
   * @param request HttpServletRequest forwarded from GeneSymbolHandler Servlet
   *          *
   * @exception InvalidLoginException thrown if user is not logged in
   * @exception UnauthorizedRequestException thrown if non-curator user attempts
   *              to access
   */
  public void verify(HttpServletRequest request) throws InvalidLoginException,
      UnauthorizedRequestException {
    checkIsSymbolCurator(request);
  }

  /**
   * execute the curator approve function, curator can approve/ delete /review
   * but not accept(pending)
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
   * @exception InvalidFormException thrown if invalid or incomplete form data
   *              is received
   */

  public RequestHandlerResponse execute(HttpServletRequest request)
      throws SQLException, InvalidFormException, InvalidParameterException,
      UnauthorizedRequestException, InvalidLoginException,
      SessionOutOfTimeException {

    HashMap<String, String> errors = new HashMap<String, String>();

    RequestHandlerResponse response = new RequestHandlerResponse();
    CompositeGeneClassSymbol symbol =
      getCompositeGeneSymbolFromSession(request);
    symbol.set_approver_id(SessionHandler.getCommunityID(request));

    String approval_action = null;
    String reason = null;
    boolean send_email = true;

    if (request.getParameter("send_email") != null
        && (request.getParameter("send_email").equals("n"))) {
      send_email = false;
    }

    field = new WebFormField("approval_or_not", true);
    try {
      approval_action = (String)(field.validate(request));
    } catch (InvalidParameterException ipe) {
      String errMessage =
        "Please check the appropriate radio button for your decision about this symbol.";

      errors.put("approval_or_not", errMessage);
    }

    // for pending/obsolete, reason is required
    if (approval_action != null) {
      if (approval_action.equals("pending")
          || approval_action.equals("obsolete")) {
        field = new WebFormField("reason", true);
      } else {
        field = new WebFormField("reason", false);
      }
      try {
        reason = (String)(field.validate(request));
      } catch (InvalidParameterException ipe) {
        String errMessage =
          "Please give a reason for pending/obsolete decision on this symbol";
        errors.put("reason", errMessage);
      }
    }

    // rethrow the error with better message
    if (errors != null && !errors.isEmpty()) {
      throw new InvalidFormException(errors);
    }

    SymbolMailer mailer = new SymbolMailer();

    try {
      connectionPool = DBWriteManager.getInstance();
      conn = connectionPool.get_connection();

      if (symbol.get_submitter_id() != null) {
        CommunityDelegate delegate =
          CommunityDelegateFactory.getCommunityDelegate();
        IPrimaryKey key =
          CommunityFactory.getCommunityPrimaryKey(symbol.get_submitter_id());
        BsCommunity community = delegate.getObject((SequencePrimaryKey)key);
        if (community.getEmail() != null) {
          mailer.setSubmitterEmail(community.getEmail());
        }
      }
      symbol.setApprovalStatus(conn, approval_action, reason);

      response.setAttribute("status", symbol.get_status());
      response.setAttribute("tair_object_id", symbol.get_tair_object_id());
      if (send_email) {
        mailer.sendCuratorDecisionToUser(symbol,
                                         reason,
                                         request.getParameter("jira"));
      }
    } finally {
      removeCompositeGeneSymbolFromSession(request);
      if (conn != null) {
        DBWriteManager.return_connection(conn);
      }
    }

    response.setPage("/jsp/processor/genesymbol/curator_decision.jsp");
    return response;
  }

}
