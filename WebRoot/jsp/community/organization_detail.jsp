<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page import = "java.util.*, org.tair.community.*, org.tair.utilities.*, org.tair.bs.community.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>  

<%!
String pageName = "Community Detail"; 
String helpfile = "/help/helppages/commdet.jsp";
%>

<%
BsOrganization organization = (BsOrganization) request.getAttribute( "detail" );
if ( organization == null ) {
      throw new InvalidParameterException( "Request does not contain an organization" );
}
BsAddress address = organization.getCommunity().getAddress();

Collection<BsAffiliation> activeAffiliations = organization.getAffiliation();
%>



<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="helpfile" value="<%= helpfile %>" />
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
	<td class="sm"><%= organization.getName() %></td>
      </tr>

      <% if ( organization.getCommunity().getAliases().size() > 0 ) { %>
      <tr <%= myBgColor.toggleBgColor() %> >
	<td class="sm">Other Names</td>
	<td class="sm"><%= HTMLFactory.arrayToString( organization.getAliasStringArray(), "; " ) %></td>
      </tr> 
      <% } %>

      <tr <%= myBgColor.toggleBgColor() %>>
	<td class="sm">TAIR Accession</td>
	<td class="sm"><%= organization.getCommunity().getAccession() %></td>
      </tr>


      <tr <%= myBgColor.toggleBgColor() %>>
	<td class="sm">Organization Type</td>
	<td class="sm"><%= organization.getOrganizationType() %></td>
     </tr>

      <% if ( organization.getDescription() != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %>>
	<td class="sm">Description</td>
	<td class="sm"><%= organization.getDescription() %></td>
      </tr>
      <% } %>

      <% if ( organization.getCommunity().getKeywords().size() > 0 ) { %>
      <tr <%= myBgColor.toggleBgColor() %>>
	<td class="sm">Keywords</td>
	<td class="sm"><%= HTMLFactory.arrayToString( organization.getKeywordStringArray(), ", " ) %></td>
      </tr>
      <% } %>

      <tr <%= myBgColor.toggleBgColor() %> valign="top">
	<td class="sm">Address</td>
	<td class="sm">
	  <%= address != null ? EmptyTextConverter.convert( TextConverter.dbToHTML( address.getAddress() ) ) : "" %><br>
	  <%= address != null ? EmptyTextConverter.convert( address.getCity() ) : "" %> , <%= address != null ? EmptyTextConverter.convert( address.getRegion() ) : "" %>
	  <%= address != null ? EmptyTextConverter.convert( address.getPostalCode() ) : "" %><br>
	  <%= address != null && address.getCountryObject() != null ? EmptyTextConverter.convert( address.getCountryObject().getName() ) : "" %>
           &nbsp;
	</td>
      </tr>

      <% if ( organization.getCommunity().getEmail() != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %>>
	<td class="sm">E-mail </td>
	<td class="sm"><a href="mailto:<%= organization.getCommunity().getEmail() %>"><%=organization.getCommunity().getEmail() %></a></td>	
      <% } %>

      

      <!-- format urls to display as link w/display name -->
      <% String urls = HTMLFactory.urlsToHTML( organization.getCommunity().getUrl() ); %>

      <% if ( urls!= null ) { %>
      <tr <%= myBgColor.toggleBgColor() %>>
	<td nowrap class="sm">Websites</td>
	<td class="sm"><%= urls %></td>
      </tr>
      <% } %>

      <% if ( organization.getCommunity().getPhone( "work" ) != null ) { %>
      <tr <%= myBgColor.toggleBgColor()%> >
	<td class="sm">Main Phone</td>
	<td class="sm"><%= organization.getCommunity().getPhone( "work" ) %></td>
      </tr> 
      <% } %>

      <% if ( organization.getCommunity().getPhone( "fax" ) != null ) { %>
      <tr <%= myBgColor.toggleBgColor()%> >
	<td class="sm">Fax</td>
	<td class="sm"><%= organization.getCommunity().getPhone( "fax" ) %></td>
      </tr>
      <% } %>


     <% if ( activeAffiliations.size() > 0 ) { %>
      
     <tr <%= myBgColor.toggleBgColor() %> valign="top">
       <td class="sm">Affiliations</td>
       <td>
            <table>

          <% for (BsAffiliation affiliation : activeAffiliations) {
                  String piStr = "";
                  if ( ( affiliation.getPi() ) ) {
                     piStr = "*";
                  } %>

               <tr>
	          <td class="sm"><a href="/servlets/Community?type=person&action=view&communityID=<%=affiliation.getCommunityId()%>"><%= piStr + affiliation.getMember().getName() %></a></td>
                  <td class="sm"><%= EmptyTextConverter.convert( affiliation.getJobTitle() ) %>
	       </tr>
	 
	     <% } %>

               <tr>
                  <td colspan="2" class="sm"><br>* denotes Primary Investigator for this organization</td>
               </tr>
          </table>
       </td>
     </tr>
  
   <% } %>

    <% if ( organization.getCommunity().getLastUpdated() != null ) { %>
     <tr <%= myBgColor.toggleBgColor() %> >
        <td class="sm">Record last updated</td>
        <td class="sm"><%= TextConverter.dateToString( organization.getCommunity().getLastUpdated() ) %>
     </tr>
    <% } %>

    <% if ( LoginChecker.isTairCurator( request ) ) { %>
     <tr <%= myBgColor.toggleBgColor() %> >
        <td class="sm">Organization ID</td>
        <td class="sm"><%= organization.getOrganizationId() %></td>
     </tr>
     <tr <%= myBgColor.toggleBgColor() %> >
        <td class="sm">Community ID</td>
        <td class="sm"><%= organization.getCommunityId() %></td>
     </tr>

     <% if ( organization.getSeedStockCenter() != null ) { %>
     <tr <%= myBgColor.toggleBgColor() %> >
        <td class="sm">Seed Stock Center</td>
        <td class="sm"><%= organization.getSeedStockCenter() %></td>
     </tr>
     <% } %>

    <% } %>


     <% if ( LoginChecker.isLoggedIn( request ) ) { %>
         <% if ( LoginChecker.isTairCurator( request ) || organization.hasPiAffiliate( SessionHandler.getCommunityID( request ) ) ) { %>
         <tr <%= myBgColor.toggleBgColor() %>>
            <td class="sm">Order History</td>
            <td class="sm"><a href="/servlets/Order?state=search&mode=pi&communityID=<%= organization.getCommunityId() %>">View History</a>
         </tr>
        <% } %>
     <% } %>


     <tr>
        <td colspan="2" class="sm">
          <br><br>If you find this information to be inaccurate, or wish to add other
                  information, please 
        <a href="/servlets/Community?action=edit&type=organization&communityID=<%=organization.getCommunityId()%>"><font class="req">UPDATE YOUR RECORD HERE</a></a>
        </td>
     </tr>


</table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
