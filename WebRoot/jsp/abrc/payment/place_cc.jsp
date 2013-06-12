<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.abrc.order.*, org.tair.utilities.*, org.tair.tfc.*, org.tair.abrc.payment.HOP, java.util.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="TAIR - Credit Card Payment" />
</jsp:include>

<%
Order order = (Order) request.getAttribute("order");
if(order != null){
%>

<div style="text-align: center">

<p class="mainheader" style="margin: 5px;">Pay with Credit Card</p>

<!-- <p style="padding: 5px 35px">ABRC accepts Mastercard and VISA.  You will be redirected to a secure electronic
credit card processing page to enter your credit card information.  Your card will
be authorized immediately, but will not be debited until your stocks are shipped.</p> -->

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
      <td class="sm" align="right"><i><%=TextConverter.floatToMoneyString(item.getCharge())%><i></td>
   </tr>
 <% } %>

 <% for(LineItem item: order.getItems(LineItem.Type.EXPRESS_SHIPPING)) { %>
   <tr>
      <td class="sm" align="right"><i>Express Shipping Charge</i></td>
      <td class="sm" align="right"><i><%=TextConverter.floatToMoneyString(item.getCharge())%><i></td>
   </tr>
 <% } %>

 <% for(LineItem item: order.getItems(LineItem.Type.PHYTOSANITARY_CHARGE)) { %>
   <tr>
      <td class="sm" align="right"><i>Phytosanitary Certificate Charge</i></td>
      <td class="sm" align="right"><i><%=TextConverter.floatToMoneyString(item.getCharge())%><i></td>
   </tr>
 <% } %>

 <tr>
  <td class="sm" align="right"><b>Total</b></td>
  <td class="sm" align="right"><b><%= TextConverter.floatToMoneyString(order.getTotalOrderCharges()) %></b></td>
 </tr>

</table>

<script type="text/javascript" src="/js/prototype.js"></script>
<script type="text/javascript">
var b = $('the-button');
if(b) b.disabled = false;
function do_popup(){
 $('the-button').disabled = true;
 var win = window.open("/servlets/payment-popup-cc", "paymentpopup", "menubar=no,width=530,height=500,toolbar=no,scrollbars=yes");
 win.focus();
 setTimeout(refresh, 10000);
}
function refresh(){
 location.reload();
}
</script>

<div style="margin-top: 15px;">
 <form action="" method="POST">
  <input type="button" value="Enter Credit Card Information" onclick="do_popup()" id="the-button">
  <input type="hidden" name="cmd" value="un-place">
  <input type="submit" value="Go Back to Order">
 </form>
</div>

</div>

<% } %>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true"/>

