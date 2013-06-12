<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>


<%@ page import="org.tair.utilities.*, org.tair.community.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "No Search Results";
String highlight = "2";
%>

<%
// no results page for persons searching for lab/PI
// to affiliate to
String last_name= request.getParameter( "last_name" );
String first_name= request.getParameter( "first_name" );

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
             The PI <font class="errorheader">
               <% if ( last_name != null ) { %> 
                  <%= last_name + " " %> 
               <% } %>

               <% if ( first_name != null ) { %>
                  <%= first_name %> 
               <% } %>
              </font> was not found in our database. 
              If the name is incorrect, please go back and search again.
        </td>
      </tr>


      <tr>
	<td align="center">
	  <br>
           <form action="/servlets/Community" method="POST">      
              <input type="hidden" name="action" value="redirect">
                 <input type="hidden" name="req_page" value="personProfile">

              <% if ( first ) { %>
                 <input type="button" value="Search Again" onClick="document.location.href='/servlets/Community?action=redirect&req_page=personAff'">           
                  &nbsp;&nbsp;&nbsp;
                 <input type="submit" value="Continue">

              <% } else { %>
                 <input type="submit" value="Return to Profile"> 
              <% } %>
                 &nbsp;&nbsp;&nbsp;
                <P>

                 Don't see your PI? Ask your PI to fill up a registration form or 
                 <A href="mailto:curator@acoma.stanford.edu">contact</A> the TAIR curators for further assistance.

	</form>
      </td>
    </tr>

</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
