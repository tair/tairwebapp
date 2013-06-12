<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
Template for creating new JSPs
-->

<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "Notepad Entry Not Found";
String highlight = "1";
%>

<%
// get value of notepad_id submitted from search form
String notepadID = request.getParameter( "notepad_id");
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<br><br>

<table width="100%">
    <tr>
        <td align="center" class="sm"><font class="mainheader">Notepad Entry Not Found</font></td>
    </tr>

    <tr>
        <td>&nbsp;</td>
    </tr>

    <tr>
        <td align="center" class="sm">
            No notepad entry was found for notepad id 
            <font class="req"><%= notepadID %></font>
            <br><br>
            Click <a href="/servlets/processor?type=notepad&update_action=search">HERE</a>
            to search again
	</td>
    </tr>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />


