<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String pageName = "TAIR - Portals - Gene Annotation- Functional Annotation";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11421" />
</jsp:include>

<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="TAIR and the GO Reference Genome Project" />
</jsp:include>
<div id="rightcolumn">
<!-- CONTENT IN HERE -->

<span class="mainheader"> The Gene Ontology Consortium Reference Genome Annotation Project at TAIR </span>

    <p>TAIR is a member of the <a href="http://www.geneontology.org/GO.refgenome.shtml?all">Gene Ontology Consortium Reference Genome Annotation Project </a> with the responsibility of comprehensively annotating a selected set of Arabidopsis genes.</p>

    <p>With more and more genomes being sequenced, we are in the middle of an explosion of genomic information. The limited resources to manually annotate the growing number of sequenced genomes imply that automatic annotation will be the method of choice for many groups. The GO Consortium coordinates an effort to maximize and optimize the GO annotation of a large and representative set of key genomes known as reference genomes. The goal of this project is to completely annotate twelve reference genomes so that those annotations may be used to effectively seed the automatic annotation efforts of other genomes.</p>

<p>The reference genomes and responsible database groups are: </p>

<ul>
    <li> Arabidopsis thaliana (<a href="/">The Arabidopsis Information Resource (TAIR)</a>)</li>
    <li> Caenorhabditis elegans (<a href="http://www.wormbase.org/">WormBase</a>)</li>
    <li> Danio rerio (<a href="http://zfin.org">zebrafish; Zebrafish Information Network (ZFIN)</a>)</li>
    <li> Dictyostelium discoideum (<a href="http://www.dictybase.org/">dictyBase</a>)</li>
    <li> Drosophila melanogaster (<a href="http://flybase.org/">FlyBase</a>)</li>
    <li> Escherichia coli (<a href="http://ecolihub.org/">EcoliHub</a>)</li>
    <li> Gallus gallus (<a href="http://www.agbase.msstate.edu/">AgBase</a>)</li>
    <li> Homo sapiens (<a href="http://www.ebi.ac.uk/GOA/human_release.html">human Gene Ontology Annotation [GOA] &#064; EBI</a>)</li>
    <li> Mus musculus (<a href="http://www.informatics.jax.org/">Mouse Genome Informatics (MGI)</a>)</li>
    <li> Rattus norvegicus (<a href="http://rgd.mcw.edu/">Rat Genome Database (RGD)</a>)</li>
    <li> Saccharomyces cerevisiae (<a href="http://www.yeastgenome.org">Saccharomyces Genome Database (SGD)</a>)</li>
    <li> Schizosaccharomyces pombe (<a href="http://www.genedb.org/genedb/pombe/">GeneDB S. pombe</a>)</li>
</ul>

<center>Last modified on October 9, 2009</center>
</div>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
