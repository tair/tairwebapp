
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="NAASC Vote" />
</jsp:include>

<%
 String candidate1 = (String)session.getAttribute("candidate1");
 String candidate2 = (String)session.getAttribute("candidate2");
 candidate1 = candidate1 != null ? candidate1.trim() : "";
 candidate2 = candidate2 != null ? candidate2.trim() : "";
%>

<%@include file="title.jsp"%>

<table align="center">
<tr><td>

	<p>You are about to vote for:</p>
	<ul>
		<% if(!candidate1.equals("")){ %><li><%= candidate1 %></li><% } %>
		<% if(!candidate2.equals("")){ %><li><%= candidate2 %></li><% } %>
	</ul>

	<div style="float: left; margin: 10px">
	<form action="/servlets/vote?cancel" method="GET">
	 <input type="submit" value="Cancel" />
	</form>
	</div>

	<div style="float: left; margin: 10px">
	<form action="/servlets/vote" method="POST">
	 <input type="submit" value="Ok"/>
	 <input type="hidden" name="cmd" value="vote"/>
	</form>
	</div>

	<div style="clear: both"></div>

</td></tr>
</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
