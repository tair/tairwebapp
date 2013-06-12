<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
Page to confirm that ABRC constants were updated successfully
-->

<%@ page
errorPage="/jsp/common/gen_error.jsp" 
import="org.tair.tfc.*"
%>

<%!
String pageName = "Abrc Constants";
String highlight = "7";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<p>

<table align="center">
    <tr>
        <td align="center"><font class="mainheader">Constants Updated</font></td>
    </tr>          

    <tr>
        <td align="center">
            <br>
            Abrc constants have been updated.
            <br><br>

        </td>
    </tr>          



    <tr>
        <td nowrap>
          <form>
            <input type="button" value="Return to Update Form" onClick="document.location.href='/servlets/Order?state=constant&update_action=view'">
            <br><br>
            <input type="button" value="Return to Personal Home Page" onClick="document.location.href='/servlets/Community?action=login'">         
         </form>
        </td>
    </tr>          

</table>




<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />


