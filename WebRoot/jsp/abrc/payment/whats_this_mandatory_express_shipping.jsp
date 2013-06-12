<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page errorPage="/jsp/common/gen_error.jsp"%>

<%!String pageName = "What's This Mandatory Expresss Shipping";
  String highlight = "1";%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush="true">
	<jsp:param name="pageName" value="<%= pageName %>" />
	<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<table align="center">
	<tr>
		<br>
		<td align="center">
			<font class="mainheader">Mandatory Express Shipping</font>
		</td>
	</tr>
	<tr>
		<td>
			<p>
				Your order includes at least one stock that requires express
				shipping, such as a library that must be shipped on dry ice or a
				stock that is perishable or expensive to produce.
			</p>
			<p>
				For international orders, please check with your local customs
				representative to determine other import documents that may be
				required. For library orders, also please check to determine whether
				or not you can receive shipments containing dry ice from the US.

			</p>
		</td>
	</tr>
</table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
