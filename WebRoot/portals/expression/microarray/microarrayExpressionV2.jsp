<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!String pageName = "TAIR - Gene Expression - Expression Profiles";
  String cssfile = "/css/page/pagelevels.css";%>


<%@ page errorPage="/jsp/common/gen_error.jsp"
	import="org.tair.tfc.*,org.tair.querytools.*,org.tair.utilities.*,java.util.*,java.net.*"%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush="true">
	<jsp:param name="pageName" value="<%= pageName %>" />
	<jsp:param name="cssfile" value="<%=cssfile %>" />
	<jsp:param name="id" value="11301" />
</jsp:include>

<jsp:include page="/jsp/includes/expressionSidebar.jsp" flush="true">
	<jsp:param name="sidebarName" value="Data Mining Tools" />
</jsp:include>

<div id="rightcolumn">
	<span class="mainheader">Data Mining Tools</span>
	<dl id="results">

		<dd id="d_1">
			<dl>
				<dt>
					<a href="/servlets/Search?action=new_search&type=expression">TAIR
						Expression Search</a>
				</dt>
				<dd>
					Get lists of expression values for array elements and genes.
					Addition of new data ended in June, 2005.
				</dd>

				<dt>
					<a href="http://ibis.tau.ac.il/AthMod/">The Arabidopsis
						thaliana CoEXpression server</a>
				</dt>
				<dd>
					Explore the global Arabidopsis expression network described in
					<a href="http://www.biomedcentral.com/1752-0509/3/86">Atias et
						al (2009).</a> If your gene of interest is part of this network, you
					can find it and its nearest neighbors.
				</dd>

				<dt>
					<a href="http://signal.salk.edu/cgi-bin/atta">Arabidopsis
						Tiling Array Transcriptome Express Tool</a>
				</dt>
				<dd>
					Salk Institute Genomic Analysis Laboratory. Displays data from
					Yamada_Lim et al. for the Arabidopsis whole genome tiling arrays.
				</dd>


				<dt>
					<a href="http://jsp.weigelworld.org/expviz/expviz.jsp">AtGenExpress
						Visualization Tool</a>
				</dt>
				<dd>
					Visualize the expression profiles of five
					<a href="/portals/expression/microarray/ATGenExpress.jsp">AtGenExpress</a>
					datasets (Developmental, Hormones, Abiotic stress, Light and
					Pathogen).


					<dt>
					<a href="http://csbdb.mpimp-golm.mpg.de/">CSB.DB</a>
				</dt>
				<dd>
					Retrieve pair wise gene-to-gene co-responses.
				</dd>

				<dt>
					<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>
				</dt>
				<dd>
					Visualize gene expression profiles in different tissues,
					development stages, phenotypes, and treatments. Find gene
					correlations and co-expression of gene families.
				</dd>
				<dt>
					<a href="http://www.ncbi.nlm.nih.gov/geo/">GEO Profiles </a>
				</dt>
				<dd>
					Retrieve gene expression profile charts from data in GEO DataSets.
				</dd>

				<dt>
					<a href="http://bbc.botany.utoronto.ca/efp/cgi-bin/efpWeb.cgi">eFP
						Browser - BBC</a>
				
				<dd>
					Create 'electronic fluorescent protein' representations of your
					gene of interest's expression patterns based on the Schmid et al.
					(2005) Map of Arabidopsis Development.
				</dd>
				<dt>
					<a
						href="http://bbc.botany.utoronto.ca/ntools/cgi-bin/ntools_expression_angler.cgi">Expression
						Angler</a> -
					<a href="http://bbc.botany.utoronto.ca/">BBC</a>
				</dt>
				<dd>
					Find the genes with similar expression profiles to your gene of
					interest.
				</dd>
				<dt>
					<a
						href="http://bbc.botany.utoronto.ca/affydb/cgi-bin/affy_db_exprss_browser_in.cgi">Expression
						Browser</a> -
					<a href="http://bbc.botany.utoronto.ca/">BBC</a>
				</dt>
				<dd>
					Perform electronic Northerns using the gene expression data sets
					accumulated to date in the Botany Array Resource (BAR) Database or
					the data sets from the AtGenExpress Consortium.
				</dd>


				<dt>
					<a href="https://gabi.rzpd.de/projects/MapMan/">MapMan</a>
				</dt>
				<dd>
					Download software for displaying your datasets on pathway diagrams
					or view some sample data sets.
				</dd>
				<dt>
					<a href="http://affymetrix.arabidopsis.info/narrays/geneswinger.pl">NASCArrays
						Gene Swinger</a>
				</dt>
				<dd>
					Find experiments where a gene is highly variable.
				</dd>

				<dt>
					<a
						href="http://affymetrix.arabidopsis.info/narrays/twogenescatter.pl">NASCArraysTwo
						Gene Scatter Plot</a>
				
				<dd>
					Find out how two genes are co-expressed over all the experiments.
				</dd>
				<dt>
					<a href="http://affymetrix.arabidopsis.info/narrays/spothistory.pl">NASCArrays
						Spot History</a>
				
				<dd>
					Find out how a gene is expressed over all the experiments.
				</dd>
				<dt>
					<a href="http://www.plantcyc.org:1555/expression.html">Pathway
						Tools Omics Viewer</a>
				
				<dd>
					Displays expression or proteomics data onto the Aracyc metabolic
					diagram.
				
				<dt>
					<a href="http://prime.psc.riken.jp/?action=coexpression_index">Correlated
						Gene</a>
				</dt>
				<dd>
					Allows searches for correlated genes based on data released from
					the Arabidopsis Thaliana Trans-factor and cis-Element prediction
					Database
					<a href="http://www.atted.bio.titech.ac.jp/">(ATTED-II</a>).
				
				<dt>
					<a href="http://prime.psc.riken.jp/?action=agetree_index">Cluster
						Cutting</a>
				</dt>
				<dd>
					Enables users to cut out a portion of a hierarchical clustering
					tree at a specific Arabidopsis locus.
			
			</dl>
		</dd>
	</dl>
</div>
<!--right column--><jsp:include page="/jsp/includes/gen_footer.jsp" flush="true">
						<jsp:param name="cssfile"
							value='<%= URLEncoder.encode("/css/page/pagelevels.css") %>' />
					</jsp:include>