<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page import = "org.tair.community.*, org.tair.utilities.*, java.util.*,org.tair.tfc.*,org.tair.querytools.*, org.tair.bs.community.*" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<%!
String pageName = "Community Detail"; 
%>


<% 
BsPerson person = (BsPerson) request.getAttribute( "detail" );
BsAddress address = person != null ? person.getCommunity().getAddress() : null;
if ( person == null ) {
      throw new InvalidParameterException( "Invalid request" );
}

Iterator parentOrgs = person.getCommunity().getAffiliation().iterator();
boolean affiliates = ( parentOrgs != null );

// format urls to display as link w/display name
String urls = HTMLFactory.urlsToHTML( person.getCommunity().getUrl() );
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />


<table align="center" width="550" border="0" cellspacing="0" cellpadding="3">

      <tr>
	<td colspan="2">    <b><font size="+1">TAIR Community Detail</font></b> [<a href="/help/helppages/commdet.jsp">Help</a>]<br>
<p>	    
        </td>
      </tr>

      <tr <%= myBgColor.toggleBgColor() %>>
	<td class="sm">Name</td>
	<td class="sm"><%= person.getCommunity().getName() + " " + EmptyTextConverter.convert( person.getSuffix() ) %></td>
      </tr>
      
      <% if ( person.getCommunity().getAuthorName() != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %>>
	<td class="sm">Author Name</td>
	<td class="sm"><%= person.getCommunity().getAuthorName() %></td>
      </tr>
      <% } %>

      <% if ( person.getCommunity().getAliases().size() > 0 ) { %>
      <tr <%=myBgColor.toggleBgColor()%> >
   	<td class="sm">Other Names</td>
	<td class="sm"><%= HTMLFactory.arrayToString( person.getCommunity().getAliasStringArray(), "; " ) %></td>
      </tr>
      <% } %>

      <tr <%= myBgColor.toggleBgColor() %>>
	<td class="sm">TAIR Accession</td>
	<td class="sm"><%= person.getCommunity().getAccession() %></td>
      </tr>

      <% if ( person.getCommunity().getOrganisms().size() > 0 ) { %>
      <tr <%= myBgColor.toggleBgColor() %>>
	<td class="sm">Organism(s) of Interest</td>
	<td class="sm"><%= HTMLFactory.arrayToString( person.getCommunity().getOrganismStringArray(), ", " ) %></td>
      </tr>
      <% } %>

      <% if ( person.getPrimaryJobTitle() != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %>>
	<td class="sm">Primary Job Title</td>
	<td class="sm"><%= person.getPrimaryJobTitle() %></td>
      </tr>
      <% } %>

      <% if ( person.getResearchInterest() != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %>>
	<td class="sm">Research Interest</td>
	<td class="sm"><%= person.getResearchInterest() %></td>
      </tr>
      <% } %>

      <% if ( person.getCommunity().getKeywords().size() > 0 ) { %>      
      <tr <%= myBgColor.toggleBgColor() %>>
	<td class="sm">Keywords</td>
	<td class="sm"><%= HTMLFactory.arrayToString( person.getCommunity().getKeywordStringArray(), ", " ) %></td>
      </tr>
      <% } %>

      <tr <%= myBgColor.toggleBgColor() %> valign="top">
	<td class="sm">Address</td>
	<td class="sm">
	  <%= address != null ? EmptyTextConverter.convert( TextConverter.dbToHTML( address.getAddress() ) ) : "" %><br>
	  <%= address != null ? EmptyTextConverter.convert( address.getCity() ) %> , <%= EmptyTextConverter.convert( address.getRegion() ) : "" %>
	  <%= address != null ? EmptyTextConverter.convert( address.getPostalCode() ) : "" %><br>
	  <%= address != null && address.getCountryObject() != null ? EmptyTextConverter.convert( address.getCountryObject().getName() ) : "" %>
           &nbsp;
	</td>
      </tr>

      <% if ( person.getCommunity().getEmail() != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %>>
	<td class="sm">E-mail </td>
	<td class="sm"><a href="mailto:<%= person.getCommunity().getEmail() %>"><%=person.getCommunity().getEmail() %></a></td>	
      <% } %>

      <% if ( urls != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %>>
	<td nowrap="nowrap">Websites</td>
	<td class="sm"><%= urls %></td>
      </tr>
      <% } %>

      <% if ( person.getCommunity().getPhone( "work" ) != null ) { %>
      <tr <%= myBgColor.toggleBgColor()%> >
	<td class="sm">Office Phone</td>
	<td class="sm"><%= person.getCommunity().getPhone( "work" ) %></td>
      </tr> 
      <% } %>


      <% if ( person.getCommunity().getPhone( "lab" ) != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %> >
	<td class="sm">Lab Phone</td>
	<td class="sm"><%= person.getCommunity().getPhone( "lab" ) %></td>
      </tr>
      <% } %>

      <% if ( person.getCommunity().getPhone( "mobile" ) != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %> >
	<td class="sm">Mobile Phone</td>
	<td class="sm"><%= person.getCommunity().getPhone( "mobile" ) %></td>
      </tr> 
      <% } %>

      <% if ( person.getCommunity().getPhone( "fax" ) != null ) { %>
      <tr <%= myBgColor.toggleBgColor()%> >
	<td class="sm">Fax</td>
	<td class="sm"><%= person.getCommunity().getPhone( "fax" ) %></td>
      </tr>
      <% } %>      


    <% if ( affiliates ) { %>
      <tr <%= myBgColor.toggleBgColor() %> valign="top">
	<td class="sm">Affiliations</td>
        <td>
	  <table>

	  <%
	      while ( parentOrgs.hasNext() ) {
	          BsAffiliation affiliation = (BsAffiliation) parentOrgs.next();
	          // Only active organizations
	          if (!affiliation.getOrganization().getCommunity().getObsolete()) {
	          String piStr = ( affiliation.getPi() != null && affiliation.getPi() ) ? "*" : "";
	  %>
             <tr>
	         <td class="sm">
                    <a href="/servlets/Community?type=organization&action=view&communityID=<%=affiliation.getOrganization().getCommunityId()%>"><%= piStr + affiliation.getOrganization().getName() %></a>
                 </td>
	         <td class="sm"><%= EmptyTextConverter.convert(  affiliation.getJobTitle()  ) %>&nbsp;</td>
	     </tr>
	
             <% }
              } %>

               <tr>
                  <td colspan="2" class="sm"><br>* denotes Primary Investigator for this organization</td>
               </tr>
	  </table>
	</td>
      </tr>

    <% } %>

   <!-- publication -->
   <% if ( person.getCommunity().getPublications().size() > 0 ) { %>  
       <tr <%= myBgColor.toggleBgColor() %> >
	   <th class="sm" valign="top" align="left">Publication</th>
	   
	   <td class="sm">
       	        <table>
	           <tr align="left">
	              <th class="sm">title</th>
	              <th class="sm" nowrap>&nbsp; &nbsp;</th>
	              <th class="sm">source</th>
	              <th class="sm" nowrap>&nbsp; &nbsp;</th>
	              <th class="sm">date</th>
	          </tr>

                  <%
                    for (BsCommunityPublication publication : person.getCommunity().getPublications()) {
                  %>

	          <tr>
	             <td class="sm"><a href=/servlets/TairObject?type=publication&id=<%= publication.getReferenceId() %>><%= EmptyTextConverter.convert( publication.getTitle() )%></a></td>
 	             <td class="sm" nowrap>&nbsp; &nbsp;</th>
                     <td class="sm"><%=EmptyTextConverter.convert( publication.getSource() )%></td>
 	             <td class="sm" nowrap>&nbsp; &nbsp;</th>
                    <td class="sm"><%=EmptyTextConverter.convert( publication.getPublicationYear() )%></td>
                 </tr>
                <% } %>
                </table>
	     </td>
      </tr>
   <% } %>
 

<% if ( person.getCommunity().getLastUpdated() != null ) { %>
     <tr <%= myBgColor.toggleBgColor() %> >
        <td class="sm">Record last updated</td>
        <td class="sm"><%= TextConverter.dateToString( person.getCommunity().getLastUpdated() ) %>
     </tr>
    <% } %>


    <% if ( LoginChecker.isTairCurator( request ) ) { %>
     <tr <%= myBgColor.toggleBgColor() %> >
        <td class="sm">Person ID</td>
        <td class="sm"><%= person.getPersonId() %></td>
     </tr>
     <tr <%= myBgColor.toggleBgColor() %> >
        <td class="sm">Community ID</td>
        <td class="sm"><%= person.getCommunityId() %></td>
     </tr>
    <% } %>



     <tr>
        <td colspan="2" class="sm">
          <br><br>
          If you find this information to be inaccurate, or wish to add other information, please 
           <a href="/servlets/Community?action=edit&type=person&communityID=<%=person.getCommunityId()%>"><font class="req">UPDATE YOUR RECORD HERE</font></a>
          <br><br>
           If you've forgotten your username or password 
	  <a href="/servlets/Community?action=remind&communityID=<%= person.getCommunityId() %>"><font class="req">REQUEST YOUR LOGIN INFORMATION HERE</font></a>
        </td>
     </tr>


</table>



<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

