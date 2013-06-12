<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%!
String pageName = "Servlet Error"; 
String highlight = "1";
%>

<%
// Page to handle generic errors originating in servlet

Exception e = (Exception) request.getAttribute( "error" );
if ( e == null ) {
      e = (Exception) request.getAttribute( "exception" );
}

%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

    <table align="center" width="400" cellpadding="3" cellspacing="3">
      <tr>
	<td colspan="2" align="center"><font class="errorheader">An error occurred</font></td>
      </tr>
      <tr>
	<td>Source:</td>
	<td><%=request.getAttribute("error_source")%></td>
      </tr>
      <tr>
	<td>Error:</td>
	<td><%=request.getAttribute("message") %></td>
      </tr>
      <tr>
	<td>Message:</td>
	<td><%= e.getMessage() %></td>
      </tr>
      <tr>
	<td colspan="2">
	  <p>
	  <p>
	    <a href="mailto:informatics@arabidopsis.org">Contact</a> your system administrator
	</td>
      </tr>
    </table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
