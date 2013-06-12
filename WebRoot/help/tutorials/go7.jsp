<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "GO Tutorial";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="2016" />
</jsp:include>

<jsp:include page="/jsp/includes/gotutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Demos-Quicktime Movies"/>
</jsp:include>

<div id="rightcolumn">


<!--content goes here //-->
<span class="mainheader">Quicktime Movie Demos</span>
<p>The following movies demonstrate some of the tools and concepts covered in the TAIR GO tutorial.</p>
<p>Requires <a href="http://www.apple.com/quicktime/download"><IMG SRC="http://a772.g.akamai.net/7/772/51/9a209465e85cbe/www.apple.com/main/elements/getquicktime.gif" WIDTH="88" HEIGHT="31" BORDER="0" ALT="Get QuickTime"/></a>Quicktime Plug-in</p>
<dl>
<dt><a href="goterms.mov" target="_new">GO Terms</a></dt>
<dd>Illustrates the relationship between terms (directed acyclic graphs)</dd>
<dt><a href="go_genesearch.mov" target="_new">Finding Genes with Keywords</a></dt>
<dd>Demonstrates how to use keywords in TAIR's QuickSearch, General Search and Gene Search</dd>
<dt><a href="keyword.mov" target="_new">Using the Keyword Browser</a></dt>
<dd>Demonstrates how to use the TreeView Keyword browser to find genes and other data by keyword.</dd>
<dt><a href="bulkgo.mov" target="_new">Downloading GO annotations/Functional classification of Genes</a></dt>
<dd>Demonstrates how to use the Bulk GO Annotation/Download tool.</dd>
<dt><a href="goftp.mov" target="_new">Downloading bulk data from the FTP site</a></dt>
<dd>Demonstrates how to find and download GO annotations and other GO resources from the FTP site.</dd>
</dl>
</div> <!--right column-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>