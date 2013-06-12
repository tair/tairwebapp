<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "java.util.*, org.tair.abrc.order.Order, org.tair.abrc.order.LineItem, java.util.Iterator, org.tair.abrc.stock.UnorderedStock, org.tair.abrc.OrderFormValidator, org.tair.abrc.CompositeOrder, org.tair.abrc.stock.Stock, org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%
List<String> failed = (List<String>) request.getAttribute("failed");
Order order = (Order) request.getAttribute("order");
boolean NASC = order == null ? false : order.getSeedStockCenter().equals(DataConstants.getNASCStockCenter());
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="Current Order" />
</jsp:include>

<% if(order != null) { %>

<div style="text-align: center">
 <div class="mainheader">Current Order</div>
 <p>Please use the buttons provided to navigate through these screens.<br>
 DO NOT use the back button on your browser unless prompted to do so.</p>

 <% if ( NASC ) { %>
 <p>NOTE: According to our records, your lab is located in Europe.
 You can no longer order seed stocks through TAIR.  Please order
 directly from NASC at <a href="http://www.arabidopsis.info">http://www.arabidopsis.info</a>.  All DNA
 orders placed through TAIR will be shipped by ABRC.</p>
 <% } %>
</div>

<div style="text-align: center; background-color: <%=DataConstants.BGCOLOR%>; padding-bottom: 30px">
 <div class="header" style="padding: 6px">Order Contents/Charges</div>

 <% if(failed != null) { %>
 <div>
  <% for(String f: failed) { %>
   <p style="font-size:1.3em;color:red"><%=f.replaceAll("&","&amp;").replaceAll(">","&gt;").replaceAll("<","&lt;")%></p>
  <% } %>
 </div>
 <% } %>

<%--
 <%
   int dnaCount = order.getDNAStockCount();
   int seedCount = order.getSeedStockCount();
 %>
 <% if(dnaCount > 0) { %>
  <span class="formheader">DNA Stocks:</span> <%= dnaCount %>
 <% } if(seedCount > 0) { %>
  <span class="formheader">Seed Stocks:</span> <%= seedCount %>
 <% } if ( order.hasStocks() ) { %>
  <span class="formheader">Total Stocks:</span> <%= order.getStockCount() %>
 <% } %>
--%>

 <% if ( order.hasStocks() ) { %>
  <jsp:include page="/jsp/abrc/order_summary.jsp" flush="true"/>
  <jsp:include page="/jsp/abrc/shipping_include.jsp" flush="true"/>
 <% } else { %>
  No stocks currently in order.
 <% } %>

</div>

<form action="" method="post" name="updateform">
<div style="background-color: <%=DataConstants.BGCOLOR%>; padding: 5px 5px 20px 5px;">
 <table border="0" width="100%" cellspacing="0">

  <tr>
   <td><span class="header">Add Stocks to Order</span></td>
   <td><span class="header">Order Comments</span></td>
  </tr>

  <tr valign="bottom">
   <td>
    Type Stock #s below <br>
    and click on Continue with Order.<br>
    (Separate stock #'s by returns).<br>
    <textarea name="stock_number" wrap="virtual" cols="30" rows="5"></textarea>
   </td>
   <td>
    (Stock #s entered here will NOT<br>
    be added to your order).<br><br>
    <textarea name="orderer_comments" wrap="virtual" cols="30" rows="5"><%= EmptyTextConverter.convert( TextConverter.dbToText( order.getOrdererComments() ) ) %></textarea>
   </td>
  </tr>

  <% if ( order.getProxyOrder() ) { %>
  <tr>
   <td>
    ABRC Comments:<br>
    <textarea name="ABRC_comments" wrap="virtual" cols="30" rows="5"><%= EmptyTextConverter.convert( TextConverter.dbToText( order.getABRCComments() ) ) %></textarea>
   </td>
   <td>
    ABRC Public Comments:<br>
    <textarea name="ABRC_public_comments" wrap="virtual" cols="30" rows="5"><%= EmptyTextConverter.convert( TextConverter.dbToText( order.getABRCPublicComments() ) ) %></textarea>
   </td>
  </tr>
  <tr>
   <td colspan="2">
    Waive Order Charges? &nbsp;&nbsp;
    <%= HTMLFactory.createCheckBox( "no_charge", "true", order.getNoCharge() ) %>
   </td>
  </tr>
  <% } %>

 </table>
</div>
<input type="hidden" name="cmd" value="update">

<% for(LineItem item: order.getItems(LineItem.Type.STOCK)) { if(item.getMutableQuantity()){ %>
 <input type="hidden" id="QUANTITY:<%=item.getName().toUpperCase()%>" name="QUANTITY:<%=item.getName().toUpperCase()%>" value="<%=item.getQuantity()%>">
<% }} %>
</form>

<script type="text/javascript" src="/js/prototype.js"></script>
<script type="text/javascript">
function change_quant(elem, name){
 $(name).value = $(elem).value;
}
</script>

<div style="text-align: center">
 <p><b>You may leave this page to search or browse, and return at any time by
 clicking on "My Home" and then "View Current Order".</b></p>
 <input type="button" name="submit" value="Update" onclick="document.updateform.submit()">
 <input type="button" value="Search database" onClick="document.location.href='/index.jsp'">
 <input type="button" value="Browse ABRC Catalog" onClick="document.location.href='/servlets/Order?state=catalog'">
 <input type="button" value="Cancel Order" onclick="document.location.href='/servlets/Order/cancel'">
</div>

<% if ( order.hasStocks() ) { %>
<div class="header" style="text-align:center; margin: 20px 0 10px 0">Enter Payment Information</div>
<table align="center">
<tr><td>
<% if(order.getTotalOrderCharges() > 0) { %>
  <% String method = order.getPaymentMethod();
   if(method.equals(DataConstants.NO_PAYMENT_METHOD) || method.equals(DataConstants.CREDIT_CARD_PAYMENT_METHOD)) { %>
   <form action="" method="post">
    <input type="hidden" name="cmd" value="place-cc">
    <input type="submit" value="Pay with Credit Card">
   </form>
  <% } %>
  </td><td>
  <% if(method.equals(DataConstants.NO_PAYMENT_METHOD) || method.equals(DataConstants.PURCHASE_ORDER_PAYMENT_METHOD)) {%>
   <form action="" method="post">
    <input type="hidden" name="cmd" value="place-po">
    <input type="submit" value="Pay with PO/other">
   </form>
  <% } %>

<% } else { %>
 <form action="/servlets/Order/place" method="post">
  <input type="submit" value="Place Order">
 </form>
<% } %>

</td></tr>
</table>
<% } %>

<% } else { %>
null order
<% } %>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
