<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, org.tair.abrc.stock.*, java.net.*"%>


<% DefinitionsDetail detail = 
       (DefinitionsDetail) request.getAttribute("detail"); %>


<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/main.css">
<link rel="stylesheet" type="text/css" href="/css/search.css">
</head>

<body bgcolor="#F5F9FF">

<p>
<b><%= detail.getDisplayValue() %></b>: 
    <%= detail.getDefinition() != null ? detail.getDefinition() 
                                       : "No definition defined" %>
</p>


<%-- Display all the "child" definitions --%>
<% DefinitionsCollection related_definitions = 
        detail.getRelatedDefinitions(); %>
<ul>
    <% for(int i = 0; i < related_definitions.size(); i++) { 
        TfcDefinitions d = related_definitions.get(i);
        if (d.get_field_value() == null) { continue; }
    %>
	<li>
        <b><%= d.get_display_value() %></b>: <%= d.get_definition() %>
	</li>
    <% } %>
</ul>


<p>
<form>
<input type="button" value="Close Window" onClick="javascript:window.close()">
</form>
</p>


</body>
</html>
