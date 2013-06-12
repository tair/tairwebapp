<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR- Metabolomics Resources- Metabolomics Standards";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1194" />
</jsp:include>

<jsp:include page="/jsp/includes/metabolomeSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Metabolomics Standards" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->
<span class="mainheader">Metabolomics Standards</span>

<DL>


<DT><a href="http://metabolomicssociety.org/register/index.php?option=com_content&task=view&id=17&Itemid=35">Metabolomics Society</a></DT>
<dd>A forum for establishing metabolomics standards.</dd>

<DT><a href="http://www.armet.org/index.html">ArMet</a></DT>
<dd>An initiative for creating standards used in describing plant metabolomics experiments and results that has produced a Core Specification document.</dd>

<DT><a href="http://www.biopax.org/About.html">BioPax</a></DT>
<dd>An effort to develop a common exchange format for biological pathway data.</dd>


</DL>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

