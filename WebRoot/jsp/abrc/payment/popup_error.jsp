<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <title>ABRC Order</title>
 <link rel="stylesheet" type="text/css" href="/css/main.css">
 <link rel="stylesheet" type="text/css" href="/css/search.css">
 <link rel="stylesheet" type="text/css" href="/css/base.css">
</head>
<body>

<div style="text-align:center">
 <p class="mainheader">Order Number <%=request.getParameter("orderNumber")%></p>
 <p>
  TAIR has not recieved your payment information from our external credit card processor or the payment information is invalid.
  Please let ABRC know that your order needs to be finalized by <a href="#" onClick="do_email(); return false;">emailing them</a>.
  Sorry for the inconvenience.
 </p>
 <p><input type="button" value="Email ABRC" onclick="do_email()"></p>
</div>

<% String num = (String) request.getParameter("orderNumber");
   if(num == null) num = ""; %>

<script type="text/javascript">
function do_email(){
 location.href='mailto:abrc@osu.edu?SUBJECT=Please finalize order <%=num%>';
}
</script>

</body>
</html>
