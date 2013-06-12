<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, org.tair.community.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "No Search Results";
String highlight = "2";
%>

<%
// no results page for person's search for
// non-lab organizations to affiliate to

String name = request.getParameter( "name" );

CommunityState state = SessionHandler.getCommunityState( request );
boolean first = state.getBooleanValue( "first_person" );

%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

    <table cellpadding="3" align="center" width="400">

      <tr>
	<td align="center">
           The organization <font class="errorheader"><%= name %></font> 
           was not found in our database. If the name is incorrect, please 
           go back and search again.
         </td>
      </tr>


      <tr>
	<td align="center">
	  <br>

          <form action="/servlets/Community" method="POST">
             <input type="hidden" name="action" value="edit">      
             <input type="hidden" name="new" value="true">
             <input type="hidden" name="type" value="organization">
             <input type="hidden" name="searched" value="true">
             <input type="submit" value="Add New Organization">
              &nbsp;&nbsp;&nbsp;

              <% if ( first ) { %>
                 <input type="button" value="Search Again" onClick="document.location.href='/servlets/Community?action=redirect&req_page=personAff'">
                  &nbsp;&nbsp;&nbsp;
                 <input type="button" value="Continue" onClick="document.location.href='/servlets/Community?action=redirect&req_page=personProfile'">           
              <% } else { %>
                 <input type="button" value="Return to Profile" onClick="document.location.href='/servlets/Community?action=redirect&req_page=personProfile'"> 
              <% } %>
  	  </form>

      </td>
    </tr>

</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
