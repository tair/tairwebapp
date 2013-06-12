<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page 
errorPage="/jsp/common/gen_error.jsp"
%>

<%!
String pageName = "Add Definition";
String highlight = "1";
%>

<% String table_name = request.getParameter("table_name"); %> 

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<form action="/servlets/processor" method="post">
<input type="hidden" name="type" value="definition">
<input type="hidden" name="update_action" value="create">

 <table width="100%" border="0" colspan="2" cellspacing="0" >
  <tr>
     <td colspan="2"><h1>Add Definition:</h1></td>
  </tr>
	
  <tr <%=myBgColor.toggleBgColor()%>>
     <td>Table Name</td>
     <td><input type="text" size="20" maxlength="50" name="table_name" value="<%= table_name %>"></td>
  </tr>

  <tr <%=myBgColor.toggleBgColor()%>>	
     <td>Field Name</td>
     <td><input type="text" size="20" maxlength="30" name="field_name"></td>
  </tr>

  <tr <%=myBgColor.toggleBgColor()%>> 
     <td>Field Value</td>
     <td><input type="text" size="20" maxlength="50" name="field_value"></td>	
  </tr>

   <tr  <%=myBgColor.toggleBgColor()%>> 
     <td>Display Value</td>
     <td><input type="text" size="20" maxlength="50" name="display_value"></td>
   </tr>

   <tr <%=myBgColor.toggleBgColor()%>> 
     <td>Reference</td>
     <td><input type="text" size="30" maxlength="255" name="reference" ></td>
    </tr>
   <tr <%=myBgColor.toggleBgColor()%>>
     <td >Definition</td>
     <td><textarea name="definition" cols="30" rows="10" wrap="virtual"></textarea></td>
              
   </tr>
   <tr <%=myBgColor.toggleBgColor()%>>
     <td>Do Status</td>
     <td><input type="checkbox" name="do_stats" value="true"></td>
              
   </tr> 
   <tr <%=myBgColor.toggleBgColor()%>>
     <td>Do Glossary</td>
     <td><input type="checkbox" name="is_glossary" value="true"></td>
              
   </tr>
  <tr <%=myBgColor.toggleBgColor()%> >
     <td><input type="SUBMIT" value="Add Definition"></td>
     <td><input TYPE="RESET" value="Reset"></td> 
  </tr>  

 </table>
</form>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
