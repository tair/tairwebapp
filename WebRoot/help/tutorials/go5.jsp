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
<jsp:param name="id" value="2014" />
</jsp:include>

<jsp:include page="/jsp/includes/gotutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="How to find similarly annotated genes"/>
</jsp:include>

<div id="rightcolumn">


<!--content goes here //-->
<span class="mainheader">How to find  similarly annotated genes</span>
<p>One of the advantages of using controlled vocabularies such as the GO ontologies, is to facilitate finding relationships among genes that might not be evident based on other similarities (e.g. sequence or structural similarity). Other sections of this tutorial have described how to find information about genes having a specific shared function, role or localization. The controlled vocabulary annotations can be extremely useful in inferring relationships among genes which can then be tested experimentally. In this example, annotations for a SPECIFIC gene are used to identify genes that may potentially act in the same pathway.</p>

<h2 class="main">Finding potentially related genes in Arabidopsis using GO annotations.</h2>
<p>The example gene is ERA1 which was first described as a mutation with an enhanced response to exogenous abscisic acid.The cloned gene encodes the  beta subunit of a farnesyl transferase. It was subsequently shown to be identical to the WIGGUM locus, which was identified in a screen for mutants defective in meristem organization. <a href="/servlets/TairObject?id=134599&type=locus" target="new">View ERA1/AT5G40280 locus details</a>.</p>
<ol>
<li>Find the Annotations section on the locus details.</li>
<p>Annotations to all gene models for this locus are displayed in this section.</p>
<li>Click on the name of the term to find other genes annotated to the same process or function.</li>
<p>Similarly annotated genes in Arabidopsis may be candidates for acting in the same pathway.</p>
<li>On the resulting keyword detail page, click on the genes annotated to term to obtain a list of other genes annotated to the same keyword. </li>
<p>For example, select the term 'protein farnesyltransferase complex'. The locus AT3G59380 is also annotated to the complex as the alpha subunit based upon structural similarity. Potentially this gene (also known as FTA) is part of a complex with ERA1. The mutant phenotype of Pluripetala (aka AT3G59380) has been <a href="http://www.pnas.org/cgi/content/abstract/101/20/7815">reported </a>: plp mutants have enlarged meristems,slower growth, abnormal responses to ABA and is epistatic to ERA1 mutant alleles.</p>
</ol>

<h2 class="main">Finding similar genes from other organisms</h2>
<p>The <a href="http://www.geneontology.org" target="_new"> Gene Ontology Consortium</a> maintains a database which stores all annotations contributed by the member databases. The GO database is searchable using the AmiGO browser. TAIR contributes annotations for Arabidopsis genes (made by TAIR curators) to the GO database on a weekly basis. Using the AmiGO browser you can filter results by organism, contributing database and evidence. For example, GO annotations from other genes may be useful in inferring functions for unknown genes in Arabidopsis or for identifying candidate genes in Arabidopsis based upon the function/role of homologs in other species. The <a href="http://www.godatabase.org/cgi-bin/amigo/go.cgi" target="new">AmiGO browser</a> is used to query and browse the ontologies and annotations in the GO database. See the <a href="http://www.godatabase.org/amigo/docs/user_guide/index.html" target="new">AmiGO user guide</a> for help in querying the GO database.</p>
</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>