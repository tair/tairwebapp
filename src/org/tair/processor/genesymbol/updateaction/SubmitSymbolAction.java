// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// -----------------------------------------------------------------------
package org.tair.processor.genesymbol.updateaction;

import java.sql.*;
import java.util.*;
import javax.servlet.http.*;

import org.tair.bs.community.BsCommunity;
import org.tair.bs.community.CommunityDelegate;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.community.*;
import org.tair.db.community.CommunityFactory;
import org.tair.handler.*;
import org.tair.querytools.*;
import org.tair.tfc.*;
import org.tair.utilities.*;

import org.tair.processor.genesymbol.*;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;
public class SubmitSymbolAction extends UpdateAction {
    public SubmitSymbolAction () {
	super("submit_symbol");
    }
   /**
     * submit symbol to database.
     * @param request HttpServletRequest forwarded from GeneSymbolHandler Servlet
     * @return RequestHandlerResponse containing URL to forward user to
     * @exception InvalidLoginException thrown if user is not logged in
     * @exception SQLException thrown if a database error occurs
     * @exception SessionOutOfTimeException thrown if session out of time
     * @exception InvalidParameter exception thrown if invalid update_action, id or data received
     */
    
    public RequestHandlerResponse execute(HttpServletRequest request)
	throws SQLException,  UnauthorizedRequestException,
               InvalidParameterException,
	       InvalidLoginException, SessionOutOfTimeException {
	CompositeGeneClassSymbol symbol = 
	    getCompositeGeneSymbolFromSession ( request );
        RequestHandlerResponse response = new RequestHandlerResponse();
	try {
      connectionPool = DBWriteManager.getInstance();
      conn = connectionPool.get_connection();
      symbol.store(conn);
      // commit here and return connection before query below
      if (conn != null) {
        DatabaseManager.return_connection(conn);
        conn = null;
      }
      // inform curators
      SymbolMailer mailer = new SymbolMailer();
      // TAIR-425: Add submitter email as the from address
      if (symbol.get_submitter_id() != null) {
        CommunityDelegate delegate = CommunityDelegateFactory.getCommunityDelegate();
        IPrimaryKey key = CommunityFactory.getCommunityPrimaryKey(symbol.get_submitter_id());
        BsCommunity community = delegate.getObject((SequencePrimaryKey)key);
        if (community.getEmail() != null) {
          mailer.setSubmitterEmail(community.getEmail());
        }
      }
      mailer.sendSubmitNoticeToCurator(symbol);

    } finally {
      // remove from session no matter what
      removeCompositeGeneSymbolFromSession(request);

      if (conn != null) {
        DatabaseManager.return_connection(conn);
      }
    }
	response.setPage( "/jsp/processor/genesymbol/thanks.jsp" ); 
	return response ;  
    }

}
