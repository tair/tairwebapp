<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page isErrorPage="true" %>

<%! 
String pageName = "EBI ClustalW Error"; 
String highlight = "1";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<table cellpadding="5" align="center" width="500">
    <tr>
        <td colspan=2 align="center">
	    <center>
	    <font class="errorheader"><b>An error occurred!</b></font>
	    </center>
	</td>
    </tr>
    <tr valign="top">
        <td nowrap>Error message:</td>
	<td>
	    The EBI ClustalW server is not available at this time.
	    Please try again later.
	</td>
    </tr>
</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
