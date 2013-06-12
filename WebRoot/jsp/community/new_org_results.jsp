<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>


<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%@ page import="org.tair.utilities.*, org.tair.community.*" %>

<%!
String pageName = "Duplicate Search Results";
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
// get results of duplicate search before adding new 
// non-lab organization

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
	  <font class="mainheader">Organization Search Results</font>
	</td>
      </tr>
      <tr>
	<td>
	  Below is  a list of search results for your query. View a detail of a record by clicking the name. Affiliate yourself
	  to the lab by checking the box next to the organization and submitting.
	  
	  <P>
	    If none of these are your organization, add it by clicking "Add Organization".
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
     <table border="0" cellspacing="0" cellpadding="2" width="100%">
	<tr>
          <td class="sm">&nbsp;</td>
	  <td class="sm"><font class="formheader">Name</font></td>
	  <td class="sm"><font class="formheader">Type</font></td>
	  <td class="sm"><font class="formheader">Country</font></td>
	  <td align="center" class="sm"><font class="formheader">Affiliate</font></td>
          <td align="center" class="sm"><font class="formheader">Your Title</font></td>
 	</tr>

       <% for ( int i = 0; i < searchResults.length; i++ ) { %>

         <tr <%= myBgColor.toggleBgColor() %> >
          <td class="sm"><%= floor++ %></td>
	  <td class="sm"><a href="/servlets/Community?action=view&type=organization&communityID=<%= searchResults[ i ].getCommunityID() %>"><%= searchResults[ i ].getDisplayName() %></a></td>
	  <td class="sm"><%= searchResults[ i ].getDisplayType() %></td>
	  <td class="sm"><%= EmptyTextConverter.convert( searchResults[ i ].getCountry() ) %>&nbsp;</td>
	  <td align="center" class="sm"><input type="checkbox" name="affiliateOrg" value="<%= searchResults[ i ].getCommunityID() %>"></td>
	  <td align="center" class="sm"><%= createTitleSelect( "title_" + searchResults[ i ].getSpecificID() ) %></td>
        </tr>

      <% } %>

        <tr>
           <td colspan="6" align="center" class="sm"><br><%= EmptyTextConverter.convert( scrollLinks ) %></td>
        </tr>

       <tr>
	   <td colspan="6">&nbsp;</td>
       </tr>

       <tr>
          <td colspan="6" align="center"  class="sm">

               <input type="hidden" name="action" value="affiliate">

               <!-- set type to person for correctly setting affiliation -->
               <input type="hidden" name="type" value="person">
               <input type="hidden" name="aff_action" value="add">
               <INPUT type="submit" value="Make Affiliations">
               &nbsp;&nbsp;&nbsp;
	       <input type="button" value="Add New Organization" onClick="document.location.href='/servlets/Community?searched=true&action=edit&type=organization'">

	 </td>
      </tr>
    </table>
</form>



<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
