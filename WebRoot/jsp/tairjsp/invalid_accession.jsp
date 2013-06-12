<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->


<%@ page import = "org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "Invalid Accession Number"; 
%>  

<% 
String accession = request.getParameter( "accession" );
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<table align="center" cellpadding="2" width="500">

      <tr>
	<td align="center"><font class="errorheader">Invalid Accession Number</font></td>
      </tr>
      <tr>
	<td><br>
	  <p>
	    <b><%= accession %></b> is not a valid TAIR accession number. 

	  <p>Please check your request and try again.
	  <p>
	    TAIR accession numbers should be in the following format: accession=TYPE:ID (i.e. accession=Clone:2303346).
	</td>
      </tr>
</table>






<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
