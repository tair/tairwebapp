<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "TAIR FAQ";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page errorPage="/jsp/common/gen_error.jsp"%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="205" />
</jsp:include>

<jsp:include page="/jsp/includes/helpSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="FAQ"/>
</jsp:include>

<div id="rightcolumn">




<p>The answers to some frequently asked questions can be found on this page. Use the broad categories listed below to jump to the section relevant to your question. If you cannot find the answer you are looking for you can send email to the TAIR curators at <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a>.</p>

<ul>
<li><a href="#annotation">Gene Annotation</a></li>
<li><a href="#tools">Analysis Tools</a></li>
<ul>
<li><a href="#similarity">BLAST,WuBLAST, FASTA and PatMatch</a></li>
<li><a href="#seqview">SeqViewer</a></li>
<li><a href="#mapviewer">MapViewer</a></li>
<li><a href="#aracyc">AraCyc</a>
</li></ul>
<li><a href="#microarray">Gene Expression</a></li>
<li><a href="#marker">Markers and Polymorphisms</a></li>
<li><a href="#download">Bulk Download,Custom and FTP datasets</a></li>
<li><a href="#orders">Seed/DNA stocks and ordering</a> </li>
<li><a href="#jobs">Job Postings </a></li>
<li><a href="#update">New and updated data</a></li>
<li><a href="#datasubmission">Data Submissions and Corrections</a></li>
<li><a href="#names">Gene nomenclature</a></li>
<li><a href="#dev">Developer's FAQ</a></li>
<ul>
<li><a href="#tair">Retrieving data from TAIR with scripts</li>
</ul>
</ul>
<hr></hr>
<p><a name="annotation"><b>Genome Annotations</b></a>
<p><i>Where can I find a list of coordinates for all genes
 (including UTRs, introns and exons) and other transcripts?</i></p>
<p><font class="cont">
Please go to <a href="ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR10_genome_release"> ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR10_genome_release</a> 
to find the complete list of all gene models from the TAIR10 release. These lists are available in different formats such as gff and xml formats and some 
contain specific subsets of genes such as all genes whose structures changed between releases TAIR9 and TAIR10, or all new gene models. 

Coordinate information of other sequences such as ESTs and cDNAs as well as coordinates of markers and polymorphisms, can be found at <a href="ftp://ftp.arabidopsis.org/home/tair/Maps/seqviewer_data">ftp://ftp.arabidopsis.org/home/tair/Maps/seqviewer_data</a>.</p>
<p><i>Where do the gene structural annotations in TAIR come from?</i>
<p><font class="cont">The final TIGR Arabidopsis genome annotation was released in 2004. As of 2005, TAIR has taken on the task of updating Arabidopsis gene structures and adding new genes and splice variants. Gene models are updated using cDNA/EST evidence from GenBank and with sequence data provided by users. </font>
<p><i>Where can I find a list of GenBank accessions that correspond to AGI locus identifiers?</i></p>
<p><font class="cont">A file containing the mapping can be downloaded from the TAIR ftp site<a href="ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR10_genome_release/"> TAIR10_genome_release</a>.</font></p>
<p><i>Why do AGI loci in TAIR differ from MIPS?</i>
<p><font class="cont">This is probably due to differences in annotation methods used by TIGR and MIPS. You can see annotations in TIGR and MIPS by clicking on their respective links in the "External Links" band on TAIR locus/gene detail pages.
<p>Related pages:<br /> MIPS ; <a href="http://mips.gsf.de/proj/thal/db/index.html">MATDB</a> <br /> TIGR ;  <a href="http://www.tigr.org/tdb/e2k1/ath1/">Arabidopsis Database</a>
<p><i>Why do the coordinates for a gene/BAC/5'UTR etc... differ in TAIR from what I expect?</i>
<p><font class="cont"> There are several reasons why the coordinates of various gene/genome features can differ:
<ul>
<li>The annotation may have changed between versions of the genome release. Currently we are using the TAIR10 release for the SeqViewer and many BLAST datasets.</li>
<li>BAC lengths in GenBank differ from AGI BACS. Many of the BAC sequences used by the AGI were trimmed to remove overlaps whereas clones with the same name in GenBank are untrimmed and longer. Other AGI BACS were extended by TIGR, adding sequences from adjacent BACs for easier annotation of genes near BAC ends. On SeqViewer, the AGI BACs are called Assembly Units.</li>
<li>Structural annotations may differ between GenBank and AGI sequences. TAIR builds gene models based on a combination of cDNA and EST sequences from GenBank. A gene's UTR may therefore be extended based on EST alignments even though cDNA is in relative terms truncated. 
</li></ul>
<p>Related pages:<br /> <a href="http://www.tigr.org/tdb/e2k1/ath1/eukan_routine.shtml">TIGR Eukaryotic Gene Annotation Routine</a> <br />
Search <a href="/tools/bulk/locushistory/index.jsp"> Locus History </a>
<p><i>Are ALL Arabidopsis genes annotated? My gene seems to be missing.</i>
<p><font class="cont">
<ul>
<li>Some gene models may not have been predicted by our annotation process because of limitations of the gene prediction software. If you are using BLAST or another sequence similarity search tool on TAIR, choose AGI whole genome (BAC clones),  or GenBank whole genome (BAC clones) datasets. Unannotated genes will not be found in AGI transcript, protein, cds or gene data sets.<br />
<li>"Missing" genes may reside in one of the few remaining known gaps in the sequence including highly repetitive regions that are difficult to sequence. See:<a href="/portals/genAnnotation/gene_structural_annotation/agicomplete.jsp ">Genome Update</a> pages for information about gaps, incomplete clone sequences and genome monitoring status.<br />
<li> If you have sequenced a gene that is not in the database, please let us know; see the <a href="/submit/gene_annotation.submission.jsp">format for submitting gene annotations</a> page for instructions on how to submit corrections.<br />
<li>Some genes which existed in earlier annotation releases may have been obsoleted, or merged or split into 2 new gene models. To find out when a gene was added or removed, or whether a gene has been split or merged, try the <a href="/tools/bulk/locushistory/index.jsp">TAIR locus history search</a><br />
</li></ul></font>
<p><i>How can I obtain a list of functional categories for a set of genes?</i>
<p><font class="cont">TAIR and TIGR have been annotating Arabidopsis genes using Gene Ontology terms to describe a genes molecular function, subcellular localization and biological process. To obtain all of the GO annotations for a set of genes:
<ul>
<li>Go to Tools-> Bulk Data Retrieval->GO Annotations.
<li>Paste in or upload a list of locus identifiers for your genes (e.g. AT1G23030).
<li>Choose html or text for <1000 genes. 
<li>If you save the html file as text from your browser or save as text, you can open the file using spreadsheet software such as Microsoft Excel.
</li></ul></font>
<p>Related Pages:<br /> About TAIR GO annotations (Arabidopsis Info-> Ontologies-> <a href="/portals/genAnnotation/functional_annotation/go.jsp">Gene Ontology Annotation at TAIR</a>) ;<a href="http://arabidopsis.org/help/tutorials/go_intro.jsp">TAIR GO annotations tutorial</a>;  <a href="http://www.geneontology.org">Gene Ontology Consortium </a>

<p><a name="tools"><b>Software/Analysis Tools</b></a>
<p><a name="similarity"><b>BLAST, WuBLAST, FASTA, PatMatch</b></a>
<p><i>What are the specialized datasets available at TAIR for similarity searching (e.g. BLAST, FASTA)?</i>
<p><font class="cont">TAIR's datasets include: AGI transcript, peptide, cds and gene sequences; introns only; insertion flank sequences; locus upstream and downstream sequences and more. For a full listing of the available data sets see:<a href="/help/helppages/BLAST_help.jsp#datasets">Datasets</a>. These data sets are common to BLAST, WuBLAST,FASTA and PatMatch.</font> 
<p><i>How can I get TAIR BLAST datasets to use with my locally installed BLAST program?</i>
<p><font class="cont">All of the BLAST datasets are available from our <a href="ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR7_genome_release/TAIR7_blastsets">FTP site > Sequences directory</a>. Please read the README file in the directory for more information about the datasets.</font>
<p><i>Can I obtain TAIR software/tools?</i>
<p><font class="cont">Yes you can.  </font>
<p>Related pages:<br /> <a href="/about/software.jsp">TAIR software and licensing information</a> ; <a href="ftp://ftp.arabidopsis.org/home/tair/Software/Patmatch/">PatMatch Software</a>
<p><i>How do I interpret the error message I get when I submit a sequence?</i>
<p><font class="cont">TAIR's algorithm for determining if a sequence is nucleotide or amino acid uses the following rules:<br />
<ul>
<li>For sequences submitted as proteins: an error is returned if the sequence contains the letters J or O, or if the sequence contains any of  EFILPQXZ) and also has U.
<li>For sequences submitted as proteins: Sequences containing ONLY ACGTN or has the letter U but not any of (EFILPQXZ) are treated as nucleotide sequences.
<li>For sequences submitted as nucleotide:If the sequence has the letters J or O, or has any of (EFILPQXZ) and also has U,it will be considered not a valid nucleotide sequence.
<li>For sequences submitted as nucleotide:If the sequence has EFILPQXZ and does not have U it is treated a protein sequence.
</ul></font>
<p><i>Why do some  browsers not work with TAIR BLAST and how can I get see BLAST results with Safari on MacOSX?</i>
<p><font class="cont">The current version of TAIR BLAST might not work with Netscape in older versions of Mac OS (e.g. 8.6). With  Macs running older versions of OSX and Safari (older then version 2.0.4), the results might be downloaded onto your computer rather than returned in your browser window. In order to view results with an older Safari browser you will need to open the downloaded file using Safari. Alternatively, until this problem is resolved, you can choose to have the BLAST results returned via email, or use another browser on OSX such as Internet Explorer or Netscape. </font>
<p><i>Why can't I upload more sequences into TAIR's NCBI BLAST?</i>
<p><font class="cont">Currently we enforce limits on the size of queries (based on input file size and the dataset being queried) to ensure that some queries don't clog up the server. We are working on hardware updates that will enable us to modify these restrictions.</font>
<p>Related pages:<br />  <a href="/help/helppages/BLAST_help.jsp#datasets"> NCBI BLAST limits.
<p><a name="seqview"><b>SeqViewer</b></a>
<p><i>How are the whole chromosome sequences generated?</i>
<p><font class="cont">The chromosome sequences are constructed using the AGI BAC sequences (Annotation Units) and information about the tiling path supplied by TIGR.</font>
<p><i>How can I convert sequence locations in base pairs to centimorgans (cM) and vise versa?</i>
<p><font class="cont">Converting genetic locations to sequence locations will only give an approximate correlation. This is because the conversion depends upon both the genetic map used and the frequency of recombination which is variable within the genome. The most accurate estimate would obtained by comparing the Lister and Dean RI map to the genome sequence (AGI map) for a global genome comparison value. You can also visually align genetic and sequence based maps using the <a href="/servlets/mapper"> MapViewer </a> tool, by aligning common markers from the genetic and sequence maps.
<p><a name="mapviewer"><b>MapViewer</b></a>
<p><i>How up to date is the Lister/Dean RI map data?</i>
<p><font class="cont">The RI map was last updated from NASC mapping data from May, 2001</font>
<p><i></i>
<p><font class="cont"></font>
<p><a name="aracyc"><b>AraCyc</b></a>
<p><i>I am having problems loading a file into the AraCyc Expression Viewer- what's wrong?</i>
<p><font class="cont">There are a few reasons why you might encounter an error when uploading a file into the Expression Viewer:
<ul>
<li>The file does not contain any genes inlcuded in the AraCyc database. The expression viewer can only display expression  
for ARABIDOPSIS genes (using the locus name such as AT1G01050), and then, only those genes that are annotated to biochemical 
pathways in AraCyc. A list of Arabidopsis genes currently inlcuded in AraCyc can be found in 
the <a href="ftp://ftp.plantcyc.org/Pathways/">aracyc_dump</a> file on the TAIR FTP site.
<li>Files created in Excel must be saved in TEXT ONLY format (.xls files will not work). Do NOT include column headers.
</ul></font>
<p><i>How can I obtain a copy of the AraCyc database</i>
<p><font class="cont">You can obtain the AraCyc data in a flat file format from our FTP site <a href="ftp://ftp.plantcyc.org/Pathways/">aracyc dump</a>. Data files are updated periodically so make sure you use the most recently dated file.</font>
<p><i>Are all Arabidopsis pathways in AraCyc?</i>
<p><font class="cont">No, new pathways are being added and existing ones updated. Please check the <a href="/tools/aracyc/"> AraCyc homepage</a> to see what pathways have recently been added and updated.  If you notice a problem with a pathway or have a pathway we should add, please contact us with details and include relevant references.</font>
<p>Related pages:<br />
<a href="/biocyc/index.jsp">AraCyc Homepage</a>

<p><a name="microarray"><b>Gene Expression</b></a>

<p><b>
Please note that TAIR stopped accepting new microarray data submissions in June 2005. 
Newer and more comprehensive microarray data sets are available at <a href="http://www.ncbi.nlm.nih.gov/geo/">GEO</a>, <a href="http://www.ebi.ac.uk/arrayexpress/ ">ArrayExpress</a> 
and <a href="http://affymetrix.arabidopsis.info/narrays/experimentbrowse.pl">NASCArrays</a>.</b></p>

<p><i>Where can I find information about experimental conditions/design of AFGC microarray experiments.</i>
<p><font class="cont">You can now search for microarray experiments directly from the <a href="/servlets/Search?type=expr&search_action=new_search">Microarray Elements Search</a>. In addition, the Expression Viewer display now has direct links to the microarray experiment details. Click on the name of the hybridization in the Expression Viewer to display the information about the experiement.</font>


<p><i>How do I open microarray data files I have downloaded from the TAIR FTP site?</i>
<p><font class="cont">The raw data files for microarray experiments are large and therefore have been compressed. To uncompress the microarray datafiles (with .gz suffix) do the following: For MAC/UNIX/LINUX from the command line in a terminal window type in gzip -d /home/yourname/yourpath/filename.gz . For example: gzip -d /home/frank/franksfiles/ciw_2000.gz. For PC's you should download the <a href="http://www.winzip.com">WinZip utility</a> to decompress the files.</font>
<p><i></i>
<p><font class="cont"></font>
<p><a name="marker"><b>Markers and Polymorphisms</b></a>
<p><i>Where can I find segregation data for recombinant inbred lines?</i>
<p><font class="cont">
<ul>
<li>For the Lister and Dean ColXLer Map go to NASC <a href="http://nasc.nott.ac.uk/new_ri_map.html">RI map data</a> and click on "Marker scores for latest map" in the sidebar.
<li>For the Koorneef LerXCvi lines go to TAIR's FTP site 
:FTP->Maps -> <a href="ftp://ftp.arabidopsis.org/home/tair/Maps/Ler_Cvi_RIdata">Ler_Cvi_RIdata</a>
</li>
</ul>
</font>
<p><i>Why do the BAC locations given for SNPs and INDELS from the CEREON database differ from their location when I try to locate them on the BAC?</i>
<p><font class="cont">The difference position of the SNP provided by Cereon may be due to a difference in the length of the BAC reported in different versions of the BAC sequence. For example, many of the BAC sequences used by the AGI for the genome sequence had sequences at the ends trimmed resulting in a shorter length BAC. To obtain an accurate location on the genome try one of the following:
<ul>
<li>Use TAIRs BLAST to match the SNP sequence against the AGI whole genome or Genbank whole genome datasets.
<li>Use the SeqViewer  and 
<ul><li>Paste the SNP/INDEL sequence into the input box.
<li>Choose search by sequence.
<li>Hits will be displayed as red lines on the chromosome bars.
<li>Click on the chromosome bar to zoom in on the region.
</li>
</ul>
</li>
</ul></font>
<p>Related pages: <a href="http://tairvm09.tacc.utexas.edu/servlets/sv">SeqViewer</a> ; <a href="/seqViewer/help/sv_intro.html">SeqViewer Help</a> ; <a href="/Blast/">BLAST</a>
<p><i></i>
<p><font class="cont"></font>
<p><a name="download"><b>Bulk Download and FTP datasets</b></a>
<p><i>How can I read files I download from TAIR?</i>
<p><font class="cont"> Tab-delimited files from the bulk tools or FTP site can easily be opened using a spreadsheet program such as Microsoft Excel. 
<ul>
<li>Open the file in the application and follow the instructions for choosing column delimiters (tabs) and column format (use text as a default for all).
</li>
</ul></font>
<p><i>How do I generate tab delimited files to upload into TAIR bulk search tools?</i>
<p><font class="cont">Spreadsheet programs like Microsoft Excel allow you to save your file as tab delimited text. Excel spreadsheets (with the .xls extension) cannot be used to upload a list into the bulk search pages.</font>
<p><i>How can I obtain specific datasets such as all sequenced genes, or all markers in a defined region?</i>
<p><font class="cont">Each of the search results pages includes the option to obtain a listing of specific records or a set of records that you can download and open in a spreadsheet. Information about the downloaded fields can be found in the help pages. If there is a specific set of data that you would like , contact the curators and we will do our best to accommodate your request. User requests are placed in the FTP site under the User Requests directory.</font>
<p><a name="orders"><b>Stock Ordering</b></a></font>
<p><i>Where can I find full length cDNA clones in the GATEWAY vector?</i></p>
<p><font class="cont">As of 2/1/05- all cDNA clones in the GATEWAY vector that are distributed by the ABRC have vector names beginning with pENTR or pDONR. To find these clones, use the <a href="/servlets/Search?action=new_search&type=dna" target ="_blank">TAIR DNA Search</a>. 
<ol>
<li>Choose search for "clone"</li>
<li>In the search by section, select vector name and STARTS with (pDONR or pENTR)</li>
<li>In the 'Other Features "section- select is full length cDNA</li>
<li>Submit the query</li>
</ol>
If the gene you are interested in is not represented in the results set, try using the other vector name. You cannot search both vector names at once.</p>
<p><i>I'm registered, why can't I place an order?</i>
<p><font class="cont">There are several reasons why you may not be able to place an order.
<ol>
<li> Your account has not been activated: During the week (excluding holidays),it normally takes less than a day to activate new accounts. Please wait at least 24 hours after your registration is submitted before placing an order.</li>
<li>You are not affiliated with a lab: You must be affiliated with a lab to be able to place orders with the ABRC.
</ol>
Related pages: <br /> <a href="/help/helppages/commreg.jsp">Registration Help</a>;<a href="/help/helppages/addlab.jsp">Adding Labs</a>;<a href="/help/helppages/affiliate.jsp">Affiliations Help</a></font>
<p><i>How much does it cost to order seed/DNA?</i>
<p><font class="cont">Information about ABRC fees can be found by going to "Stocks" in the toolbar or from the home page and clicking on <a href="https://abrc.osu.edu/fee-structure">Fee Structure</a>. For orders from NASC go to the <a href="http://nasc.nott.ac.uk/">NASC homepage</a> and click on "Price Information"</font>
<p><i>How can I find out the status of my order?</i>
<p><font class="cont">You can check your order by doing the following:
<ul>
<li>Click on "Login" in the TAIR toolbar.
<li>Enter your username and password.
<li>If you have entered the correct username/password combination you will see a "Welcome Page".
<li>Click on "View Orders".
<li>You can search your orders by order number, stock number or date of order. If you enter no parameters, clicking submit will return a list of all current and past orders.
<li> Each stock contained in the order is listed separately and includes price, quantity, status, and date. The status options are:<br />
<br />new: New orders not yet being processed by ABRC. You may still add stocks 
to or cancel this order.<br /><br />
in_progress:Orders that are currently being processed at ABRC.<br /><br />
completed:Orders that have been shipped.<br /><br />
cancelled: Orders cancelled at the users request or by ABRC personnel.
</li></ul>
</font>
<p><i>How do I pay for my order?</i>
<p><font class="cont">You can pay by check, bank transfer or credit card.
<p> Related pages:<br />
<a href="https://abrc.osu.edu/how-make-payments">ABRC Payments</a>
<p><i>What is the ABRC policy on searching order histories?</i></p>
<p><font class="cont">All order histories for a given stock are publically available. Your own personal order history (stocks you have ordered) is not public.</font></p>
<p><i>I know a stock has been deposited at the ABRC but I cannot find it using the DNA search- How can I order the stock?</i>
<p><font class="cont">
<ol>
<li>Check that you are looking for the correct type of DNA (e.g. clone, vector, library, pooled genomic DNA, filter.
. For example: to find a stock that is a vector from the DNA search.<br />
<ul>
<li>Select "vector" from the "search for" drop-down menu.
<li>Choose "is ABRC stock" in the "Other Features" option.
<li>You can also for ANY DNA stock using the stock id.
</li>
</ul>
<li>Recently donated stocks may not yet be loaded in the database. Please try your search again in 1 week and if you still do not find the stock, contact <a href="#end">ABRC</a>. Note that you can restrict your stock searches by date to limit your query to new stocks only.
</ol>
</font>
<p><i>Why is the clone I have identified in the TAIR database listed as "not an ABRC stock" and how can I get this clone?</i>
<p><font class="cont">Not all the clones in the database have been deposited with ABRC. 
Contact the researcher who deposited the sequence in GenBank to request clones that have not been deposited.</font>
<p><i>The donor says the stock was deposited with ABRC, but I cannot find it 
in the database. How can I get it?</i>
<p><font class="cont"> We load data for new stocks as soon as possible after receiving the stocks. Recently donated stocks may not yet be loaded in the database. Please try your search again in 1 week and if you still do not find the stock, contact ABRC.</font>
<p><i>I am looking for a CNRS EST with a clone name beginning ATTS. I know it used to be an ABRC stock, but I cannot find it using the DNA search.</i>
<p><font class="cont">Try searching by stock number rather than by clone name, or use the 
alternate clone name listed in the GenBank record for the EST sequence.</font>
<p><i>I am trying to order a PAC (P1) clone from the Mitsui library, but when 
I type the clone name into the order form I get a "stock number not found" 
message.How do I order the clone?</i>
<p><font class="cont">You may only type stock numbers in to the order form. For these clones 
the stock number is slightly different from the clone name, the stock 
number begins MI and the clone name begins M.</font>
<p><i>What antibiotic selection should I use to grow my clone?</i>
<p><font class="cont">his information is listed on the clone details page, click on the clone 
name from the DNA search results page or the Stock details page.</font>
<p><i>When I order a two hybrid library what exactly will I get?</i>
<p><font class="cont">This information is listed on the stock detail page. If you are using the DNA search,  click on the stock number on the DNA search results page or the clone detail page to see the stock details.</font>
<p><i>How are ecotypes defined in TAIR and at ABRC and what is the difference between ecotypes obtained from the same region?</i>
<p><font class="cont">In TAIR, the term ecotype is used rather broadly to represent any natural accession. This is mostly due to historical reasons. For the same reason,collections of natural accessions from donors are classified as ecotypes at ABRC and NASC, regardless of whether or not they meet the ecological definition of an ecotype. Different accessions from the same location are distinguished with a separate accession number (e.g.Bz-1, Bz-2, Bz-3, etc...).</font>
<p><i>Where can I find information about US regulations for growing transgenic Arabidopsis and sending transgenic seed?</i>
<p><font class=""></font>The following information has been provided by the ABRC:<br />

In growing transgenic Arabidopsis, The ABRC conforms to level BL-1 of 
containment.  The law governing this is in the Federal Register,  7 
CFR parts 340 and 330.  In sending seeds, no permit is required 
for transgenic Arabidopsis, although the seeds are in a sealed 
container, inside another sealed plastic envelope, which is also 
inside a solid double biohazard mailing can. 
The ABRC does not distribute Agrobacterium, as this requires an individual permit for each shipment.
</font>
<p><a name="jobs"><b>Posting Jobs</b></a>
<p><i>How do I post a job opening at TAIR?</a></i>
<p><font class="cont"> You can email the position to <a href="curator@arabidopsis.org">curator@arabidopsis.org</a> and we will put up the ad for no charge. Job postings are also routinely obtained as they are listed on the TAIR newsgroup. Your posting will appear on TAIR shortly after it is sent out to the newsgroup.  </font>
<p>Related Pages:<a href="/news/newsgroup.jsp">The Arabidopsis Newsgroup </a> ; <a href="/news/jobs.jsp">Job Postings</a>
<p><i>How do I find out about job openings at TAIR?</i>
<p><font class="cont"><a href="/news/jobs.jsp">Jobs at TAIR</a> are posted in the TAIR news section.</font>
<p>Related Pages: <br /><a href="/doc/news/breaking_news/140">TAIR news</a>

<p><a name="update"><b>New and updated data</b></a>
<p><i>How often is data updated in TAIR?</i>
<p><font class="cont">Data in TAIR is constantly being updated and new data is constantly being added. Information about significant updates and additions is posted in the Breaking News section of the website as well as in the TAIR news section. If you are registered at TAIR, you can choose to receive quarterly news updates sent to your email address (see:<a href="helppages/commreg.jsp">Registration Help</a> for information on registration and opting into the email updates).
<p>Datasets that are frequently updated include:
<p>
<ul>
<li>BLAST,FASTA,PATMATCH,WuBLAST datasets-AGI datasets and other datasets derived from the AGI sequences are updated after each major release from TAIR. The current datasets reflects changes from the latest release (TAIR10, November 2010). Sequences from GenBank (incl.Arabidopsis mRNA, genomic sequences, BACS, ESTs, Brassica, Viridiplantae) are updated twice a month.T-DNA flanking sequences from SALK are updated monthly.</li>
<li>Seed and DNA stocks from ABRC-monthly for SALK T-DNA lines (until the project ends), variable for other stocks.</li>
<li>Publications -downloaded monthly from PubMed.</li>
<li>Gene/Locus updates-twice a month</li>
<li>Gene Ontology Annotations-twice a month </li>
<li>AraCyc Metabolic pathways-two to four times a year</li>
<LI>Polymorphisms and Phenotypes - twice a month 
</li></ul>
</font>

<p><a name="datasubmission"><b>Data Submissions and Corrections</b></a>
<p><i>How do I correct information about an incorrectly annotated gene?</i>
<p><font class="cont">
<ul>
<li>Send an email to <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a>.To submit a new or update a gene model see : <a href="/submit/gene_annotation.submission.jsp">Instructions for submitting gene annotations</a>.
<li>Add a <a href="helppages/addcomment.jsp">comment</a> to the gene detail page for the gene in question. A curator will review the comments and contact you for more information if needed.
</li></ul>
</font>
<p><i>I have published a paper. How do I make associated software/ supplementary data available at TAIR?</i>
<p><font class="cont">Yes, please contact us and to arrange data/software submission.</font>
<p><i>How do I submit data to TAIR?</i>
<p><font class="cont">See <a href="/submit/index.jsp">Data Submission</a> section for instructions on how to
submit Marker/Polymorphism, Gene Family, Functional Genomics Gene Lists
and other data to TAIR.</font>

<p><a name="names"><b>Gene nomenclature</b></a>
<p><i>Before I name my gene, how can I find out if a  gene name is in use?</i>
<p><font class="cont">Consult the <a href="/servlets/processor?type=genesymbol&update_action=view_symbol ">Gene Symbol List</a> for a list of gene names that have been reserved and are not available. You can also use the TAIR quicksearch to search for the name in the database or anywhere on the website (e.g. the list of Arabidopsis gene families).</font><br />
<p>Related pages:<br />
<a href="/portals/nomenclature/guidelines.jsp">TAIR nomenclature guide</a>
<p><i>What is the difference between a hypothetical, unknown and putative protein?</i>
<p><font class="cont">Putative proteins are similar to a known gene.  Unknown proteins are not similar to a known gene but do have EST or cDNA matches showing that they are expressed.  Hypothetical proteins have no EST or cDNA matches and are not similar to a known gene, so there is no evidence that they are expressed genes.</font>
<p>Related Pages: <br /><a href="/portals/nomenclature/tigr_naming.jsp">TIGR naming conventions</a>
</p>
<br/>
<a name="dev"></a><b>FAQs for Developers</b>
<p><font class="cont">Frequently asked questions for software developers and casual programmers</font>
<p><i><a name="tair"></a>What are the proper procedures for scripting TAIR database pages?</i>
<p><font class="cont"> TAIR has many resources that users may access through automated retrieval programs instead of through a web browser. If you intend to use scripts to extract data from TAIR, please note the following:
<ol>
<li>Please contact us at <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a> with your data requirements to see whether we can supply the data you need through a custom script directly against our database rather than submitting requests through scripts.</li>
<li>Do not overload TAIR's systems by submitting requests through 
multiple threads or programs. Flooding the server with requests can lead 
to many problems including a denial of service to others trying to use 
the website.
</li>
<li>Run retrieval scripts during off hours such as weekends or between 
9PM and 5AM Eastern Time on weekdays.</li>
<li> Make no more than one request every 3 seconds.</li>
<li> TAIR will block access from sites which overload the servers with 
requests with no warning.</li>
<li>TAIR features are under continuous development.  URLs, query syntax 
and parameters may change without warning.</li>
<li> If you receive error messages or no results, please do not rerun your 
program, but contact us at <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a> and we will 
assist you.</li>
</ul></font>
<p>Related Pages:<br/>
<a href="/about/linktotair.jsp">Hyperlinking to TAIR</a><br/>
<a href="ftp://ftp.arabidopsis.org/home/tair/">TAIR FTP site</a> (downloading large and custom datasets).
</p>

</div> <!--right column-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

