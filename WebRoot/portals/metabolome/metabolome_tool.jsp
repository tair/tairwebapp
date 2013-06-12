<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR- Metabolomics Resources- Data Analysis Tools";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1192" />
</jsp:include>

<jsp:include page="/jsp/includes/metabolomeSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Data Analysis Tools" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->
<span class="mainheader">Data Analysis Tools</span>


<DL>

   

<DT><a href="http://prime.psc.riken.jp/?action=blsom_index">BL-SOM </a></DT>
<dd>This "Batch-learning self-organizing map" allows integrated analysis of a range of "omics" data. Two-dimensional feature maps can be generated linking genes and metabolites.</dd>

<DT><a href="http://www.cytoscape.org/">Cytoscape</a></DT>
<dd>An open source software platform for visualizing molecular interaction networks.</dd>

<DT><a href="http://gabi.rzpd.de/projects/MapMan/">MapMan</a></DT>
<dd>A user-driven tool that displays large datasets (e.g. gene expression data from Arabidopsis Affymetrix arrays) onto diagrams of metabolic pathways or other cellular processes.</dd>

<DT><a href="http://www.metabolome-express.org">MetabolomeExpress</a></DT>
<dd>A public metabolomics data repository and processing pipeline enabling web-based processing, analysis and transparent dissemination of metabolite profiling datasets from all organisms, including Arabidopsis. The GC/MS data processing pipeline includes peak integration, library matching, data matrix construction and normalisation, univariate statistics, multivariate analysis (PCA and HCA), correlation analysis and export of metabolite response data to popular metabolic pathway visualisation tools such as MapMan and Cytoscape. A database of pre-calculated metabolite response statistics may be interrogated using simple search, cross-experiment meta-analysis or a novel pattern-matching ‘phenocopy search’ that uses a metabolic phenotype of interest as bait to retrieve similar phenotypes from the database. </dd>


<DT><a href="http://metnet.vrac.iastate.edu/">MetNet</a></DT>
<dd>An integrated software for visualization and analysis of the metabolomic, proteomic and transcriptomic networks of Arabidopsis.</dd>

<DT><a href="http://bioinformatics.ai.sri.com/ptools/">Pathway Tools Omics Viewer</a></DT>
<dd>Using a species-specific pathway database such as those listed on <a href="http://plantmetabolicnetwork.org">PMN</a>, the software overlays data values from the user's high-throughput experiments (e.g. metabolite profiling, microarray, or proteome profiling) onto the metabolic network of an organism.</dd> 

<DT><a href="http://prime.psc.riken.jp/">PRIMe</a></DT>
<dd>The Platform for RIKEN Metabolomics provides a number of web-based tools for integrated analysis of metabolomic, transcriptomic, and other data.</dd>

<DT><a href="http://masspec.scripps.edu/metabo_science/dataanalysistools.php">Scripps Center for Mass Spectrometry</a></DT>
<dd>A variety of tools for peak alignment of MS and NMR data.</dd>

<DT><a href="http://prime.psc.riken.jp/?action=nmr_search">SpinAssign</a></DT>
<dd>This tool, provided by PRIMe, performs batch-assignments of NMR peaks.</dd>








</DL>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

