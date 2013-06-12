<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.community.*, org.tair.utilities.*, java.util.*, org.tair.bs.community.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<%!
String pageName = "Community Update";
String highlight = "2";
%>

<%

// person should only get here if they are pi for a lab 
ArrayList<BsOrganization> labs = (ArrayList<BsOrganization>) request.getAttribute( "labs" );
if ( labs == null ) {
      throw new InvalidActionException( "Invalid Request" );
}

%>





<table align="center" width="100%">
      <tr>
	<td align="center"><font class="mainheader">Address Updated</font></td>
      </tr>
      <tr>
	<td>
	  Your street address, email address or work phone number, has changed. 
	  Following are labs you are PI for. If you would
	  like to automatically update the information of the labs to match your new personal 
	  information, check the relevant box(es) next to each lab's name and submit. 
	  
	  <p>
	   Click "Continue" to exit leaving the lab's information untouched.
	 </td>
      </tr>

      <tr>
	<td align="center">

	  <form action="/servlets/Community" method="post">
            <input type="hidden" name="action" value="address">


	  <table cellpadding="3">
	    <tr valign="bottom">
	      <td class="sm" align="center"><font class="formheader">Update<br>Phone</font></td>
	      <td class="sm" align="center"><font class="formheader">Update<br>Email</font></td>
	      <td class="sm" align="center"><font class="formheader">Update<br>Address</font></td>
	      <td class="sm" align="center"><font class="formheader">Lab Name</font></td>
	      <td class="sm" align="center"><font class="formheader">Current Information</font></td>
	    </tr>

	  <% for (BsOrganization lab : labs) { 
	  	    BsCommunity community = lab.getCommunity();
	  	    BsAddress address = community != null ? community.getAddress() : null;
	        String regionStr = ( address != null && address.getRegion() != null ) ? ", " + address.getRegion() : "";
	  %>

	    <tr valign="top">
	      <td class="sm" align="center"><input type="checkbox" name="phone" value="<%= lab.getCommunityId() %>"></td>
	      <td class="sm" align="center"><input type="checkbox" name="email" value="<%= lab.getCommunityId() %>"></td>
	      <td class="sm" align="center"><input type="checkbox" name="address" value="<%= lab.getCommunityId() %>"></td>
	      <td class="sm"><%= lab.getName() %></td>
	      <td class="sm">
	          <%= address != null ? TextConverter.dbToHTML( address.getAddress() ) : "" %>
	          <br>
	          <%= address != null ? EmptyTextConverter.convert( address.getCity() ) + regionStr + " " + EmptyTextConverter.convert( address.getPostalCode() ) : "" %>
	          <br>
	          <%= address != null && address.getCountryObject() != null ? EmptyTextConverter.convert( address.getCountryObject().getName() ) : "" %>
	          <br>
	          <%= EmptyTextConverter.convert( community.getPhone( "work" ) ) %>
	          <br>
	          <%= EmptyTextConverter.convert( community.getEmail() ) %>
    	      </td>

	    </tr>
          <% } %>

            <tr>
              <td colspan="5" align="center">
	         <input type="submit" value="Submit">
	         &nbsp;&nbsp;&nbsp;
	         <input type="button" value="Continue" onClick="document.location.href='/jsp/community/person_committed.jsp'">
  
              </td>
            </tr>

          </table>
        </form>
     </td>
    </tr>
</table>




<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
