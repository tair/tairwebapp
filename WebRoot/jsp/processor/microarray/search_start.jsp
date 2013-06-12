<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="javax.sql.*, java.sql.*, org.tair.querytools.*, org.tair.tfc.*, org.tair.utilities.*, java.util.*" %> 
<%! String pageName = "Microarray Experiment";
String highlight = "1";
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<h5><table width="100%">

<form action="/servlets/processor" method="post">
     <input type="hidden" name="type" value="upload_microarray">
     <input type="hidden" name="upload_action" value="search">
<tr>   
 <td>Submission Number:</td>
 <td align=left><input name="search_sub_no"></td>
</tr>
<tr><td align=center>
     <input type="submit" value="search"></td>
 </tr>
 </form>
  </table>
</h5>

