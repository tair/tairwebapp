<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.abrc.order.*, org.tair.utilities.*, org.tair.tfc.*, org.tair.abrc.payment.HOP, java.util.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="TAIR - Purchase Order Payment" />
</jsp:include>

<%
Order order = (Order) request.getAttribute("order");
if(order != null){
%>

<div style="text-align: center">
<p class="mainheader" style="text-align: center; margin: 5px">Enter Purchase Order / Other Payment Type Information</p>

<p style="padding: 5px 35px">Enter the PO# or your reference# (this will display on your invoice) and click "Place Order".
If you do not have this number, you may enter your last name or the last name of your PI. We accept payment by check
or credit card. We cannot accept electronic transfers to our bank.</p>

<table align="center" width="300" cellpadding="2" border="0" cellspacing="0" bgcolor="<%= DataConstants.BGCOLOR %>">
 <tr>
  <td class="sm" colspan="2"align="center" nowrap><font class="formheader">Summary</font></td>
 </tr>

 <tr>
  <td class="sm" align="right" nowrap><i>Total Stock Charges</i></td>
  <td class="sm" align="right"><%= TextConverter.floatToMoneyString(order.getTotalStockCharges()) %></td>
 </tr>

 <% for(LineItem item: order.getItems(LineItem.Type.ORDER_CHARGE)) { %>
   <tr>
      <td class="sm" align="right"><i>Order Charge</i></td>
      <td class="sm" align="right"><i><%=order.getNoCharge() ? "$0.00" : TextConverter.floatToMoneyString(item.getCharge())%><i></td>
   </tr>
 <% } %>

 <% for(LineItem item: order.getItems(LineItem.Type.EXPRESS_SHIPPING)) { %>
   <tr>
      <td class="sm" align="right"><i>Express Shipping Charge</i></td>
      <td class="sm" align="right"><i><%=order.getNoCharge() ? "$0.00" : TextConverter.floatToMoneyString(item.getCharge())%><i></td>
   </tr>
 <% } %>

 <% for(LineItem item: order.getItems(LineItem.Type.PHYTOSANITARY_CHARGE)) { %>
   <tr>
      <td class="sm" align="right"><i>Phytosanitary Certificate Charge</i></td>
      <td class="sm" align="right"><i><%=order.getNoCharge() ? "$0.00" : TextConverter.floatToMoneyString(item.getCharge())%><i></td>
   </tr>
 <% } %>

 <tr>
  <td class="sm" align="right"><b>Total</b></td>
  <td class="sm" align="right"><b><%= TextConverter.floatToMoneyString(order.getTotalOrderCharges()) %></b></td>
 </tr>

</table>

<% if("missing".equals(request.getAttribute("msg"))) { %><div style="margin-top: 15px; color: red">Please enter a PO number.</div><% } %>
<% if("error".equals(request.getAttribute("msg"))) { %><div style="margin: 15px auto; color: red; width: 500px">
There was an error while preparing order for payment. Please cancel your order and try again in a few minutes. If you continue to experience this problem, please contact TAIR
</div>
<% } %>
<div style="margin-top: 15px;">
 <form action="" method="post" style="display:inline">
  <label for="po_number" style="padding: 5px">PO / Other #</label>
  <input type="text" id="po_number" name="po_number" value="">
  <input type="button" value="Place Order" onclick="this.disabled = 'true'; this.form.submit();">
  <input type="hidden" name="cmd" value="po-number">
 </form>
 <form action="" method="post" style="display:inline">
  <input type="hidden" name="cmd" value="un-place">
  <input type="submit" value="Go Back to Order">
 </form>
</div>

</div>

<% } %>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true"/>

