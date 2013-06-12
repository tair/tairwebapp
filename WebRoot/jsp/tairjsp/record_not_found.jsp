<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->


<%@ page import = "org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "Record Not Found"; 
%>  

<% 
RecordNotFoundException exception = (RecordNotFoundException) request.getAttribute( "exception" ); 
String name = exception.getName();
String type = exception.getType();
Long id = exception.getID();
String displayParam = ( id != null ) ? id.toString() : name;
String displayParamType = ( id != null ) ? "id" : "name";
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<table align="center" cellpadding="2" width="450">

      <tr>
	<td align="center"><font class="errorheader">Record Not Found</font></td>
      </tr>

      <tr>
	<td align="center">
	  <p>

	    <% if ( exception.getMessage() != null ) { %>
	        <%= exception.getMessage() %>
	    <% } else { %>
	        No record for object of type <%= type %> was found with <%= displayParamType %> <%= displayParam %>.

	    <% } %>
	    <p>
	    Please check your request and try again.
	</td>
      </tr>
</table>






<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
