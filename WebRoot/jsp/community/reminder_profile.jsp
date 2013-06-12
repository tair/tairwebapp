<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page import = "org.tair.community.*, org.tair.utilities.*, java.util.*, org.tair.bs.community.*" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<%!
String pageName = "Community Detail"; 
String highlight = "2";
%>

<% 
BsPerson person = (BsPerson) request.getAttribute( "person" );
BsAddress address = person != null ? person.getCommunity().getAddress() : null;
if ( person == null ) {
      throw new InvalidParameterException( "Invalid request" );
}

InvalidLoginException e = (InvalidLoginException) request.getAttribute( "exception" );
String errMsg = ( e != null ) ? e.getMessage() : null;

%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>
    <table align="center" width="550" border="0" cellspacing="0" cellpadding="3">
      <tr>
	<td colspan="2"><h1>TAIR Community Detail</h1></td>
      </tr>

    <% if ( errMsg != null ) {%>
    
      <tr>
        <td colspan="2"><font color="red"><%= errMsg %><br><br></font></td>
      </tr>
    
    <% } %>



    <tr>
      <td colspan="2">
	Below is your selected record along with a hint to remember your password, if you have entered one 
	on your profile.
	<p>If you remember your password, type it in below & submit to login.
	<p>
	  If you do not remember your password, click "Email Me Login Info." to have a reminder automatically sent to the
	  email address shown.  
	<p>If your email address is different from this address,
	  please <a href="mailto:<%= WebApp.getProperty( "CURATOR_EMAIL" ) %>">contact the curators</a> to 
          request your login information.
      </td>
    </tr>

      <tr>
        <td colspan="2">&nbsp;</font></td>
      </tr>

     <tr valign="top">
       <td>
         <table>
           <form action="/servlets/Community" method="post">
           <% if ( person.getCommunity().getPasswordHint() != null ) { %>
             <tr>
                <td><font class="formheader">Password Hint</font></td>
                <td><%= person.getCommunity().getPasswordHint() %>
             </tr>
           <% } %>

             <tr>
 	        <td><font class="formheader">UserName</font></td>
	        <td>
	            <%= person.getCommunity().getUserName() %>
	            <input type="hidden" name="user_name" value="<%= person.getCommunity().getUserName() %>">
            	</td>
            </tr>

            <tr>
 	       <td><font class="formheader">Password</font></td>
	       <td><input type="password" size="20" maxlength="10" name="password"></td>
           </tr>
        </table>      
      </td>
      <td>
         <table>
           <tr>
              <td><font class="formheader">Name</font></td>
              <td><%= person.getCommunity().getName() + " " + EmptyTextConverter.convert( person.getSuffix() ) %></td>
           </tr>

           <tr>
	      <td><font class="formheader">Email</font></td>
	      <td nowrap><%= person.getCommunity().getEmail() %></td>
           </tr>

          <tr valign="top">
              <td><font class="formheader">Address</font></td>
              <td>
            	<%= address != null ? EmptyTextConverter.convert( TextConverter.dbToHTML( address.getAddress() ) ) : "" %><br>
	        <%= address != null ? EmptyTextConverter.convert( address.getCity() ) : "" %> , <%= address != null ? EmptyTextConverter.convert( address.getRegion() ) : "" %>
	        <%= address != null ? EmptyTextConverter.convert( address.getPostalCode() ) : "" %><br>
	        <%= address != null && address.getCountryObject() != null ? EmptyTextConverter.convert( address.getCountryObject().getName() ) : "" %>
	        &nbsp;
              </td>
           </tr>
         </table>
      </td>
    </tr>

    <tr>
     <td>
	<input type="hidden" name="action" value="login">
        <input type="hidden" name="communityID" value="<%= person.getCommunityId() %>">
	<input type="hidden" name="login_page" value="remind">
	<input type="submit" name="submit" value="Login">
       </form>
      </td>
      <td>
         <form action="/servlets/Community" method="post">
         <input type="hidden" name="communityID" value="<%= person.getCommunityId() %>">
         <input type="hidden" name="action" value="remind">
         <input type="hidden" name="remind_action" value="mail">
         <input type="submit" value="Email Me Login Info.">
        </form>
	</td>
     </tr>
</table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

