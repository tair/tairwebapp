<html>
<head>
<title>TAIR Help:Bulk Sequence Retrieval</title>
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
<ul><b>Contents</b>
<li><a href="#bulk1">Using the Bulk Sequence Download</a>
<li><a href="#bulk2">Input Options.</a> 
<ul>
<li><a href="#bulk6">Typing/Pasting in locus identifiers</a>
<li><a href="#bulk7">Uploading a file from a local computer</a>
<li><a href="#bulk8">Special format for intron sequences</a>
</ul>
<li><a href="#bulk3">Choosing a dataset.</a>
<li><a href="#bulk4">Choosing the output format.</a>
<li><a href="#bulk9">Exporting sequences for analysis.</a>
</ul>
<p>
<a name="bulk1"></a><h2>Using the Bulk Sequence Download Tool</h2>
<p>
<a name=""></a><font class="cont">TAIR's Bulk Sequence Download tool can be used to obtain a defined set of nucleotide or amino acid sequences. This tool only retrieves AGI sequences and uses AGI locus identifiers. To obtain specific sequences in bulk from GenBank (e.g. EST sequences using GenBank accessions) you can use <a href="http://www.ncbi.nlm.nih.gov:80/entrez/batchentrez.cgi?db=Nucleotide">NCBI's Batch Entrez </a>. Alternatively, if you wish to obtain entire datasets (e.g. all protein sequences, all GenBank EST sequences) you can download these from our <a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets">FTP server</a>. Sequence files can be obtained in one of two formats. You can choose to obtain FASTA formatted sequence files which are suitable for uploading into a variety of analysis programs such as CLUSTAL W, BLAST or a motif finding program. You can also obtain a tab delimited text file which can be opened in a standard spreadsheet program such as Microsoft Excel. See <a href="#bulk4">Output Options</a> below, for specific information about these formats.</font>

<p>
<a name="bulk2"></a><h2>Selecting Sequences</h2>
<p><a name=""></a><font class="cont">This section describes the input format for the Bulk Sequence Download. All searches utilize the AGI locis identifier to specify the target sequences to retrieve. YOU MUST enter at least one locus id. The general format for a locus identifier is At1g01030. For obtaining intron sequences, see  <a href="#bulk7">special format for intron sequences</a> in this section.The identifiers have to be separated by tabs (e.g. At1g01030&nbsp;&nbsp;&nbsp;At1g01040&nbsp;&nbsp;&nbsp;At1g01050), commas (e.g. At1g01030,At1g01040,At1g01050), spaces (e.g. At1g01030 At1g01040 At1g01050) or carriage returns (e.g.<br>
At1g01030<br>
At1g01040<br>
At1g01050). </font><p>
<a name=""></a><font class="cont">To obtain amino acid sequences you must choose the AGI protein sequences. All other data sets return nucleotide sequences only. For intergenic sequences-paste in the locus identifiers for which you want to obtain the intergenic region. For example, choosing At1g01040,At1g01050 will return the sequences between these two loci. If only ONE locus ID is specified (e.g. At1g01040) then the intergenic region between At1g01040 and the gene immediately to the left on the chromosome (regardless of the orientation of the gene),  will be returned.</font>
<a name="bulk6"></a><h4>Typing or pasting in a list of locus identifiers</h4>
<p><a name=""></a><font class="cont">The simplest way to specify which loci you wish to obtain sequence data for is to type or paste in the name(s) of the loci into the text input box. The identifiers must be in the format specified above. With the exception of intron sequence searches , you do NOT need to include the gene model suffix with the identifier.</font>
<a name="bulk7"></a><h4>Uploading a list of locus identifiers from your computer</h4>
<p><a name=""></a><font class="cont">Provided your list of identifiers is in one of the formats specified above, you can upload this list from your computer. If you know the exact path to the file on your computer, type it in to the "Slurp in file" input box. Alternatively, click on the browse button to browse through the files on your computer. Once you have identified the correct file, click 'Open' and the file path will appear in the file input box. <font color="red">NOTE:</font>Excel formatted files will NOT work. Files must be text only format. Word or Excel files must be saved as text-only format.</font>
<a name="bulk8"></a><h4>Special format for obtaining intron sequences a given locus</h4>
<p><a name=""></a><font class="cont">A special format is required for obtaining intron sequences using the Intron Sequences dataset.The format must include the locus identifier followed by the gene model suffix. To specify which intron, the locus id.suffix is followed by a hyphen (-), the letter I and the number of the intron you wish to retrieve. For example, to obtain the sequence of the first intron on the AGAMOUS gene the format would be AT4G18960.1-I1. This format is ONLY require when the INTRON SEQUENCES dataset is selected.</font>
<p>
<a name="bulk3"></a><h2>Choosing a dataset</h2>
<p>
<p><a name=""></a><font class="cont">The bulk sequence download uses many of the same datasets that are available for the BLAST, FASTA and other sequence analysis programs.Click <a href="BLAST_help.jsp#datasets">here</a> for specific information about these datasets and how they were obtained.Use the drop down menu to select the dataset you wish to obtain sequences from (e.g. AGI transcripts to obtain cDNA sequences with UTR's included, or Upstream Sequences to obtain 500, 1000, or 3000 base pairs of sequences upstream of a given locus).</font> 

<p>
<a name="bulk4"></a><h2>Output options</h2>
<p>
<a name=""></a><font class="cont">You can choose to obtain the sequences as either a FASTA formatted file or a tab-delimited text. Result sets will be displayed in your browser. To save the results on your computer, use the "Save" or "Save As" option in the browser toolbar.</font>
<ul>
<li> Example of FASTA formatted results<br>

>AT1G01030.1 length=1077 [CHR 1 START 12642 END 11566]   DNA-binding protein, putative
ATGGATCTATCCCTGGCTCCGACAACAACAACAAGTTCCGACCAAGAACAAGACAGAGACCAAGAATTAACCTCCAACATCGGAGCAAGCAGCAGCTCCG<br>
GTCCCAGCGGAAACAACAACAACCTTCCGATGATGATGATTCCACCTCCGGAGAAAGAACACATGTTCGACAAAGTGGTAACACCAAGCGACGTCGGAAA<br>
ACTCAACAGACTCGTGATCCCTAAACAACACGCTGAGAGGTATTTCCCTCTAGACTCCTCAAACAACCAAAACGGCACGCTTTTGAACTTCCAAGACAGA<br>
AACGGCAAGATGTGGAGATTCCGTTACTCGTATTGGAACTCTAGCCAGAGCTACGTTATGACCAAAGGATGGAGCCGTTTCGTCAAAGAGAAAAAGCTCG<br>
ATGCAGGAGACATTGTCTCTTTCCAACGAGGCATCGGAGATGAGTCAGAAAGATCCAAACTTTACATAGATTGGAGGCATAGACCCGACATGAGCCTCGT<br>
TCAAGCACATCAGTTTGGTAATTTTGGTTTCAATTTCAATTTCCCGACCACTTCTCAATATTCCAACAGATTTCATCCATTGCCAGAATATAACTCCGTC<br>
CCGATTCACCGGGGCTTAAACATCGGAAATCACCAACGTTCCTATTATAACACCCAGCGTCAAGAGTTCGTAGGGTATGGTTATGGGAATTTAGCTGGAA<br>
GGTGTTACTACACGGGATCACCGTTGGATCATAGGAACATTGTTGGATCAGAGCCGTTGGTTATAGACTCAGTCCCTGTGGTTCCCGGGAGATTAACTCC<br>
GGTGATGTTACCGCCGCTTCCTCCGCCTCCTTCTACGGCGGGAAAGAGACTAAGGCTCTTTGGGGTGAATATGGAATGTGGCAATGACTATAATCAACAA<br>
GAAGAGTCATGGTTGGTGCCACGTGGCGAAATTGGTGCATCTTCTTCTTCTTCTTCAGCTCTACGACTAAATTTATCGACTGATCATGATGATGATAATG<br>
ATGATGGTGATGATGGCGATGATGATCAATTTGCTAAGAAAGGGAAGTCTTCACTTTCTCTCAATTTCAATCCATGA<br>
<li>Fields for tab delimited text formatted results.<br>
column 1: TAIR sequence ID<br>
column 2: Description<br>
column 3: Sequence<br>
</ul>
<p>
<a name="bulk9"></a><h4>Exporting sequences for analysis.</h4>
<p><font class="cont">Many sequence analysis programs accept FASTA formatted sequences as an input format. Select the Fasta output format and click 'Get Sequences'. To save the Fasta formatted results you use one of the following methods:<br><br>
1) Copy the contents of the html output and paste into a word processing software (such as Microsoft Word) document. Then save the document in text format.<br><br>
2)Use the browser to save the page. Under "File" choose, "save as" and then save the page on your computer. If your browser allows the option of saving as text, do so.</font><br>
<a name="bulk10"></a><h4>Sending sequence to ClustalW</h4>
<p><font class="cont">This feature allows you to quickly obtain a set of sequences using the locus ids and analyze the sequences using a multiple sequence alognment program (ClustalW from The European Bioinformatics Institute). ClustalW takes protein or nucleotide sequences in Fasta format, and aligns them to identify similarities and differences. For example,you can upload a set of locus identifiers that represent all members of an Arabidopsis gene family and then send the fasta fformatted sequences to the multiple sequence alignment program ClustalW at the EBI. For more information about ClustalW see:<a href="http://www.ebi.ac.uk/clustalw/">ClustalW at EBI</a>.</font>
<!-- footer using external javascript file starts here --> 
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("");
setNext("");
writeFooter();
</script>
<!-- end footer -->
</body>
</html>
