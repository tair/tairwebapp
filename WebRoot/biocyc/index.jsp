<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - AraCyc";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="73" />
</jsp:include>
<!-- SIDEBAR -->



<jsp:include page="/jsp/includes/aracycSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="AraCyc" />
</jsp:include>
<div id="rightcolumn">
<!-- CONTENT IN HERE -->
<p style="float: left;" class="mainheader">AraCyc</p>
<p style="float: left; text-indent: 120px;"><img src="aracyc_files/aracyc_logo.gif" width="100" height="58" /></p>
<p style="float: left; text-indent: 115px;"><a href="http://www.plantcyc.org:1555/ARA/server.html?"><img src="/i/pmn_logo_small.gif" width="112" height="55" /></a></p>
<!-- <p class="mainheader">AraCyc 4.0 <img src="aracyc_files/fire.gif" width="60" height="70"></p> -->
<!-- <p>We are glad to announce the release of the latest version (4.0) of AraCyc. This new version represents <strong>a milestone</strong> in the development of the database, whose content has been majorly improved. Please visit our <a href="releasenotes.jsp">release notes</a> to find out more about its content.</p> -->

<p style="clear: both;">This section compiles a series of links which provides you with a brief history of the creation of AraCyc, information on its current data content, access to the database and ways to submit new pathways/enzyme or updates to improve AraCyc. </p>

<dl>
	<dd><b>Breaking News:<a href="http://www.plantcyc.org/release_notes/aracyc/aracyc_release_notes.faces"> Arayc 8.0 Release - April 2011!</a></b></dd>


	<dd><b><a href="http://pmn.plantcyc.org/ARA/server.html">Search AraCyc</a> </b>This link allows you to search or browse the information (Pathways, Compounds, Enzymes...) contained in the AraCyc database. Plus you can quickly connect to metabolic information from other plant species through the <a href="http://www.plantcyc.org">Plant Metabolic Network</a></dd>
	
	<dd><b><a href="http://pmn.plantcyc.org/ARA/expression.html">OMICS Viewer</a> </b>You can use this tool to <strong>overlay your data</strong> from gene expression, proteomic, or metabolomic experiments on a metabolic map. Please visit our <a href="http://plantcyc.org/tutorials/tutorials_index.faces">Tutorial</a> or <a href="/help/tutorials/aracycexpr.mov">Quicktime Demo</a> for help with uploading your data and interpreting the results. </dd>
	
	<dd><b><a href="http://pmn.plantcyc.org/overviewsWeb/celOv.shtml">Metabolic (Cellular) Overview</a> </b>The Metabolic Overview provides you with a 'bird's eye' view of <em>Arabidopsis</em> metabolism currently stored in AraCyc. (<strong>Note:</strong> This page may take a moment to load). <!--For more info, visit the <a href="http://plantcyc.org/tutorials/tutorials_index.faces">Tutorial</a> or view the <a href="/help/tutorials/aracycmap.mov">QuickTime Demo</a>-->. </dd>
	
	<dd><b><a href="introduction.jsp">More information</a> </b>You will find here all the information you need concerning the creation of AraCyc and the current status of its content. A recommended short read!</dd>
	
	<dd><b><a href="downloads.jsp">Data Downloads</a> </b>You can download the AraCyc database files from the <a href="http://www.plantcyc.org">Plant Metabolic Network</a> website. </dd>
	
	<dd><b><a href="http://www.plantcyc.org/feedback/data_submission.faces">Pathway, Enzyme, and Compound Data Submission Forms</a> </b>Your input is invaluable! Our preformatted Excel Forms allow you to send us your suggestions: pathway updates (comments, enzymes...), new pathways or even to point out mistakes.</dd>
	
	<dd><b><a href="http://www.plantcyc.org/release_notes/aracyc/aracyc_release_notes.faces">Release Notes</a> </b>What's new in the latest AraCyc release? You will find it here along with comprehensive lists of pathways that have been added to and deleted from AraCyc over time in our <a href="http://www.plantcyc.org/release_notes/release_notes_archives/release_notes_archives.faces">archives</a>.</dd>
	
	<dd><b><a href="tools.jsp">Other AraCyc Tools</a> </b>A few other tools for mining the data in AraCyc are provided including the <a href="http://pmn.plantcyc.org/ARA/comp-genomics?">Comparative Analysis</a> tool and an <a href="http://pmn.plantcyc.org/ARA/query.html">Advanced Query Page</a>. </dd>
	
	<dd><b><a href="/portals/metabolome/index.jsp">Metabolomics Portal</a> </b>Would you like easy access to additional tools and resources related to metabolism? This portal provides many helpful links.</dd>
</dl>

<strong>Troubleshooting </strong>
  <!--<p>Pathway Tools <strong>uses a non-standard port (:1555)</strong>. This means that if you work behind a firewall (common in commercial companies), you will not get any response from AraCyc. The solution to this problem is to have your network administrator open the :1555 port on the firewall. </p>-->
  <p>Note also that Pathway Tools' <strong>chromosome map tool is not supported in AraCyc</strong>. Please use the <a href="/servlets/mapper">MapViewer </a> or <a href="http://tairvm09.tacc.utexas.edu/servlets/sv">SeqViewer </a> tools for that purpose. </p>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

