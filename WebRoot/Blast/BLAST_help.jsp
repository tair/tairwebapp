<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("BLAST help") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("2") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>


<span class="header">TAIR BLAST Help</span>

<P><HR SIZE=1 NOSHADE WIDTH=95%><P>


<ul>
<li><a href="#general">General information</a>
<li><a href="#methods">BLAST methods</a>    
<li><a href="#datasets">TAIR Datasets</a> 
<li><a href="#query">Entering query sequences</a>
<li><a href="#formats">Input data formats</a>
<li><a href="#filtering">Filtering</a>
<li><a href="#results">Results options</a>
<li><a href="#parameters">Advanced parameters</a>
<li><a href="#output">File output options</a>
<li><a href="/Blast/Blastresults.jsp">BLAST Results</a>
</ul>
<p>

<P><HR SIZE=1 NOSHADE WIDTH=95%><P>

<B><a name="general">General Information</B><BR><BR>

BLAST stands for Basic Local Alignment Search Tool and was developed by Altschul et al. (1990) and significantly improved by <a href=http://www3.oup.co.uk/nar/Volume_25/Issue_17/freepdf/>Altschul et al. (1997).</a>  It
is a very fast search algorithm that is used to separately search
protein or DNA databases.  BLAST is best used for sequence similarity
searching, rather than for motif searching. For searches using a query
sequence of fewer than twenty residues, <a
href="/cgi-bin/patmatch/nph-patmatch.pl">PatMatch</a> is the best choice.  Another sequence alignment tool that may yield
different results from BLAST, and may be useful for motif searching,
is <a href=/cgi-bin/fasta/TAIRfasta.pl>FASTA</a>.  To search nonplant datasets, try <a href=http://seqsim.ncgr.org/newBlast.html>NCGR BLAST</a> or <a href=http://www.ncbi.nlm.nih.gov/blast/blast.cgi?Jform=0>NCBI BLAST</a>.
<p>

<p>
A fairly complete on-line guide to BLAST searching can be found
at the <a
href="http://www.ncbi.nlm.nih.gov/BLAST/blast_help.html">NCBI BLAST
Help Manual</a>.  For a theoretical overview of BLAST, see the <a href=http://www.ncbi.nlm.nih.gov/BLAST/tutorial/Altschul-1.html>NCBI BLAST Course</a>.  Additional information can be found in the <a href="/blast/aboutblast2.htm">BLAST 2.0 Release Notes</a>

<P><HR SIZE=1 NOSHADE WIDTH=95%><P>

<h2><a name="methods">BLAST Methods</h2>

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

<P><HR SIZE=1 NOSHADE WIDTH=95%><P>
<h2><a name="datasets">TAIR Datasets</h2>

<dl>
  <dt><b><a>Genes from AGI, Total Genome (DNA)</a></b></dt>
  <dd>All Arabidopsis transcription unit (gene) sequences from AGI. This data are kindly provided by TIGR and is called ATH1.seq on their ftp site.</dd>
      <dt><b><a>CDS from AGI, Total Genome (DNA)</a></b></dt>
  <dd>All Arabidopsis coding sequences from AGI. This data are kindly provided by TIGR and is called ATH1.cds on their ftp site.</dd>
      <dt><b><a>Proteins from AGI, Total Genome (Protein)</a></b></dt>
  <dd>All Arabidopsis Protein sequences from AGI. This data are kindly provided by TIGR and is called ATH1.pep on their ftp site.</dd>

<dt><b>TIGR BAC Sequences (DNA)</b></dt>
  <dd>Arabidopsis genomic sequences from TIGR, sequenced by the
      Arabidopsis Genome Initiative (AGI) project. The sequences are from
      BAC, cosmid, TAC, P1, and YAC clones.  This dataset includes
      approximately the same clones as the GenBank AGI BAC Sequences (DNA)
      set below, but the sequences have been extended in some cases using
      sequence from an adjacent clone to improve overlaps.  This dataset
      is kindly provided by TIGR and is called ATH1.bacs.con on their ftp
      site.</dd>

<dt><b>GenBank AGI BAC Sequences (DNA)</b></dt>
      <dd>
      Arabidopsis genomic sequences from GenBank, sequenced by the
      Arabidopsis Genome Initiative (AGI) project. The sequences are from
      BAC, cosmid, TAC, P1, and YAC clones.  This dataset includes
      approximately the same clones as the TIGR BAC Sequences (DNA) set
      above, but uses the sequences deposited into GenBank rather than the
      modified sequences used for annotation by TIGR.
      </dd>

  <dt><b><a>GenBank, including ESTs & BAC ends (DNA)</a></b></dt>
  <dd>All Arabidopsis DNA from GenBank including ESTs and BAC ends</dd>
  <dt><b><a>GenBank, minus ESTs & BAC ends (DNA)</a></b></dt>
  <dd>All Arabidopsis DNA from GenBank without ESTs and BAC ends</dd>
  <dt><b><a>GenPept, PIR, &amp; SwissPROT (Protein)</a></b></dt>
  <dd>All Arabidopsis proteins</dd>
  <dt><b><a>New GenBank (DNA)</a></b></dt>
  <dd>All Arabidopsis DNA from GenBank that has been added within the last month</dd>
  <dt><b><a>GenBank and Kazusa BAC Ends (DNA)</a></b></dt>
  <dd>All GenBank and Kazusa Arabidopsis BAC end sequences</dd>
  <dt><b><a>GenBank ESTs (DNA)</a></b></dt>
  <dd>All Genbank Arabidopsis ESTs</dd>
  <dt><b><a>Insertion Flank Sequences (DNA)</a></b></dt>
  <dd>T-DNA insertion flanking sequences from the Salk Insititute (Ecker and colleagues) and Institute of Molecular Agrobiology (IMA, Sundaresan and colleagues) </dd>
  <dt><b><a>All Higher Plant Sequences (DNA)</a></b></dt>
  <dd>All Viridiplantae sequences from GenBank</dd>
  <dt><b><a>Loci Upstream Sequences-500bp</a></b></dt>
  <dd>500bp of sequence preceding the 5' end of each transcription unit.</dd>
  <dt><b><a>Loci Upstream Sequences-1000bp</a></b></dt>
  <dd>1000bp of sequence preceding the 5' end of each transcription unit.</dd>
  <dt><b><a>Loci Upstream Sequences-3000bp</a></b></dt>
  <dd>3000bp of sequence preceding the 5' end of each transcription unit.</dd>
  <dt><b><a>Loci Downstream Sequences-1000bp</a></b></dt>
  <dd>1000bp of sequence following the 3' end of each transcription unit.</dd>
  <dt><b><a>Loci Downstream Sequences-3000bp</a></b></dt>
  <dd>3000bp of sequence following the 3' end of each transcription unit.</dd>
  <dt><b><a>Intergenic</a></b></dt>
  <dd>Contains the intergenic seqeunce between all the genes in the Arabidopsis
	genome.</dd>
  <dt><b><a>Intron</a></b></dt>
  <dd>Contains all the introns of every gene in the Arabidopsis genome.</dd>
  <dt><b><a>Brassica (DNA)</a></b></dt>
  <dd>All Brassica sequences from GenBank</dd>
</dl>

<P><HR SIZE=1 NOSHADE WIDTH=95%><P>

<h2><a name="query">Entering query sequences</h2>

When pasting sequences into the text box, be aware that a single sequence
is limited to 7000 characters in length; when you paste multiple sequences
(up to five are allowed) you are limited to a total of 15,000 characters.
These limitations may be changed in the future.&nbsp; If you have a longer
sequence, or many sequences, use the file upload feature.&nbsp; This
feature is not supported on some versions of Microsoft's Internet Explorer
web browser.&nbsp; If you do not see a &quot;Browse...&quot; button near
the file upload text box (that displays your computer's filesystem
directory when clicked), we suggest using Netscape or another browser
supporting file uploading.
<p>
To submit multiple query sequences, paste up to 5 sequences
into the input box or, for a larger number of query sequences,
upload a file containing the concatenated sequences.  For this
option the files cannot be in raw format because they will be
interpereted as a single query sequence.

<p>To use the Browse option to upload a local file:
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

<P><HR SIZE=1 NOSHADE WIDTH=95%><P>

<h2><a name="formats">Input Data Formats</h2>
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

<p>A sequence in <a href="/blast/FASTA.HTM">FASTA</a> format begins with a single-line description, followed by lines of
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
      
<P><HR SIZE=1 NOSHADE WIDTH=95%><P>
<h2><a name="filtering">Filtering</h2>

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

<P><HR SIZE=1 NOSHADE WIDTH=95%><P>
<B><a name="results">Results Options</B><BR><BR>

<dl>
  <dt><b><a>Output title:</a></b></dt> 
  <dd>Type in the title you would like to appear at the top of your BLAST output.</dd>
  
<dt>&nbsp;</dt>
  
<dt><b><a name="EMAIL">E-mail address:</a></b> </dt>
  <dd>Entering your email address is suggested even if requesting a browser reply, and may be
    mandatory depending on server configuration options.&nbsp; Depending on server loading, or
    the expected execution time of your request, the server may convert your request to an
    email reply and auto-select the <a href="#URL">E-mail URL</a> option. This avoids the
    frustration of wondering when your job will finish, and allows you to request more jobs
    quicker.&nbsp; </dd>
  <dt>&nbsp;</dt>
<hr>
  <dt><b><a name="VIA">Return Results:</a></b> </dt>
<p>
  <dt><b><a>To your web browser</a></b></dt>
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
  
  <dt><b>By E-mail message</b> </dt>
  <dd>The results are sent within the body of a normal email message, to the email address you
    enter.&nbsp; Any comments you type will appear as the Subject of the email message.
    Generally, you should use this option only if your mail system can handle large messages,
    and you've asked for textual output.&nbsp; If requesting HTML format by email, either of
    the following choices may be better if your mail reader software is not HTML-aware.</dd>
  <dt>&nbsp;</dt>
  <dt><b><a name="URL">By</a> E-mail notice to URL</b> </dt>
  <dd>Many mail systems have trouble with large email messages, and may split or truncate
    them. &nbsp; Our blast server will retain your results and send you a short email containing a URL
    (<em>Uniform Resource Locator</em>; to use with your web browser or HTML-aware mail
    reader) indicating where to obtain your results.&nbsp; We will delete your results
    after the date and time indicated in the email message.</dd>
  <dt>&nbsp;</dt>

<hr>      
  <dt><b><a name="VIA-form">Result Format:</a></b> </dt>
<p>


  <dt><b><a name="BIG-HTML">HTML</a> hypertext</b> (file type &quot;htm&quot;)<br>
  </dt>
  <dd>HTML format is used by web browsers.&nbsp; Accession numbers that appear in the query and target loci names and descriptions will be
    hyperlinked to allow easy access to additional sequence information.&nbsp; Embedded Java
    &quot;Applets&quot; may be used to render graphical information (e.g., the ClustalW
    dendrogram), which will not appear unless your browser is set to permit these applets to
    run.&nbsp; </dd>

  
<dt>&nbsp;</dt>
  <dt><b>Normal text</b> (file type &quot;txt&quot;)</dt>
  <dd>The results are returned as conventional human-readable text. </dd>
  
  <dt>&nbsp;</dt>
  <dt><b>Comma-delimited records</b> (file type &quot;csv&quot;)</dt>
  <dd>Information is returned as quoted, comma-separated fields and records, compatible with
    Excel, Word, Access and most database products.&nbsp; These products allow simple viewing
    and sorting on any data column.&nbsp; For each query sequence, each rank score produces a
    record.&nbsp; Alignment text is included in those records when available.&nbsp; For
    example, if you ask for the best 100 scores and best 25 alignments, the alignment text
    fields will be null strings for the last 75 records of each query.&nbsp; For BLAST scores
    that return more than one alignment, a separate record is generated for each.</dd>
<dt>&nbsp;</dt>

  <dt><b>Tab-delimited records</b> (file type &quot;tab&quot;)</dt>
  <dd>Similar to comma-delimited, but no quotes are used, and tabs replace comma characters as
    the field separator.&nbsp; More commonly used in UNIX environments. </dd>
  <dt>&nbsp;</dt>
</dl>


<P><HR SIZE=1 NOSHADE WIDTH=95%><P>
<h2><a name="parameters">Advanced parameters</a></h2>
  <a href=BLASToptions.jsp>View Default Settings</a>    
<p>
      <dl>
  <dt><b><a name="descriptions">Max Scores</a></b> <a href="BLASToptions.jsp#descriptions">Default Setting</a> </dt>
  <dd>Restricts the number of short descriptions of matching sequences reported to the number
    specified; default limit is 25 descriptions. See also <a href = "#expect">Expectation</a>. </dd>
  <dt>&nbsp;</dt>
  <dt><b><a name="alignments">Max Alignments</a></b> <a href="BLASToptions.jsp#alignments">Default Setting</a></dt>
  <dd>Restricts database sequences to the number specified for which high-scoring segment
    pairs (HSPs) are reported; the default limit is 15. If more database sequences than this
    happen to satisfy the statistical significance threshold for reporting (see <a href = "#expect">Expectation</a>),
    only the matches ascribed the greatest statistical significance are reported. </dd>
  <dt>&nbsp;</dt>
  <dt><b><a name="expect">Expectation</a></b> <a href="BLASToptions.jsp#expect">Default Setting</a></dt>
  <dd>The statistical significance threshold for reporting matches against database sequences;
    the default value is 10, such that 10 matches are expected to be found merely by chance,
    according to the stochastic model of Karlin and Altschul (1990). If the statistical
    significance ascribed to a match is greater than the EXPECTATION threshold, the match will
    not be reported. Lower EXPECT thresholds are more stringent, leading to fewer chance
    matches being reported. Fractional values are acceptable. </dd>
  <dt>&nbsp;</dt>
  <dt><a name="gencodes"><b>Query and Database Genetic Code</b></a> <a href="BLASToptions.jsp#gencodes">Default Setting</a></dt>
  <dd>Genetic code to be used in BLASTX translation of the query. </dd>
    <dt>&nbsp;</dt>
  <dt><b><a name = "gapped">Gapped Alignments</a></b>
  <dd>Whether to allow gapped alignments; either ON or OFF.</dd>
  <dt>&nbsp;</dt>
  <dt><b><a name = "open">Gap Opening Penalty</a></b> <a href="BLASToptions.jsp#open">Default Setting</a></dt> 
<dd>
Cost to open a gap; a 0 in the field means to use the default. Supported values for BLASTP, BLASTX, TBLASTN, and TBLASTX are limited.</dd>
<dt>&nbsp;</dt>
<dt><b><a name = "extend">Gap Extension Penalty</a></b> <a href="BLASToptions.jsp#extend">Default Setting</a></dt>
<dd>
Cost to extend a gap, a 0 in this field means to use the default. Supported values for BLASTP, BLASTX, TBLASTN, and TBLASTX are limited.</dd>
<dt>&nbsp;</dt>
<dt><b><a name = "mismatch">Nucleic Mismatch</a></b> <a href="BLASToptions.jsp#mismatch">Default Setting</a></dt>
<dd>
Penalty for a mismatch in the BLAST&#8482; portion of run.</dd> 
<dt>&nbsp;</dt>
<dt><b><a name = "match">Nucleic Match</a></b> <a href="BLASToptions.jsp#match">Default Setting</a></dt>
<dd>
Reward for a match in the BLAST&#8482; portion of run.</dd> 
<dt>&nbsp;</dt>
<dt><b><a name = "word">Word Size</a></b> <a href="BLASToptions.jsp#word">Default Setting</a></dt>
<dd>
The size of the initial word that must be matched between the database
and the query sequence.</dd>
<dt>&nbsp;</dt>
<dt><b><a name = "matrix">Matrix</a></b>
    <a href="BLASToptions.jsp#matrix">Default Setting</a></dt>
    <dd>
The amino acid substitution 
<a href = "http://twod.med.harvard.edu/seqanal/matrices.html">matrix</a>
to be used for protein comparisons.  Both BLOSUM and PAM 
matrices are available at several different levels of evolutionary distance.
</dd>
<dt>&nbsp;</dt>
<dt><b><a name = "ext">Extension Threshold</a></b>
<dd>
The threshold above which BLAST&#8482; will extend a hit found.  The hit is based on finding a word of a certain size (see <a href="#word">Word Size)</a></dd>
<dt>&nbsp;</dt>

<dt>&nbsp;</dt>

<dt><b><a name = "threshold">Reporting Threshold</a></b>
<dd>This keyword allows a score value to be specified as the threshold for 
displaying scores.  Scores below this value are not shown.
</dd>
<dt>&nbsp;</dt>

<!--
<P><HR SIZE=1 NOSHADE WIDTH=95%><P>
<h2><a name="output">File output options</a></h2>


<dl>
  <dt><b><a name="FIELDS">Advanced</a> options for Comma- and Tab-delimited formats</b> </dt>
  <dd><strong>Header-Record</strong>&nbsp;&nbsp;&nbsp; if checked, the first record will
    contain the field names as shown in the table below.<br>
    <strong>Selected Fields&nbsp;</strong>&nbsp;&nbsp;&nbsp; if left blank, a default set of
    fields is returned.&nbsp; To customize, select from the following keywords; put a space
    between each.</dd>
</dl>
<font SIZE="2"><b>

<p>KEYWORDS</p>

    </b><p><strong>ClustalW does not presently support tab- and comma-delimited formats.</strong><br>
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
<b><font SIZE="2">

<p>EXAMPLES</p>

    </font><code><p>FIELDS:</b> RANK SCORE QUERYNT COMPARISON TARGETNT</p>
    </code><font SIZE="2"><p>This example causes comma-delimited output to contain the
    specified fields. A sample output may look like the following:</p>
    </font><code><p>&quot;1&quot;, &quot;10.0&quot;,&quot;ACGT&quot;,&quot;|| &quot;,
    &quot;ACAC&quot;<br>
    &quot;2&quot;, &quot;5.0&quot;,&quot;ACGT&quot;,&quot;| &quot;, &quot;ATAC&quot;</code></p>


//-->

<BR>
<BR>
<A HREF="/Blast/">Return to TAIR BLAST input form</A>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
