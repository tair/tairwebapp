<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h1>TAIR October/November News Release</h1>		

<P>

For the months of October and November 2004:<BR>

1. New data<BR />
1.1 <a href="/portals/expression/microarray/ATGenExpress.jsp">AtGenExpress data</a><BR />
AtGenExpress data set has been expanded to include 1035 slides from 23
experiments. Recent additions from 22 experiments comprising 798 slides
are now available for search and download from Microarray Experiments
Search. In addition, expression values for the Developmental Atlas
experiment from the Weigel lab (237 slides) are now searchable from
Microarray Expression Search. Finally, the overall progress and status of
the AtGenExpress project and data avilability from TAIR and other
resources are available online


<P>
<a href="/servlets/Search?type=expr&search_action=new_search">Microarray Experiment Search:</a>
<P>

<a href="/servlets/Search?action=new_search&type=expression">Microarray Expression Search:</a>

<P>
1.2 Functional annotations<br />
TAIR has been accepting functional annotations (annotations of genes with
Gene Ontology and TAIR ontology controlled vocabulary terms) from users.
The most recent submissions from Jeong Hoe Kim (MSU-DOE Plant Research
Laboratory), Masato Nakai (Osaka University), Kentaro Inoue (UC-Davis) and
Steffen Greiner (Botanisches Institut-Heidelberg) are now viewable from
TAIR.
<P>
Users are highly encouraged to submit functional annotations from their
current or past work to TAIR using the standard submission form available
at http://www.arabidopsis.org/doc/submit/functional_annotation/123.
<P>

2. Updated tools<BR />
<a href="/tools/aracyc/">AraCyc</a>
<P>
In addition to overlaying microarray expression data onto the metabolic
overview map you can now overlay other types of data such as compounds
from metabolic profiling experiments using the Omics Viewer (formerly
Expression Viewer). Find out more at
<a href="http://www.plantcyc.org:1555/expression.html">http://www.plantcyc.org:1555/expression.html</a>. The metabolic overview
map is updated so that pathways are automatically grouped into major
metabolic categories based on their classification, and that the
categories are then highlighted by shaded box. Mouse-over a shaded box to
see info about the category.
<P>

3. Submission for structural annotations<br />
Do you have experimental evidence that a gene structure at TAIR is
incorrect?  If so, please consider submitting your information to GenBank
(cDNA sequences) or TAIR (other types of evidence including rtPCR data) by
January 1, 2005 so that the information may be used in updating the
corresponding gene for TAIR's first genome release in early 2005.  To send
evidence of incorrect structural annotations to TAIR, please email the
details to curator@arabidopsis.org or send us a completed submission form
(available at http://arabidopsis.org/submit/gene_annotation.submission.jsp).

<P>
**************************************************************************************************************************
<P>
Note: if you prefer not to receive future email updates from us, please
log in to your TAIR account and update your profile by unchecking the '
Email me monthly TAIR release notes' check box.
<P>
To view previous news releases, go to <a href="/doc/news/breaking_news/140">http://arabidopsis.org/doc/news/breaking_news/140</a>
<P>
<P>
TAIR is committed to providing the best possible service to the Arabidopsis community. Should you have any questions or suggestions please contact us at <a href="mailto:curator@arabidopsis.org">curator@arabidopsis.org</a>
<P>
The TAIR Team<br>
<a href="/index.jsp"></a>
		<!-- Content goes here //--> 
<P>
<center><a href="/doc/news/breaking_news/140">Go back to TAIR News page</a></center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />



