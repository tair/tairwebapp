<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<%@ page import="org.tair.community.*, org.tair.querytools.*, org.tair.utilities.*,java.util.*"%>

<%!
String pageName = "Notepad Detail";
%>

<% 
NotepadDetail object = (NotepadDetail) request.getAttribute( "detail" ); 
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<table width="100%" cellspacing="0" cellpadding="2" border="0">
   <tr>
      <td colspan="2"><h1>User Comment</h1></td>
   </tr>
     
     <tr  <%= myBgColor.toggleBgColor() %> >  
      <th class="sm" align="left">Date entered</th>
      <td class="sm"><%= object.get_date_entered() %></td>
     </tr>

    <tr <%= myBgColor.toggleBgColor() %> >
      <th class="sm" align="left">Entered By</th>
      <td class="sm"> <A HREF="/servlets/Community?action=view&type=person&communityID=<%= object.get_community_id() %>"> <%=  object.get_person_name()  %></A></td>
    </tr>

    <tr <%= myBgColor.toggleBgColor() %> >
      <th class="sm" align="left">Annotated Data Object</th>
      <td class="sm"><a href="/servlets/TairObject?accession=<%= object.getAccession() %>"><%=  object.getAccession() %></a></td>
    </tr>

    <tr <%= myBgColor.toggleBgColor() %> >
      <th class="sm" align="left" valign=top>Comment </th>
      <td class="sm"><%=  object.get_comment()  %></td>
    </tr>
 

    <!-- if user is curator, show button to deactivate this comment -->
    <% if ( LoginChecker.isTairCurator( request ) ) { %>
     <form action="/servlets/processor" method="post">
     <input type="hidden" name="type" value="notepad">
     <input type="hidden" name="update_action" value="confirm_deactivate">
     <input type="hidden" name="notepad_id" value="<%= object.get_notepad_id() %>">
      
     <tr <%= myBgColor.toggleBgColor() %> >
      <td class="sm" colspan="2"><input type="submit" value="Deactivate"></td>
     </tr>
     </form>

   <% } %>




</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
