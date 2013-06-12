<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h2 class="header">TAIR February/March 2006 News Release</h2>	

The Arabidopsis Information Resource (TAIR, http://arabidopsis.org) emails our registered users regular news releases about new or updated data and tools at TAIR:
<P>

For the months of February and March 2006:

<P>

1. Homozygous SALK Insertion Lines Available at ABRC Stock Center<br />
ABRC is beginning distribution of the first of the purified ("Confirmed"), mainly homozygous, 
SALK T-DNA insertion lines from the Joe Ecker lab as well as similar lines from Wisconsion 
(Wisconsin Ds-Lox), Syngenta (SAIL) and other laboratories. There is a browsing list of 
available lines at (http://www.arabidopsis.org/abrc/catalog/tdna_confirmed_1.html).
At this point there are 1,000 homozygous lines from the Ecker lab at the Salk Institute, and 
600 purified insertion lines from other researchers. Approximately 50,000 Confirmed lines 
will be received from Salk in the next two years. The lines donated from Salk have stock 
numbers of the form "SALK_xxxxxxC," and are searchable in TAIR Germplasm Search. The 
SIGnAL Web site (http://signal.salk.edu/) displays information regarding overall progress.

<p>
2. New On-Line Payment Feature for ABRC Stock Ordering
<br >
New features have been installed in TAIR that allow payment of ABRC user fees by credit card 
through secure Web transactions. This new system should simplify payment of your user fees. 
You will be able to simply enter credit card information, and payment will be completed when 
your order is shipped. Read more at http://arabidopsis.org/doc/news/breaking_news/140

<p>
3. <a href="/portals/mutants/index.jsp">New Portal of Mutants and Mapping Resources</a><br />

This portal provides links to and information about Arabidopsis forward and reverse genetics 
resources that are available all over the world.
Two potentially very useful tables are provided: (1) A table summarizing which mapped mutations 
(i.e. SALK lines) can be visualized using which genome browser (i.e. SeqViewer, AtEnsembl, SIGnAL); 
and (2) A table summarizing the seed resources available.  We welcome your feedback on how to make 
these tables even more informative.

<p>
4. Annotations Using Plant Ontology Terms
<br />
TAIR has recently retired the Arabidopis anatomy and temporal ontologies and adopted the Plant 
Ontology (PO), developed by the Plant Ontology Consortium (POC). The PO terms describe morphology, 
anatomy and developmental stages of a generic flowering plant and are used for annotation of gene 
expression data and description of mutant phenotypes and natural variants. The PO terms can be
searched in the TAIR Keyword Browser. Most Arabidopsis developmental stage terms have been added 
as synonyms to PO terms and can still be searched in the Keyword browser.
<P>
**************************************************************************************************************************
<P>
Note: if you prefer not to receive future email updates from us, please
log in to your TAIR account and update your profile by unchecking the '
Email me monthly TAIR release notes' check box.
<P>
To view previous news releases, go to <a href="http://arabidopsis.org/doc/news/breaking_news/140">http://arabidopsis.org/doc/news/breaking_news/140</a>
<P>
<P>
TAIR is committed to providing the best possible service to the Arabidopsis community. Should you have any questions or suggestions please contact us at <a href="mailto:curator@arabidopsis.org">curator@arabidopsis.org</a>
<P>
The TAIR Team<br>
<a href="/index.jsp"></a>

<P>
<center><a href="/doc/news/breaking_news/140">Go back to TAIR News page</a></center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

