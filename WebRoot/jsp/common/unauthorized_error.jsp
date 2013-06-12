<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>


<%@ page isErrorPage="true" %>

<%@ page import="org.tair.utilities.*" %>

<%!
String pageName = "Unauthorized Request"; 
String highlight = "1";
%>

<% UnauthorizedRequestException e = ( UnauthorizedRequestException ) request.getAttribute( "exception" ); %>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<table cellpadding="5" align="center">
      <tr>
	<td colspan="2" align="center"><font class="errorheader"><%= e.getMessage() %></font></td>
      </tr>
      <tr valign="top">
	<td>
	  If you believe you have received this message in error, 
	  <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">contact the TAIR curators</a>.
	</td>
      </tr>
</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
