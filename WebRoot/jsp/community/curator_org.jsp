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

BsOrganization organization = null;
try {
      organization = SessionHandler.getOrganization( request );
} catch ( InvalidSessionException e ) {
      request.setAttribute( "exception", e );
      pageContext.forward( "/jsp/common/session_error.jsp" );
}

%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>


    <table align="center" cellpadding="3" width="500">
      <tr>
	<td><font class="header">Curator Information</font></td>
      </tr>

    <form action="/servlets/Community" method="post">	
      <tr>
	<td><font class="formheader">Status</font> &nbsp;<%= HTMLFactory.createStatusSelect( "status", organization.getCommunity().getMemberStatus(), false ) %></td>
	<td><font class="formheader">Seed Stock Center</font> &nbsp;<%= HTMLFactory.createStockCenterSelect( "seed_stock_center", organization.getSeedStockCenter(), true ) %></td>
      </tr>


      <tr>
	<td colspan="2">
	  <%= HTMLFactory.createCheckBox( "is_obsolete", "T", organization.getCommunity().getObsolete() ) %> is Obsolete?
	  &nbsp;
	  <%= HTMLFactory.createCheckBox( "NASC_fee_paid", "T", organization.getNascFeePaid() ) %> NASC fee paid?
	  &nbsp;
	  <%= HTMLFactory.createCheckBox( "ABRC_fees_waived", "T", organization.getAbrcFeesWaived() ) %> ABRC fees waived?
	  &nbsp;
	  <%= HTMLFactory.createCheckBox( "commercial", "T", organization.getCommercial() ) %> Commercial organization?
	</td>

      </tr>

      <tr>
	<td align="center" nowrap colspan="2">
          <input type="hidden" name="action" value="curator">
	  <input type="hidden" name="curator_action" value="update">
	  <input type="submit" value="Submit">
	  <% if ( BsCommunity.Status.NEW.equals( organization.getCommunity().getMemberStatus() ) ) { %>
	  &nbsp;&nbsp;
	  <input type="button" value="Delete" onClick="document.location.href='/servlets/Community?action=curator&curator_action=delete'">
          <% } %>
          -- 
	  <font class="req">NOTE:</font> Submitting here will update the database without further warning<br>
	</td>
      </tr>
    </form>
  </table>





<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
