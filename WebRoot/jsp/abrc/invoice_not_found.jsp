<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="Stock Number Not Found" />
</jsp:include>

<table align="center" cellpadding="2" style="margin: 35px auto">
	<tr>
		<td align="center"><span class="mainheader">No invoice matched your search criteria</span></td>
	</tr>
	<tr>
		<td class="sm">The invoice or order number you have requested is not in our database.</td>
	</tr>
</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
