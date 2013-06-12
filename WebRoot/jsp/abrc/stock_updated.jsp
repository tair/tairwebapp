<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
Template for creating new JSPs
-->

<%@ page
errorPage="/jsp/common/gen_error.jsp" 
import="org.tair.tfc.*"
%>

<%!
String pageName = "Stock Maintenance";
String highlight = "7";
%>

<%
TfcStock stock = (TfcStock) request.getAttribute( "stock" );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>



<table align="center">
    <tr>
        <td align="center"><font class="mainheader">Stock Updated</font></td>
    </tr>          

    <tr>
        <td align="center">
            <br>
            Stock number <%= stock.get_name() %> has been updated.
            <br><br>

        </td>
    </tr>          



    <tr>
        <td nowrap>
          <form>
            <input type="button" value="Update Another Stock" onClick="document.location.href='/servlets/Order?state=updateStock&update_action=new_update'">
            <br><br>
            <input type="button" value="Return to Update Form" onClick="document.location.href='/servlets/Order?state=updateStock&update_action=search&stock_number=<%= stock.get_name() %>'">
            <br><br>
            <input type="button" value="Return to Personal Home Page" onClick="document.location.href='/servlets/Community?action=login'">         
         </form>
        </td>
    </tr>          

</table>




<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />


