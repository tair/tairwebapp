<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "What's This Other Payment Options";
String highlight = "1";
 %>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<table align="center">
      <tr>
      <br>
	<td align="center"><font class="mainheader">Other Payment Options</font></td>
      </tr>     
      <tr>
	<td>
	  <br>
	  	If your institution does not utilize credit cards or 
	  	purchase orders, please select the "Pay with PO/other" option and 
		enter your reference# (this will display on your invoice).  If you do 
		not have this number, you may enter your last name or the last name 
		of your PI. <br /> <br />

	  	If you select the "Pay with PO/other" option, you will receive email notification when your order is shipped
	  	requesting that you print your invoice and send payment. We accept payment by check or credit card.  
        We cannot accept electronic transfers to our bank.
	</td>
      </tr>
</table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
