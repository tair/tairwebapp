<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR- Proteome Resources- Protein Domain";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11801" />
</jsp:include>

<jsp:include page="/jsp/includes/proteomeSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Protein Domain" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->
<span class="mainheader">Protein Domain</span>

<DL>

<DT> <a href="ftp://ftp.arabidopsis.org/home/tair/Proteins/Domains/">TAIR Protein Domain</a></DT>
<dd>Results from scanning of the latest Arabidopsis genome release with protein domain prediction programs including INTERPRO, BlastProDom, FPrintScan, HMMPfam, HMMSmart, HMMTigr, ProfileScan, and ScanRegExpdomains.Download the whole dataset from TAIR.</dd>

</DL>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

