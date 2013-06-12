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
String highlight = "7";
%>

<%
BsPerson person = (BsPerson) request.getAttribute( "person" );
BsAddress address = person != null ? person.getCommunity().getAddress() : null;
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<form action="/servlets/Order" method="post">
<input type="hidden" name="state" value="search">
<input type="hidden" name="search_action" value="search">
<input type="hidden" name="mode" value="user">
<input type="hidden" name="person_id" value="<%= person.getPersonId() %>">
<input type="hidden" name="community_name" value="<%= person.getCommunity().getName() %>">
<input type="hidden" name="order_by" value="o.order_date DESC">
<input type="hidden" name="search_in" value="any">

      <table align="center" border="0" cellpadding="2" width="600">
	<tr>
	  <td align="center" nowrap><font class="mainheader">Search Stock Orders</font></td>
	</tr>

	<tr>
	  <td class="sm">
	    Orders can be searched by order number, date and stock number.
	    Please enter the ordering date interval in the
	    boxes below. If there is no entry in the "To" field, today's date will be used by
	    default. Searching with no criteria will return all orders placed by this user.
<P class="small">
Stock order history covers orders placed through ABRC only.  Orders placed
directly through NASC are not tracked by our system.

	  </td>
	</tr>

	<tr>
	  <td class="sm">&nbsp;</td>
	</tr>

	<tr valign="top">
	  <td align="center" class="sm">
	    <table cellpadding="3" cellspacing="0" border="0">
	      <tr valign="top">
		<td nowrap class="sm">
		  <font class="formheader">Personal Information</font>
		  <br>
		  <a href="/servlets/TairObject?type=person&id=<%= person.getCommunityId()%>"><%= person.getCommunity().getName() %></a>
		  <%= address != null ? EmptyTextConverter.convert( person.getSuffix() ) : "" %><br>
		  <%= address != null ? EmptyTextConverter.convert( TextConverter.dbToHTML( address.getAddress() ) ) : "" %><br>
		  <%= address != null ? EmptyTextConverter.convert( address.getCity() ) : "" %>
		  <% if ( address != null && address.getRegion() != null ) { %>, <%= address.getRegion() %><% } %>
		  &nbsp; <%= address != null ? EmptyTextConverter.convert( address.getPostalCode() ) : "" %><br>
		  <%= address != null && address.getCountryObject() != null ? EmptyTextConverter.convert( address.getCountryObject().getName() ) : "" %><br><br>
		</td>
		<td nowrap class="sm">
		  <% 
                    Iterator labs = person.getActiveLabs().iterator();
	  	    if (labs != null ) {
		  %>
		  <font class="formheader">ABRC Billing Information</font>

		  <%
		          while ( labs.hasNext() ) {
		             BsAffiliation lab = (BsAffiliation) labs.next();
		  %>

		  <br>
		  <a href="/servlets/TairObject?type=organization&id=<%= lab.getOrganization().getCommunityId() %>"><%= lab.getOrganization().getName() %></a>

		        <% } %> 
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
