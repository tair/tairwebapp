<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>


<%@ page import="org.tair.utilities.*, org.tair.community.*, java.util.*" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "Community Search Results";
String titleSelect = createTitles();

private String createTitles( ) {
      StringBuffer buffer = new StringBuffer();
      String[] titles = DataConstants.getAffiliationTitles();
      buffer.append( "<option value=\"\">Select One</option>" );
      for ( int i = 0; i < titles.length; i++ ) {
         buffer.append( "<option value=\"" + titles[ i ] + "\">" + titles[ i ] + "</option>" );
      }
     buffer.append( "</select>" );
     return buffer.toString();
}

private String createTitleSelect( String fieldName ) {
      StringBuffer buffer = new StringBuffer();
      buffer.append( "<select name=\"" + fieldName + "\">" );
      buffer.append( titleSelect );
      return buffer.toString();
}
%>

<% 

// get results of search for organizations for another
// organization to affiliate itself to

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


<h1>TAIR Affiliation Search Results</h1>
<p>
<b>Summary:</b> <%= resultSize %> matches found. Displaying <%= floor %> - <%= ceiling %>.
<p>
To affiliate yourself with an organization CHECK the Affiliate box for the
entry corresponding to your organization and then click on the  MAKE AFFILIATIONS
button


<form action="/servlets/Community" method="post">

<table border="0" cellspacing="0" cellpadding="1" width="100%">
	<tr>
          <td class="sm">&nbsp;</td>
	  <td class="sm">Name</td>
	  <td class="sm">Type</td>
	  <td class="sm">Country</td>
	  <td align="center" class="sm">Affiliate</td>
 	</tr>
      
      <% for ( int i = 0; i < searchResults.length; i++ ) {  %>

     <tr <%= myBgColor.toggleBgColor() %> >
        <td class="sm"><%= floor++ %></td>
	<td class="sm"><a href="/servlets/Community?action=view&type=organization&communityID=<%= searchResults[ i ].getCommunityID() %>"><%= searchResults[ i ].getDisplayName() %></a></td>
	<td class="sm"><%= searchResults[ i ].getDisplayType() %></td>
	<td class="sm"><%= EmptyTextConverter.convert( searchResults[ i ].getCountry() ) %>&nbsp;</td>
	<td align="center" class="sm"><input type="checkbox" name="affiliateOrg" value="<%= searchResults[ i ].getCommunityID() %>"></td>
      </tr>

      <% } %>

    <tr>
      <td colspan="5" align="center"><br><%= EmptyTextConverter.convert( scrollLinks ) %></td>
    </tr>

      <tr>
	<td colspan="5" align="center">
	  <input type="hidden" name="aff_action" value="add">
	  <input type="hidden" name="action" value="affiliate">
	  <input type="submit" name="submit" value="Make Affiliations">
          &nbsp;&nbsp;&nbsp;

          <input type="button" value="Return to Profile" onClick="document.location.href='/servlets/Community?action=redirect&req_page=orgProfile'">
	</td>      
      </tr>
    </table>
</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
