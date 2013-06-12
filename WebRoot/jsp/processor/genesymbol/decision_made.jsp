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
String pageName = "thanks";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<%
   Long tair_object_id  = null;
   if (request.getAttribute("tair_object_id") !=null){
      tair_object_id = (Long)(request.getAttribute("tair_object_id") );
   }
   

%>
 <table width="100%" border="0" colspan="2" cellspacing="0" >
 <TR>
   <td colspan=2>
   <b>A Decision about this gene class symbol has been made, <P>
       
  </B>
   <BR>
   You can view it's detail from <A href="/servlets/TairObject?type=gene_class_symbol&id=<%= tair_object_id %>">here</A>
   </td>
 </TR>   
 </TABLE>

	
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
