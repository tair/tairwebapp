<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%!
String pageName = "TAIR - Gene Expression - Microarray - Public Datasets";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11300" />
</jsp:include>

<jsp:include page="/jsp/includes/expressionSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Datasets"/>  
</jsp:include>

		<div id="rightcolumn">
		<span class="mainheader">Datasets</span>
			<dl>
<dt>Search for Datasets in Microarray Repositories</dt>
						<dd class="d_1">
						<dl>
					                <dt><a href="http://www.ebi.ac.uk/arrayexpress">Array Express</a></dt>
							<dd>Contains microarrays experiments from a variety of organisms and platforms, including Arabidopsis. Provides Web-based clustering tools. Accepts data submissions.</dd>
							<dt><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?CMD=searchDB=gds">GEO Datasets</a></dt>
							<dd>Contains microarray, SAGE and MPSS datasets from from a variety of organisms and platforms, including Arabidopsis. Provides Web-based clustering tools. Accepts data submissions.<dd>
							<dt><a href="http://ssbdjc2.nottingham.ac.uk/narrays/experimentbrowse.pl">NASCArrays </a></dt>
							<dd>Contains single and double channel microarray experiments for Arabidopsis. Accepts data submissions.</dd>
							<dt><a href="http://genome-www5.stanford.edu/MicroArray/SMD/">Stanford Microarray Database</a></dt>
							<dd>Contains individual microarrays hybridizations from a variety of organisms and platforms, including Arabidopsis. Provides Web-based clustering tools. </dd>
							<dt><a href="/servlets/Search?type=expr&search_action=new_search">TAIR Experiment Search</a></dt>
							<dd>Contains single and double channel microarray experiments for Arabidopsis. Addition of new data ended in June, 2005. <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/">Retrieve all the datasets here</a>.</dd>
							
						</dl>
						</dd>

				<dt>Search for Microarray Datasets in WEB Sites</dt>

						<dd class="d_1">
						<dl>
							
							<dt><a href="http://www-biology.ucsd.edu/labs/schroeder/guardcellchips.html">ABA-dependent Guard Cell and Mesophyll Cell expression arrays</a></dt>
							<dd>Download complete datasets of guard and mesophyll cell expression arrays by Julian Schroeder, USA.</dd>

							<dt><a href="/tools/bulk/microarray/analysis/index.jsp">AFGC cluster data</a></dt>
							<dd>Download complete dataset of all-by-all cluster analysis on the AFGC data performed by TAIR.</dd>
							
						    <dt><a href="http://www.arexdb.org">AREX</a></dt>
							<dd>Stores microarray and traditional (in situ, etc) spatial gene expression data by Philip Benfey, USA</dd>
							
							<dt><a href="http://atarrays.tigr.org/arabdata.shtml">AT Array</a></dt>
							<dd>Datasets of H2O2 treatment by TIGR, USA</dd>
							
							<dt><a href="ATGenExpress.jsp">AtGenExpress</a></dt>
							<dd>A multinational coordinated effort to uncover the transcriptome of the multicellular model organism Arabidopsis thaliana</dd>
							
							<dt><a href="http://www.bpp.msu.edu/Seed/SeedArray.htm">Developing Seeds array data</a></dt>
							<dd>Supplemental material for manuscripts on Arabidopsis seed development by John Ohlrogge, USA</dd>
							
							<dt><a href="/portals/expression/microarray/ada_gcn.jsp">Gene expression in transcriptional coactivator mutants ada2b-1 and gcn5-1</a></dt>
							<dd>Data on expression affected by mutations in the Arabidopsis ADA2b and GCN5 genes by Steven Triezenberg & Michael Thomashow, USA</dd>
							
						    <dt><a href="http://aztec.stanford.edu/cold/">Low Temperature Regulatory Circuits and Gene Regulons in Higher Plants</a></dt>
							<dd>Data for the cold expression project by Michael Tomashow, USA</dd>
							
							<dt><a href="http://www.osmid.org/">Osmotic Stress Microarray Database</a></dt>
							<dd> Stress Genomics Consortium, USA</dd>
							
							<dt><a href="http://bioinformatics.med.yale.edu/pathmapa.htm">PathMAPA</a></dt>
							<dd>Data and tools integrating gene expression into pathways, Yale University, USA</dd>
							
							<dt><a href="http://www.roothairs.org" >Root Hair Gene Expression Database</a></dt>
							<dd>A site for the analysis of gene transcript accumulation in the Arabidopsis root epidermis of wild-type and mutant lines. Developed by John Schiefelbein in collaboration with Peter J. Woolf.</dd>

						</dl>
						</dd>
			</dl>
		</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
