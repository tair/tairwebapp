<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>


<%@ page import="org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "No Search Results";
String highlight = "1";
%>

<%
String searchPage = (String) request.getAttribute( "searchPage" );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

    <table cellpadding="3" align="center" width="400">

      <tr>
	<td align="center"><font class="errorheader">No results for your query</font></td>
      </tr>


      <tr>
	<td align="center"><a href="<%= searchPage %>">Search again</a></td>
      </tr>
</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
