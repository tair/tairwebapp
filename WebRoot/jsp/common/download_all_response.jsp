<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, java.util.*" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<%!
String pageName = "Download All Response";
String highlight = "2";
%>
<% 
String url = ( String )request.getAttribute( "downloadURL" );
String searchUrl = ( String )request.getAttribute( "searchUrl" );  
%>

<table align="center" width="100%">
      <tr>
	<td align="center"><font class="mainheader">Download results are being processed.</font></td>
      </tr>
      <tr>
	<td align="center">Your results are being processed, when completed you
will be sent an email with a link to <a href="<%=url%>">this</a> URL where your results will be
posted. The results will be available at this URL for 24 hours.
	</td>
      </tr>
      <tr>
	<td align="center">
  	      <a href="<%=searchUrl%>">Click to start a new search</a>
	</td>
      </tr>

</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
