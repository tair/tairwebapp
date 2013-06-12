<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
import="org.tair.utilities.HTMLFactory"
%>

<%!
String pageName = "Country Maintenance";
String highlight = "1";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>



<table align="center">
    <tr>
        <td align="center" colspan="2"><font class="mainheader">Country Maintenance</font></td>
    </tr>          

    <tr>
        <td align="center" colspan="2" nowrap>
            <br>

			Select country to update from menu and click "Update Country".
        </td>
    </tr>          


    <form action="/servlets/processor" method="get">
       <input type="hidden" name="type" value="country">
       <input type="hidden" name="update_action" value="search">

    <tr>
        <td align="center" nowrap>
            <font class="formheader">Country:</font>

			<%= HTMLFactory.createCountrySelect( "country", "", false ) %>
	    </td>
	    <td>
            <input type="submit" value="Update Country">
		</td>
    </tr>
    
	</form>
	
	<tr>
        <td align="center" nowrap colspan="2">&nbsp;</td>
    </tr>

    <tr>
        <td align="center" nowrap colspan="2">
            <font class="formheader">OR</font>
		</td>
    </tr>

	<tr>
        <td align="center" nowrap colspan="2">&nbsp;</td>
    </tr>

    <form action="/servlets/processor" method="get">
       <input type="hidden" name="type" value="country">
       <input type="hidden" name="update_action" value="search">

    <tr>
        <td align="center" nowrap>
			Add a new country by clicking "Add New Country"
		</td>
		<td>
    		<input type="submit" value="Add New Country">
   		</td>
	</tr>
	
    		
    </form>
</table>




<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />


