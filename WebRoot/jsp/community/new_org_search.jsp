<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "New Organization Search";
String highlight = "2";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>


<center>
<font class="mainheader">New Organization Search</font>
<P>In order to avoid duplicated entries, please check to see if your organization exists 
   in TAIR's database.
<P>Type the name of your organization and click on search.
</center>

<form action="/servlets/Community" method="post">

<table cellspacing="0" border="0" cellpadding="3" align="center">

	<tr>
	  <td><font class="formheader">Organization Name:</font></td>
	  <td><%= HTMLFactory.createSearchMethodSelect( "name_method", DataConstants.SEARCH_CONTAINS, false ) %></td>
	  <td><input type="text" name="name" size="30" maxlength="100" value=""></td>
	</tr>
	<tr>
	  <td colspan="3" align="center">
	    <input type="hidden" name="action" value="search">
	    <input type="hidden" name="path" value="duplicate_org">
	    <input type="submit" name="search" value="Search">
	</td>
      </tr>

</table>
</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
