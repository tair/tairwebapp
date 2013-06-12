<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
import="org.tair.community.*, org.tair.bs.community.*"
%>

<%!
String pageName = "Community Deactivated";
String highlight = "1";
%>

<%
BsCommunity community = (BsCommunity) request.getAttribute( "community" );
String communityID = community.getCommunityId().toString();
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<table align="center" cellpadding="2">
      <tr>
	<td align="center"><font class="mainheader">Community Record Deactivated</font></td>
      </tr>
	  
      <tr>
	<td align="center">Community ID# <%= communityID %> (<%= community.getName() %>)</td>
      </tr>

      <tr>
	<td class="sm">
	  The community record above has been deactivated.  If you would like to update any
	  attributions associated with the community record to use a new community id, enter
	  the community id below. To continue without updating, click "Submit" without entering
	  a new community id.
	</td>
      </tr>
      
      <tr>
	<td class="sm" align="center">
	  <form action="/servlets/Community" method="post">
	    <input type="hidden" name="action" value="curator">
	    <input type="hidden" name="curator_action" value="deactivate">
	    <input type="hidden" name="community_id" value="<%= communityID %>">

	    <table cellpadding="2">
	      <tr>
		<td class="sm"><font class="formheader">Community ID:</font></td>
		<td class="sm"><input type="text" size="10" maxlength="10" name="new_community_id"></td>
	      </tr>
	      
	      <tr>
		<td class="sm">&nbsp;</td>
		<td class="sm"><input type="submit" value="Submit"></td>
	      </tr>
	    </table>
	  </form>
	</td>
      </tr>

</table>	


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
