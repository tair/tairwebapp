<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<!-- AraCyc 4.0-->
<%String pageName = "Archives AraCyc 4.0";
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
<style type="text/css">
<!--
.style1 {
	font-weight: bold;
	font-style: italic;
}
-->
</style>








<jsp:include page="/jsp/includes/aracycSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Release Notes" />
</jsp:include>
<div id="rightcolumn">
<!-- CONTENT IN HERE -->
<span class="mainheader">Archives: Release Notes - AraCyc 4.0 </span>
<p>The <strong>AraCyc 4.0 </strong> release represents a <em>major improvements</em> to the previous version.
<p>First, the <strong>AraCyc genes</strong> have been <strong>updated to reflect the latest function annotations</strong> of the <strong>TAIR 7</strong><em> Arabidopsis</em> genome release. As a result, a significant proportion of genes assignments to reactions (which are based on the functional annotations of genes) have been updated: 1327 old assignments (19% of 
  total) have been removed and 952 new assignments have been added to AraCyc. This release contains <strong>285</strong> pathways with <strong>1885</strong> unique genes assigned to the pathways, and <strong>81%</strong> of those pathways have been experimentally confirmed (<a href="releasenotes_statistics.jsp"><strong>more statistics</strong></a>).
<p>Second, <strong>all AraCyc pathways</strong> have been <strong>manually validated</strong> for their existence in <em>Arabidopsis</em> and for the correctness of the pathway diagrams from evidence in the literature. Note that 'validation' is not synonymous with 'experimental confirmation'. Validated pathways have been reviewed by a curator who has assessed that their computational prediction was justified based on a number of cues from the literature, but whose existence remains to be experimentally confirmed.
<dl>
<dd><b><a href="releasenotes_newpathways.jsp">New pathways</a></b> <em>(50)</em> This link gives you a summary of the pathways that have been added to AraCyc in this release.</dd>
<dd><b><a href="releasenotes_updatedpathways.jsp">Updated pathways</a></b> <em>(42)</em> These pathways already existed in the database but have had their information updated in this release.</dd>
<dd><b><a href="releasenotes_deletedpathways.jsp">Deleted pathways</a></b> <em>(16)</em> This link gives you a summary of the pathways that have been removed from AraCyc in this release.</dd>
</dl>
<p>A complete list of <b><a href="releasenotes_allnewpathways.jsp">all new pathways</a> </b>added <b>since AraCyc's initial build</b>.</p>
<p>A complete list of <b><a href="releasenotes_alldeletedpathways.jsp">all the pathways</a> </b>removed from AraCyc <b>since its initial build</b>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives page</strong></a>.</p>
<strong><em>Last modified:</em></strong> <em>July 3, 2007
</em></div>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

