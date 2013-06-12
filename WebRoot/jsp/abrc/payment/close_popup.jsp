<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="org.tair.abrc.CompositeOrder"%>
<% CompositeOrder order = (CompositeOrder)request.getAttribute("order"); %>
<html>
<head>
 <title>Credit Card Processed</title>
 <link rel="stylesheet" type="text/css" href="/css/main.css">
 <link rel="stylesheet" type="text/css" href="/css/search.css">
 <link rel="stylesheet" type="text/css" href="/css/base.css">
</head>
<body onload="view_invoice()">

<script type="text/javascript">
function view_invoice(){
 try {
  window.opener.location.href = "<%=request.getAttribute("page")%>";
  window.opener.focus();
 } catch(e){}
 window.close();
}
</script>

</body>
</html>
