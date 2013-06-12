<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, java.util.*" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "Form Error"; 
String highlight = "1";
%>

<%
InvalidFormException error = (InvalidFormException) request.getAttribute( "exception" );

String msg = error.getMessage();

if ( msg == null ) {
	msg = "";
}

Map errorList = error.getFormErrors();
%>



<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>


    <table align="center" cellpadding="3" cellspacing="3" width="600">
      <tr>
	<td align="center"><font class="errorheader"><%=msg %></font></td>
      </tr>
      
<% if ( errorList != null ) { %>
    <tr>
      <td align="center">
	<table cellpadding="3" cellspacing="3">

<%

    Iterator iterator = errorList.keySet().iterator();
    while ( iterator.hasNext() ) {
       String field = (String) iterator.next();
	
%>
	<tr>
	  <td><%= errorList.get( field )%></td>
	</tr>
<% 
    field = null;
    }
%>

      </table>
      </td>
    </tr>
<% } %>

    <tr>
      <td>&nbsp;</td>
    </tr>

    <tr>
      <td align="center">
		Please use the "Back" button on your browser to return to the form and correct your submission.
      </td>
    </tr>

  </table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
