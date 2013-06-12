<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%@ page import="org.tair.utilities.*, org.tair.community.*, org.tair.bs.community.*" %>

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
// get results of duplicate search for PI/lab when person tries to
// add a new lab

SearchResultsCollection searchCollection = (SearchResultsCollection) request.getAttribute( "searchCollection" );
BsLab[] searchResults = (BsLab[] ) searchCollection.getResults();
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
	  Below is  a list of search results for your query. View a detail of a record by clicking the name. Affiliate yourself
	  to the lab by checking the box next to the lab and submitting.
	  
	  <P>
	    If none of these are your lab, add it by clicking "Add My Lab".
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
	  <td class="sm"><font class="formheader">PI</font></td>
	  <td class="sm"><font class="formheader">Lab</font></td>
	  <td class="sm"><font class="formheader">Country</font></td>
	  <td align="center" class="sm"><font class="formheader">Affiliate</font></td>
	  <td align="center" class="sm"><font class="formheader">Your Title</font></td>
	</tr>

        <% for ( int i = 0; i < searchResults.length; i++ ) { 
             BsOrganization organization = searchResults[ i ].getLabOrg();
             BsAddress address = organization != null ? organization.getCommunity().getAddress() : null;
             String pi = null;
             for (BsAffiliation affiliation : organization.getAffiliation()) {
               if (affiliation.getPi()) {
                 pi = affiliation.getPiName();
               }
             }
        %>
     
	      <tr <%= myBgColor.toggleBgColor() %>>
                <td align="center" class="sm"><%= floor++ %></td>
                <td class="sm"><%= pi %></td>
		<td class="sm"><a href="/servlets/Community?action=view&type=organization&communityID=<%= organization.getCommunityId() %>"><%= organization.getName() %></a></td>
		<td class="sm"><%= address != null && address.getCountryObject() != null ? EmptyTextConverter.convert( address.getCountryObject().getName() ) : "" %>&nbsp;</td>
                <td align="center" class="sm"><INPUT type="checkbox" name="affiliateLab" value="<%= organization.getCommunityId() %>"></td>
 	        <td align="center" class="sm"><%= createTitleSelect( "title_" + organization.getOrganizationId() ) %></td>
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
                  <input type="hidden" name="aff_action" value="update">
                  <input type="submit" value="Make Affiliations">
                   
                  &nbsp;&nbsp;&nbsp;
		  <input type="button" value="Add New Lab" onClick="document.location.href='/servlets/Community?searched=true&action=edit&type=organization&lab=true&new=true'">
		</td>
	      </tr>
	    </table>
</form>





<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
