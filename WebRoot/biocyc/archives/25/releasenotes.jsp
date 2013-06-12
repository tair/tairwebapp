<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<!-- AraCyc version 2.5 -->
<%String pageName = "Archive AraCyc 2.5";
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

<p class="mainheader">Archives: Release Notes - AraCyc 2.5</p>
<p>AraCyc 2.5 has 197 pathways containing 1759 unique genes assigned to the pathways. Currently 86% pathways have been manually validated for their existence in Arabidopsis and for the correctness of the pathway diagrams from evidence in the literature.
<p><strong>Note:</strong> some pathways are named slightly different from the previous release, but their pathway IDs remain the same.  
<dl>
<dd><b><a href="releasenotes_newpathways.jsp">New pathways</a></b> This link gives you a summary of the pathways that have been added to AraCyc in this release.</dd>
<dd><b><a href="releasenotes_deletedpathways.jsp">Deleted pathways</a></b> This link gives you a summary of the pathways that have been removed from AraCyc in this release.</dd>
</dl>
<p>A complete list of <b><a href="releasenotes_allnewpathways.jsp">all new pathways</a> </b>added <b>since AraCyc's initial build</b>.</p>
<p>A complete list of <b><a href="releasenotes_alldeletedpathways.jsp">all the pathways</a> </b>removed from AraCyc <b>since its initial build</b>.</p>
<br>
<p>Return to the <b><a href="../archives.jsp">main Archives' page</a> </b>.</p>
<strong><em>Date of release</em>:</strong> <em>November 2005</em></div>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

