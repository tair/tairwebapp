<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

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

Iterator<BsAffiliation> affiliatePersons = organization.getAffiliation().iterator();
boolean personAffiliations = affiliatePersons != null;
boolean curator = LoginChecker.isTairCurator( request );
boolean isLab = ( DataConstants.getLabType().equals( organization.getOrganizationType() ) );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<center>
<font class="mainheader">Update Members</font>
<br>

Below is a list of current MEMBERS of this organization.<br>
Remove members from this organization by checking the box next to each person and submitting.
</center>

<form action="/servlets/Community" method="post">

<table cellpadding="3" cellspacing="2" border="0" align="center" width="450">
     <% if ( personAffiliations ) { %>
      <tr>
	<td align="center" class="sm"><font class="formheader">Delete?</font></td>
	<td align="center" nowrap class="sm"><% if ( curator && isLab ) { %><font class="formheader">PI?</font><% } %></td>
	<td align="center" class="sm"><font class="formheader">Contact Person?</font></td>
	<td nowrap class="sm"><font class="formheader">Name</font></td>
	<td nowrap align="center" class="sm"><font class="formheader">Title W/Organization</font></td>
      </tr>
      
	<% 
	   while ( affiliatePersons.hasNext() ) {
	      BsAffiliation affiliation = affiliatePersons.next();
	      String communityId = ( affiliation.getCommunityId() != null ) ? affiliation.getCommunityId().toString() : "null";
              boolean isPI = ( affiliation.getPi() != null && affiliation.getPi() );
              String piStr = ( isPI ) ? "*" : "";
	%>

      <tr>
	<td align="center" class="sm">
	  <% if ( curator || !isPI ) { %><input type="checkbox" name="delete" value="<%= communityId %>"><% } else { %>N/A<% } %>
	</td>

	<td align="center" class="sm">
	  <% if ( curator && isLab ) { %>
	    <%= HTMLFactory.createCheckBox( "pi", communityId, affiliation.getPi() ) %>
	  <% } else if ( isPI ) { %>
	     <input type="hidden" name="pi" value="<%= communityId %>">
	  <% } %>
	</td>

	<td align="center" class="sm"><%= HTMLFactory.createCheckBox( "contact", communityId, affiliation.getContactPerson() ) %></td>
      
	<td class="sm"><%= piStr %><%= affiliation.getMember().getName() %></td>
	<td class="sm" align="center"><%= HTMLFactory.createTitleSelect( "title_" + communityId, affiliation.getJobTitle(), true ) %></td>
      </tr>

         <% } %>

      <tr>
	<td colspan="5"><br>* denotes Primary Investigator for this organization</td>
      </tr>

      <% } %>




      <tr>
	<td align="center" colspan="5">
	  <input type="hidden" name="action" value="affiliate">
	  <input type="hidden" name="aff_action" value="update_member">
	  <input type="submit" name="remove" value="Submit">
	  &nbsp;&nbsp;&nbsp;
	  <input type="button" name="return" value="Back to Profile" onClick="document.location.href='/servlets/Community?action=redirect&req_page=orgProfile'">
	</td>
      </tr>
</table>
</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
