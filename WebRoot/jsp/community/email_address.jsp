<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<%!
String pageName = "Email Address";
String highlight = "2";
%>
<% 
String type = ( String )request.getAttribute( "type" );  
String query_id = (String) request.getAttribute("query_id" );
%>


<table align="center" width="100%">
      <tr>
	<td align="center"><font class="mainheader">Provide Email Address</font></td>
      </tr>
      <tr>
	<td>
Your query result contains over 1000 rows.
Please provide your email address and submit. A URL for viewing and
downloading the result set will be sent to the address you provide.
        </td>
      </tr>

      <tr>
	<td align="center">

	  <form action="/servlets/Search" method="post">
            <input type="hidden" name="action" value="email" />
            <input type="hidden" name="type" value="<%=type%>" />
            <input type="hidden" name="query_id" value="<%= query_id %>" />
	  <table cellpadding="3">

	    <tr>
		<td  colspan=2>
	  	<input type="text" size="20" maxlength="100" name="emailAddress"></td>
	    </tr>

            <tr>
              	<td colspan="5" align="center">
	        <input type="submit" value="Submit">
              	</td>
            </tr>

          </table>
        </form>
     </td>
    </tr>
</table>




<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
