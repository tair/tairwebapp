<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, org.tair.community.*" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<%!
String pageName = "Search for Members"; 
String highlight = "2";
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<table align="center" width="400">
      <tr>
	<td align="center"><font class="mainheader">Search for Members</font></td>
      </tr>
      <tr>
	<td>
	  <p>
	    If members of your lab or organization are in the TAIR database, you can affiliate them
	    to your lab by entering the last name of the individual.
	  <p>
	    If you do not want to affiliate any members to your organization, click "Continue" to complete
	    your registration.
	</td>
      </tr>
</table>

<form action="/servlets/Community" method="post">

<table cellspacing="0" border="0" cellpadding="3" align="center">

	<tr>
	  <td><font class="formheader">Last Name</font></td>
	  <td><%= HTMLFactory.createSearchMethodSelect( "last_name_method", DataConstants.SEARCH_CONTAINS, false ) %></td>
	  <td>
	    <input type="text" name="last_name" size="20" maxlength="30" value="">
	  </td>
	</tr>

	<tr>
	  <td><font class="formheader">First Name:</font></td>
	  <td><%= HTMLFactory.createSearchMethodSelect( "first_name_method", DataConstants.SEARCH_CONTAINS, false ) %></td>
	  <td><input type="text" name="first_name" size="20" maxlength="30" value=""></td>
	</tr>

	<tr>
	  <td>&nbsp;</td>
	  <td>
            <input type="hidden" name="action" value="search">
	    <input type="hidden" name="path" value="member">
	    <input type="submit" value="Search">
	    &nbsp;&nbsp;&nbsp;
	    <input type="button" value="Continue" onClick="document.location.href='/servlets/Community?action=redirect&req_page=orgProfile'">
	</td>
      </tr>

</table>
</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
