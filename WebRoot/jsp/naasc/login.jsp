
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="NAASC Vote" />
</jsp:include>

<%
 String err = (String)request.getAttribute("error");
 String dberr = (String)request.getAttribute("db error");
%>

<%@include file="title.jsp"%>

<table align="center"><tr><td>
<p style="margin: 0 20% 20px 20%">You must be a registered North American TAIR user to vote. Please login below using your TAIR username and password.</p>

<% if(err != null && !err.trim().equals("")) { %>
<p style="margin: 0 20% 20px 20%; color: red">You have provided an incorrect username and password, or you are not a North American TAIR user.</p>
<% } %>

<% if(dberr != null && !dberr.trim().equals("")) { %>
<p style="margin: 0 20% 20px 20%; color: red">An error occurred while logging in. Please try again later.</p>
<% } %>

<form action="/servlets/vote" method="POST">
<table align="center">
        <tr>
          <td align="right">Username:</td>
          <td><input type="text" size="20" maxlength="30" name="username" id="uname"></td>
        </tr>

        <tr>
          <td align="right">Password:</td>
          <td><input type="password" size="20" maxlength="10" name="password"></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="right">
            <input type="hidden" name="cmd" value="login">
            <input type="submit" name="submit" value="Login">
          </td>
        </tr>
</table>
</form>

</td></tr>
</table>

<script type="text/javascript">
	document.getElementById('uname').focus();	
</script>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
