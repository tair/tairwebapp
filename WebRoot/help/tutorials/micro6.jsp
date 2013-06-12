<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "TAIR Microarray Tutoriall";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="2025" />
</jsp:include>

<jsp:include page="/jsp/includes/microtutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Finding potential regulatory sequences in co-clustered genes"/>
</jsp:include>

<div id="rightcolumn">


<!--content goes  here//-->
<span class="mainheader">Finding putative regulatory regions in a cluster of co-expressed genes</span>
<p>Genes which are co-expressed may be co-regulated. Cluster analysis can reveal sets of genes that show similar responses to environmental stresses or may be involved in a single biochemical pathway. Co-regulated genes likely each contain regulatory sequences (cis-elements) which will be shared among these genes. The Motif Finder was designed to identify over-represented six-mer sequences in a defined subset of sequences. These over-representative six-mers may correspond to cis-regulatory elements.</p>
<p>The Motif finder works by taking a set of sequences, such as 1000 base pair upstream of the coding region for a set of co-expressed genes, and breaks up the entire sequence into six letter 'words'. It then looks for all occurrences of these 'words' in all of the query sequences and then compares the frequencies of the six mer 'words' within the query sequence and the entire genome. Six-mer sequences which are overrepresented in the query set, may represent a potential cis-element which can then be tested experimentally.</p>
<ol>
<li>From the home page or navigation bar, go to the section marked 'Tools' and click on the link to the <a href="/tools/bulk/motiffinder/index.jsp" target="_blank">Motif Analysis</a>.</li>
<li>Enter a list of locus identifiers in the text entry box. The locus identifiers will be the co-expressed loci.</li>
<li>Alternatively, you can upload a file of sequences in FASTA format or a set of locus identifiers.Try this using either of the following sample datasets: <a href="cis_locus_sample.txt" target="_blank">[List of Locus IDs]</a> or <a href="cis_fasta_sample.txt" target="_blank">List of FASTA sequences]</a></li>
<p class="sm">NOTE: Ensure that each locus identifier or sequence is represented only once in your list.</p>
<p class="sm">If you chose to upload your own FASTA sequences you should be aware that you can only make comparisons to the 500 or 1000 base pairs upstream of the genes coding region. This tool does not allow you to compare intron vs. intron sequences. You can find sixmers that occur more often in introns vs. 5' upstream sequences.</p>
<li>Select the dataset to compare against (500 or 1000 base pairs upstream).</li>
<p class="sm">For experimentally verified genes, the upstream sequences start from the transcription start site. For predicted genes (where the transcriptional start site is not known) this upstream sequence starts from the translational start site (e.g.the first ATG).</p>
<li>Choose the output format: text or HTML</li>
</ol>
<p class="sm"> Choose the text format if you intend to download the results onto your personal computer.<p>
<p>Only oligos appearing in 3 or more of the query sequences are reported. The results are sorted according to P-value with the best results at the top, followed by lower scoring oligos. Each row in the results list includes the following information:
<ul>
<li>Oligomer sequence</li>
<li>Total number of times the oligomer appears in the query set.</li>
<li>Total number of times the oligomer appears in the same length of sequence (500 or 1000 upstream) in the entire genome.</li>
<li>Number of sequences in the query set that contain the oligo. This may be greater than the total number of query sequences if the oligomer is represented more than once in a sequence.</li>
<li>A ratio of the number of sequence in the genome containing the oligomer divided by the total number of sequences in the genome dataset.</li>
<li>p-value: This is a measure of the significance of the match and reflects the probability of the oligomer sequence occurring randomly in the genome. More significant matches have a lower score (i.e. closer to zero).</li>
<li>List of query sequences containing the oligomer.</li>
</ul>
</div> <!--right column-->
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>