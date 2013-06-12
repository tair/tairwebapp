<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h1>TAIR July and August News Release</h1>		
Dear Arabidopsis Researchers:<br>
<P>
The Arabidopsis Information Resource (<a href="/index.jsp">TAIR</a>) emails TAIR registered users a monthly news release at the beginning of each month. The news release includes information on new or updated data and software.<BR>
<P>
*********************************************************************************************<P>
For the past two months through 8/31/2003:<br>
1. New data:<br>
1.1 
<a href = "/info/genefamily/genefamily.html">Gene Families</a><br>
<p>
We have recently received two additional gene family data sets, including
the acyl lipid metabolism gene family and the plant defensin gene family.
So far, there are 736 gene families including 5246 genes listed on the
TAIR site. In addition, genes that are grouped under each gene family have
been annotated to the proper Gene Ontology (GO) controlled vocabulary
terms based on the evidence provided by the submitters.
<P>
More than 30 researchers or groups have kindly submitted their gene family
data. We encourage all users of TAIR to share your gene family data with
the research community. To submit data for a gene family, please format
your data as described in the  <a href="/submit/genefamily_submission.jsp">Gene Family Data Submission page</a>

<p>
1.2 New Datasets
<P>
We have added 3 new BLAST datasets, AGI 5' UTRs, AGI 3' UTRs, and Plant
proteins, containing 5' and 3' UTR sequences of cDNA-verified TIGR gene
models and all higher plant protein sequences, respectively. The datasets
are selectable in our BLAST, FASTA, and PATMATCH tools. They are also
available from the Bulk Sequence Download, and are downloadable in TAIR's
FTP site (under Sequences/blast_datasets/).

<P>
1.3 Additional SALK T-DNA insertion data
<P>
An additional 5837 T-DNA insertion sequences were received from the SALK
Institute. 3253 of them are mapped to 2641 unique loci. Thus far, 20850
loci are associated with SALK T-DNA insertion lines.
<P>
The SALK T-DNA data are searchable using TAIR's Polymorphism Search. The
T-DNAs are also added to the "Insertion Flank Sequences" dataset so that
you can find out whether your sequence has a SALK T-DNA insertion by using
TAIR's Blast, WU-Blast, Fasta, or PatMatch tools.
<P>
1.4 MASC SNP data
<P>
Thanks to the data submission from the GABI MASC SNP project, 8594
polymorphisms have been incorporated into TAIR and are now accessible
through our Polymorphism Search. The data represents polymorphisms between
and among 13 Arabidopsis thaliana ecotypes as well as Boechera drummondii
and Arabis lyrata.  The polymorphisms have been mapped to the TIGR 4.0
version of the genome and will be visible using the SeqViewer within the
next couple of days.  The original MASC SNP database records can be
accessed from each detail page through a hyperlink to MASC.
<P>
2. Updated Data<br>
2.1 In Microarray Expression Viewer<br>
<P>
The underlying dataset displayed with the Microarray Expression Viewer has
been updated in two ways: 1) the raw data was re-normalized using
print-tip-group 'lowess' method, which more effectively removes spatial
bias and reduces plate bias. 2) all the experiments were re-categorized
using the same set of categories as the Microarray Experiment Search.
Consequently, the clustered results visible from the Expression Viewer
have been updated.
<P>
From the Expression Viewer, you can now click on any experiment name to go
to the experiment detail page and see all information about the experiment
including biosample and hybridization details.
<p>
2.2 In Microarray Element Search Results
<P>
For all the AFGC array elements, the Microarray Element Search Results
page now contains information on average log and standard error across all
experiments. The average log column holds the average value of log base 2
of the normalized red/green ratio.
<P>
3. New tools/features
<P>
3.1 <a href="/servlets/Search?action=new_search&type=keyword">
Keyword Browser</a>
From this single entry you can either search or browse for a controlled
vocabulary term. Along with the search and browse options, you can view
term details and relationships among terms. In addition, the browser
displays links to genes, publications, microarray experiments or
annotations associated with the term or its children terms.
<P>
4. Updated tools/features
<P>
4.1 Publication Search using controlled vocabulary keywords
<P>
Search with a keyword, including the Gene Ontology (GO) terms and TAIR's
developmental stage and anatomy terms, and find publications associated to
the keyword.
<P>
4.2 Functional annotations now displayed on locus detail pages
<P>
Gene functional annotations with the controlled vocabulary terms including
the Gene Ontology (GO) and TAIR's developmental stage and anatomy terms
are displayed on locus detail pages. From here, you can view the
annotations made to all the gene models of a particular locus.
<P>
4.3 Genbank GIs are now included as a search parameter in Gene Search and
DNA Search.
<P>
************************************************************************<br>
Note: if you prefer not to receive future email updates from us, please
log in to your TAIR account and update your profile by unchecking the
'Email me monthly TAIR release notes' check box.
<p>
To view previous monthly news releases, go to<a href="/doc/news/breaking_news/140">
http://arabidopsis.org/news/news.html</a>
<P>
TAIR is committed to providing the best possible service to the Arabidopsis community. Should you have any questions or suggestions please contact us at <a href="mailto:curator@arabidopsis.org">curator@arabidopsis.org</a>
<P>
The TAIR Team <br>
<a href="/index.jsp"></a>	
	<!-- Content goes here //--> 
<P>
<center><a href="/doc/news/breaking_news/140">Go back to TAIR News page</a></center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
