<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "TAIR Microarray Tutorial";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="2020" />
</jsp:include>

<jsp:include page="/jsp/includes/microtutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Available data and tools"/>
</jsp:include>

<div id="rightcolumn">


<!--content goes  here//-->
<span class="mainheader">Microarray data available from TAIR</span>
<p>TAIR's goal is to provide access to all types of microarray data for Arabidopsis and to integrate the data with other genomic data for the Arabidopsis genome. TAIR includes data using both cDNA arrays and Affymetrix GeneChips technology. TAIR accepts data from large scale functional genomics projects such as the <a href="/info/2010_projects/comp_proj/AFGC/index.html" target="_blank">Arabidopsis Functional Genomics Consortium (AFGC)</a>, <a href="/portals/expression/microarray/ATGenExpress.jsp" target="blank">AtGenExpress</a> from the <a href="http://web.uni-frankfurt.de/fb15/botanik/mcb/AFGN/atgenex.htm" target="blank">AFGN</a>. Contributions also come from individual labs and other <a href="/info/expression/index.jsp">microarray projects</a> around the world. </p>

<h2>Tools for finding and analyzing microarray data in TAIR</h2>
<p>The following are brief descriptions of the Microarray data search and analysis tools available from TAIR.</p>
<p><a href="/servlets/Search?type=expr&search_action=new_search" target="blank">Microarray Experiment Search</a>: The Microarray Experiment search can be used to find detailed information about experiments as well as raw and normalized data. Experiments can be searched by name, description, experimental goal<%=DefinitionsLookup.createPopupLink("RelationshipType","experimental_goal")%>, experimental variable <%=DefinitionsLookup.createPopupLink("RelationshipType","experimental_factor")%>,plant tissue type and experiment category <%=DefinitionsLookup.createPopupLink("RelationshipType","experiment_category")%>. Results can be limited to specific array technologies (e.g. cDNA array or Affymetrix GeneChips). Use this search to find specific microarray experiments or sets of related experiments.<p>
<p><a href="/servlets/Search?action=new_search&type=expression" target="blank">Microarray Expression Search</a>: The expression search can be used to find the expression of one or more genes across multiple microarray experiments. Use gene names, locus identifiers or GenBank accessions to find expression values and experiment details. Searching can be limited to include only genes having a specific expression value (fold increase or absolute expression) or by experimental conditions.</p>
<p><a href="/tools/bulk/microarray/index.jsp" target="blank">Microarray Element Search</a>: Given a set of locus identifiers, the microarray element search can be used to find arrays containing the genes and the corresponding experimental data. Alternatively, upload a list of array elements to find the corresponding loci and experiments. The text only option can be used to generate lists of mappings between array elements and locus identifiers.</p>
<p>Microarray Expression Viewer: The expression viewer is used to find genes with similar expression patterns across a series of related experiments. The expression viewer can be accessed from the Microarray Element search results or the Array Element detail pages<a href="/servlets/TairObject?id=6160&type=array_element" target="blank">(see an example detail page)</a>. Currently this feature is only available for clustered experiments from the Arabidopsis Functional Genomics Consortium.</p>
<p><a href="/tools/bulk/microarray/analysis/index.jsp" target="blank">Large Scale Analysis of Gene Expression in Arabidopsis</a>: In an effort to describe global patterns of gene expression, TAIR has been analyzing publically available microarray experiments to identify regulatory networks. Clustered data from a variety of experiments can be viewed using either of two interactive tools. VxInsight, which displays clusters as three dimensional 'mountains' or JavaTreeView which displays hierarchical cluster data.</p>
<p><a href="/tools/bulk/motiffinder/index.jsp"target="blank">Motif Analysis</a>: This tool can be used to find over-represented 6-mer sequences in sets of co-expressed genes to identify potential regulatory sequences shared by a set of genes.</p>
<p><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays" target="blank">Data in TAIR's FTP site</a>:For downloading large datasets use TAIR's File Transfer Protocol (FTP) site. Experimental data sets including descriptive information, raw and normalized values can be obtained in tab-delimited text formats. The files can be downloaded and opened in Excel or a text editor. Mappings between array elements and sequenced loci are available as tab delimited text files. The mappings are updated to reflect changes in the gene annotation.</p>
</div> <!--right column-->
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
