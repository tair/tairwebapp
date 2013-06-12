<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<!--
  This page is obsolete
  TODO Remove it.
-->

<%@ page import="java.util.*, org.tair.utilities.*, org.tair.community.*, org.tair.bs.community.*" %>
<%//@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "Update Affiliations";
String highlight = "1";
 %>

<%     
BsOrganization organization = null;
try {
      organization = SessionHandler.getOrganization( request );
} catch ( InvalidSessionException e ) {
      request.setAttribute( "exception", e );
      pageContext.forward( "/jsp/common/session_error.jsp" );
}

boolean curator = LoginChecker.isTairCurator( request );

%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<center>
<font class="mainheader">Update Affiliations</font>
<br>

Below is a list of affiliated organizations for this organization.<br>
Remove affiliations by checking the box next to them and submitting.
</center>

<form action="/servlets/Community" method="post">

<table cellpadding="2" cellspacing="0" border="0" align="center" width="350">
      <tr>
	<td colspan="2" align="center">
	  <input type="hidden" name="action" value="affiliate">
	  <input type="hidden" name="aff_action" value="update">
	  <input type="submit" name="remove" value="Submit">
	  &nbsp;&nbsp;&nbsp;
	  <input type="button" name="return" value="Back to Profile" onClick="document.location.href='/servlets/Community?action=redirect&req_page=orgProfile'">
	</td>
      </tr>

</table>
</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
