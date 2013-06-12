<%@page import="org.tair.utilities.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("clonedet.jsp");
setNext("generesu.jsp");
writeHeader();
</script>

<!-- End of header -->
</head>

<h2>Contents</h2>
<ul>
<li><a href="#913144">Using the TAIR Gene Search Page</a>
<li><a href="#447938">Search by Name</a>
<li><a href="#key">Search by Keyword</a>
<li><a href="#447227">Search by Features</a>
<li><a href="#447894">Search by Location</a>
</ul>
<p>
<h2><a name="913144"> </a>Using the Gene Search</h2><hr>


<p><a name="447935"> </a><font class="cont">The TAIR Gene Search window provides three ways of searching for a gene: simple search by name only, feature search using more limits, and search by position. These are offered in three distinct sections of the window.</font></p>


<h2><a name="447938"> </a>Search by Name</h2>


<p><a name="447199"> </a><font class="cont">At the top of the TAIR Gene Search window are the Search by Name options.</font></p>


<p><a name="447201"> </a><font class="cont"><img src="images/genename.gif"></font></p>


<p><a name="447650"> </a><font class="cont">This simple search is case insensitive and allows wildcard searching (see <a href="initials.jsp#447225">"Using Wildcards"</a>).</font></p>


<h4><a name="447656"> </a> Search by Name, Description, GenBank Accession</h4>

<p><font class="cont">Use this drop down menu to search either by gene name, description or GenBank Accession.</font>
<p><a name="447667"> </a><font class="cont">In TAIR, there are four types of names associated with a Gene. Searching by name will search all gene names and gene aliases. For more information about the name types see below:</font></p>

<ul>
  <li><a name="447720"> </a><font class="cont">Symbol</font>
    <dl>
      <dt> <a name="447745"> </a><font class="cont">This is the mnemonic naming used for gene names by researchers. Examples include AG (Agamous), and QRT1 (Quartet1). A symbol for a gene is designated when a gene has been published or if the name and symbol have been registered at Oklahoma State, currently maintained by David Meinke's group or in GenBank.</font>
      <dt> <a name="447746"> </a><font class="cont">(<font  color="#0000ff" size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="http://mutant.lse.okstate.edu/genepage/genepage.html">http://mutant.lse.okstate.edu/genepage/genepage.html</a></font>).</font>
    </dl>
  <li><a name="447729"> </a><font class="cont">ORF name</font>
    <dl>
      <dt> <a name="447758"> </a><font class="cont">An open reading frame (ORF) name from the Arabidopsis Genome Initiative (AGI) groups' annotations. Usually, the convention for naming an ORF in Arabidopsis has been using the clone name followed by a number suffix (e.g., F23H14.13). For chromosome arms that have been completely sequenced, a standard ORF name designation is used:</font>
    </dl>
  <ul>
    <li><a name="447760"> </a><font class="cont">AT (Arabidopsis thaliana)</font>
    <li><a name="447761"> </a><font class="cont">2 (chromosome number)</font>
    <li><a name="447762"> </a><font class="cont">G (for Gene)</font>
    <li><a name="447763"> </a><font class="cont">01130 (Number)</font>
    <dl>
      <dt> <a name="447765"> </a><font class="cont">Examples: At2g01130, AT4g00010</font>
    </dl>
  </ul>
  <li><a name="447730"> </a><font class="cont">Full name</font>
    <dl>
      <dt> <a name="447807"> </a><font class="cont">The full descriptive name of a gene. </font>
      <dt> <a name="447808"> </a><font class="cont">Examples: Agamous, Aspartate aminotransferase deficient 3</font>
    </dl>
  <li><a name="447731"> </a><font class="cont">Gene product name</font>
    <dl>
      <dt> <a name="447818"> </a><font class="cont">Name of a gene product. </font>
      <dt> <a name="447819"> </a><font class="cont">Examples: ASPARTATE AMINOTRANSFERASE, CYTOPLASMIC ISOZYME 1, CHALCONE SYNTHASE.</font>
      <dt> <a name="447847"> </a><font class="cont">For the genes that do not have a full name or symbol (largely the predicted genes (ORFs) from AGI sequencing and annotation), the following product names have been used:</font>
    </dl>
  <ul>
    <li><a name="447849"> </a><font class="cont">Hypothetical protein</font>
    <dl>
      <dt> <a name="447850"> </a><font class="cont">Gene models without any database matches.</font>
    </dl>
    <li><a name="447852"> </a><font class="cont">Unknown protein</font>
    <dl>
      <dt> <a name="447853"> </a><font class="cont">Gene models with only EST matches.</font>
    </dl>
  </ul>
</ul>

<p><a name="447732"> </a><font class="cont">You must select one of these types and then type in the name. You can also use Genbank accession numbers in the name search but selecting "Any" name type and using the input box to insert the accession number.</font></p>
<h2><a name="key"></a>Search by Keyword</h2>
<p><font class="cont">This option allows you to search for genes by keywords.Genes are annotated with keywords describing molecular function,subcellular localization and biological process with controlled vocabularies from the <a href="http://www.geneontology.org">Gene Ontology Consortium</a>. Genes are also annotated with controlled vocabulary terms for plant structures and developmental stages for describing phenotypes and  where and when the genes are expressed. Plant structure and development terms are from the <a href="http://www.plantontology.org">Plant Ontology Consortium</a>. Each annotation is associated to an evidence code and one or more reference (the source of the evidence for the annotation). </font>
<p><img src="images/keysearch.gif">
<p><a name="key2"></a><h4>Keyword type</h4>
<p><font class="cont">The keyword types represent the categories of keywords used for annotation. You can restrict your search to include only one type of keyword or choose multiple types. To select more than one type of keyword hold down the Apple (MAC) or CTRL (PC) while clicking with the mouse. If you are not sure of which type the keyword belongs to , use the ANY option which searches all types of keywords.</font>
<p><a name="key3"></a><h4>Evidence</h4>
<p><font class="cont">Each annotation in TAIR is associated to some form of evidence that supports the annotation. The evidence can be used to filter annotations, for example, to exclude annotations based on computational methods (inferred by electronic annotation). Evidence is also used to quickly assess the quality of a given annotation. The evidence is also linked to the source of the evidence (i.e. the experimental data or analysis method).</font>
<p><a name="key3"></a><h4>Keyword Term</h4>
<p><font class="cont">This option allows you to input a given term and choose the type of search. Exact searches are most restrictive, contains searches are least restrictive but slower. If you are not sure of the format of the term, choose the 'contains' option. For example exact search for protein kinase will return results for only those terms that exactly match protein kinase, whereas a search for <u>contains</u> protein kinase will include matches to terms such as serine-threonine protein kinase AND histidine protein kinase.You can also limit the search to keywords that start with or end with a given term.</font>
<h2><a name="447227"> </a>Restrict by Features</h2>


<p><a name="447232"> </a><font class="cont">The Restrict by Features options are below the Search by Name options on the TAIR Gene Search window.</font></p>

<p><a name="447249"> </a><font class="cont">These options let you restrict your search by selecting one or more features or a time restriction. Selecting multiple attributes indicates an "AND" relationship. For example, checking "has full length cDNA" and "is on a map" limits the query set to genes that have a ful-length cDNA and are on a map </font></p>

<p><a name="447240"> </a><font class="cont"><img src="images/genefeat.gif"></font></p>
<h4><a name"modtype"></a>Gene Model Type</h4>
<p><font class="cont">This feature allows you to restrict your search to specific types of gene models <%=DefinitionsLookup.createPopupLink("GeneModelType","gene_model_type")%>.The default search returns any gene model type. To select mutiple gene model types after your first  selection  click on additional ones while holding down either the CTRL key (PCs) or the Apple key (Mac). 
<p>

<h4> <a name="pred1"> </a>Gene Structure Predicted</h4>
<p>
<a name="pred2"> </a><font class="cont">This restricts your search to only include genes whose structures have not been experimentally determined (e.g. by sequencing a cDNA).</font>
<p>
<h4><a name="lit"></a>has associated literature</h4>
<font class="cont">Checking this box will limit your search to include only genes with associated publications.</font>
<p>
<h4> <a name="seq1"> </a>Is sequenced/Is not sequenced</h4>
<p>
<a name="seq2"> </a><font class="cont">This option allows to to choose only genes which have been sequenced, or genes which are represented only as genetic loci (e.g. have not been cloned or associated with a sequence yet).</font>
<p>
<h4><a name="est"></a>has cDNA or EST</h4>
<p>
<font class="cont">Clicking this option restricts your search to include only those genes which have an associated cDNA or EST sequence.</font
<p>
<h4> <a name="fulla"> </a>Has full length cDNA </h4>
<p>
<a name=fullb""> </a><font class="cont">This option restricts your search to include only genes which have a full length cDNA sequence (e.g. contains the entire coding sequence).</font>
<p>
<h4> <a name="gen1"> </a>Is a genetic marker</h4>
<p>
<a name="gen2"> </a><font class="cont">This option restricts your search to include only genes which have been used as markers for genetic mapping experiments.</font>
<p>
<h4> <a name="map"> </a>Is on a map</h4>
<p>
<a name="map2"> </a><font class="cont">This option restricts your search to include only genes that have been located on a map.</font>

<p><a name="time"></a><h4>Time restriction</h4>
<p><font class="cont">You can limit your search to genes which have been added or updated with in a specified time period.This is useful for quickly finding newly entered genes or checking to see if a gene  of interest has been updated recently.</font>
<h2><a name="447894"> </a>Restrict by Map Location</h2>


<p><a name="447508"> </a><font class="cont">The bottom section of the window lets you restrict your search by location.</font></p>


<p><a name="447595"> </a><font class="cont"><img src="images/genepos.gif"></font></p>


<p><a name="447582"> </a><font class="cont">The options in this section let you use three parameters to restrict your search: Chromosome, Map Type, and Range.</font></p>


<h4><a name="447975"> </a>Chromosome</h4>


<p><a name="447976"> </a><font class="cont">Lets you limit your search to a single chromosome. There are five nuclear chromosomes in <em>Arabidopsis</em>: 1, 2, 3, 4, and 5 and also the mitochondrial and chloroplast genomes.</font></p>


<h4><a name="447600"> </a>Map Type</h4>


<p><a name="447509"> </a><font class="cont">Lets you search entities by their position on a particular map and is to be used with the Range parameters. Currently, you can search on only one map type at a time. To search on multiple map types, use the <font  color="#0000ff" size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="/servlets/mapper">TAIR Map Viewer</a></font>To search and browse the genome down to the nucleotide level, use the<font color="#0000ff" size="2" face="Verdana, Arial, Helvetica, sans-serif"> <a href="http://tairvm09.tacc.utexas.edu/servlets/sv">TAIR SeqViewer.</a></font></p>


<h4><a name="447520"> </a>Range</h4>


<p><a name="447525"> </a><font class="cont">Lets you specify a range search by the upper and lower bounds (when you select "Between") or a center point (when you select "Around"). The value is interpreted based on the selected range units. You can specify the range by genetic distance (cM), physical distance (kb), and by clone or by marker or gene names. When you select "<strong>Between</strong>" from the drop-down menu, your search will be within the range defined by two entities or positions on a particular map. When you select "<strong>Around</strong>" from the drop-down menu, your search will be the area +/-5 cM and/or +/- 150 kb from the specified entity or position. When you search <strong>around</strong>, the second value input and units options are disabled.</font></p>

<h2><a name="447661"> </a>Output Options</h2>
<p><a name="out1"> </a><font class="cont">You can choose the following options for displaying your results.</font></p>
<p><a name="out2"> </a><font class="cont"><img src="images/geneout.gif"></font></p>

<p>

<h4><a name="records"></a>Number of records/page</h4>
<a name="447570"> </a><font class="cont">You can select to display 25, 50,100 or 200 gene result items on a single page. More results per page will take longer to load.</font>
</p>

<h4><a name="sort"></a>Sort records by</h4>
 
<a name="sortdef"> </a><font class="cont">You can choose to sort by gene name or map location. If you choose the location option but do not select a specific chromosome, the results will be ordered by map type, chromosome and position. The default map for position is the AGI map.</font>

</p>

<!-- footer using external javascript file starts here -->
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("clonedet.jsp");
setNext("generesu.jsp");
writeFooter();
</script>
<!-- end footer -->


</body>
</html>
