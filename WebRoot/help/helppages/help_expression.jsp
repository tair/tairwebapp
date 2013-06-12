<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">

<html><head><title>Expression Viewer Help </title></head>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("microarray_readme.jsp");
setNext("");
writeHeader();
</script>
<title>TAIR:Expression Viewer Help</title>
</head>
<!-- End of header -->


<h2 align=center>TAIR Help: Expression Viewer</h2>

<p>
<h4>Contents</h4>
<ul>
<li><a href="#description">Description</a>
<li><a href="#interface">Understanding and utilizing the expression data display</a>
<li><a href="#redraw">Redrawing clusters with a new reference gene</a>
<li><a href="#datasets">Available datasets</a>
<li><a href="#data">How to obtain experiment data from the AFGC experiments</a>
<li><a href="#selection">Data preparation and gene selection criteria</a>
</ul>
<p>
<br>
<h4><a name="description"></a>Description</h4>
<p>
The Expression Viewer provides easy access to the results of the
Arabidopsis Functional Genomics Consortium (AFGC) data.  The results
from several hundred microarray slides are available via this viewer.
This tool was created to provide the user with a visual display of gene expression for selected genes in selected biologically/functionally related experiments. To create the data set used by the Expression Viewer, public AFGC experiments were grouped into seven categories (e.g., abiotic stress; see below for a complete listing of categories). Next all possible "distances" between genes on the  AFGC microarrays were calculated within each category and this  measure (i.e., Pearson Correlation Coefficient) was used to identify  groups of genes
with similar expression profiles within each category.  To  utilize the
Expression Viewer, the user selects a gene of interest from the <a href="/tools/bulk/microarray/index.jsp"> Microarray element search page </a>. Once the query is submitted, in the Microarray Element result page, click on the Expression Viewer link and follow the directions to view the Expression Viewer. Datasets drop down box will list the datasets for which the queried clone has the expression profile. A clone can belong in one or more datasets. The user then selects  an
experiment category (e.g., abiotic) for which s/he would like to 
view the expression profile of the selected gene. The Expression Viewer 
will return the expression profile for the selected experiment category of 
the selected gene and of up to 19 genes with similar expression profiles.   
</P>


<h4><a name="interface"></a>Understanding and utilizing the expression data display</h4>
<P>
The primary convention followed by the vast majority of microarray experiments is this:
<BLOCKQUOTE>
<STRONG><FONT COLOR="#FF0000">Red</FONT></STRONG> means the mRNA level (expression) is <STRONG><FONT COLOR="#FF0000">increased</FONT></STRONG>, relative to the standard.<BR>
<STRONG>Black</STRONG> means the mRNA level (expression) is <STRONG>unchanged</STRONG>, relative to the standard.<BR>
<STRONG><FONT COLOR="#808080">Grey</FONT></STRONG> means the mRNA level (expression) is <STRONG><FONT COLOR="#808080">missing</FONT></STRONG>, relative to the standard.<BR>
<STRONG><FONT COLOR="#00CC66">Green</FONT></STRONG> means the mRNA level (expression) is <STRONG><FONT COLOR="#00CC66">decreased</FONT></STRONG>, relative to the standard.
</BLOCKQUOTE>


<P>
Thus, the first feature displayed on the Expression page is a <STRONG>colorimetric scale bar</STRONG>, with which to determine the relative expression levels within the 2-color representation of the data.</P>

<p><img src="images/scale.1.5.gif" align=middle> </p>

<P>
Immediately below the scale bar is a table, the first row containing the clone/gene whose expression information was requested initially.  
The following 19 rows contain those genes whose expression most highly correlates with the gene of interest.</P>

<UL>
<LH>Each row contain the following columns, in order:</LH>
<LI> the <STRONG>clone ID</STRONG>.
<LI>the <STRONG>locus</STRONG> assignments for each array element/clone ID. Locus is the genomic sequence corresponding to the transcribed unit in the genome. 
The link will take you to the TAIR locus detail page where you can view all the information available on that locus. 
<LI> the <STRONG>2-color representation of the expression data</STRONG> for each clone ID, across the dataset's course.
<LI> the <STRONG>Description/TIGR Annotation</STRONG> for each locus. 
</UL>
<p></P>

<h4><a name="redraw"></a>Viewing cluster data for related genes</h4>
<BR>
<font class="cont">Within the set of cluster results, you can choose to redraw 
the clusters using a different gene as the reference. For example, if you want 
to know which genes cluster with the gene most similar to your gene of interest. 
Click anywhere in the color band for that gene and the expression viewer will 
display a new set of cluster data (again limited to the closest 20 genes) with 
the new gene as the reference.</font> 
<P>
<H4><a name="datasets">Available datasets</a></H4>
<P>  
<STRONG>Abiotic treatment:</STRONG> displays the expression of genes from experiments in which metals, salt, nutrient, temperature, water, hypoxia/anoxia, wounding, electrical and other kinds of environmental stresses were applied to plants.
<BR>
  <STRONG>Biotic treatment:</STRONG> displays the expression of genes from experiments 
  in which plants are inoculated with pathogens (e.g., bacteria, fungus, virus, 
  nematodes) or attacked by insects, and from experiments performed on diseased 
  tissues, or plants undergoing death/apoptosis. <BR>
  <STRONG>Chemical treatment:</STRONG> presents the expression of genes selected from experiments in which plants were treated with various chemicals. 
<BR>
  <STRONG>Ecotype comparison:</STRONG> monitors the expression of genes in experiments 
  involving various ecotype comparisons such as Columbia vs Wassilewskija. <BR>
  <STRONG>Hormone treatment:</STRONG> presents the expression of genes selected from experiments in which plants were treated with various hormones. 
<BR><STRONG>Non-wildtype comparison:</STRONG> presents the expression profile of genes in experiments in which mutant plants are compared with with the wild type. 
<BR><STRONG>Nutrient treatment:</STRONG> presents the expression of genes selected from experiments in which plants were treated with various nutrients. 
<BR><STRONG>Tissue comparison:</STRONG> displays expression of genes from experiments that compare plant anatomical features or structures.
<P>


<h4><a name="data"></a>How to obtain experiment data from the AFGC experiments</h4>
<P>
Click on the header with the corresponding experiment name, and you should see an experiment detail page in another opened browser window and download the data.
Alternatively, you can access all microarray experiments in TAIR database, following this <a href="/servlets/Search?type=expr&search_action=new_search" target="_blank">link</a>. 

<h4><a name="selection"></a>Data preparation and gene selection criteria</h4>
<P>
<OL>
<LI>Start with all publicly available Arabidopsis experiments in TAIR (516). 
<LI>Remove arrays that have more than half the intensity values negative or zero after background subtraction (2). 
<LI>Normalize data using print-tip-group 'lowess' method. This step has practically removed spatial bias on all arrays that had it before (57), and reduced plate bias.  
<LI>If any spot was flagged (bad) in an experiment its data for that experiment were excluded from further analysis. 
<LI>Include only array elements that had intensity values >= 350 in both channels after background subtraction. 
</OL>

<!-- footer using external javascript file starts here -->
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("microarray_readme.jsp");
setNext("");
writeFooter();
</script>
<!-- end footer -->
</body></html>

















