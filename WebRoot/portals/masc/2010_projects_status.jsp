<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "MASC";
String highlight = "3";
String helpfile="";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
<jsp:param name="helpfile" value="<%= helpfile %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

<jsp:include page="/jsp/includes/mascSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="2010 Projects" />
</jsp:include>
<div id="rightcolumn">
<!--CONTENT HERE//-->
<span class="mainheader">2010 Project Status</span>

<dl>
<dt>
<dd> This page provides information on the status of completion of the awarded Arabidopsis Functional Genomic Projects awarded by NSF, as well as the vailability of data and materials produced by each project.
<P>
<table>
<tr>
<th>Project Name</th>
<th>PI Names</th>
<th>NSF Abstract #</th>
<th>Project Duration</th>
<th>Data in TAIR</th>
<th>Data in Project's Web Site</th>
<th>Data in Other Repository</th>
<th>Materials in Stock Center</th>
<th>Date last updated</th>
</tr>
</table>

</DL>
<p>


<center>Last modified on August 3, 2006</center>
</div><!--end rightcolumn-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

