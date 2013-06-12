<%@page import="org.tair.utilities.*"%>
<html>
<head>
<title>TAIR Motif Finder Help</title>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("");
setNext("");
writeHeader();
</script>

<!-- End of header -->
</head>

<body>
<br>

<h2><a name="motif1"> </a>Using TAIR's Motif Finder</h2>

<font class ="cont"><a name=""> </a>This program compares the frequencies of 6-mer 'words' in a set of sequences against the frequency of the occurance of the word in the upstream sequences of the most recent genome sequence release. The input sequences can be obtained by downloading  500 or 1000 base pairs upstream of a locus or you can input your  own set of sequences. The word can be found on the forward or reverse strand.The program was written by Dr. Rob Ewing (formerly from the Arabidopsis Functional Genomics Consortium).</font>
<p>
<ul>Contents
<li><a href="#motif2">Defining the query sequence set</a></li>
<li><a href="#motif3">Choosing a dataset</a></li>
<li><a href="#motif4">Understanding the results</a></li>
<li><a href="#motif6">How p-values are calculated</a></li>
<li><a href="#motif5">Other cis-element finding resources</a></li>
</ul>
<h4><a name="motif2"> </a>Definining the query sequence set</h4>

<font class="cont"><a name=""></a> The Motif Finder takes either  sequences or a list of locus identifiers as input. Sequences should be in <A href="BLAST_help.jsp#formats">FASTA format</A>. If using a series of AGI locus identifiers(e.g.AT1g01010) they must beseparated by tabs, commas, carriage returns or spaces. Select a dataset (500 or 1000 bp upstream) to use. If using the locus IDs, the software will automatically extract either 500 or 1000 base pairs, depending on your selection. To obtain other sets of sequences sucha s 3000 base pair upstream or intron sequences in FASTA format, use TAIR's <a href="/tools/bulk/sequences/index.jsp">Bulk Sequence Download</a>.</font>
<p>
<h4><a name="motif3"> </a>Choosing a dataset</h4>

<font class="cont"><a name=""> For example, to compare the frequency of a 6-mer in 500 base pairs of upstream sequences choose the 500 bp upstream dataset/</a></font>
<p>
<h4><a name="motif4"> </a>Understanding the results set</h4>

<font class="cont"><a name=""> </a>The results of the query can be displayed as an HTML file in your browser window or as a tab delimited file which you can download and open in a spreadsheet program such as Excel. The results will show how many total upstream sequences were analyzed and include only oligos found more than three times. The results are displayed according to significance (p value). The first column is the 6mer sequence. The second column shows the number of times the 6-mer was found.The third column lists the total number of times the 6-mer was found in the genomic set. The third and fourth columns show the ratio of the 6-mer frequency to the number of sequences in either the query or genomic dataset.The fifth  column shows the probabililty score for the 6-mer. Scores closer to zero are considered more relevant (less likely to be random chance). The last column lists the name of the query sequence(s) which contain the motif.</font>
<p>

<h4><a name="motif6"> </a>How p-values are calculated</h4>
<font class="cont"><a name=""> </a>The motif counts are first calculated for the background dataset, i.e. all
the
upstream sequences (both for 1000 and 500, separately). The counts are
generated
the same way for both the background sequences and the query sequences (the
ones
the user submits). This is done as follows:
<p>
All possible 1-7 bps oligomers are generated as a preprocessing step. They
are
then assigned to a hash table with their sequence as the key and a unique
index
as a value.
<P>
For each sequence in the set that is being used to generate from (whether
the
background or the query), a sliding window (or frame) is used starting at
the
first basepair and moving over one bp at a time up to 6 (or whatever the
oligo
length is) to get overlapping occurrences of oligomers of size 6. For each
of
these iterations, all 6-oligomers are found within that particular
subsequence
and their counts are stored. At the end of the count for each sequence, the
counts are clipped at 1, to provide the normalized count (i.e. if the
oligomer
occurs one or more times in the same sequence, the count will still be only
1
for that oligomer in that sequence).
<P>
The background normalized counts and the query normalized counts, along with
the
size of each set (background and query), are then fed into the binomial
probability distribution calculator which then computes the probability of
the
count for each particular oligomer in the query set using the probability
for
that oligomer in the background set. The probability in the background set
is
simply the number of times the oligomer occurs divided by the total number
of
sequences in the background set (normalized as above).
<P>
The actual binomial formula used is:
<P>
choose(n,k) * p^k * (1-p)^(n-k)
<P>
where 
<br>
choose() = the number of ways one can pick k objects from a set of n
object
where the order is not considered, according to the script and how
combinations
are computed in general 
<br>n = the total number of sequences in the query set<br>
k = the normalized count of the current oligomer in the query set<br>
p = the probability of the current oligomer occurring in the background
(total)
set of upstream sequences (normalized).
<P>
Note: P-values are intended for ranking and identifying the most likely candidate
motifs; no p-value correction is made for multiple testing.

<h4><a name="motif5"> </a>Other resources for finding cis-elements</h4>

<font class="cont"><a name=""></a>Several online resources are available for finding motif in regulatory
regions of co-clustered genes.  The databases <a
Href="http://oberon.fvms.ugent.be:8080/PlantCARE/index.html">plantCARE</a>
and <a href="http://www.dna.affrc.go.jp/htdocs/PLACE/">PLACE</a> allow
searching for known plant cis-acting regulatory elements. Novel,
over-represented motifs in sets of co-clustered genes may be found
using Gibbs-sampling, as implemented in the plantCARE <a
href="http://www.esat.kuleuven.ac.be/~thijs/Work/MotifSampler.html">motif
sampler</a>, or by downloading and installing <a
href="http://atlas.med.harvard.edu/">AlignACE</a>.See TAIR's <a href="/portals/genAnnotation/genome_annotation_tools/cis_element.jsp">Cis-element Resource Page</a> for more useful links and tools.</font>
<p>

<!-- footer using external javascript file starts here --> 
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("");
setNext("");
writeFooter();
</script>
-<!-- end footer -->
</body>
</html>

