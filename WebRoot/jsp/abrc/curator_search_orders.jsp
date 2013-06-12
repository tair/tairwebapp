<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "Search ABRC Stock Orders";
String highlight = "7";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<form action="/servlets/Order" method="POST" name="searchForm">
<input type="hidden" name="state" value="search">
<input type="hidden" name="search_action" value="search">
<input type="hidden" name="mode" value="curator">
<input type="hidden" name="page" value="1">

<table width="100%" align="center">
      <tr>
	<td align="center">
	  <font class="mainheader">ABRC Stock Order Management</font>
	  <p>
	    Use this form to get a list of orders, that you may update.
	</td>
      </tr>
	<tr>
	  <td align="center">
	    <input type="submit" value="Submit">
	    &nbsp;
	    <input type="reset" value="Reset">
	  </td>
	</tr>

	<tr>
	  <td>
	    <table border="0" cellpadding="1" cellspacing="0" align="center" width="100%" bgcolor="<%= DataConstants.BGCOLOR %>">
	      <tr>
		<td align="right"><font class="formheader">Search In:</font></td>
		<td colspan="3">
		  <input type="radio" name="search_in" value="any" checked>&nbsp;Any
		  &nbsp;
		  <input type="radio" name="search_in" value="seed">&nbsp;Seed Stocks
		  &nbsp;
		  <input type="radio" name="search_in" value="DNA">&nbsp;DNA Stocks
	          &nbsp;
		  <input type="radio" name="search_in" value="combined">&nbsp;Both
		</td>
	      </tr>


	      <tr>
		<td align="right"><font class="formheader">Order#:</font></td>
		<td nowrap colspan="3"><input type="text" size="12" maxlength="12" name="order_number_from"> - <input type="text" size="12" maxlength="12" name="order_number_to"></td>
	      </tr>
	      
	      <tr>
		<td align="right"><font class="formheader">Order Date:</font></td>
		<td nowrap><input type="text" size="10" maxlength="10" name="order_date_from"> - <input type="text" size="10" maxlength="10" name="order_date_to"></td>
		<td align="right"><font class="formheader">Stock Status:</font></td>
		<td><%= HTMLFactory.createStockStatusSelect( "stock_status", "", true, "All" ) %></td>
	      </tr>

	      <tr>
		<td align="right"><font class="formheader">Date Completed:</font></td>
		<td nowrap><input type="text" size="10" maxlength="10" name="date_complete_from"> - <input type="text" size="10" maxlength="10" name="date_complete_to"></td>
		<td align="right"><font class="formheader">Order Status:</font></td>
		<td><%= HTMLFactory.createOrderStatusSelect( "order_status", "", true, "All" ) %></td>
	      </tr>
	      
	      <tr>
		<td align="right"><font class="formheader">Item Last Updated:</font></td>
		<td nowrap><input type="text" size="10" maxlength="10" name="last_modified_from"> - <input type="text" size="10" maxlength="10" name="last_modified_to"></td>
		<td align="right"><font class="formheader">Seed Stock Center:</font></td>
		<td>
		  <input type="radio" name="seed_stock_center" value="" checked> Any
		  &nbsp;&nbsp;
		  <input type="radio" name="seed_stock_center" value="<%= DataConstants.getABRCStockCenter() %>" > ABRC
		  &nbsp;&nbsp;
		  <input type="radio" name="seed_stock_center" value="<%= DataConstants.getNASCStockCenter() %>"> NASC
		</td>
	      </tr>
	      
	      <tr>
		<td align="right"><font class="formheader">Person ID:</font></td>
		<td colspan="3">
		  <input type="text" size="12" maxlength="12" name="person_id">
		  &nbsp;&nbsp;
		  <font class="formheader">Lab ID:</font>
		  <input type="text" size="12" maxlength="12" name="organization_id">
		</td>
	      </tr>
	      
	      <tr>
		<td align="right"><font class="formheader">Last Name:</font></td>
		<td colspan="3">
		  <%= HTMLFactory.createSearchMethodSelect( "last_name_method", DataConstants.SEARCH_STARTS, false ) %>
		  <input type="text" size="20" maxlength="30" name="last_name">
		</td>
	      </tr>
	      
	      <tr>
		<td align="right"><font class="formheader">First Name:</font></td>
		<td colspan="3">
		  <%= HTMLFactory.createSearchMethodSelect( "first_name_method", DataConstants.SEARCH_STARTS, false ) %>
		  <input type="text" size="20" maxlength="30" name="first_name">
		</td>
	      </tr>
	      
	      <tr>
		<td align="right"><font class="formheader">Lab Name:</font></td>
		<td colspan="3">
		  <%= HTMLFactory.createSearchMethodSelect( "organization_name_method", DataConstants.SEARCH_STARTS, false ) %>
		  <input type="text" size="20" maxlength="100" name="organization_name">
		</td>
	      </tr>

	      <tr>
		<td align="right"><font class="formheader">Donor Last Name:</font></td>
		<td colspan="3">
		  <%= HTMLFactory.createSearchMethodSelect( "donor_last_name_method", DataConstants.SEARCH_STARTS, false ) %>
		  <input type="text" size="20" maxlength="30" name="donor_last_name">
		</td>
	      </tr>

	      <tr>
		<td align="right"><font class="formheader">Donor First Name:</font></td>
		<td colspan="3">
		  <%= HTMLFactory.createSearchMethodSelect( "donor_first_name_method", DataConstants.SEARCH_STARTS, false ) %>
		  <input type="text" size="20" maxlength="30" name="donor_first_name">
		</td>
	      </tr>

	      <tr>
		<td align="right"><font class="formheader">Donor Organization Name:</font></td>
		<td colspan="3">
		  <%= HTMLFactory.createSearchMethodSelect( "donor_organization_name_method", DataConstants.SEARCH_STARTS, false ) %>
		  <input type="text" size="20" maxlength="30" name="donor_organization_name">
		</td>
	      </tr>

	      <tr>
		<td align="right"><font class="formheader">Donor Person ID:</font></td>
		<td colspan="3">
		  <input type="text" size="12" maxlength="12" name="donor_person_id">
		  &nbsp;&nbsp;
		  <font class="formheader">Donor Lab ID:</font>
		  <input type="text" size="12" maxlength="12" name="donor_organization_id">
		</td>
	      </tr>

      	      <tr>
		<td align="right" class="sm"><font class="formheader">Donation Date:</font></td>
		<td colspan="3"><input type="text" size="10" maxlength="10" name="donated_date_from">  - <input type="text" size="10" maxlength="10" name="donated_date_to"> &nbsp; (mm/dd/yyyy)</td>
	      </tr>



	      
	      <tr valign="top">
		<td rowspan="2" align="right"><font class="formheader">Stock Numbers:</font></td>
		<td rowspan="2"><textarea rows="4" cols="15" name="stock_numbers"></textarea><br></td>
                <td align="right"><font class="formheader">Stock Type:</font></td>
                <td><%= HTMLFactory.createStockOrderTypeSelect( "stock_type", "", true ) %></td>
	      </tr>


	      <tr>
		<td align="right"><font class="formheader">Charge Waivers:</font></td>
		<td><%= HTMLFactory.createWaiveChargeSelect( "waive_charge", "", true, false) %></td>
              </tr>
		
	      <tr>
		<td align="right"><font class="formheader">Sort By:</font></td>
		<td>
		  <select name="order_by">
		    <option value="o.order_number">order #
		    <option selected value="o.order_date">order date
		    <option value="o.organization_id">lab ID
		    <option value="o.person_id">person ID
		    <option value="p.last_name">last name
		  </select>
		</td>
		<td align="right"><font class="formheader">Records per page:</font></td>
		<td>
		  <select name="size">
		    <option value="25">25</option>
		    <option value="50">50</option>
		    <option value="100">100</option>
		    <option value="200">200</option>
		    <option value="500" selected>500</option>
		  </select>
		</td>
	      </tr>

	      <tr>
		<td colspan="4">&nbsp;</td>
	      </tr>
	    </table>
	  </td>
	</tr>

	<tr>
	  <td align="center">
	    <input type="submit" value="Submit">
	    &nbsp;
	    <input type="reset" value="Reset">
	  </td>
	</tr>
      </table>
</form>



<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
