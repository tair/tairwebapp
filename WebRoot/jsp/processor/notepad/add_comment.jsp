<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page 
errorPage="/jsp/common/gen_error.jsp"
%>

<%!
String pageName = "Add User Note";
String highlight = "1";
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

 <table width="100%" border="0" colspan="2" cellspacing="0" >
 <form name="add_comment" action="/servlets/processor" method="post"> 
  <input type="hidden" name="type" value="notepad">
  <input type="hidden" name="update_action" value="confirm">
  <input type="hidden" name="tair_object_id" value="<%= request.getParameter( "tair_object_id" ) %>">

 <tr>
    <td colspan="2"><h1>Add Comment:</h1></td>
 </tr>
<%--
  <tr <%=myBgColor.toggleBgColor()%> >
    <td>Comment Summary <BR>(maximum 255 characters)</TD>
      
    <TD>
      <TEXTAREA name="short_note" rows="3" cols="45" wrap="virtual"></TEXTAREA>
    </TD>       
 </tr>  
--%>
  <tr <%=myBgColor.toggleBgColor()%> >
    <td>Comment</TD>
      
    <TD>
      <TEXTAREA name="comment" rows="3" cols="45" wrap="virtual"></TEXTAREA>
    </TD>       
 </tr>  
   




  <tr <%=myBgColor.toggleBgColor()%> >
  <td>
   <INPUT TYPE="SUBMIT" VALUE="Submit Comment">
  </TD>
 
  <TD>    
   <INPUT TYPE="RESET">
  </TD> 
  </tr>  
</form>
 </table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
