<%@ page contentType="text/html; charset=UTF-8" %>

<!--

Include to display order contents including stocks and all associated charges
in a stand alone table.

-->


<%@ page import="java.util.Iterator, org.tair.abrc.CompositeOrder, org.tair.abrc.stock.Stock, 
                 org.tair.utilities.TextConverter, org.tair.utilities.DataConstants" %>
<%
// get order either from request or session depending on containing page
CompositeOrder order = (CompositeOrder) request.getAttribute( "order" );%>



<%if ( order == null ) {
    order = (CompositeOrder) session.getAttribute( "order" );     
}


// determine if display should allow edits (quantity and delete/remove)
String editStr = request.getParameter( "editable" );
boolean editable = editStr != null && editStr.equals( "true" );

// If status logic requested, show status column if any stocks 
// have had status set to anything other than "new" as part of 
// placing order (i.e. forwarded to NASC, waiting for MTA etc.) 
String statusStr = request.getParameter( "useStatusLogic" );

boolean showStatus = (statusStr != null && 
                      statusStr.equals( "true" ) 
                      && order.hasOtherStatusStocks() );

// determine whether to show checkboxes for deleting stock items
String showDeleteStr = request.getParameter( "showDelete" );
boolean showDelete = editable && showDeleteStr != null && showDeleteStr.equals( "true" );


boolean isExpressShippingMandatory = false;


// determine number of columns in table given all options
int colspan = 5;
if ( showStatus ) {
    colspan++;
}

if ( showDelete ) {
    colspan++;
}
%>


  <table align="center" cellpadding="3" border="1" cellspacing="0">
    <tr>
      <% if ( showDelete ) { %>
       <th class="sm">Delete?</th>
      <% } %>

      <th class="sm">Qty</th>
      <th class="sm">Stock #</th>
      <th class="sm">Stock Type</th>
      <th class="sm">Order Date</th>

      <% if ( showStatus ) { %>
           <th class="sm">Shipping Status</th>
      <% } %>

      <th class="sm">Unit Price</th>
      <th class="sm">Extended Price</th>

   </tr>


   <%  
      for ( Iterator stockIter = order.getStocks(); stockIter.hasNext(); ) {
  	   Stock stock = (Stock) stockIter.next();
  	   
  	   //this is used to determine if the stock has a mandatory express shipping charge
  	   
  	   if ( stock.express_shipping_required() ) {
  	   		isExpressShippingMandatory = true;
  	   }
  	   
   %>
    <tr>
       <% if ( editable && showDelete ) { %>
         <td class="sm" align="center"><input type="checkbox" name="delete" value="<%= stock.get_stock_number() %>"></td>
       <% } %>

       <!-- Only allow manual control of quantity for fixed price stocks -->
       <td class="sm" align="center">
          <% if ( editable && !stock.completed() && stock.get_fixed_price() != null && stock.get_fixed_price().booleanValue() ) { %>
                <input type="text" name="quantity_<%= stock.get_stock_number() %>" value="<%= stock.get_quantity() %>" size="3" maxlength="3">
          <% } else { %>
                <%= stock.get_quantity() %>
          <% } %>
       </td>

       <td class="sm"><%= stock.get_stock_number() %></td>
       <td class="sm"><%= stock.get_format_stock_type() %></td>
       <td class="sm"><%= TextConverter.dateToString( stock.get_order_date_last_modified() ) %></td>

       <% if ( showStatus ) { %>
	   <td class="sm"><%= stock.get_other_status() %>&nbsp;</td>
       <% } %>

       <td class="sm">$<%= stock.get_calculated_stock_charge() %></td>
       <td class="sm" align="right"><%= TextConverter.floatToMoneyString( order.getLineItemStockCharge( stock.get_stock_id() ) ) %></td>
    </tr>

   <% } %>

    <tr>
        <td colspan="<%= colspan %>" class="sm" align="right"><i>Total Stock Charges</i></td>
        <td class="sm" align="right"><i><%= TextConverter.floatToMoneyString( order.getTotalStockCharges() ) %><i></td>
    </tr>

   <% if ( order.hasOrderCharge() ) { %>
    <tr>
       <td colspan="<%= colspan %>" class="sm" align="right">(<a href="/jsp/abrc/payment/whats_this_order_charge.jsp">What's this?</a>)<i>Order Charge</i></td>
       <td class="sm" align="right"><i><%= TextConverter.floatToMoneyString( order.getOrderCharge() ) %><i></td>
    </tr>
   <% } %> 
   <% if ( order.hasExpressShippingCharge() ) { %>
   		<%if ( isExpressShippingMandatory ) { %>
   		<tr>
   			<td colspan="<%= colspan %>" class="sm" align="right">(<a href="/jsp/abrc/payment/whats_this_mandatory_express_shipping.jsp">What's this?</a>)<i>Express Shipping</i></td>
          	<td class="sm" align="right"><i><%= TextConverter.floatToMoneyString( order.getExpressShippingCharge() ) %><i></td>   
		</tr>
		<% } else { %>
		<tr>
   			<td colspan="<%= colspan %>" class="sm" align="right"><i>Express Shipping</i></td>
          	<td class="sm" align="right"><i><%= TextConverter.floatToMoneyString( order.getExpressShippingCharge() ) %><i></td>   
		</tr>
		<% } %>
		
	<% } %>
	<% if ( order.hasPhytosanitaryCharge( ) ) { %>
     <tr>
        <td colspan="<%= colspan %>" class="sm" align="right">(<a href="/jsp/abrc/whats_this_phytosanitary.jsp">What's this?</a>)<i>Phytosanitary Certificate Charge</i></td>
        <td class="sm" align="right"><i><%= TextConverter.floatToMoneyString( order.getPhytosanitaryCharge( ) ) %><i></td>
     </tr>
	<% } %>
     <tr>
        <td colspan="<%= colspan %>" class="sm" align="right"><b>Total ABRC Charges</b></td>
        <td class="sm" align="right"><b><%= TextConverter.floatToMoneyString( order.getTotalCharges() ) %></b></td>
     </tr>
  </table>
