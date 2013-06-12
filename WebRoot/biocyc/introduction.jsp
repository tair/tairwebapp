<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - AraCyc - Introduction";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="7300" />
</jsp:include>
<!-- SIDEBAR -->


<jsp:include page="/jsp/includes/aracycSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Introduction" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->

<p align="center"><img src="aracyc_files/aracyc_logo.gif" width="100" height="58"></p>
<p class="mainheader">Introduction</p>
<p>AraCyc is a tool for visualizing biochemical pathways of <em>Arabidopsis thaliana</em>. It is supported by the <a href="http://bioinformatics.ai.sri.com/ptools/">Pathway Tools</a> software developed by Peter Karp's group at <a href="http://www.sri.com/">SRI</a>.</p>
<p>AraCyc was originally computationally predicted for the sequenced <em>Arabidopsis</em> genome using <a href="http://metacyc.org/">MetaCyc</a> as reference database. The existence of the predicted pathways was then manually validated and non-<em>Arabidopsis</em> pathways were removed. The manual curation of the database, which includes correcting pathways and adding missing pathways, is on-going.</p>
<p>AraCyc contains a mix of information: extracted from peer-reviewed literature and computationally predicted. A series of <strong>icons</strong> usually located in the top-right corner of the screen will <strong>indicate the type of evidence </strong>used for the displayed pathway or enzyme information displayed (for more info, visit the <a href="../../help/tutorials/aracyc_intro.jsp">AraCyc Tutorial</a>).</p>
<p>AraCyc is released on a <strong>semi-annual basis</strong> (see <a href="http://www.plantcyc.org/release_notes/aracyc/aracyc_release_notes.faces">Release Notes</a>). With each release a <a href="http://www.plantcyc.org:1555/ARA/organism-summary?object=ARA">Summary of the DataBase Content</a> is made available, as well as a <a href="http://www.plantcyc.org:1555/ARA/pathologic-index.html">PathoLogic Software Report</a>.</p>
<p>In its current state many AraCyc pathways 


 contain pathways with incomplete reactions and enzyme/gene assignments as well as missing some pathways. We, therefore, strongly encourage AraCyc users to share their pathway knowledge with us to help us in our constant task of improving its data content (see the <a href="http://www.plantcyc.org/feedback/data_submission.faces"> Data Submission</a> page).</p>
 
 
 
 
 
 
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

