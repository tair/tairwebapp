<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "Payment Processed";
String highlight = "1";
 %>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<table align="center">
    <tr>
		<td align="center"><font class="mainheader">Payment Processed</font></td>
    </tr>      
    <tr>
		<td>
	  		<br>
	  		<br>
	  		The payment for this invoice has been processed.<br>
		</td>
     </tr>
     	<td align="center">
	  		<br>
	  		<br>
	  		<form action="/jsp/abrc/payment/curator_invoice_form.jsp" method="post">
	  		<input type="submit" value="Return to Invoice Search">
	  	</form>
		</td>
      </tr> 
</table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
