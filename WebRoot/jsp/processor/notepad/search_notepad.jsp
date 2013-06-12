<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
Template for creating new JSPs
-->

<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "Find Notepad Entry";
String highlight = "1";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<br><br>

<table width="100%">
    <tr>
        <td align="center"><font class="mainheader">Find Notepad Entry</font></td>
    </tr>

    <tr>
        <td class="sm">&nbsp;</td>
    </tr>


    <tr>
        <td class="sm" align="center">
            Enter the notepad_id of the Notepad entry you'd like to deactivate in 
            the text box below and click "Find"
        </td>
    </tr>

    <tr>
        <td class="sm">&nbsp;</td>
    </tr>
  


    <form action="/servlets/processor" method="post">
    <input type="hidden" name="type" value="notepad">
    <input type="hidden" name="update_action" value="confirm_deactivate">
    <tr>
        <td class="sm" nowrap align="center">
           <font class="formheader">Notepad id:</font>
           &nbsp;&nbsp;
           <input type="text" name="notepad_id" size="10" maxlength="15">
           &nbsp;&nbsp;
	   <input type="submit" value="Find">
        </td>
    </tr>
    </form>

</table>



<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />


