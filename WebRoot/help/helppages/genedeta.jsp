<html>

<head>

<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("generesu.jsp");
setNext("");
writeHeader();
</script>

<!-- End of header -->
</head>

<h2><a name="913144"> </a>The TAIR Gene Details</h2><hr>


<p><a name="447197"> </a><font class="cont">When you select a gene name on the Gene Search Results window, the Gene Detail page is displayed. This page includes specific information about the gene if interest and links to related data and detail pages from TAIR database. Essentially, this is an integrated gene-centric view, in which data associated to the gene (such as sequence, alleles, map locations, structural and functional annotations can be found). Each section of the detail page contains different types  of information.</font></p>

<h4><a name="448006"> </a>Name and name type</h4>
<p><font class="cont"> This section displays the name and type of name used as the primary name in TAIR.
    <dl>
      <dt> <a name="448057"> </a><font class="cont">This is generally the mnemonic naming used for gene names by researchers. Examples include AG (Agamous), and QRT1 (Quartet1). A symbol for a gene is designated when a gene has been published or if the name and symbol have been registered with Dr. David Meinke or TAIR.</font>

    </dl>

<a name="acc"></a><h4>TAIR accession</h4>
<p><font class="cont"> The TAIR accession uniquely identifies a record in the database and can be used to make links from external websites/databases to entries in TAIR. See <a href="/about/linktotair.jsp">Hyperlinking to TAIR</a> for more information.</font>

<h4><a name="448007"> </a> Description</h4>
<p><a name="448008"> </a><font class="cont">Description of the gene product(s). Most of this data in TAIR currently is from AtDB curation of literature information</font></p>

<h4><a name="448015"> </a>Chromosome</h4>
<p><font class="cont">The chromosome location as determined by sequence matching or genetic mapping, if known.</font>

<h4><a name="locus"></a>Locus</h4>
<p><font class="cont">This links to the locus detail page. Each gene model is associated to a locus (sequenced, genetic or QTL). The locus page provides an overview of all gene models contained within the locus, and links to additional information not found in the gene details, such as EST sequences,other markers associated with the locus, protein details and more.

<h4><a name="448011"> </a>Gene Aliases (alias and type)</h4>
<p><a name="448020"> </a><font class="cont">Synonyms for the gene. Aliases are obtained from the literature or sometimes by matching sequence records. If the name differs from what is first published the second name becomes an alias (unless all concerned parties agree to a name change).</font></p>

<h4><a name="annot"></a>Annotations</h4>
<p><font class="cont">A partial listing of the functional annotations of the gene are displayed here.These annotations consist of associations of the gene to a variety of keywords that describe the molecular function of the gene, what process(es) it is involved in and its subcellular localization. Also included are associations to terms describing where and when the gene is expressed. To view ALL annotations and detailed information including supporting evidence and references, click on the link to <a href="annotdetail.jsp">Annotation Details</a>.</font>
<h4><a name="447962"> </a>Nucleotide Sequence</h4>

<p><a name="448038"> </a><font class="cont">All nucleotide sequences associated to gene are displayed here. GenBank accessions link out to the GenBank sequence record for the gene. Available types of nucleotide sequences stored in TAIR can be accessed by clicking on the appropriate link. For example, click on cDNA to display the cDNA sequence..</font></p>


<h4><a name="448148"> </a>Associated Genetic Markers</h4>
<p><a name="448149"> </a><font class="cont">Any genetic markers associated with this gene model are displayed here. Click on the marker name to view details (such as primer sequences) for the marker.</font></p>

<h4><a name="448151"> </a>Map Links</h4>


<p><a name="448152"> </a><font class="cont">This section displays links to all maps on which the gene has been placed. MapViewer links will open a the MapViewer showing all maps on which the gene is located. SeqViewer links will display a 200kb view of the genome centered on the gene.</font></p>


<h4><a name="448018"> </a>Map Locations</h4>

<p><a name="448065"> </a><font class="cont">Details about all mapped location for the gene, including links to the TAIR Map Viewer/SeqViewer and further details.</font></p>
<h4><a name="feat"></a>Gene Features</h4>
<p><font class="cont">Structural annotation of the gene model is displayed here. All features such as introns, exons and UTR's are listed and the corresponding coordinates given.The source of the annotation detail is also indicated.</font>

<h4><a name="poly"> </a>Polymorphisms</h4>
<p><font class="cont">All polymorphisms are displayed in this section.Click on the name to veiw the detailed record for a given polymorphism.</font>

<h4><a name="comment"> </a>User omments</h4>
<p><font class="cont">This secttion displayes comments submitted to TAIR by members of the community. If you are a registered user you can add your comments to the detail page here. See <a href="addcomment.jsp">Help for Adding Comments</a> for more information.</font>
<h4><a name="attrib"> </a>Attributions</h4>
<p><font class="cont">Information about sources of data for the gene model is also displayed here. Click on the name to see the detailed record and contact information for the person/organization.</font>

<h4><a name="public"> </a>Publications</h4>
<p><font class="cont">Publications associated with the gene is diplayed here. Papers may specifically refer to the gene or may discuss homologous genes in Arabidopsis or other organisms. Click on the title to view the detailed record for the publication in TAIR. The publication record includes links to PubMed where you may be able to access the full text of the article.</font>
<!-- footer using external javascript file starts here -->
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("generesu.jsp");
setNext("");
writeFooter();
</script>
<!-- end footer -->


</body>
</html>
