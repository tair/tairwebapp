<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "Email Sent";
String highlight = "2";
%>

<% 
// if "remind_action" = mail, user requested email, otherwise curator sent it
boolean personReminder = ( request.getParameter( "remind_action" ) != null && request.getParameter( "remind_action" ).equals( "mail" ) );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>


    <table align="center" cellpadding="3" width="500">
      <tr>
	<td align="center">
	  <font class="mainheader">Email Sent</font>
	</td>
      <tr>
	<td align="center">
	  The requested email has been sent.
	  
	    
	  <% if ( personReminder ) { %>
	  You will receive email shortly.
	  
          <% } else { %>
	  
	  <p>  
	  <form action="/servlets/Community" method="post">
 	    <input type="hidden" name="action" value="redirect">
	    <input type="hidden" name="req_page" value="personProfile">
	    <input type="submit" value="Return to Profile">
	    &nbsp;&nbsp;&nbsp;
	    <input type="button" value="Return to Personal Home Page" onClick="document.location.href='/servlets/Community?action=login'">
	  </form>

	  <% } %>

	</td>
      </tr>
    </table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
