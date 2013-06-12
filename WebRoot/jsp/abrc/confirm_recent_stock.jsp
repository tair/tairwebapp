<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
import="org.tair.abrc.*, org.tair.abrc.stock.*, org.tair.utilities.*, java.util.*, org.tair.community.*"
%>

<%
ListStock stock;
List<ListStock> stocks;
Map<Long,List<ListStock>> recent = (Map<Long,List<ListStock>>) request.getAttribute("recentStocks");
Boolean b = (Boolean) request.getAttribute("comment_missing");
boolean comment_missing = b != null && b.booleanValue();
boolean curator = LoginChecker.isTairCurator(request);
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="Confirm Stock Order" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<form action="/servlets/Order/current" method="post" name="orderForm">
<input type="hidden" name="cmd" value="reship">
<table width="100%" align="center" cellpadding="2">
	<tr>
		<td align="center" colspan="2"><font class="mainheader">Confirm Recent Stock Order</font></td>
	</tr>

	<tr>
		<td colspan="2">
		<p>The stocks listed below were ordered by a member of your lab within the last 60 days.</p>
		<p>To remove the stock from your order, select "Delete" and "Continue". To order the stock, select "Continue".</p>
		<% if(comment_missing) { %>
		<p class="errorheader" style="text-align:center">Please enter a comment if requesting reship stocks</p>
		<% } %>
		</td>
	</tr>

	<tr valign="top">
		<td align="center">
		<table cellpadding="2" cellspacing="0" border="0" width="100%">
		<tr>
			<td class="sm" align="center"><font class="formheader">Delete</font></td>
			<td class="sm"><font class="formheader">Stock Number</font></td>
			<td class="sm"><font class="formheader">Order #</font></td>
			<td class="sm"><font class="formheader">Ordered By</font></td>
			<td class="sm"><font class="formheader">Order Date</font></td>
		</tr>
		<% for(Long id: recent.keySet()) { stocks = recent.get(id); stock = stocks.get(0); %>
		<tr valign="top" <%= myBgColor.toggleBgColor() %>>
			<td class="sm" align="center"><input type="radio" name="stock-action<%=id%>" value="DELETE:<%=id%>" /></td>
			<td class="sm"><a href="/servlets/TairObject?type=stock&amp;id=<%=id%>"><%=stock.get_stock_number()%></a></td>
			<td class="sm"><% for(ListStock s: stocks){ %><p style="margin:0;padding:0;"><%=s.get_order_number()%></p><% } %></td>
			<td class="sm"><% for(ListStock s: stocks){ %><p style="margin:0;padding:0;"><a href="/servlets/TairObject?type=person&amp;id=<%= s.get_person_community_id() %>"><%= s.get_person_name() %></a></p><% } %></td>
			<td class="sm"><% for(ListStock s: stocks){ %><p style="margin:0;padding:0;"><%= TextConverter.dateToString(s.get_order_date()) %></p><% } %></td>
		</tr>
		<% } %>
		</table>
		</td>
		<td align="center">
			<font class="formheader">Comments</font><br>
			<textarea name="reship_comment" rows="3" columns="10" wrap="virtual"></textarea>
		</td>
	</tr>

	<tr>
		<td align="center">
		<% if (curator == true) { %>
			<script type="text/javascript" src="/js/prototype.js"></script>
			<script type="text/javascript">
			 function select_all_reship() {
			  $$("input.reship").each(function(e){e.checked = true;});
			 }
			</script>
		<% } %>
		<input type="submit" value="Continue"> &nbsp;&nbsp;&nbsp; <input type="reset" value="Reset">
		</td>
	</tr>
</table>

</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
