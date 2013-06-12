<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "AraCyc Tutorial";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="20006" />
</jsp:include>

<jsp:include page="/jsp/includes/aracyctutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Demos-Quicktime Movies"/>
</jsp:include>

<div id="rightcolumn">


<!--content goes  here//-->
<span class="mainheader">QuickTime Movies</span>
<p>The following movies illustrate some of the features of AraCyc described in this tutorial.</p>
<p>To view the movies you will need to have Quicktime installed on your computer <a href="http://www.apple.com/quicktime/download"><IMG SRC="http://a772.g.akamai.net/7/772/51/9a209465e85cbe/www.apple.com/main/elements/getquicktime.gif" WIDTH="88" HEIGHT="31" BORDER="0" ALT="Get QuickTime"/></a></p>
<h3>Tutorial Demo:<a href="aracycsearch.mov">Searching and Browsing AraCyc</a></h3>
<p>This Quicktime movie demonstrates how to use the simple search and browse features to query AraCyc.</p>
<h3>Tutorial Demo:<a href="aracycmap.mov">AraCyc Metabolic Map Overview</a></h3>
<p>This Quicktime movie demonstrates how to browse pathways in AraCyc starting from the metabolic pathway overview diagram.</p>
<h3>Tutorial Demo: <a href="aracycexpr.mov">Using the Omics Viewer</a></h3>
<p>This Quicktime movie demonstrates how to use the Omics viewer to overlay gene expression data onto the pathway overview.</p>
</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>