<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
import = "org.tair.utilities.*"
%>

<%!
String pageName = "Order Updated";
String highlight = "7";
%>

<%
String orderID = request.getParameter( "orders_id" );
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>


<table align="center" cellpadding="3">
      <tr>
	<td align="center">
	  <font class="mainheader">Order Updated</font>
	</td>
      </tr>

      <tr>
	<td align="center">
	  <form action="/servlets/Order">
	    <input type="hidden" name="state" value="search">
	    <input type="hidden" name="search_action" value="detail">
	    <input type="hidden" name="mode" value="user">
	    <input type="hidden" name="orders_id" value="<%= orderID %>">
	    <input type="submit" value="Back to Order Details">
	  </form>
	</td>
      </tr>
</table>





<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
