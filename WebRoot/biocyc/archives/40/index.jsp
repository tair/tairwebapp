<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - AraCyc";
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
<jsp:param name="sidebarName" value="AraCyc" />
</jsp:include>
<div id="rightcolumn">
<!-- CONTENT IN HERE -->

<p align="center"><img src="aracyc_files/aracyc_logo.gif" width="100" height="58"></p>
<p class="mainheader">AraCyc</p>
<p>This section compiles a series of links which provides you with a brief history of the creation of AraCyc, information on its current data content, access to the database and ways to submit new pathways/enzyme or updates to improve AraCyc. </p>
<dl>
	<dd><b><a href="http://www.plantcyc.org:1555/ARA/server.html">Search AraCyc</a> </b>This link allows you to search or browse the information (Pathways, Compounds, Enzymes...) contained in the AraCyc database.</dd>
</dl>
<dl>
	<dd><b><a href="introduction.jsp">Introduction</a> </b>You will find here all the information you need concerning the creation of AraCyc and the current status of its content. A recommended short read!</dd>
	<dd><b><a href="http://www.plantcyc.org:1555/ARA/new-image?type=OVERVIEW">Metabolic Map</a> </b>The Metabolic map provides you with a 'bird's eye' view of <em>Arabidopsis</em> metabolism currently stored in AraCyc. (<strong>Note:</strong> This page may take a moment to load). For more info, visit the <a href="/../../help/tutorials/aracyc4.jsp">Tutorial</a> (contains QuickTime demo). </dd>
	<dd><b><a href="/submit/pathway_submission.jsp">Pathway Data Submission Form</a> </b>Your input is invaluable! This preformatted Excel Form allows you to send us your suggestions: pathway updates (comments, enzymes...), new pathways or even to point out mistakes.</dd>
	<dd><b><a href="releasenotes.jsp">Release Notes</a> </b>What's new in the latest AraCyc release? You will find it here along with comprehensive lists of pathways that have been added to and deleted from AraCyc over time.</dd>
</dl>

<strong>Troubleshooting </strong>
  <p>Pathway Tools <strong>uses a non-standard port (:1555)</strong>. This means that if you work behind a firewall (common in commercial companies), you will not get any response from AraCyc. The solution to this problem is to have your network administrator open the :1555 port on the firewall. </p>
  <p>Note also that Pathway Tools' <strong>chromosome map tool is not supported in AraCyc</strong>. Please use the <a href="/servlets/mapper">MapViewer </a> or <a href="http://tairvm09.tacc.utexas.edu/servlets/sv">SeqViewer </a> tools for that purpose. </p>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

