<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, org.tair.community.*, org.tair.bs.community.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "Curator Functions";
String highlight = "2";
%>
  

<%
if ( !LoginChecker.isTairCurator( request ) ) {
      UnauthorizedRequestException ure = new UnauthorizedRequestException( "Not authorized to make this request" );
      request.setAttribute( "exception", ure );
      pageContext.forward( "/jsp/common/unauthorized_error.jsp" );
 }

BsPerson person = null;
try {
      person = (BsPerson)SessionHandler.getPerson( request );
} catch ( InvalidSessionException e ) {
      request.setAttribute( "exception", e );
      pageContext.forward( "/jsp/common/session_error.jsp" );
}

%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>


    <table align="center" width="500" cellpadding="3">

      <tr>
	<td><font class="header">Curator Information</font></td>
      </tr>
      
      <tr>
	<td><font class="formheader">Login Information</font></td>
      </tr>

    <form action="/servlets/Community" method="post">	
      <tr>
	<td>
	  UserName: <%= person.getCommunity().getUserName() %>
	  <br>
	  Password: <%= person.getCommunity().getPassword() %>
	  <br>
	  Email Address: <input type="text" name="email" size="30" maxlength="100" value="<%= EmptyTextConverter.convert( person.getCommunity().getEmail() ) %>">
	  <br>
	  <br>
	  <input type="hidden" name="action" value="curator">
	  <input type="hidden" name="curator_action" value="email">
	  <input type="submit" value="Send Login Reminder">
	</td>
      </tr>
    </form>


    <tr>
      <td>&nbsp;</td>
    </tr>

    <form action="/servlets/Community" method="post">	
      <tr>
	<td><font class="formheader">Status</font></td>
      </tr>

      <tr>
	<td>
	  <%= HTMLFactory.createStatusSelect( "status", person.getCommunity().getMemberStatus(), false ) %>
	  &nbsp;&nbsp;
	  <%= HTMLFactory.createCheckBox( "is_obsolete", "T", person.getCommunity().getObsolete() ) %> Is Obsolete?
	  &nbsp;
	  <%= HTMLFactory.createCheckBox( "is_user_focus", "T", person.getUserFocus() ) %> Is User Focus?
	  &nbsp;
	  <%= HTMLFactory.createCheckBox( "is_external_curator", "T", person.getExternalCurator() ) %> External Curator?
	  &nbsp;
	  <%= HTMLFactory.createCheckBox( "is_tair_curator", "T", person.getTairCurator() ) %> TAIR Curator?
	</td>
      </tr>
      <tr>
	<td nowrap>
	  <input type="hidden" name="action" value="curator">
	  <input type="hidden" name="curator_action" value="update">
	  <input type="submit" value="Submit"> 
	  <% if ( BsCommunity.Status.NEW.equals( person.getCommunity().getMemberStatus() ) ) { %>
	  &nbsp;&nbsp;
	  <input type="button" value="Delete" onClick="document.location.href='/servlets/Community?action=curator&curator_action=delete'">
          <% } %>
          &nbsp;-- <font class="req">NOTE:</font> Submitting here will update the database without further warning<br>
	</td>
      </tr>
    </form>
  </table>





<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
