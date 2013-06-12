<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "ABRC User Invoice Management";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="id" value="106" />
</jsp:include>

<script type="text/javascript">
function check_number() {
    var form = document.userInvoiceForm;
    if (form.invoice_id.value == "" && form.order_number.value== "" ) {
        alert ("Either Invoice Number or Order Number need to be filled out.");
        return false;
    }else if (form.invoice_id.value != ""){
        var isNumber = /^-?\d+$/.test(form.invoice_id.value);
        if (isNumber == false) {
            alert ("Invoice Number must be a number and cannot contain spaces.");
            return false;
        }else{
            return true;
        }
        
    }else if (form.order_number.value != ""){
        var isNumber = /^-?\d+$/.test(form.order_number.value);
        if (isNumber == false) {
            alert ("Order Number must be a number and cannot contain spaces.");
            return false;
        }else{
            return true;
        }
    }
    
}
</script>

<form action="/servlets/InvoiceSearcher" method="post" name="userInvoiceForm" onSubmit='return check_number()'>
<table width="100%" align="center">
	<tr>
	  <td align="center">
	    <font class="mainheader">ABRC Invoice Management</font>
	    <p>
	      Use this form to search for an invoice by Invoice or Order Number.
	  </td>
	</tr>
	<tr>
	  	<td>
	    	<table border="0" cellpadding="3" cellspacing="0" align="center" width="100%" bgcolor="<%= DataConstants.BGCOLOR %>">
        		<tr>
					<td class="sm" align="right"><font class="formheader">Invoice Number:  ABRC</font></td>
					<td class="sm" align="left" nowrap>
		  			<input type="text" align="right" size="12" maxlength="12" name="invoice_id">&nbsp;(number only)
					</td>
          		</tr>
          		<tr>
	    			<td class="sm" align="right"><font class="formheader">OR</font></td>
	    		</tr>
        		<tr>
					<td class="sm" align="right"><font class="formheader">Order Number:</font></td>
					<td class="sm" align="left" nowrap>
		  			<input type="text" align="right" size="12" maxlength="12" name="order_number">
					</td>
	    		</tr>


	    </table>
	  </td>
	</tr>
	
	<tr>
	  <td class="sm" align="center">
	    <input type="submit" value="Submit">
	    &nbsp;
	    <input type="reset" value="Reset">
	  </td>
	</tr>
</table>
	
</form>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
