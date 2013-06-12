<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, org.tair.abrc.stock.*, java.util.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "User Orders Management System";
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
String organization_id = request.getParameter( "organization_id" );

%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>


      <table cellpadding="2" align="center" width="100%">
	<tr>
	  <td align="center" class="sm">
	    <font class="mainheader">User Orders Management System</font>
           </td>
        </tr>
 
       
        <tr>
	   <td class="sm">
            <p>
	    <%= searchCriteria %>

            <p>
             Please click on the order number to cancel an item in the order.

	    <p>
	    Displaying <%= floor %> - <%= ceiling %>.
	  </td>
	</tr>	

	<tr>
	  <td>&nbsp;</td>
	</tr>
	
	<tr>
	  <td class="sm" align="center">
	    <table cellpadding="0" align="center" width="100%" border="1">
	      <tr>
		<td class="sm">&nbsp;</td>
		<th class="sm" nowrap valign="bottom">Stock #</th>
		<th class="sm" nowrap valign="bottom">Unit<br>Price</th>
		<th class="sm" nowrap valign="bottom">Qty</th>
		<th class="sm" nowrap valign="bottom">Status</th>
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
	                   <td class="sm"><a href="/servlets/Order?state=search&search_action=detail&mode=pi&orders_id=<%= order.get_orders_id() %>"><%= order.get_order_number() %></a></td>
	                </tr>
	    
	                <tr>
	                   <th class="sm" align="left">Order Date</th>
	                   <td class="sm"><%= TextConverter.dateToString( order.get_order_date() ) %></td>
	                </tr>
	    
	                <tr>
	                   <th class="sm" align="left">Order Status</th>
	                   <td class="sm"><%= order.get_order_status() %></td>
	                </tr>

	                <tr>
	                   <th class="sm" align="left">Ordered By</th>
	                   <td class="sm"><a href="/servlets/TairObject?type=person&id=<%= order.get_person_community_id() %>"><%= order.get_person_name() %></a></td>
	                </tr>

	             <% int dnaCount = order.getDNAStockCount();
                        if ( dnaCount > 0 ) { 
                      %>
                        <tr>
	                   <td class="sm" align="left"><font class="formheader">DNA Stocks</font></td>
	                   <td class="sm"><%= dnaCount %></td>
	                </tr>
	             <% } %>

	             <% int seedCount = order.getSeedStockCount();
                        if ( seedCount > 0 ) { 
                     %>
	               <tr>
	                  <th class="sm" align="left">Seed Stocks</th>
	                  <td class="sm"><%= seedCount %></td>
	               </tr>
	             <% } %>

	               <tr>
	                  <th class="sm" align="left">Total Stocks</th>
	                  <td class="sm"><%= order.getStockCount() %></td>
	               </tr>

	             </table>
	          </td>

            <% Iterator stockIter = order.getStocks();
               if ( stockIter != null ) {
                  boolean first = true;
                  ListStock stock = null;
                  while ( stockIter.hasNext() ) { 
                    stock = (ListStock) stockIter.next();
            %>

            <% if ( !first ) { %>
              <tr>
            <% } else { %>
              <% first = false; %>
            <% } %>
                  <td class="sm" align="center"><a href="/servlets/TairObject?type=stock&id=<%= stock.get_stock_id() %>"><%= stock.get_stock_number() %></a></td>
                  <td class="sm" align="center"><%= EmptyTextConverter.convert( stock.get_calculated_stock_charge() ) %>&nbsp;</td>
                  <td class="sm" align="center"><%= stock.get_quantity() %></td>
                  <td class="sm" align="center"><%= stock.get_stock_status() %></td>
                  <td class="sm" align="center"><%= TextConverter.dateToString( stock.get_date_last_modified() ) %>&nbsp;</td>
               </tr>
              <% } %>
           <% } %>
        <% } %>
           </table>
        </td>
    </tr>

    <tr>
	<td class="sm">&nbsp;</td>
    </tr>

      <%  if ( scrollLinks != null ) { %>
      <tr>
	<td align="center" class="sm"><%= scrollLinks %></td>
      </tr>

      <tr>
	<td class="sm">&nbsp;</td>
      </tr>

      <% } %>

	<tr>
	  <td align="center">
	<form action="/servlets/Order" method="post">
	  <input type="button" value="Search Again" onClick="document.location.href='/servlets/Order?state=search&mode=pi&organization_id=<%= organization_id %>'">
	</form>
	</td>
      </tr>
    </table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
