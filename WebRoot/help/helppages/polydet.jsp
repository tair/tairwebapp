<html>
<head>
<title>TAIR Help: Polymorphism/Allele Details</title>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("polyser.jsp");
setNext("publicsearch.jsp");
writeHeader();
</script>
<title>Help: Polymorphism/Allele Detail Page</title>
</head>
<!-- End of header -->

<a name="intro"></a><h2>Understanding the Polymorphism/Allele Detail Page</h2>

<p>
 <font class ="cont">When you select a polymorphism name on the Polymorphism/Allele Search Results window, the Polymorphism Details appear. Each type of polymorphism detail page displays a common set of information as well as specific information pertaining to the type. For an explanation of polymorphism types <a href="polyser.jsp#P.type">click here</a>. The following section explains the fields displayed for various polymorphisms. For examples of specific detail pages choose from the following list of sample detail pages.</font>
</p>
<h4><a name="examples"></a>Specific Polymorphism Detail Pages</h4>
<ul>
<li><a href="#ins">Insertion</a>
<li><a href="#dele">Deletion</a>
<li><a href="#sub">Substitution</a>
<li><a href="#com">Compound</a>
<li><a href="#visi">Visible</a>
<li><a href="#digest">Digest Pattern</a>
<li><a href="#PCR">PCR fragment length</a>
</ul>
 <h2><a name="polydet1"></a><u>Polymorphism Details</u></h2>
<p>
<a name="polydet2"></a><font class="cont">The following fields may be found on  polymorphism detail pages. If a given field is not displayed on the detail page, it is either not relevant to the particular type of polymorphism OR the data/information is not available or known.</font>
</p>

<p>
<a name="polydet3"></a><h4>Date last modified</h4>
<p>
<a name="polydet4"></a><font class="cont">The date the  record was last updated.</font>
</p>
<p>
<a name="polydet5"></a><h4>TAIR Accession Number</h4>
<p>
 <a name="polydet6"></a><font class="cont">The unique database identifier for this entry.The format is Polymorphism:accession number. You can use this identifier to make links to a specific detail page, see <a href="/about/linktotair.jsp">Hyperlinking to TAIR.</a></font>
</p>
 
<a name="polydet7"></a><h4>Polymorphism Name</h4>
<p>
<a name="polydet8"></a><font class="cont">The name of the polymorphism.</font>
</p>

<a name="polydet9"></a><h4>Aliases</h4>
<p>
<a name="polydet10"></a><font class="cont">Synonyms for the polymorphism name.</font>
</p>

<a name="polydet11"></a><h4>Type</h4>
<p>
<a name="polydet12"></a><font class="cont">The type of polymorphism.  In TAIR, a polymorphism is defined as any genetic variation between two ecotypes or within one ecotype that can be assessed experimentally by sequencing, PCR amplification, restriction digest analysis or phenotypic inspection.   </font>
</p>

<a name="polydet13"></a><h4>Chromosome</h4>
<p>
 <a name="polydet14"></a><font class="cont">The chromosome on which the polymorphism is located.</font>
</p>
<p>
<a name="polydet17"></a><h4>Locus</h4>
<p>
<a name="polydet18"></a><font class="cont">If the polymorphism has been mapped to a locus using its flanking sequences, the locus name will appear in this column. Clicking on the hyperlink will take you to a locus detail page that summarizes all relevant sequence, reference information.</font>
</p>
<p>
<a name="polydet19"></a><h4>Is Allele</h4>
<p>
 <a name="polydet20"></a><font class="cont">Tells you whether or not this polymorphism is an allele. If this field is not displayed either this attribute is not relevant or the information is not known.</font>
</p>
<p>
<a name="polydet25"></a><h4>Gene Models</h4>
<p>
<a name="polydet26"></a><font class="cont">Gives you all of the gene models that are associated to
the locus that this polymorphism has been mapped to.  The band also gives you a short description for each gene model, if it is available, as well as the location of the polymorphism within the gene model.  Clicking on the hyperlinks will take you to the individual gene detail pages. If polymorphism lies within a gene sequence feature (e.g. intron, exon, 5' UTR) the information is displayed here.</font>
</p>
<p>
<a name="polydet15"></a><h4>Polymorphism site</h4>
<p>
<a name="polydet16"></a><font class="cont">For polymorphisms that lie between loci this field indicates if the variation occurs in an intragenic region. For polymorphisms that are located within a locus, the mutation site within the gene is noted in the section for associated gene models.</font>
</p>
<p>
<a name="polydet45"></a><h4>Mutagen</h4>
<p>
<a name="polydet46"></a><font class="cont">This field displays information about the mutagen that caused the variation or polymorphism. For natural variations that result in a polymorphism, this field is generally not displayed. Most often it describes induced mutations that result from some treatment.</font>
</p>
<p>
<a name="polydet21"></a><h4>Description</h4>
<p>
<a name="polydet22"></a><font class="cont">Gives a more detailed description or additional information about the polymorphism, if this is available. </font>
</p>
<p>
<a name="polydet27"></a><h4>Associated Polymorphisms</h4>
<p>
<a name="polydet28"></a><font class="cont">For each polymorphism, this band displays the details about the sequence variation and other detectable variations of the polymorphism. For example, a sequence variation such as a SNP may also result in a digest pattern variation which is also displayed in this band.</font>
</p>
<p>
<a name="polydet29"></a><h4>Associated Nucleotide Sequences</h4>
<p>
<a name="polydet30"></a><font class="cont">This field displays sequences such as PCR primers, probes and flanking sequences. For substitutions, deletions and insertions, the flanking sequences generally 20 bases 5' and 20 bases 3' of the polymorphism. The flanking sequences DO NOT include the polymorphic sequences themselves. For insertions of foreign DNA (T-DNA, transposons, etc...) the flanking sequences represent the plant genomic DNA that flanks the inserted DNA.</font>
</p>
<p>
<a name="polydet39"></a><h4>Genetic Marker</h4>
<p>
<a name="polydet40"></a><font class="cont">For polymorphisms that are detected using a genetic marker, clicking on the marker name opens a detail page for that marker. Clicking on the mapviewer link will take you to the TAIR MapViewer which will display the position of the genetic marker on any map where it is located.</font>
</p>
<p>
<a name="polydet31"></a><h4>External Links</h4>
<p>
<a name="polydet32"></a><font class="cont">This band provides links to external web resources that are related to the polymorphism, such as tools to generate markers from sequence variations.</font>
</p>
<p>
<a name="polydet33"></a><h4>Related Germplasm(s)</h4>
<p>
<a name="polydet34"></a><font class="cont">Clicking on this link will launch a search of all ABRC seed stocks that contain a given polymorphism. You can use this to identify seed stocks containing a particular T-DNA insertion or mutant allele of a gene. If the stock is available from the ABRC you can place an order directly from the stock detail page.</font>
</p>
<p>
<a name="polydet25"></a><h4>Annotations</h4>
<p>
<a name="polydet36"></a><font class="cont">This field displays any annotations/comments made by researchers or curators that are related to the polymorphism.</font>
</p>
<p>
<a name="polydet37"></a><h4>Map Links</h4>
<p>
<a name="polydet38"></a><font class="cont">This hyperlink opens a new window with the TAIR tool SeqViewer.  The tool allows you to visualize the position of the polymorphism in the context of the chromosome.  Your selection will appear highlighted in yellow.  Open a 10 kb sequence window to see the nucleotide view of the exact polymorphism position.</font>
</p>

<p>
<a name="polydet41"></a><h4>Map Locations</h4>
<p>
<a name="polydet42"></a><font class="cont">This field displays information about the location of the polymorphism on a map. Clicking on the map name will take you to a detail page describing the map.</font>
</p>
<p>
<a name="polydet43"></a><h4>Attribution</h4>
<p>
<a name="polydet44"></a><font class="cont">This field displays information about the source of the polymorphism related data. For example, it may identify the submitter of the original data, or the supplier of supplementary data. The name of the person or organization is hyperlinked to their community detail page. You can click on this link to obtain contact information for that person or organization. </font>
</p>
<p>
<a name="polydet46"></a><h4>Communication</h4>
<p>
<a name="polydet47"></a><font class="cont">This field displays links to information submitted as a personal communication (e.g. non-published data) that is related to the polymorphism. For polymorphisms being generated as part of a research project such as the TILLing or SALK T-DNA lines, this links to a detail page describing the project.</font>
</p>
<p>
<a name="polydet48"></a><h4>Publication</h4>
<p>
<a name="polydet49"></a><font class="cont">This field displays a list of publications associated with the polymorphism such as papers describing a mutant allele or ecotype specific sequence variations. Clicking on the title of the publication will take you do a detail page for that publication.</font>
</p>


<p>
<a name="example2"></a><h2>Specific Example Pages</h2><br>
<br><a name="ins"></a><h4>Insertion</h4><font class="cont">back to <a href="#polydet1">top</a><br><img src="images/ins1.gif">
<br><a name="dele"></a><h4>Deletion</h4>back to <a href="#polydet1">top</a><br><img src="images/dele.gif">
<br><a name="sub"></a><h4>Substitution</h4>back to <a href="#polydet1">top</a><br><img src="images/substitution.gif">
<br><a name="com"></a><h4>Compound</h4>back to <a href="#polydet1">top</a><br><img src="images/comp.gif">
<br><a name="visi"></a><h4>Visible</h4> back to <a href="#polydet1">top</a><br><img src="images/viz.gif">
<br><a name ="digest"></a><h4>Digest Pattern</h4>back to <a href="#polydet1">top</a><br><img src="images/digpat.gif">
<br><a name="PCR"><h4>PCR fragment length</h4>back to <a href="#polydet1">top</a><br><img src="images/pcrprod.gif">







<!-- footer using external javascript file starts here -->
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("polyser.jsp");
setNext("publicsearch.jsp");
writeFooter();
</script>
<!-- end footer -->
</body>
</html>

</body>
</html>


