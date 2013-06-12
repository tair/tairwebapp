<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
import = "org.tair.community.*, org.tair.utilities.*"
%>

<%!
String pageName = "Items Updated";
String highlight = "7";
%>

<%
// security
if ( !LoginChecker.isTairCurator( request ) ) {
      UnauthorizedRequestException uae = new UnauthorizedRequestException( "Not authorized for this resource" );
      request.setAttribute( "exception", uae );
      pageContext.forward( "/jsp/common/unauthorized_error.jsp" );
}

// get search params for returning to search results
String searchString = (String) request.getAttribute( "search_string" );
%>



<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>


<table align="center" cellpadding="3">
      <tr>
	<td align="center">
	  <font class="mainheader">Items Updated</font>
	</td>
      </tr>

      <tr>
	<td align="center">
	  <form>
	    <input type="button" value="Back to Search Results" onClick="document.location.href='/servlets/Order?<%= searchString %>'">
	    &nbsp;&nbsp;
	    <input type="button" value="Search Again" onClick="document.location.href='/servlets/Order?state=search&mode=curator'">
	  </form>
	</td>
      </tr>
</table>







<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
