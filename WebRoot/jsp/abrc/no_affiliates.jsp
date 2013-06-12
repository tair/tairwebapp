<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.bs.community.*" %>

<%
	BsPerson person = (BsPerson) request.getAttribute("person");
	String href = (person == null) ?
		"/servlets/Community?action=login" :
		"/servlets/Community?action=edit&amp;type=person&amp;continue_order=true&amp;communityID=" + person.getCommunityId().toString();
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="TAIR - Affiliations" />
</jsp:include>

<table align="center" cellpadding="2" style="margin: 35px auto">
	<tr>
		<td align="center"><span class="mainheader">Your profile has no active affiliations</span></td>
	</tr>
	<tr>
		<td>
			<p style="width:350px; text-align:center">You must be affiliated with a lab to place stock orders through ABRC.
			You may affiliate with a lab by <a href="<%=href%>">editing your profile</a>.</p>
		</td>
	</tr>
</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
