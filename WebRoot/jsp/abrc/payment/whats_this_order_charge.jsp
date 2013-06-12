<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page errorPage="/jsp/common/gen_error.jsp"%>

<%!String pageName = "What's This Order Charge";
  String highlight = "1";%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush="true">
	<jsp:param name="pageName" value="<%= pageName %>" />
	<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<table align="center">
	<tr>
		<br>
		<td align="center">
			<font class="mainheader">Order Charge</font>
		</td>
	</tr>
	<tr>
		<td>
			<br>
			This charge covers shipping and handling of your order. Seeds are
			shipped separately from other types of stocks, so if your order
			contains both seed and other stocks, the charge will be higher.
			<br>
		</td>
	</tr>
</table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
