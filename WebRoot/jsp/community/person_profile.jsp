<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>


<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<%@ page import="java.util.*, org.tair.utilities.*, org.tair.community.*, org.tair.tfc.*, org.tair.querytools.*, org.tair.bs.community.*" %>

<%!
String pageName = "Community Profile";
%>
  
<%
BsPerson person = null;
BsAddress address = null;
try {
      person = SessionHandler.getPerson( request );
      if (person != null) {
        address = person.getCommunity().getAddress();
        if (address == null) {
          throw new InvalidSessionException("Null address for person " + person.getLastName());
        }
      } else {
        throw new InvalidSessionException("No person selected");
      }
} catch ( InvalidSessionException e ) {
      request.setAttribute( "exception", e );
      pageContext.forward( "/jsp/common/session_error.jsp" );
}

BsCommunity community = null;

try {
  community = person.getCommunity();
  if (community == null) {
    throw new InvalidSessionException("No community for person " + person.getPersonId());
  }
} catch ( InvalidSessionException e ) {
      request.setAttribute( "exception", e );
      pageContext.forward( "/jsp/common/session_error.jsp" );
}

Iterator<BsAffiliation> parentOrgs = null;
Collection<BsAffiliation> affiliations = person.getCommunity().getAffiliation();
boolean affiliates = false;
if (affiliations != null && affiliations.size() > 0) {
  parentOrgs = person.getCommunity().getAffiliation().iterator();
  affiliates = true;
}
int orgWidth = ( affiliates ) ? 500 : 300;

Iterator<BsAffiliation> labs = person.getAllLabs().iterator();
boolean hasLabs = person.getAllLabs().size() > 0;
int labWidth = ( hasLabs ) ? 500 : 350;

CommunityState state = SessionHandler.getCommunityState( request );
boolean newPerson = state.getBooleanValue( "new" );

// Upon reaching profile page, user has gone through entire
// registration sequence for a new record, so reset "first_person"
// state param to avoid confusion from here on
state.removeStateValue( "first_person" );

String urls = HTMLFactory.urlsToHTML( person.getCommunity().getUrl() );
String regionStr = ( address != null && address.getRegion() != null ) ? ", " + address.getRegion() : "";
%>



<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>


    <table align="center"  cellpadding="2" cellspacing="0" width="602" border="0">

      <tr>
       <form action="/servlets/Community" method="post">
           <input type="hidden" name="action" value="commit">

	<td align="center">
	  <p>
	    Below is your personal profile information.  Make changes to different parts of your profile by
	    clicking the buttons.  Once you have made changes, review them here and then click "Commit Changes"
	    to save your information.

            <table>
                <tr>
                   <td>
                     <ul>
                        <li><a href="#contact_info">Update your address and contact information</a></li>
                        <li><a href="#lab">Add or remove affiliations to a lab</a></li>
                        <li><a href="#other_org">Add or remove affiliations to another organization</a></li>
                        <li><a href="#publication">Add or remove publications</a></li>
                     </ul>
                   </td>
            </table>

	  <br>
            <input type="submit" value="Commit Changes">

            <% if ( LoginChecker.isTairCurator( request ) ) { %>
               &nbsp;&nbsp;&nbsp;
               <input type="button" value="Curator Functions" onClick="document.location.href='/servlets/Community?action=redirect&req_page=curatorPerson'">
            <% } %>
        </td>
       </form>
     </tr>



      <tr bgcolor="#AAAAAA">

	<td><font class="lightheader"><a name="contact_info">Personal Information</a></font></td>
      </tr>
      
      <TR valign="top" bgcolor="<%= DataConstants.BGCOLOR %>">
	<TD>	  

	  <table cellpadding="2" cellspacing="0">
	    <tr valign="top">
	      <td>
		<table width="300">
		  <tr>
		    <td><font class="profileheader">Name:</font></td>
		    <td><%= person.getFirstName() + " " + person.getLastName() %></td>
		  </tr>


		  <tr valign="top">
		    <td nowrap><font class="profileheader">Other Names:</font></td>
		    <td><%= EmptyTextConverter.convert( HTMLFactory.arrayToString( person.getCommunity().getAliasStringArray(), ", " ) ) %></td>
		  </tr>

		  <tr>
		    <td><font class="profileheader">Birth date:</font></td>
		    <td><%= EmptyTextConverter.convert( TextConverter.dateToString( person.getBirthdate() ) ) %></td>
		  </tr>

		  <tr>
		    <td><font class="profileheader">Primary Job Title:</font></td>
		    <td><%= EmptyTextConverter.convert( person.getPrimaryJobTitle() )%></td>
		  </tr>

		  <tr>
		    <td><font class="profileheader">Username:</font></td>
		    <td><%= person.getCommunity().getUserName() %></td>
		  </tr>

		  <tr>
		    <td><font class="profileheader">Password:</font></td>
		    <td><%= person.getCommunity().getPassword().trim() %></td>
		  </tr>

		  <tr>
		    <td><font class="profileheader">Password Hint:</font></td>
		    <td><%= EmptyTextConverter.convert( person.getCommunity().getPasswordHint() ) %></td>
		  </tr>
		</table>
	      </td>

	      <td>
		<table width="300">
		  <tr valign="top">
		    <td><font class="profileheader">Address:</font></td>
		    <td nowrap>
		      <%= address != null ? EmptyTextConverter.convert( TextConverter.dbToHTML( address.getAddress() ) ) : "" %><br>
		      <%= address != null ? EmptyTextConverter.convert( address.getCity() ) + regionStr + " " + address.getPostalCode() : "" %><br>
		      <%= address != null && address.getCountryObject() != null ? address.getCountryObject().getName() : "" %>
		    </td>
		  </tr>

		  <tr>
		    <td><font class="profileheader">E-mail:</font></td>
		    <td><%= EmptyTextConverter.convert( person.getCommunity().getEmail() ) %></td>
		  </tr>
                  <tr>
		    <td><font class="profileheader">Email me monthly TAIR release notes:</font></td>
		    <td><%= TextConverter.booleanToWord( person.getSendMail() ) %></td>
		  </tr>

		  <tr>
		    <td>
		      <table width="100%" cellpadding="0" border="0" cellspacing="0">
			<tr>
			  <td><font class="profileheader">Office:</font></td>		  
			  <td nowrap>&nbsp;<%= EmptyTextConverter.convert( person.getCommunity().getPhone( "work" ) ) %></td>
                        </tr>
                        <tr>
			  <td><font class="profileheader">Lab:</font></td>
			  <td nowrap>&nbsp;<%= EmptyTextConverter.convert( person.getCommunity().getPhone( "lab" ) ) %></td>
			</tr>
                       </table>
                    </td>
                    <td>
                      <table width="100%" cellpadding="0" border="0" cellspacing="0">
			<tr>
			  <td><font class="profileheader">Mobile:</font></td>
			  <td nowrap>&nbsp;<%= EmptyTextConverter.convert( person.getCommunity().getPhone( "mobile" ) ) %></td>
                        </tr>
                        <tr>
			  <td><font class="profileheader">Fax:</font></td>
			  <td nowrap>&nbsp;<%= EmptyTextConverter.convert( person.getCommunity().getPhone( "fax" ) ) %></td>
			</tr>
		      </table>
		    </td>
		  </tr>

		  <tr>
		    <td><font class="profileheader">Website(s):</font></td>
		    <td><%= EmptyTextConverter.convert( urls ) %></td>
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
	    <table>
	      <tr>
	        <td align="center">
                   <input type="hidden" name="action" value="redirect">
                   <input type="hidden" name="req_page" value="editPerson">
                   <input type="submit" value="Update Profile">
                 </td>
	      </tr>
	      <tr>
		<td align="center">Update your address & contact information.</td>
	      </tr>
	    </table>
          </form>
	</td>
      </tr>
       
      <tr>
         <td>&nbsp;</td>
      </tr>      


      <TR bgcolor="#AAAAAA">
	<TD><font class="lightheader"><a name="lab">Lab Affiliations/ABRC Billing Information</a></FONT></TD>
      </TR>

      <tr bgcolor="<%= DataConstants.BGCOLOR %>">
	<td align="center">
	  NOTE: You <font class="req">MUST</font> be associated with a lab to place 
	  stock orders with ABRC.<br>
	  Any charges incurred by ordering will be sent to 
	  the Primary Investigator (PI) of your lab.
	</td>
      </tr>      
      
      <tr valign="top" bgcolor="<%= DataConstants.BGCOLOR %>">
	<td align="center">
         <% if ( hasLabs ) { %>	  

	  <table cellspacing="0" border="0" cellpadding="3" width="400">
	    <tr>
	      <td><font class="profileheader">PI</font></td>
	      <td><font class="profileheader">Lab</font></td>
	      <td><font class="profileheader">My Title</font></td>
	    </tr>

            <%
                while ( labs.hasNext() ) {
                     BsAffiliation lab = labs.next();
                     if (!lab.isDeleted()) {
                         boolean isPI = ( lab.getPi() != null && lab.getPi() );
                         String piName =  ( isPI ) ? "self" : EmptyTextConverter.convert( lab.getPiName() );
            %>

	    <tr>
	      <td><%= piName %> </td>
              <td><%= lab.getOrganization().getName() %></td>
	      <td><%= EmptyTextConverter.convert( lab.getJobTitle() ) %></td>
	    </tr>

                 <%  } %>
            <%  } %>
	  </table>
         <% } %>
          &nbsp;
	</td>
      </tr>
     
     <tr bgcolor="<%= DataConstants.BGCOLOR %>">
     <td align="center">
     <table cellspacing="0" border="0" cellpadding="3" width="400">
     <% if ( hasLabs ) { %> 
         <TR>  	<td>  <form action="/servlets/Community" method="post">
		
                    <input type="hidden" name="action" value="redirect">
                    <input type="hidden" name="req_page" value="labAffiliate">
                    <input type="submit" value="Update/Delete">
                </td> </form>
                <TD>Update your title with a lab, or remove the lab from your profile</TD>      
               
         </TR>
       <% } %>

         


       <TR>  
            <TD>  
                <form action="/servlets/Community" method="post">	
                   <input type="hidden" name="action" value="edit">
                   <input type="hidden" name="type" value="organization">
                   <input type="hidden" name="new" value="true">
                   <input type="hidden" name="lab" value="true">
                   <input type="submit" value="Add My Lab">
                </form>	
            </td>
            <TD>Add a lab for which you are the PI</TD>
            
      </TR>
   
      <TR>
       <form action="/servlets/Community" method="post">
      <TD nowrap>	     
                  <input type="hidden" name="action" value="search">
                  <input type="hidden" name="path" value="pi">
                  <input type="hidden" name="last_name_method" value="<%= DataConstants.SEARCH_CONTAINS %>">
   		  <input type="submit" value="Search and Add Me to a Lab"> &nbsp;&nbsp;
       </TD><TD>
		  <input type="text" name="last_name" size="15" maxlength="30" value="">
       </td></form>
       </TR>      
  
        <TR>
        <TD  colspan=2 align="center">Associate yourself to labs that you are a MEMBER of by entering your PI's last name </TD>
       </TR>
      
  </table></TD></TR>
      <tr>
         <td>&nbsp;</td>
      </tr>
            

      <tr bgcolor="#AAAAAA">
	<td><font class="lightheader"><a name="other_org">Other Organization Affiliations</a></font></td>
      </tr>
      
      <tr bgcolor="<%= DataConstants.BGCOLOR %>">
	<td align="center">

            <% if ( affiliates ) { %>
 	       <table cellspacing="0" border="0" cellpadding="3" width="400">
	           <tr>
	              <td><font class="profileheader">Organization</font></td>
    	              <td><font class="profileheader">My Title</font></td>
	           </tr>

            <%
                  while ( parentOrgs.hasNext() ) {
                       BsAffiliation aff = (BsAffiliation) parentOrgs.next();
                       if (!aff.isDeleted() && !BsOrganization.Type.LAB.equals(aff.getOrganization().getOrganizationType())) {
            %>   

 	          <tr>
	             <td><%= aff.getOrganization().getName() %></td>
	             <td><%= EmptyTextConverter.convert( aff.getJobTitle() ) %></td>
	         </tr>

                <%    }  %>
            <%    }  %>

   	  </table> 
         <% } %>
          &nbsp;
	</td>
      </tr>
      
      <tr bgcolor="<%= DataConstants.BGCOLOR %>">
	<td align="center">
	    <table cellspacing="0" border="0" cellpadding="4" width="<%= orgWidth %>">
               <% if ( affiliates ) { %>
	      <tr>

               <form action="/servlets/Community" method="POST">
		<td>
                   <input type="hidden" name="action" value="redirect">
                   <input type="hidden" name="req_page" value="personAffiliate">
                   <input type="submit" value="Update/Delete">
                </td>
               </form>
               <TD>Update your title with an affiliation, or to remove the affiliation from your profile           
               </TD></TR>
               <% } %>


           <TR>
  <form action="/servlets/Community" method="POST">
		<td nowrap>
                  <input type="hidden" name="action" value="search">
                  <input type="hidden" name="path" value="person_org">
                  <input type="hidden" name="name_method" value="<%= DataConstants.SEARCH_CONTAINS %>">
		  <input type="submit" value="Search and Add Me to an Organization">
		  &nbsp;&nbsp;</TD><TD>
		  <input type="text" name="name" size="15" maxlength="100" value="">
		</td>
                </form></TR>
          <TR><TD colspan=2>Associate yourself with other organizations (institutes, stock centers etc.)
		  in the TAIR database by entering the organization's name above.
          </TD></TR>
	    </table>
	</td>
      </tr>


      <tr>
         <td>&nbsp;</td>
      </tr>      


      <tr bgcolor="#AAAAAA">
	<td><font class="lightheader"><a name="publication">Associated Publications</a></font></td>
      </tr>

      <% if ( person.getCommunity().getPublications().size() > 0 ) { %>

       <tr bgcolor="<%= DataConstants.BGCOLOR %>">
          <td align="center">
             <table cellspacing="0" border="0" cellpadding="3" width="400">
	        <tr>
	           <td><font class="profileheader">Publication Title</font></td>
    	           <td><font class="profileheader">Source</font></td>
    	           <td><font class="profileheader">Year</font></td>
	        </tr>

            <%
                  for (BsCommunityPublication pub : person.getCommunity().getPublications()) {
            %>   

 	          <tr valign="top">
  	             <td><a href="/servlets/TairObject?type=publication&id=<%= pub.getReferenceId() %>" target=_blank><%= pub.getTitle() %></a></td>
 	             <td><%= pub.getSource() %></td>
	             <td><%= EmptyTextConverter.convert( pub.getPublicationYear() ) %></td>
	         </tr>

            <%    }  %>

   	  </table> 
	</td>
      </tr>
     <% } %>

      <tr bgcolor="<%= DataConstants.BGCOLOR %>">
       <td align="center">
          <table cellspacing="0" border="0" cellpadding="3" width="400">
             <% if ( person.getCommunity().getPublications().size() > 0 ) { %> 
                <tr>
  	           <td>
                     <form>
                     <input type="button" value="Delete" onClick="document.location.href='/jsp/community/update_person_publications.jsp'">
                   </td> </form>
                   <td>Remove a publication from your profile</td>      
                 </tr>
             <% } %>
   
          
                <!--  
                   Use Search servlet for finding publications. Flag "community" mode to Search
                   servlet so we can return here after associating publications.
                -->

                <tr>
                    <form action="/servlets/Search" method="post">
                       <input type="hidden" name="type" value="publication"> 
                       <input type="hidden" name="search_action" value="search"> 
                       <input type="hidden" name="mode" value="community">

                       <!-- search fields needed for "contains" author search published since 1988 -->
                       <input type="hidden" name="type1" value="author">
                       <input type="hidden" name="method1" value="<%= DataConstants.SEARCH_CONTAINS %>">
                       <input type="hidden" name="from" value="1988">
                    <td>	     
   		       <input type="submit" value="Search and Associate Me to a Publication">
                    </td>

                    <td>	     
   		       <input type="text" name="term1" size="25" maxlength="62" value="<%= person.getLastName() %>">
                    </td>

                  </form>
               </tr>      

               <tr>      
                  <td colspan="2">
                     Associate yourself with publications in the TAIR database
                     by entering your last name above
                  </td>
               </tr>

           </table>
        </td>
      </tr>

      <tr>
         <td>&nbsp;</td>
      </tr>      

      <TR bgcolor="#AAAAAA">
	<TD><font class="lightheader">Professional Information</FONT></TD>
      </TR>

       <tr bgcolor="<%= DataConstants.BGCOLOR %>">
	 <td colspan="2">
	   <table>
		<tr valign="top">
		  <td nowrap><font class="profileheader">Research Interest:</font></td>
		  <td><%= EmptyTextConverter.convert( person.getResearchInterest() ) %></td>
		</tr>
		<tr valign="top">
		  <td nowrap><font class="profileheader">Organism(s) of Interest:</font></td>
		  <td><%= EmptyTextConverter.convert( HTMLFactory.arrayToString( person.getCommunity().getOrganismStringArray(), ", " ) ) %></td>
		</tr>
		<tr valign="top">
		  <td nowrap><font class="profileheader">Keywords:</font></td>
		  <td><%= EmptyTextConverter.convert( HTMLFactory.arrayToString( person.getCommunity().getKeywordStringArray(), ", " ) ) %></td>
		</tr>
	    </table>
	  </td>
	</tr>

    <tr>
       <td align="center">
         <form action="/servlets/Community" method="post">
            <input type="hidden" name="action" value="commit">
            <input type="submit" value="Commit Changes">
            &nbsp;&nbsp;&nbsp;
            <% if ( LoginChecker.isTairCurator( request ) ) { %>
            <input type="button" value="Curator Functions" onClick="document.location.href='/servlets/Community?action=redirect&req_page=curatorPerson'">
            <% } %>
         </form>
       </td>
    </tr> 
  </TABLE>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
