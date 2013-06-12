<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - News - Breaking News";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="140" />
</jsp:include>

<jsp:include page="/jsp/includes/newsSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Breaking News"/>  
</jsp:include>


<div id="rightcolumn">

<center><a href="/news/rss.xml" class="feed">Subscribe to news feed</a></center>
<br />

<span class="mainheader">Breaking News</span>
<dl>

<dt><b>New protein chip resource at ABRC &#091;January 7, 2010&#093;</b><a name="id12"></a></dt>
<dd>
<p>
Approximately 400 copies of Arabidopsis Protein Chip v1, developed by <a href="http://plants.gersteinlab.org/">M. Snyder, S.P. Dinesh-Kumar, and M. Gerstein</a> have been received at <a href="http://abrc.osu.edu/">ABRC</a> and are ready for distribution. Each Chip contains a collection of 5,000 Arabidopsis <a href="tp://ftp.arabidopsis.org/ABRC/DK_LAB_Protein_Chip_Layout_Dec_2009.xlsx">proteins</a> printed on a single array. Protein chips offer a variety of applications related to high-throughput functional analysis, including antibody screens, enzymatic or other functional assays, as well as interactions of proteins with DNA, RNA, lipids, small molecules or other proteins.

We would like to determine the interest of the community in this type of resource. Please select from the options below:

<a href="/servlets/TairObject?type=stock&id=4001872756">I would like to place an order now</a>
<h href="">I would like to order in the future</a>

</p>
</dd>



<dt><b>Thank you and Happy Holidays from ABRC &#091;December 23, 2009&#093;</b><a name="id12"></a></dt>
<dd>
<p>
We wish to thank the community for being responsive to our donation campaign. Since the campaign was launched in July 2009, <a href="ftp://ftp.arabidopsis.org/home/tair/ABRC/Donation_2009_File_1.pdf">monthly seed stock donations</a> more than doubled. You can find a complete list of individual donations <a href="ftp://ftp.arabidopsis.org/home/tair/ABRC/Donation_2009_File_2.pdf">here</a>. We would also like to thank our ongoing collaborators for large donations (more than 250 stocks) of natural accessions, SALK, Wisconsin, Saskatoon and other lines. In addition, we have received a <a href="ftp://ftp.arabidopsis.org/home/tair/ABRC/Donation_2009_File_3.pdf">large number of novel DNA stocks</a> with numerous applications.
</p>
</dd>

<dt><b>New cell culture resource at ABRC &#091;December 1, 2009&#093;</b><a name="id11"></a></dt>
<dd>
<p> 
Cell line T87 (Stock number CCL84839) developed by M. Axelos in B. Lescure's lab (INRA) is now available. This line was derived from Columbia and donated by Allan Showalter (Ohio University).
</p>
<p>
This stock can be found using the <a href="/servlets/Order?state=catalog">ABRC catalog</a>. Currently this stock can only be shipped to researchers within the continental United States.
</p>
</dd>


<dt><b>The TAIR Database is back up! &#091;November 20, 2009&#093;</b><a name="id10"></a></dt>
<dd> Everything should be working normaly again. Please let us know if you have any issues.
</dd>

<dt><b>TAIR Database is in read-only mode. &#091;November 20, 2009&#093;</b><a name="id9"></a></dt>
<dd> During this time, we are unable to process any seed orders. We apologize for the inconvenience.
</dd>


<dt><b>Nature News on TAIR Funding &#091;November 18, 2009&#093;</b><a name="id8"></a></dt>
<dd>
<p> 
Read the <a href="http://www.nature.com/news/2009/091118/full/462258b.html">Nature News</a> (with comment box) and <a href="http://www.nature.com/nature/journal/v462/n7271/full/462252a.html">Opinion</a> articles on TAIR funding.
</p>
</dd>

<dt><b>RSS feeds now available &#091;November 4, 2009&#093;</b><a name="id7"></a></dt>

<dd>
<p>TAIR News and Job Postings are now available as RSS feeds. Subscribe by clicking on the RSS icon on the Home, Breaking News and Job Postings pages.</p>

</dd>


<dt><b>New AraCyc / Plant Metabolic Network releases! &#091;October 15, 2009&#093;</b><a name="id6"></a></dt>

<dd>
<p>The <a href="http://www.plantcyc.org">Plant Metabolic Network</a> is pleased to announce <a href="http://www.plantcyc.org/release_notes/release_notes.faces">new releases</a> of the metabolic pathway databases <a href="http://www.plantcyc.org/release_notes/aracyc/aracyc_release_notes.faces">AraCyc 6.0</a> and <a href="http://www.plantcyc.org/release_notes/plantcyc/plantcyc_release_notes.faces">PlantCyc 3.0</a>, plus the inaugural release of <a href="http://www.plantcyc.org/release_notes/poplarcyc/poplarcyc_release_notes.faces">PoplarCyc 1.0</a></p>

<p>This PMN release includes many updates to <a href="http://www.plantcyc.org/release_notes/aracyc/aracyc_release_notes.faces">AraCyc</a> enzyme/reaction assignments based on a new PMN enzyme annotation pipeline, plus, 34 additional pathways have been added to AraCyc 6.0. </p>

<p><a href="http://www.plantcyc.org/release_notes/poplarcyc/poplarcyc_release_notes.faces">PoplarCyc 1.0</a> was created by applying the PMN enzyme annotation pipeline to the <i>Populus trichocarpa</i> 1.1 genome release sequences provided by JGI, and then using the Pathologic software from SRI International. The new computationally predicted database was then validated by PMN curators. 321 pathways and 3434 predicted poplar enzymes are now available in PoplarCyc 1.0. The data have also been incorporated into PlantCyc 3.0. In addition, 75 new pathways have been added to the new version of PlantCyc.</p>

<p>The PMN also now provides a <a href="http://www.plantcyc.org/tools/Blast/blast.faces">BLAST tool</a> and two customized enzyme sets for PMN users.</p>
</dd>

<dt><b>Stock Donation Made Easy &#091;July 24, 2009&#093; </b><a name="id5"></a></dt>
<dd>
<p>ABRC and NASC are currently seeking donations of characterized mutant lines. There are large numbers of published and highly characterized lines which have not been donated to the stock centers. We are also interested in mutants or strains which have not yet been published. In cases where you wish to donate lines which you might prefer us to hold until publication, that can be accommodated. </p>

<p>We are interested in receiving validated homozygous T-DNA lines (from SALK or other collections - even if you got them originally from us but you "cleaned" them up), double and triple mutants, transgenes in specific genetic backgrounds, mutations in new accessions, and "cleaned-up" EMS mutants. </p>

<p>We have developed a <a href="ftp://ftp.arabidopsis.org/home/tair/Data_Submission/ABRC_Simple_Donation_Form2.doc ">simplified form</a> for mutant and transgenic donations. Send the completed form together with a tube containing as much seed as you can spare to the stock centers. We appreciate your assistance in making our collection as complete as possible</p>
</dd>

<dt><b>Synteny Viewer At TAIR &#091;July 7, 2009&#093;</b><a name="id4"></a></dt>
<dd>
<p>GBrowse_syn is a GBrowse-based synteny browser designed to display multiple genomes, with a central reference species compared to several additional species. It is included with the standard GBrowse package (version 1.69 and later). GBrowse_syn uses a central 'joining' database that contains information about the multiple sequence alignments as well as additional databases for each species represented in the alignments.</p>

<p>GBrowse_syn was built to help researchers study and analyze syntenic regions, homologous genes and other conserved elements between sequences. It can also be used to study genome duplication and evolution. By comparing newly sequenced or less studied genomes to the well annotated Arabidopsis genome in Gbrowse_syn, scientists can identify novel genes and putative regulatory elements.</p>

<p>The first version of the Gbrowse_syn tool at TAIR includes the genomes of A. thaliana and A. lyrata. Additional plant genomes will be added to this synteny browser in the near future. This synteny browser can be accessed from the 'Tools' menu on any TAIR page.</p>
 
<p>For documentation on installing and configuring this tool, please refer to the official Gbrowse_syn Wiki page: <a href="http://gmod.org/wiki/GBrowse_syn">http://gmod.org/wiki/GBrowse_syn</a>
<br />For the Gbrowse_syn Help page, go to: <a href="http://gmod.org/wiki/GBrowse_syn_Help">http://gmod.org/wiki/GBrowse_syn_Help</a></p>

<p>The A. lyrata alignment data was provided to us by Pedro Pattyn at the University of Ghent, a Ph.D student in the Bioinformatics &amp; Evolutionary Genomics group headed by Yves Van de Peer.</p>

<p>We would like to thank Sheldon McKay from CSHL for developing this valuable tool. </p>
</dd>

<dt><b>TAIR9 Genome Release &#091;June 19, 2009&#093;</b><a name="id3"></a></dt>
<dd>
<p>The Arabidopsis Information Resource (TAIR) is pleased to announce the release of 
the latest version of the Arabidopsis genome annotation (TAIR9) at TAIR and NCBI. The latest release builds upon the gene structures of the previous TAIR8 release using new cDNA and EST data released in the intervening period as well as manual updates informed by cross species alignments, peptides and community input regarding missing and incorrectly annotated genes.</p>

<p>The TAIR9 release contains 27,379 protein coding genes, 4827 pseudogenes or transposable elements and 1312 ncRNAs (33,518 genes in all, 39,640 gene models). 
A total of 282 new loci and 739 new gene models were added.</p> 

<p>Fourteen percent (4626) of Arabidopsis genes now have annotated splice variants.  Updates were made to 1254 gene models of which 774 had CDS updates; a total of 1144 exons were modified and 1056 new exons incorporated. There were 13 gene splits and 46 gene merges.</p>

<p>Proteome data (Baerenfaller et al., 2008 and Castellana et al., 2008) aided the reclassification of 99 pseudogenes as protein coding while an additional 9 pseudogenes were merged with existing protein coding genes. In addition 158 peptides from the Baerenfaller proteome set were used to update TAIR gene structures. Predicted Augustus gene models provided by Steve Briggs lab and described in Castellana et al. 2008 were evaluated to identify potential exons missing from TAIR8. Of 591 Augustus models examined 339 were incorporated into TAIR9 gene models, with 175 new splice variants added , 118 modifications to existing TAIR models and 46 new gene models. Further updates based on the Baerenfaller and Castellana proteome data are expected in future genome releases.</p>

<p>Mark Gerstein's lab (Yale) provided pseudogene annotation generated via pseudopipe (Zhang et al., 2006). Further analysis was undertaken to identify a subset of pseudogene models exhibiting cds disablements or truncations relative to the parent gene. A total of 168 novel pseudogenes were added for the TAIR9 release.</p>

<p>TAIR was provided with alternative Arabidopsis gene model predictions generated using the Gnomon (Alexandre Souvorov, NCBI), Eugene (S&eacute;bastien Aubourg Unit&eacute; de Recherche en G&eacute;nomique V&eacute;g&eacute;tale) and Aceview (Jean Thierry-Mieg, NCBI) tools. These alternative gene models can be viewed in TAIRs GBrowse. Further analysis of these gene predictions was undertaken to identify a set of exons absent from TAIR8 annotation but supported by transcript, peptide or cross species evidence. This resulted in the addition of over a thousand new/modified exons for TAIR9.</p>

<p>In order to give Arabidopsis researchers a better idea about the amount of evidence that supports their gene(s) of interest, we developed a ranking systems that attributes confidence scores to all exons and gene models in TAIR9 based on different types of experimental and computational evidence. The new confidence ranking will for example allow researchers to identify a set of gold standard confirmed structures or identify sets of exons where both donor and acceptor splice sites are supported. More details of the confidence ranks can be found at <a href="ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR9_genome_release/Gene_Confidence.pdf">ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR9_genome_release/Gene_Confidence.pdf</a></p>

<p>In agreement with our reference genome policy (<a href="/doc/portals/genAnnotation/gene_structural_annotation/ref_genome_sequence/11413">http://www.arabidopsis.org/doc/portals/genAnnotation/gene_structural_annotation/ref_genome_sequence/11413</a>) corrections to the reference assembly were only made if supported by at least two independently derived sequence libraries from the Columbia ecotype.  The following updates were made to the chromosome sequences for this release:</p>

<p>227 single nucleotide substitutions were made to the assembly sequence based on re-sequencing data from the Weigel lab provided by Richard Clark (Ossowski et al. 2008) and Joe Ecker. </p>

<p>341 indels were made to the assembly sequence based on re-sequencing data from the Weigel lab and EST and cDNA sequences deposited in Genbank that supported the insertion/deletion.</p>

<p>14 regions previously identified in TAIR8 as either vector, E.coli or rice contamination, and where the existing sequence had been substituted with the equivalent number of IUPAC ambiguity code 'N's were standardized (via deletion) to a set size of 100bp. </p>

<p>All five nuclear chromosomes were updated for TAIR9 details of the golden path length of each chromosome can be found at <a href="/portals/genAnnotation/gene_structural_annotation/agicomplete.jsp">http://www.arabidopsis.org/portals/genAnnotation/gene_structural_annotation/agicomplete.jsp</a>

<p>Further details of these assembly changes can be found at 
<a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/whole_chromosomes/">ftp://ftp.arabidopsis.org/home/tair/Sequences/whole_chromosomes/</a></p>

<p>Assembly updates and gap information can also be viewed in TAIRs GBrowse (see Assembly tracks section).</p>

<p>The fully annotated chromosome sequences in TIGR xml format or GFF format, along with Fasta files of cDNA, CDS, genomic and protein sequences are available from the TAIR ftp site at:</p>
<p><a href="ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR9_genome_release/">ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR9_genome_release/</a></p>

<p>We would like to thank all those who contributed to the latest release by providing submissions for new and incorrectly annotated genes. </p>

<p>TAIR wishes to thank Cornell University for use of the computer clusters at the Cornell Center for Advanced Computing (CAC).</p>

</dd>

<dt><b>Tips for searching DNA stocks including vectors and amiRNA clones  &#091;May 20, 2009&#093;</b><a name="id2"></a></dt>
<dd>
<p>Using the TAIR quick search:<br /> 
If you know the name of the stock you are looking for, the quick search at the top right of most TAIR pages is fast and easy. 
<ol>
<li>Enter the name in the search box.</li>
<li>Select clone, vector or DNA stock from the drop down menu adjacent to the search box</li> 
<li>If you are not sure which name you have, try searching all three. </li>
</ol>
<br /> 
Using the <a href="/servlets/Order?state=catalog">ABRC catalog pages</a>: <br /> 
The catalog is useful for browsing smaller collections of stocks, such as libraries and vectors. Stock descriptions are included on these catalog pages. 
<ol>
<li>Click on the vector or library name to see details and vector maps. </li>
<li>Click on the stock number to see pricing and other stock information. </li>
</ol>
<br /> 
Using the <a href="/servlets/Search?action=new_search&type=dna">DNA/clone search</a>: <br />
<ol>
<li>Use the drop down menu in the "Search for" section to select clone or vector. 
Only constructs containing Arabidopsis or other plant derived sequences are listed 
as clones. All other constructs are listed as vectors. </li>
<li>Use the drop down menu in the "Search by" section of the form to select the 
search term. Try searching by both clone/vector name and stock number. Clones can 
be searched by donor last name. Searching for vectors by donor last name will be 
implemented soon. </li>
<li>If you are looking for a keyword search, try searching by "stock description" 
and "contains" your keyword. </li>
<li>Click on the clone or vector name in the results page for detailed information.</li> 
<li>Click on the stock number for pricing, format shipped and publications. </li>
</ol>
<br /> 
Searching for amiRNA clones 
Use the <a href="/servlets/Search?action=new_search&type=dna">TAIR DNA/clone search</a><br />
<ol>
<li>In the "Search by" section select "locus name" from the drop down menu</li> 
<li>Enter the name in the form Atxgxxxxx. </li>
<li>In the "Search by" section select "clone name" and select "starts with" </li>
<li>Enter "CSHL". </li>
<li>A spreadsheet (amiRNA at ABRC.xls) listing all amiRNA clones currently 
available from ABRC with their associated data and hairpin sequence can be 
downloaded from the <a href="ftp://ftp.arabidopsis.org/home/tair/ABRC/">TAIR ftp site</a>. </li>
</ol>
</p>


</dl>


<br />
<br />
<center><a href="oldnews.jsp">What Was News</a></center>


<center>Last modified on July 24, 2009</center>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

