<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
import = "org.tair.community.*, org.tair.utilities.*, java.util.*, org.tair.bs.community.*"
%>

<%!
String pageName = "User Orders Management System";
%>

<% 
BsOrganization organization = (BsOrganization) request.getAttribute( "organization" );
BsAddress address = organization != null ? organization.getCommunity().getAddress() : null;
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<form action="/servlets/Order">
<input type="hidden" name="state" value="search">
<input type="hidden" name="search_action" value="search">
<input type="hidden" name="mode" value="pi">
<input type="hidden" name="organization_id" value="<%= organization.getOrganizationId() %>">
<input type="hidden" name="community_name" value="<%= organization.getName() %>">
<input type="hidden" name="search_in" value="any">
<input type="hidden" name="order_by" value="o.order_date DESC">

      <table align="center" border="0" cellpadding="3" width="600">
	<tr>
	  <td align="center" nowrap class="sm"><font class="mainheader">Search Lab Orders</font></td>
	</tr>

	<tr>
	  <td class="sm">
	    Orders can be searched by order number, date and stock number.
	    Please enter the ordering date interval in the
	    boxes below. If there is no entry in the "To" field, today's date will be used by
	    default. Searching with no criteria will return all orders placed by members of this lab.
	  </td>
	</tr>

	<tr>
	  <td class="sm">&nbsp;</td>
	</tr>


	<tr valign="top">
	  <td align="center" class="sm">
	    <table cellpadding="3" cellspacing="2" border="0">
	      <tr valign="top">
		<td nowrap class="sm">
		  <font class="formheader">Lab Information</font>
		  <br>
		  <a href="/servlets/TairObject?type=organization&id=<%= organization.getCommunityId() %>"><%= organization.getName() %></a><br>
		  <%= address != null ? EmptyTextConverter.convert( TextConverter.dbToHTML( address.getAddress() ) ) : "" %><br>
		  <%= address != null ? EmptyTextConverter.convert( address.getCity() ) : "" %>
		  <% if ( address != null && address.getRegion() != null ) {%>, <%= address.getRegion() %><% } %>
		  &nbsp; <%= address != null ? EmptyTextConverter.convert( address.getPostalCode() ) : "" %><br>
		  <%= address != null && address.getCountryObject() != null ?  EmptyTextConverter.convert( address.getCountryObject().getName() ) : "" %>
		</td>

		 <td nowrap class="sm">
		  <font class="formheader">Members</font>
		  <br>
		  <% 
		  if ( organization.getAffiliation().size() > 0 ) {
		      for (BsAffiliation affiliation : organization.getAffiliation()) {
                          String piStr = "";
                          if (affiliation.getPi()) {
                              piStr = "*";
                          } 
                  %>

		  <a href="/servlets/TairObject?type=person&id=<%=affiliation.getCommunityId()%>"><%= piStr + affiliation.getMember().getName() %></a>
		  <br>
		   <% } %>
		  <br>
		   * Primary Investigator

		  <% } else { %>
		     No members for this organization

		  <% } %>

		</td>
	      </tr>
	    </table>
	  </td>
	</tr>


	<tr>
	  <td align="center" class="sm">

	    <table cellpadding="3" border="0">

              <tr>
		<td class="sm" align="right"><font class="formheader">Results Format:</font></td>
		<td class="sm">
		  <input type="radio" name="results_format" value="stock" checked>&nbsp;Individual stocks
		  &nbsp;
		  <input type="radio" name="results_format" value="statistics">&nbsp;Statistics
		</td>
              </tr>

	      <tr>
		<td align="right" class="sm"><font class="formheader">Order #:</font></td>
		<td><input type="text" size="10" maxlength="10" name="order_number_from"></td>
	      </tr>

	      <tr>
		<td align="right" class="sm"><font class="formheader">Stock #:</font></td>
		<td><input type="text" size="20" maxlength="50" name="stock_numbers"></td>
	      </tr>

	      <tr>
		<td align="right" class="sm"><font class="formheader">Order Date:</font></td>
		<td><input type="text" size="10" maxlength="10" name="order_date_from">  - <input type="text" size="10" maxlength="10" name="order_date_to"> &nbsp; (mm/dd/yyyy)</td>
	      </tr>

	      <tr>
		<td class="sm">&nbsp;</td>
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
