<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String pageName = "TAIR - Resource Portals";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11" />
</jsp:include>
<jsp:include page="/jsp/includes/portalsSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value=""/>
</jsp:include>

<div id="rightcolumn">
<!-- CONTENT IN HERE -->
<span class="mainheader">Portals Overview</span>
<p>Searching for something specific, or just looking to see what resources are available for Arabidopsis researchers? Start at one of these portals which will introduce you to relevant topics and resources.</p>

<dl>
<dt><a href="/portals/clones_DNA/index.jsp">Clones/DNA Resources</a>
</dt>
<dd>Information about Arabidopsis DNA stocks, and links to stock centers from which they are distributed.
</dd>

<dt><a href="/portals/education/index.jsp">Education and Outreach</a>
</dt>
<dd>Educational information about Arabidopsis, plant biology, genetics, genomics, methods in Arabidopsis research (protocols). Tools and tips for scientists, students and teachers.
</dd>

<dt><a href="/portals/expression/index.jsp">Gene Expression Resources</a>
</dt>
<dd>Information on <i>Arabidopsis</i> high throughput expression data, such as microarrays, GFP-fusion proteins, and Massively Parallel Signature Sequencing technologies.
</dd>

<dt><a href="/portals/genAnnotation/index.jsp">Genome Annotation</a>
</dt>
<dd>Information on the primary structure of Arabidopsis thaliana genes, including intron-exon structure, intron lengths, alternative splicing and untranslated regions (UTRs), as well as on the function of the gene products.
</dd>

<dt><a href="/portals/masc/index.jsp">MASC/Functional Genomics</a>
<dd>Information about the Multinational Arabidopsis Steering Committee (MASC), its Subcommittees, and Arabidopsis functional genomics projects and resources world wide.</dd>

<dt><a href="/portals/metabolome/index.jsp">Metabolomics Resources</a>
</dt>
<dd>Information about metabolic pathway and compound databases, Arabidopsis metabolite profiling data sets, tools, experimental reporting standards, and other metabolomics resources.
</dd>

<dt><a href="/portals/mutants/index.jsp">Mutant and Mapping Resources</a>
</dt>
<dd>Information on forward and reverse genetics resources for Arabidopsis.

</dd>

<dt><a href="/portals/nomenclature/index.jsp">Nomenclature</a>
</dt>
<dd>Presents links to guidelines for gene nomenclature for Arabidopsis and other organisms.
</dd>

<dt><a href="/portals/proteome/index.jsp">Proteome Resources</a>
</dt>
<dd>Information on Arabidopsis proteins, including sequence, structure, motifs and localization data.
</dd>

</dl>
<center>Last modified on May 30, 2006</center>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

