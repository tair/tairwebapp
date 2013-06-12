<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String pageName = "Genome Annotation Tools: Genome Annotation Tools";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1143" />
</jsp:include>

<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Genome Annotation Tools" />
</jsp:include>
<div id="rightcolumn">
<!--CONTENT HERE-->
<span class="mainheader">Genome Annotation Tools</span>
<P>
This section presents information on tools used for genome annotation, sequence analysis, and sites for data retrieval.

<dl>
<dt><a href="/portals/genAnnotation/genome_annotation_tools/gene_id.jsp">Gene Structural Annotation Tools</a></dt>
<dd>Links to the most popular tools used for genomic sequence annotation.</dd>

<dt><a href="/portals/genAnnotation/genome_annotation_tools/bioinformatics.jsp">Software Downloads</a></dt>
<dd>Links to available open source software for genome annotation.</dd>

<dt><a href="/portals/genAnnotation/genome_annotation_tools/seq_align.jsp">Multiple Sequence Alignment Tools</a></dt>
<dd>Links to multiple sequence alignment tools.</dd>

<dt><a href="/portals/genAnnotation/genome_annotation_tools/seq_resources.jsp">Comprehensive Sequence Analysis Resources</a></dt>
<dd>Launch sites for a variety of sequence analysis tools.</dd>

<dt><a href="/portals/genAnnotation/genome_annotation_tools/comparative_tools.jsp">Comparative Resources</a></dt>
<dd>Genome comparison resources.</dd>

<dt><a href="/portals/genAnnotation/genome_annotation_tools/cis_element.jsp">Plant Promoter and Regulatory Element Resources</a></dt>
<dd>Links to Plant Promoter and Regulatory Element Resources</dd>

<dt><a href="/portals/proteome/index.jsp">Proteome Resources</a></dt>
<dd>Links to proteome analysis tools and repositories.</dd>

<dt><a href="/portals//genAnnotation/genome_annotation_tools/dbsearches.jsp">Database Searches</a></dt>
<dd>A collection of nucleotide/protein databases and sequence similarity searches.</dd>

</dl>

<center>Last modified on November 26, 2007</center>
            </div> <!--right column-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
