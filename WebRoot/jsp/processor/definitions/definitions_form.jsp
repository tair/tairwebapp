<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page
errorPage = "/jsp/common/gen_error.jsp"
%>

<%!
String pageName = "Search Definitions";
String highlight = "1";
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>


<center>
<font class="header">Search Definitions Table</font>
<P>
<FORM action="/servlets/processor" method="post">
<input type="hidden" name="type" value="definition">
<input type="hidden" name="update_action" value="search">

Input Table Name:<p><input name="table_name" size="20" maxlength="50">
 <P>
<input type="submit" value="submit">

 </form>
</center>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
