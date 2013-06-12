<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.community.*, org.tair.utilities.*" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "Order Cancelled";
String highlight = "1";
 %>

<%
String[] idArr = request.getParameterValues( "list_id" );
String idParam = ( idArr != null && idArr.length > 0 ) ? HTMLFactory.arrayToQueryString( idArr, "orders_id" ) : null;
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<table align="center">
      <tr>
	<td align="center">
	      <font class="mainheader">Order Cancelled</font>
        </td>
      </tr>
      
      <tr>
	<td>
	  Your order has been cancelled.  No stocks have been ordered from ABRC.
	  <p>
	    If you have cancelled by mistake, <a href="/servlets/Community">Place a new order</a>

	    <% if ( idParam != null ) { %>
	    <p>
	    <a href="/servlets/Order?state=search&mode=user&search_action=detail&<%= idParam %>">Return</a> to order details.
	    <% } %>

	   <% if ( LoginChecker.isTairCurator( request ) ) { %>
	  <p>
	    If you would like to place a new order for a user, <a href="/servlets/Order/proxy">Click here</a>
	    or go to your <a href="/servlets/Community?action=login">Personal Home</a> page
	    <% } %>
	    
	    
	</td>
      </tr>
</table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
