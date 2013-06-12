<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
Template for creating new JSPs
-->

<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "Notepad Entry Deactivated";
String highlight = "1";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<br><br>

<table width="100%">
    <tr>
        <td align="center"><font class="mainheader">Notepad Entry Deactivated</font></td>
    </tr>

    <tr>
        <td>&nbsp;</td>
    </tr>

    <tr>
        <td align="center">
            Click <a href="/servlets/processor?type=notepad&update_action=search">HERE</a>
            to find and deactivate additional entries
        </td>
    </tr>
</table>



<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />


