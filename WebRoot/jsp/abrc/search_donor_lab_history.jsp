<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
import="org.tair.utilities.*, org.tair.community.*"
%>

<%!
String pageName = "Donor Lab Stock Histories";
%>

<%
if ( !LoginChecker.hasDonorLab( request ) ) {
      UnauthorizedRequestException ure = new UnauthorizedRequestException( "Not authorized for this resource" );
      request.setAttribute( "exception", ure );
      pageContext.forward( "/jsp/common/unauthorized_error.jsp" );
}

ListCommunity[] donorLabs = (ListCommunity[]) request.getAttribute( "donorLabs" );
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>


<form action="/servlets/Order" method="post">
<input type="hidden" name="state" value="search">
<input type="hidden" name="search_action" value="search">
<input type="hidden" name="mode" value="donor_lab">
<input type="hidden" name="order_by" value="o.order_date DESC">
<input type="hidden" name="stock_status" value="<%= DataConstants.getShippedStock() %>">

      <table align="center" border="0" cellpadding="2" width="600">
	<tr>
	  <td align="center"><font class="mainheader">Search Donor Lab Stock Order Histories</font></td>
	</tr>

	<tr>
	   <td class="sm">
	    Please enter stock number you are searching for and the
	    ordering date interval in the  boxes below. Orders for the entire donor collection
	    will be returned if no entry is made in the stock number field.
	    If there is no entry in the "To" field, today's date will be used by
	    default. If there is no criteria entered for date, all orders for entered stock number
	    will be returned.
	  </td>
	</tr>
	


	<tr>
	  <td class="sm" align="center">
	    Search for stocks donated by:
	    <br><br>

	    <!-- Display orgs person is contact person/PI for -->
	    <!-- Show multiple orgs as form fields user must select from -->
	    <% boolean hasMultiple = ( donorLabs.length > 1 );
	       for ( int i = 0; i < donorLabs.length; i++ ) {
	            if ( i > 0 ) {
	               out.write( "<br>" );
	             }
	             
	             if ( hasMultiple ) {
            %>

	             <input type="radio" name="donor_organization_id" value="<%= donorLabs[ i ].getSpecificID() %>">

                   <% } else { %>
	             <input type="hidden" name="donor_organization_id" value="<%= donorLabs[ i ].getSpecificID() %>">
	             <input type="hidden" name="community_name" value="<%= donorLabs[ i ].getDisplayName() %>">
	           <% } %>

  	              <a href="/servlets/TairObject?type=organization&id=<%= donorLabs[ i ].getCommunityID() %>"><%= donorLabs[ i ].getDisplayName() %></a>

	     <% } %>
	  </td>
	</tr>


	<tr>
	  <td class="sm">&nbsp;</td>
	</tr>

	<tr>
	  <td align="center" class="sm">
	    <table cellpadding="3" cellspacing="0" border="0">
	      <tr>
		<td class="sm" align="right"><font class="formheader">Search In:</font></td>
		<td class="sm">
		  <input type="radio" name="search_in" value="any" checked>&nbsp;Any
		  &nbsp;
		  <input type="radio" name="search_in" value="seed">&nbsp;Seed Stocks
		  &nbsp;
		  <input type="radio" name="search_in" value="DNA">&nbsp;DNA Stocks
		</td>
              </tr>

              <tr>
		<td class="sm" align="right"><font class="formheader">Results Format:</font></td>
		<td class="sm">
		  <input type="radio" name="results_format" value="stock" checked>&nbsp;Individual stocks
		  &nbsp;
		  <input type="radio" name="results_format" value="statistics">&nbsp;Statistics
		</td>
              </tr>

	      <tr>
                <td class="sm" align="right"><font class="formheader">Stock Type:</font></td>
                <td class="sm"><%= HTMLFactory.createStockOrderTypeSelect( "stock_type", "", true ) %></td>
              </tr>

	      <tr>
	        <td class="sm" align="right"><font class="formheader">Stock #:</font></td>
	        <td class="sm"><input type="text" size="20" maxlength="50" name="stock_numbers"></td>
	      </tr>

      	      <tr>
		<td class="sm" align="right" class="sm"><font class="formheader">Order Date:</font></td>
		<td class="sm"><input type="text" size="10" maxlength="10" name="order_date_from">  - <input type="text" size="10" maxlength="10" name="order_date_to"> &nbsp; (mm/dd/yyyy)</td>
	      </tr>


      	      <tr>
		<td class="sm" align="right" class="sm"><font class="formheader">Donation Date:</font></td>
		<td class="sm"><input type="text" size="10" maxlength="10" name="donated_date_from">  - <input type="text" size="10" maxlength="10" name="donated_date_to"> &nbsp; (mm/dd/yyyy)</td>
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
