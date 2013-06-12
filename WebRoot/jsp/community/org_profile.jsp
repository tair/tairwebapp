<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<%@ page import="java.util.*, org.tair.utilities.*, org.tair.community.*, org.tair.bs.community.*" %>

<%!
String pageName = "Organization Profile";
String highlight = "1";
%>
  
<%
BsOrganization organization = null;
try {
      organization = SessionHandler.getOrganization( request );
} catch ( InvalidSessionException e ) {
      request.setAttribute( "exception", e );
      pageContext.forward( "/jsp/common/session_error.jsp" );
}

// set HTML table widths according to absence or presence of affiliation data
int orgWidth = 300;
int personWidth = ( organization.getAffiliation().size() > 0 ) ? 500 : 250;

// get community state data
CommunityState state = SessionHandler.getCommunityState( request );
boolean newOrganization = state.getBooleanValue( "new_org" );

// Upon reaching profile page, user has gone through entire
// registration sequence for a new record, so reset "first_org"
// state param to avoid confusion from here on
state.removeStateValue( "first_org" );

// define which page to use for profile maintenance - labs get specific page
String reqPage = ( BsOrganization.Type.LAB.equals( organization.getOrganizationType() ) ) ? "editLab" : "editOrg";
BsAddress address = organization != null ? organization.getCommunity().getAddress() : null;
String regionStr = ( address != null && address.getRegion() != null ) ? ", " + address.getRegion() : "";
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

    <table align="center"  cellpadding="2" cellspacing="0" width="100%" border="0">

    <tr>
    <form action="/servlets/Community" method="post">
       <td align="center">
	  <p>
	    Below is your organization's profile.  Make changes to different parts of the profile by
	    clicking the buttons.  Once you have made changes, review them here and then click "Commit Changes"
	    to save your information.
	  <br>

            <input type="hidden" name="action" value="commit">
            <input type="submit" value="Commit Changes">
             &nbsp;&nbsp;&nbsp;
            <% if ( LoginChecker.isTairCurator( request ) ) { %>
              <input type="button" value="Curator Functions" onClick="document.location.href='/servlets/Community?action=redirect&req_page=curatorOrg'">
            <% } %>
    
       </td>
     </form>
    </tr> 

      <tr bgcolor="#AAAAAA">
	<td><font class="lightheader">Organization Information</font></td>
      </tr>
      
      <TR valign="top" bgcolor="<%= DataConstants.BGCOLOR %>">
	<TD>	  
	  <table cellpadding="2" cellspacing="0">
	    <tr valign="top">
	      <td>
		<table width="300">
		  <tr>
		    <td><font class="profileheader">Name:</font></td>
		    <td><%= organization.getName() %></td>
		  </tr>

		  <tr valign="top">
		    <td nowrap><font class="profileheader">Other Names:</font></td>
		    <td><%= EmptyTextConverter.convert( HTMLFactory.arrayToString( organization.getAliasStringArray(), ", " ) ) %></td>
		  </tr>

		  <tr>
	             <td><font class="profileheader">Organization Type:</font></td>		  
	             <td><%= EmptyTextConverter.convert( organization.getOrganizationType() ) %></td>
                  </tr>

		  <tr>
	             <td><font class="profileheader">Commercial Organization?</font></td>		  
	             <td><%= TextConverter.booleanToWord( organization.getCommercial() ) %></td>
                  </tr>

		  <tr valign="top">
		     <td nowrap><font class="profileheader">Keywords:</font></td>
		     <td><%= EmptyTextConverter.convert( HTMLFactory.arrayToString( organization.getKeywordStringArray(), ", " ) ) %></td>
		</tr>

                  <tr valign="top">
		     <td nowrap><font class="profileheader">Description:</font></td>
		     <td><%= EmptyTextConverter.convert( organization.getDescription() ) %></td>
		  </tr>

              </table>
	     </td>

             <td>
		<table width="300">
		  <tr valign="top">
		    <td><font class="profileheader">Address:</font></td>
		    <td nowrap>
		      <%= address != null ? EmptyTextConverter.convert(TextConverter.dbToHTML(address.getAddress())) : "" %><br>
		      <%= address != null ? EmptyTextConverter.convert(address.getCity() + regionStr + " " + address.getPostalCode()) : "" %><br>
		      <%= address != null && address.getCountryObject() != null ? address.getCountryObject().getName() : "" %>
		    </td>
		  </tr>

		  <tr>
		    <td><font class="profileheader">E-mail:</font></td>
		    <td><%= EmptyTextConverter.convert( organization.getCommunity().getEmail() ) %></td>
		  </tr>

	          <tr>
   	            <td><font class="profileheader">Website(s):</font></td>
                    <td><%= EmptyTextConverter.convert( HTMLFactory.urlsToHTML( organization.getCommunity().getUrl() ) ) %></td>
                  </tr>

		  <tr>
	             <td><font class="profileheader">Main Phone:</font></td>		  
	             <td><%= EmptyTextConverter.convert( organization.getCommunity().getPhone( "work" ) ) %></td>
                  </tr>

                  <tr>
	             <td><font class="profileheader">Fax:</font></td>
	             <td><%= EmptyTextConverter.convert( organization.getCommunity().getPhone( "fax" ) ) %></td>
		  </tr>

                </table>
              </td>
            </tr>
           </table>
	</td>
      </tr>
      
      <tr bgcolor="<%= DataConstants.BGCOLOR %>">
	<td align="center">
           <form action="/servlets/Community" method="POST">
	    <table border="0" cellpadding="2">
	      <tr>
		<td align="center">
                   <input type="hidden" name="action" value="redirect">
                   <input type="hidden" name="req_page" value="<%= reqPage %>">
                   <input type="submit" value="Update Profile">
                 </td>
	      </tr>
	      <tr>
		<td align="center">Update address & contact information.</td>
	      </tr>
	    </table>
          </form>
	</td>
      </tr>
       
      <TR>
	<TD>&nbsp;</TD>
      </TR>

      <TR bgcolor="#AAAAAA">
	<TD><font class="lightheader">Affiliated Persons</FONT></TD>
      </TR>

      <tr valign="top" bgcolor="<%= DataConstants.BGCOLOR %>">
	<td align="center">
         <% if ( organization.getAffiliation().size() > 0 ) { %>	  

	  <table cellspacing="0" border="0" cellpadding="3" width="400">
	    <tr>
	      <td><font class="profileheader">Name</font></td>
	      <td><font class="profileheader">Title w/Organization</font></td>
	    </tr>

            <%
                for (BsAffiliation affiliation : organization.getAffiliation()) {
                     String piStr = ( affiliation.getPi() != null && affiliation.getPi() ) ? "<font color=red >PI </font>" : ""; 
                     String cStr = ( affiliation.getContactPerson() != null && affiliation.getContactPerson() ) ? "<font color=red >C </font>" : "";
            %>

	    <tr>
	      <td><%= piStr %><%= cStr %><%= EmptyTextConverter.convert( affiliation.getMember().getName() ) %></td>
	      <td><%= EmptyTextConverter.convert( affiliation.getJobTitle() ) %></td>
	    </tr>

           <%  } %>

      	    <tr>
	      <td colspan="2"><br><font color="red">PI </font> denotes Primary Investigator for this organization</td>
	    </tr>

            <tr>
	      <td colspan="2"><br><font color="red">C </font> denotes Contact Person for this organization</td>
	    </tr>
	  </table>

         <% } %>
          &nbsp;
	</td>
      </tr>

      
      <tr bgcolor="<%= DataConstants.BGCOLOR %>">
	<td align="center">
	    <table cellspacing="0" border="0" cellpadding="4" width="<%= personWidth %>">
	   <tr>
              <% if ( organization.getAffiliation().size() > 0 ) { %>   

          <form action="/servlets/Community" method="post">
        	<td>
   
                    <input type="hidden" name="action" value="redirect">
                    <input type="hidden" name="type" value="organization">
                    <input type="hidden" name="req_page" value="memberAffiliate">
                    <input type="submit" value="Update/Delete">

                </td>
                </form>
               <TD>Update a person's title with this organization, or remove the person from this organization
               </TD></TR>
           <%} %>

         <TR>
           <form action="/servlets/Community" method="post">
	    <td>
                  <input type="hidden" name="action" value="search">
                  <input type="hidden" name="path" value="member">
                  <input type="hidden" name="last_name_method" value="<%= DataConstants.SEARCH_CONTAINS %>"> 
  		  <input type="submit" value="Search and Add Members"> &nbsp;&nbsp;
            </TD>
            <TD>
		  <input type="text" name="last_name" size="15" maxlength="30" value="">

	    </td>
           </form>
         </TR>

             <TR>
             <TD colspan=2>To associate PEOPLE from TAIR's Community to this organization, enter the person's last name in the box above and click on search
             </TD>
         </TR>
      </table>
   </td>
   </tr>
 
    <tr>
      <td>&nbsp;</td>
    </tr>
      
      <TR>
	<TD>&nbsp;</TD>
      </TR>

    <tr>
       <td align="center">
         <form action="/servlets/Community" method="post">
            <input type="hidden" name="action" value="commit">
            <input type="submit" value="Commit Changes">

             &nbsp;&nbsp;&nbsp;
            <% if ( LoginChecker.isTairCurator( request ) ) { %>
              <input type="button" value="Curator Functions" onClick="document.location.href='/servlets/Community?action=redirect&req_page=curatorOrg'">
            <% } %>
         </form>
       </td>
    </tr> 
  </TABLE>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
