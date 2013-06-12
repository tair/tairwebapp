<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "What's This Phytosanitary Certificate";
String highlight = "1";
 %>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<table align="center">
      <tr>
      <br>
	<td align="center"><font class="mainheader">Phytosanitary Certificate Charge</font></td>
      </tr>
      <tr>
		<td>
	  	<br>
	  		Your country requires a Phytosanitary Certificate (formal certification from US Government 
	  		that the seeds are pest and pathogen free) for each seed order.  This fee reflects our cost for this document.<br>
		</td>
      </tr>
</table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
