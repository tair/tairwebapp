<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%!
String pageName = "TAIR - Portals - Genome Snapshot";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1140" />
</jsp:include>


<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Genome Snapshot" />  
</jsp:include>


<div id="rightcolumn">
<span class="mainheader">Genome Snapshot</span>

<P>
This page provides information on the status of the Arabidopsis thaliana genome. The pie charts for 
GO process, function and component are based on annotation data as of Nov 18, 2010. Genome Statistics 
are based on the TAIR10 release of November 2010.

<dl>  
 <dt>Summary of Gene Functional Annotation</dt>
<dd> 
The pie charts below represent the state of functional annotation of the Arabidopsis genome 
(excluding pseudogenes) based on links to terms in the three GO ontologies (green:known, 
yellow:uncurated, red:unknown).
</dd>
<p>
    <img src = "/i/piechartsnov2010.gif" width="100%" alt="Whole Genome Annotation Pie Chart"></img>
</p>

    <dd>The bar graphs below represent the distribution of Arabidopsis genes among high level Gene Ontology, or
    <a href= "/help/helppages/go_slim_help.jsp">GOslim</a>, categories based on their annotations to terms falling within these categories. </dd>
    <center>
    <img src = "/i/GOslim_formula.jpg"  alt = "(genes annotated to terms in this GOslim category/genes annotated to terms in this ontology)*100">
    </center>
<p>
    <img src = "/i/molfunctionTAIR10.jpg" width="526px" alt = "Function Bar Graph">
</p>

<p>
    <img src = "/i/biolprocessTAIR10.jpg" width="526px" alt = "Process Bar Graph">
</p>

<p>
    <img src = "/i/cellcomponentTAIR10.jpg" width="526px" alt="Process Bar Graph">
</p>
   <p>
<dt>Summary of Gene Structure Annotation</dt>
    <dd>The TAIR10 release contains 27,416 protein coding genes, 4827 pseudogenes or transposable element genes and 
    1359 ncRNAs (33,602 genes in all, 41,666 gene models). For more detailed information about the TAIR10 release, 
    please see the <a href="/portals/genAnnotation/gene_structural_annotation/annotation_data.jsp">Genome Annotation 
    Data page</a>.
    </dd>

<p>
<jsp:include page="/portals/genAnnotation/genome_statistics.jsp" flush ="true">
<jsp:param name="GraphName" value="Genome Statistics" />  
</jsp:include>
</p>

<p>
<jsp:include page="/portals/genAnnotation/genome_version_statistics.jsp" flush ="true">
<jsp:param name="GraphName" value="Genome Version Statistics" />  
</jsp:include>
</p>

</dl>
    
<center>Last modified on November 22, 2010</center>
</div>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

