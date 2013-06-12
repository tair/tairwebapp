<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "No Search Results";
String highlight = "2";
%>



<% 
// Page to display if no results after searching for profile to get login reminder


String last_name = request.getParameter( "last_name" );
String first_name = request.getParameter( "first_name" );

%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

    <table cellpadding="3" align="center" width="400">

      <tr>
	<td align="center">
  
           The person <font class="errorheader">
            <% if ( last_name != null ) {  %> 
                 <%= last_name %><%= " " %> 
            <% } %>

            <% if ( first_name != null ) { %>
                 <%= first_name %> 
            <% } %>
            </font> 
            was not found in our database. If the name is incorrect, please go back and search again.
   
          </td>
      </tr>


      <tr>
	<td align="center">
           <form action="/servlets/Community" method="POST">      
             <input type="hidden" name="action" value="edit">
             <input type="hidden" name="new" value="true">
	     <input type="hidden" name="searched" value="true">
             <input type="hidden" name="type" value="person">
             <input type="submit" value="Add New Profile">
             <input type="button" value="Search Again" onClick="document.location.href='/servlets/Community?action=remind'">
	   </form>
      </td>
    </tr>

</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
