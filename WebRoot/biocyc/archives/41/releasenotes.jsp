<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<!-- AraCyc 4.1-->
<%String pageName = "Archives AraCyc 4.1";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="7301" />
</jsp:include>
<!-- SIDEBAR -->

<jsp:include page="/jsp/includes/aracycSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Release Notes" />
</jsp:include>
<div id="rightcolumn">


<!-- CONTENT IN HERE -->

<p align="center"><img src="aracyc_files/aracyc_logo.gif" width="100" height="58"></p>
<p class="mainheader">Archives: Release Notes - AraCyc 4.1 </p>

<p>The AraCyc 4.1 release contains <strong>283</strong> pathways with <strong>1901</strong> unique genes assigned to the pathways, and <strong>90%</strong> of those pathways have been experimentally confirmed (<a href="releasenotes_statistics.jsp"><strong>more statistics</strong></a>). The remaining pathways, although have been validated by a curator who has assessed that their computational prediction was justified based on a number of cues from the literature, lack enough experimental data to be confirmed.

<dl>
<!--<dd><b><a href="releasenotes_newpathways.jsp">New pathways</a></b> <em>(45)</em> This link gives you a summary of the pathways that have been added to AraCyc in this release.</dd> -->
<dd><b><a href="releasenotes_updatedpathways.jsp">Updated pathways</a></b> <em>(23)</em> These pathways already existed in the database but have had their information updated in this release.</dd>
<dd><b><a href="releasenotes_deletedpathways.jsp">Deleted pathways</a></b> <em>(2)</em> This link gives you a summary of the pathways that have been removed from AraCyc in this release.</dd>
</dl>
<p>A complete list of <b><a href="releasenotes_allnewpathways.jsp">all new pathways</a> </b>added <b>since AraCyc's initial build</b>.</p>
<p>A complete list of <b><a href="releasenotes_alldeletedpathways.jsp">all the pathways</a> </b>removed from AraCyc <b>since its initial build</b>.</p>
<!--<p class="mainheader">Additional information</p> -->
<!--<p>A <a href="http://www.plantcyc.org:1555/ARA/organism-summary?object=ARA"><strong>Summary</strong></a> of the AraCyc's content (statistics on pathways, proteins, genes...) is made available with each release.</p> -->
<p>Return to the <a href="../archives.jsp"><strong>main Archives page</strong></a>.</p>
<!--<P>A summary of <a href="http://www.plantcyc.org:1555/ARA/missing-rxns.html"><strong>pathway holes</strong></a> lists reactions within AraCyc pathways for which no corresponding enzyme has been found.</P><br> -->
<strong><em>Last modified:</em></strong> <em>October 5, 2007
</em></div>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

