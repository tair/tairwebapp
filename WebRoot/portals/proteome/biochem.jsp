<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR- Proteome Resources- Biochemical Properties";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11805" />
</jsp:include>

<jsp:include page="/jsp/includes/proteomeSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Biochemical Properties" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->
<span class="mainheader">Biochemical Properties</span>

<DL>

<DT> <a href="http://www.brenda.uni-koeln.de">BRENDA</a></DT>
<dd> Comprehensive enzyme information edited from the scientific literature for many proteins across species including Arabidopsis.</dd>

<DT> <a href="/tools/aracyc/">AraCyc</a></DT>
<dd> Enzymes and biochemical pathways of Arabidopsis.</dd> 

</DL>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

