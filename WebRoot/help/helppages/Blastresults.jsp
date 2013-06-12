<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("BLAST_help.jsp");
setNext("");
writeHeader();
</script>

<!-- End of header -->
</head>

<body>
<title>TAIR HELP: WU BLAST</title>

<!-- End of header -->


<p>
<table width="602" align="center" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td width="602">
		
		<!-- Content goes here //-->

<H2>TAIR WU BLAST Results Help</H2>


<ul>
<li><a href="#Description">Description</A>
<ul>
 <li><a href="#graphic">Graphic Display</a>
 <li><a href="#oneline">One-line Descriptions</a>
 <li><a href="#alignment">Sequence Alignments</a>
 <li><a href="#parameter">Parameters & Statistics</a>
 </ul>    
<li><a href="#accessing">Accessing BLAST Results</a>
<li><a href="#links">Other Relevant Links</a> 
</ul></blockquote></blockquote>
<p>


<a name="Description"><H4>Description</H4></A><BR><BR>
<font class="cont">The results of a <a href="/Blast">BLAST</a> query are
reported in roughly the same format, regardless of the program
selected.  The first section is a <a href="#graphic">graphical
overview</a> of the results, the second is a series of <a
href="#oneline">one-line descriptions</a> of matching database
sequences, the third is a set of the actual <ahref="#alignment">alignments</a> of the query sequence with database sequences, and the last section lists the
<a href="#parameter">parameters used and the statistics generated</a>
during the search.</font>
<p>
<font class="cont">The graphic display and one-line descriptions give information about
database sequences that form a High Scoring Segment Pair (HSP) with the query sequence.  An HSP is created when two sequence fragments (one from the query sequence and the other from a database sequence) show a locally maximal alignment for which the alignment exceeds a pre-defined cutoff score.  BLAST uses HSPs to
identify sequences of similarity.  </font>




<h2><a name="graphic">Graphic Display</A></h2><BR><BR>
<CENTER><H1>Summary of BLAST Results</H1></CENTER>
<P align=center>The graph shows the highest hits per range.<BR><B>Data has been omitted:</B> 16/43 hits displayed.</P>

<TABLE width="602" align="center" border="0" cellspacing="0" cellpadding="0"> <TR> <TD>

<CENTER>
<FORM NAME="daform">
<INPUT TYPE="text" SIZE="50" NAME="notes" VALUE="Mouse-overs require JavaScript"><BR></td></tr>
</table>
<CENTER>
<MAP NAME="imap">
<AREA shape=rect coords=12,25,705,35 href="#PIR-A57632_A" ONMOUSEOVER='document.daform.notes.value="p=2.0e-247 s=2371 PIR-A57632|PIR:A57632 homeotic protein BEL1"'>
<AREA shape=rect coords=12,36,705,68 href="#GP-AAD51349_A" ONMOUSEOVER='document.daform.notes.value="p=1.9e-69 s=616 GP-AAD51349|gi|5764630|gb|AAD51349.1 (AF17381"'>
<AREA shape=rect coords=12,69,705,90 href="#PIR-T02415_A" ONMOUSEOVER='document.daform.notes.value="p=5.0e-69 s=615 PIR-T02415|PIR:T02415 probable BEL1-like home"'>
<AREA shape=rect coords=12,91,705,123 href="#GP-CAB16801_A" ONMOUSEOVER='document.daform.notes.value="p=2.3e-63 s=606 GP-CAB16801|gi|5678605|emb|CAB16801.2 (Z99707"'>
<AREA shape=rect coords=12,124,705,134 href="#GP-AAD21463_A" ONMOUSEOVER='document.daform.notes.value="p=7.1e-59 s=543 GP-AAD21463|gi|4510375|gb|AAD21463.1 (AC00701"'>
<AREA shape=rect coords=12,135,705,156 href="#GP-AC007047_A" ONMOUSEOVER='document.daform.notes.value="p=4.2e-54 s=513 GP-AC007047|gi|4544389|gb|AAD22299.1|AC007047"'>
<AREA shape=rect coords=12,157,705,167 href="#GP-AC006233_A" ONMOUSEOVER='document.daform.notes.value="p=1.9e-46 s=327 GP-AC006233|gi|6598540|gb|AAF18625.1|AC006233"'>
<AREA shape=rect coords=12,168,705,178 href="#GP-AC007290_A" ONMOUSEOVER='document.daform.notes.value="p=5.3e-46 s=323 GP-AC007290|gi|4646216|gb|AAD26882.1|AC007290"'>
<AREA shape=rect coords=12,179,705,189 href="#GP-AAD21503_A" ONMOUSEOVER='document.daform.notes.value="p=1.8e-42 s=369 GP-AAD21503|gi|4510417|gb|AAD21503.1 (AC00692"'>
<AREA shape=rect coords=12,190,705,200 href="#GP-AC006233_18_A" ONMOUSEOVER='document.daform.notes.value="p=2.7e-32 s=212 GP-AC006233|gi|5306275|gb|AAD42007.1|AC006233"'>
<AREA shape=rect coords=12,201,705,211 href="#PIR-T05306_A" ONMOUSEOVER='document.daform.notes.value="p=9.8e-29 s=317 PIR-T05306|PIR:T05306 homeobox protein ATH1 -"'>
<AREA shape=rect coords=12,212,705,233 href="#GP-AC006267_A" ONMOUSEOVER='document.daform.notes.value="p=1.6e-09 s=147 GP-AC006267|gi|4689449|gb|AAD27897.1|AC006267"'>
<AREA shape=rect coords=12,234,705,244 href="#PIR-S68456_A" ONMOUSEOVER='document.daform.notes.value="p=1.4e-08 s=147 PIR-S68456|PIR:S68456 homeotic protein shootm"'>
<AREA shape=rect coords=12,245,705,255 href="#PIR-T01446_A" ONMOUSEOVER='document.daform.notes.value="p=1.4e-08 s=147 PIR-T01446|PIR:T01446 hypothetical protein F2"'>
<AREA shape=rect coords=12,256,705,266 href="#GP-CAA63132_A" ONMOUSEOVER='document.daform.notes.value="p=1.8e-08 s=125 GP-CAA63132|gi|1045046|emb|CAA63132.1 (X92394"'>
<AREA shape=rect coords=12,267,705,277 href="#PIR-S57818_A" ONMOUSEOVER='document.daform.notes.value="p=5.2e-08 s=140 PIR-S57818|PIR:S57818 homeotic protein ATK1 -"'>
</MAP>
 <img src="/images/WU-Blast_resultsSmall.gif" usemap="#imap" align=center>

</center>

</FORM>





<p>
The above is an example of the new BLAST graphical overview
format.  The graph's purpose is to give the user a brief summary of
the entire result set that provides a broad perspective on the
data. Significant features include:

<ul>
	<li>Color coding of P-values</li>	
	<li>A wider selection of hits</li>
	<li>Annotations displayed via JavaScript</li>
	<li>A date stamp for archival reference</li>
</ul>

The graph is meant simply to be a short sketch of the (possibly huge)
results so its size is limited; sometimes not all hits can be shown.

</p>






<h4>How HSPs are Shown</H4>
<p>

Each hit may contain one or more high scoring pairs (HSPs). Each HSP is
drawn as a line, and is aligned with the query sequence. In the close-up
we see three short HSPs (green), and one long one (red) running off the right edge.
</p>
<table border=0 align=center>
<tr align=center><td><img src="/images/WU-Blast_hsp2.gif"></td></tr>
</table>
<p>
<h4>HSPs are Directional</h4>
<p>

In the full text BLAST results, each HSP is either either <em>plus</em> or <em>minus</em>. If the query and HSP strands are in the same orientation, the HSP is forward (e.g. plus/plus), if the relative orientations are opposite (e.g. plus/minus) then the orientation is reverse.
</p>
<table border=0 align=center>
<tr align=center><td><img src="/images/WU-Blast_direction.gif"></td></tr>
</table>


<p>

<h4>HSPs Share a Background Color</h4>
<p>

All HSPs for a displayed hit are drawn. They share a single background color
to signify their relationship. Here are two hits, the second contains multiple
HSPs:</P>

<table border=0 align=center>
<tr align=center><td><img src=/images/WU-Blast_2hits.gif></td></tr>
</table>


  
<p>
Thus for the first hit,  A57632,  the background is gray.
For the second,  AAD51349_1,  it is white.
</p>

<h4>Hits are Color Coded</h4>
<p>
The hits are color coded according to their P value. A set of five fixed
ranges is used to determine a color for each hit. These ranges, from
"worst" to "best," are:
</p>

<table align=center>
 <tr>
        <td align=right>1.0</td>
	<td align=center>to</td>
	<td align=left>1e-10</td>
 </tr>
 <tr>
	<td align=right>1e-10</td>
	<td align=center>to</td>
	<td align=left>1e-50</td>
 </tr>
 <tr>
	<td align=right>1e-50</td>
	<td align=center>to</td>
	<td align=left>1e-100</td>
 </tr>
 <tr>
	<td align=right>1e-100</td>
	<td align=center>to</td>
	<td align=left>1e-200</td>
 </tr>
 <tr>
	<td align=right>1e-200</td>
	<td align=center>to</td>
	<td align=left>0.0</td>
 </tr>
</table>

<p>
The key shows these colors, and notes the negative value of the exponents
in each range. It progresses from "worst" on the left to "best" on the
right.
</p>
<table border=0 align=center>
<tr align=center><td><img src="/images/WU-Blast_colourkey.gif"></td></tr>
</table>


<p>

Note that ranges might not contain any hits, since the ranges are fixed
while the hit P-values are not. When ranges share a boundary value (e.g.:
1e-50), that value falls in the "better" range and will be colored thus
(e.g.: green).
</p>

<h4>How Hits are Chosen for Display</h4>
<p>
Often, there will be more data available than can be displayed. The current system selects data to include in the display that is biased in favor of displaying the range of results rather than just the best hits.
The rationale is that it can be important to show results further away from identity.
</p>
<p>
First, the hits are sorted into color coded ranges. Next, the top hit from
each range is picked, starting with the "best." It keeps track of how much
space each hit will take up when drawn; if, after including those, there
is still room left over, it iterates once more, picking the next top hit
from each range. This process continues until there are either no more
hits, or there is no room left in the display.
</p>

<p>
Note that the final drawing of the hits will be in proper order, even
though they have been selected in an interleaved fashion: all of the top
hits are drawn at the top of the image.
</p>

<h4>Range Counts</h4>

<p>
If not all hits are shown, range counts will appear at the right side of
the graph. In our example, all hits from the top range are shown and thus
the annotation says "All." However, not all hits in the next range were
able to be displayed so "5/6" indicates one omitted hit.
</p>

<table border=0 align=center>
<tr align=center><td><img src="/images/WU-Blast_rangecounts.gif"></table>
 


<p>
Note that if a range contains no hits, no count is shown (thus, there
are no magenta notations in our example). If all of the BLAST
results fit into the graph, no range counts are displayed at all.
</p>

<H4>Static and JavaScript Annotations</h4>
<p align=left>

Hit names and P-values are displayed at the left side of the graph.
</p>
<table border=0 align=center>
<tr align=center><td><img src="/images/WU-Blast_names.gif"></table>



<p>
If you enable JavaScript in your web browser, annotations for each hit
will be displayed in a text field just above the graph as you move the
mouse; score is included along with P-value.
</p>

<table border=0 align=center>
<tr><td>
<tt>p=2.0e-247 s=2371 PIR-A57632|PIR:A57632 homeotic protein BEL1</tt>
</td></tr>
</table>






<a name="oneline"><h4>One-line Descriptions</h4></A><BR><BR>

The one-line descriptions summarize information about the database
sequences that form HSPs with the query sequence. At the left end of
each one-line description is the name of the database sequence that
forms an HSP with the query sequence. Each description also includes
the Score and P-value for the hit.



<a name="alignment"><h4>Sequence Alignments</h4></A><BR><BR>

The sequence alignments show the query sequence at the top,
with the aligned database sequence (Sbjct, or subject) at the bottom.
The starting and ending points of the areas of similarity are shown at
the left and right of the aligned sequences.  When nucleotide
sequences are being aligned, vertical lines between the bases signify
identities.  Amino acid identities are shown by the repetition of the
one-letter code for that amino acid between the residues.
Conservative amino acid changes are shown by a "+" sign between the
aligned residues.  Places where gaps had to be introduced to achieve
the alignment are signified by a "-" in the query or subject
sequences.



<a name="parameter"><h4>Parameters & Statistics</h4></A><BR><BR>


For amino acid sequences, the default filter setting is "seg."
This filter removes repetitive sequences.  Removed residues are
indicated by Xs.  For nucleic acid sequences, the default filter
setting is "dust."  The removed residues are represented as Ns.  To
turn off this filter, return to the BLAST search page and select
"none" as a filter option.  You can also use the pull-down "Filter
options" menu to select a different type of filter.

<p> If a BLAST search results in no, or few, matches, the user may try
to increase the number of matches in a number of ways.  Going back to
the BLAST search page, one can change the database searched, change
the protein comparison matrix, or increase the number of alignments
shown.

<p>
For a more detailed description of BLAST results and the statistical
information they provide, please refer to the <a href="http://www.ncbi.nlm.nih.gov/BLAST/blast_help.html">NCBI BLAST
Help Manual</a>.



<a name="accessing"><H2>Accessing BLAST Search Results</H2></A><BR><BR>

BLAST results can be accessed by entering a sequence of more than
15 characters in the <A href="/wublast/index2.jsp">WU BLAST Search</A> Page, then choosing the appropriate BLAST Program.



<a name="links"><H2>Other Relevant Links</H2></A><BR></BR>

<p>
<ol TYPE=1>
<li><b>Links within TAIR</b>
<ol TYPE=a>
<li><a href="/Blast">NCBI BLAST</A>
<li><a href="/wublast/index2.jsp">WU BLAST</A>
<li><a href="/cgi-bin/fasta/nph-TAIRfasta.pl">FASTA</a>
<li><a href="/cgi-bin/patmatch/nph-patmatch.pl">Pattern Matching</A>
<li><a href="/search">TAIR DB</A>
    
</ol><p>
<li><b>External links</b>
<ol TYPE=a>
<li><a href="http://www.ncbi.nlm.nih.gov/BLAST/blast_help.html">NCBI BLAST Help Manual</a>
<li><a href="http://www3.ncbi.nlm.nih.gov/Entrez/">Entrez</a>
<li><a href="http://www.ncbi.nlm.nih.gov/Web/Genbank/index.html">GenBank</a>
<li><a href="http://www.expasy.ch/sprot/sprot-top.html">SWISS-PROT</a>
</ol>
</td>
	</tr>
</TABLE>
<!-- footer using external javascript file starts here -->
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("BLAST_help.jsp");
setNext("");
writeFooter();
</script>
<!-- end footer -->

</body>
</html>

