<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR-Full Length cDNA Resources";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1111" />
</jsp:include>
<jsp:include page="/jsp/includes/clonesSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Full-length cDNA and ORF Collections"/>  
</jsp:include>

<div id="rightcolumn">
<!-- CONTENT IN HERE -->
<a name="top"></a>
<span class="mainheader">Full-length cDNA and ORF Collections</span>
<p>This section provides information on existing projects available to the research community aimed at producing large collections of full length cDNA clones and open reading frame (ORF) only clones. ORF clones are distinguished from other full length cDNA clones in that they typically lack UTR sequences (thus facilitating cloning into vectors). <P>The <a href="#table">table below</a> summarizes the major cDNA and ORF clone collections. Additional individual clones and smaller collections are available from the ABRC. <P>
Also in this page you will find <a href="#hints">Tips for finding FlcDNAs in TAIR</a>.</p>
<a name="table"></a>
<table border="1" summary="table describing full length cDNA and ORF clone resources">
<caption> <b>Table of Major cDNA and ORF Clone Collections</b></caption>
<tr>
<th id="header1">Source</th>
<th id="header2">Type</th>
<th id="header3">Vector(s)</th>
<th id="header4">Summary</th>
</tr>

<tr>
<td headers="header1"><a href="http://gabi.rzpd.de/materials/expressionClonesArabidopsis.shtml">Gabi Expression Clones</a></td>
<td headers="header2">cDNA</td>
<td headers="header3">pQE-30NAST-attB</td>
<td headers="header4">About 4,500 cDNA expression clones are available that were selected for protein expression. This set comprises a  Unigene set  of about 1.500 clones. Coding sequences of the UNIgene clones are predicted to be in frame with the N-terminal His-tag. </td>
<tr>
<td headers="header1"><a href="http://gabi.rzpd.de/materials/fullORFArabidopsis.shtml">Gabi Full Length ORF Clones</a></td>
<td headers="header2">full length cDNA</td>
<td headers="header3">pDONR201, pENTR3c</td>
<td headers="header4">About 1000 full-length ORF clones encoding for transcription factors. For more information see <a href="http://www.ingentaconnect.com/content/jws/cfg/2002/00000003/00000002/art00146">Paz-Ares: The REGIA Consortium (2002)</a>. </td>
</tr>
<tr>
<td headers="header1"><a href="http://www.genome.org/cgi/content/full/14/3/406">Genoscope/LifeTechnologies (GSLT)</a></td>
<td headers="header2">cDNA</td>
<td headers="header3">pCMV-Sport6</td>
<td headers="header4">single pass sequenced cDNAs available from Genoscope. Gateway&trade; compatible vector.</td>
</tr>
<tr>
<td headers="header1"><a href="http://www.evry.inra.fr/public/projects/orfeome/orfeome.html">ATOME (Arabidopsis thaliana orfeOME) 1</a></td>
<td headers="header2">ORF</td>
<td headers="header3">pDONR221</td>
<td headers="header4">PCR amplified, sequence verified ORFs from GSLT full length cDNA clones in a Gateway &trade; compatible vector.</td>
</tr>
<tr>
<td headers="header1"><a href="http://www.evry.inra.fr/public/projects/orfeome/orfeome.html">ATOME2</a></td>
<td headers="header2">ORF</td>
<td headers="header3">pDONR207</td>
<td headers="header4">PCR amplified, sequence verified ORFs from SSP ORF collection lacking short (10-50 bp) 3' UTR sequences. Cloned into Gateway &trade; compatible vector. Clones available from ABRC</td>
</tr>

<tr>
<td headers="header1"><a href="http://www.pubmedcentral.gov/articlerender.fcgi?tool=pubmed&amp;pubmedid=15208423">Peking/Yale Consortium Transcriptome</a></td>
<td headers="header2">ORF</td>
<td headers="header3">pENTR/DTOPO</td>
<td headers="header4">1282 transcription factor ORFs cloned into a Gateway &trade; vector. Nomenclature is PY+locus name (e.g.PYAT1G03790).Clones available from ABRC.</td>
</tr>
<tr>
<td headers="header1"><a href="http://www.brc.riken.jp/lab/epd/Eng/QA/RAFL.shtml">Riken</a> FlcDNA (RAFL) clones</td>
<td headers="header2">full length cDNA</td>
<td headers="header3">RAFL 2-3;RAFL4-6; RAFL 7-11,26; RAFL 12-25</td>
<td headers="header4">cDNA clones derived from a variety of phagemid libraries.All clones subjected to single pass sequence.NOTE: These clones are only available from Riken.</td>
</tr>
<tr>
<td headers="header1"><a href="http://signal.salk.edu/SSP/">SSP Consortium</a></td>
<td headers="header2">ORF/FlcDNA</td>
<td headers="header3">pUNI (most) some pENTR</td>
<td headers="header4">PCR-amplified, sequence verified ORF (U) and FlcDNA (S) clones derived from FlcDNA (Riken clones), EST and GSLT clones. Includes over 10,000 full length ORF clones available from ABRC.</td>
</tr>
<tr>
<td headers="header1"><a href="http://www.tigr.org/tdb/hypos/">TIGR Hypothetical</a> Gene Clones</td>
<td headers="header2">ORF</td>
<td headers="header3">pENTR221</td>
<td headers="header4">PCR generated ORF clones amplified from genomic DNA representing a subset of predicted genes of unknown function which lacked cDNA/EST support.  Goal is a set of 2000 sequences for which there are no corresponding cDNAs.Clones available from ABRC.</td>
</tr>

</table>
<p>[Back to <a href="#top">top]</a></p>
<a name="hints"></a>
<dl>
<dt>Helpful hints for finding FlcDNA clones in TAIR</dt>
<dd>When ordering FlcDNA clones from ABRC you may want to check the sequence of the clone to determine the extent of the cDNA coverage. Either check the sequence record, or the SeqViewer to determine how much, if any UTR sequence is included.</dd>
<dt>Clone nomenclature</dt>
<dd> When searching for cDNA clones from large collections, clone nomenclature can be useful in distinguishing clone origins.In general names of full length cDNAs from Riken start with R. PCR amplified clones based on the R (Riken  clones) that were generated by SSP/Salk, typically have the designation of U for ORF only, and S for clones with 5' and 3' UTR sequences. Yale/Peking lines are named as PY+locus name (e.g.PYAT1G03790)</dd>
<dt>Finding clones on locus detail pages</dt>
<dd>All full length cDNA clones associated to a locus are displayed in the RNA data section of the locus detail page. Find the section marked 'associated transcripts'. Full length cDNAs are listed in the cDNA (not EST) section. Click on the number in parenthesis to obtain a list of full length cDNA clones. Note that both types of clones (ORF and cDNAs with UTR's) are listed in this section.</dd>
<dt>Finding FlcDNAs in the <a href="http://tairvm09.tacc.utexas.edu/servlets/sv">SeqViewer Genome Browser</a></dt>
<dd>All cDNA sequences are displayed on the transcript band. Full length cDNAs are color coded BLUE (ESTs are grey). Click the cDNA icon to display details about the clone including ordering information. Use the Nucleotide sequence viewer to distinguish FlcDNA clones with our without UTR sequences. </dd>
<dt>Using the DNA search</dt>
<dd>To search for full length cDNAs for a given locus, select for clone, choose insert type=cDNA and other features="is full length cDNA". To limit the search ONLY to ABRC stocks, also select "is ABRC stock" among the other features.</dd>
</dl>

<center>Last modified on October 31, 2006</center>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


