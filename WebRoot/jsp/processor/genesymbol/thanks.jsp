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
String highlight = "1";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>
<%
   String email  = null;
   if (request.getAttribute("email") !=null){
      email = (String)(request.getAttribute("email") );
   }
   Long submitter_id =null;
   if ( request.getAttribute("submitter_id") !=null ){
      submitter_id = (Long) request.getAttribute("submitter_id");
   }

%>
 <table width="100%" border="0" colspan="2" cellspacing="0" >
 <TR>
   <td colspan=2>
   <b>The gene class symbol has been submitted to the TAIR database<P>
   </B>
   <BR>
      Thank you for submitting your gene class symbol. Our curators will
      review and confirm your registration as soon as possible. <BR> 
   <BR><BR>
 
      If you would like to submit another gene class symbol, please click
   <A href="/servlets/processor?type=genesymbol"> Here</A>.
   <BR>
 
      Click <A href="/jsp/processor/genesymbol/symbol_main.jsp"> Here</A> to return to the symbol registration front page.
     
   </td>
 </TR>   
 </TABLE>

	
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
