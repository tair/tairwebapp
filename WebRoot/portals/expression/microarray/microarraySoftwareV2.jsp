<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "TAIR - Gene Expression - Analysis and Visualization Software";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11304" />
</jsp:include>

<jsp:include page="/jsp/includes/expressionSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Data Analysis Tools"/>  
</jsp:include>

		<div id="rightcolumn">
		<span class="mainheader">Data Analysis Tools</span>
			<dl>

					<dt>Clustering</dt>
						<dd class="d_1">
						<dl>
							
							
							<dt><a href="http://www.broad.mit.edu/cancer/software/genecluster2/gc2.html">GeneCluster</a></dt>
							<dd>Gene expression analysis at Whitehead/MIT Center for Genome Research (Windows, Mac, Unix).</dd>

                                                       <dt><a href="http://www.molmine.com">J-Express 2.0</a>
                                                        <dd>Portable software package for multidimensional scaling, clustering, andvisualization of microarray data.

							<dt><a href="http://gscope.gsc.riken.go.jp/aboutGSCope.htm">GSCope</a></dt>
							<dd>SOM custering and Gene-Ontology Analysis of microarray data</dd>
							
							<dt><a href="http://rana.lbl.gov/EisenSoftware.htm">ScanAlyze, Cluster, TreeView</a></dt>
							<dd>Gene analysis software from the Eisen Lab</dd>
		
							
                                                        <dt><a href="http://www.viswave.com/products.html">VxInsight</a></dt>
                                                        <dd>Cluster data-mining software from VisWave (Windows 95/98/ME/2000/XP)</dd>

							<dt><a href="http://genome-www.stanford.edu/%7Esherlock/cluster.html">XCluster</a></dt>
							<dd>Expression clustering program similar to Cluster (Unix/Linux/Macintosh/Windows)</dd>
						</dl>
						</dd>
					<dt>Data analysis and visualization</dt>
						<dd class="d_1">
						<dl>
							<dt><a href="http://www.biodiscovery.com/">BioDiscovery</a>
							<dd>Image analysis, data management and tracking and data analysis software (Windows 95/98/NT4).
							
							<dt><a href="http://www.arexdb.org/software.jsp">ChipEnrich</a>
							<dd>This software can be used to identify the biological significance of genes associated with dominant expression patterns. This software is used to identify statistically significant enriched Gene Ontology (GO) categories, transcription factor families, and biological processes which have been identified via microarray analysis. A detailed description of the software (<a href="http://www.springerlink.com/content/mq82088r2423373x/" target= "_blank">Orlando et al 2009</a>) and an example of its use (<a href= "http://www.sciencemag.org/cgi/content/abstract/318/5851/801" target= "_blank">Brady 2007</a>) are available.

							<dt><a href="http://akt.ucsf.edu/EGAN">EGAN: Exploratory Gene Association Networks</a>
							<dd>EGAN is a software tool that allows a bench biologist to visualize and interpret the results of multiple types of high-throughput exploratory assays in an interactive hypergraph of genes, relationships and meta-data. 
							
							<dt><a href="http://www.predictivepatterns.com">GeneLinker</a>
                                                        <dd>Gene expression and proteomics analysis software.</>
							<dt><a href="http://www.sigenetics.com/Products/GeneSpring/index.html">GeneSpring</a>
							<dd>Gene expression analysis software from Silicon Genetics (Windows 95/98/NT, MacOS 7.6.1, Unix).
							<dt><a href="http://ocimumbio.com/products/products_gw.htm">GenowizT</a>
							<dd>Designed to store, process and visualize gene expression data. (Windows, Macintosh, Unix, Linux, Solaris).

                                                     	 <dt><a href="http://www.genesifter.net/web/index.html">Gene Sifter</a></dt>
                                                        <dd>Combines data management and analysis tools.</dd>

<dt><a href="http://www.molmine.com">J-Express 2.0</a></dt>
                                                        <dd>Portable software package for multidimensional scaling, clustering, and visualization of microarray data.</dd>
                                                         <dt><a href="http://www.lecb.ncifcrf.gov/MAExplorer/">Microarray Explorer</a></dt>
                                                        <dd>(MAExplorer) Java-based data-mining facility for cDNA microarray databases. (Windows, Mac OS, Solaris, Linux, and Other Java-ena</dd>

							
							<dt><a href="http://www.tigr.org/softlab/">Microarray tools from TIGR</a></dt>
                                                        <dd>Including MIDAS, MADAM, MEV and ArrayViewer</dd>


                                                        <dt><a href="http://www.stat.Berkeley.EDU/users/terry/zarray/Html/soft.html">Software from Terry Speed's Group</a></dt>
                                                        <dd>Software for data analysis and visualization, including R packages</dd>
                        
                        
                                                	<dt><a href="http://www.partek.com">Partek Pro software</a></dt>
							<dd>Data mining, statistical analysis and visualization of microarray data</dd>
 
                                                        <dt><a href="http://bbc.botany.utoronto.ca/ntools/cgi-bin/BAR_Promomer.cgi">Promomer</a> - <a href="http://bbc.botany.utoronto.ca/">BBC</a>
							<dd>Identify over-represented n-mer 'words' in the promoter of a gene of interest, or in promoters of co-regulated genes.</dd>

                        <dt><a href="http://www.qlucore.com/">Qlucore</a></dt>
                        <dd>Using Qlucore Omics Explorer you shorten analysis time and add more creativity to your research, thanks to 3D graphics, point and click user interface and statistical analysis. The software gives you freedom to explore and evaluate biological key information directly on screen, combining measured data with user expertise.</dd>

						<dt><a href="http://rsat.ulb.ac.be/rsat/">Regulatory Sequence Analysis Tools (RSAT)</a></dt>
                        <dd>Provides a series of modular programs for detection of regulatory signals in non-coding sequences.</dd>
							<dt><a href="http://www.silicocyte.com">SilicoCyte</a></dt>
    		 					<dd>Image analysis, data annotation, data analysis, data management and project management software (Windows XP, 2000)</dd>

                                                        <dt><a href="http://www.spotfire.com/Default.asp">Spotfire Pro</a></dt>
							<dd>Spotfire Pro from Spotfire, Inc.</dd>

						</dl>
						</dd>

					<dt>Functional classification</dt>
						<dd class="d_1">
                                                <dl>
							<dt><a href="http://bbc.botany.utoronto.ca/ntools/cgi-bin/ntools_classification_superviewer.cgi"> Classification SuperViewer</a> - <a href="http://bbc.botany.utoronto.ca/">BBC</a>
							<dd>Generates an overview of functional classification based on the MIPS database.</dd>
							<dt><a href="http://www.geneontology.org/GO.tools.microarray.shtml">Gene Ontology-based classification tools</a></dt>
							<dd> List of software tools that make use of the GO ontologies or the gene associations provided by Consortium members.</dd>

						 </dl>
                                                </dd>

                                        <dt>Pathway Visualization</dt>
                                                <dd class="d_1">
                                                <dl>

							<dt><a href="http://www.plantcyc.org:1555/expression.html">Pathway Tools Omics Viewer</a></dt>
							<dd>Displays expression or proteomics data onto the Aracyc metabolic diagram.</dd>

							<dt><a href="https://gabi.rzpd.de/projects/MapMan/">MapMan</a></dt>
							<dd>Download software for displaying your datasets on pathway diagrams or view some sample data sets.</dd>
						</dl>
						</dd>
			</dl>
		</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
