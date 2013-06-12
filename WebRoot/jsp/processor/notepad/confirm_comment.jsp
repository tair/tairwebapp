<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.querytools.*, org.tair.utilities.*"
%>

<%!
String pageName = "Repeat Comment";
String highlight = "1";
%>

<%
Notepad note = (Notepad) request.getAttribute( "note" );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

 <table width="100%" border="0" colspan="2" cellspacing="0" >

 <form action="/servlets/processor" method="post"> 
  <input type="hidden" name="type" value="notepad">
  <input type="hidden" name="update_action" value="store">

 <tr>
    <td colspan="2"><h1><font color=red>Attention</font></h1>
 
     The Comment <font color=red><%= note.get_comment() %></font> will be added to database, <BR>
     click "CONTINUE" to submit your comment, or go back if you want to modify.
     <BR><BR><BR>
   
    <INPUT TYPE="SUBMIT" VALUE="Continue">
    <INPUT TYPE="button" VALUE="Go Back" onClick = "javascript:history.back()">
    
  </TD>
 
  </tr>  
 </form>
 </table>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
