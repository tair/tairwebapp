<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
import="org.tair.utilities.*, org.tair.abrc.stock.*, java.util.*"
%>

<%!
String pageName = "Stock Order HIstories";
String highlight = "7";
%>

<%
// get results of search
SearchResultsCollection searchCollection = (SearchResultsCollection) request.getAttribute( "searchCollection" );
if ( searchCollection == null || searchCollection.isEmpty() ) {
   throw new InvalidParameterException( "Invalid Request" );
}

ListOrder[] orders = (ListOrder[]) searchCollection.getResults();
int resultSize = searchCollection.getResultSize();
int floor = searchCollection.getFloor();
int ceiling = searchCollection.getCeiling();
String searchCriteria = searchCollection.getSearchCriteria();
String scrollLinks = searchCollection.getScrollLinks();
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<table align="center" cellpadding="3" cellspacing="2" border="0">
      <tr>
	<td align="center" class="sm" colspan="4">
	  <font class="mainheader">Stock Order Histories</font>
          </td>
        </tr>

        <tr>
	   <td class="sm" colspan="4">
            <p>
	    <%= searchCriteria %>
	    <p>
	    Displaying <%= floor %> - <%= ceiling %>.
	  </td>
	</tr>	

      <tr>
	<td class="sm" nowrap><font class="formheader">Order #</font></td>
	<td class="sm" nowrap><font class="formheader">Orderer</font></td>
	<td class="sm" nowrap><font class="formheader">Lab</font></td>
	<td class="sm" nowrap align="center"><font class="formheader">Order Date</font></td>
      </tr>

      <% for ( int i = 0; i < orders.length; i++ ) { %>
      <tr>
	<td class="sm"><%= orders[ i ].get_order_number() %></td>
	<td class="sm"><a href="/servlets/TairObject?type=person&id=<%= orders[ i ].get_person_community_id() %>"><%= orders[ i ].get_person_name() %></a></td>
	<td class="sm"><a href="/servlets/TairObject?type=organization&id=<%= orders[ i ].get_organization_community_id() %>"><%= orders[ i ].get_organization_name() %></a></td>
	<td class="sm" align="center"><%= TextConverter.dateToString( orders[ i ].get_order_date() ) %></td>
      </tr>
      <% } %>

      <%  if ( scrollLinks != null ) { %>

      <tr>
	<td class="sm" colspan="4">&nbsp;</td>
      </tr>

      <tr>
	<td colspan="4" align="center" class="sm"><%= scrollLinks %></td>
      </tr>
      <% } %>

      <tr>
	<td class="sm" colspan="4">&nbsp;</td>
      </tr>


      <tr>
	<td class="sm" colspan="4" align="center">
	<form action="/servlets/Order" method="post">
	  <input type="hidden" name="state" value="search">
	  <input type="hidden" name="mode" value="stock_number">
	  <input type="submit" value="Search Again">
	</form>
	</td>
      </tr>
</table>



<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
