<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.sql.Date" %>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="NAASC Vote" />
</jsp:include>

<%
 String candidate1 = (String)session.getAttribute("candidate1");
 String candidate2 = (String)session.getAttribute("candidate2");
 Date date_voted = (Date)session.getAttribute("date_voted");
 candidate1 = candidate1 != null ? candidate1.trim() : "";
 candidate2 = candidate2 != null ? candidate2.trim() : "";
 session.removeAttribute("candidate1");
 session.removeAttribute("candidate2");
 session.removeAttribute("date_voted");
%>

<%@include file="title.jsp"%>

<table align="center">
<tr><td>

	<% if(date_voted != null) { %>
	<p>On <%= date_voted %>, you voted for:</p>
	<% } else { %>
	<p>You have voted for:</p>
	<% } %>
	<ul>
		<% if(!candidate1.equals("")){ %><li><%= candidate1 %></li><% } %>
		<% if(!candidate2.equals("")){ %><li><%= candidate2 %></li><% } %>
	</ul>
	<p>A confirmation email was sent to your TAIR-registered email address. Thank you for voting.</p>

</td></tr>
</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
