<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%!
String pageName = "TAIR - Portals - Genome Annotation";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="114" />
</jsp:include>


<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="" />  
</jsp:include>


<div id="rightcolumn">
<span class="mainheader">Genome Annotation</span>

<P>
This portal provides information on the primary structure of <i>Arabidopsis thaliana</i> genes, including intron-exon structure, intron lengths, alternative splicing and untranslated regions (UTRs), as well as on the function of the gene products.
<DL>
<DT><a href="/portals/genAnnotation/genome_snapshot.jsp">Genome Snapshot</a>
<DD>A summary type overview of the state of annotation of the Arabidopsis genome from a functional and structural perspective.
<DT><a href="/portals/genAnnotation/gene_structural_annotation/index.jsp">Gene Structural Annotation</a>
<DD>Information about the structure of the <I>Arabidopsis thaliana</i> genes and the sequencing effort by the Arabidopsis Genome Initiative (AGI).
<DT><a href="/portals/genAnnotation/functional_annotation/index.jsp">Gene Functional Annotation</a>
<DD>Information on the function of the <I>Arabidopsis thaliana</i> gene products, ontologies used in the annotation effort, and sites for data retrieval.
<DT><a href="/portals/genAnnotation/genome_annotation_tools/index.jsp">Genome Annotation Tools</a>
<DD>Tools available for genome annotation, sequence analysis, and sites for data retrieval.

<DT><a href="/portals/genAnnotation/other_genomes/index.jsp">Other Genomes</a>
<DD>Links to information about other genome databases and associated resources for plant and non-plant species plus information about plant genome sequencing projects.

</DL>
<center>Last modified on April 30, 2008</center>
</div>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

