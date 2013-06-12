<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR - Portals - Functional Annotation";
String highlight = "3";
String helpfile="";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="src.tfc.*,src.querytools.*, src.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
<jsp:param name="helpfile" value="<%= helpfile %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Gene Functional Annotation" />  
</jsp:include>


<div id="rightcolumn">
<span class="mainheader">Gene Functional Annotation</span>
<P>
This section provides information on the functional annotation of the <i>Arabidopsis thaliana</i> genome, ontologies used in the annotation effort, and sites for data retrieval.
<DL>
<DT><a href="/portals/genAnnotation/functional_annotation/ontologies.jsp">Ontologies</a>
<DD>Information about the ontologies available for describing biological data, with enphasis on those used at TAIR for describing genes.
<DT><a href="/servlets/Search?action=new_search&type=gene">TAIR Gene Search</a>
<DD>Find Arabidopsis genes using Gene Ontology and Plant Ontology terms.
<DT><a href="/servlets/Search?action=new_search&type=keyword">Search/Browse TAIR Keywords</a>
<DD>A TAIR tool useful for searching all types of gene annotations done at TAIR, including gene ontology and plant ontology annotations.
<DT><a href="/tools/bulk/go/index.jsp">TAIR GO Annotation Download</a>
<DD>A TAIR tool useful for downloading Arabidopsis GO annotations for a list of genes.
<DT><a href="http://www.geneontology.org/">Search/Browse Gene Ontology Database</a>
<DD>The Gene Ontology website, providing tools for searching and browsing gene functional annotation for several organisms.
<DT<a href="http://plantontology.org/">Search/Browse Plant Ontology Database</a>
<DD>The Plant Ontology website, providing tools for searching and browsing plant structure and developmental stages terms.
<DT><a href="/doc/submit/functional_annotation/123">Submit Functional Annotation to TAIR</a>
<DD>Information on how to submit functional information about your genes to TAIR.
<DT><a href="ftp://ftp.arabidopsis.org/home/tair/Ontologies/">FTP Downloads</a>
<DD>Links to ftp directories in TAIR containing downloadable files with gene functional annotation data done at TAIR.
</DL>
<center>Last modified on May 1, 2006</center>
</div>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
