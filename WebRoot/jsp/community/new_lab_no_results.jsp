<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, org.tair.community.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "No Search Results";
String highlight = "2";
%>

<%
// display no results for duplicate search
// when trying to add new lab

String lab_name = request.getParameter( "name" );
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
  
           The lab <font class="errorheader"><%= lab_name %></font> 
           was not found in our database. If the name is incorrect, please go back and search again.
        </td>
      </tr>


      <tr>
	<td align="center">
	  <br>
            <form action="/servlets/Community" method="POST">      
              <input type="hidden" name="action" value="edit">
              <input type="hidden" name="type" value="organization">
              <input type="hidden" name="lab" value="true">
              <input type="hidden" name="new" value="true">
              <input type="hidden" name="pi" value="true">
	          <input type="hidden" name="searched" value="true">
              <input type="submit" value="Add New Lab">
	        &nbsp;&nbsp;&nbsp;

                <% if ( !first ) { %>
                   <input type="button" value="Return to Profile" onClick="document.location.href='/servlets/Community?action=redirect&req_page=personProfile'">
                 <% } %>
  	    </form>
      </td>
    </tr>

</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
