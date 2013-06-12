<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "Logged Out";
String highlight = "1";
 %>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<table align="center" cellpadding="3">
      <tr>
	<td align="center"><font class="mainheader">User Logged Out</font></td>
      </tr>
      <tr>
	<td>
	  You have been logged out. If this was a mistake, <a href="/servlets/Community?action=login">Login</a> here again.
	</td>
      </tr>
      <tr>
	<td align="center"><a href="/index.jsp">Return</a> to TAIR home page.</td>
      </tr>
</table>
	

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
