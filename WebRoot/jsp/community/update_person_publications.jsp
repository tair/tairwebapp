<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>


<%@ page import="java.util.*, org.tair.utilities.*, org.tair.community.*, org.tair.querytools.*, org.tair.bs.community.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "Delete Publications"; 
%>

<% 
BsPerson person = null;
try {
      person = SessionHandler.getPerson( request );
} catch ( InvalidSessionException e ) {
      request.setAttribute( "exception", e );
      pageContext.forward( "/jsp/common/session_error.jsp" );
}
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<center>
<font class="mainheader">Delete Publications</font>
<br>

Below is a list of current publications associated to this person.<br>
Remove publications by checking the box next to them and submitting.
</center>

<form action="/servlets/Community" method="post">

<table cellpadding="3" cellspacing="2" border="0" align="center">
	
	<tr>
	  <td align="center"><font class="formheader">Delete?</font></td>
	  <td><font class="formheader">Publication Title</font></td>
	  <td align="center"><font class="formheader">Source</font></td>
	  <td align="center"><font class="formheader">Year</font></td>
	</tr>

<%
    for (BsCommunityPublication pub : person.getCommunity().getPublications()) {
%>

      <tr>
	<td align="center"><input type="checkbox" name="delete" value="<%= pub.getReferenceId() %>"></td>
	<td><a href="/servlets/TairObject?type=publication&id=<%= pub.getReferenceId() %>"><%= pub.getTitle() %></a></td>
	<td><%= pub.getSource() %></td>
	<td><%= pub.getPublicationYear() %></td>
      </tr>
      

      <% } %>

      <tr>
	<td colspan="4" align="center">
	  <input type="hidden" name="action" value="publication">
	  <input type="hidden" name="pub_action" value="edit_pubs">
	  <input type="submit" value="Submit and Commit Changes">
	  &nbsp;&nbsp;&nbsp;
	  <input type="button" name="return" value="Back to Profile" onClick="document.location.href='/servlets/Community?action=redirect&req_page=personProfile'">
	</td>
      </tr>

</table>
</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
