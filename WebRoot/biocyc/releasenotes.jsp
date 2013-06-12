<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<!-- AraCyc 4.1-->
<%String pageName = "AraCyc 6.0 - Release notes";
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
<p class="mainheader">Release Notes - AraCyc </p>

<p>Please see the <a href="http://www.plantcyc.org/release_notes/aracyc/aracyc_release_notes.faces">AraCyc release notes</a> housed at the Plant Metabolic Network for the most up-to-date information.</p> 
<!--<p>In this release, <strong>nn new pathways</strong> have been added to AraCyc through manual curation efforts. In addition, <strong>37 new pathways</strong> introduced into MetaCyc from other species have been validated for AraCyc as well.</p>
<p>AraCyc 6.0 contains <strong>332 pathways</strong> with <strong>1970 unique genes</strong> assigned to the pathways, and <strong>87%</strong> of those pathways have been experimentally confirmed (<a href="releasenotes_statistics.jsp">more statistics</a>). The remaining pathways are based on computational predictions.  Although they lack enough experimental data to be confirmed, they have been validated by a curator who has assessed that their computational prediction is justified based on a number of cues from the literature.</p>
<p>Please see the <a href="releasenotes_statistics.jsp"><strong>database statistics</strong></a> page for more details about the contents of AraCyc 6.0.</p>

<dl>
<dd><b><a href="releasenotes_newpathways.jsp">New pathways</a></b> (including superpathways) <em>(57)</em> This link gives you a summary of the pathways that have been added to AraCyc in this release.</dd>
<dd><b><a href="releasenotes_updatedpathways.jsp">Updated pathways</a></b> (including superpathways) <em>(9)</em> These pathways already existed in the database but have had their information updated in this release.</dd>
<dd><b><a href="releasenotes_deletedpathways.jsp">Deleted pathways</a></b> (including superpathways) <em>(5)</em> This link gives you a summary of the pathways that have been removed from AraCyc in this release.</dd>
</dl>
<p>A complete list of <b><a href="releasenotes_allnewpathways.jsp">all new pathways</a> </b>added <b>since AraCyc's initial build</b>.</p>
<p>A complete list of <b><a href="releasenotes_alldeletedpathways.jsp">all the pathways</a> </b>removed from AraCyc <b>since its initial build</b>.</p>

		<p><strong>Some highlights of the newly added AraCyc pathways:</strong></p>
		 <ul>
		 <li><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-641">FIVE new glucosinolate pathways</a><br />
		 Glucosinolates are important plant defense compounds produced in members of the <i>Capparales</i> order. Some of these compounds have been shown to have health benefits.</li>
				  
		  <li>Improved coverage of IAA metabolism<br />
		  Indole-3-acetic acid is an important auxin implicated in numerous aspects of plant growth and development, so the amount of biologically active auxin present in each cell must be tightly controlled. Researchers continue to find new routes for IAA biosynthesis and IAA modification via amino acid conjugation or methylation in Arabidopsis</li>
		  
		  <li><p>cool example 3</p></li>
		 </ul>
		 
		 <p><strong>Large-scale content changes:</strong></p>
		 <p>To try to improve the quality of the computational predictions found in AraCyc, a new enzyme annotation pipeline was developed and employed using the TAIR9 protein sequences (Chi 2010 -manuscript in preparation). Following quality comparisons between the previous and new annotations, nnnn enzymes were assigned new names and/or new reactions, and nnn were deleted. In addition, a large number of protein modifying enzymes (e.g. ubiquitin ligases) were removed from the database to reduce the amount of non-small molecule metabolism present in the AraCyc.</p>-->

<!--<p class="mainheader">Additional information</p> -->
<!--<p>A <a href="http://www.plantcyc.org:1555/ARA/organism-summary?object=ARA"><strong>Summary</strong></a> of the AraCyc's content (statistics on pathways, proteins, genes...) is made available with each release.</p> -->
<p>To track down all our previous release notes, we have created an <a href="archives/archives.jsp"><strong>Archive</strong></a>. This archive starts with AraCyc release 2.5. </p>
<!--<P>A summary of <a href="http://www.plantcyc.org:1555/ARA/missing-rxns.html"><strong>pathway holes</strong></a> lists reactions within AraCyc pathways for which no corresponding enzyme has been found.</P><br> -->
<strong><em>Last modified:</em></strong> <em>October 6, 2009
</em></div>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

