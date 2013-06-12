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

<form action="/servlets/Search" method="post">
<input type="hidden" name="type" value="invoice">
<input type="hidden" name="mode" value="user">
<input type="hidden" name="action" value="user_person_search">
<input type="hidden" name="mode" value="user">
<input type="hidden" name="person_id" value="<%= person.getPersonId() %>">
<input type="hidden" name="order_by" value="o.order_date DESC">

      <table align="center" border="0" cellpadding="2" width="600">
	<tr>
	  <td align="center" nowrap><font class="mainheader">Search My ABRC Invoices</font></td>
	</tr>

	<tr>
	  <td class="sm">
        Invoices can be searched by invoice #, invoice date, order # or invoice status (paid, unpaid).  
        Searching with no criteria will return all invoices for orders placed by this user. 
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
		  <%= EmptyTextConverter.convert( person.getSuffix() ) %><br>
		  <%= address != null ? EmptyTextConverter.convert( TextConverter.dbToHTML( address.getAddress() ) ) : "" %><br>
		  <%= address != null ? EmptyTextConverter.convert( address.getCity() ) : "" %>
		  <% if ( address != null &&  address.getRegion() != null ) { %>, <%= address.getRegion() %><% } %>
		  &nbsp; <%= address != null ? EmptyTextConverter.convert( address.getPostalCode() ) : "" %><br>
		  <%= address != null && address.getCountryObject() != null ? EmptyTextConverter.convert( address.getCountryObject().getName() ) : "" %><br><br>
		</td>
		<td nowrap class="sm">
                <%
                boolean first = true;
                for (BsAffiliation lab : person.getActiveLabs()) {
                  if (first) {
                %>
                <font class="formheader">Lab Affiliation</font>                                                                                                                                     
                <% } %>
                    <br>                                                                                                                                                                                               
                    <a href="/servlets/TairObject?type=organization&id=<%= lab.getOrganization().getCommunityId() %>"><%= lab.getOrganization().getName() %></a>                                                            
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
		    <td align="right" class="sm"><font class="formheader">Invoice #:</font></td>
		    <td><input type="text" size="20" maxlength="50" name="invoice_id"></td>
	      </tr>
	      
          <tr>
		    <td align="right" class="sm"><font class="formheader">Date Invoice Created:</font></td>
		    <td><input type="text" size="10" maxlength="10" name="date_invoice_created_from">  - <input type="text" size="10" maxlength="10" name="date_invoice_created_to"> &nbsp; (mm/dd/yyyy)</td>
	      </tr>
	      
          <tr>
		    <td align="right" class="sm"><font class="formheader">Order #:</font></td>
		    <td><input type="text" size="10" maxlength="10" name="order_number"></td>
	      </tr>

          <tr>
		    <td align="right" class="sm"><font class="formheader">Invoice Status:</font></td>
             <td>
                <input type="radio" name="user_invoice_status" value="any" checked>any
                <input type="radio" name="user_invoice_status" value="paid">paid
                <input type="radio" name="user_invoice_status" value="unpaid">unpaid
            </td> 
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
