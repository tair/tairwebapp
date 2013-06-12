<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%!
String pageName = "Stock Maintenance";
String highlight = "7";
%>


<%
String stockNumber = request.getParameter( "stock_number" );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>



<table width="500" align="center">
    <tr>
        <td align="center"><font class="errorheader">Stock Not Found</font></td>
    </tr>          

    <tr>
        <td align="center">
            <br>
            Stock number <font class="error"><%= stockNumber %> was not 
            found in the database.
            <br><br>
            <form>
               <input type="button" value="Search Again" onClick="document.location.href='/servlets/Order?state=updateStock&updateAction=new_update'">
            </form>
        </td>
    </tr>          




<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />


