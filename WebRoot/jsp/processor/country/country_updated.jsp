<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
Template for creating new JSPs
-->

<%@ page
errorPage="/jsp/common/gen_error.jsp" 
import="org.tair.tfc.*, org.tair.bs.community.*"
%>

<%!
String pageName = "Country Maintenance";
String highlight = "1";
%>

<%
BsCountry country = (BsCountry) request.getAttribute( "country" );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>



<table align="center">
    <tr>
        <td align="center"><font class="mainheader">Country Updated</font></td>
    </tr>          

    <tr>
        <td align="center">
            <br>
            Country data for <%= country.getName() %> has been updated.
            <br><br>

        </td>
    </tr>          



    <tr>
        <td nowrap>
          <form>
            <input type="button" value="Update Another Country" onClick="document.location.href='/servlets/processor?type=country&update_action=new_update'">
            <br><br>
            <input type="button" value="Return to Update Form" onClick="document.location.href='/servlets/processor?type=country&update_action=search&country=<%= country.getName() %>'">
            <br><br>
            <input type="button" value="Return to Personal Home Page" onClick="document.location.href='/servlets/Community?action=login'">         
         </form>
        </td>
    </tr>          

</table>




<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />


