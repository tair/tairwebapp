/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.tree;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.tair.handler.RequestHandler;
import org.tair.handler.RequestHandlerResponse;
import org.tair.search.SearchSession;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.InvalidParameterException;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.SessionOutOfTimeException;
import org.tair.utilities.TextConverter;

/**
  * TreeHandler handles
  */


public class TreeHandler implements RequestHandler {

  private String tree_jsp;
  private String type = "tree";
  private String tree_type;
  private String session_id;
  private Long node_id;
  private Long id;
  private String root_id;
  private SearchSession searchSession;
  private HttpServletRequest request;
  private String node_option; 

  public TreeHandler() { }
  
  public RequestHandlerResponse process( HttpServletRequest request ) throws SQLException, InvalidParameterException, InvalidFormException, SessionOutOfTimeException {

    // action might be in "action" or "search_action"  - tree view pages use search action
    // because of conflicts with form.action attribute in javascript in Mac IE 4.5
    String action = request.getParameter( "action" );
    // note - need to handle action on mac?
    RequestHandlerResponse response = new RequestHandlerResponse();
    setRequest( request );    
    // set tree type based on parameter passed in 
    setTreeType();
    // set id based on id passed in - unique identifier to temp table that holds the tree nodes
    // this is a keyword id( or some entity id ) upon initialization of the tree but during manipulation of 
    // the tree this will hold a unique id for a row in the tree temp table --- becuase entity id is not unique enough to 
    // handle multiple parents 
    setNodeID();
    setID();
    setRootID();
    // set jsp based on tree type passed in, using TreeTypes 
    setTreeJsp( getTreeType() );
    // set the user specified node option , such as annotation types and counts thses will be calculated and stored in the 
    // tree temp table for each node -- as opposed to a lookup at the time of display for the tree   
    setNodeOption();   
   
    // registers the search action with SearchSession and initiates the TreeBuilder with the specified root id 
    // and session id      
    if ( action != null && action.equals( "new_tree" ) ) {
      searchSession = SessionHandler.getSearchSession( getRequest(), getType() );
      TreeBuilder.initializeTree( getQueryID(), getTreeType(), getNodeID() );

    // checks for active tree action in SearchSession and inserts new node/s into temp table for the expanded node  
    } else if ( action != null && action.equals( "expand" ) ) {
      searchSession = SessionHandler.getSearchSession( getRequest() );	
      if ( searchSession != null && searchSession.searchInProgress( getType() ) ) {
	TreeBuilder.expand( getQueryID(), getTreeType(), getID(), getNodeOption() );
      } else {
        throw new SessionOutOfTimeException( "No tree action in progress" );
      }  
    // checks for active tree action in SearchSession and deletes node/s from temp table for the collapsed node         
    } else if ( action != null && action.equals( "collapse" ) ) {	           
      searchSession = SessionHandler.getSearchSession( getRequest() );	
      if ( searchSession != null && searchSession.searchInProgress( getType() ) ) {
	TreeBuilder.collapse( getQueryID(), getTreeType(), getID() );
      } else {
	throw new SessionOutOfTimeException( "No tree action in progress" );
      }
    // checks for active tree action in SearchSession and updates node/s from temp table for the selected node options         
    } else if ( action != null && action.equals( "new_options" ) ) {	           
      searchSession = SessionHandler.getSearchSession( getRequest() );	
      if ( searchSession != null && searchSession.searchInProgress( getType() ) ) { 
	TreeBuilder.updateTree( getQueryID(), getTreeType(), getNodeOption() );
      } else {
	throw new SessionOutOfTimeException( "No tree action in progress" );
      }
    } else {
      response.setAttribute("exception", new InvalidParameterException( "Invalid action requested: " + action ));
      response.setPage("/jsp/tairjsp/invalid_parameter.jsp");

    }
    response.setAttribute( "node_id", getNodeID() );
    response.setAttribute( "id", getID() );
    response.setAttribute( "root_id", getRootID() );
    response.setPage( getTreeJsp() );
    response.setAttribute( "display_option", getNodeOption() );
    return response;
  }

    // returns this tree type 
  private String getTreeType() { return tree_type; }

    // sets this tree type 
  private void setTreeType() { tree_type = getRequest().getParameter( "tree_type" ); }

    // returns parameter node_id 
  private Long getNodeID() { return node_id; }

    // sets passed in node_id
  private void setNodeID() { node_id = new Long( getRequest().getParameter( "node_id" ) ); }

    // returns parameter id 
  private Long getID() { return id; }

    // sets passed in id
  private void setID() { if ( getRequest().getParameter( "id" ) != null ) id = new Long( getRequest().getParameter( "id" ) ); }
  private void setRootID() { 
	if (getRequest().getParameter("root_id") != null ) { 
		root_id = new String ( getRequest().getParameter("root_id") ); 
	} else { 
		root_id = getNodeID().toString();
	} 
   }
    // returns this action type 
  private String getType() { return type; }
  private String getRootID() { return root_id; }  
  private String getQueryID() { 
      return SessionHandler.getSessionUuid(getRequest()) + "_" + getRootID();
  }

    // sets this tree type's jsp 
  private void setTreeJsp( String tree_type ) { tree_jsp = TreeTypes.getTreeJsp( tree_type ); }

    // returns this tree type's jsp    
  private String getTreeJsp() { return tree_jsp; } 

    // sets user invoked node option, radio button selection, used to be a checkbox -- stored in a map to be passed to TreeBuilder
  private void setNodeOption() { 
    if ( !TextConverter.isEmpty( getRequest().getParameter("display_option") ) ) node_option = ( String )getRequest().getParameter("display_option");
  }

    // returns the string that contains user selected node option    
  private String getNodeOption() { return node_option; } 

    // sets a handle to this request object 
  private void setRequest( HttpServletRequest request ) { this.request = request; }

    // returns a handle to this request object       
  private HttpServletRequest getRequest() { return request; } 

}
