<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2003 NCGR.  All rights 
  reserved.
-->

<%@ page 
import="org.tair.community.*, java.util.*, org.tair.bs.community.*"
errorPage="/jsp/common/gen_error.jsp" 
%>

<%!
String pageName = "User Orders Management System";
String highlight = "7";
%>

<% BsPerson person = (BsPerson) request.getAttribute( "person" ); %>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<table align="center" border="0" cellpadding="2" width="100%">

      <tr>
        <td align="center" nowrap><font class="mainheader">Search Stock Orders</font></td>
      </tr>

      <tr>
        <td class="sm">
          Please select whether you would like to search YOUR OWN stock orders, or stock
          orders placed by any member of the lab(s) you are PI for by clicking the appropriate
          link below
        </td>
      </tr>
      
      
      <!-- form params will only be submitted if selecting lab search - personal search will pass its
      own params in GET querystring of button -->
    <form action="/servlets/Order" method="get">
      <input type="hidden" name="mode" value="pi"> 
      <input type="hidden" name="state" value="search">



      <tr>
        <td class="sm">
          <table cellpadding="3" align="center">
            <tr>
              <td class="sm">&nbsp;</td>
              <td class="sm" nowrap>
                <% Iterator labIter = person.getActivePiLabs().iterator();
                   BsAffiliation lab = null;
                   String checked = "checked";
                   while ( labIter.hasNext() ) {
                        lab = (BsAffiliation) labIter.next();
                        if ( labIter.hasNext() ) {
                             checked = "";
                        }
                %>
                     <input type="radio" name="communityID" value="<%= lab.getOrganization().getCommunityId() %>" <%= checked %>>
                     &nbsp;&nbsp;
                     <%= lab.getOrganization().getName() %><br>
                <% } %>

               </td>
            </tr>


            <tr>
              <!-- pass pi_user_confirm flag to confirm that pi wants own orders & avoid coming back here -->
              <td><input type="button" value="View My Orders" onClick="document.location.href='/servlets/Order?state=search&mode=user&pi_user_confirm=true'"></td>     
              <td nowrap><input type="submit" value="View Lab Orders"> (select above)</td>
            </tr>
           </table>
         </td>
       </tr>
     </form>
     </td>
    </tr>
   </table>
  



<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
