<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, org.tair.community.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "Changes Committed";
String highlight = "1";
 %>

<%

CommunityState state = SessionHandler.getCommunityState( request );

// If phantom == true, new person got here by adding new lab/PI/org.
// In this case, person must complete their personal profile to
// make sure affiliation to new org. is stored (since person's 
// community id is null until they are saved to db for the first
// time
boolean phantom = state.getBooleanValue( "phantom" );

// solo tracks if org profile was updated on its own, or
// as part of a person's updates. If solo is true, user
// will be given button to return to home page
boolean solo = state.getBooleanValue( "solo" );

// Clean up community state object now that organization maintenance 
// is complete.
// 
// If organization was updated on its own (i.e. solo is true),
// can completely remove community state object from session,
// otherwise, if person profile maintenance is still in progress,
// need to manually remove org. specific parameters and set
// type param back to "person"
if ( solo ) {
      SessionHandler.removeCommunityState( request );
} else {
      state.removeStateValue( "phantom" );
      state.removeStateValue( "new_org" );
      state.removeStateValue( "solo" );
      state.removeStateValue( "lab" );

      state.setStateValue( "type", "person" );
}

%>  

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>
<table align="center" width="550">


      <tr>
	<td align="center"><font class="mainheader">Changes Committed to Database</font></td>
      </tr>
      <tr>
	<td align="center">
	  <p>
	    Your information has been recorded. 

	    <% if ( phantom ) { %>
	        <font class="req">YOU MUST CONTINUE</font> to complete your personal profile.
   	    <% } %>
	</td>
      </tr>

      <tr>
	<td align="center" nowrap>
	  <p>
	  <form action="/servlets/Community" method="post">	    
             <input type="hidden" name="action" value="redirect">

                <% if ( solo ) { %>
	           <input type="button" value="Back to Personal Home Page" onClick="document.location.href='/servlets/Community?action=login'">

	        <% } else { %>

	           <input type="hidden" name="req_page" value="personProfile">
  	           <input type="submit" value="Complete Personal Profile">
                <% } %>
	    
          </form>

        </td>
      </tr>
</table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
