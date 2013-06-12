<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "MASC";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1155" />
</jsp:include>

<jsp:include page="/jsp/includes/mascSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="MASC Submcomittees" />
</jsp:include>
<div id="rightcolumn">


<!--CONTENT HERE//-->

<span class="mainheader">Major Genomics Projects</span>

<dl>
<dt>
<dd>This section presents information on several major <i>Arabidopsis thaliana</i> functional genomics projects. Information on additional
large projects can be added as appropriate.
<P>
Please select the appropriate project from the left menu.


</DL>
<p>


<center>Last modified on July 30, 2007</center>
</div><!--end rightcolumn-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

