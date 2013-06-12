<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>


<%@ page import="org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "Login Search";
String highlight = "2";
%>
  

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>


<center>
<font class="mainheader">User Search</font>
<p>
Find your record in the TAIR database by entering your last and/or first name below.

</center>

<form action="/servlets/Community" method="post">

<table cellspacing="0" border="0" cellpadding="3" align="center">

	<tr>
	  <td><font class="formheader">Last Name:</font></td>
	  <td><%= HTMLFactory.createSearchMethodSelect( "last_name_method", DataConstants.SEARCH_CONTAINS, false ) %></td>
	  <td><input type="text" name="last_name" size="20" maxlength="30" value=""></td>
	</tr>

	<tr>
	  <td><font class="formheader">First Name:</font></td>
	  <td><%= HTMLFactory.createSearchMethodSelect( "first_name_method", DataConstants.SEARCH_CONTAINS, false ) %></td>
	  <td><input type="text" name="first_name" size="20" maxlength="30" value=""></td>
	</tr>

	<tr>
	  <td colspan="3" align="center">
	    <input type="hidden" name="action" value="remind">
	    <input type="hidden" name="remind_action" value="search">
	    <input type="submit" name="search" value="Search">
	</td>
      </tr>

</table>
</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
