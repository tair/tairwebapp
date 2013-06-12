<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="org.tair.utilities.*, org.tair.abrc.stock.*, java.util.*" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "Order Search Results";
String highlight = "7";
%>

<%
// get results of search
SearchResultsCollection searchCollection = (SearchResultsCollection) request.getAttribute( "searchCollection" );
if ( searchCollection == null || searchCollection.isEmpty() ) {
   throw new InvalidParameterException( "Invalid Request" );
}

Vector orders = (Vector) searchCollection.getResults();
int resultSize = searchCollection.getResultSize();
int floor = searchCollection.getFloor();
int ceiling = searchCollection.getCeiling();
String scrollLinks = searchCollection.getScrollLinks();
String searchCriteria = searchCollection.getSearchCriteria();
String currentDate = TextConverter.dateToString( new java.util.Date() );


// get search params used to get result set for returning here
String searchString = (String) request.getAttribute( "search_string" );
%>

<SCRIPT language="javascript">
<!--
function checkAll() {
      for ( i=0; i < document.orderForm.elements.length; i++ ) {
          var element = document.orderForm.elements[ i ];
          if ( element.type == "checkbox" && element.name.indexOf( "stock_id_" ) >= 0 ) {
               element.checked = true;
          }
      }

}


function checkOrder( orderBox ) {
      var prefix =  "stock_id_" + orderBox.value;
      for ( i=0; i < document.orderForm.elements.length; i++ ) {
          var element = document.orderForm.elements[ i ];
          if ( element.type == "checkbox" && element.name == prefix ) {
             if ( orderBox.checked == true ) {
               element.checked = true;
             }else {
               element.checked = false;
             }
          }
      }
}


//-->
</script>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<table align="center" width="100%">
      <tr>
	<td align="center"><font class="mainheader">ABRC Stock Order Management</font></td>
      </tr>
      <tr>
	<td>
	  <%= EmptyTextConverter.convert( searchCriteria ) %>
	  <p>
	    Displaying <%= floor %> - <%= ceiling %>.
	</td>
      </tr>
</table>

<p>


<form name="orderForm" action="/servlets/Order" method="post">
<input type="hidden" name="state" value="maintain">
<input type="hidden" name="mode" value="list">
<input type="hidden" name="search_string" value="<%= searchString %>">


<table cellpadding="1" border="1" width="600" cellspacing="0">
	<tr>
	  <td class="sm">&nbsp;</td>
	  <th class="sm" nowrap valign="bottom">Select<br>Order</th>
	  <th class="sm" nowrap valign="bottom">Select<br>Item</th>
	  <th class="sm" nowrap valign="bottom">Stock #</th>
	  <th class="sm" nowrap valign="bottom">Unit<br>Price</th>
	  <th class="sm" nowrap valign="bottom">Qty</th>
	  <th class="sm" nowrap valign="bottom">Status</th>
	  <th class="sm" nowrap valign="bottom">Waive<br>Charges</th>
	  <th class="sm" nowrap valign="bottom">Last<br>Updated</th>
	</tr>
<% 
Iterator iter = orders.iterator(); 
ListOrder order = null;
while ( iter.hasNext() ) {  
      order = (ListOrder) iter.next();
      int rowspan = order.getDistinctStockCount();
%>
      <tr>
         <td class="sm" rowspan="<%= rowspan %>" valign="top">
	  <table cellpadding="1" cellspacing="0" border="0">
	    <tr>
	      <th class="sm" align="left">Order #</th>
	      <td class="sm"><a href="/servlets/Order?state=search&search_action=detail&mode=curator&orders_id=<%= order.get_orders_id() %>"><%= order.get_order_number() %></a></td>
	    </tr>
	    
	    <tr>
	      <th class="sm" align="left">Date</th>
	      <td class="sm"><%= TextConverter.dateToString( order.get_order_date() ) %></td>
	    </tr>
	    
	    <tr>
	      <th class="sm" align="left">Status</th>
	      <td class="sm"><%= order.get_order_status() %></td>
	    </tr>

	    <tr>
	      <th class="sm" align="left">Orderer</th>
	      <td class="sm"><a href="/servlets/TairObject?type=person&id=<%= order.get_person_community_id() %>"><%= order.get_person_name() %></a></td>
	    </tr>

	    <tr>
	      <th class="sm" align="left">Lab</th>
	      <td class="sm"><a href="/servlets/TairObject?type=organization&id=<%= order.get_organization_community_id() %>"><%= order.get_organization_name() %></a></td>
	    </tr>


	    <tr>
	      <th class="sm" align="left">Seed?</th>
	      <td class="sm"><%= order.hasSeedStocks() %></td>
	    </tr>

	    <tr>
	      <th class="sm" align="left">DNA?</th>
	      <td class="sm"><%= order.hasDNAStocks() %></td>
	    </tr>

	    <tr>
	      <th class="sm" align="left">Total #</th>
	      <td class="sm"><%= order.getStockCount() %></td>
	    </tr>

	  </table>
	</td>

      <% Iterator stockIter = order.getStocks();
         boolean first = true;
         if ( stockIter != null ) {
           ListStock stock = null;
           while ( stockIter.hasNext() ) {
              stock = (ListStock) stockIter.next();
      %>
           <% if ( first ) { %>
               <td class="sm" align="center"><input type="checkbox" name="orders_id" value="<%= order.get_orders_id() %>"  onClick="checkOrder( this )"></td>
           <% } else { %>

           <tr>
	      <td class="sm">&nbsp;</td>
           <% } %>
 
      <td class="sm" align="center"><input type="checkbox" name="stock_id_<%= stock.get_orders_id() %>" value="<%= stock.get_stock_number() %>"></td>
      <td class="sm" align="center"><a href="/servlets/TairObject?type=stock&id=<%= stock.get_stock_id() %>"><%= stock.get_stock_number() %></a></td>
      <td class="sm" align="center"><%= EmptyTextConverter.convert( stock.get_calculated_stock_charge() ) %>&nbsp;</td>
      <td class="sm" align="center"><%= stock.get_quantity() %></td>
      <td class="sm" align="center"><%= stock.get_stock_status() %></td>
      <td class="sm" align="center"><%= EmptyTextConverter.convert( stock.get_waive_charge() ) %>&nbsp;</td>
      <td class="sm" align="center"><%= TextConverter.dateToString( stock.get_date_last_modified() ) %>&nbsp;</td>
    </tr>

          <% first = false; %>
       <% } %>
    <% } %>      
 <% } %>


</table>

<br>

<table cellpadding="2" border="0" width="600">
      <%  if ( scrollLinks != null ) { %>
      <tr>
	<td colspan="2" align="center" class="sm"><%= scrollLinks %></td>
      </tr>
      <% } %>

      <tr>
	<td colspan="2">
	  <table cellpadding="2">
	    <tr>
	      <th class="sm" align="left">Action</th>
	      <td class="sm">
                  <select name="action">
                     <option value="download_order" selected>Download Order</option>
                     <option value="download_stock">Download Item</option>
                     <option value="<%= DataConstants.getBackOrderedStock() %>">Set Back-Ordered</option>
                     <option value="<%= DataConstants.getShippedStock() %>">Set Shipped</option>
                     <option value="<%= DataConstants.getInProgressStock() %>">Set In Progress</option>
                     <option value="<%= DataConstants.getNewStock() %>">Set New</option>
                     <option value="<%= DataConstants.getInactiveStock() %>">Set Inactive</option>
                     <option value="<%= DataConstants.getMTAStock() %>">Set Waiting for MTA</option>
                     <option value="<%= DataConstants.getNASCStock() %>">Change Center to NASC (no fee)</option>
                     <option value="<%= DataConstants.getNASCShipStock() %>">Change Center to NASC (fee)</option>
                   </select>
              </td>


	      <th class="sm" align="left">Date for status change:</th>
	      <td class="sm"><input type="text" name="date_last_modified" size="10" maxlength="10" value="<%= currentDate %>"></td>
	    </tr>
	  </table>
	</td>
      </tr>
      
      <tr>
	<td colspan="2" align="center">
	  <input type="submit" value="Submit">
	  &nbsp;&nbsp;
	  <input type="reset" value="Reset">
	  &nbsp;&nbsp;
	  <input type="button" value="Search Again" onClick="document.location.href='/servlets/Order?state=search&mode=curator'">
	  &nbsp;&nbsp;
	  <input type="button" value="Select All" onClick="checkAll()">
	</td>
      </tr>
</table>
</form>



<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
