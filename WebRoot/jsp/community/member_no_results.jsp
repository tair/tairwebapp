<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, org.tair.community.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "No Search Results";
String highlight = "2";
%>

<%
// no results page for adding members to organization
String last_name= request.getParameter( "last_name" );
String first_name= request.getParameter( "first_name" );

// determine if this is first time through profile sequence
// for new organization to determine which page to return to
// for searching again
CommunityState state = SessionHandler.getCommunityState( request );
boolean first = state.getBooleanValue( "first_org" );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

    <table cellpadding="3" align="center" width="400">

      <tr>
	<td align="center"> 
            The person <font class="errorheader">
             <% if ( last_name != null ) { %> 
                 <%= last_name + " " %> 
             <% } %>

             <% if ( first_name != null ) { %>
                 <%= first_name %> 
             <% } %>
            </font> 
            was not found in our database. If the name is incorrect, please go back and search again.
 

    </td>
      </tr>

    <form action="/servlets/Community" method="POST">
      <input type="hidden" name="action" value="redirect">


      <tr>
	<td align="center">
	  <br>


             <% if ( first ) { %>
                <input type="hidden" name="req_page" value="memberSearch">
	        <input type="submit" value="Search Again">
	         &nbsp;&nbsp;&nbsp;
                <input type="button" value="Continue" onClick="document.location.href='/servlets/Community?action=redirect&req_page=orgProfile'">
             <% } else { %>
                <input type="hidden" name="req_page" value="orgProfile">
                <input type="submit" value="Return to Profile"> 
             <% } %>

        </td>
      </tr>

   </form>
</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
