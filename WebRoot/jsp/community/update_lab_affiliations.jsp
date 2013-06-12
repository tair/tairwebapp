<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>


<%@ page import="java.util.*, org.tair.utilities.*, org.tair.community.*, org.tair.bs.community.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "Update Affiliations"; 
String highlight = "1";
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
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<center>
<font class="mainheader">Update Lab Affiliations</font>
<br>

Below is a list of current lab affiliations for this person.<br>
Remove affiliations by checking the box next to them and submitting.
</center>

<form action="/servlets/Community" method="post">

<table cellpadding="3" cellspacing="2" border="0" align="center">

	<tr>
	  <td align="center"><font class="formheader">Delete?</font></td>
	  <td><font class="formheader">Contact Person?</font></td>
	  <td><font class="formheader">PI</font></td>
	  <td><font class="formheader">Name</font></td>
	  <td align="center"><font class="formheader">My Title</font></td>
	</tr>

<%
    if ( person.getAllLabs().size() > 0 ) {
    for (BsAffiliation affiliation : person.getAllLabs()) {
         boolean isContact = affiliation.getContactPerson() != null && affiliation.getContactPerson();
         boolean isPI = affiliation.getPi() != null && affiliation.getPi();
         String piName = isPI ? "self" : EmptyTextConverter.convert(affiliation.getPiName());
%>

      <tr>
	<td align="center">
            <% if ( !isPI || LoginChecker.isTairCurator( request )  ) { %>
	         <input type="checkbox" name="delete" value="<%=affiliation.getOrganizationId() %>">
	    <% } else { %>
               N/A
	       <input type="hidden" name="pi" value="<%= affiliation.getOrganizationId() %>">
	    <% } %>
        </td>
	<td align="center"><%= HTMLFactory.createCheckBox( "contact", affiliation.getOrganizationId().toString(), isContact ) %></td>
	<td><%= piName %></td>
	<td><%= affiliation.getOrganization().getName() %></td>
	<td><%= HTMLFactory.createTitleSelect( "title_" + affiliation.getOrganizationId(), affiliation.getJobTitle(), true ) %></td>
      </tr>


         <% } %>
      <% } %>

      <tr>
	<td colspan="5" align="center">
	  <input type="hidden" name="action" value="affiliate">
	  <input type="hidden" name="aff_action" value="update_lab">
	  <input type="submit" name="update" value="Submit">
	  &nbsp;&nbsp;&nbsp;
	  <input type="button" name="return" value="Back to Profile" onClick="document.location.href='/servlets/Community?action=redirect&req_page=personProfile'">
	</td>
      </tr>

</table>
</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
