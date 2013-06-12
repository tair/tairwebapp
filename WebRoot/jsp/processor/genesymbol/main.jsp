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
   <b><font size="+1">Gene Symbol Registration<P><P>
   
     <A HREF="mutant_gene_symbol_reg.jsp">Register mutant gene symbol</A>
     <P> 
     <A HREF="nonmutant_gene_symbol_reg.jsp">Register non-mutant gene symbol</A>
     <P> 
     <A HREF="gene_alias_reg.jsp">Register gene Alias</A>
   </font></B>
   </td>
 </TR>   
 </TABLE>

	
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
