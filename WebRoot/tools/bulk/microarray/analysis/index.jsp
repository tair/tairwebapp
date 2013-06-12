<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("Large-Scale Analysis of the Arabidopsis Microarray Data at TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("2") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("/help/helppages/microarray_readme.jsp") %>' />
</jsp:include>
  <span class="header">Large-Scale Analysis of the Arabidopsis Microarray Data at TAIR</span>
<br>

<br>
Analysis of gene expression using DNA microarrays has become one of the most widely used, 
large-scale experimental methods for measuring the changes of a biological system. 
We analyzed publicly available Arabidopsis microarray data generated mostly by large, 
high-throughput projects, such as the Arabidopsis Functional Genomics Consortium (AFGC) in the US 
and AtGenExpress Consortium in Europe. Two separate 'megacluster' compendiums consisting of data 
from 397 AFGC cDNA microarrays and 1436 Affymetrix ATH1 (25K) high-density oligonucleotide arrays 
were constructed. Preliminary results and datasets from the project can be 
found  <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/analyzed_data/" 
target="_blank">here</a>. We are also preparing a manuscript which describes the work in more details. 

<p>In brief, 
the pre-processed cDNA microarray data were obtained following these steps:
<ol>
<li>Start with all publicly available Arabidopsis experiments in SMD (534). 
<li>Remove technical/quality assurance experiments (18).
<li>Remove experiments with small-size, specialized (pathogen-related) arrays (45). 
<li>Remove arrays that have more than half the intensity values negative or zero after background subtraction (2).
<li>Normalize the data using print-tip-group 'lowess' method. This step has practically removed spatial bias on all arrays 
	that had it before (57), and reduced plate bias. 
<li>Remove arrays that had strong plate bias even after the 'lowess' normalization (72).
<li>If any spot was flagged (bad) in an experiment its data for that experiment were excluded from further analysis.
<li>Include only array elements that had intensity values >= 350 in both channels after background subtraction, 
	and non-null values in at least 80% of all compared experiments.
</ol>	
</p>

<p>The Affymetrix GeneChip&reg; data were obtained following these steps:
<ol>
<li>Start with 1436 Affymetrix Arabidopsis 25K arrays obtained from NASCArrays and AtGenExpress.
<li>Normalize the data using the robust multi-array average (RMA) method.
</ol>	 

In addition to the pre-processed datasets, which can be further analyzed by different data mining programs, 
we provide clustered, ready-to-explore microarray data for the software available for download from TAIR. 
At present, these include data for VxInsight&reg;
and Java TreeView</a>. 

<br>
<a name="vx"></a>
<p>
<center><IMG SRC="../../../../images/vx.jpg"></center>

<p>VxInsight&reg; is data-mining software developed and patented by 
<a href="http://www.sandia.gov" target="_blank">Sandia National Laboratories</a>. We used VxInsight&reg; for clustering 
normalized data sets and visualizing patterns of gene expression as mountain terrain maps. It is available free of charge 
for analysis of the gene expression datasets from TAIR. For more information on VxInsight&reg;, 
click <a href="http://www.cs.sandia.gov/projects/VxInsight.html" target="_blank">here</a>.
TAIR datasets for VxInsight&reg; can be found <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/analyzed_data/VxInsight/" 
target="_blank">here</a>. The data were obtained by clustering gene expression values 
using gene pair similarities based on the t-statistic of Pearson's correlation coefficient. Only twenty strongest positive 
correlations were recorded for each array element present in the dataset.  To download
the free of charge, key-locked version of VxInsight&reg; (works only with TAIR datasets) follow this 
<a href="ftp://ftp.arabidopsis.org/home/tair/Software/VxInsight/" target="_blank">link</a>. 
The program is currently available only for Windows. 
</p>

<br>
<a name="jtv"></a>
<p><center><IMG SRC="../../../../images/jtv.jpg"></center>

<p>Java TreeView is an open source, cross-platform gene expression visualization tool for interactive 
display of clustered microarray data, similar to Eisen's TreeView program. It was developed by Alok Saldanha 
at Stanford University. For more information on Java TreeView, click 
<a href="http://genetics.stanford.edu/~alok/TreeView/docs/overview.html" target="_blank">here</a>. We made some minor 
modifications to the software such as preset URLs to <a href="../index.html" target="_blank">Microarray Elements Search tool</a>. 
TAIR datasets for Java TreeView can be found <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/analyzed_data/TreeView/" 
target="_blank">here</a>. The data were obtained using hierarchical clustering algorithms implemented in Eisen's 
Cluster program. The standard Pearson correlation and average linkage were used. To download Java TreeView follow this 
<a href="ftp://ftp.arabidopsis.org/home/tair/Software/TreeView/" target="_blank">link</a>.</p> 

<p>
<center>Last modified on October 14, 2005</center>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
