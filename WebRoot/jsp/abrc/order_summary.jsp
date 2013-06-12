<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.abrc.order.*, org.tair.utilities.TextConverter" %>
<%
Order order = (Order) request.getAttribute("order");
boolean mandatory = order.isExpressShippingMandatory();
int colspan = 6;
if(order != null){
%>

<form action="" method="post">

<table align="center" cellpadding="3" border="1" cellspacing="0">
    <tr>
      <th class="sm">&nbsp;</th>
      <th class="sm">Qty</th>
      <th class="sm">Stock #</th>
      <th class="sm">Stock Type</th>
      <th class="sm">Order Date</th>
      <th class="sm">Unit Price</th>
      <th class="sm">Extended Price</th>
   </tr>

 <% for(LineItem item: order.getItems(LineItem.Type.STOCK)) { %>
   <tr>
      <td class="sm" align="center"><input type="checkbox" name="delete" value="<%=item.getStockId()%>" /></td>
      <td class="sm" align="center"><%if(item.getMutableQuantity()){%><input type="text" onchange="change_quant(this,'QUANTITY:<%=item.getName().toUpperCase()%>')" value="<%=item.getQuantity()%>" size="2"><%}else{%><%=item.getQuantity()%><%}%></td>
      <td class="sm"><%=item.getName()%></td>
      <td class="sm"><%=item.getStockType()%></td>
      <td class="sm"><%=TextConverter.dateToString(item.getDateLastModified())%></td>
      <td class="sm"><%=(order.getNoCharge() || order.isWaived(item)) ? "$waived" : TextConverter.floatToMoneyString(item.getPrice())%></td>
      <td class="sm" align="right"><%=(order.getNoCharge() || order.isWaived(item)) ? "$0.00" : TextConverter.floatToMoneyString(item.getCharge())%></td>
   </tr>
 <% } %>

   <tr>
      <td colspan="<%= colspan %>" class="sm" align="right"><i>Total Stock Charges</i></td>
      <td class="sm" align="right"><i><%=TextConverter.floatToMoneyString(order.getTotalStockCharges())%><i></td>
   </tr>

 <% for(LineItem item: order.getItems(LineItem.Type.ORDER_CHARGE)) { %>
   <tr>
      <td colspan="<%= colspan %>" class="sm" align="right">(<a href="/jsp/abrc/payment/whats_this_order_charge.jsp">What's this?</a>) <i>Order Charge</i></td>
      <td class="sm" align="right"><i><%=order.getNoCharge() ? "$0.00" : TextConverter.floatToMoneyString(item.getCharge())%><i></td>
   </tr>
 <% } %>

 <% for(LineItem item: order.getItems(LineItem.Type.EXPRESS_SHIPPING)) { %>
   <tr>
      <td colspan="<%= colspan %>" class="sm" align="right"><%if(mandatory){%>(<a href="/jsp/abrc/payment/whats_this_mandatory_express_shipping.jsp">What's this?</a>) <%}%><i>Express Shipping</i></td>
      <td class="sm" align="right"><i><%=order.getNoCharge() ? "$0.00" : TextConverter.floatToMoneyString(item.getCharge())%><i></td>
   </tr>
 <% } %>

 <% for(LineItem item: order.getItems(LineItem.Type.PHYTOSANITARY_CHARGE)) { %>
   <tr>
      <td colspan="<%= colspan %>" class="sm" align="right">(<a href="/jsp/abrc/whats_this_phytosanitary.jsp">What's this?</a>) <i>Phytosanitary Certificate Charge</i></td>
      <td class="sm" align="right"><i><%=order.getNoCharge() ? "$0.00" : TextConverter.floatToMoneyString(item.getCharge())%><i></td>
   </tr>
 <% } %>

   <tr>
      <td colspan="<%= colspan %>" class="sm" align="right"><b>Total ABRC Charges</b></td>
      <td class="sm" align="right"><b><%=TextConverter.floatToMoneyString(order.getTotalOrderCharges())%></b></td>
   </tr>

</table>

<input type="hidden" name="cmd" value="delete" />
<table align="center" width="400" border="0">
<tr><td align="left">
<input type="submit" value="Remove Selected">
</td></tr></table>

</form>
<% } %>
