<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h1>TAIR February/March News Release</h1>		

<P>

For the months of February and March 2004:<BR>
1. New data<br>
1.1 TIGR 5 Genome Release<br>
TIGR's final genome release, version 5.0, has been integrated into the
TAIR Database, SeqViewer, MapViewer and sequence analysis datasets. TIGR
5.0 contains 26,207 protein coding genes, 709 RNA coding genes (tRNAs,
rRNAs, snoRNAs and snRNAs) and 3786 pseudogenes (including some transposon
genes that were counted as protein-coding in previous releases). Nearly
15,000 genes now have full length cDNAs, over 18,000 have 5' UTRs and/or
3' UTRs and over 2000 genes have alternate splicing. Future updates to the
genome will be carried out by TAIR.
<P>
1.2 CATMA Gene-specific Sequence Tags (GSTs)<br>
Names, sequences, and genome mapping information for 24,576 GSTs from the
Complete Arabidopsis Transcriptome MicroArray (CATMA) consortium
(http://www.catma.org) have been incorporated into the TAIR database. The
GST collection, which covers most Arabidopsis genes, is used by many
groups in Europe for the production of DNA arrays for transcript profiling
experiments. The GST information is accessible via Microarray Elements
Search and Download
(<a href="/tools/bulk/microarray/">http://www.arabidopsis.org/tools/bulk/microarray/</a>) and from the TAIR FTP site
(<a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/CATMA/">ftp://ftp.arabidopsis.org/home/tair/Microarrays/CATMA/</a>).
<P>
1.3 ORF clones<BR>
A collection of cDNA clones containing the precise open-reading-frame
(ORF) regions for 1282 Arabidopsis transcription factor genes is being
donated to the Arabidopsis Biological Resource Center (ABRC). All of these
ORF clones are individually cloned into the Gateway entry vector, and the
ORF inserts can be readily transferred into other compatible Gateway
destination vectors. This Arabidopsis transcription factor proteome effort
was supported by the China National Natural Science Foundation. These
clones will be available by May 2004.
<P>
1.4 Wisconsin Ds-Lox T-DNA lines<BR>
T-DNA lines containing Ds-Lox launching pads are available from The
Arabidopsis Knockout Facility at the University of Wisconsin-Madison. This
new population was created by using a T-DNA vector that carries a Ds
transposon launch-pad and Cre/Lox recombination sites. These features can
be used to delete tandemly duplicated gene families (ca. 1/6 of the A.
thaliana genome) or to generate insertional mutations in flanking loci. A
more detailed description of the lines and instructions for obtaining
seeds are available at http://www.hort.wisc.edu/krysan/DS-Lox/. Sequence
tags from the initial installment of ca. 7,000 lines have been registered
with the SIGnAL T-DNA mapping utility maintained by Joe Ecker's group at
The Salk Institute. This data will also be incorporated into the TAIR
database in the near future.
<P>
2. Updated features/tools<BR>
2.1 Sequence Bulk Download and Analysis<Br>
<A href="http://arabidopsis.org/tools/bulk/sequences/index.jsp">http://arabidopsis.org/tools/bulk/sequences/index.jsp</a><BR>


Bulk sequence download has been updated. Sequences retrieved in FASTA
format can be sent directly to the Clustal W server at the European
Bioinformatics Institute (EBI) for performing multiple sequence
alignments.
<BR>
2.2 Microarray Expression Search<BR>
<a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression">http://arabidopsis.org/servlets/Search?action=new_search&type=expression</a><br>


Experiment parameters have been added to the Microarray Expression Search.
Now you can search microarray expression data for gene(s) in specific
experiments. For example, one can retrieve the expression profile of
gene(s) in experiments that used root tissue samples or with IAA
treatment.
<P>
The experiment detail pages have been redesigned for easier viewing.
Clicking on the Sample, Slides&Datasets, Array Design, or View All tab to
get relevant information. By clicking on the Slides&Datasets tab, you can
either download the user-normalized data or TAIR-normalized data for each
slide.
<P>
3. Updated data
Genome mapping information for all microarray elements contained on the
AFGC, Affymetrix 8K and 25K GeneChips&#174;, and CATMA arrays has been updated
with TIGR 5 genome release. The mapping information is accessible at
Microarray Elements Search and Download <a href="/tools/bulk/microarray/">(http://www.arabidopsis.org/tools/bulk/microarray/)</a>.

********************************************************************
<P>
Note: if you prefer not to receive future email updates from us, please
login your TAIR account and update your profile by unchecking the
'Email me monthly TAIR release notes' check box.
<P>
Please also note that we will not include the Arabidopsis news group, arab-gen@net.bio.net and arab-gen@dl.ac.uk in our email list in the future. If you are not a TAIR registered user and want to receive our monthly email updates please register at TAIR <BR>(<a href="/servlets/Community?action=edit&new=true&type=person">/servlets/Community?action=edit&new=true&type=person</a>). 
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
