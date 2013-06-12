<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR - Genome Annotation";
String highlight = "4";
String helpfile="";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName%>" />
<jsp:param name="highlight" value="<%=highlight%>" />
<jsp:param name="helpfile" value="<%= helpfile %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Genome Annotation" />  
</jsp:include>
<div id="rightcolumn">
<!-- CONTENT IN HERE -->
<span class="mainheader">Genome Annotation</span>
<p>This page has links to information about <a href="#data">gene annotation data</a> and <a href="#viewers">graphical views of the data</a>.
</p>

<a name="top"></a>
<a name="data"></a>
<DL>
<DT>TAIR10 Gene Annotation Data</DT>
<dd>
<br />
<b>TAIR10 Genome release</b><br/>
The Arabidopsis Information Resource (TAIR) is pleased to announce the release of the latest version 
of the Arabidopsis genome annotation (TAIR10).
<br /><br />
The latest release builds upon the gene structures of the previous TAIR9 release using RNA-seq and 
proteomics datasets as well as manual updates informed by cross species alignments, peptides and 
community input regarding missing and incorrectly annotated genes.

<br />
<br />
<b>TAIR10 statistics</b><br />
The TAIR10 release contains 27,416 protein coding genes, 4827 pseudogenes or transposable element 
genes and 1359 ncRNAs (33,602 genes in all, 41,671 gene models). A total of 126 new loci and 2099 new 
gene models were added. 
<br /><br />
Eighteen percent (5885) of Arabidopsis genes now have annotated splice variants. Updates were made to 
1184 gene models of which 707 had CDS updates. There were 41 gene splits and 37 gene merges. No 
changes were made to the Arabidopsis genome assembly for the TAIR10 release. 
<br /><br />
Gene annotation utilized available proteomics data (Baerenfaller et al., 2008 and Castellana et al., 
2008) and RNA-seq data from the Ecker and Mockler labs (Lister et al. 2008, Filichkin et al. 2010). 
RNA-seq data was mapped to the Arabidopsis genome using TopHat, HashMatch or supersplat. After 
quality and low complexity filtering a total of ~200 million RNA-seq reads were successfully mapped 
to the genome. Of these, ~9 million represent spliced reads. Proteomics data and spliced RNA-seq 
reads were provided to Augustus and the resulting gene models categorised and manually reviewed. 
Validated gene updates, novel genes and novel splice variants were incorporated into the TAIR10 
release. Additional spliced RNA-seq reads not already incorporated into gene models by Augustus were 
supplied to TAU. The resulting TAU models were again reviewed for potential novel splice variants. 
Transcript assemblies were generated via Cufflinks using all spliced reads and unspliced reads from 
the Ecker sets. Transcript assemblies were filtered and compared to existing gene models, resulting 
in the addition of 56 novel genes. Additional new proteome data provided to us by Katja Baerenfaller 
was used to directly update 24 gene models.
<br /><br />
Gene models created using the Gnomon pipeline were provided to TAIR by NCBI. Reanalysis of these 
models for TAIR10 resulted in 11 additional novel genes, 67 additional alternative splice variants 
and 178 updates to existing genes.  
<br />
<br />

<b>Genome assembly updates (done for TAIR9)</b><br />
In agreement with our 
<a href="/doc/portals/genAnnotation/gene_structural_annotation/ref_genome_sequence/11413">reference genome policy</a>
corrections to the reference assembly were only made if supported by at least two independently derived 
sequence libraries from the Columbia ecotype.  The following updates were made to the chromosome 
sequences for the TAIR9 release:
<br /><br />
227 single nucleotide substitutions were made to the assembly sequence based on re-sequencing data 
provided by Richard Clark (Ossowski et al. 2008) and Joe Ecker. 
<br /><br />
341 indels were made to the assembly sequence based on re-sequencing data provided by Richard Clark 
and EST and cDNA sequences deposited in Genbank that supported the insertion/deletion.
<br /><br />
14 regions previously identified in TAIR8 as either vector, E.coli or rice contamination, and where 
the existing sequence had been substituted with the equivalent number of IUPAC ambiguity code 'N's 
were standardized (via deletion) to a set size of 100bp. 
<br /><br />
All five nuclear chromosomes were updated for TAIR9 details of the golden path length of each 
chromosome can be found at 
http://www.arabidopsis.org/portals/genAnnotation/gene_structural_annotation/agicomplete.jsp
<br /><br />
Further details of these assembly changes and earlier TAIR8 updates can be found at 
ftp://ftp.arabidopsis.org/home/tair/Sequences/whole_chromosomes/
<br /><br />
Assembly updates and gap information can also be viewed in TAIRs GBrowse (see Assembly tracks section).
<br /><br />
We would like to thank all those who contributed to the latest release by providing submissions for 
new and incorrectly annotated genes. 
<br /><br />
TAIR wishes to thank Cornell University for use of the computer clusters at the Cornell Center for 
Advanced Computing (CAC).
<br /><br />

<b>Data availability</b><br />
The fully annotated chromosome sequences in TIGR xml format or GFF format, along with Fasta files of 
cDNA, CDS, genomic and protein sequences, and lists of added, deleted and updated genes are available 
from the <a href="ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR9_genome_release/">TAIR ftp site.</a>
<br /><br />
Previous TIGR annotation is available from both the 
<a href="ftp://ftp.tigr.org/pub/data/a_thaliana/ath1/">TIGR FTP site</a> and 
<a href="ftp://ftp.arabidopsis.org/home/tair/Genes/">TAIR FTP site</a>. For a summary 
of the different genome version statistics see table 
<a href="/portals/genAnnotation/gene_structural_annotation/annotation_data.jsp#TIGR">All Genome Versions Statistics</a>.
<br /><br />
Fasta formatted files for all TAIR sequence analysis datasets including sets of intron, 
intergenic, UTR, upstream and downstream sequences are also available in the 
<a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/TAIR9_blastsets">blast datasets directory</a>.
<br /><br />
Datasets are also available from <a href="/tools/bulk/sequences/index.jsp">TAIR's Bulk Download tool</a>; 
paste in or upload a list of AGI identifiers (such as At1g01010) and download the corresponding sequences.
<br /><br />
A graphic display of the Arabidopsis sequence and annotation can be viewed using 
TAIR's genome browsers <a href="/cgi-bin/gbrowse/arabidopsis/">GBrowse</a> and 
<a href="http://tairvm09.tacc.utexas.edu/servlets/sv">Seqviewer</a>.
<br /><br />

<b>Transposon genes and Transposable elements</b><br />

Prior to TAIR8 all non transposon related pseudogenes and transposon genes were categorised as locus 
type pseudogene. For TAIR8, transposon related genes were reclassified into a distinct transposable 
element gene class.
<br /><br />
Transposable element annotations provided by Hadi Quesneville were combined with pre-existing 
annotations to create a composite set of Arabidopsis transposons. These have been assigned a unique 
identifier (e.g. AT3TE53245) that indicates relative position on the chromosome. Under defined 
criteria (<a href="ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR8_genome_release/">see additional 
readme-transposons</a>) we have associated transposons to overlapping transposable element genes e.g. 
genes AT3G32022, AT3G32024, AT3G32026, AT3G32027 and AT3G32028 are associated to transposon 
AT3TE53245. Transposons can be viewed in TAIR's <a href="/cgi-bin/gbrowse/arabidopsis/">GBrowse</a> 
and additional information can be found on the Transposon and Transposon family detail pages.
</dd>

<p>
<jsp:include page="/portals/genAnnotation/genome_statistics.jsp" flush ="true">
<jsp:param name="GraphName" value="Genome Statistics" />  
</jsp:include>
</p>

<p>
<jsp:include page="/portals/genAnnotation/genome_version_statistics.jsp" flush ="true">
<jsp:param name="GraphName" value="Genome Version Statistics" />  
</jsp:include>
</p>


</DL>
</DL>
<P>
<p>Back to <a href="#top">top</a></p>
<a name="viewers"></a>
<DL>
<DT>Graphical Views of Annotation Data</DT>
<DD>
<DL>
<dt><a href="/cgi-bin/gbrowse/arabidopsis/">TAIR GBrowse </a></dt>
<dd>Search or browse a map of the Arabidopsis genome (including genes, cDNAs and ESTs, insertion mutants, SNPs, markers, BACs, VISTA sequence similarity plots and more) or upload your own annotation track. Tracks can be easily customized by turning on and off specific data types, collapsing and expanding tracks, or changing track order.</dd> 

<DT><a href="http:/servlets/sv">TAIR SeqViewer</a>
<DD>A graphic display of the latest Arabidopsis sequence and annotation can be viewed using TAIRs genome browser. Browse the chromosomes, search for names or short sequences and view search hits on the whole genome, in a close-up view or on a nucleotide level.

<DT><a href="http:/servlets/mapper">TAIR MapViewer</a>
<DD>Displays ORFs at zoom levels of 200x and higher, and allows wildcard and alias searching on clone names, ORF names, genes and markers.

<DT><a href="http://www.ncbi.nlm.nih.gov/mapview/map_search.cgi?taxid=3702">NCBI Map Viewer</a>
<DD>Download and view nucleotide, protein and genomic sequences from the latest Arabidopsis genome release.
</DL>
<DL>
<DT>Other available Arabidopsis genome browsers include:
<DT><a href="http://www.tigr.org/tdb/e2k1/ath1/ath1.shtml">TIGR AGAD</a>
<DT><a href="http://mips.gsf.de/proj/thal/db/index.html">MIPs MATDB</a>
<DT><a href="http://atensembl.arabidopsis.info/">NASC Ensembl</a>
<DT><a href="http://atidb.org/cgi-perl/gbrowse/atibrowse">ATIDB</a>
<DT><a href="http://www.gramene.org/Arabidopsis_thaliana/"</a>
</DL>
<DL>
Only TAIR and NCBI browsers are guaranteed to show the latest genome release please check the respective web site for details of the assembly and annotation release utilised.

</DL>
</DL>
<center>Last modified on June 15, 2009</center>

</div><!--right column-->
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

