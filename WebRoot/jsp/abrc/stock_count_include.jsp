<%@ page contentType="text/html; charset=UTF-8" %>

<!--

Include to display stock order counts

-->

<%@ page import="org.tair.abrc.CompositeOrder" %>


<%
// get order either from request or session depending on containing page
CompositeOrder order = (CompositeOrder) request.getAttribute( "order" );


if ( order == null ) {
    order = (CompositeOrder) session.getAttribute( "order" );
}
%>




<% int dnaCount = order.getDNAStockCount();
   if ( dnaCount > 0 ) {
%>
      <font class="formheader">DNA Stocks:</font> <%= dnaCount %>&nbsp;&nbsp;

<% } %>
            
<% int seedCount = order.getSeedStockCount();
   if ( seedCount > 0 ) {
%>
      <font class="formheader">Seed Stocks:</font> <%= seedCount %>&nbsp;&nbsp;
<% } %>
	
      <font class="formheader">Total Stocks:</font> <%= order.getStockCount() %>
