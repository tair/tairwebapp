<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2000 NCGR.  All rights 
  reserved.
-->
<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>

<%!
String pageName = "main page";
String highlight = "1";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>
 <table width="100%" border="0" colspan="2" cellspacing="0" >
 <TR>
   <td colspan=2>
   <b><font size="+1">
   <A href="/jsp/processor/genesymbol/symbol_main.jsp">
   Gene Symbol Registration</A><P><P>
       
 
    </font></B>
   </td>
 </TR>   
 </TABLE>

	
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
