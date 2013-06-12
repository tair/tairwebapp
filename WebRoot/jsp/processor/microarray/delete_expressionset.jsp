<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="javax.sql.*, java.sql.*, org.tair.querytools.*, org.tair.tfc.*, org.tair.utilities.*, java.util.*" %> 
<%! String pageName = "Microarray Experiment";
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<h5><table width="100%">
  
<% HashMap expressionsets = new HashMap() ;
   if (request.getAttribute("expressionSets") != null ){
      expressionsets = (HashMap)request.getAttribute("expressionSets");
   }
   if (expressionsets!= null &&  (!expressionsets.isEmpty()) ){
     for (Iterator iter =  expressionsets.entrySet().iterator(); iter.hasNext() ; ){
       Map.Entry entry = (Map.Entry)iter.next();
       String id = (String)entry.getKey();
       String name =  (String)entry.getValue(); 
%>
<tr> <form action="/servlets/processor" method="post">
     <input type="hidden" name="type" value="upload_microarray">
     <input type="hidden" name="upload_action" value="delete">
     <input type="hidden" name="delete_tair_id" value="<%=  id %>">
 <td><A href="/servlets/TairObject?type=expression_set&id=<%=  id %>" target=_blank> <%=  name%></A>   </td>
 <td> <input type="submit" value="delete"></td>
      </form>
 </tr>
  <% } } else { %>
 <tr><td colspan=2>
  No result set for the input date, please go<A href="/servlets/processor?type=upload_microarray&upload_action=searchStart"> back</A> to modify
  </td></tr>
  <% } %>
 </table>
</h5>
