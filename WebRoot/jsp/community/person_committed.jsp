<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>


<%@ page import="org.tair.utilities.*" %>
<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
import="org.tair.community.*"
%>

<%! 
String pageName = "Changes Committed";
String highlight = "1";
 %>

<%
CommunityState state = SessionHandler.getCommunityState( request );

boolean newRecord = state.getBooleanValue( "new_person" );
boolean order = SessionHandler.getContinueOrder(request);
SessionHandler.setContinueOrder(request, false);

// Clean up community state object now that person
// profile maintenance is completed.  Since this page will
// always be the end of any state-dependent community maintenance,
// can completely remove state object from session
SessionHandler.removeCommunityState( request );

%>  

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>
<table align="center" width="550">

    <% if ( newRecord ) { %>
       <tr>
	 <td align="center">
	    <font class="mainheader">Your registration is being processed by a
	   curator.  You CANNOT log in or order stocks yet.</font>
  	 </td>
       </tr>

       <tr>
	 <td>
	   <p>

	  Thank you for registering with TAIR.  During the workweek,
	  it usually takes less than 24 hours to process your registration, after
	  which you should be able to order stocks.  You will be notified by email
	  as soon as this information is loaded into the database.
	  If it has been more than 24 hours please contact a curator. You will be
	  able to place a stock order with ABRC and see your information in TAIR
	  only after your registration has been activated.

	 <p>
	  Please remember that you must be affiliated with a lab to order stocks.

	 <p>
	  Thank you for your patience.

        </td>
     </tr>

     <tr>
        <td>
	   <form>	    
               <input type="button" value="Back to Home Page" onClick="document.location.href='/index.jsp'">
           </form>
        </td>
    </tr>

  <% } else { %> 

       <tr>
	 <td align="center"><font class="mainheader">Changes Committed to Database</font></td>
       </tr>

       <tr>
	<td align="center">
	  <p>
	    Your information has been recorded. 
	 </td>
       </tr>

       <tr>
	 <td align="center" nowrap>
	   <p>
	   <form>	    
              <% if ( order ) { %>
                 <input type="button" value="Continue with Order" onClick="document.location.href='/servlets/Order/current'">
	      <% } else { %>
                 <input type="button" value="Back to Personal Home Page" onClick="document.location.href='/servlets/Community?action=login'">
	      <% } %>
          </form>

        </td>
      </tr>


  <% } %> 

 </table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
