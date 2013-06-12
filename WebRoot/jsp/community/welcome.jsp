<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>


<%@ page import="java.util.*, org.tair.community.*, org.tair.utilities.*, org.tair.processor.genesymbol.*, org.tair.bs.community.*" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "Welcome"; 
%>

<% 

java.math.BigInteger communityID = SessionHandler.getCommunityID( request );
PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
BsPerson person = delegate.getPersonByCommunityId(communityID);
Map<java.math.BigInteger, BsAffiliation> affiliatedOrgs = null;
if (person != null) {
  affiliatedOrgs = person.getActiveOrganizations();
}
boolean affiliates = ( affiliatedOrgs != null && !affiliatedOrgs.isEmpty() );
boolean curator = LoginChecker.isTairCurator( request );
BsAddress address = person != null ? person.getCommunity().getAddress() : null;
if (person != null){
    SessionHandler.setPerson(request, person);
}else{
    %>IS NULL!!!!<%
}
String userStr = SessionHandler.getPersonName( request );

Map newCommunities = null;
ListCommunity[] newOrgs = null;
ListCommunity[] newPersons = null;
if ( curator ) {
      newCommunities = (Map) request.getAttribute( "newCommunities" );
      if ( newCommunities != null && !newCommunities.isEmpty() ) {
          newOrgs = (ListCommunity[]) newCommunities.get( "newOrgs" );
          newPersons = (ListCommunity[]) newCommunities.get( "newPersons" );
      }
}

boolean organizations = ( newOrgs != null && newOrgs.length > 0 );
boolean persons = ( newPersons != null && newPersons.length > 0 );

// clean up community profile state tracking - should usually be
// done within profile pages, but it is possible that user got
// all the way here without state being cleaned up. Doing it again
// here ensures there will be no future problems
SessionHandler.removeCommunityState( request );

%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<table border="0" cellpadding="3" align="center" width="100%">
      <tr>
	<td colspan="2" align="center"><font class="header">Welcome, <%= userStr %></font></td>
      
      </tr>
    <% if (person != null ) { %>
     <tr> <td colspan="2" align="center">
     <% PersonInvoice personInvoice = new PersonInvoice(person);
     if (personInvoice.get_hasUnpaidInvoices() ) { %>
    <font color="darkred">You have unpaid ABRC invoices.</font>
        <a href="/servlets/Search?type=invoice&mode=user&search_action=user_person_search&person_id=<%=person.getPersonId()%>&user_invoice_status=unpaid"> Click here to view.</a>
        <br>
    <% } %>
        <%
            Iterator iter = personInvoice.get_unpaid_parent_orgs();
            while ( iter != null && iter.hasNext() ) {
                BsAffiliation affiliation = (BsAffiliation) iter.next();
        
                //only display if PI or contact person of the lab
                if ( (affiliation.getPi() != null && affiliation.getPi() == true) || 
                     (affiliation.getContactPerson() != null && affiliation.getContactPerson() == true)) {
        %>
        <br><font color="darkred">Your lab, <%=affiliation.getOrganization().getName()%>, has unpaid ABRC invoices.</font>
        <a href="/servlets/Search?type=invoice&mode=user&search_action=user_lab_search&user_invoice_status=unpaid&lab_id=<%=affiliation.getOrganizationId().toString()%>"> Click here to view.</a>
                <% } 
            } %>
        <br><br>
        </td>
      </tr>
      <% } %>
      <tr valign="top">

	<td class="sm">
	  <font class="header">Personal Data</font><br>
	  
      <!-- SHOW PERSONAL INFORMATION -->
      <% if (person != null){%>
        <%=person.getCommunity().getName()%><%= EmptyTextConverter.convert( person.getSuffix() ) %><br>  
        <%= address != null ? EmptyTextConverter.convert( TextConverter.dbToHTML( address.getAddress() ) ) : "" %><br> 
        <%= address != null ? EmptyTextConverter.convert( address.getCity() ) : "" %> 
        <% if ( address != null && address.getRegion() != null ) { %>, <%= address.getRegion() %><% } %>   
        &nbsp; <%= address != null ? EmptyTextConverter.convert( address.getPostalCode() ) : "" %><br> 
        <%= address != null && address.getCountryObject() != null ? EmptyTextConverter.convert( address.getCountryObject().getName() ) : "" %><br>  
      <% } %>
      
      <a href="/servlets/Community?action=edit&type=person&communityID=<%=communityID.toString()%>">Update</a> my personal profile & affiliations
	  <br>
	  <a href="/servlets/Community?action=edit&type=organization&new=true">Add New Organization</a>
	  <br>
	  <a href="/servlets/Community?action=edit&type=organization&lab=true&new=true">Add New Lab</a>
	  <br>
	  <a href="/servlets/Community?action=edit&type=person&communityID=<%= communityID.toString() %>#publication">Add Publications to My Profile</a>
	  <br>
	  <a href="/servlets/TairObject?type=person&id=<%=communityID.toString()%>">View</a> my personal profile page
	  <br><br>

	<% if ( affiliates ) { %>
	<table border="0" cellspacing="0" cellpadding="1">

           <tr>
	      <td class="sm" colspan="2"><font class="formheader">Affiliated Organizations</font> ( update if PI or contact person )</td>
           </tr>

    <%
         for (BsAffiliation affiliation : affiliatedOrgs.values()) {
            String statusStr = "";
            if (affiliation.getOrganization().getCommunity().getMemberStatus() != null && 
                BsCommunity.Status.NEW.equals(affiliation.getOrganization().getCommunity().getMemberStatus())) {
                statusStr = "&nbsp;<font color=\"red\">(new)</font>&nbsp;";
            }

            if ( ( affiliation.getPi() != null && affiliation.getPi() ) ||
                 ( affiliation.getContactPerson() != null && affiliation.getContactPerson() ) ) {
     %>

              <tr valign="bottom">
                 <td class="sm"><a href="/servlets/Community?action=edit&type=organization&communityID=<%= affiliation.getOrganization().getCommunityId().toString() %>"><%= affiliation.getOrganization().getName() %></a> <%= statusStr %></td>
              </tr>
         <% } else { %>

             <tr>
                 <td class="sm" colspan="2"><%= affiliation.getOrganization().getName() %> <%= statusStr %></td>
             </tr>
         <% } %>
    <%  } %>
         </table>
  <% } %>


      </td>

      <td class="sm">
         <table border="0" cellpadding="1" cellspacing="0">
            <tr>
	      <td class="sm"><font class="header">ABRC Stock Order Tools</font></td>
            </tr>

            <tr>
              <td class="sm">
                 <% if ( SessionHandler.orderInProgress( request ) ) { %>
                  <a href="/servlets/Order/current">View Current Order</a>
                 <% } else { %>
                 <a href="/servlets/Order/current">Create Stock Order</a>
                 
                 <% } %>
              </td>
           </tr> 

           <% if ( LoginChecker.isDonor( request ) ) { %>
           <tr>
             <td class="sm"><a href="/servlets/Order?state=search&mode=donor">Search Order History for Donated Stocks</a></td>
          </tr>
           <% } %>

           <% if ( LoginChecker.hasDonorLab( request ) ) { %>
            <tr>
              <td class="sm"><a href="/servlets/Order?state=search&mode=donor_lab">Search Order History for Stocks Donated by Lab</a></td>
           </tr>
           <% } %>

           <tr>
             <td class="sm">
                <% if ( LoginChecker.isPI( request ) ) { %>
                    <a href="/servlets/Order?state=search&mode=user">Search My Orders</a>
                <% } else { %>
                    <a href="/servlets/Order?state=search&mode=user">Search My Orders</a>
                <% } %>
             </td>
          </tr>
       
           <tr>
             <td class="sm">
                <% if ( LoginChecker.isPI( request ) || LoginChecker.isContactPerson(request)  ) { %>
                    <a href="/servlets/Search?type=invoice&mode=user&search_action=choose_search">Search My Invoices</a>
                <% } else { %>
                    <a href="/servlets/Search?type=invoice&mode=user&search_action=search">Search My Invoices</a>
                <% } %>
             </td>
          </tr>
           
           <tr>
             <td class="sm"><a href="/servlets/Search?type=dna&search_action=new_search">Search DNA Stocks</a></td>
          </tr>
     
          <tr>
             <td class="sm"><a href="/servlets/Search?type=germplasm&search_action=new_search">Search Seed Stocks</a></td>
         </tr>

         
	  
      <tr><td>&nbsp;</td></TR>
	  
      <tr>
	        <td class="sm" colspan="2"><font class="formheader">TAIR Tools</font></td>
      </tr> 
      <tr>
            <td class="sm"><a href="/servlets/processor?type=genesymbol">Submit New Gene Class Symbol</a></td>
      </tr>

	  <%
            int submitted = GeneClassSymbolCollection.numberSymbolsByUser(communityID.longValue());
	    if (submitted  >0 )  {
	  %>
	  <tr>  
	
             <td class="sm"> 
	       <a href="/servlets/processor?type=genesymbol&update_action=view_symbol&from=user">Complete List of Symbols Submitted (Total: <%= submitted %>)</a>
	     </td>
          </tr>
	<% } %>
	  
      <tr>
            <td class="sm"><a href="/doc/submit/functional_annotation/123">Online Submission for Authors and Others</a></td>
      </tr>
        </table>

       </td>
     </tr>

     <tr>
         <td class="sm" colspan="2">&nbsp;</td>
     </tr>

     <tr valign="top">
         <td class="sm">
             <table>
               <tr>
                  <td class="sm"><font class="header">Logout</font></td>
              </tr>
               <tr>
                  <td class="sm"><a href="/servlets/Community?action=logout">Logout</a></td>
              </tr>
               <tr>
               	<td>&nbsp;</td>
               </tr>
                            
      <% if ( curator && ( persons || organizations ) ) {  %>
	       <tr>
	         <td class="sm"><font class="header">New Registrations</font></td>
	       </tr>
              
            <% if (persons ) {  %>
            	<tr>
                	<td class="sm"><font class="formheader">Person Name</font></td>
            	</tr>

            <% for ( int i = 0; i < newPersons.length; i++ ) { 
                 if (newPersons[i] != null && newPersons[i].getCommunityID() != null && !(newPersons[ i ].getDisplayName().contains("Enter Last Name"))) {
            %> 
             	<tr valign="top">
                 	<td class="sm"><a href="/servlets/Community?type=person&action=edit&communityID=<%= newPersons[ i ].getCommunityID().toString()%>"><%= newPersons[ i ].getDisplayName() %></a></td>
             	</tr>
	  		<%   } //end if%>
	  		<% } //end for%>

               <tr>
                   <td class="sm">&nbsp;</td>
               </tr>
       		<% } //end if persons%>
              
           <% if ( organizations ) { %>
               <tr>
                  <td class="sm" colspan="2"><font class="formheader">Organization Name</font></td>
               </tr>
            <% for ( int i = 0; i < newOrgs.length; i++ ) { 
                 if (newOrgs[i] != null && newOrgs[i].getCommunityID() != null && newOrgs[i].getDisplayName() != null) {
            %>
               <tr>
                  <td class="sm">   
	               <a href="/servlets/Community?type=organization&action=edit&communityID=<%= newOrgs[ i ].getCommunityID().toString() %>"><%= newOrgs[ i ].getDisplayName() %></a>
                  </td>
              </tr>
           <% } // end if newOrgs %>
           <% } //end for%>
       	   <% } //end if organizations%> 
     <% } //end if curator,persons,organizations%>       
              
	</table>
         </td>

         <td class="sm">

         <% if ( curator ) { %> 
            <table>
              <tr>
                  <td class="sm"><font class="header">ABRC Curator Tools</font></td>
              </tr>
              

              <tr>
              <td class="sm"><a href="/servlets/Order/pending">Manage Pending Orders</a></td>
              </tr>
              <tr>
	          <td class="sm"><a href="/servlets/Order?state=search&mode=curator">Search Stock Orders</a></td>
              </tr>
              <tr>
              <td class="sm"><a href="/servlets/Search?type=invoice&search_action=new_search">Search Invoices</a></td>
         	  </tr>
         	  <tr>
              <td class="sm"><a href="/servlets/Search?type=payment&search_action=new_search">Search Payments</a></td>
         	  </tr>
       
              <tr>
	          <td class="sm"><a href="/servlets/Order/proxy">Create Stock Order for User</a></td>
              </tr>

              <tr>
	          <td class="sm"><a href="/servlets/Order?state=updateStock">Update Stock Record</a></td>
              </tr>

              <tr>
              <td class="sm"><a href="/jsp/abrc/image/image_upload.jsp">Load Image</a></td>
              </tr>
              
              <tr>
              <td class="sm"><a href="/jsp/abrc/image/image_link_edit.jsp">Link Image</a></td>
              </tr>

              <tr>
	          <td class="sm"><a href="/servlets/processor?type=country">Update Country Data</a></td>
              </tr>

              <tr>
	          <td class="sm"><a href="/servlets/Order?state=constant">Update ABRC Constants</a></td>
              </tr>

              <tr>
                <td class="sm">&nbsp;</td>
              </tr>
              
              <tr>
                  <td class="sm"><a href="/servlets/Search?type=community&action=new_search">Community Search</a></td>
              </tr>

              <tr>
                  <td class="sm"><a href="/servlets/Community?action=edit&type=person&new=true">Add New Person</a></td>
              </tr>

              <tr>
	          <td class="sm"><a href="/servlets/Community?action=edit&type=organization&&new=true">Add New Organization</a></td>
              </tr>
              
              <tr>
                <td class="sm">&nbsp;</td>
              </tr>

              <tr>
                  <td class="sm"><font class="header">TAIR Curator Tools</font></td>
              </tr>
              
              <tr>
              <td class="sm"><a href="/tairusage/index_curator.jsp">Detailed Web Statistics</a></td>
              </tr>
              
              
              <tr>
	          <td class="sm"><a href="/servlets/processor?type=definition">Add/Update Definitions</a></td>
              </tr>

              <tr>
	          <td class="sm"><a href="/servlets/processor?type=notepad&update_action=search">Deactivate Notepad Entry</a></td>
              </tr>

	    </table>
	 <%  } %>

	 <% if (curator ||  communityID.toString()==WebApp.getProperty("MUTANT_SYMBOL_CURATOR_ID")) {  %>
	    <table>
               <tr>
	          <td class="sm"><a href="/servlets/processor?type=genesymbol&update_action=view_symbol&from=curator&status=new">Review New Submitted Gene Class Symbols</a></td>
              </tr>
	      <tr>
	          <td class="sm"><a href="/servlets/processor?type=genesymbol&update_action=view_symbol&from=curator&status=all">Browse All Gene Class Symbols</a></td>
              </tr>
	     </table> 
         <% }  %>
	      
           </table>
          
          &nbsp;
         </td>
      </tr>





    

</table>



<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
