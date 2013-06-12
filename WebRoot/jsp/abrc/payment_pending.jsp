<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "java.util.*, org.tair.abrc.order.Order, org.tair.abrc.order.LineItem, java.util.Iterator, org.tair.abrc.stock.UnorderedStock, org.tair.abrc.OrderFormValidator, org.tair.abrc.CompositeOrder, org.tair.abrc.stock.Stock, org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%
Order order = (Order) request.getAttribute("order");
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="Current Order" />
</jsp:include>

<% if(order != null) { %>

<table align="center" width="500">
<tr><td style="text-align:center">
 <p class="mainheader">Payment in Progress</p>
 <img src="/i/boxes.gif" alt="Payment in Progress" />
</td><tr>
<tr><td>
 <h4>Please use the popup window window to complete the payment process.</h4>
 <h4>You will be redirected to an order confirmation page as soon as we receive your payment information. <a href="" alt="check payment">Check for your payment information now.</a></h4>
 <p>If a popup window has not appeared, please cancel this payment, check your browser settings, and try again.</p>
 <p>If several minutes have passed since you completed your payment and you have not been redirected to the order
    confirmation page, you will need to contact ABRC.  Please reference <b>order number <%=order.getOrderNumber()%></b> in your email.</p>
 <p>You may cancel this payment if you wish to complete your order at another time or if you would like to choose another payment method.</p>
</td><tr>
<tr><td style="text-align:center">
 <p>
  <form action="" method="POST">
   <input type="hidden" name="cmd" value="cancel-payment">
   <input type="submit" value="Cancel This Payment">
  </form>
 </p>
</td></tr></table>

<% } else { %>
null order
<% } %>

<script type="text/javascript">
function refresh(){
 location.reload();
}
setTimeout(refresh, 10000);
</script>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
