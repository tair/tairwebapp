// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.genesymbol;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.processor.genesymbol.updateaction.ApproveSymbolAction;
import org.tair.processor.genesymbol.updateaction.AssociateLociAction;
import org.tair.processor.genesymbol.updateaction.AssociateLociPubAction;
import org.tair.processor.genesymbol.updateaction.AssociateOrgAction;
import org.tair.processor.genesymbol.updateaction.AssociatePersonAction;
import org.tair.processor.genesymbol.updateaction.AssociatePubsAction;
import org.tair.processor.genesymbol.updateaction.ConfirmAllAction;
import org.tair.processor.genesymbol.updateaction.CuratorApproveAction;
import org.tair.processor.genesymbol.updateaction.DefaultAction;
import org.tair.processor.genesymbol.updateaction.EditSymbolAction;
import org.tair.processor.genesymbol.updateaction.ModifySymbolAction;
import org.tair.processor.genesymbol.updateaction.RemoveLociAction;
import org.tair.processor.genesymbol.updateaction.RemovePubsAction;
import org.tair.processor.genesymbol.updateaction.SaveSymbolAction;
import org.tair.processor.genesymbol.updateaction.SearchAction;
import org.tair.processor.genesymbol.updateaction.SubmitSymbolAction;
import org.tair.processor.genesymbol.updateaction.UpdateAction;
import org.tair.processor.genesymbol.updateaction.ViewSymbolAction;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidLoginException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.UnauthorizedRequestException;


/**
 * GeneSymbolHandler handles all requests to submit, update and curator approve
 * functions to GeneClassSymbol, GeneClassSymbol_Locus, GeneAlias, Attribution tables.  
 * <p>
 */


public class GeneSymbolHandler implements RequestHandler {
  
 /**
   * Processes all requests for searching and updating GeneClassSymbol, GeneClassSymbol_Alias, 
   * GeneAlias, Attribution tables .This method relies on a request parameter called
   * "update_action" to determine what stage of the process user is currently in, depends on this
   * the handler will determine which updateAction class to use
   * @param request HttpServletRequest
   * @return RequestHandlerResponse containing URL to forward user to 
   * @exception InvalidLoginException thrown if user is not logged in
   * @exception SQLException thrown if a database error occurs
   * @exception InvalidParameter exception thrown if invalid id or data received
   * @exception InvalidFormException thrown if invalid or incomplete form data is received
   * @exception SessionOutOfTimeException thrown if session out of time
   * @exception UnauthorizedRequestException thrown if the login user doesn't have the permission for this action
   */
 
  public RequestHandlerResponse process(HttpServletRequest request)
      throws InvalidLoginException, InvalidParameterException, SQLException,
      InvalidFormException, UnauthorizedRequestException,
      SessionOutOfTimeException {
    // hash to store the action string and UpdateAction class pair
    Map<String, UpdateAction> actionsMap = new HashMap<String, UpdateAction>();
    actionsMap.put(null, new DefaultAction());
    actionsMap.put("view_symbol", new ViewSymbolAction());
    actionsMap.put("edit_symbol", new EditSymbolAction());
    actionsMap.put("save_symbol", new SaveSymbolAction());
    actionsMap.put("search", new SearchAction());
    actionsMap.put("modify_symbol", new ModifySymbolAction());
    actionsMap.put("associate_loci_pub", new AssociateLociPubAction());
    actionsMap.put("associate_loci", new AssociateLociAction());
    actionsMap.put("associate_org", new AssociateOrgAction());
    actionsMap.put("associate_person", new AssociatePersonAction());
    actionsMap.put("associate_pubs", new AssociatePubsAction());
    actionsMap.put("remove_loci", new RemoveLociAction());
    actionsMap.put("remove_pubs", new RemovePubsAction());
    actionsMap.put("confirm_all", new ConfirmAllAction());
    actionsMap.put("submit_symbol", new SubmitSymbolAction());
    actionsMap.put("curator_approve", new CuratorApproveAction());
    actionsMap.put("approve_symbol", new ApproveSymbolAction());

      	// look up the appropriate action here
        UpdateAction action = (UpdateAction)actionsMap.get(request.getParameter("update_action"));
        action.verify(request);
       	return  action.execute(request);
       
    }

} 
