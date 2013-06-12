<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h1>TAIR May News Release</h1>		
Dear Arabidopsis Researchers:<br>
<P>
The Arabidopsis Information Resource (<a href="/index.jsp">TAIR</a>) emails TAIR registered users a monthly news release at the beginning of each month. The news release includes information on new or updated data and software.<BR>
<P>
Please see bottom for information on talks and workshops TAIR will present
at the 14th Arabidopsis conference.
<P>
*********************************************************************************************<P>
For the past month through 6/13/2003:<br>
1. New tools/features:<br>
1.1 <a href="/servlets/Search?type=general&action=new_search">Keyword search and browse</a><br>
<p>
An option for searching by keywords has been added to the General Search
section. You can now search with keyword, including the Gene Ontology (GO)
terms and TAIR's developmental stage and anatomy terms, and find genes
associated to the term, the annotation details, and publications used to
make the annotation. Open the tree view browser to view term definitions
and relationships among terms.
<p>

2. New data<br>
2.1 Additional SALK T-DNA insertion data<br>
<P>
An additional 5459 T-DNA insertion sequences were received from the Salk
Institute. 2337 of them are mapped to loci and visible using the
SeqViewer. The SALK T-DNA data are searchable from TAIR's <a href="/servlets/Search?action=new_search&type=polyallele">Polymorphism Search</a>.<br>
<p>
2.2 Transcription factor annotations from Mendel (1454 genes, Riechmann et
al. 2000. Science 290: 2105-2110) have been incorporated into TAIR. They
can be searched by keyword or gene.
<p>
3. Updated data:<br>
3.1 TIGR's 4.0 data release has been integrated into TAIR.  This release
contains 29,388 genes including 12,736 genes supported by full length
cDNAs, 2582 genes with alternatively spliced gene models, 16,707 genes
with UTRs and 2081 pseudogenes.  Gene names, descriptions, sequences, gene
features (intron, exon and UTR coordinates), map locations, protein
sequences and domain predictions for the TIGR genes have been updated. The
updated datasets are also available for TAIR's sequence analysis tools,
such as Blast and PatMatch, as well as for bulk query and download.
<P>
3.2 <a href="/tools/bulk/locushistory/index.jsp">Locus history search and download</a><br>
<p>
Locus history has been updated with TIGR's 4.0 data release. You can
search for a locus to see whether it is still valid, or was deleted,
split, or merged with another locus in the new TIGR release.
<p>
3.3 <a href="/tools/bulk/microarray/index.jsp">Microarray element search and download</a><br>
<p>
The locus assignments of microarray elements are updated with TIGR's 4.0
data release. To see more statistics of the locus assignments, go to <a href="/help/helppages/microarray_readme.jsp">HELP</a> page.
<p>
3.4 <a href="/tools/aracyc/">Aracyc</a><br>
<p>
New pathways recently added:<br>
* starch biosynthesis<br>
* starch degradation<br>
* phospholipid desaturation pathway<br>
* glycosylglyceride desaturation pathway<br>
<p>
Pathways that have been substantially updated:<br>
* sucrose degradation<br>
* triacylglycerol biosynthesis<br>
* methionine biosynthesis from homoserine<br>
<p>
4. <a href="/news/arabmeeting2003.jsp">TAIR at the 14th Arabidopsis Conference</a>: (6/20/03 to 6/24/03)<br>
<p>
4.1 Talks:<br>
TAIR has organized a genome annotation workshop on Sunday (6/22/03, from 4
to 5:30 pm) in the Union Theatre. Talks from representatives of TAIR,
TIGR, and MIPS will update the community on the current status of
structural and functional annotations of the Arabidopsis genome.
<p>
TAIR along with AFGN (Arabidopsis Functional Genomics Network), GARNet
(the UK Genomic Arabidopsis Resource Network), and others will participate
in another workshop on Sunday (6/22/03, from 4 to 5:30 pm) to introduce
the community to the international collaboration on generating Affymetrix
gene chip data. We will talk about data exchange and data access through
TAIR.
<p>
4.2 Workshops:<br>
TAIR will give two evening workshops (demos) on Sunday (6/22/03, from 7 to
8:30 pm) and Monday (6/23/03, from 8 to 9:30 pm). There will be two
concurrently held workshops for each evening: TAIR beginning user workshop
and TAIR advanced user workshop to meet the needs of different user
groups.
<p>
The beginning user workshop will orient you with the TAIR homepage, and
guide you through how to register, order seeds, submit data, and get help.
It will show you how to use TAIR's various searches to find genes,
polymorphisms, markers, microarray experiments and more. This workshop
will also introduce you to the various tools available at TAIR for genome
visualization and sequence analysis.
<p>
The advanced user workshop will focus on new and improved features at TAIR
and is designed toward more frequent TAIR users. For example, we will demo
a new visualization tool used for mining our clustered microarray data, a
new feature in the metabolic pathway database (AraCyc) that animates time
course microarray expression data onto pathways, new data types displayed
in the genome visualization tool (SeqViewer), and a new search and browse
function for viewing the hierarchy of controlled vocabularies used in Gene
Ontology (GO) annotations.
<p>
Please check out the conference guides for the locations of our workshops.
<p>
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
