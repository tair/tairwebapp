<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2012 Carnegie Institution for Science.  All rights 
  reserved.
-->


<%@ page import = "org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "Invalid Parameter"; 
%>  

<% 
InvalidParameterException exception = (InvalidParameterException) request.getAttribute( "exception" ); 
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<table align="center" cellpadding="2" width="450">

      <tr>
	<td align="center"><font class="errorheader">Invalid Parameter</font></td>
      </tr>

      <tr>
	<td align="center">
	  <p>

	    <% if ( exception.getMessage() != null ) { %>
	        <%= exception.getMessage() %>
	    <% } else { %>
	        Invalid parameter found.
	    <% } %>
	    <p>
	    Please check your request and try again.
	</td>
      </tr>
</table>






<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
