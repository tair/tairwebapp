<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page isErrorPage="true" %>
<%@ page import="org.tair.abrc.*, java.io.*" %>

<%! 
String pageName = "Error"; 
String highlight = "1";
%>

<% 
pageContext.getServletContext().log("JSP Error", exception);
boolean debug = ( request.getParameter( "debug" ) != null && request.getParameter("debug").equals( "true" ) );
debug = true;
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<table cellpadding="5" align="center" width="500">
	<tr>
		<td colspan=2><font color="red">An error occurred!</font></td>
	</tr>
	<tr valign="top">
		<td nowrap>Error Message:</td>
		<td><%=exception.getMessage()%></td>
	</tr>

      <% if ( debug ) { %>
      <tr>
	<td>Stack Trace</td>

	<td><%
	     StringWriter sw = new StringWriter();
	     PrintWriter pw = new PrintWriter(sw);
	     exception.printStackTrace(pw);
	     out.println(sw);
	  %>
	</td>

      <% } %>
</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
