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
String searchCriteria = searchCollection.getSearchCriteria();
String scrollLinks = searchCollection.getScrollLinks();
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>


<table cellpadding="2" align="center" width="100%" border="0">
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
	    Displaying <%= floor %> - <%= ceiling %>.
	  </td>
	</tr>	

	<tr>
	  <td>&nbsp;</td>
	</tr>
	
	<tr>
	  <td>
	    <table cellpadding="1" align="center" width="100%" border="1">
	      <tr>
		<td class="sm">&nbsp;</td>
		<td class="sm" nowrap align="center" valign="bottom"><font class="formheader">Stock #</font></td>
		<td class="sm" nowrap valign="bottom" align="center"><font class="formheader">Price</font></td>
		<td class="sm" nowrap valign="bottom" align="center"><font class="formheader">Qty</font></td>
		<td class="sm" nowrap valign="bottom" align="center"><font class="formheader">Status</font></td>
		<td class="sm" align="center" nowrap valign="bottom"><font class="formheader">Date<br>Shipped</font></td>
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
	             <table cellpadding="2" cellspacing="0" border="0">
	                <tr>
	                   <td class="sm"><font class="formheader">Order #</font></td>
	                   <td class="sm"><%= order.get_order_number() %></td>
	                </tr>
	    
	                <tr>
	                   <td class="sm"><font class="formheader">Order Date</font></td>
	                   <td class="sm"><%= TextConverter.dateToString( order.get_order_date() ) %></td>
	                </tr>

	                <tr>
	                   <td class="sm"><font class="formheader">Ordered By</font></td>
	                   <td class="sm"><a href="/servlets/TairObject?type=person&id=<%= order.get_person_community_id() %>"><%= order.get_person_name() %></a></td>
	                </tr>
	    
	                <tr>
	                   <td class="sm"><font class="formheader">Billed to</font></td>
	                   <td class="sm"><a href="/servlets/TairObject?type=organization&id=<%= order.get_organization_community_id() %>"><%= order.get_organization_name() %></a></td>
	                </tr>

	             </table>
	          </td>

          <% Iterator stockIter = order.getStocks();
              if ( stockIter != null ) {
                 ListStock stock = null;
                 boolean first = true;
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
	  <input type="button" value="Search Again" onClick="document.location.href='/servlets/Order?state=search&mode=donor'">
	</form>
	</td>
      </tr>
    </table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
