<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - Portals -Find DNA Resources";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1110" />
</jsp:include>
<jsp:include page="/jsp/includes/clonesSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Find DNA Resources"/>  
</jsp:include>

<div id="rightcolumn">
<!-- CONTENT IN HERE -->

<span class="mainheader">Find DNA Resources</span>
<p>Use the left menu to search or browse for clones, vectors, libraries, filters and pooled genomic DNA available at the Arabidopsis Biological Resource Center (ABRC), or search for full-length cDNAs available at RIKEN (RAFL clones), or use SALK's SIGnAL/T-DNA Express tool to find full length cDNA clones from the SSP consortium and other sources.

</p>
<center>Last modified on May 9th, 2006</center>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

