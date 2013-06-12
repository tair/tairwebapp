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

// get results of search for members of organization or lab

SearchResultsCollection searchCollection = (SearchResultsCollection) request.getAttribute( "searchCollection" );

ListCommunity[] searchResults = (ListCommunity[] ) searchCollection.getResults();
int resultSize = searchCollection.getResultSize();
int floor = searchCollection.getFloor();
int ceiling = searchCollection.getCeiling();
String scrollLinks = searchCollection.getScrollLinks();

// determine if this is org's first time through registration process
// for redirection w/the "search again" button
CommunityState state = SessionHandler.getCommunityState( request );
boolean first = state.getBooleanValue( "first_org" );

boolean curator = ( LoginChecker.isTairCurator( request ) );

%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />


<script language="javascript">
<!--

// ensure affiliate checkbox is checked if pi or contact person checked
function checkAffiliate( box ) {
     var id = box.value;

     // if affiliate checkbox is an array, meaning many rows of results,
     // iterate through collection of affiliate checkboxes to find matching value
     // else, treat as single element

     if ( document.resultsForm.affiliatePerson.length > 1 ) {
       for ( i = 0; i < document.resultsForm.affiliatePerson.length; i++ ) {
          if ( document.resultsForm.affiliatePerson[ i ].value == id ) {
              document.resultsForm.affiliatePerson[ i ].checked = true;
          }
       }
     } else {
       document.resultsForm.affiliatePerson.checked = true;
     }

}



// -->
</script>




<h1>TAIR Affiliation Search Results</h1>
<p>
<b>Summary:</b> <%= resultSize %> matches found. Displaying <%= floor %> - <%= ceiling %>.
</p>

<form action="/servlets/Community" method="post" name="resultsForm">

<table border="0" cellspacing="0" cellpadding="1" width="100%">
	<tr>
          <td class="sm">&nbsp;</td>
	  <td class="sm">Name</td>
	  <td class="sm">Country</td>
	  <td align="center" class="sm">Affiliate</td>
          <td align="center" class="sm">Is Contact Person</td>

          <% if ( curator ) { %>
            <td align="center" class="sm">Is PI</td>
	    <td align="center" class="sm">Title</td>      
          <% } else { %>
            <td colspan="2" align="center" class="sm">Title</td>      
          <% } %>
	</tr>
      
      <% for ( int i = 0; i < searchResults.length; i++ ) {
            java.math.BigInteger id = searchResults[ i ].getCommunityID();
      %>
          
      <tr <%= myBgColor.toggleBgColor() %> >
        <td class="sm"><%= floor++ %></td>
	<td class="sm"><a href="/servlets/Community?action=view&type=person&communityID=<%= id %>"><%= searchResults[ i ].getDisplayName() %></a></td>
	<td class="sm"><%= EmptyTextConverter.convert( searchResults[ i ].getCountry() ) %>&nbsp;</td>
	<td align="center" class="sm"><input type="checkbox" name="affiliatePerson" value="<%= id %>"></td>
        <td align="center" class="sm"><input type="checkbox" name="contact" value="<%= id %>" onClick="checkAffiliate( this )"></td>

        <% if ( curator ) { %>
           <td align="center" class="sm"><input type="checkbox" name="pi" value="<%= id %>" onClick="checkAffiliate( this )"></td>
	   <td align="center" class="sm"><%= createTitleSelect( "title_" + id )%></td>
        <% } else { %>
	   <td colspan="2" align="center" class="sm"><%= createTitleSelect( "title_" + id )%></td>
        <% } %>

      </tr>

      <% } %>

    <tr>
      <td colspan="7" align="center"><br><%= EmptyTextConverter.convert( scrollLinks ) %></td>
    </tr>

      <tr>
	<td colspan="7" align="center">
	  <input type="hidden" name="aff_action" value="add">
	  <input type="hidden" name="action" value="affiliate">
   	  <input type="submit" name="submit" value="Make Affiliations">
          &nbsp;&nbsp;&nbsp;

          <% if ( first ) { %>
            <input type="button" value="Search Again" onClick="document.location.href='/servlets/Community?action=redirect&req_page=memberSearch'">
            &nbsp;&nbsp;&nbsp;
            <input type="button" value="Continue" onClick="document.location.href='/servlets/Community?action=redirect&req_page=orgProfile'">

          <% } else { %>
            <input type="button" value="Return to Profile" onClick="document.location.href='/servlets/Community?action=redirect&req_page=orgProfile'">
          <% } %>
	</td>      
      </tr>
    </table>
</form>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
