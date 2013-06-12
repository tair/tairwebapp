<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "Stock Number Not Found";
String highlight = "7";
%>

<%
String stockNumber = request.getParameter( "stock_number" );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>


<table align="center" cellpadding="2">
      <tr>
	<td align="center"><font class="mainheader">Stock number <%= stockNumber %> not found</font></td>
      </tr>

      <tr>
	<td class="sm">
	  The stock number you have requested is not in our database.
	  The stock has not been donated to ABRC or the stock number is incorrect.
	</td>
      </tr>
</table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
