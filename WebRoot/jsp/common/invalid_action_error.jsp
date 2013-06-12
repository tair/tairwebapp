<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->


<%@ page import = "org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "Invalid Action Error"; 
String highlight = "1";
%>  

<% InvalidActionException exception = (InvalidActionException) request.getAttribute( "exception" ); %>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<table align="center" cellpadding="2" width="500">

      <tr>
	<td align="center"><font class="errorheader">Invalid Action Requested</font></td>
      </tr>
      <tr>
	<td>
	  <p>
	    <%= exception.getMessage() %>

	    
	  <p>
	    If you believe you received this message in error, <a href="mailto:curator@arabidopsis.org">Contact</a> the TAIR curators to report the error.
	</td>
      </tr>
</table>






<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
