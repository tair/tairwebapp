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
String pageName = "Stock Order Histories";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="103" />
</jsp:include>


<form action="/servlets/Order" method="post">
<input type="hidden" name="state" value="search">
<input type="hidden" name="search_action" value="search">
<input type="hidden" name="mode" value="stock_number">
<input type="hidden" name="order_by" value="o.order_date DESC">
<input type="hidden" name="stock_status" value="<%= DataConstants.getShippedStock() %>">

      <table align="center" border="0" cellpadding="2" width="600">
	<tr>
	  <td align="center"><font class="mainheader">Search Stock Order Histories</font></td>
	</tr>

	<tr>
	  <td class="sm">
	    <p>
	    Please enter stock number you are searching for and the
	    ordering date interval in the
	    boxes below. If there is no entry in the "To" field, today's date will be used by
	    default. If there is no criteria entered for date, all orders for entered stock number
	    will be returned.
	    <p>
	     To view orders you have placed, search <a href="/servlets/Order?state=search&mode=user">here</a>
	  </td>
	</tr>

	<tr>
	  <td class="sm">&nbsp;</td>
	</tr>

	<tr>
	  <td align="center" class="sm">
	    <table cellpadding="3" cellspacing="0" border="0">

	      <tr>
	      <tr>
		<td class="sm" align="right"><font class="formheader">Stock #:</font></td>
		<td class="sm"><input type="text" size="20" maxlength="50" name="stock_numbers"></td>
	      </tr>
	      
	      <tr>
		<td align="right" class="sm"><font class="formheader">Order Date:</font></td>
		<td class="sm"><input type="text" size="10" maxlength="10" name="order_date_from">  - <input type="text" size="10" maxlength="10" name="order_date_to"> &nbsp; (mm/dd/yyyy)</td>
	      </tr>

	      <tr>
		<td>&nbsp;</td>
		<td class="sm">
		  <input type="submit" value="Submit">
		  &nbsp;&nbsp;
		  <input type="reset" value="Reset">
		</td>
	      </tr>
	    </table>
	  </td>
	</tr>
      </table>
</form>      
    
	  
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
