<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<!-- AraCyc 4.1-->
<%String pageName = "Archives: AraCyc 5.0 - Release notes";
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
<p class="mainheader">Archives: Release Notes - AraCyc 5.0 </p>

<p>In this release, <strong>20 new pathways</strong> have been added to AraCyc through manual curation efforts. In addition, <strong>37 new pathways</strong> introduced into MetaCyc from other species have been validated for AraCyc as well. Over <strong>one third (1700+) of the enzyme/reaction assignments</strong> have been reviewed, largely based on published literature, leading to the elimination of a significant number of false-positive assignments. <strong>Two new compound sets</strong> have also been brought into AraCyc 5.0, one from experimental results obtainted through the Arabidopsis <a href="http://plantmetabolomics.org/" target=_blank> NSF2010 Metabolomics Project</a> and the other from the <a href="http://kanaya.naist.jp/KNApSAcK/" target=_blank>KNApSAcK Species-Metabolite Relationship Database</a>.</p>
<p>AraCyc 5.0 contains <strong>332 pathways</strong> with <strong>1970 unique genes</strong> assigned to the pathways, and <strong>87%</strong> of those pathways have been experimentally confirmed (<a href="releasenotes_statistics.jsp">more statistics</a>). The remaining pathways are based on computational predictions.  Although they lack enough experimental data to be confirmed, they have been validated by a curator who has assessed that their computational prediction is justified based on a number of cues from the literature.</p>
<p>Please see the <a href="releasenotes_statistics.jsp"><strong>database statistics</strong></a> page for more details about the contents of AraCyc 5.0.</p>

<dl>
<dd><b><a href="releasenotes_newpathways.jsp">New pathways</a></b> (including superpathways) <em>(57)</em> This link gives you a summary of the pathways that have been added to AraCyc in this release.</dd>
<dd><b><a href="releasenotes_updatedpathways.jsp">Updated pathways</a></b> (including superpathways) <em>(9)</em> These pathways already existed in the database but have had their information updated in this release.</dd>
<dd><b><a href="releasenotes_deletedpathways.jsp">Deleted pathways</a></b> (including superpathways) <em>(5)</em> This link gives you a summary of the pathways that have been removed from AraCyc in this release.</dd>
</dl>
<p>A complete list of <b><a href="releasenotes_allnewpathways.jsp">all new pathways</a> </b>added <b>since AraCyc's initial build</b>.</p>
<p>A complete list of <b><a href="releasenotes_alldeletedpathways.jsp">all the pathways</a> </b>removed from AraCyc <b>since its initial build</b>.</p>

		<p><strong>Some highlights of the newly added pathways in AraCyc 5.0:</strong></p>
		 <ul>
		 <li> <p>Ascorbate is an important enzyme cofactor and anti-oxidant. AraCyc 4.5 included one general ascorbate biosynthesis pathway [<a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-882">ascorbate biosynthesis I (L-galactose pathway)</a>] but three new variant pathways have been added to AraCyc 5.0</p></li>
		 <ul>
		  <li><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY4FS-11">ascorbate biosynthesis II (L-gulose pathway)</a></li>

		  <li><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY4FS-12">ascorbate biosynthesis III (VTC2 cycle)</a></li>

		  <li><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY4FS-13">ascorbate biosynthesis IV (extended VTC2 cycle)</a></li>
		  </ul><br />
		  
		  <li><p>New secondary metabolites continue to be discovered, even in the well-researched plant, Arabidopsis thaliana. A newly entered pathway for <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5992"> thalianol and derivatives biosynthesis</a> includes three adjacent genes in the Arabidopsis genome, suggesting the existence of an operon-like metabolic gene cluster involved in triterpenoid production.</p></li>
		  
		  <li><p>Flavanols, a class of flavonoids, can have medicinal uses based on their beneficial antioxidant, anticarcinogenic and cardioprotective properties. A new pathway for the production of flavan-3-ols (<a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-6035">2,3-cis-flavanols biosynthesis</a>) is included in AraCyc 5.0.</p></li>
		 </ul>

<p>Return to the <a href="../archives.jsp"><strong>main Archives page</strong></a>.</p>		 

<!--<p class="mainheader">Additional information</p> -->
<!--<p>A <a href="http://www.plantcyc.org:1555/ARA/organism-summary?object=ARA"><strong>Summary</strong></a> of the AraCyc's content (statistics on pathways, proteins, genes...) is made available with each release.</p> -->
<p>To track down all our previous release notes, we have created an <a href="archives/archives.jsp"><strong>Archive</strong></a>. This archive starts with AraCyc release 2.5. </p>
<!--<P>A summary of <a href="http://www.plantcyc.org:1555/ARA/missing-rxns.html"><strong>pathway holes</strong></a> lists reactions within AraCyc pathways for which no corresponding enzyme has been found.</P><br> -->
<strong><em>Last modified:</em></strong> <em>March 12, 2009
</em></div>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

