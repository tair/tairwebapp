<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%!
String pageName = "Session Expired";
String highlight = "1";
%>

<% 
Exception e = (Exception) request.getAttribute( "exception" );
String message = (String) request.getAttribute( "message" );
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>
 <table align="center">
      <tr>
	<td align="center" nowrap colspan="2"><font class="errorheader"><%= message %></font></td>
      </tr>

      <tr>
	<td>&nbsp;</td>
      </tr>

      <tr>
	<td align="left" valign="top">Message Source:</td>
	<td><%= e.getMessage() %></td>
      </tr>
    </table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
