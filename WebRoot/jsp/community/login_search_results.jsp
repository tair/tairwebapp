<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>


<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%@ page import="org.tair.utilities.*, org.tair.community.*" %>

<%!
String pageName = "Login Search Results";
%>


<% 
// get results of search
SearchResultsCollection searchCollection = (SearchResultsCollection) request.getAttribute( "searchCollection" );

ListCommunity[] searchResults = (ListCommunity[] ) searchCollection.getResults();
int resultSize = searchCollection.getResultSize();
int floor = searchCollection.getFloor();
int ceiling = searchCollection.getCeiling();
String scrollLinks = searchCollection.getScrollLinks();
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />


<table align="center" width="500">
      <tr>
	<td align="center">
	  <font class="mainheader">Community Search Results</font>
	</td>
      </tr>
      <tr>
	<td>
	  Below is  a list of search results for your query. View a detail of a record by clicking the name.
	  
	  <P>
	    If you see your record, select it and click "Request Login Information" to continue.
	</td>
      </tr>
      <tr>
	<td>&nbsp;</td>
      </tr>
      <tr>
	<td>
	  <b>Summary:</b> <%= resultSize %> matches found. Displaying <%= floor %> - <%= ceiling %>.
	</td>
      </tr>
</table>

<p>


    <form method="post" action="/servlets/Community" method="POST">
      <table  width="100%" align="center" cellspacing="0" cellpadding="2" border="0">
	      <tr>
	        <td>&nbsp;</td>
	        <td class="sm" align="center"><font class="formheader">Select</font></td>
		<td class="sm"><font class="formheader">Name</font></td>
		<td class="sm"><font class="formheader">Street Address</font></td>
		<td class="sm"><font class="formheader">Country</font></td>
	      </tr>

              <% 
                 for ( int i = 0; i < searchResults.length; i++ ) { 
                    String region = searchResults[ i ].getRegion();
                    String checked = ( searchResults.length == 1 ) ? "checked" : "";
                    if ( region != null && searchResults[ i ].getCountry() != null ) {
                       if ( searchResults[ i ].getCountry().equals( "USA" ) || searchResults[ i ].getCountry().equals( "Canada" ) ) {
                         region = ( DataConstants.getRegions().get( region ) != null ) ?  ", " + DataConstants.getRegions().get( region ) : "";
                       }
                    }
              %>

	      
	      <tr <%= myBgColor.toggleBgColor() %>>
                <td align="center" class="sm"><%= floor++ %></td>
                <td align="center" class="sm"><input type="radio" name="communityID" value="<%= searchResults[ i ].getCommunityID() %>" <%= checked %>></td>
		<td class="sm"><a href="/servlets/TairObject?type=person&id=<%= searchResults[ i ].getCommunityID() %>"><%= searchResults[ i ].getDisplayName() %></a></td>
                 <td class="sm">
                    <%= EmptyTextConverter.convert( TextConverter.dbToHTML( searchResults[ i ].getAddress() ) ) %><br>
                    <%= EmptyTextConverter.convert( searchResults[ i ].getCity() ) + EmptyTextConverter.convert( region ) + " " + EmptyTextConverter.convert( searchResults[ i ].getPostalCode() ) %>
                     &nbsp;
                </td>
		<td class="sm"><%= EmptyTextConverter.convert( searchResults[ i ].getCountry() ) %>&nbsp;</td>
	      </tr>	  
	    <% } %>



              <tr>
                 <td colspan="5" align="center" class="sm"><br><%= EmptyTextConverter.convert( scrollLinks ) %></td>
              </tr>

	      <tr>
		<td colspan="5">&nbsp;</td>
	      </tr>

	      <tr>
		<td colspan="5" align="center"  class="sm">
                  <input type="hidden" name="action" value="remind">
                  <input type="hidden" name="remind_action" value="view">
		  <input type="submit" value="Request Login Information">
                  &nbsp;&nbsp;&nbsp;
                  <input type="button" value="Add New Registration" onClick="document.location.href='/servlets/Community?action=edit&type=person&new=true&searched=true'">
		</td>
	      </tr>
	    </table>
</form>





<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
