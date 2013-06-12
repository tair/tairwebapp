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
<jsp:param name="id" value="2012" />
</jsp:include>

<jsp:include page="/jsp/includes/gotutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Where to find GO Annotations/GO tools"/>
</jsp:include>

<div id="rightcolumn">


<!--content goes here //-->

<span class="mainheader">Where to find GO annotations-GO Tools</span>
<p>GO annotations for genes can be found in the following places. Click on the links to view the pages/tools and bookmark them for future use.</p>

<p>Gene <%=DefinitionsLookup.createPopupLink("Gene","class")%> and Locus <%=DefinitionsLookup.createPopupLink("Locus","class")%> detail pages: The locus detail pages display GO annotations for ALL gene models belonging to that locus. The Gene detail pages display GO annotations specific to that gene model. This is because a gene model may have a different location, biological role or function than an alternatively spliced variant.The <a href="go_genesearch.mov">Finding Genes with Keywords</a> Quicktime movie demonstrates how to find genes using GO terms and how to interpret the annotations.</p>
<p><a href="/tools/bulk/go/index.jsp" target="_blank">GO Annotation Bulk Download Tool</a>: Go here if you want to find all GO annotations for the whole genome or selected Arabidopsis genes. Use of this tool is described in this <a href="bulkgo.mov"> Downloading GO Annotations</a> Quicktime movie.</p>
<p><a href="/servlets/Search?action=new_search&type=keyword" target="_blank">Keyword Search/Browser</a>: Go here to search all types of keywords, specific types of keywords, browse the ontologies and find all data in TAIR associated to the keywords.This tool is described in the <a href="keyword.mov">Using the Keyword Browser</a> Quicktime movie.
<p><a href="ftp://ftp.arabidopsis.org/home/tair/Ontologies/Gene_Ontology" target="_blank">TAIR FTP site (Gene Ontology)</a>: Files containing all current GO annotations for Arabidopsis genes are located on the TAIR FTP (file transfer protocol) site. The files are in a tab-delimited format which can be opened in a text editor or spreadsheet program. The <a href="ftp://ftp.arabidopsis.org/home/tair/Ontologies/Gene_Ontology/"> ATH_GOSLIM.txt</a> file contains GO annotations for all annotated genes with a separate column showing the broad categories (GO Slim<%=DefinitionsLookup.createPopupLink("Glossary","go_slim")%>) that the terms used in annotation fall into. This file is updated weekly. For more on where to find the files and how to use them, see the <a href="goftp.mov">TAIR GO FTP downloads</a> Quicktime movie.</p>
<p><a href="http://www.geneontology.org" target="_blank">GO Database</a>: The Gene Ontology Consortium's database includes all of TAIR's GO annotations for Arabidopsis genes along with annotations for a wide range of taxonomic groups. Go here if you want to compare GO annotations from different organisms.</p>

</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
