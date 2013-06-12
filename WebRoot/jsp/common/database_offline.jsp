<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
import="org.tair.utilities.*"
%>

<%!
String pageName = "Database Offline";
String highlight = "1";
%>

<%
DatabaseServerOfflineException e = (DatabaseServerOfflineException) request.getAttribute( "exception" );
String errMsg = e.getMessage();
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>


<table width="100%" cellpadding="2">
      <tr>
	<td align="center"><font class="errorheader">Database Offline</font></td>
      </tr>

      <tr>
	<td align="center">
	  <% if ( errMsg != null ) { %>
	      <%= errMsg %>
          <% } else { %>

	  The TAIR database is currently unavailable due to scheduled downtime for
	  maintenance.  Service will be restored as soon as possible.

	  <% } %>
	   
	</td>
      </tr>
</table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
