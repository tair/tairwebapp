<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - News - What Was News";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="141" />
</jsp:include>

<jsp:include page="/jsp/includes/newsSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="What was News"/>  
</jsp:include>


<div id="rightcolumn">


<span class="mainheader">Previous TAIR News</span>

<dl>
                         <dt>
                             <b>Thank you and Happy Holidays from ABRC &#091;December 23, 2009&#093;</b><a name="id12"></a>
                         </dt>
                         <dd>
                             <p>
                                 We wish to thank the community for being responsive to our donation campaign. Since the campaign
                                 was launched in July 2009,
                                 <a href="ftp://ftp.arabidopsis.org/home/tair/ABRC/Donation_2009_File_1.pdf">monthly seed stock
                                     donations</a> more than doubled. You can find a complete list of individual donations
                                 <a href="ftp://ftp.arabidopsis.org/home/tair/ABRC/Donation_2009_File_2.pdf">here</a>. We would
                                 also like to thank our ongoing collaborators for large donations (more than 250 stocks) of natural
                                 accessions, SALK, Wisconsin, Saskatoon and other lines. In addition, we have received a
                                 <a href="ftp://ftp.arabidopsis.org/home/tair/ABRC/Donation_2009_File_3.pdf">large number of
                                     novel DNA stocks</a> with numerous applications.
                             </p>
                         </dd>
 
                         <dt>
                             <b>New cell culture resource at ABRC &#091;December 1, 2009&#093;</b><a name="id11"></a>
                         </dt>
                         <dd>
                             <p>
                                 Cell line T87 (Stock number CCL84839) developed by M. Axelos in B. Lescure's lab (INRA) is now
                                 available. This line was derived from Columbia and donated by Allan Showalter (Ohio University).
                             </p>
                             <p>
                                 This stock can be found using the
                                 <a href="/servlets/Order?state=catalog">ABRC catalog</a>. Currently this stock can only be shipped
                                 to researchers within the continental United States.
                             </p>
                         </dd>

                         <dt>
                             <b>The TAIR Database is back up! &#091;November 20, 2009&#093;</b><a name="id10"></a>
                         </dt>
                         <dd>
                             Everything should be working normally again. Please let us know if you have any issues.
                         </dd>
                         
                         <dt>
                             <b>TAIR Database is in read-only mode. &#091;November 20, 2009&#093;</b><a name="id9"></a>
                         </dt>
                         <dd>
                             During this time, we are unable to process any seed orders. We apologize for the inconvenience.
                         </dd>
                         
                         
                         <dt>
                             <b>Nature News on TAIR Funding &#091;November 18, 2009&#093;</b><a name="id8"></a>
                         </dt>
                         <dd>
                             <p>
                                 Read the
                                 <a href="http://www.nature.com/news/2009/091118/full/462258b.html">Nature News</a> (with comment
                                 box) and
                                 <a href="http://www.nature.com/nature/journal/v462/n7271/full/462252a.html">Opinion</a> articles
                                 on TAIR funding.
                             </p>
                         </dd>
                         
                         <dt>
                             <b>RSS feeds now available &#091;November 4, 2009&#093;</b><a name="id7"></a>
                         </dt>
                         <dd>
                             <p>
                                 TAIR News and Job Postings are now available as RSS feeds. Subscribe by clicking on the RSS icon
                                 on the Home, Breaking News and Job Postings pages.
                             </p>
                             
                         </dd>
                         
                         
                         <dt>
                             <b>New AraCyc / Plant Metabolic Network releases! &#091;October 15, 2009&#093;</b><a name="id6"></a>
                         </dt>
                         
                         <dd>
                             <p>
                                 The
                                 <a href="http://www.plantcyc.org">Plant Metabolic Network</a> is pleased to announce
                                 <a href="http://www.plantcyc.org/release_notes/release_notes.faces">new releases</a> of the
                                 metabolic pathway databases
                                 <a href="http://www.plantcyc.org/release_notes/aracyc/aracyc_release_notes.faces">AraCyc 6.0</a>
                                 and
                                 <a href="http://www.plantcyc.org/release_notes/plantcyc/plantcyc_release_notes.faces">PlantCyc
                                     3.0</a>, plus the inaugural release of
                                 <a href="http://www.plantcyc.org/release_notes/poplarcyc/poplarcyc_release_notes.faces">PoplarCyc
                                     1.0</a>
                             </p>
 
                             <p>
                                 This PMN release includes many updates to
                                 <a href="http://www.plantcyc.org/release_notes/aracyc/aracyc_release_notes.faces">AraCyc</a>
                                 enzyme/reaction assignments based on a new PMN enzyme annotation pipeline, plus, 34 additional
                                 pathways have been added to AraCyc 6.0.
                             </p>
                             <p>
                                 <a href="http://www.plantcyc.org/release_notes/poplarcyc/poplarcyc_release_notes.faces">PoplarCyc
                                     1.0</a> was created by applying the PMN enzyme annotation pipeline to the
                                 <i>Populus trichocarpa</i> 1.1 genome release sequences provided by JGI, and then using the
                                 Pathologic software from SRI International. The new computationally predicted database was then
                                 validated by PMN curators. 321 pathways and 3434 predicted poplar enzymes are now available in
                                 PoplarCyc 1.0. The data have also been incorporated into PlantCyc 3.0. In addition, 75 new
                                 pathways have been added to the new version of PlantCyc. 
                             </p>
                             
                             <p>
                                 The PMN also now provides a
                                 <a href="http://www.plantcyc.org/tools/Blast/blast.faces">BLAST tool</a> and two customized enzyme
                                 sets for PMN users.
                             </p>
                         </dd>
                         
                         <dt>
                             <b>Stock Donation Made Easy &#091;July 24, 2009&#093; </b><a name="id5"></a>
                         </dt>
                         <dd>
                             <p>
                                 ABRC and NASC are currently seeking donations of characterized mutant lines. There are large
                                 numbers of published and highly characterized lines which have not been donated to the stock
                                 centers. We are also interested in mutants or strains which have not yet been published. In cases
                                 where you wish to donate lines which you might prefer us to hold until publication, that can be
                                 accommodated.
                             </p>
                             
                             <p>
                                 We are interested in receiving validated homozygous T-DNA lines (from SALK or other collections -
                                 even if you got them originally from us but you "cleaned" them up), double and triple mutants,
                                 transgenes in specific genetic backgrounds, mutations in new accessions, and "cleaned-up" EMS
                                 mutants.
                             </p>
                             <p>
                                 We have developed a
                                 <a href="ftp://ftp.arabidopsis.org/home/tair/Data_Submission/ABRC_Simple_Donation_Form2.doc ">simplified
                                     form</a> for mutant and transgenic donations. Send the completed form together with a tube
                                 containing as much seed as you can spare to the stock centers. We appreciate your assistance in
                                 making our collection as complete as possible
                             </p>
                         </dd>
                         
                         <dt>
                             <b>Synteny Viewer At TAIR &#091;July 7, 2009&#093;</b><a name="id4"></a>
                         </dt>
                         <dd>
                             <p>
                                 GBrowse_syn is a GBrowse-based synteny browser designed to display multiple genomes, with a
                                 central reference species compared to several additional species. It is included with the standard
                                 GBrowse package (version 1.69 and later). GBrowse_syn uses a central 'joining' database that
                                 contains information about the multiple sequence alignments as well as additional databases for
                                 each species represented in the alignments.
                             </p>
                             
                             <p>
                                 GBrowse_syn was built to help researchers study and analyze syntenic regions, homologous genes and
                                 other conserved elements between sequences. It can also be used to study genome duplication and
                                 evolution. By comparing newly sequenced or less studied genomes to the well annotated Arabidopsis
                                 genome in Gbrowse_syn, scientists can identify novel genes and putative regulatory elements.
                             </p>
                             
                             <p>
                                 The first version of the Gbrowse_syn tool at TAIR includes the genomes of A. thaliana and A.
                                 lyrata. Additional plant genomes will be added to this synteny browser in the near future. This
                                 synteny browser can be accessed from the 'Tools' menu on any TAIR page.
                             </p>
                             <p>
                                 For documentation on installing and configuring this tool, please refer to the official
                                 Gbrowse_syn Wiki page:
                                 <a href="http://gmod.org/wiki/GBrowse_syn">http://gmod.org/wiki/GBrowse_syn</a>
                                 <br />
                                 For the Gbrowse_syn Help page, go to:
                                 <a href="http://gmod.org/wiki/GBrowse_syn_Help">http://gmod.org/wiki/GBrowse_syn_Help</a>
                             </p>
                             
                             <p>
                                 The A. lyrata alignment data was provided to us by Pedro Pattyn at the University of Ghent, a Ph.D
                                 student in the Bioinformatics &amp; Evolutionary Genomics group headed by Yves Van de Peer. 
                             </p>
                             
                             <p>
                                 We would like to thank Sheldon McKay from CSHL for developing this valuable tool.
                             </p>
                         </dd>
                         
                         <dt>
                             <b>TAIR9 Genome Release &#091;June 19, 2009&#093;</b><a name="id3"></a>
                         </dt>
                         <dd>
                             <p>
                                 The Arabidopsis Information Resource (TAIR) is pleased to announce the release of the latest
                                 version of the Arabidopsis genome annotation (TAIR9) at TAIR and NCBI. The latest release builds
                                 upon the gene structures of the previous TAIR8 release using new cDNA and EST data released in the
                                 intervening period as well as manual updates informed by cross species alignments, peptides and
                                 community input regarding missing and incorrectly annotated genes.
                             </p>
                             <p>
                                 The TAIR9 release contains 27,379 protein coding genes, 4827 pseudogenes or transposable elements
                                 and 1312 ncRNAs (33,518 genes in all, 39,640 gene models). A total of 282 new loci and 739 new
                                 gene models were added. 
                             </p>
                             
                             <p>
                                 Fourteen percent (4626) of Arabidopsis genes now have annotated splice variants. Updates were made
                                 to 1254 gene models of which 774 had CDS updates; a total of 1144 exons were modified and 1056 new
                                 exons incorporated. There were 13 gene splits and 46 gene merges. 
                             </p>
                             
                             <p>
                                 Proteome data (Baerenfaller et al., 2008 and Castellana et al., 2008) aided the reclassification
                                 of 99 pseudogenes as protein coding while an additional 9 pseudogenes were merged with existing
                                 protein coding genes. In addition 158 peptides from the Baerenfaller proteome set were used to
                                 update TAIR gene structures. Predicted Augustus gene models provided by Steve Briggs lab and
                                 described in Castellana et al. 2008 were evaluated to identify potential exons missing from TAIR8.
                                 Of 591 Augustus models examined 339 were incorporated into TAIR9 gene models, with 175 new splice
                                 variants added , 118 modifications to existing TAIR models and 46 new gene models. Further updates
                                 based on the Baerenfaller and Castellana proteome data are expected in future genome releases.
                            </p>
                             
                             <p>
                                 Mark Gerstein's lab (Yale) provided pseudogene annotation generated via pseudopipe (Zhang et al.,
                                 2006). Further analysis was undertaken to identify a subset of pseudogene models exhibiting cds
                                 disablements or truncations relative to the parent gene. A total of 168 novel pseudogenes were
                                 added for the TAIR9 release.
                             </p>
                             <p>
                                 TAIR was provided with alternative Arabidopsis gene model predictions generated using the Gnomon
                                 (Alexandre Souvorov, NCBI), Eugene (S&eacute;bastien Aubourg Unit&eacute; de Recherche en 
                                 G&eacute;nomique V&eacute;g&eacute;tale) and Aceview (Jean Thierry-Mieg, NCBI) tools. These
                                 alternative gene models can be viewed in TAIRs GBrowse. Further analysis of these gene predictions
                                 was undertaken to identify a set of exons absent from TAIR8 annotation but supported by
                                 transcript, peptide or cross species evidence. This resulted in the addition of over a thousand
                                 new/modified exons for TAIR9.
                             </p>
                             
                             <p>
                                In order to give Arabidopsis researchers a better idea about the amount of evidence that supports
                                 their gene(s) of interest, we developed a ranking systems that attributes confidence scores to all
                                 exons and gene models in TAIR9 based on different types of experimental and computational
                                 evidence. The new confidence ranking will for example allow researchers to identify a set of gold
                                 standard confirmed structures or identify sets of exons where both donor and acceptor splice sites
                                 are supported. More details of the confidence ranks can be found at
                                 <a href="ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR9_genome_release/Gene_Confidence.pdf">ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR9_genome_release/Gene_Confiden
                             </p>
                             
                             <p>
                                 In agreement with our reference genome policy (
                                 <a href="/doc/portals/genAnnotation/gene_structural_annotation/ref_genome_sequence/11413">http://www.arabidopsis.org/doc/portals/genAnnotation/gene_structural_annotation
                                 corrections to the reference assembly were only made if supported by at least two independently
                                 derived sequence libraries from the Columbia ecotype. The following updates were made to the
                                 chromosome sequences for this release:
                             </p>
                             
                             <p>
                                 227 single nucleotide substitutions were made to the assembly sequence based on re-sequencing data
                                 from the Weigel lab provided by Richard Clark (Ossowski et al. 2008) and Joe Ecker.
                             </p>
                             <p>
                                 341 indels were made to the assembly sequence based on re-sequencing data from the Weigel lab and
                                 EST and cDNA sequences deposited in Genbank that supported the insertion/deletion. 
                             </p>
                             
                             <p>
                                 14 regions previously identified in TAIR8 as either vector, E.coli or rice contamination, and
                                 where the existing sequence had been substituted with the equivalent number of IUPAC ambiguity
                                 code 'N's were standardized (via deletion) to a set size of 100bp.
                             </p>
                             
                             <p>
                                 All five nuclear chromosomes were updated for TAIR9 details of the golden path length of each
                                 chromosome can be found at
                                 <a href="/portals/genAnnotation/gene_structural_annotation/agicomplete.jsp">http://www.arabidopsis.org/portals/genAnnotation/gene_structural_annotation/agicomplete.jsp</a>
                             </p>
                             <p>
                                 Further details of these assembly changes can be found at
                                 <a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/whole_chromosomes/">ftp://ftp.arabidopsis.org/home/tair/Sequences/whole_chromosomes/</a>
                             </p>
                             
                             <p>
                                 Assembly updates and gap information can also be viewed in TAIRs GBrowse (see Assembly tracks
                                 section).
                             </p>
                             
                             <p>
                                 The fully annotated chromosome sequences in TIGR xml format or GFF format, along with Fasta files
                                 of cDNA, CDS, genomic and protein sequences are available from the TAIR ftp site at:
                             </p>
                             <p>
                                 <a href="ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR9_genome_release/">ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR9_genome_release/</a>
                             </p>
                             <p>
                                 We would like to thank all those who contributed to the latest release by providing submissions
                                 for new and incorrectly annotated genes.
                             </p>
                             
                             <p>
                                 TAIR wishes to thank Cornell University for use of the computer clusters at the Cornell Center for
                                 Advanced Computing (CAC).
                             </p>
                             
                         </dd>

                        <dt>
                            <b>Tips for searching DNA stocks including vectors and amiRNA clones &#091;May 20, 2009&#093;</b><a
                                name="id2"></a>
                        </dt>
                        <dd>
                            <p>
                                Using the TAIR quick search:
                                <br />
                                If you know the name of the stock you are looking for, the quick search at the top right of most
                                TAIR pages is fast and easy.
                            </p>
                            <ol>
                                <li>
                                    Enter the name in the search box.
                                </li>
                                <li>
                                    Select clone, vector or DNA stock from the drop down menu adjacent to the search box
                                </li>
                                <li>
                                    If you are not sure which name you have, try searching all three.
                                </li>
                            </ol>
                            <br />
                            Using the
                            <a href="/servlets/Order?state=catalog">ABRC catalog pages</a>:
                            <br />
                            The catalog is useful for browsing smaller collections of stocks, such as libraries and vectors. Stock
                            descriptions are included on these catalog pages.
                            <ol>
                                <li>
                                    Click on the vector or library name to see details and vector maps.
                                </li>
                                <li>
                                    Click on the stock number to see pricing and other stock information.
                                </li>
                            </ol>
                            <br />
                            Using the
                            <a href="/servlets/Search?action=new_search&amp;type=dna">DNA/clone
                                search</a>:
                            <br />
                            <ol>
                                <li>
                                    Use the drop down menu in the "Search for" section to select clone or vector. Only constructs
                                    containing Arabidopsis or other plant derived sequences are listed as clones. All other
                                    constructs are listed as vectors.
                                </li>
                                <li>
                                    Use the drop down menu in the "Search by" section of the form to select the search term. Try
                                    searching by both clone/vector name and stock number. Clones can be searched by donor last
                                    name. Searching for vectors by donor last name will be implemented soon.
                                </li>
                                <li>
                                    If you are looking for a keyword search, try searching by "stock description" and "contains"
                                    your keyword.
                                </li>
                                <li>
                                    Click on the clone or vector name in the results page for detailed information.
                                </li>
                                <li>
                                    Click on the stock number for pricing, format shipped and publications.
                                </li>
                            </ol>
                            <br />
                            Searching for amiRNA clones Use the
                            <a href="/servlets/Search?action=new_search&amp;type=dna">TAIR DNA/clone
                                search</a>
                            <br />
                            <ol>
                                <li>
                                    In the "Search by" section select "locus name" from the drop down menu
                                </li>
                                <li>
                                    Enter the name in the form Atxgxxxxx.
                                </li>
                                <li>
                                    In the "Search by" section select "clone name" and select "starts with"
                                </li>
                                <li>
                                    Enter "CSHL".
                                </li>
                                <li>
                                    A spreadsheet (amiRNA at ABRC.xls) listing all amiRNA clones currently available from ABRC
                                    with their associated data and hairpin sequence can be downloaded from the
                                    <a href="ftp://ftp.arabidopsis.org/home/tair/ABRC/">TAIR ftp site</a>.
                                </li>
                            </ol>
                        </dd>
                        <dt>
                            <b>New clones/constructs at ABRC &#091;March 25, 2009&#093;</b><a name="id1"></a>
                        </dt>
                        <dd>
                            <p>
                                Associomics clones - Donors: W. Frommer, J. Schroeder and S. Assman
                                <br />
                                ORF clones of integral membrane proteins and proteins predicted to be involved in signaling or
                                protein modification from the Arabidopsis membrane Interactome Project
                                <a href="http://www.associomics.org/">http://www.associomics.org/</a>. These clones lack a stop
                                codon and can be used to create N and C-terminal fusions.
                            </p>

                            <p>
                                Auxin related constructs - Donor: A. Theologis
                                <br />
                                Promoter regions and 3' UTRs for the Arabidopsis ARF and Aux/IAA gene families.
                            </p>

                            <p>
                                Expression clones - Donor: S. P. Dinesh-Kumar
                                <br />
                                Full length TAP tagged ORF expression clones in the ligation independent Gateway
                                <sup>
                                    TM
                                </sup>
                                compatible LIC6 vector utilized in development of an Arabidopsis protein chip. More information at
                                <a href="http://plants.gersteinlab.org/">http://plants.gersteinlab.org/</a>.
                            </p>

                            <p>
                                These clones and constructs can be found using the
                                <a href="/servlets/Search?action=new_search&amp;type=dna">TAIR DNA search</a> and searching by AGI
                                locus and/or donor last name. Associomics clones have names/stock numbers beginning CIW and
                                expression clones from S. P. Dinesh Kumar have clone names/stock numbers beginning DKL.
                            </p>
                        </dd>



<dt><b>New clones/constructs at ABRC &#091;March 25, 2009&#093;</b><a name="id1"></a></dt>
<dd>
<p>Associomics clones - Donors: W. Frommer, J. Schroeder and S. Assman<br />
ORF clones of integral membrane proteins and proteins predicted to be involved
in signaling or protein modification from the Arabidopsis membrane Interactome 
Project <a href="http://www.associomics.org/">http://www.associomics.org/</a>. 
These clones lack a stop codon and can be used to create N and 
C-terminal fusions.</p>

<p>Auxin related constructs - Donor: A. Theologis<br />
Promoter regions and 3' UTRs for the Arabidopsis ARF and Aux/IAA gene families.</p>

<p>Expression clones - Donor: S. P. Dinesh-Kumar<br />
Full length TAP tagged ORF expression clones in the ligation independent 
Gateway<sup>TM</sup> compatible LIC6 vector utilized in development of an Arabidopsis 
protein chip. More information at <a href="http://plants.gersteinlab.org/">http://plants.gersteinlab.org/</a>.</p>

<p>These clones and constructs can be found using the <a href="/servlets/Search?action=new_search&type=dna">TAIR DNA search</a> and 
searching by AGI locus and/or donor last name. Associomics clones have 
names/stock numbers beginning CIW and expression clones from S. P. Dinesh Kumar 
have clone names/stock numbers beginning DKL.</p>


<dt><b>AraCyc 5.0 and PlantCyc 2.0 release &#091;March 18, 2009&#093;</b></dt>
<dd>
92 new and updated biochemical pathways of Arabidopsis and other plants are included 
in this release of our metabolic pathway databases. Please see the 
<a href="http://www.plantcyc.org/release_notes/release_notes.faces">release notes</a> 
for more details. Large sets of enzyme orthologs from Arabidopsis, rice, 
tomato, and Medicago are now displayed on many PlantCyc pathways. AraCyc also 
includes two new sets of compounds. Look up your favorite pathways, enzymes, 
and metabolites <a href="http://www.plantcyc.org:1555/PLANT/server.html?">here</a>.
</dd>

<dt><b>ABRC and NASC price increase &#091;January 14, 2009&#093;</b></dt>
<dd>
Stock prices will change effective February 1, 2009. The price of individual stocks will increase to $5 (from $4) each for academic users and to $20 each for commercial users. The price of sets of stocks will also be increased by approximately 25%. The $15 charge for each order will not change at this time. Stock prices have been constant since the current system was implemented in 2004, and we will continue to attempt to keep prices as low as possible while providing the best possible service.
</dd>

<dt><b>Hannon amiRNA clones available from ABRC &#091;January 6, 2009&#093;</b></dt>
<dd>
ABRC is now distributing a collection of approximately 8,000 artificial microRNA (amiRNA) clones developed by Greg Hannon; Dick McCombie; Rob Martienssen; Detlef Weigel and Ravi Sachidanandam. Production of this resource was funded by an Arabidopsis 2010 grant, A Comprehensive Resource for Analysis of Arabidopsis Gene Function (<a href="http://2010.cshl.edu/scripts/main2.pl">http://2010.cshl.edu/scripts/main2.pl</a>), the focus of which was to develop a genome wide resource for RNAi interference in Arabidopsis using amiRNAs with altered targeting capacity that can efficiently and specifically silence any chosen gene. The clones received by ABRC target approximately 8,000 genes, and were previously distributed exclusively by Open Biosystems. The ultimate goal of the project is to develop several clones for each gene and these will be made available through Open Biosystems and ABRC. The clones received to date can be found and ordered through the TAIR web site. </dd>


<dt><b><a href="http://www.textpresso.org/arabidopsis/">Textpresso now available for Arabidopsis</a> &#091;November 19, 2008&#093;</b></dt>
<dd>
Textpresso is an information extracting and processing package for biological 
literature. Textpresso for Arabidopsis allows users to search all abstracts and 
over 15,700 full-text publications in TAIR and is now available at 
<a href="http://www.textpresso.org/arabidopsis">www.textpresso.org/arabidopsis</a>. Keyword searches can be 
narrowed by searching in specific categories. Textpresso was 
initially developed by Hans-Michael Muller, Eimear Kenny and Paul W. Sternberg, 
with contributions from Juancarlos Chan and David Chen. This new version, 
Textpresso 2.0, was developed by Hans-Michael Muller with contributions from 
Arun Rangarajan and Tracy K. Teal.</dd>

<dt><b>New Bur-0 and Tsu-1 SNPs, indels &#091;September 17, 2008&#093;</b></dt>
<dd>
823,325 SNPs and 79,961 indels
for Bur-0 and Tsu-1 now available
on TAIR's <a href="http://arabidopsis.org/cgi-bin/gbrowse/arabidopsis/">GBrowse</a> and <a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/Ossowski_Resequencing_Data_2008/">FTP</a> site,
and at <a href="http://1001genomes.org">1001 Genomes </a>(Ossowski et al. 2008, in press in
Genome Research)
</dd>

<dt><b><a href="/servlets/TairObject?id=30417&type=locus">Phenotype Images</a> &#091;September 17, 2008&#093;</b></dt>
<dd>
View phenotype images in the germplasm section of the locus page. 
Help us to add an image to each locus by <a href="/submit/phenotype_submission.jsp">submitting</a> one today. 
</dd>


<dt><b>TAIR Survey &#091;August 15, 2008&#093;</b></dt>
<dd>
<a href="/about/survey.jsp">View</a> the TAIR survey results and add your own 
comments to the survey wiki.
</dd>
<dt><b>2020 Vision for Biology Work &#091;August 15, 2008&#093;</b></dt>
<dd>
You can now <a href="/portals/masc/masc_docs/masc_wk_rep.jsp">download</a> the report from an NSF-sponsored workshop held January 3-5, 2008 that 
focused on the future directions for plant research.
</dd>

<dt><b>Somerville Biofuels Podcast &#091;August 15, 2008&#093;</b></dt>
<dd>
<a href="http://www.ciw.edu/somerville_keynote">Listen</a> to Chris Somerville's keynote address on biofuels for the 
International Arabidopsis conference in Montreal. 
</dd>

<dt><b>New GBrowse Tracks &#091;July 16, 2008&#093;</b></dt>
<dd>
<p>In the last few weeks, we have added many new tracks to the TAIR genome 
browser GBrowse. Data represented in these tracks include aligned Brassica 
Sequences (ATIDB), Methylation Plots (Ecker et al., 2006), Orthologs (Inparanoid), 
Plant Gene Families (Phytozome), MPSS data (Lu et al., 2005), Proteomics data 
(Baerenfaller et al. 2008), Polymorphic Regions (Zeller et al., 2008), Promoter 
Elements (PlantPromoterDB, Yamamoto et al., 2008), Transposable Elements and 
Transposable Element Genes, mRNAs(Col-0) and smRNAs(Col-0) (Lister et al., 2008; 
Gregory et al., 2008), Gaps and more. Tracks can be selected from the tracks menu 
in GBrowse 
(<a href="/cgi-bin/gbrowse/arabidopsis/">http://www.arabidopsis.org/cgi-bin/gbrowse/arabidopsis/</a>). 
For additional information and references regarding the data displayed in GBrowse, 
please click on the title of the track of interest.
</p>

<dt><b>ABRC Invoice Search now available &#091;July 2, 2008&#093;</b></dt>
<dd>
<p>You may now search for your ABRC invoices from your personal TAIR homepage.
An alert is also posted on this page if you have unpaid invoices.</p>

<p>You can access your personal homepage by logging in to TAIR using the Login/Register link or by clicking on My Home at the top of every TAIR page. This new tool allows you to search for invoices any time after your orders have been shipped. If you are the PI of a laboratory, you can view your personal invoices, as well as those of your lab members. Clicking on the invoice number will result in a page with a printable invoice.</p>

<p>If you are a PI and would like to allow a lab manager or an administrative / purchasing associate access to your invoices, please contact ABRC at <a href="mailto:abrc@osu.edu">abrc@osu.edu</a>.</p>

<p>We encourage you to login now to check the current status of your invoices. Please note that ABRC no longer mails hard copies of invoices. To obtain an invoice, you must print it online and we ask that you submit it to the appropriate person for payment.<p>
</dd>


<dt><b>AraCyc 4.5 release and PMN 1.0 debut &#091;June 16, 2008&#093;</b></dt>
<dd>
AraCyc genes and pathways were updated after the TAIR 8 genome annotation. See <a href="/biocyc/releasenotes.jsp">release notes</a> for more details. Going beyond Arabidopsis, the <a href="http://www.plantcyc.org">Plant Metabolic Network (PMN)</a> has launched its official web site and released the first version of PlantCyc, a comprehensive biochemical pathway database for the entire plant kingdom. PlantCyc 1.0 has over 500 pathways containing enzymes from over 290 plant species. See <a href="http://www.plantcyc.org/about/release_notes.faces"> release notes</a> for more details.
<dd>

<dt><b>
Zeller et al. 2008 PRPs now in TAIR  &#091;June 13, 2008&#093;</b></dt>
<dd>5.5 million array-based polymorphic region (PR) predictions defining SNPs, SNP clusters, and small to large indels in 19 accessions available for download on the <a href="ftp://ftp.arabidopsis.org/Polymorphisms/Polymorphic_Region_Predictions_Zeller_2008">TAIR ftp site</a> and viewable in <a href="/cgi-bin/gbrowse/arabidopsis//?name=Chr1%3A1506865..1511864">GBrowse</a>. See <a href="http://www.genome.org/cgi/content/abstract/gr.070169.107v1 ">Zeller et al. 2008 Genome Research article</a> for more details.</dd>

<dt><b>TAIR8 Release &#091;April 28, 2008&#093;</b></dt>
<dd><p>The Arabidopsis Information Resource (TAIR) is pleased to announce the release of the latest version of the Arabidopsis genome annotation (TAIR8) at TAIR and NCBI. The latest release builds upon the gene structures of the previous TAIR7 release using new cDNA and EST data released in the intervening period as well as community input regarding missing and incorrectly annotated genes.</p>

<p>The TAIR8 release contains 27,235 protein coding genes, 4759 pseudogenes or transposable elements and 1288 ncRNAs (33,282 genes in all, 38,963 gene models).</p> 
<p>A total of 1291 new genes and 2009 new gene models were added. Thirteen percent 
(4330) of Arabidopsis genes now have annotated splice variants.  Updates were made to 3811 gene structures of which 625 gene models had CDS updates; a total of 4007 exons were modified and 683 new exons incorporated. There were 33 gene splits and 41 gene merges. Overall 23% of all existing TAIR7 genes (7380 genes) were updated (includes split, merged and deleted genes as well as locus type changes, structural updates and sequence updates) for TAIR8.</p> 

<p>The following updates were made to the chromosome sequences for this release:</p>

<p>14 regions were identified as either vector, E.coli or rice contamination, in all cases the existing sequence was substituted with the equivalent number of IUPAC ambiguity code ‘N’s. Consequently there is no resulting change in chromosome length. Further assembly insertions and deletions are expected for the next release (TAIR9) at this time contamination regions identified in TAIR8 will be standardised to a set size in line with previously identified assembly gaps.</p>

<p>1425 single nucleotide substitutions were made to the assembly sequence based on high confidence Solexa read data using the Columbia ecotype supplied by Joe Ecker.  The sequences of 518 genes overlapping these substitutions have also been updated. Further details of these assembly changes can be found at <a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/whole_chromosomes/">
ftp://ftp.arabidopsis.org/home/tair/Sequences/whole_chromosomes/</a><p>

<p>In earlier releases all non transposon related pseudogenes and transposon genes were categorised as locus type pseudogene. For TAIR8, transposon related genes have been reclassified into a distinct transposable element gene class.  There are 3900 transposable element genes and 859 pseudogenes (non transposon related) annotated in TAIR8.</p> 

<p>We have combined transposable element annotations provided by Hadi Quesneville with pre-existing annotations to create a composite set of Arabidopsis transposons. These have been assigned a unique identifier (e.g. AT3TE53245) that indicates relative position on the chromosome. Under defined criteria (<a href="ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR8_genome_release/Readme-transposons">see additional readme-transposons</a>) we have associated transposons to overlapping transposable element genes e.g. genes AT3G32022, AT3G32024, AT3G32026, AT3G32027 and AT3G32028 are associated to transposon AT3TE53245. Transposons can be viewed in TAIR’s Gbrowse and additional information can be found on the Transposon and Transposon family detail pages.</p>


<p>The fully annotated chromosome sequences in TIGR xml format or GFF format, along with Fasta files of cDNA, CDS, genomic and protein sequences, and lists of added, deleted and updated genes are available from the TAIR ftp site at:</p> 

<p><a href="ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR8_genome_release/">ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR8_genome_release/</a></p> 

<p>Fasta formatted files for all TAIR sequence analysis datasets including sets of intron, intergenic, UTR, upstream and downstream sequences are also available from:</p> 

<p><a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/">ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/</a></p> 

<p>Access the new release using TAIR's genome browsers:</p> 

<p><a href="http://tairvm09.tacc.utexas.edu/servlets/sv">http://arabidopsis.org/servlets/sv</a></p> 
<p><a href="/cgi-bin/gbrowse/arabidopsis">http://www.arabidopsis.org/cgi-bin/gbrowse/arabidopsis</a></p>

<p>Full TAIR8 release notes are available at:</p> 

<p><a href="ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR8_genome_release/README">ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR8_genome_release/README</a></p>
</dd>

<dt><b><a href="http://www.surveymonkey.com/s.aspx?sm=yav7LGGaEEktB4WylRpr1Q_3d_3d">TAIR Survey Now Open!</a> &#091;April 22, 2008&#093;</b></dt>
<dd>Please click on the survey button at the top of the page to give us your comments and feedback on how well TAIR is serving your needs and 
what additional tools and data you would like to see. The survey will 
be open for only a short time, please act now to be sure your input is included. The Survey is now closed.</dd>

<dt><b>TAIR8 Genome Release &#091;April 22, 2008&#093;</b></dt>
<dd>The TAIR8 genome release is underway. Some data discrepancies may be observed during this 
data loading period. All data updates at TAIR and NCBI should be complete by Friday April 25.</dd>

<dt><b> New Clones Received at ABRC &#091;April 1, 2008&#093;</b></dt>
<dd><p>a. 10,209 Gateway<sup>TM</sup> cDNA/ORF clones from J. Ecker (Salk)
ORF clones from the SSP project originally provided in pUNI51 are now subcloned 
in the GatewayTM entry vector pENTR223 which carries a spectinomycin resistance 
gene. The subcloned ORF insert was previously fully sequenced and shown to be error-free. 
No PCR was used in the subcloning process
&#040;<a href="http://signal.salk.edu/cdnastatus.html">http://signal.salk.edu/cdnastatus.html</a>&#041;. These clones have been end sequence 
validated across both subcloning sites (SfiA/B). As a consequence, the great 
majority of the Salk ORFs can now be obtained in either a Gateway<sup>TM</sup> 
or pUNI vector.<p>
 
<p>b. 15 vectors from various donors<br />
These include pORE binary vectors from D. Hegedus, a modular series 
of 14 vectors suitable for monocot and dicot transformation, and the LIC6 
(pLIC-C-TAP) vector from S. P. Dinesh Kumar, a C-terminal TAP T-DNA vector 
compatible with Gateway<sup>TM</sup> and ligation independent cloning methods.</p>
 
<p>c. 2,425 transcription factor expression clones from S. P. Dinesh Kumar <br />
We now have a total of over 4,000 clones, mostly representing transcription 
factors, from this project in either the Gateway<sup>TM</sup> compatible expression vector, 
pYL436 (pC-TAPa), or the ligation independent vector, LIC6. Both vectors allow 
for expression of the protein in plants as a C-terminal TAP fusion.</p>
 
<p>d. 82 cloned genes and constructs<br />
These include a set of 55 multi-color in-vivo 
organelle markers targeted to ER, Golgi, tonoplast, 
plasma membrane, peroxisomes, mitochondria and plastids designed for 
co-localization studies in plants from A. Nebenfuhr 
&#040 <a href="http://www.bio.utk.edu/cellbiol/markers/default.htm">
http://www.bio.utk.edu/cellbiol/markers/default.htm</a>&#041. 
Also calcium dependent protein kinase clones from J. Harper and cation 
hydrogen exchanger clones from H. Sze.</p></dd>

<dt><b><a href="/news/plant_phys_partnership.txt"> TAIR&#047;Plant Physiology Collaboration</a> &#091;March 13, 2008&#093;</b></dt>
<dd><a href="http://www.plantphysiol.org/cgi/content/full/146/3/1022?etoc">Plant Physiology</a> will collect Arabidopsis-related gene information at the 
time of manuscript acceptance and pass that data on to the TAIR database.</dd>

<dt><b><a href="/news/jobs.jsp"> Curator positions available at TAIR, Stanford, CA</a> &#091;March 5, 2008&#093;</b></dt>
<dd>TAIR is looking for a <a href="/news/job_postings/tair/swarbreck030508.txt">genome annotation curator</a> and a 
<a href="/news/job_postings/tair/berardini030508.txt">functional annotation curator</a>
beginning Mar-May 2008. Biology Ph.D and strong research background are
required.</dd>

<dt><b>New Seed Stocks at ABRC &#091;March 5, 2008&#093;</b></dt>
<dd>a) 17,291 SALK-C (confirmed) lines now in-house: ABRC is continually receiving new lines from the J. Ecker lab, Salk Institute. As soon as each line is received, its data is entered in TAIR and the stock can be ordered. Occasionally there will not be enough seeds received for a line to be distributed immediately so that further propagation is required before release. Information on handling of SALK lines can be found at the SIGnAL Web site ( <a href="http://methylome.salk.edu/cgi-bin/homozygotes.cgi">http://methylome.salk.edu/cgi-bin/homozygotes.cgi</a>). We expect to be receiving new homozygous lines on a regular basis until the full 50,000-line collection is completed. The SIGnAL Web site represents the best location to determine the status of homozygous line development for a particular locus. Searches for available lines within TAIR can be conducted by entering the line number with the suffix “C” (SALK_xxxxxxC) in the stock number or germplasm name field on the germplasm search page at <a href="/servlets/Search?action=new_search&type=germplasm">http://www.arabidopsis.org/servlets/Search?action=new_search&type=germplasm</a> .  You can also search by locus name here.
 
<p>b) The first subset of the full set of SALK- Cs is now being prepared: Following substantial review by our Advisory Committee and multiple surveys of the user community, we are preparing complete single-line sets for the confirmed T-DNA collection. This is being done in phases, so that the first approximately 9000 lines received are presently being aliquoted for shipment to those who indicated interest in this resource. It is hoped that this will happen in April. When the lines are ready for shipment, we will notify those that have reserved sets so that they can then place formal orders, pay for the lines and shipment will be made. If you have reserved a set of these lines and an import permit is required for you to receive this material (e.g., from Australia, Argentina, Canada, China, possibly others), it is suggested that you apply immediately and send an electronic copy to ABRC at abrc@osu.edu. Please Note: This material is being offered at a price substantially below our normal recovery cost. We wish to ask that data regarding the viability, genetic purity and correctness of the lines be returned to us for all lines that you investigate and have problems. It is expected that the incidence of such results will be minimal, but we wish to strive to make this resource one with the highest possible genetic integrity since it will serve as one of our foundation resources for the future.</p>
 
<p>c) Many other new stocks have been received: Chromatin Charting, various RI line sets, natural accessions, mutants and transgenic lines: During recent months many new resources have been received, in all categories of stocks. A few of these should be brought specifically to your attention. The Chromatin Charting lines, from Eric Lam and Rob Martienssen, are now being distributed. These lines can be found in the TAIR germplasm search using the following criteria; donor organization, type exactly “Chromatin Charting Project”. A section of our on-line catalog devoted to these lines is being developed and will be soon incorporated into the catalog <a href="/servlets/Order?state=catalog">( http://www.arabidopsis.org/servlets/Order?state=catalog</a>). New recombinant inbred lines sets from the following donors are also in-house. Donors of these stocks include Maarten Koornneef , Justin Borevitz, Christopher Schwartz, Alan Lloyd, Luca Comai and the John Innes Centre (Ian Bancroft).</p>
 
<p>DNA Resources: Many new DNA resources are presently in-house and will be addressed in a Breaking News item in the near future.</p></dd>

<dt><b>New GBrowse tracks &#091;February 6, 2008&#093;</b></dt>
<dd>Our new Vista plugin from JGI displays nucleotide similarity between A.
thaliana and 5 other plant species (poplar, rice, Medicago truncatula,
Physcomitrella patens and Selaginella moellendorfii). Peak height
represents % nucleotide identity between genomes. The peak color varies
according to the annotation of that region in A. thaliana (purple=exon,
turquoise=UTR, grey=intron/intergenic, orange= >50% similarity in a
predicted non-coding region). Use the Vista configuration option on the
top of the Gbrowse window to customize the Vista display and click on
each curve to see alignment data.</dd>

<dt><b>Change to seed ordering process for European users. &#091;January 23, 2008&#093;</b></dt>
<dd>NASC can no longer accept orders placed through TAIR, because of changes to their database and ordering system.  European users wishing to order seed stocks should order through the NASC website at <a href="http://www.arabidopsis.info">http://www.arabidopsis.info</a>  All users may still order DNA stocks from ABRC through TAIR.</dd>

<dt><b><a href="/news/job_postings/tair/huala111407.txt">TAIR Curator position, Stanford, CA </a> &#091;November 14, 2007&#093;</b></dt>
<dd>We're seeking a genome annotation and literature curator beginning Jan-Mar 2008. Biology Ph.D and strong research background are required.</dd>

<dt><b><a href="/biocyc/index.jsp">AraCyc 4.1 release </a>&#091;November 14, 2007&#093;</b></dt>
<dd>23 pathways were significantly updated in the last release in October. More <a href="/biocyc/releasenotes.jsp">details.</a></dd>

<dt><b><a href="/tools/bulk/go/index.jsp">New Bar Charts for GO Classification</a> &#091;August 29, 2007&#093;</b></dt>
<dd>You can view the current GO annotation of the whole genome or your set of genes in either pie chart (based on annotation numbers) or the <b>new</b> bar chart (based on gene numbers) format. To see the bar charts, select 'Gene Bar Chart' when drawing results from Functional Categorization. Formulas that define the percentages in each slice/bar are provided. When using charts generated using TAIR in publications, please provide the date of analysis for reference purposes.</dd>

<dt><b><a href="/cgi-bin/gbrowse/arabidopsis/?name=Chr1%3A1504365..1514364">GBrowse now available at TAIR</a> &#091;August 15, 2007&#093;</b></dt>
<dd>The Generic Genome browser, developed by the Generic Model Organism Database (<a href="http://www.gmod.org/wiki/index.php/Gbrowse">GMOD</a>) project, is now available at TAIR. Search or browse a map of the Arabidopsis genome 
(including genes, cDNAs and ESTs, insertion mutants, SNPs, markers and BACs) or upload your own annotation track. Tracks can be easily customized by turning on and off 
specific data types, collapsing and expanding tracks, or changing track order.</dd>

<dt><b>Perlegen SNPs now available &#091;July 20, 2007&#093;</b></dt>
<dd>249,052 high-quality SNPs discovered with Perlegen resequencing arrays now available from <a href="/servlets/Search?action=new_search&type=polyallele">TAIR polymorphism search</a> and <a href="http://tairvm09.tacc.utexas.edu/servlets/sv">SeqViewer</a>. 
More than 1 million SNPs discovered at various false discovery rates are available at the <a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/Perlegen_Array_Resequencing_Data_2007">TAIR FTP site</a>, as are 13,470 predictions of highly polymorphic or deleted regions.  
See the <a href="http://www.sciencemag.org/cgi/content/abstract/317/5836/338">Clark et al. 2007 Science</a> article for more details. 

<dt><b><a href="/news/job_postings/tair/rhee071007.txt">TAIR Curator position, Stanford, CA</a> &#091;July 18, 2007&#093;</b></dt>
<dd>TAIR is looking for a full-time curator beginning September 2007. Biology Ph.D and strong research background are required.</dd>

<dt><b><a href="/portals/education/presentations.jsp">TAIR Presentations</a> &#091;July 18, 2007&#093;</b></dt>
<dd>The TAIR workshop presentations given at the ASPB Meeting in Chicago and the 18th Arabidopsis Meeting in Beijing have been made available from the TAIR website for download. To view the powerpoint presentations click <a href="/portals/education/presentations.jsp">here</a>.
</dd>

<dt><b><a href="/biocyc/index.jsp">AraCyc 4.0 release</a> &#091;July 3, 2007&#093;</b></dt>
<dd>We are happy to announce a major release for the AraCyc database, which includes many gene updates and close to 90 new/updated pathways. More <a href="/biocyc/releasenotes.jsp">details</a>.</dd>

<dt><b>18th ICAR Abstracts Now Available &#091;June 20, 2007&#093;</b></dt>
<dd>
<a href="/servlets/Search?action=new_search&type=publication">Search</a> or <a href="/news/abstracts.jsp">browse</a> the Beijing meeting abstracts.
</dd>

<dt><b><a href="/news/job_postings/rhee050207.txt">Bioinformatics Positions</a></b> &#091;May 2, 2007&#093;</dt>
<dd>
Two postdoctoral research positions and a database curator position are 
available immediately in Dr. Sue Rhee’s group at the Carnegie Institution, 
Department of Plant Biology (Stanford, CA).
</dd>

<dt><b><a href="/portals/genAnnotation/gene_structural_annotation/annotation_data.jsp">
TAIR7 Genome Release</a></b> &#091;April 23, 2007&#093;</dt>
<dd>
TAIR's new genome release, version 7, has been integrated into the TAIR database, SeqViewer, MapViewer and sequence analysis datasets, and is also available from NCBI. The TAIR7 release contains 27,029 protein coding genes, 3889 pseudogenes or transposable elements and 1123 ncRNAs (32,041 genes in all, 37,019 gene models). A total of 681 new genes and 1002 new splice variants were added. Twelve percent (3866) of Arabidopsis genes now have annotated splice variants.  Updates were made to 10,792 gene structures of which 797 gene models had CDS updates; a total of 14,050 exons were modified and 828 new exons incorporated. There were 41 gene splits and 34 gene merges. Overall one third of all existing TAIR6 loci (10098 loci) were updated for TAIR7.
<br />
<br />
The fully annotated chromosome sequences in TIGR xml format or GFF format, along with Fasta files of cDNA, CDS, genomic and protein sequences, and lists of added, deleted and updated genes are available from the TAIR ftp site at:
<br />
<br />
<a href="ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR7_genome_release/">ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR7_genome_release/</a>
<br />
<br />
Fasta formatted files for all TAIR sequence analysis datasets including sets of intron, intergenic, UTR, upstream and downstream sequences are also available from:
<br />
<br />
<a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/">ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/</a>
<br />
<br />
Access the new release using TAIR's genome browser:
<br />
<br />
<a href="http://tairvm09.tacc.utexas.edu/servlets/sv">http://arabidopsis.org/servlets/sv</a>
<br />
<br />
Full TAIR7 release notes are available at:
<br />
<br />
<a href="ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR7_genome_release/README">ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR7_genome_release/README</a>
</dd>

<dt><b><a href="/news/job_postings/rhee040407.txt">Postdoctoral Research Position</a></b> &#091;April 4, 2007&#093;</dt>
<dd>
A bioinformatics postdoctoral position is available June 1, 2007 in the 
laboratory of Dr. Sue Rhee at the Carnegie Institution, Department of Plant 
Biology (Stanford, CA), to create and test a predictable metabolic network model 
in Arabidopsis.
</dd>

<dt><b>AraCyc 3.5 release</b> &#091;February 14, 2007&#093;</dt>
<dd>This release contains 262 Arabidopsis biochemical pathways. Among them, 51 are newly added, and 37 have been significantly updated. Details <a href="/biocyc/releasenotes.jsp">here</a>.</dd>
<dt><b>Sequence-validated AGRIKOLA clones</b> &#091;February 6, 2007&#093;</dt>
<dd>Pierre Hilson's functional genomics group in the Department of Plant Systems Biology at the University of Ghent has been funded by a Belgian agency to provide a purified, sequence-validated subset of the AGRIKOLA clone collection to the research community.  Access to these clones is through <a href="http://bccm.belspo.be/db/lmbp_gst_clones/"> BCCM/LBMP</a>, a Belgian resource center. In addition, an <a href="http://www.psb.ugent.be/reva/index.php?o=/reva/main"> online system</a> has been established to allow scientists to request sequence validation for their clones of interest.</dd>


<dt><b>Data Updates Temporarily Suspended</b> 
&#091;October 19, 2006&#093;
<dd>Some TAIR data updates, including loading of new ABRC stocks and updates to information arising from literature-based curation (gene summaries, aliases, GO and PO annotations, and user submitted errors for correction) will be suspended on Oct 20 and resume on approximately Nov 17 while we move our servers to a new location.  Stock ordering and new user registration will continue throughout most of this period, with a brief 2 day interruption in mid-November.  The exact dates of the 2 day ordering and registration freeze will be announced on the TAIR home page several days before the freeze takes effect. TAIR searching and browsing are expected to remain available without interruption throughout this period.
 
<dt><b>New Phenotype Search Option</b> &#091;October 13, 2006&#093;
<dd>You can now search for <a href="/servlets/Search?action=new_search&amp;type=gene">genes</a>,
<a href="/servlets/Search?action=new_search&amp;type=germplasm">germplasms</a>, and
<a href="/servlets/Search?action=new_search&type=polyallele">polymorphisms</a> using
using associated phenotype information.  The gene, locus, germplasm, polymorphism and stock detail pages have been updated to display this data.  When available, the reference that describes the phenotype is cited.

<dt><a href="/portals/education/presentations.jsp">ASPB Presentations</a> &#091;August 15, 2006&#093;
<dd>Following heavy demand, the <a href="/portals/education/presentations.jsp">TAIR workshop presentations</a> given at the ASPB Meeting in Boston have been made available from the TAIR website for download. The powerpoint presentations are accessible from the 'Education and Outreach' portal under 'TAIR Presentations'. In addition to ASPB, you will also find the presentations given at the 17<sup>th</sup> Arabidopsis Meeting in Madison.

<dt>AGRIKOLA entry clones and RNAi seed lines available from ABRC &#091;August 1, 2006&#093; 
<dd> ABRC has received 20,274 GST entry clones from the <a href="http://www.agrikola.org">AGRIKOLA consortium</a>
cloned in the Gateway TM pDONR207 vector. These are derived from GSTs originally developed by the <a href="http://www.catma.org">CATMA
(Complete Arabidopsis Transcriptome MicroArray)</a> consortium. Note that the 
constructs distributed by the ABRC are not purified clones, but mixes resulting from the transformation of Gateway BP 
clonase reactions. Protocols for validation of these plasmids are available at:
<a href="http://www.agrikola.org/index.php?o=/agrikola/html/gst_validation">http://www.agrikola.org/index.php?o=/agrikola/html/gst_validation</a>
We have also received 659 RNAi seed lines generated by transformation with pAGRIKOLA clones. Protocols for validation of these lines are 
available at:<a href="http://www.agrikola.org/index.php?o=/agrikola/html/seeds_validation">
http://www.agrikola.org/index.php?o=/agrikola/html/seeds_validation</a>
Delivery clones in the pAGRIKOLA RNAi transformation vector, derived from the entry clones, were used to generate the RNAi seed lines. Entry clones and seed lines can be ordered through TAIR. Delivery clones and additional seed lines will be received in the future.

<dt>
    <a href="/news/monthly/TAIR_News_May06.jsp">TAIR April/May 2006 News Release</a>
&#091;June 27, 2006&#093;
<dd>Find out new or updated data and software made to TAIR for the months of April and May.

<dt>New ORF Clones available &#091;June 20, 2006&#093;
<dd>A new collection of ORF clones for 2,100+ genes has been donated by TIGR to ABRC. 
This collection includes Gateway(tm) entry clones of hypothetical genes, novel genes, and genes with 
low expression patterns. The coding regions for all clones have been sequence verified. All clones are 
available with a stop codon and ORF clones for over 800 genes are also available without the stop codon. 
This project was supported by the NSF Arabidopsis 2010 initiative. Visit the project website for more 
description of the clones (http://www.tigr.org/tdb/hypos/) and order the stocks from ABRC through TAIR.

This resource adds to the full length ORF/cDNA collection of ABRC which at present includes 14,127 entry clones from SALK/SSP, 1,150 Entry clones from Yale/Peking,  111 entry clones from J. Callis, 155 expression clones from J. Doonan and 1,100 expression clones from Yale. 
<dt>
    <a href="/news/job_postings/dba060606.txt">TAIR Database Administrator Position available</a>
&#091;June 6, 2006&#093;
<dd>Full-Time Database Administrator Position available at TAIR (The Arabidopsis Information Resource).

<dt><a href="/news/job_postings/curator060606.txt">TAIR Curator Position available</a> &#091;June 6, 2006&#093;
<dd>TAIR is looking for a full-time curator beginning in September, 2006.

<dt><a href="/portals/index.jsp">New Portals</a> &#091;May 16, 2006&#093;
<dd>
In response to community suggestions, TAIR has created several portal
pages that combine information, datasets, and tools relevant to specific
areas of interest (for example: Gene Expression, Mutant and Mapping
Resources, Genome Annotation).  Links are provided to resources both at
TAIR and at locations all over the cyberworld. 

<dt><a href="/news/job_postings/tairCurator040406.txt">TAIR Curator Position available July 1, 2006</a> &#091;April 4, 2006&#093;
<dd>TAIR is looking for a full-time curator beginning July 1.

<dt>
    <a href="/news/monthly/TAIR_News_Mar06.jsp">TAIR February and March News Release</a> &#091;April 4, 2006&#093;
<dd>Find out new or updated data and software made to TAIR.

<dt>New On-Line Payment Feature for ABRC 
<dd>Features have been installed in TAIR that allow payment of ABRC user fees by credit card through secure Web transactions.  This new system should simplify payment of your user fees.  You will be able to simply enter credit card information, and payment will be completed when your order is shipped.  For other payment options, the associated invoice will be available online. Changes in the ordering/payment system include the following:
<ol>
<li>Ordering screens have been improved so that placing stock orders will be easier.</lli>

<li>Payment information is required at the time you place your order.</li>

<li>Once your order is placed, you will not be able to add stocks or combine orders.</li>

<li>Invoice information is available online for all new orders.</li>

<li>When your order is shipped, you will receive an email with a link to print your invoice or paid receipt.</li>

<li>For payments other than credit card, you will need to forward the invoice to your accounts payable department, and they may send us payment by check or money order.</li>
</ol>
Your lab will be sent one more invoice by mail to cover orders placed from November 1, 2005 - present.  These are not covered by the new system. Thank you for your support of our Center. 
<dt><a href="/news/job_postings/friesner022806.doc">AT2010 International Research Exchange Opportunity</a> &#091;February 28, 2006&#093;
<dd>
Funds are available to allow graduate students and/or postdoctoral fellows from NSF-supported U.S. laboratories engaged in Arabidopsis functional genomic projects to spend up to three months in a host German laboratory.

<dt>Mapping of CATMA, AFGC and Agilent microarray elements to TAIR6 Genome &#091;February 7, 2006&#093;
<dd>Sequences of CATMA, AFGC and Agilent elements have been mapped to the latest Arabidopsis genome version (TAIR6). 
Mapping files can be downloaded from the corresponding directories on the 
<a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/">ftp site</a>. 
Searching for specific elements/loci can be performed using our <a href="/tools/bulk/microarray/index.jsp">Microarray Element Search</a>

<dt><a href="/abrc/catalog/tdna_confirmed_1.html">Homozygous SALK Insertion Lines at ABRC</a> &#091;February 7, 2006&#093;
<dd>
ABRC is beginning distribution of the first of the purified ("Confirmed"), mainly homozygous, SALK T-DNA insertion 
lines from the Joe Ecker lab as well as similar lines from Wisconsion (Wisconsin Ds-Lox), Syngenta (SAIL) and other 
laboratories. There is a browsing list of available lines in <a href="/abrc/catalog/tdna_confirmed_1.html">our electronic catalog</a>. <u>Researchers are also 
encouraged to donate insertion lines which they have purified to augment this resource</u>.

<p>


At this point we have received about 1,000 homozygous lines from the Ecker lab at the Salk Institute, and 
600 purified insertion lines from other researchers. Approximately 50,000 Confirmed lines will be received 
from Salk in the next two years. The lines donated from Salk have stock numbers of the form "SALK_xxxxxxC," 
and are searchable in TAIR. The <a href="http://signal.salk.edu">SIGnAL Web site</a> displays information regarding 
progress on lines being genetically confirmed by PCR and from which lines homozygous (or segregating F2-equivalent) 
stocks are being extracted. </p>
<dt>
    Locus Page Update
&#091;November 15, 2005&#093;
<dd>Direct link to Genevestigator and NASCArray microarray data from Locus pages now available. Loci represented in the Affymetrix arrays are linked to results from Genevestigator's Gene Atlas, 
Gene Chronologer and Response Viewer tools, and to NASCArrays' Digital Northern and Spot History. Those 
links are found in the 'External Links' section of Locus detail pages.



<dt>
    <a href="/news/monthly/TAIR_News_Oct05.jsp">TAIR October 2005 News Release</a>
&#091;November 15, 2005&#093;
<dd>Find out new or updated data and software made to TAIR.


<dt>
    TAIR6 Genome Release
&#091;November 11, 2005&#093;
<dd>
TAIR's first genome release, version 6.0, has been integrated into the TAIR database, SeqViewer, MapViewer and 
sequence analysis datasets, and is also available from NCBI.   The TAIR6 release contains 26,751 protein 
coding genes, 3818 pseudogenes and 838 non-coding RNA genes (31,407 genes in all). A total of 437 new genes 
were added and nine genes were made obsolete. Updates were made to 973 genes including 831 updates to coding 
sequences, 14 gene splits and 7 gene merges and the addition of 1200 new splice variants.  A total of 3159 
Arabidopsis genes (10%) now have annotated splice variants. No changes were made to the chromosome sequences for this release.

Access to the fully annotated chromosome sequences in TIGR xml format as well as fasta files of cDNA, cds, 
genomic and protein sequences and lists of added, deleted and changed genes are available at:<br>

<a href="ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR6_genome_release/">ftp://ftp.arabidopsis.org/home/tair/Genes/TAIR6_genome_release</a>

Fasta formatted files for all sequence analysis datasets including sets of intron, intergenic, UTR, upstream and downstream sequences are also available in:

<a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/">ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets</a><br>

Access the new release using TAIR's genome browser:<br>

<a href="http://tairvm09.tacc.utexas.edu/servlets/sv">http://arabidopsis.org/servlets/sv</a>


<dt>
    <a href="/abrc/request_donation3.jsp">ABRC/NASC Request Donations</a>
&#091;November 8, 2005&#093;
<dd>ABRC and NASC are continuing the campaign to procure published 
mutants. Donations are requested!  <a href="https://abrc.osu.edu/donate-stocks">Details/submission info here</a>.

<dt>
    TAIR search update:
&#091;August 17, 2005&#093;
<dd>TAIR's simple search has been updated to allow searching
specific data types by name and other <a href="/help/helppages/initials.jsp">attributes</a>. The new "contains" search can take longer but typically gives better results

<dt>
    <a href="/news/job_postings/tair080205.txt">TAIR Database Administrator Position Available</a>
&#091;August 2, 2005&#093;
<dd>Full-Time Database Administrator Position available at TAIR (The Arabidopsis Information Resource).

<dt>
NAASC 2010 survey
&#091;July 13, 2005&#093;</dt>
<dd>Th North American Arabidopsis Steering Committee is <a href="NAASCletter.jsp">
seeking feedback</a> from the research community. 
Please complete the <a href="http://surveymonkey.com/s.asp?u=453451176745">survey</a> and help plan for the future of Arabidopsis research.</dd>


<dt>
    Microarray Data Submission
&#091;June 6, 2005&#093;
<dd>TAIR is no longer accepting microarray data submission. Go <a href="/info/microarrayAnnouncement.jsp">here</a> to find who is accepting microarray submissions.



<dt>
    Arabidopsis Meeting Abstracts Online
&#091;June 6, 2005&#093;
<dd><a href="http://www.union.wisc.edu/conferenceservices/arabidopsis/">16th International Conference on Arabidopsis Research, June 15-19, 2005</a><br>PDF documents of the meeting abstracts for the <a href="http://www.union.wisc.edu/conferenceservices/arabidopsis/PosterAbstracts.pdf">posters</a>
and oral presentations (
<a href="http://www.union.wisc.edu/conferenceservices/arabidopsis/ArabidopsisORAL1.pdf">Part 1</a> and 
<a href="http://www.union.wisc.edu/conferenceservices/arabidopsis/ArabidopsisORAL2.pdf">Part 2</a>)
for the Madison meeting are available.



<dt>
    <a href="/news/monthly/TAIR_News_Mar05.jsp">TAIR February/March 2005 News Release</a>
&#091;April 12, 2005&#093;
<dd>Find out new or updated data and software made to TAIR in February and March 2005.



<dt>
    <a href="/abrc/request_donation2.jsp">ABRC/NASC Request Donations</a>
&#091;March 1, 2005&#093;
<dd>ABRC and NASC are continuing the campaign to procure published 
mutants. Donations are requested!  <a href="https://abrc.osu.edu/donate-stocks">Details/submission info here</a>.

<dt>
    <a href="/news/jobs.jsp">TAIR Metabolic Pathway Curator Position Available</a>
&#091;February 22, 2005&#093;
<dd>Metabolic Pathway Curator position available immediately.

<dt>
    <a href="/news/monthly/TAIR_News_Jan05.jsp">TAIR December 2004/January 2005 News Release</a>
&#091;February 8, 2005&#093;
<dd>Find out new or updated data and software made to TAIR in December 2004 and January 2005.

<dt>
    <a href="/news/jobs.jsp">TAIR Genome Sequence Curator Position</a>
&#091;January 25, 2005&#093;
<dd>Full-Time Genome Sequence Curator Position will be available July 1, 2005
at TAIR (The Arabidopsis Information Resource).

<dt>
<a href="/abrc/request_donation.jsp">ABRC and NASC Asking for Donations of Mutants</a>
<dd><a href="/abrc/index.jsp">The Arabidopsis Biological Resource Center</a> (ABRC) and the<a href="http://arabidopsis.info"> Nottingham
Arabidopsis Stock Centre</a> (NASC) are conducting a campaign for new mutant
donations. While new mutants are being published at an accelerating rate,
the donations of these have not kept pace. It is our goal to procure as
many of the published mutant strains of Arabidopsis as possible. Follow
this <a href="/abrc/request_donation.jsp">link</a> to read a copy of the letter requesting stocks. This letter includes
all information necessary for donating stocks.



<dt>
    <a href="/news/monthly/TAIR_News_Dec04.jsp">TAIR October/November 2004 News Release</a>
&#091;December 14, 2004&#093;
<dd>Find out new or updated data and software made to TAIR in October and November 2004.

<dt>
<a href="/servlets/Search?action=new_search&type=germplasm">Wisconsin DsLox T-DNA lines available from ABRC</a>
<dd>The T-DNA lines donated by Patrick Krysan, Michael Sussman and Richard Amasino
are now available from ABRC.&#160; The regions flanking the insertions of more than
10,000 of these lines have been sequenced and can be located on the map of
<a href="http://signal.salk.edu/cgi-bin/tdnaexpress">SIGnAL</a>.&#160;The sequences are being incorporated into TAIR.&#160; These lines have the
added feature that a Ds launchpad construct and LoxP sites were included in the
construct.&#160; Hence, transposition of the Ds from any of these sites is possible -
followed by recombination-induced chromosomal deletion, if desired.


<dt>
<a href="/portals/expression/microarray/ATGenExpress.jsp">AtGenExpress Update</a>
&#091;Nov 23, 2004&#093;<br>
<dd>Data for 22 AtGenExpress experiments are now <a href="/servlets/Search?type=expr
&search_action=new_search">
available</a> for download.
 Expression values for the Developmental Atlas can now be <a href="/servlets/Sea
rch?action=new_search&type=expression">searched</a>. Updates will be posted on 
the <a href="/portals/expression/microarray/ATGenExpress.jsp">AtGenExpress</a> page.


<dt>
    <a href="/news/15ArabAbstract.pdf">15th International Conference on Arabidopsis Research Abstracts</a>
&#091;Nov 23, 2004&#093;
<dd>Abstracts from the Berlin meeting are now searchable from the <a href="/servlets/Search?action=new_search&type=publication">TAIR database.</a>


<dt>
    <a href="/news/monthly/TAIR_News_Sept04.jsp">TAIR August/September 2004 News Release</a>
&#091;October 19, 2004&#093;
<dd>Find out new or updated data and software made to TAIR in August and September 2004.

<dt>
    <a href="/news/monthly/TAIR_News_July04.jsp">TAIR June/July 2004 News Release</a>
&#091;September 28, 2004&#093;
<dd>Find out new or updated data and software made to TAIR in June and July 2004.

<dt>
    <a href="/servlets/Search?action=new_search&type=gene">Gene Search Update</a>
&#091;June 30, 2004&#093;
<dd>Obsolete genes are now searchable. Update History section of gene, locus,
and sequence pages now display histories of the data including
merges, splits, and obsolete genes.

<dt>
    <a href="/help/tutorials/go_intro.jsp">GO Tutorial and Quicktime Demos</a>
&#091;July 13, 2004&#093;
<dd>New: Learn about the Gene Ontology (GO),
where to find and how to use TAIR's GO annotations.

<dt>
    TAIR Monthly Maintenance
&#091;June 9, 2004&#093;
<dd>TAIR will begin scheduling regular monthly maintenance periods on the
fourth Saturday of each month between 3 and 6 pm MST (Mountain Standard Time), beginning
Saturday, June 26. During this time the site will be unavailable for
approximately 1.5 hrs.



<dt>
    <a href="/news/monthly/TAIR_News_May04.jsp">TAIR April/May 2004 News Release</a>
&#091;June 8, 2004&#093;
<dd>Find out new or updated data and software made to TAIR in April and May 2004.



<dt>
    <a href="/servlets/Search?action=new_search&type=protocol">New Protocol Search</a>
&#091;June 8, 2004&#093;
<dd>Search protocols in TAIR  by title, author, keyword
and description.Send us your protocols to share with the research
community.



<dt>
    <a href="/abrc/sail.jsp">SAIL lines from Syngenta now available from ABRC</a>
&#091;June 1, 2004&#093;
<dd>ABRC is now distributing a large portion of the lines of the SAIL collection (Syngenta Arabidopsis Insertion Library, formerly GARLIC
collection) which have been donated by Syngenta totally free of any restrictions or material transfer agreement.  Lines identified as
having clear matches of the flanking sequence to the genome, from plates 1 through 801, are now available for distribution.  The
remainder (plates 802 - 1307) will be available Monday June 7.  Please keep in mind that not all sequences posted in GenBank for this
collection have corresponding remnant seeds.  Availability information in TAIR is a direct reflection of the status for each line. 



<dt>
    <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/AtGenExpress/">Microarray Affymetrix Datasets Now Available for Download</a>
&#091;May 24, 2004&#093;
<dd>The MPI T&#252;bingen (Schmid, Lohmann and Weigel labs) have supplied data from
280 Affymetrix arrays, representing 100 experimental treatments. Data will be searchable soon.



<dt>
    <a href="https://abrc.osu.edu/fee-structure">New User Fee Schedule for ABRC and NASC</a>
&#091;April 29, 2004&#093;
<dd>The Arabidopsis stock centers are changing their fee structure to simple per-stock charges, to be effective May 15, 2004. The present user fee year will be extended by two weeks to end on May 14, 2004. The new rate, which applies to all single stocks and orders, is $4 per stock for ABRC and &#163;2.25 for NASC. In addition, a fee of $15 and &#163;8.50, respectively, will be assessed per order. This new system represents an average modest increase in fees. We hope users find this system more convenient.</dd>




<dt>
    <a href="/sitemap.jsp">New TAIR Site/Help Map</a>
&#091;April 13, 2004&#093;
<dd>When you can't find what you're looking for, this might help. A tree style map is provided that conceptually catagorizes web pages to assist you finding pages that might not be obvious. Mouseover the folder or file text to display a description of the contents. It is a very large file, so please be patient when loading it.

<dt>
    <a href="/news/monthly/TAIR_News_March04.jsp">TAIR February/March 2004 News Release</a>
&#091;April 13, 2004&#093;
<dd>Find out new or updated data and software made to TAIR in February and March 2004.

<dt>
Clones in Invitrogen's Gateway TM system at ABRC
               &#091;March 23, 2004&#093;
<dd>ABRC is now able to distribute clones generated using Invitrogen's GatewayTM system. If you have generated materials using this system we are now accepting donations. We have already received a number of full length cDNA clones in a GatewayTM entry vector and these may be ordered through TAIR.



<dt>
<a href="/tools/bulk/sequences/index.jsp">Bulk Sequence Download and Analysis Tool updated</A>
               &#091;March 30, 2004&#093;
<dd>Download sequences or
send FASTA formatted sequences to ClustalW server at the European Bioinformatics Institute (EBI) for generating multiple
sequence alignments.



<dt>
Wisconsin Ds-Lox T-DNA lines
               &#091;March 23, 2004&#093;
<dd>The Arabidopsis Knockout Facility at the University of Wisconsin-Madison
is pleased to announce the availability of T-DNA lines containing Ds-Lox
launching pads.  Funded by NSF 2010 grant MCB-0116945 (M. Sussman, R.
Amasino, PIs), this new population was created by using a T-DNA vector
that carries a Ds transposon launch-pad and Cre/Lox recombination sites.
These features can be used to delete tandemly duplicated gene families
(ca. 1/6 of the A. thaliana genome) or to generate insertional mutations
in flanking loci.

Sequence tags from the initial installment of ca. 7,000 lines have been
registered with the <a href="http://signal.salk.edu/cgi-bin/tdnaexpress">SIGnAL T-DNA mapping utility</a> maintained by Joe Ecker's
group at The Salk Institute.
This data will also be incorporated into the TAIR database in the near
future.  A more detailed description of the lines and instructions for
obtaining seeds are available at <a href="http://www.hort.wisc.edu/krysan/DS-Lox/">http://www.hort.wisc.edu/krysan/DS-Lox/</a>.
The seeds are being distributed free of charge to academic scientists and
are not subject to any material transfer agreement.

<dt>
<a name="orf">ORF Clones</A>
               &#091;March 8, 2004&#093;
<dd>A collection of cDNA clones containing the precise open-reading-frame (ORF) regions for 1282 Arabidopsis transcription factor genes is being donated to ABRC. All of these ORF clones are individually cloned into the Gateway. entry vector, and the ORF inserts can be readily transferred into other compatible Gateway destination vectors. The investigators donating this collection are:Xi-Ping Wang, Yi Li, Hong-Ya Gu, Li-Jia Qu, Shu-Nong Bai, Ying-Tang Lu, Jia-Yang Li, Jin-Dong Zhao, Jianru Zuo, Hai Huang, and Yu-Xian Zhu, from China, whose affiliations (for details, see below*) include the Peking-Yale joint center of Plant Molecular genetics and Agrobiotechnology , and Xing Wang Deng, S.P. Dinesh-Kumar, and Michael Snyder of Yale University. This Arabidopsis transcription factor proteome effort was supported by the China National Natural Science Foundation.  These clones will be available by May 2004.<BR>
*Affiliations:  Peking-Yale Joint Center for Plant Molecular Genetics and Agribiotechnology, College of Life Sciences, and the National Laboratory of Protein Engineering and Plant Genetic Engineering, Peking University, Beijng 100871 (Y.L., H.-Y.G., L.-J.Q., S.-N.B., J-D.Z., Y.-X.Z.); Institute of Genetics and Developmental Biology Chinese Academy of Sciences, Datun Road Beijing 100101 (J.-R.Z., J.-Y.L.); State Key Laboratory of Genetic Engineering, Department of Biochemistry, School of Life Sciences, Fudan University, Shanghai 200433 (X.-P.W.); Key Lab. of MOE for Plant Developmental Biology, College of Life Sciences, Wuhan University, Wuhan 430072 (Y.-T.L.); School of life Science and Biotechnology, Shanghai Jiao Tong University, 800 Dongchuan Road, Shanghai 200240 (D.-B.Z.); Shanghai Institute of Plant Physiology and Ecology 300 Fenglin Road, Shanghai 200032, China (H.H.).

<dt>
<a name="tigr_5">TIGR 5 Genome Release</A>
               &#091;March 2, 2004&#093;
<dd>TIGR's final genome release, version 5.0, has been integrated into the
TAIR Database, SeqViewer, MapViewer and sequence analysis datasets.  TIGR 5.0
contains 26,207 protein coding genes, 709 RNA coding genes (tRNAs, rRNAs,
snoRNAs and snRNAs) and 3786 pseudogenes (including some transposon genes
that were counted as protein-coding in previous releases).  Nearly 15,000
genes now have full length cDNAs, over 18,000 have 5' UTRs and/or 3' UTRs
and over 2000 genes have alternate splicing.  Future updates to the genome
will be carried out by TAIR.



<dt>
<a href="/news/job_postings/metacyc_curator_ad2004.txt">TAIR Curator Position</A>
               &#091;February 17, 2004&#093;
<dd>Full time metacyc curator position at TAIR available March 1, 2004.

<dt>
    <a href="/news/monthly/TAIR_News_Jan04.jsp">TAIR December 2003/January 2004 News Release</a>
&#091;February 9, 2004&#093;
<dd>Find out new or updated data and software made to TAIR in December 2003 and January 2004.
<dt><a name=sail></a>
   <a href="/abrc/sail.jsp">SAIL Lines at ABRC</a>
&#091;January 27, 2004&#093;
<dd>ABRC is pleased to announce that approximately 50,000 lines from the 
Syngenta Arabidopsis Insertion Library (SAIL) collection will be 
received and distributed.  This important collection has been 
generously donated by Syngenta Biotechnology, Inc. completely free of 
any restrictions on distribution.  The flank sequences of these lines 
will be included in the public databases including TAIR, SIGnAL and 
GenBank.  It is expected that this donation will be received in early 
2004, and the planned release for distribution is May, 2004.

SAIL is an insertion collection which was generated from 
approximately 100,000 individual T-DNA mutagenized Arabidopsis plants 
(Columbia ecotype). A modified approach to Thermal Asymmetric 
Interlaced-Polymerase Chain Reaction (TAIL-PCR) was adopted to 
identify left border flanking sequences for these plants. The average 
number of T-DNA insertions per line is 1.5 to 2.0.  The typical TAIL 
PCR border sequence from each plant is over 300 nucleotides in length 
and often contains sequence from two separate TAIL products.

All of the lines of the SAIL collection which have sequence that can 
be aligned with the AGI genomic sequence and are not restricted by 
prior MTA will be included in the ABRC collection.



<dt>
   Update Publications in your Community Record
&#091;January 5, 2004&#093;
<dd>Now you can add or delete publications in your community record. Search for the publication in TAIR and modify your profile.  <a href="/help/helppages/addpub.jsp">Help with adding/deleting publications</a>.




<dt>
    <a href="/news/monthly/TAIR_News_Nov03.jsp">TAIR October/November News Release</a>
&#091;December 2, 2003&#093;
<dd>Find out new or updated data and software made to TAIR in October and November 2003.



<dt>
    <a href="/submit/microarray.submission.jsp">Microarray Experiment Submission</a>
&#091;November 18, 2003&#093;
<dd>TAIR is now accepting Arabidopsis microarray data from users.



<dt>
    <a href="/servlets/Search?action=new_search&type=gene">Updated Gene Search</a>
&#091;November 18, 2003&#093;
<dd>Now includes additional search parameters including associated literature,
cDNA or EST, and gene model type.



<dt>
<a href="/jsp/search/expression_form.jsp">Microarray Expression Search</a>
&#091;November 5, 2003&#093;
<dd>Expression values from AFGC microarray experiments have been integrated into TAIR database and are now available for search.



<dt>
    <a href="/tools/bulk/protein/index.jsp">Updated Protein Bulk Download</a>
&#091;October 28, 2003&#093;
<dd>Now includes SCOP's structural class prediction.



<dt>
    <a href="/news/rice_news_Oct2003.jsp">Help out the Rice Resource Center</a>
&#091;October 14, 2003&#093;
<dd>Help determine how the Rice genome center will look and work by filling out the <a href="http://www.tigr.org/tdb/e2k1/osa1/rice.survey.shtml">Rice survey form</a>.



<dt>
    <a href="/news/monthly/TAIR_News_Sept03.jsp">TAIR September News Release</a>
&#091;October 8, 2003&#093;
<dd>Find out new or updated data and software made to TAIR in September 2003.



<dt>
<a href="/servlets/Order?state=catalog&category=mutant_seed&pageNum=1">ABRC Stock Images</a>
&#091;October 2, 2003&#093;
<dd>Stock images now available for many seed stocks. Links from germplasm results, germplasm detail, and catalog pages are available.



<dt>
<a href="/tools/bulk/go/index.jsp">Functional Catorization using GO</a>
&#091;October 2, 2003&#093;
<dd>Categorize genes into broad functional categories based on the high level terms in Gene Ontology hierarchy.



<dt>
<a href="/servlets/Search?action=new_search&type=protein">Updated Protein Search</a>
&#091;October 2, 2003&#093;
<dd>SCOP's structural class information has been incorporated to the protein
data and is now available as a search parameter. We are grateful to Julian
Gough and Martin Madera for providing the SCOP annotation.





<dt>
Website Conversion
&#091;September 24, 2003&#093;
<dd>Most of TAIR website has been converted from html to jsp pages. Your bookmarked html pages will be temporarily redirected to the new pages- PLEASE UPDATE YOUR BOOKMARKS. The conversion has been done in order to add new functionalities to the TAIR site. Please let us know if you encounter any problems such as missing pages.




<dt>
<a href="/servlets/Order?state=catalog">ABRC Catalog Browser</a>
&#091;September 24, 2003&#093;
<dd>View stock details and place orders directly from lists of seed and DNA stocks. Sections currently available include Mutants, Natural Accessions, Other Species, Genomic and cDNA Libraries, and Full Length cDNA clones.




<dt>
2004 Arabidopsis Conference
&#091;September 12, 2003&#093;
<dd>The website for the 15th International Conference on Arabidopsis Research, July 11-14 in Berlin is now available.





<dt>
    <a href="/news/monthly/TAIR_News_JulyAug2003.jsp">TAIR July/August News Release</a>
               &#091;September 9, 2003&#093;
<dd>Find out new or updated data and software made to TAIR in July and August 2003.




<dt>
<a href="/jsp/search/keyword_form.jsp">Keyword Browser</a>
&#091;September 2, 2003&#093;
<dd>Search and browse for a term to view term details, relationships among terms, links to genes, publications, microarray experiments and annotations.




<dt>
<a href="/tools/bulk/microarray/index.jsp">Microarray Expression Viewer</a>
&#091;September 2, 2003&#093;
<dd>Expression viewer data is updated and the experiment names are now linked to the experiment detail page.




<dt>
<a href="/servlets/Search?action=new_search&type=publication">Publication search using keyword</a>
               &#091;August 11, 2003&#093;
<dd>Search with keyword, including the Gene Ontology (GO) terms and TAIR's
developmental stage and anatomy terms, and find publications associated to
the term and view the functional annotations done based on the
publication.



<dt>
<a href="/tools/aracyc/javacyc">JavaCyc interface is the Java equivalent of PerlCyc.</A>
               &#091;August 11, 2003&#093;
 <dd>Allows access of internal Pathway Tools functions from Java.



<dt>
<a href="/tools/bulk/locushistory/index.jsp">Updated Locus History</a>
               &#091;July 15, 2003&#093;
<dd>Now includes dates from MIPS.



<dt>
<a href="/news/job_postings/tairjob062503.jsp">TAIR Job Positions</A>
               &#091;July 25, 2003&#093;
<dd>Full time curator and full time Java developer positions at TAIR.



<dt>
    <a href="/news/monthly/TAIR_News_June.jsp">TAIR June News Release</a>
               &#091;July 15, 2003&#093;
<dd>Find out new or updated data and software made to TAIR in June 2003.



<dt>
    <a href="/news/job_postings/tairjob062503.jsp">New Positions at TAIR</a>
               &#091;June 26, 2003&#093;
<dd>The Arabidopsis Information Resource (TAIR) is seeking a full time Java Developer and a full time curator.



<dt>
    <a href="/news/monthly/TAIR_News_May.jsp">TAIR May News Release</a>
               &#091;June 18, 2003&#093;
<dd>Find out new or updated data and software made to TAIR in May 2003.



<dt>
<a href="/tools/bulk/microarray/analysis/index.jsp">Microarray Analysis</A>
               &#091;June 18, 2003&#093;
<dd>Get a global view of gene expression in Arabidopsis using microarray data and tools from TAIR. Includes a compendium of the AFGC data across 397 experiments and VxInsight and Java TreeView software.

 

<dt>
<a href="/servlets/Search?type=expr&search_action=new_search">Microarray Experiment Search Now Available</A>
               &#091;June 18, 2003&#093;
<dd>Search microarray experiments by name, experimenter, description and
keyword and download the results for analysis.



<dt>
    <a href="/servlets/Search?type=expr&search_action=new_search">Microarray Experiment Search Now Available</a>
               &#091;June 18, 2003&#093;
<dd>Search microarray experiments by name, experimenter, description and
keyword and download the results for analysis.



<dt>
    <a href="/jsp/processor/genesymbol/symbol_main.jsp">Gene Class Symbol Registration</a>
               &#091;June 17, 2003&#093;
<dd>David Meinke's Gene Class Symbol Registration is now integrated into 
TAIR. Register you new Gene Class Symbols here.



<dt>
    TIGR's 4.0 Genome Release
               &#091;June 11, 2003&#093;
<dd>TIGR's 4.0 genome release has been integrated into TAIR. SeqViewer, MapViewer, Microarray element mapping to the genome, and sequence analysis programs and their datasets are updated. This release contains 29,388 genes including 12,736 genes supported by full length cDNAs, 2582 genes with alternatively spliced gene models, 16,707 genes with UTRs and 2081 pseudogenes.



<dt>
    <a href="/servlets/Search?type=general&action=new_search">General Keyword Search</a>
               &#091;June 11, 2003&#093;
<dd>Search for keyword to view term details and relationships among
terms; includes links to keyword browser, genes, publications and annotations associated with term or any children terms.



<dt>
    <a href="14ArabAbstract.pdf">XIV Arabidopsis Meeting Abstracts</a>
               &#091;June 2, 2003&#093;
<dd>The abstracts from 14th Arabidopsis Meeting are available and downloadable from TAIR.



<dt>
    <a href="/news/monthly/TAIR_News_Apr.jsp">TAIR April News Release</a>
               &#091;May 16, 2003&#093;
<dd>Find out new or updated data and software made to TAIR in April 2003.



<dt>
    <a href="/servlets/Search?action=new_search&type=gene">Keyword searching is live on TAIR!</a>
               &#091;May 14, 2003&#093;
<dd>You can search for genes annotated with GO terms and expression patterns using keywords.



<dt>
    <a href="/news/monthly/TAIR_News_Mar.jsp">TAIR March News Release</a>
               &#091;April 11, 2003&#093;
<dd>Find out new or updated data and software made to TAIR in March 2003.



<dt>
    <a href="/servlets/Search?action=new_search&type=protein">Protein Search</a>
               &#091;April 4, 2003&#093;
<dd>Search protein info usinig physico-chemical properties, domain info, gene
info, and map positions.





<dt>
    <a href="/news/monthly/TAIR_News_Feb.jsp">TAIR February News Release</a>
               &#091;March 11, 2003&#093;
<dd>Find out new or updated data and software made to TAIR in February 2003.



<dt>
    <a href="http://tairvm09.tacc.utexas.edu/servlets/sv/">T-DNA and transposon insertions now in SeqViewer</a>
               &#091;March 7, 2003&#093;
<dd>The new T-DNA/Tn SeqViewer band displays SALK lines and other insertions. The nucleotide position of the sequence match and a predicted insertion point can be viewed on the SeqViewer Nucleotide pages.



<dt>
    <a href="/servlets/Search?action=new_search&type=germplasm">Germplasm and</a> <a href="/servlets/Search?action=new_search&type=ecotype">Ecotype Searches</a>
               &#091;March 6, 2003&#093;
<dd>These two searches replace the existing Seed Stock Search.  Find germplasms using many name options, many different features (like mutagen, genotype, transgene construct type) and/or map location.



<dt>
    <a href="/news/job_postings/tairjobs2003.jsp">New Positions at TAIR</a>
               &#091;March 4, 2003&#093;
<dd>The Arabidopsis Information Resource (TAIR) is seeking a full time Bioinformatics Analyst and a full time assistant curator.



<dt>
    <a href="ftp://ftp.arabidopsis.org/home/tair/User_Requests">User Requests FTP Downloads</a>
               &#091;February 21, 2003&#093;
<dd>User-requested bulk files available in our FTP directory.



<dt>
    <a href="/news/monthly/TAIR_News_Jan.jsp">TAIR January News Release</a>
               &#091;February 9, 2003&#093;
<dd>Find out new or updated data and software made to TAIR in January 2003.



<dt>
    <a href="/info/expression/index.jsp">Arabidopsis Gene Expression Information</a>
               &#091;January 22&#093;
<dd>
This page presents information regarding projects and data related to Arabidopsis gene expression only.



<dt>
    <a href="http://www.uwstructuralgenomics.org/">CESG now accepting requests to solve specific Arabidopsis protein structures</a>
               &#091;January 18&#093;
<dd><img src="/images/cesg.gif">
The Center for Eukaryotic Structural Genomics (CESG) has been funded by 
the NIH for a $17 million, 4-year project to solve 3-dimensional 
structures for many of the proteins of the Arabidopsis proteome.  Please 
visit <a href="http://www.uwstructuralgenomics.org/">http://www.uwstructuralgenomics.org/</a> to learn how to submit your 
favorite protein to be solved.



<dt>
    <a href="/news/monthly/TAIR_News_Dec.jsp">TAIR December News Release</a>
               &#091;January 8, 2003&#093;
<dd>Find out new or updated data and software made to TAIR in December 2002.

<a name="abrc"> </a>

<dt>
    Additional ORFeome cDNA clones available from ABRC
               &#091;December 17, 2002&#093;
<dd>New ORFeome full length cDNA clones are being received by ABRC each 
month.  These stocks can be located and ordered through TAIR.  They 
can be recombined with complementary host vectors to allow 
utilization in a wide array of experimental applications, and the 
coding sequences have been verified.  The SSP Consortium, of which 
Joe Ecker is the PI, has already donated 6,700+ of this collection. 
ABRC expects to receive the full donation of ca. 10,500 clones within 
the next few months.  The clones are available to all users without any associated MTA.



<dt>
    14th Arabidopsis Conference
               &#091;December 3, 2002&#093;
<dd>The International Conference on Arabidopsis Research web site is now open for registration.

<a name="rafl"> </a>

<dt>
    <a href="http://www.brc.riken.go.jp/lab/epd/Eng/index.html">RAFL clones</a>
               &#091;December 3, 2002&#093;
<dd>RIKEN BRC announced that 909 RAFL clones have been deposited from RIKEN GSC and now they are searchable in the catalogue.



<dt>
    <a href="/news/monthly/TAIR_News_Nov.jsp">TAIR November News Release</a>
               &#091;December 1, 2002&#093;
<dd>Find out new or updated data and software made to TAIR in November 2002.



<dt>
    <a href="/news/monthly/TAIR_News_Oct.jsp">TAIR October News Release</a>
               &#091;November 1, 2002&#093;
<dd>Find out new or updated data and software made to TAIR in October 2002.



<dt>
    <a href="/tools/bulk/motiffinder/index.jsp">Promoter Motif Analysis</a>
               &#091;October 30, 2002&#093;
<dd>AFGC's Motif Finder gets a facelift and updated genome annotation dataset. This tool allows you to find overrepresented 6-mer oligos in upstream regions of genes.



<dt>
    Add Your Comments!
               &#091;October 30, 2002&#093;
<dd>Login and add your own comments and annotations directly to the
Gene Model, Locus and Protein detail pages.  Register, if you haven't
already, and share your data corrections, insights and concerns with the
Arabidopsis community.



<dt>
    <a href="/tools/bulk/microarray/index.jsp">Microarray Elements Search Updated</a>
               &#091;October 30, 2002&#093;
<dd>The update includes the addition of the Affymetrix 25K array and new
locus assignments and annotations for all the array elements using the latest TIGR genome version (July, 2002).



<dt>
    <a href="/tools/bulk/microarray/index.jsp">Updated Expression Viewer</a>
               &#091;October 30, 2002&#093;
<dd>Updated Expression Viewer tool for the complete AFGC dataset.



<dt>
    <a href="/servlets/Search?action=new_search&type=polyallele">Polymorphism/Allele Search</a>
               &#091;October 15, 2002&#093;
<dd>Search using polymorphism/gene/locus name, many different features (like mutagen, polymorphism type and inheritance) and/or map location. SNPs can now be found using this search page.  Link to the SeqViewer to see where the polymorphisms fall on the genome. Link to a seed stock search to see if you can order lines containing these polymorphisms. Find data submitted by the Arabidopsis Tilling Project, Salk Institute and the Stanford Genome Center among others.



<dt>
    <a href="/info/Gene_Symbols.jsp">Mutant Gene Symbol List</a>
               &#091;October 15, 2002&#093;
<dd>This is a comprehensive list of approved symbols for mutant genes, maintained by Davd Meinke, and is current as of October, 7, 2002. Refer to this list before choosing a formal name for a new mutant isolated in your lab.



<dt>
    2003 Arabidopsis Conference
               &#091;September 10, 2002&#093;
<dd>The NAASC have just announced the dates for the conference, June 20-24, 2003 in Madison, Wisconsin.  Please watch for updates and the information about registration to come on TAIR.



<dt>
    <a href="/tools/bulk/microarray/index.jsp">Microarray Elements Search</a>
               &#091;August 27, 2002&#093;
<dd>Search and download the array elements on the Affymetrix 8k and all the AFGC arrays by name, GenBank accession or AGI's locus match.



<dt>
    <a href="/tools/index.jsp">Updated and New Blast Datasets</a>
               &#091;August 21, 2002&#093;
<dd>Higher Plant sequence dataset is updated and all Brassica dataset from Genbank is added for BLAST and WU_BLAST2.



<dt>
    <a href="/servlets/Search?action=new_search&type=dna">DNA Search</a>
               &#091;August 6, 2002&#093;
<dd>Now all DNA-related objects such as clone ends, libraries, vectors, DNA stocks, pooled genomic DNA, and filters can be searched at TAIR. DNA may be searched by name, features, and/or location. Current Clone search will be replaced by DNA search soon.



<dt>
TAIR workshops at the <a href="http://www.aspb.org/meetings/pb-2002/">ASPB Meeting in Denver, CO</A>.
 &#091;August 4 & 5, 2002&#093;
<dd><IMG SRC="/images/redball.gif"><u>Workshop 1</u>:  Sunday, August 4th (afternoon, see Meeting Book for exact time and location) 
Introduction to the Arabidopsis Information Resource<br>
This workshop is targeted to the biologist who has never used or rarely uses TAIR and will give an overview of the types of data and data analysis programs available at TAIR.  Do you work in another plant system and haven't had a look at Arabidopsis? This is the workshop for you.  We'll show you how you can use the data gathered in Arabidopsis to augment what you are learning in your plant system.

<IMG SRC="/images/redball.gif"><u>Workshop 2</u>: Monday, August 5th (1-2 pm, see Meeting Book for location)
Using the Arabidopsis Information Resource for your research
<br>
This workshop is targeted to more frequent users of TAIR who would like to
take maximum advantage of the data and analysis tools on our site. Explore
our <A href="http://tairvm09.tacc.utexas.edu/servlets/sv">SeqViewer</A>, which allows you to look at genes from the chromosome level
down to the nucleotide level.  Check out <A href="/tools/aracyc/">AraCyc</A>, a new program that allows
you to look at biochemical pathways and lets you paint microarray expression data onto these processes.  Answer queries like: 'What are all the Arabidopsis proteins that have mitochondrial targeting sequences? Where do their genes map on the genome? 'What are the other common protein physical-chemical properties?' Applications for researchers working in other plant model systems will also be demonstrated.



<dt>
    <a href="/info/education.jsp">Education and Outreach</a>
               &#091;July 30, 2002&#093;
<dd>We have added a new education section to help scientists, educators and
students looking for opportunities to participate in or collaborate on
science education activities. <br>In the Education/Outreach guide, researchers
will find information about the NSF Broader Impacts Criteria and links to
activities/programs that address some of the criterion. Researchers can
also sign on to TAIR's moderated email group to act as advisors to K-16
teachers and students.


<dt>
    <a href="/tools/aracyc/">AraCyc</a>
               &#091;June 13, 2002&#093;
<dd>TAIR provides AraCyc, Arabidopsis biochemical pathways visualization and querying tool.


<dt>
    <a href="/links/education.jsp">External Links to Educational Resources</a>
               &#091;June 11, 2002&#093;
<dd>TAIR presents a new page with links to educational resources for Arabidopsis, plant biology, genomics and biotechnology that may be of interest to students and teachers looking for information as well as researchers who are seeking opportunities to participate in education/outreach programs.


<dt>
    <a href="/tools/bulk/locushistory/locushistoryhelp.jsp">Locus History Search</a>
               &#091;May 23, 2002&#093;
<dd>The locus history search displays how a locus has been modified during 
different releases of the genome. Locus names in question can be entered 
in the search page and the history of modifications is displayed. 
Detailed locus history information is available for the January 7 and 
August 10 releases. For releases prior to that summary information is 
available.



<dt>
    <a href="http://tairvm09.tacc.utexas.edu/servlets/sv">ESTs now in SeqViewer</a>
               &#091;May 20, 2002&#093;
<dd>The new Transcript band in the TAIR SeqViewer displays ESTs matched
against the chromosome sequence using SIM4, providing a quick way to
compare structural gene annotation with EST matches and find evidence for
genes not yet included in the current version of the annotated genome.



<dt>
    <a href="/links/riken.jsp">RAFL clones</a>
               &#091;May 13, 2002&#093;
<dd>RIKEN BioResource Center (BRC) is going to distribute RIKEN Arabidopsis
full-length cDNA clones. The distribution will start soon after we get
permission from Japanese government. You can submit your request before official start of the distribution for an advance application.



<dt>
    <a href="/wublast/index2.jsp">WU-BLAST2</a>
               &#091;May 7, 2002&#093;
<dd>A faster and more sensitive BLAST algorithm from Washington University is
now available for testing at TAIR. WU-BLAST2 fixes some alignment bugs in NCBI-BLAST and has a very nice summary graphic.



<dt>
    <a href="http://www.corporate-ir.net/ireye/ir_site.zhtml?ticker=AFFX&script=410&lay$t=-6&item_id=278919">Affymetrix Whole Genome Array Completed</a>
               &#091;May 7, 2002&#093;
<dd>The new Arabidopsis chip representing 24,000 genes will be available as commercial product in late summer.



<dt>
    <a href="/tools/bulk/protein/">Protein Search</a>
               &#091;Apr 1, 2002&#093;
<dd>TAIR provides the new protein search that can search proteins according to predicted protein properties.



<dt>
    <a href="/servlets/Order?state=search&mode=stock_number">Search Order History</a>
               &#091;Mar 26, 2002&#093;
<dd>You can search for general orders in Stocks section. Also you can view your own past stock orders on <a href="/servlets/Order?state=search&mode=user">Search My Stock Orders</a> page. 



<dt>
    <a href="/info/ontologies">Ontologies</a>
               &#091;Mar 1, 2002&#093;
<dd>Information on ontologies used and develped at TAIR, including Gene 
Ontology, Anatomy Ontology and Development Ontology.



<dt>
    <a href="/news/aracyc_curator2002.jsp">Curator position at TAIR</a>
               &#091;Feb 27, 2002&#093;
<dd>A full-time position of a curator to annotate metabolic pathways of plants is available at TAIR. This project is a collaboration between TAIR and SRI International, in which plant metabolic pathways will be curated into AraCyc.



<dt>
    <a href="/cgi-bin/patmatch/nph-patmatch.pl">New Patmatch</a>
               &#091;Dec 12, 2001&#093;
<dd>We are pleased to announce an overhaul of the Patmatch utility. See <a href="/newpatmatch_release.html">release notes</a> for details.


  <dt>
          <a href="/Blast/BLAST_help.jsp#datasets">New BLAST datasets</a>
                     &#091;Oct 30, 2001&#093;
      <dd>T-DNA flanking sequences and TIGR/MIPS Assembly Units for construction of chromosome sequences.



<dt>
    <a href="/news/go_curator_ad.jsp">Gene Ontology curator position at TAIR</a>
               &#091;Oct 23, 2001&#093;
<dd>A Gene Ontology curator position is available at the Arabidopsis Information Resource (TAIR) to work with members of the GO consortium to annotate Arabidopsis gene products with GO controlled vocabulary terms.



<dt>
    <a href="/submit/marker_submission.jsp">Bulk Marker Data Submission</a>
               &#091;Oct 19, 2001&#093;
<dd>For researchers who wish to contribute data for 10
or more markers we have the following instructions for sumbitting marker (e.g. CAPS, AFLPS, SSLPS) and polymorphism (e.g. SNPs, INDELS, insertions) data in bulk.



<dt>
    <a href="/search/rel_01beta.html">Updated TAIR DB Search</a>
               &#091;Oct 16, 2001&#093;
<dd>TAIR provides an updated version of TAIR database and search interfaces. This version will allow you to search the database for genes, genetic markers, clones, maps, publications, and community.



<dt>
    <a href="/about/linktotair.jsp">Hyperlinking to TAIR</a>
               &#091;Oct 9, 2001&#093;
<dd>This page provides base URLs and information about how to link to detail html pages of TAIR data.



<dt>
    <a href="/news/postdoc_ad_2001.jsp">New postdoc position at TAIR</a>
               &#091;Oct 1, 2001&#093;
<dd>A postdoc position is available immediately at the Arabidopsis Information Resource (TAIR) to develop bioinformatic methods and tools in analyzing genome-wide expression studies to understand the 'genomic' basis of cold tolerance of plants.



<dt>
    <a href="http://tairvm09.tacc.utexas.edu/servlets/sv">SeqViewer</a>
               &#091;Sep 25, 2001&#093;
<dd>TAIR's new graphic display tool for Arabidopsis sequence and annotation.
Search for names or short sequences and view search hits on the whole
genome, in a closeup view or at the nucleotide level.  The first version
displays genes, markers and clones.  Please read the <a href="/seqViewer/help/sv_rel_01beta.jsp">release notes</a> before using this tool.



<dt>
    <a href="/news/curator_ad_2001.jsp">New curator position at TAIR</a>
               &#091;Aug 31, 2001&#093;
<dd>A full-time scientific curator position is available immediately at the Arabidopsis Information Resource (TAIR).



<dt>
    <a href="ftp://ftp.arabidopsis.org/home/tair/Maps/Ler_Cvi_RIdata">LerXCvi data</a>
               &#091;Aug 21, 2001&#093;
<dd>Mapping data for the CviXLer RI lines can be found in the FTP site. The data includes maps from Alonso-Blanco et.al. (1998) and  genotypes of the 162 RI lines.



<dt>
    <a href="/servlets/Search?action=new_search&type=publication">Publication Search</a>
               &#091;July 27, 2001&#093;
<dd>TAIR DB provides the publication search. All Arabidopsis papers are searchable.



<dt>
    <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/">New Microarrays section in ftp</a>
               &#091;July 17, 2001&#093;
<dd>TAIR's FTP server provides the files with data related to the array elements used by AFGC & Affymetrix.



<dt>
    <a href="/info/2010_projects">2010 Projects</a>
               &#091;July 10, 2001&#093;
<dd>Search for who is working on which genes using functional genomics approaches in Arabidopsis. Multiple query inputs are available. Information about submitting your gene list as well as downloading the whole file is also available.



<dt>
    <a href="/search/">Register and Update TAIR Community</a>
	       &#091;June 28, 2001&#093;
<dd>Users can now update their existing personal or organization information or register as new users in TAIR database.



<dt>
    <a href="/abrc/">Order and Search Stocks from TAIR</a>
	       &#091;June 28, 2001&#093;
<dd>ABRC stock data searching and ordering transitioning from AIMS to TAIR.




<dt>
    <a href="/info/genefamily.jsp">Gene Family Information</a>
	       &#091;June 18, 2001&#093;
<dd>TAIR Gene Family Information pages have been compiled with the help
 of the gene family experts.  This site provides gene family information
in tabular format, with external links to interesting Gene Family
websites.


<dt>
    <a href="/news/Arabidopsis_XII.jsp">12th International Arabidopsis Meeting Program and Abstracts</a>
	       &#091;June 13, 2001&#093;
<dd>12th International Arabidopsis Meeting will be held June 23-27 in Madison, WI, USA. The information is available from <a href="http://www.wisc.edu/union/info/conf/arabidopsis/arabidopsis.html">University of Wisconsin's Memorial Union</a> which is responsible for the programming and the registration of this meeting. The abstracts are available at TAIR(<a href="/news/Arab_Abstracts.pdf">download</a>). Please contact <a href="mailto:arabidopsis01@union.wisc.edu">arabidopsis01@union.wisc.edu</a> for more information. 



  <dt>
      <a href="ftp://ftp.arabidopsis.org/home/tair/">FTP Site Updated</a>

       &#091;April 13, 2001&#093;
      <dd>Our reorganized FTP site includes the main directories Sequences, Genes, Maps, Software and Protocols.  Nucleotide and protein BLAST datasets can be found under Sequences, gene annotation information is in Genes, and map location information is in Maps.  New data files include BLAST results for GenBank and AFGC ESTs against the Arabidopsis genome sequence in the Genes/est_mapping/ directory and a list of gene symbols and their standard orf names (also using BLAST) in Genes/Gene_orf.032101.
        
          



      <a href="/info/agi.jsp">New Genome Update Page</a>

       &#091;March 19, 2001&#093;
      <dd>This page provides information on the remaining gaps in the Arabidopsis genome, GenBank annotation of clones, TAIR's monitoring of EST and BAC ends that do not yet match the genome sequence, and the reannotation effort. 
        
          



      <a href="/cgi-bin/geneform/geneform.pl">Gene Hunter</a>

       &#091;March 16, 2001&#093;
      <dd>This page finds information about a given Arabidopsis gene from a selectable list of Arabidopsis-related Websites and databases. The result is a concatenation of clickable Web pages from the sites searched. 
        
          



      <a href="/Blast/">New Blast Datasets</a>

       &#091;March 16, 2001&#093;
      <dd>Protein, Gene, CDS, and BAC sequence datasets from the Arabidopsis Genome Initiative (AGI) are now available, with links to TIGR and MIPS gene models for Protein, Gene and CDS, and links to GenBank for the BAC sequences. 
        
          



      <a href="/Cereon/index.jsp">Cereon SNP Update</a>

       &#091;March 14, 2001&#093;
      <dd>This third release contains 12131 polymorphisms (SNPs and INDELs) and 43 Large INDELS (>100 bp) between Columbia and Landsberg erecta ecotypes produced by Cereon Genomics. These data are available to the non-profit and academic researchers upon registration and agreement to Cereon's terms of access. The data have been kindly provided by Dr. Steve Rounsley. 
        
          



    <a href="/servlets/mapper">Updated TAIR Map Viewer</a>
	       &#091;March 12, 2001&#093;
<dd>A third version of a comprehensive map visualization and alignment tool is available.<br> This version searches aliases and displays multichromosome search hits.  Please read the <a href="/search/map_rel_01beta.html">Release Notes</a> to see all the enhanced features, fixed bugs, and what's coming soon, before using this tool.




    <a href="ftp://ftp.arabidopsis.org/home/tair/Software/">Software</a>
	       &#091;February 23, 2001&#093;
<dd>TAIR's FTP server provides Intermap software which generates probability plots and genotype displays. The program is cited in <a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=11148292&dopt=Abstract">Spiegelman et al.</a>, Plant Cell 12;2485-2498. 




    <a href="/links/plantjournals.jsp">On-line Plant Journals</a>
	       &#091;February 19, 2001&#093;
<dd>TAIR provides numerous links to the web sites of important journals for Arabidopsis researchers.




    <a href="/links/microarrays.jsp">Microarrays</a>
	       &#091;February 13, 2001&#093;
<dd>TAIR provides external links to the services and resources about Arabidopsis microarrays for genome expression analysis.




    <a href="/info/guidelines.jsp">Arabidopsis Nomenclature Guide</a>
	       &#091;February 6, 2001&#093;
<dd>TAIR suggests the guidelines for naming Arabidopsis genes, markers and stocks.



    <a href="/servlets/mapper">Updated TAIR Map Viewer</a>
	       &#091;December 21, 2000&#093;
<dd>A second version of a comprehensive map visualization and alignment tool is available. This version displays ORFs on the AGI sequence map and allows wildcard searching.  Please read the <a href="/search/map_rel_01beta.html">Release Notes</a> to see all the enhanced features, fixed bugs, and what's coming soon, before using this tool.




  <a href="/genome_release.html">Arabidopsis Genome Finished</a>
     &#091;December 14, 2000&#093;
<dd>Arabidopsis genome has been sequenced and annotated by the Arabidopsis Genome Initiative (AGI), (The Arabidopsis Genome Initiative, 2000, Nature, 408:796-815)<a href="/info/agi.jsp"> More information about the AGI and links to genome data</a>.




      <a href="/website-announce.html">New TAIR Website</a>

       &#091;November 30, 2000&#093;
      <dd>TAIR releases the new and redesigned website. 
        
          



      <a href="/Cereon/index.jsp">Cereon SNP Update</a>

       &#091;November 16, 2000&#093;
      <dd>This second release contains 4476 polymorphisms (SNPs and INDELs) and 704 Large INDELS (>100 bp) between Columbia and Landsberg erecta ecotypes produced by Cereon Genomics. These data are available to the non-profit and academic researchers upon registration and agreement to Cereon's terms of access. The data have been kindly provided by Dr. Steve Rounsley. 
        
          
    


<a href="/search">New TAIR database</a>
 &#091;August 31, 2000&#093; <BR>
<DD>A beta version of TAIR Database is now available. This first version contains data on genes, genetic markers, clones, and maps. Please read the 
<A HREF="/search/rel_01beta.html">release notes</A> before using this tool. 


<a href="servlets/mapper">TAIR Map Viewer</a>
&#091;August 31, 2000&#093;<BR> 
<DD>The first version of a comprehensive map visualization and alignment tool is available. Please read the 
<A HREF="/search/map_rel_01beta.html">release notes</A> before using this tool.




<a href="/news/tairjobs.jsp">New curator positions at TAIR</a>
  &#091;June 7, 2000&#093;
 <dd>TAIR is seeking two full-time curators to start in the fall.



<a href="/Cereon/index.jsp">Cereon SNP Collection</a>
  &#091;May 3, 2000&#093;
 <dd>Approximately 39,000 polymorphisms (SNPs and INDELs) between Columbia and Landsberg <i>erecta</i> ecotypes produced by Cereon Genomics are available to the non-profit and academic researchers upon registration and agreement to Cereon's terms of access. The data have been kindly provided by Dr. Steve Rounsley.<a href="http://www.nsf.gov/od/lpa/news/press/00/pr0039.htm"> In the News</a>
 

<a href="/about/progrept.jsp">NSF Sponsored Workshops</a>
 &#091;April 13, 2000&#093;
 <dd>Includes reports on workshops to discuss the future of plant biology in the next 10 years, sponsored by NSF and held at the Salk Institute and Carnegie Institution of Washington, Dept. Plant Biology. <a href="http://www.hhmi.org/news/chory.html">In the News</a>



<dt>
11th International Conference on Arabidopsis Research
 &#091;June 9, 2000&#093;
<dd> 
Final Program and Abstracts are available. Meeting to be held in Madison, Wisconsin, 24-28 June, 2000.



<a href="/info/dsinsertions.jsp">Table of Ds Insertions from: Parinov et al. Plant Cell 11, 2263-2270.</a> 
 &#091;April 3, 2000&#093;
<dd> 
The complete table of IMA Ds Insertions published in: <a href=" http://www.plantcell.org/cgi/content/abstract/11/12/2263">Analysis of Flanking Sequences from Dissociation Insertion Lines: A Database for Reverse Genetics in Arabidopsis (Parinov et al. Plant Cell 11, 2263-2270)</a>. This data has been generously provided to us by the American Society of Plant Physiologists and the authors. For the Ds insertions that have been located to BAC clones, TAIR has provided links to the Sequence Map from the BAC clone number. Seed for the IMA lines can be obtained from <a href="http://nasc.nott.ac.uk/">NASC</a>.



  <dt>
          Updated Sequence Map and Sequence Tables
       &#091;March 6, 2000&#093;
      <dd>
          Updated maps and tables now include orientation of most of Kazusa's sequences on chr III and chr V by blasting their untrimmed sequences, kindly provided by Drs. Yasukazu Nakamura and Satoshi Tabata. The untrimmed sequences are available from   <a href= "ftp://ftp.kazusa.or.jp/pub/arabidopsis/bulk/">their </a> and <a href= "ftp://ftp.arabidopsis.org/home/tair/Sequences/clones/kazusa_no_trim/">our </a> ftp sites.
          
          

  <dt>
      New PCR based Markers
       &#091;March 6, 2000&#093;
      <dd>
          New CAPS and SSLP markers sent to TAIR by our users (listed under Source field in the table). There are 53 new CAPS and 48 new SSLP markers.
          

<dt>
    Updated Lister & Dean RI Map
 &#091;Feb 18, 2000&#093;
<dd> 
The latest version of the RI Map from
    <a href="http://nasc.nott.ac.uk/home.html">NASC</a>
includes many of the SNPs in the TAIR SNPs Table.




<dt>
<a href="/SNPs.jsp">Updated SNPs Table</a> 
 &#091;Feb 16, 2000&#093;
<dd> 
The updated SNPs table now includes RI map positions for 236 SNPs, obtained from <a href="http://nasc.nott.ac.uk">NASC.</a> 




    Updated Sequence Map and Sequence Tables
 &#091;Dec 10, 1999&#093;
<dd> 
Updated maps and tables include SNPs that could be located with BLAST searches against the AGI dataset.



 SNPs Table
 &#091;Dec 10, 1999&#093;
<dd> 
Single Nucleotide Polymorphisms (SNPs) from Cho <i>et al.</i>, Nat Genet 1999 Oct; 23(2):203-7. The position of SNPs on AGI clones are shown for those markers that could be located. These markers were kindly provided by Dr. Michael Mindrinos, Stanford Genome Center.  



New TAIR BLAST
 &#091;Nov 1, 1999&#093;
<dd> 
TAIR's BLAST uses NCBI's BLAST2 (not WU-BLAST2). The input sequence is restricted to 7,000 characters for results returned to the browser, and to 150,000 for results returned by email.
    
  



<a href="/cgi-bin/fasta/TAIRfasta.pl">New TAIR FASTA</a>
 &#091;Nov 1, 1999&#093;
<dd> 
TAIR's FASTA uses FASTA3, FASTX3, and TFASTX3.
    



<dt>
<a href="/index.jsp">TAIR Project Replaces AtDB</a> 
 &#091;Sept 26, 1999&#093;
<dd> 

The Arabidopsis Information Resource (TAIR) is a collaborative project between the Carnegie Institution of Washington Department of Plant Biology and the National Center for Genome Resources (NCGR).


<dt>
Annoucement:11th International Conference on Arabidopsis Research<
                   &#091;Sept 26, 1999&#093;
<dd>Madison, Wisconsin, 24-28 June, 2000.


<dt>
Updated CAPS & SSLP Markers Tables
 &#091;Sept 25, 1999&#093;
<dd>The latest CAPS and SSLP markers, from Drenkard and Ausubel.





<dt>
Updated Sequence Table from AtDB (all chr) &#091;Sept 16, 1999&#093;
<dd> 

The table includes the data used to construct TAIR's Sequence Map as well as the position of simple repeats within each sequenced clone. The repeats now include AT, AG, T or A at least 30 nucleotides long, and 200 nucleotides of flanking DNA.



<dt>
New BLAST Form  &#091;July 27, 1999&#093;
<dd> 

This new form allows the BLAST output, or a URL to the output, to be
returned via email.  Plus sequences can be loaded from files on your
computer, avoiding all that pasting.  This upload feature is safe.
Only the file you select is communicated to the AtDB server.  Of
course you can still copy and paste the sequence into the form if you prefer.



<dt> Updated Lister & Dean RI Maps Now Available &#091;June 26, 1999&#093;
<dd>The latest Lister & Dean RI maps, produced by <a href="http://nasc.nott.ac.uk">NASC</a>.



<dt>
TAIR Curators Needed  &#091;July 2, 1999&#093;
<dd> TAIR is seeking two full-time database curators.  



<dt>
AtDB's Sequence Map Data  &#091;June 2, 1999&#093;
<dd> Lists of all AGI clones, their GenBank accession numbers, and sequenced markers used for AtDB's Sequence Map Display are available in FTP format. 



<dt>
Arabidopsis Chloroplast Genome  &#091;June 2, 1999&#093;
<dd>Sequence of Arabidopsis chloroplast genome, kindly provided by Takakazu Kaneko and Satoshi Tabata from Kazusa DNA Research Institute, is available in FTP format. 



AtDB's Arabidopsis Sequence Map Overview &#091;April 2, 1999&#093;
<dd>New AtDB's graphic display of the clones being sequenced by the AGI. Includes overlaps between clones, and shows RI, CAPS and SSLP markers. 



<dt>
10th International Conference on Arabidopsis Research &#091;March 15, 1999&#093; 
<dd>Melbourne, Australia, 4-8 July, 1999. 
<dd> Registration and abstract submissions open until May 24, 1999. 



 <dt><a href="http://www.pi.csiro.au/Events/Discovery/DiscoverySeminars.htm"> Satellite Meeting</a>  at Melbourne, Australia  &#091;July 2, 1999&#093;



<dt>
Updated AtDB's Arabidopsis Genome View &#091;April 2, 1999&#093;
<dd>Improved entry point for all AtDB's genetic and physical maps. Allows text search of markers, clones, or probes, and displays all maps that contain the given item.



<dt>Updated AtDB's Arabidopsis Physical Map Overview &#091;March 3, 1999&#093;
<dd>The new version includes 10,185 unique clones and 3443 unique probes. The AGI sequenced clones will be incorporated soon.




<dt>RI, CAPS and SSLP markers updated at AtDB &#091;February 1, 1999&#093;
<dd>AtDB now includes locus entries for all RI, CAPS and SSLP markers. These entries are also hot-linked from the Arabidopsis Genomic View.




</dl>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

