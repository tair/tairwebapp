<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><%@ page contentType="text/html; charset=UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.abrc.order.Order, org.tair.abrc.payment.HOP, org.tair.utilities.WebApp, org.tair.tfc.*, org.tair.bs.community.*, java.util.*"%>
<%
 Order order = (Order) request.getAttribute("order");
 BsPerson person = (BsPerson) request.getAttribute("person");
 String orgName = (String) request.getAttribute("orgName");
 BsAddress addr = (BsAddress) request.getAttribute("addr");
 String token = (String) request.getAttribute("paymentToken");
%>
<html>
<head>
 <title>Payment</title>
 <link rel="stylesheet" type="text/css" href="/css/main.css">
 <link rel="stylesheet" type="text/css" href="/css/search.css">
 <link rel="stylesheet" type="text/css" href="/css/base.css">
</head>

<% if(order != null && addr != null && person != null && token != null && !token.equals("")) { %>
<%
// Create map with a custom put() method which inserts empty strings instead of nulls
Map info = new HashMap(){public Object put(Object key,Object val){return super.put(key,val==null?"":val);}};
info.put("orderNumber",order.getOrderNumber());
info.put("lastName",person.getLastName());
info.put("firstName",person.getFirstName());
info.put("orgName",orgName);
info.put("orgAddress",addr.getAddress());
info.put("orgCity",addr.getCity());
info.put("orgState",addr.getRegion());
info.put("orgZip",addr.getPostalCode());
info.put("orgCountry",HOP.translateCountryCode(addr.getCountryObject() != null ? addr.getCountryObject().getName() : null));
Calendar c = Calendar.getInstance();
%>

<body onload="loaded()">
 <div style="text-align: center">
  <p class="mainheader" style="margin:10px">Redirecting to a secure electronic credit card processing page...</p>
 </div>
 <form action="<%=WebApp.getPaymentPageURL()%>" method="post" name="cc_payment_form">
  <%= HOP.insertSignature(Float.toString(order.getTotalOrderCharges()), "usd") %>
  <input type="hidden" name="orderPage_transactionType" value="authorization"/>
  <input type="hidden" name="card_expirationYear" value="<%=c.get(Calendar.YEAR)%>"/>
  <input type="hidden" name="card_expirationMonth" value="<%=new java.text.DecimalFormat("00").format(c.get(Calendar.MONTH))%>"/>
  <input type="hidden" name="comments" value="ABRC Stock Order"/>
  <input type="hidden" name="orderNumber" value="<%=info.get("orderNumber")%>"/>
  <input type="hidden" name="billTo_firstName" value="<%=info.get("firstName")%>"/>
  <input type="hidden" name="billTo_lastName" value="<%=info.get("lastName")%>"/>
  <input type="hidden" name="billTo_company" value="<%=info.get("orgName")%>"/>
  <input type="hidden" name="billTo_street1" value="<%=info.get("orgAddress")%>"/>
  <input type="hidden" name="billTo_city" value="<%=info.get("orgCity")%>"/>
  <input type="hidden" name="billTo_state" value="<%=info.get("orgState")%>"/>
  <input type="hidden" name="billTo_postalCode" value="<%=info.get("orgZip")%>"/>
  <input type="hidden" name="billTo_country" value="<%=info.get("orgCountry")%>"/>
  <input type="hidden" name="merchantDefinedData1" value="<%=request.getServerName()%>"/>
  <input type="hidden" name="merchantDefinedData2" value="<%=token%>"/>
  <input type="hidden" name="orderPage_ignoreAVS" value="true"/>
 </form>
 <script>
 function loaded(){
  window.opener.location.reload();
  document.forms.cc_payment_form.submit();
 }
 </script>
</body>

<% } else { %>

<body>
 <p class="mainheader" style="margin:10px">Error</p>
 <p>Please login to place your order.</p>
</body>

<% } %>

</html>
