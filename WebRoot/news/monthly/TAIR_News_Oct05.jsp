<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h2 class="header">TAIR October 2005 News Release</h2>		

<P>
1. Genome Release 6.0
TAIR is pleased to announce the release of the latest version of the Arabidopsis genome (TAIR6) at TAIR and NCBI. 
TAIR has assumed primary responsibility for maintaining the Arabidopsis genome annotation in North America 
following TIGR's final release (TIGR5).  The latest release builds on the gene structures of the previous TIGR5 
release using new cDNA and EST data released in the intervening period as well as community input regarding 
missing and incorrectly annotated genes.
<P>
The TAIR6 release contains a total of 26,751 protein coding genes, 3,818 pseudogenes and 838 non-coding RNA 
genes (31,407 genes in all), providing the most comprehensive Arabidopsis genome annotation to date. A total 
of 437 new genes were added and nine genes were deleted. Updates were made to 973 genes including 831 updates 
to coding sequences, 14 gene splits and 7 gene merges and the addition of 1200 new splice variants.  A total of 
3159 Arabidopsis genes (10%) now have annotated splice variants.  No changes were made to the chromosome 
sequences for this release.
<P>
TAIR currently has 65,464 cDNAs and 407,975 ESTs mapped to the genome, resulting in 19,466 genes with cDNAs and 
21,899 genes with at least one cDNA and/or EST.  TAIR also has 294,071 T-DNA and transposon insertions mapped 
to the genome, with 25,466 genes containing at least one insertion (excluding insertions in the promoter).
<P>
Sequences and annotations can be viewed and searched on the updated TAIR website:<a href="http://www.arabidopsis.org"> http://www.arabidopsis.org</a>.
<P>


The fully annotated chromosome sequences in TIGR xml format, along with fasta files of cDNA, cds, genomic and 
protein sequences, and lists of added, deleted and updated genes are available from the TAIR ftp site at:
<br>
<a href="ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR6_genome_release/">ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR6_genome_release/</a>
<P>
The TAIR6 release is also available at NCBI:
<br>
<a href="http://www.ncbi.nlm.nih.gov/mapview/map_search.cgi?taxid=3702">http://www.ncbi.nlm.nih.gov/mapview/map_search.cgi?taxid=3702</a>
<P>
Fasta formatted files for all TAIR sequence analysis datasets including sets of intron, intergenic, UTR, upstream 
and downstream sequences are also available in:
<br>
<a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/">ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/</a>
<P>
Datasets are also available from TAIR's bulk download tool (paste in or upload a list of AGI identifiers 
(such as At1g01010) and download the corresponding sequences):
<br>
<a href="/tools/bulk/sequences/index.jsp">http://www.arabidopsis.org/tools/bulk/sequences/index.jsp</a>
<P>
A graphic display of the Arabidopsis sequence and annotation can be viewed using TAIR's genome browser. 
Browse the chromsomes, search for names or short sequences and view search hits on the whole genome, in a close-up 
view or on a nucleotide level:
<br>
<a href="http://tairvm09.tacc.utexas.edu/servlets/sv">http://www.arabidopsis.org/servlets/sv</a>
<P>
Our BLAST service has been updated to use the new datasets and is available from:
<br>
<a href="/Blast/">http://www.arabidopsis.org/Blast/</a>
<P>
We would like to thank all those who have contributed to the latest release, with special thanks to TIGR for their 
help in easing the transition to a TAIR annotation release and individual community members who provided additional 
information and data.
<P>
TAIR is committed to the continual improvement of Arabidopsis genome annotation and actively encourages the plant 
community to contact us with new data, corrections and suggestions.
<P>
Future releases are anticipated to be at approximately six month intervals.

<P>
2. <a href="/tools/aracyc/">AraCyc Release 2.5</a>
<P>
We continue to improve the quality and coverage of biochemical pathway data in AraCyc. In this release, 37 new 
pathways have been curated and added and 61 computationally predicted pathways were either deleted or replaced 
by new pathways which better represent the knowledge of plant metabolism in the literature. More details can 
be found in the release note (http://www.arabidopsis.org/tools/aracyc/releasenotes.jsp). AraCyc currently has 
197 pathways containing 1759 unique genes assigned to the pathways. All of the pathways have been manually 
validated for their existence in Arabidopsis, and 86% of them have support from the literature.
<P>
In addition to the enhancement of data content, the supporting software Pathway Tools
(http://bioinformatics.ai.sri.com/ptools/) has been updated. With the enhanced OmicsViewer, large scale omics 
data can now be superimposed on individual pathway diagrams that are zoomable, including displaying different 
colors (data values) for discrete isozymes. You are also able to save the generated display (including animation) 
to your local disk as an html file.
<P>
Finally we are pleased to announce that AraCyc is now an open database. You can obtain the complete AraCyc database 
flat files by simply filling out the online license agreement form at http://www.arabidopsis.org/aracyc/form.html
<P>

3. Linking to Genevestigator and NASCArrays microarray data
<P>
Direct access to microarray data from Genevestigator and NASCArrays is now provided in the External Links band of TAIR's 
locus detail pages. Loci represented in the Affymetrix arrays are linked to the results obtained using Genevestigator's 
Gene Atlas, Gene Chronologer and Response Viewer, and NASCArrays' Digital Northern and Spot History tools.
<P>
**************************************************************************************************************************

<P>
TAIR is committed to providing the best possible service to the Arabidopsis community. Should you have any questions or suggestions please contact us at <a href="mailto:curator@arabidopsis.org">curator@arabidopsis.org</a>
<P>
The TAIR Team<br>
<a href="/index.jsp"></a>
		<!-- Content goes here //--> 
<P>
<center><a href="/doc/news/breaking_news/140">Go back to TAIR News page</a></center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

