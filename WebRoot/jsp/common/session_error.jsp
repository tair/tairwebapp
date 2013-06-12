<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->


<%@ page import = "org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "Session Error"; 
String highlight = "1";
%>  

<% InvalidSessionException exception = (InvalidSessionException) request.getAttribute( "exception" ); %>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<table align="center" cellpadding="3" width="450">
      <tr>
	<td align="center"><font class="errorheader">Object not found</font></td>
      </tr>
      <tr>
	<td>
	  <p>
	    An object necessary for processing your request was not found. Perhaps your session has expired?
	  <p>
	    Error message: <%= exception.getMessage() %>
	  <p>
	    If you believe you received this message in error, <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">Contact</a> the TAIR curators to report the error.
	</td>
      </tr>
</table>



<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
