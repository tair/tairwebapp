<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "ABRC Payment Management";
String highlight = "7";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<form action="<%=response.encodeURL("/servlets/Search")%>" method="POST">
<input type="hidden" name="type" value="payment">
<input type="hidden" name="search_action" value="search">
      
<table width="100%" align="center">
	<tr>
	  <td align="center">
	    <font class="mainheader">ABRC Payment Management</font>
	    <p>
	      Use this form to get a list of payments.
	  </td>
	</tr>
	<tr>
	  <td>
	    <table border="0" cellpadding="3" cellspacing="0" align="center" width="100%" bgcolor="<%= DataConstants.BGCOLOR %>">

              <tr>
		<td class="sm" align="right"><font class="formheader">Payment type:</font></td>
		<td class="sm">
		  <select name="payment_type">
		    <option value="any" selected>any</option>          
		    <option value="online_credit_card">credit card</option>
		    <option value="check">checks</option>
		  </select>
		</td>
	   </tr>

	   <tr>
		<td class="sm" align="right"><font class="formheader">Payment date range:</font></td>
		<td class="sm">
		  <input type="text" size="10" maxlength="10" name="payment_date_from"> 
		  - <input type="text" size="10" maxlength="10" name="payment_date_to">           
		</td>
	   </tr>                     

	      
	      <tr>
		<td class="sm" align="right"><font class="formheader">Sort by:</font></td>
		<td class="sm">
		  <select name="order">
		    <option value="payment_date" selected>payment made date</option>
		    <option value="payment_amount">payment amount</option>
		    <option value="invoice_id">invoice id</option>
   		    <option value="payment_type">payment type</option>
		  </select>
		</td>
              </tr>

              <tr>
		<td class="sm" align="right"><font class="formheader">Records per page:</font></td>
		<td class="sm">
		  <select name="size">
		    <option value="25" selected>25</option>
		    <option value="50">50</option>
		    <option value="100">100</option>
		    <option value="200">200</option>
		    <option value="500">500</option>
		  </select>
		</td>
	      </tr>

	      <tr>
		<td class="sm" colspan="2">&nbsp;</td>
	      </tr>
	      
	    </table>
	  </td>
	</tr>
	
	<tr>
	  <td class="sm" align="center">
	    <input type="submit" value="Submit">
	    &nbsp;
	    <input type="reset" value="Reset">
	    
	  </td>
	</tr>
</table>
	
</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
