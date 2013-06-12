<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>


<%@ page import="org.tair.utilities.*, org.tair.community.*, java.net.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "Login";  
%>

<%
String originalPage = (String) request.getAttribute( "originalPage" );
InvalidLoginException e = (InvalidLoginException) request.getAttribute( "exception" );
String errMsg = ( e != null ) ? e.getMessage() : null;

// only pass communityID to "reminder function" if got here by requesting a person's record
String communityID = request.getParameter( "communityID" );
String type = request.getParameter( "type" );
String paramStr = ( type != null && type.equals( "person" ) && communityID != null ) ? "&communityID=" + communityID : "";
%>



<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="5" />
</jsp:include>

<form name="loginfrm" action="/servlets/Community" method="post">
<table align="center" cellpadding="5" width="500">

	<% if ( errMsg != null ) {%>
      <tr>
	<td colspan="2">
	  <font color="red"><%= errMsg %></font>
	  <p>
	   Login is required to continue.
	</td>
      </tr>
      
       <% } %>
	<tr>
	<td colspan="2">
	<table border= "2" width = "460" align="center">
	<tr>
	<td align="center">
	<font class="req"><b>SIMPLIFIED MUTANT DONATION FORM AVAILABLE </b></font>
	<p>
    ABRC is currently seeking donations of characterized mutant lines and has simplified the donation process. <a href="https://abrc.osu.edu/donate-stocks">Donation information can be found here.</a> 
</p>
	</td>
	</tr>
	</table>
	</td>
	</tr>
	<tr>
	  <td colspan="2">
	  This page allows you to log on to TAIR. Once logged on, you will be able 
      to order stocks from ABRC, view your past stock orders, submit 
      literature-based gene function data, register gene class symbols, and 
      update your profile.	  
	</td>
	</tr>

	<tr>
	  <td align="right">UserName:</td>
	  <td><input type="text" size="20" maxlength="30" name="user_name"></td>
	</tr>

	<tr>
	  <td align="right">Password:</td>
	  <td><input type="password" size="20" maxlength="10" name="password"></td>
	</tr>

	<tr>
	  <td>&nbsp;</td>
	  <td>
	    <input type="hidden" name="action" value="login">
	    <input type="hidden" name="originalPage" value="<%= EmptyTextConverter.convert( originalPage ) %>">
	    <input type="submit" name="submit" value="login">
	  </td>
	</tr>

      <tr>
	<td colspan="2" align="center" nowrap>
	  
      
          If you forgot your username or password, 
          <input type="button" value="REQUEST YOUR LOGIN INFORMATION HERE" class="req" onClick="parent.location='/servlets/Community?action=remind<%= paramStr %>'">
      
      
	  <p>If your personal profile does not exist in our database, 
	    <input type="button" value="Register" onClick="parent.location='/servlets/Community?type=person&action=edit&new=true'"> as a new TAIR user.
	
    </td>
	
	
      </tr>

</table>

</form>
<script type="text/javascript" src="/js/cookieChecker.js"></script>
<script>checkCookie()</script>

<script type="text/javascript">
document.forms.loginfrm.user_name.focus();
</script>



<!--IE does not like this w the style sheets. I will fix this but for now I'm taking it out. 
<SCRIPT FOR=window EVENT=onload LANGUAGE="javascript">
  document.loginfrm.user_name.focus();
</SCRIPT>
-->
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
