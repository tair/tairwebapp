<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page import = "org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "Empty Payment";
String highlight = "1";
 %>

<%
EmptyPaymentException e = (EmptyPaymentException) request.getAttribute( "exception" );
String paymentParam = ( e.hasPaymentID() ) ? "&payment_id=" + e.getPaymentID().toString() : "";
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<table align="center">
      <tr>
	<td align="center"><font class="mainheader">Payment Empty</font></td>
      </tr>
      <tr>
	<td>
	  <p>
	    All invoices have been removed from this payment.  If you want to delete the payment, 
	    <a href="/servlets/Order?state=maintain_payment&mode=delete<%= paymentParam %>">Click here</a>.
	  <p><font class="req">Note:</font> this will delete <b>all</b> record of this payment.
	  <p>
	    If you have reached this page by mistake, use the "Back" button on your browser to continue editing this payment.
	</td>
      </tr>

</table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
