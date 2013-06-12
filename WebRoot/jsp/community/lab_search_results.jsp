<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%@ page import = "org.tair.community.*, org.tair.utilities.*, java.util.*, org.tair.bs.community.*" %>

<%!
String pageName = "PI Search Results";

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
// get results of search for PIs/labs for associating person profile to

SearchResultsCollection searchCollection = (SearchResultsCollection) request.getAttribute( "searchCollection" );
BsPerson[] searchResults = (BsPerson[] ) searchCollection.getResults();
int resultSize = searchCollection.getResultSize();
int floor = searchCollection.getFloor();
int ceiling = searchCollection.getCeiling();
String scrollLinks = searchCollection.getScrollLinks();

CommunityState state = SessionHandler.getCommunityState( request );
boolean first = state.getBooleanValue( "first_person" );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />


<font class="header">TAIR Lab Search Results</font>
<p>
<b>Summary:</b> <%= resultSize %> matches found. Displaying <%= floor %> - <%= ceiling %>.
<p>
To affiliate yourself with a lab CHECK the Affiliate box for the
entry corresponding to your lab and then click on the  MAKE AFFILIATIONS
button

<p>
<FORM action="/servlets/Community" method="post">

<TABLE border="0" cellspacing="0" cellpadding="3" width="100%">
	<tr>
          <td class="sm">&nbsp;</td>
	  <td class="sm" nowrap><font class="formheader">Name</font></td>
          <td class="sm" nowrap><font class="formheader">PI?</td>
	  <td class="sm" nowrap><font class="formheader">Lab</font></td>
	  <td class="sm" nowrap><font class="formheader">Country</font></td>
	  <td align="center" class="sm" nowrap><font class="formheader">Affiliate</font></td>
	  <td align="center" class="sm" nowrap><font class="formheader">Your Title</font></td>
	</tr>

     <% 
        for ( int i = 0; i < searchResults.length; i++ ) { 
           String bgColor = myBgColor.toggleBgColor();
     %>

       <tr <%= bgColor %> >
         <td class="sm" align="center"><%= floor++ %></td>
	 <td class="sm" nowrap><A href="/servlets/TairObject?type=person&id=<%= searchResults[ i ].getCommunityId() %>"><%= searchResults[ i ].getCommunity().getName() %></A></td>

     <%
           Iterator<BsAffiliation> labs = searchResults[ i ].getActiveLabs().iterator();
           if ( labs != null ) {
               boolean repeat = false;
               while ( labs.hasNext() ) {
                   BsAffiliation lab = labs.next();
                   boolean isPI = ( lab.getPi() != null && lab.getPi() );
                   String piText = ( isPI ) ? "PI" : "member";
      %>
          
      <% if ( repeat ) { %>
        <tr <%= bgColor %> >
          <td>&nbsp;</td>
          <td>&nbsp;</td>
      <% } %>

          <td class="sm"><%= piText %></td>
          <td class="sm" nowrap><%= lab.getOrganization().getName() %></td>
	  <td class="sm"><%= lab.getOrganization().getCommunity().getAddress() != null && lab.getOrganization().getCommunity().getAddress().getCountryObject() != null ? lab.getOrganization().getCommunity().getAddress().getCountryObject().getName() : null %></td>
	  <td align="center" class="sm"><% if ( isPI ) { %><INPUT type="checkbox" name="affiliateLab" value="<%= lab.getOrganization().getCommunityId() %>"><% } else { %>&nbsp;<% } %></td>
 	  <td align="center" class="sm"><% if ( isPI ) { %><%= createTitleSelect( "title_" + lab.getOrganizationId() ) %><% } else { %>&nbsp;<% } %></td>
       </tr>

                  <% repeat = true; %>
               <% }  %>
       <% } else { %>
             <td>&nbsp;</td>
             <td colspan="4" class="sm">No lab affiliation</td>
       <% } %>
     <% } %>


    <tr>
      <td colspan="7" align="center"><br><%= EmptyTextConverter.convert( scrollLinks ) %></td>
    </tr>

   <tr>
      <td colspan="7" align="center">&nbsp;</td>
    </tr>

      <tr>
	<td colspan="7" align="center">
          <input type="hidden" name="action" value="affiliate">
          <input type="hidden" name="aff_action" value="update">
	  <input type="submit" value="Make Affiliations">

          &nbsp;&nbsp;&nbsp;

          <% if ( first ) { %>
             <INPUT type="button" value="Search Again" onClick="document.location.href='/servlets/Community?action=redirect&req_page=personAff'">
              &nbsp;&nbsp;&nbsp;
             <INPUT type="button" value="Continue" onClick="document.location.href='/servlets/Community?action=redirect&req_page=personProfile'">

          <% } else { %>
             <INPUT type="button" value="Return to Profile" onClick="document.location.href='/servlets/Community?action=redirect&req_page=personProfile'">
          <% } %>
	</td>      
      </tr>

      <tr>
        <td colspan="7" align="center">
           <P>
            Don't see your PI? Ask your PI to fill out a registration form or 
             <A href="mailto:curator@acoma.stanford.edu">contact</A> the TAIR curators for further assistance.

           <p>
            If your PI is listed, but has no lab affiliation, please ask your PI 
            to update his/her personal data and add his/her lab entry.

        </td>
      </tr>
    </TABLE>
</FORM>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
