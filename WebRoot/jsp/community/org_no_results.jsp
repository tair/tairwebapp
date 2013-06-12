<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>


<%@ page import="org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "No Search Results";
String highlight = "2";
%>

<%

// no results page when searching for parent organizations
// to affiliate another organization to

String name = request.getParameter( "name" );
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
              <input type="hidden" name="action" value="redirect">
              <input type="hidden" name="req_page" value="orgProfile">
              <input type="submit" value="Return to Profile"> 
             </form>
        </td>
      </tr>

</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
