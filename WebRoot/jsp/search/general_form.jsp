<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%!
String pageName = "Search";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
errorPage="/jsp/common/gen_error.jsp"%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%= cssfile %>" />
<jsp:param name="id" value="50" />
</jsp:include>

<jsp:include page="/jsp/includes/searchSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="" />
</jsp:include>

<!-- CONTENT IN HERE -->

<div id="rightcolumn">

<span class="mainheader">Search Overview</span>
<p>
This section provides advanced search forms for TAIR data.  These forms are useful for more complex 
queries (for example searching by name plus gene model type or map position).  A simple query 
using a name or keyword can be done using the search box in the top right corner of each TAIR page.
</p>
<dl>

<dt><a href="/servlets/Search?action=new_search&amp;type=dna">DNA/Clones</a><%=DefinitionsLookup.createPopupLink("Search","dna_search")%></dt>
<dd>Search for any DNA, which includes clones, libraries, genomic DNA, and filters.</dd>

<dt><a href="/servlets/Search?action=new_search&amp;type=ecotype">Ecotypes</a><%=DefinitionsLookup.createPopupLink("Search","ecotype")%> </dt>
<dd>Identify natural variants of Arabidopsis and closely related species using various parameters.</dd>

<dt><a href="/servlets/Search?type=gene&amp;action=new_search">Genes</a><%=DefinitionsLookup.createPopupLink("Search","genes")%></dt>
<dd>Genes may be searched by name, keywords, features, and/or location.</dd>

<dt><a href="/tools/bulk/go/index.jsp">GO Annotations</a><%=DefinitionsLookup.createPopupLink("Search","go_annot")%></dt>
<dd>Retrieve Gene Ontology annotations and draw gene function pie charts for your list of AGI locus codes.</dd>


<dt><a href="/servlets/Search?action=new_search&type=keyword">Keywords</a></dt>
<dd>Search or browse the terms used by TAIR to annotate genes, germplasms  and microarray experiments, which include Gene Ontology, Plant  Ontology and Experimental Method terms.
</dd>

<dt><a href="/tools/bulk/locushistory/index.jsp">Locus History</a><%=DefinitionsLookup.createPopupLink("Search","locus")%></dt>
<dd>Discover whether a particular AGI locus identifier is currently in use and whether it has been split or merged with another locus.</dd>

<dt><a href="/servlets/Search?type=marker&amp;action=new_search">Markers</a><%=DefinitionsLookup.createPopupLink("Search","markers")%></dt>
<dd>The TAIR Marker Search window provides three ways of searching for a marker: simple search by name only, feature search using mo
re limits, and search by position.</dd>

<dt><a href="/tools/bulk/microarray/index.jsp">Microarray Elements</a><%=DefinitionsLookup.createPopupLink("Search","micro_elements")%></dt>
<dd>Find information about the microarray elements (AFGC clones and amplicons, Affymetrix probe sets, CATMA GSTs, and Agilent oligos
) contained on the AFGC, Affymetrix AG (8K) and ATH1 (25K) GeneChip, CATMA and Agilent arrays</dd>

<dt><a href="/servlets/Search?type=expr&amp;search_action=new_search">Microarray Experiments</a><%=DefinitionsLookup.createPopupLink("Search","micro_expt")%>
</dt>
<dd>Search microarray experiments by name, description, experimenter's last name, array manufacturer and keywords.</dd>

<dt><a href="/servlets/Search?action=new_search&amp;type=expression">Microarray Expression</a><%=DefinitionsLookup.createPopupLink("Search","micro_expression")%>
</dt>
<dd>Search for microarray gene expression profiles.</dd>

<dt><a href="/servlets/Search?action=new_search&amp;type=community">People/Labs</a><%=DefinitionsLookup.createPopupLink("Community","type")%></dt>
<dd>Find contact information for a colleague, register or update your profile.</dd>

<dt><a href="/servlets/Search?action=new_search&amp;type=polyallele">Polymorphisms and Alleles</a><%=DefinitionsLookup.createPopupLink("Search","poly_allele")%></dt>
<dd>Search by name, features, and/or location.</dd>

<dt><a href="/servlets/Search?action=new_search&amp;type=protein">Proteins</a><%=DefinitionsLookup.createPopupLink("Search","proteinsearch")%></dt>
<dd>Search using a variety of parameters, including gene information, domain information, and genome position.</dd>


<dt><a href="/servlets/Search?type=protocol&amp;action=new_search">Protocols</a><%=DefinitionsLookup.createPopupLink("Protocol","class")%></dt>
<dd>Search for protocols, experimental methods and classroom activities.</dd>

<dt><a href="/servlets/Search?action=new_search&amp;type=publication">Publications</a><%=DefinitionsLookup.createPopupLink("Search","pub")%></dt>
<dd>The publications in the TAIR database are derived primarily from PubMed.  Entries with the word 'Arabidopsis' in the title, abstract, or MeSH headings  are downloaded on a monthly basis.</dd>

<dt><a href="/servlets/Search?action=new_search&amp;type=germplasm">Seeds/Germplasms</a><%=DefinitionsLookup.createPopupLink("Search","germplasm")%></dt>
<dd>Search for ABRC seed stocks or other mutant lines.</dd>

<dt><a href="/tools/bulk/sequences/index.jsp">Sequences</a></dt>
<dd>Download a variety of sequences from the Arabidopsis Genome Initiative (AGI) in FASTA or tab-delimited formats.</dd>

<dt>
<b><a href="http://www.textpresso.org/arabidopsis/" onclick="javascript:urchinTracker('/outgoing/textpresso');">Textpresso Full Text</a></b></dt> 
<dd>Textpresso is an information extracting and processing package for biological 
literature. Textpresso for Arabidopsis allows users to search all abstracts and over 
15,700 full-text publications in TAIR</dd>

</dl>
</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
