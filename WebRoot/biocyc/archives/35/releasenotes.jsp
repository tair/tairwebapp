<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<!-- AraCyc 3.5-->
<%String pageName = "Archive AraCyc 3.5";
String highlight = "4";
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
<!-- SIDEBAR -->






<jsp:include page="/jsp/includes/aracycSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Release Notes" />
</jsp:include>
<div id="rightcolumn">
<!-- CONTENT IN HERE -->

<p class="mainheader">Archives: Release Notes - AraCyc 3.5</p>
<p>The <strong>AraCyc 3.5</strong> release contains <strong>262</strong> pathways with <strong>1885</strong> unique genes assigned to the pathways. Currently <strong>89%</strong> pathways have been manually validated for their existence in <em>Arabidopsis</em> and for the correctness of the pathway diagrams from evidence in the literature.
<dl>
<dd><b><a href="releasenotes_newpathways.jsp">New pathways</a></b> <em>(51)</em> This link gives you a summary of the pathways that have been added to AraCyc in this release.</dd>
<dd><b><a href="releasenotes_updatedpathways.jsp">Updated pathways</a></b> <em>(37)</em> These pathways already existed in the database but have had their information updated in this release.</dd>
<dd><b><a href="releasenotes_deletedpathways.jsp">Deleted pathways</a></b> <em>(12)</em> This link gives you a summary of the pathways that have been removed from AraCyc in this release.</dd>
</dl>
<p>A complete list of <b><a href="releasenotes_allnewpathways.jsp">all new pathways</a> </b>added <b>since AraCyc's initial build</b>.</p>
<p>A complete list of <b><a href="releasenotes_alldeletedpathways.jsp">all the pathways</a> </b>removed from AraCyc <b>since its initial build</b>.</p>
<p class="mainheader">&nbsp;</p>
<p>Return to the <b><a href="../archives.jsp">main Archives' page</a> </b>.</p>
<strong><em>Date of release:</em></strong> <em>February 2007</em></div>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

