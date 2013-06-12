<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
%>

<%!
String pageName = "Stock Maintenance";
String highlight = "7";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>



<table align="center">
    <tr>
        <td align="center"><font class="mainheader">Find Stock to Update</font></td>
    </tr>          

    <tr>
        <td align="center" nowrap>
            <br>
            Find a stock record to update by typing in the stock number below
            and clicking "Find Stock"

            <br><br>


        </td>
    </tr>          


    <form action="/servlets/Order" method="post">
       <input type="hidden" name="state" value="updateStock">
       <input type="hidden" name="update_action" value="search">

    <tr>
        <td align="center" nowrap>
            <font class="formheader">Stock Number:</font>
            &nbsp;
            <input type="text" name="stock_number" size="10" maxlength="50">
            &nbsp;&nbsp;&nbsp;
            <input type="submit" value="Find Stock">
        </td>
    </tr>          
    </form>
</table>




<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />


