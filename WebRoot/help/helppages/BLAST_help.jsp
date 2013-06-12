<html>
<title>TAIR Help:BLAST</title>
<head>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("");
setNext("Blastresults.jsp");
writeHeader();
</script>
<!-- End of header -->
</head>
<body>

<p>

<p>
<table width="602" align="center" border="0" cellspacing="0" cellpadding="2">
<tr><td>
<a name="blast"></a><h2>TAIR BLAST Help</h2>



<ul>
<li><a href="#general">General information</a>
<li><a href="#browser">Browser Incompatabilities</a>
<li><a href="#methods">BLAST methods</a>    
<li><a href="#datasets">TAIR Datasets</a> 
<li><a href="#query">Entering query sequences</a>
<li><a href="#limits">Input file size limits</a>
<li><a href="#formats">Input data formats</a>
<li><a href="#filtering">Filtering</a>
<li><a href="#results">Results options</a>
<li><a href="#parameters">Advanced parameters</a>
<li><a href="#output">File output options</a>
</ul>
<p>

<P><HR SIZE=1 NOSHADE WIDTH=95%><P>

<a name="general"></a><h2>General Information</h2>

<font class="cont">BLAST stands for Basic Local Alignment Search Tool and was developed by Altschul et al. (1990) and significantly improved by <a href=http://www3.oup.co.uk/nar/Volume_25/Issue_17/freepdf/>Altschul et al. (1997).</a>  It
is a very fast search algorithm that is used to separately search
protein or DNA databases.  BLAST is best used for sequence similarity
searching, rather than for motif searching. For searches using a query
sequence of fewer than twenty residues, <a
href="/cgi-bin/patmatch/nph-patmatch.pl">PatMatch</a> is the best choice.  Another sequence alignment tool that may yield
different results from BLAST, and may be useful for motif searching,
is <a href="/cgi-bin/fasta/TAIRfasta.pl">FASTA</a>.  To search nonplant datasets, try  <a href="http://www.ncbi.nlm.nih.gov/BLAST/">NCBI BLAST</a>.</font>
<p>

<p>
A fairly complete on-line guide to BLAST searching can be found
at the <a
href="http://www.ncbi.nlm.nih.gov/BLAST/blast_help.html">NCBI BLAST
Help Manual</a>.  For a theoretical overview of BLAST, see the <a href=http://www.ncbi.nlm.nih.gov/BLAST/tutorial/Altschul-1.html>NCBI BLAST Course</a>.  Additional information can be found in the <a href="/blast/aboutblast2.htm">BLAST 2.0 Release Notes</a>

<P><HR SIZE=1 NOSHADE WIDTH=95%><P>
<h2><a name="browser"></a>Browser Incompatibilities</h2>
<p><font class="cont">The current version of TAIR BLAST does not perform as expected on Netscape in older versions of Mac OS (e.g. 8.6) and with Safari on OSX. In Safari- the results are downloaded onto your computer rather than returned in your browser window. In order to view results with the Safari browser you will need to open the file using Safari. Alternatively, until this problem is resolved, you can choose to have the BLAST results returned via email, or use another browser on OSX such as Internet Explorer or Netscape.</font>

<h2><a name="methods"></a>BLAST Methods</h2>

<p>The NCBI <b>BLAST</b> family of programs includes: 

<dl>
  <dt><b>blastp: </b> </dt>
  <dd>compares an amino acid query sequence against a protein sequence database. </dd>
  <dt><b>blastn</b> </dt>
  <dd>compares a nucleotide query sequence against a nucleotide sequence database. </dd>
  <dt><b>blastx</b> </dt>
  <dd>compares a nucleotide query sequence translated in all reading frames against a protein
    sequence database. </dd>
  <dt><b>tblastn</b> </dt>
  <dd>compares a protein query sequence against a nucleotide sequence database dynamically
    translated in all reading frames. </dd>
  <dt><b>tblastx</b> </dt>
  <dd>compares the six-frame translations of a nucleotide query sequence against the six-frame
    translations of a nucleotide sequence database. </dd>
</dl>

<h2><a name="datasets"></a>TAIR Datasets</h2>

The following datasets are used in NCBI-BLAST, WU-BLAST, FASTA, Patmatch and the bulk sequence download tools.
<BR><BR>
<table border="1" bordercolorlight="#FFFFFF" bordercolordark="#000000"cellpadding="5" cellspacing="0">
<tr bgcolor="#CCCCCC"><th colspan=4><a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/TAIR10_blastsets">Section 1: TAIR10 datasets (updated at time of new release)</a></th>
<tr bgcolor="#CCCCCC"><div align="center">
<th>Dataset</th>
<th>Type</th>
<th>Description</th>
<th>Source</th></div></tr>
<tr><td><a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/TAIR10_blastsets/TAIR10_cdna_20090619 ">TAIR10 Transcripts (- introns, + UTRs)</a></td><td>DNA</td><td>All Arabidopsis transcripts including predicted sequences. This datasets contains the UTRs but not the introns.Note that not ALL transcript sequences will include UTRs.</td><td>TAIR10 (November 2010)</td></tr>
<tr><td><a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/TAIR10_blastsets/TAIR10_cds_20090619 ">TAIR10 CDS (- introns, - UTRs)</a></td><td>DNA</td><td>All Arabidopsis coding sequences including predicted sequences. Similar to the transcript files but lacking the 5' and 3' UTRs.</td><td>TAIR10 (November 2010)</td></tr>
<tr><td><a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/TAIR10_blastsets/TAIR10_seq_20090619 ">TAIR10 Genes (+ introns, + UTRs)</a></td><td>DNA</td><td>All Arabidopsis transcription unit (gene) sequences. </td><td>TAIR10 (November 2010)</td></tr>
<tr><td><a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/TAIR10_blastsets/TAIR10_pep_20090619">TAIR10 Proteins</td><td>Protein</a></td><td>All Arabidopsis Protein sequences.</td><td>TAIR10 (November 2010)</td></tr>
<tr><td><a href="
ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/TAIR10_blastsets/TAIR10_bac_con_20090619 ">TAIR10 whole genome (BAC clones)</a></td><td>DNA</td><td>Arabidopsis genomic sequences obtained from TIGR, originally sequenced by the Arabidopsis Genome Initiative (AGI) genome sequencing project. The sequences are from BAC, cosmid, TAC, P1, and YAC clones. The ends of these genomic clones were extended by TIGR in some cases using sequence from an adjacent clone to improve overlaps for annotation, resulting in differences when compared with the original GenBank records.</td><td> TAIR10 (November 2010)</td></tr>
<tr><td><a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/TAIR10_blastsets/TAIR10_upstream_500_20090619">TAIR10 Loci Upstream Sequences-500bp</a></td><td>DNA</td><td>500bp of sequence preceding the 5' end of each transcription unit. Note: The sequences in this dataset are immediately upstream of the 5'UTR for those genes with annotated UTRs and upstream of the translational start for the remainder.</td><td> TAIR10 (November 2010)</td></tr>
<tr><td><a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/TAIR10_blastsets/TAIR10_upstream_1000_20090619 ">TAIR10 Loci Upstream Sequences-1000bp</a></td><td>DNA</td><td>1000bp of sequence preceding the 5' end of each transcription unit. Note: The sequences in this dataset are immediately upstream of the 5'UTR for those genes with annotated UTRs and upstream of the translational start for the remainder.</td><td> TAIR10 (November 2010)</td></tr>
<tr><td><a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/TAIR10_blastsets/TAIR10_upstream_3000_20090619 ">TAIR10 Loci Upstream Sequences-3000bp</a></td><td>DNA</td><td>3000bp of sequence preceding the 5' end of each transcription unit. Note: The sequences in this dataset are immediately upstream of the 5'UTR for those genes with annotated UTRs and upstream of the translational start for the remainder. </td><td>TAIR10 (November 2010)</td></tr>
<tr><td><a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/TAIR10_blastsets/TAIR10_downstream_500_20090619 ">TAIR10 Loci Downstream Sequences-500bp</a></td><td>DNA</td><td>500bp of sequence following the 3' end of each transcription unit was used if it had an annotated 3' UTR, otherwise the sequence after the stop codon was used.</td><td> TAIR10 (November 2010)</td></tr>
<tr><td><a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/TAIR10_blastsets/TAIR10_downstream_1000_20090619 ">TAIR10 Loci Downstream Sequences-1000bp</a></td><td>DNA</td><td>1000bp of sequence following the 3' end of each transcription unit was used if it had an annotated 3' UTR, otherwise the sequence after the stop codon was used.</td><td> TAIR10 (November 2010)</td></tr>
<tr><td><a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/TAIR10_blastsets/TAIR10_downstream_3000_20090619">TAIR10 Loci Downstream Sequences-3000bp</a></td><td>DNA</td><td>3000bp of sequence following the 3' end of each transcription unit was used if it had an annotated 3' UTR, otherwise the sequence after the stop codon was used.</td><td>TAIR10 (November 2010)</td></tr>
<tr><td><a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/TAIR10_blastsets/TAIR10_intergenic_20090619 ">TAIR10 Intergenic</a></td><td>DNA</td><td>Contains the intergenic sequence between all the genes in the Arabidopsis genome. All the sequences are taken from the Watson strand irrespective of the direction of the annotated genes.</td><td> TAIR10 (November 2010)</td></tr>
<tr><td><a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/TAIR10_blastsets/TAIR10_intron_20090619">TAIR10 Intron</a></td><td>DNA</td><td>Contains all the introns of every annotated gene in the Arabidopsis genome. </td><td>TAIR10 (November 2010)</td></tr>
<tr><td><a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/TAIR10_blastsets/TAIR10_5_utr_20090619 ">TAIR10 5' UTRs </a></td><td>DNA</td><td>Processed 5' UTRs for all Arabidopsis genes with full length cDNA or EST sequences.</td><td>TAIR10 (November 2010)</td></tr>
<tr><td><a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/TAIR10_blastsets/TAIR10_3_utr_20090619 ">TAIR10 3' UTRs </a></td><td>DNA</td><td>Processed 3' UTRs for all Arabidopsis genes with full length cDNA or EST sequences.</td><td>TAIR10 (November 2010)</td></tr>
<tr bgcolor="#CCCCCC"><th colspan=4>Section 2: A. thaliana GenBank &amp; Uniprot (updated twice a month)</th>
<tr bgcolor="#CCCCCC"><div align="center">
<th>Dataset</th>
<th>Type</th>
<th>Description</th>
<th>Source</th></div></tr>
<tr><td>A. thaliana Insertion Flanks</td><td>DNA</td><td>T-DNA insertion flanking sequences.</td><td>Salk Insititute (Ecker and colleagues) and Institute of Molecular Agrobiology (IMA, Sundaresan and colleagues),GABI-KAT, Syngenta, Genbank and TAIR user submissions</td></tr>
<tr><td>A. thaliana UniProt</td><td>Protein</td><td>All Arabidopsis proteins</td><td>UniProt</td></tr>
<tr><td>A. thaliana GB derived from mRNA</td><td>protein</td><td>Arabidopsis thaliana protein sequences translated from experimentally isolated mRNA.  Excludes proteins predicted from genomic sequences and third party (tpa) annotations.  Entrez query used is ‘Arabidopsis thaliana[orgn] NOT "refseq"[Filter] NOT "tpa"[Properties] AND "derived from mrna"[Properties]’</td><td>GenBank</td></tr>
<tr><td>A. thaliana GB refseq/tpa</td><td>protein</td><td>Arabidopsis thaliana protein sequences predicted from the whole genome sequence.  This is nearly equivalent to the “TAIR8 Proteins” set above (which are the source of the GenBank refseq records) except it also includes a few additional third party (tpa) annotations and the fasta header includes a link to GenBank rather than TAIR.  Entrez query used is ‘Arabidopsis thaliana[orgn] AND ( "refseq"[Filter] OR "tpa"[Properties])’</td><td>GenBank</td></tr>
<tr><td>A. thaliana GB all</td><td>protein</td><td>All Arabidopsis thaliana proteins from GenBank.  Entrez query used is ‘Arabidopsis thaliana[orgn]’</td><td>GenBank</td></tr>
<tr><td>A. thaliana GB experimental cDNA/EST</td><td>DNA</td><td>Arabidopsis thaliana experimentally isolated cDNA and EST sequences.  Excludes cDNAs predicted from genomic sequences.  This set combines sequences from the Core Nucleotide and EST sections of GenBank.  Entrez query used is ‘Arabidopsis thaliana[orgn] AND "mrna"[Filter] NOT "refseq"[Filter] NOT "tpa"[Properties]’</td><td>GenBank</td></tr>
<tr><td>A. thaliana GB refseq/tpa cDNA</td><td>DNA</td><td>Arabidopsis thaliana cDNA sequences predicted from the whole genome sequence.  This is nearly equivalent to the “TAIR8 Transcripts” set above (which is the source of the GenBank refseq records) except it also includes a few additional third party (tpa) annotations and the fasta header includes a link to GenBank rather than TAIR.  Entrez query used is ‘Arabidopsis thaliana[orgn] AND "mrna"[Filter] AND ("refseq"[Filter] OR "tpa"[Properties])’</td><td>GenBank</td></tr>
<tr><td>A. thaliana GB genomic</td><td>DNA</td><td>All Arabidopsis thaliana genomic sequences from Core Nucleotide and GSS GenBank sections.  Includes full BAC sequences, BAC ends, and many other types of genomic sequences.  Entrez query used is ‘Arabidopsis thaliana[orgn] AND "genomic dna rna"[Filter]’</td><td>GenBank</td></tr>
<tr bgcolor="#CCCCCC"><th colspan=4>Section 3: Green plant GenBank minus A. thaliana (updated twice a month) </th>
<tr bgcolor="#CCCCCC"><div align="center">
<th>Dataset</th>
<th>Type</th>
<th>Description</th>
<th>Source</th></div></tr>
<tr><td>Green plant GB derived from mRNA</td><td>protein</td><td>
Viridiplantae (excluding Arabidopsis thaliana) protein sequences translated from experimentally isolated mRNA.  Excludes proteins predicted from genomic sequences and third party (tpa) annotations.  Entrez query used is ‘viridiplantae[orgn] NOT “Arabidopsis thaliana”[orgn] NOT "refseq"[Filter] NOT "tpa"[Properties] AND "derived from mrna"[Properties]’</td><td>GenBank</td></tr>

<tr><td>Green plant GB refseq/tpa </td><td>protein</td><td>
Viridiplantae (excluding Arabidopsis thaliana) protein sequences  from the GenBank Reference Sequence section.  These are mainly predicted proteins from large genomic sequencing and annotation projects.  Entrez query used is ‘viridiplantae[orgn] NOT “Arabidopsis thaliana”[orgn] AND ( "refseq"[Filter] OR "tpa"[Properties])’</td><td>GenBank</td></tr>

<tr><td>Green plant GB all </td><td>protein</td><td>
All Viridiplantae (excluding Arabidopsis thaliana) proteins from GenBank.  Entrez query used is ‘viridiplantae[orgn] NOT “Arabidopsis thaliana”[orgn]’</td><td>GenBank</td></tr>

<tr><td>Green plant GB experimental cDNA/EST</td><td>DNA</td><td>
Viridiplantae (excluding Arabidopsis thaliana) experimentally isolated cDNA and EST sequences.  Excludes cDNAs predicted from genomic sequences.  This set combines sequences from the Core Nucleotide and EST sections of GenBank.  Entrez query used is ‘viridiplantae[orgn] AND "mrna"[Filter] NOT “Arabidopsis thaliana”[orgn] NOT "refseq"[Filter] NOT "tpa"[Properties]’</td><td>GenBank</td></tr>

<tr><td>Green plant GB refseq/tpa cDNA </td><td>DNA</td><td>
Viridiplantae cDNA sequences (excluding Arabidopsis thaliana) from the GenBank Reference Sequence section.  These are mainly predicted cDNAs from large genomic sequencing and annotation projects.  Entrez query used is ‘viridiplantae[orgn] AND "mrna"[Filter] NOT “Arabidopsis thaliana”[orgn] AND ("refseq"[Filter] OR "tpa"[Properties])’</td><td>GenBank</td></tr>

<tr><td>Green plant GB genomic </td><td>DNA</td><td>
All Viridiplantae genomic sequences (excluding Arabidopsis thaliana) from Core Nucleotide and GSS GenBank sections.  Includes full BAC sequences, BAC ends, and many other types of genomic sequences.  Entrez query used is ‘viridiplantae[orgn] AND "genomic dna rna"[Filter] NOT “Arabidopsis thaliana”[orgn]’</td><td>GenBank</td></tr>

</table>

<h2><a name="query"></a>Entering query sequences</h2>

<font class="cont">When pasting sequences into the text box, be aware that a single sequence
is limited to 7000 characters in length; when you paste multiple sequences
(up to five are allowed) you are limited to a total of 15,000 characters.
These limitations may be changed in the future.&nbsp; If you have a longer
sequence, or many sequences, use the file upload feature.&nbsp; This
feature is not supported on some versions of Microsoft's Internet Explorer
web browser.&nbsp; If you do not see a &quot;Browse...&quot; button near
the file upload text box (that displays your computer's filesystem
directory when clicked), we suggest using Netscape or another browser
supporting file uploading.</font>
<a name="query2"></a><h4>Multiple query sequences</h4>
<font class="cont">To submit multiple query sequences, paste up to 5 sequences
into the input box or,upload a file containing the concatenated sequences in FASTA format.  For this
option the files cannot be in raw format because they will be
interpereted as a single query sequence. For NCBI-BLAST it may be possible to upload more than five sequences depending on the length of the query sequence and size of the target database.See the following section on <a href="#limits">Input file size limits</a>. WuBLAST has a defined limit of 5 sequences.</font>

<a name="query3"></a><h4>Using  the Browse option to upload a local file</h4>
<b>NOTE:If you are uploading a file, make sure the file is in text format. If your file is a WORD document, open the file in Word and save again as text only format.</b>
<ul>
<li>Macintosh
<ol>
<li>Click on Browse button
<li>Click on folders to open them, and on the file to upload it
</ol>
<li>PC
<ol>
<li>Click on the Browse button
<li>Change the file type from "HTML" to "all files"
<li>Click on folders to open them, and on the file to upload it
</ol>
<li>UNIX
<ol>
<li>Click on the Browse button
<li>Change *.html to * at the end of the string in the Filter box
<li>Click on a folder and then the Filter button to open the folder
<li>Click on a file and then the OK button to upload it
</ol>
</ul>
<b>Word documents will not work unless saved as text first.</b>

<h2><a name="limits"></a>Input file size limits</h2>
<a name ="limits2"></a><font class="cont">For NCBI BLAST limits are imposed on the size of the input files based upon the type of query being performed and the size of the dataset being searched. For example, the limit for TBLASTX against a large data set such as GenBank AGI sequences is 1000 characters, whereas for a small dataset like TIGR CDS sequences the limit is 3000 characters. The following table lists the search type and limits for NCBI Blast. If your files are larger, try using <a href="/wublast/index2.jsp">WU-BLAST2</a> instead.</font>
 <br><br>

 <table width="602" border="1" align="center">
<tr bgcolor="#CCCCCC"><td><font class="cont">Search  Type</font></td>
<td><font class="cont">Large data set input character limit</font></td>
<td><font class="cont">Small data set input character limit</font></td></tr>
<tr><td><font class="cont">BLASTN</font></td>
<td><font class="cont">25000</font></td>
<td><font class="cont">25000</font></td></tr>
<tr><td><font class="cont">BLASTX</font></td>
<td><font class="cont">25000</font></td>
<td><font class="cont">25000</font></td></tr>
<tr><td><font class="cont">BLASTP</font></td>
<td><font class="cont">5000</font></td>
<td><font class="cont">5000</font></td></tr>
<tr><td><font class="cont">TBLASTN</font></td>
<td><font class="cont">1000</font></td>
<td><font class="cont">3000</font></td></tr>
<tr><td><font class="cont">TBLASTX</font></td>
<td><font class="cont">1000</font></td>
<td><font class="cont">3000</font></td></tr>
</table>

<h2><a name="formats"></a>Input Data Formats</h2>
<ul>

  <li>Raw text format
<p>An example sequence in raw format is:
</p>
      
<pre>
GGAAAAATCGAAGGATAATCTGTTTCTTCCAGCACAAGTTAACTTGCAAGAGAGAGCT
CAAAGATGGAACCAACAGAAAAACCATCGACCAAACCATCTTCTCGGACTCTACCTAG
AGACACTCGTGGCTCTCTCGAAGTATTCAACCCGTCAACTCAGCTGACCCGACCCGAT
AACCCGGTGTTCCGTCCTGAACCACCAGCGTGGCAAAACTTGAGTGATCCACGTGGCA
CCAGTCCTCAACCCCGACCACAACAAGAACCAGCTCCATCCAACCCTGTTCGGTCTGA
TCAAGAAATCGCTGTCACGACCTCATGGATGGCTCTGAAAGACCCATCACCGGAGACA
ATCTCCAAG
</pre>
      
  <li>FASTA format

<p>A sequence in FASTA format begins with a single-line description, followed by lines of
sequence data. The description line is distinguished from the sequence data by a
greater-than (&quot;&gt;&quot;) symbol in the first column. It is recommended that all
lines of text be shorter than 80 characters in length. An example sequence in FASTA format is: </p>

<pre>

&gt;gi|1122533|gb|AAB05099.1| BELL1
MARDQFYGHNNHHHQEQQHQMINQIQGFDETNQNPTDHHHYNHQIFGSNSNMGMMIDFSKQQQIRMTSGS
DHHHHHHQTSGGTDQNQLLEDSSSAMRLCNVNNDFPSEVNDERPPQRPSQGLSLSLSSSNPTSISLQSFE
LRPQQQQQGYSGNKSTQHQNLQHTQMMMMMMNSHHQNNNNNNHQHHNHHQFQIGSSKYLSPAQELLSEFC
SLGVKESDEEVMMMKHKKKQKGKQQEEWDTSHHSNNDQHDQSATTSSKKHVPPLHSLEFMELQKRKAKLL
SMLEELKRRYGHYREQMRVAAAAFEAAVGLGGAEIYTALASRAMSRHFRCLKDGLVGQIQATSQALGERE
EDNRAVSIAARGETPRLRLLDQALRQQKSYRQMTLVDAHPWRPQRGLPERAVTTLRAWLFEHFLHPYPSD
VDKHILARQTGLSRSQVSNWFINARVRLWKPMIEEMYCEETRSEQMEITNPMMIDTKPDPDQLIRVEPES
LSSIVTNPTSKSGHNSTHGTMSLGSTFDFSLYGNQAVTYAGEGGPRGDVSLTLGLQRNDGNGGVSLALSP
VTAQGGQLFYGRDHIEEGPVQYSASMLDDDQVQNLPYRNLMGAQLLHDIV

</pre>
      
  <li>GCG format

      <p>An example sequence in GCG format is: </p>

<pre>

!!NA_SEQUENCE 1.0
nga361 


nga361.seq  Length: 204  February 22, 1999 12:09  Type: N  Check: 234  ..

       1  TTATATGATA TATATAGTTA TGTATGTTNC AAGAATNCGA TATGGNACGC 

      51  ATGATTGAAG AATAATGATT GAGGAATTTT NCTGTAACAA AAAAATTNGA 

     101  NATAAACAAN TNTGTGGCTA AGAACTTAAC AAGGNCACAT GTTGATATGT 

     151  GAANTAGGAA TCTCATNATA AGGANCACAC GGTTGACAGC AAACGGGCNT 

     201  NTAC

</pre>


  <li>RSF format

      <p>A Rich Sequence Format (RSF) file contains one or more sequences that may or may not be related. In addition to the sequence data, each sequence can be richly annotated with descriptive sequence information such as creator/author of the sequence, sequence weight, creation date, one-line description of the sequence, offset, or the number of leading gaps in a sequence that is part of an alignment or fragment assembly project, and known sequence features.  An example sequence in RSF format is: </p>

<pre>
!!RICH_SEQUENCE 1.0
..
{
name  Hs70_Plafa
descrip    PileUp of: @Hsp70.List
type    PROTEIN
longname  Gendocdisk:[Gcgdoc.Program_Manual]Hsp70.Msf{Hs70_Plafa}
checksum    1012
creation-date 10/15/96  8:40:33
strand  1
sequence  
  ~~~~~~~~~~~~~~~MASAKGSKPNLPESNIAIGIDLGTTYSCVGVWRNENVDIIANDQG
  NRTTPSYVAFT.DTERLIGDAAKNQVARNPENTVFDAKRLIGRKFTESSVQSDMKHWPFT
  VKSGVDEKPMIEVTYQGEKKLFHPEEISSMVLQKMKENAEAFLGKSIKNAVITVPAYFND
  SQRQATKDAGTIAGLNVMRIINEPTAAAIAYGLHKKG..KGEKNILIFDLGGGTFDVSLL
  TIED...G.IFEVKATAGDTHLGGEDFDNRLVNFCVEDFKRKNRGKDLSKNSRALRRLRT
  QCERAKRTLSSSTQATIEIDSLFEGID....YSVTVSRARFEELCIDYFRDTLIPVEKVL
  KDAMMDKKSVHEVVLVGGSTRIPKIQTLIKEFFNGKEACRSINPDEAVAYGAAVQAAILS
  G.DQSNAVQDLLLLDVCSLSLGLETAGGVMTKLIERNTTIPAKKSQIFTTYADNQPGVLI
  QVYEGERALTKDNNLLGKFHLDGIPPAPRKVPQIEVTFDIDANGILNVTAVEKSTGKQNH
  ITITNDKGRLSQDEIDRMVNDAEKYKAEDEENRKRIEARNSLENYCYGVKSSLEDQKIKE
  KLQPAEIETCMKTITTILEWLEKN.QLAGKDEYEAKQKEAESVCAPIMSKIYQDAAGAAG
  .GMPGGMP..GGMPGGMPSGMPGGMNFPGGMPGAGMPGNAPAGSGPTVEEVD~~~~~~
}

</pre>

      
</ul>
      

<h2><a name="filtering"></a>Filtering</h2>
<p>

    Filtering masks off segments of the query sequence that have low compositional complexity, as
    determined by the SEG program of Wootton &amp; Federhen (Computers and Chemistry, 1993)
    or, for BLASTN, by the DUST program of Tatusov and Lipman (in preparation). Filtering can
    eliminate statistically significant but biologically uninteresting reports from the BLAST
    output (e.g., hits against common acidic-, basic- or proline-rich regions), leaving the
    more biologically interesting regions of the query sequence available for specific
    matching against database sequences.
    <p>Filtering is only applied to the query sequence (or its translation products), not to
    database sequences. Default filtering is DUST for BLASTN, SEG for other programs. 
    It is not unusual for nothing at all to be masked by SEG, when applied to sequences in
    SWISS-PROT, so filtering should not be expected to always yield an effect. Furthermore, in
    some cases, sequences are masked in their entirety, indicating that the statistical
    significance of any matches reported against the unfiltered query sequence should be
    suspect.


<a name="results"></a><h2>Results Options</h2>

<dl>
  <dt><h4>Output title</h4></dt> 
  <dd>Type in the title you would like to appear at the top of your BLAST output.</dd>
  
<dt>&nbsp;</dt>
  
<dt><h4><a name="EMAIL">E-mail address:</a></h4> </dt>
  <dd>Entering your email address is suggested even if requesting a browser reply, and may be
    mandatory depending on server configuration options.&nbsp; Depending on server loading, or
    the expected execution time of your request, the server may convert your request to an
    email reply and auto-select the <a href="#URL">E-mail URL</a> option. This avoids the
    frustration of wondering when your job will finish, and allows you to request more jobs
    quicker.&nbsp; </dd>


  <dt><h2><a name="VIA">Return Results:</a></h2> </dt>
<p>
  <dt><h4><a>To your web browser</a></h4></dt>
  <dd>Your job will run immediately and return results directly to your Web browser in HTML
    format.&nbsp; Accession numbers that appear in the
    query and target loci names and descriptions will be hyperlinked to allow easy access to
    additional sequence information.&nbsp;</dd> 
    <dt>&nbsp;</dt>
    <dd><div>
<!--  <table border="1" width="500" height="20">
      <tr>
        <td width="403" height="20">
-->

<p><strong>NOTE:</strong> Attempting to view large result files may cause your
browser to &quot;blank out&quot;.&nbsp; If you have trouble viewing results,
particularly if you've asked for many scores and alignments, or submitted many queries in
one job, your browser's &quot;memory&quot; and &quot;disk&quot; cache settings may need to
be increased.&nbsp; See your browser's help and preference menus for details.&nbsp; To
prevent loss of a large HTML result file, you might wish to request emailing a URL to it rather than a browser reply.&nbsp; This way you'll be able to experiment
 with your browser's cache settings and retrieve the output as many times as you wish 
without waiting for your request to be re-run.
<BR>
<BR>
<!-- </td>
      </tr>
    </table> -->

    </div></dd>
  <dt>&nbsp;</dt>
  
  <dt><h4>By E-mail message</h4> </dt>
  <dd>The results are sent within the body of a normal email message, to the email address you
    enter.&nbsp; Any comments you type will appear as the Subject of the email message.
    Generally, you should use this option only if your mail system can handle large messages,
    and you've asked for textual output.&nbsp; If requesting HTML format by email, either of
    the following choices may be better if your mail reader software is not HTML-aware.</dd>
  <dt>&nbsp;</dt>
  <dt><h4><a name="URL">By</a> E-mail notice to URL</h4> </dt>
  <dd>Many mail systems have trouble with large email messages, and may split or truncate
    them. &nbsp; Our blast server will retain your results and send you a short email containing a URL
    (<em>Uniform Resource Locator</em>; to use with your web browser or HTML-aware mail
    reader) indicating where to obtain your results.&nbsp; We will delete your results
    after the date and time indicated in the email message.</dd>
  <dt>&nbsp;</dt>


  <dt><h2><a name="VIA-form">Result Formats:</a></h2> </dt>


  <dt><h4><a name="BIG-HTML">HTML</a> hypertext</h4> (file type &quot;htm&quot;)<br>
  </dt>
  <dd>HTML format is used by web browsers.&nbsp; Accession numbers that appear in the query and target loci names and descriptions will be
    hyperlinked to allow easy access to additional sequence information.&nbsp; Embedded Java
    &quot;Applets&quot; may be used to render graphical information (e.g., the ClustalW
    dendrogram), which will not appear unless your browser is set to permit these applets to
    run.&nbsp; </dd>

  
<dt>&nbsp;</dt>
  <dt><h4>Normal text</h4> (file type &quot;txt&quot;)</dt>
  <dd>The results are returned as conventional human-readable text. </dd>
  
  <dt>&nbsp;</dt>
  <dt><h4>Comma-delimited records</h4> (file type &quot;csv&quot;)</dt>
  <dd>Information is returned as quoted, comma-separated fields and records, compatible with
    Excel, Word, Access and most database products.&nbsp; These products allow simple viewing
    and sorting on any data column.&nbsp; For each query sequence, each rank score produces a
    record.&nbsp; Alignment text is included in those records when available.&nbsp; For
    example, if you ask for the best 100 scores and best 25 alignments, the alignment text
    fields will be null strings for the last 75 records of each query.&nbsp; For BLAST scores
    that return more than one alignment, a separate record is generated for each.</dd>
<dt>&nbsp;</dt>

  <dt><h4>Tab-delimited records</h4> (file type &quot;tab&quot;)</dt>
  <dd>Similar to comma-delimited, but no quotes are used, and tabs replace comma characters as
    the field separator.&nbsp; More commonly used in UNIX environments. The meaning of the columns are following.<BR>
      DNA:<br>
RANK, STATUS, SCORES, E-VALUES, PROGRAM, Gap Penalties (Existence), Gap 
Penalty (Extension), empty, empty, MATRIX, TEMPFILENAME, QUERY LENGTH, 
Frame of Query that the score was found for (empty for protein), QUERY 
NAME, DATASET, Target length, Frame of Target that the score was found 
for (empty for protein), DESCRIPTION, empty, emtpy, empty, empty, empty, 
empty, empty, empty, empty, Identities, empty, Gaps, Percentage ratio of 
identical matches to the length of the alignment, Percentage ratio of 
identical matches to the length of the query, unknown, unknown, empty, 
empty, empty, Query Start, Query End, Target Start, Target End, QUERY 
NT, COMPARISON, TARGET NT<br>
<p>
Protein:<BR>
RANK, STATUS, SCORE, E-VALUE, PROGRAM, Gap Penalties (Existence), Gap 
Penalty (Extension), EMPTY, EMTPY, MATRIX, TEMPFILENAME, QUERY LENGTH, 
empty, QUERY NAME, DATASET, Target length, empty, DESCRIPTION, empty, 
empty, empty, empty, empty, empty, empty, empty, empty, Identities, 
Positives, Gaps, Percentage ratio of identical matches to the length of 
the alignment, Percentage ratio of identical matches to the length of 
the query, unknown, unknown, Percentage ratio of identical matches to 
the length of the target, unknown, unknown, Query Start, Query End, 
Target Start, Target End, empty, QUERY NT, COMPARISON, TARGET NT
</dd>
  <dt>&nbsp;</dt>
</dl>



<h2><a name="parameters">Advanced parameters</a></h2>
  <a href=BLASToptions.jsp>View Default Settings</a>    
<p>
  <dl>
  <dt><h4><a name="descriptions">Max Scores</a></h4> <a href="BLASToptions.jsp#descriptions">Default Setting</a> </dt>
  <dd>Restricts the number of short descriptions of matching sequences reported to the number
    specified; default limit is 25 descriptions. See also <a href = "#expect">Expectation</a>. </dd>
  <dt>&nbsp;</dt>
  <dt><h4><a name="alignments">Max Alignments</a></h4> <a href="BLASToptions.jsp#alignments">Default Setting</a></dt>
  <dd>Restricts database sequences to the number specified for which high-scoring segment
    pairs (HSPs) are reported; the default limit is 15. If more database sequences than this
    happen to satisfy the statistical significance threshold for reporting (see <a href = "#expect">Expectation</a>),
    only the matches ascribed the greatest statistical significance are reported. </dd>
  <dt>&nbsp;</dt>
  <dt><h4><a name="expect">Expectation</a></h4> <a href="BLASToptions.jsp#expect">Default Setting</a></dt>
  <dd>The statistical significance threshold for reporting matches against database sequences;
    the default value is 10, such that 10 matches are expected to be found merely by chance,
    according to the stochastic model of Karlin and Altschul (1990). If the statistical
    significance ascribed to a match is greater than the EXPECTATION threshold, the match will
    not be reported. Lower EXPECT thresholds are more stringent, leading to fewer chance
    matches being reported. Fractional values are acceptable. </dd>
  <dt>&nbsp;</dt>
  <dt><a name="gencodes"><h4>Query and Database Genetic Code</h4></a> <a href="BLASToptions.jsp#gencodes">Default Setting</a></dt>
  <dd>Genetic code to be used in BLASTX translation of the query. </dd>
    <dt>&nbsp;</dt>
  <dt><h4><a name = "gapped">Gapped Alignments</a></h4>
  <dd>Whether to allow gapped alignments; either ON or OFF.</dd>
  <dt>&nbsp;</dt>
  <dt><h4><a name = "open">Gap Opening Penalty</a></h4> <a href="BLASToptions.jsp#open">Default Setting</a></dt> 
<dd>
Cost to open a gap; a 0 in the field means to use the default. Supported values for BLASTP, BLASTX, TBLASTN, and TBLASTX are limited.</dd>
<dt>&nbsp;</dt>
<dt><h4><a name = "extend">Gap Extension Penalty</a></h4> <a href="BLASToptions.jsp#extend">Default Setting</a></dt>
<dd>
Cost to extend a gap, a 0 in this field means to use the default. Supported values for BLASTP, BLASTX, TBLASTN, and TBLASTX are limited.</dd>
<dt>&nbsp;</dt>
<dt><h4><a name = "mismatch">Nucleic Mismatch</a></h4> <a href="BLASToptions.jsp#mismatch">Default Setting</a></dt>
<dd>
Penalty for a mismatch in the BLAST&#8482; portion of run.</dd> 
<dt>&nbsp;</dt>
<dt><h4><a name = "match">Nucleic Match</a></h4> <a href="BLASToptions.jsp#match">Default Setting</a></dt>
<dd>
Reward for a match in the BLAST&#8482; portion of run.</dd> 
<dt>&nbsp;</dt>
<dt><h4><a name = "word">Word Size</a></h4> <a href="BLASToptions.jsp#word">Default Setting</a></dt>
<dd>
The size of the initial word that must be matched between the database
and the query sequence.</dd>
<dt>&nbsp;</dt>
<dt><h4><a name = "matrix">Matrix</a></h4>
    <a href="BLASToptions.jsp#matrix">Default Setting</a></dt>
    <dd>
The amino acid substitution 
<a href = "http://twod.med.harvard.edu/seqanal/matrices.html">matrix</a>
to be used for protein comparisons.  Both BLOSUM and PAM 
matrices are available at several different levels of evolutionary distance.
</dd>
<dt>&nbsp;</dt>
<dt><h4><a name = "ext">Extension Threshold</a></h4>
<dd>
The threshold above which BLAST&#8482; will extend a hit found.  The hit is based on finding a word of a certain size (see <a href="#word">Word Size)</a></dd>
<dt>&nbsp;</dt>

<dt>&nbsp;</dt>

<dt><h4><a name = "threshold">Reporting Threshold</a></h4>
<dd>This keyword allows a score value to be specified as the threshold for 
displaying scores.  Scores below this value are not shown.
</dd>
<dt>&nbsp;</dt>

</dl>

<h2><a name="output">File output options</a></h2>


<dl>
  <dt><h4><a name="FIELDS">Advanced</a> options for Comma- and Tab-delimited formats</h4> </dt>
  <dd><strong>Header-Record</strong>&nbsp;&nbsp;&nbsp; if checked, the first record will
    contain the field names as shown in the table below.<br>
    <strong>Selected Fields&nbsp;</strong>&nbsp;&nbsp;&nbsp; if left blank, a default set of
    fields is returned.&nbsp; To customize, select from the following keywords; put a space
    between each.</dd>
</dl>
<font SIZE="2"><h4>

<p>KEYWORDS</p>

    </h4><p><strong>ClustalW does not presently support tab- and comma-delimited formats.</strong><br>
    The <i>fieldlist</i> can contain any of the following keywords in any order and repeated
    as desired:</font></p>

<table CELLSPACING="0" BORDER="0" WIDTH="534">
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>SEARCHID</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the name of the search file in the
    record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>RANK</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the score rank number in the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>SCORE</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the score in the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>PSCORE</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the p-score in the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>ALGORITHM</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Specify the algorithm to be used in the
    search.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>ITERATION</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Iteration number for PSIBLAST searches.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>OPENPENALTY</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the Open Penalty in the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>EXTENDPENALTY</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the Extend Penalty in the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>FRAMEPENALTY</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the Frame Penalty in the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>SCALEFACTOR</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Indicates the scale factor used. Default is 1.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>MATRIX</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the name of the PAM matrix file in the
    record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>QUERYNUMBER</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the number of the query in the record.
    This number represents which query sequence the record is when multiple query files or
    multiple sequences are used in the search</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>QUERYFILE</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the name of the query file in the record</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>QUERYLENGTH</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the length of the query file in the
    record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>QUERYFRAME</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the frame of the query with which the
    score was calculated, in the record.&nbsp;</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>QUERYTEXT</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the description from the query file in
    the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>TARGETFILE</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the name of the target in which the
    score was found, in the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>TARGETLENGTH</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the length of the target locus in which
    the score was found, in the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>TARGETFRAME</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the frame of the target locus in which
    the score was found, in the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>TARGETLOCUS</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the name of the target locus in which
    the score was found, in the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>TARGETACCESSION</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the accession number of the target locus
    in which the score was found, in the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>TARGETDESCRIPTION</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the description of the target locus in
    which the score was found, in the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>PERCENTSCORE</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the ratio of the score to the maximum
    possible score in the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>MAXSCORE<br>
        MAXSCORED<br>
        MAXSCOREC<br>
        MAXSCORE1<br>
        MAXSCORE2<br>
        MAXSCORE3<br>
        MAXSCORE-1<br>
        MAXSCORE-2<br>
        MAXSCORE-3</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the maximum possible score in the
    record. These fields may be empty if a search was not requested in the frame referenced in
    the field.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>MATCHES</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the total number of alignment character
    matches in the record. These are perfect matches.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>SIMILARITIES</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">The number of identical and similar matches.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>GAPS</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the total number of alignment gaps in
    the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>PERCENTALIGNMENT</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the ratio of the total identical matches
    to the alignment length in the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>PERCENTQUERY</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the ratio of the total identical matches
    to the query length in the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>PERCENTTARGET</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the ratio of the total identical matches
    to the target locus length in the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>SIMPERCENTALIGNMENT<br>
        SIMPERCENTQUERY<br>
        SIMPERCENTTARGET</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">These are the same as the percent fields
    above, except that the percentage is that of similar matches, not the identical matches.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>QUERYSTART</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the query start location in the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>QUERYEND</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the query end location in the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>TARGETSTART</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the target locus start location in the
    record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>TARGETEND</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the target locus end location in the
    record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>QUERY</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the query data for the alignment in the
    record.&nbsp;This field is for BLAST searches only. Use the following fields for
    Smith-Waterman related searches.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>QUERYNT</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the query nucleotide data for the
    alignment in the record.&nbsp;</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>QUERYAA</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the query amino acid data for the
    alignment in the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>COMPARISON</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the alignment comparison information in
    the record.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>TARGET</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the target locus nucleotide data for the
    alignment in the record.&nbsp;This field is for BLAST searches only. Use the following
    fields for Smith-Waterman related searches.</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>TARGETNT</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the target locus nucleotide data for the
    alignment in the record.&nbsp;</font></td>
  </tr>
  <tr>
    <td WIDTH="43%" VALIGN="TOP">
        <font SIZE="2"><p><strong>TARGETAA</strong></font></p>
    </td>
    <td WIDTH="57%" VALIGN="TOP"><font SIZE="2">Place the target locus amino acid data for the
    alignment in the record.&nbsp;</font></td>
  </tr>
</table>

<h4>EXAMPLES</h4>

    <code><p>FIELDS: RANK SCORE QUERYNT COMPARISON TARGETNT</p>
    </code><font SIZE="2"><p>This example causes comma-delimited output to contain the
    specified fields. A sample output may look like the following:</p>
    </font><code><p>&quot;1&quot;, &quot;10.0&quot;,&quot;ACGT&quot;,&quot;|| &quot;,
    &quot;ACAC&quot;<br>
    &quot;2&quot;, &quot;5.0&quot;,&quot;ACGT&quot;,&quot;| &quot;, &quot;ATAC&quot;</code></p>

</td></tr></table>

<!-- footer using external javascript file starts here -->
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setNext("Blastresults.jsp");
setPrevious("");
writeFooter();
</script>
<!-- end footer -->
</body>
</html>

