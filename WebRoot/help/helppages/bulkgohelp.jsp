<%@page import="org.tair.utilities.*"%>
<html>
<head>
<title>TAIR Help:Bulk GO Annotation Retrieval</title>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("");
setNext("annotdetail.jsp");
writeHeader();
</script>

<!-- End of header -->
</head>

<body>
<br>
<table width ="602"><tr><td>
<ul><b>Contents</b>
<li><a href="#bulkgo1">Using the bulk GO annotation retrieval tool.</a>
<li><a href="#bulkgo2">Input file formats.</a>
<li><a href="#bulkgo3">Output options.</a>
<li><a href="#bulkgo8">Generating a whole genome annotation list.</a>
<li><a href="#bulkgo4">Understanding the bulk GO annotation Download results set.</a>
<li><a href="#bulkgo5">Understanding and using the GO Slim/Functional Classification function</a></li>
<li><a href="#bulkgo6">Sorting the Functional Categorization Results</a></li>
<li><a href="#bulkgo7">Generating a graph of a GO slim/Functional Classification set</a></li>
</ul>

<h2><a name="bulkgo1"> </a>Using the bulk GO annotation retrieval tool</h2>

<font class ="cont"><a name="bulkgo1">This tool is used to obtain a list of all GO annotations for a given set of genes using the locus identifiers. The results can be displayed as web page or as a text which can be downloaded onto a personal computer. To obtain sets of genes using a specific GO term, use the  <a href="/servlets/Search?action=new_search&type=gene">Gene Search</a> or search <a href="/servlets/Search?type=general&action=new_search"> Keywords</a>. If you want to find genes from other organisms using GO terms, use the <a href="http://www.godatabase.org/cgi-bin/go.cgi"> Amigo Browser</a> to search the <a href="http://www.geneontology.org">Gene Ontology Consortium</a> database</font>

<h2><a name="bulkgo2">Input File formats.</a></h2>
<font class="cont">This search utilizes the AGI locus identifier to specify which annotations to retrieve. YOU MUST enter at least one locus id. The general format for a locus identifier is At1g01030.The identifiers have to be separated by tabs (e.g. At1g01030&nbsp;&nbsp;&nbsp;At1g01040&nbsp;&nbsp;&nbsp;At1g01050), commas (e.g. At1g01030,At1g01040,At1g01050), spaces (e.g. At1g01030 At1g01040 At1g01050) or carriage returns (e.g.<br>
At1g01030<br>
At1g01040<br>
At1g01050).</font>
<p>
<h4><a name=""></a>Typing or pasting in a list of locus identifiers</h4>
<p><a name=""></a><font class="cont">The simplest way to specify which loci you wish to obtain annotations for is to type or paste in the name(s) of the loci into the text input box. The identifiers must be in the format specified above.</font>
<a name=""></a><h4>Uploading a list of locus identifiers from your computer</h4>
<p><a name=""></a><font class="cont">Provided your list of identifiers is in one of the formats specified above, you can upload this list from your computer. If you know the exact path to the file on your computer, type it in to the "Upload file" input box. Alternatively, click on the browse button to browse through the files on your computer. Once you have identified the correct file, click 'Open' and the file path will appear in the file input box. <font color="red">NOTE:</font>Excel formatted files will NOT work. Files must be text only format. Word or Excel files  must be saved as text-only format.</font>
<p>
<h2><a name="bulkgo3">Output options </a></h2>
<font class="cont"><a name=""></a>You can choose to have the results returned to you as a web page (HTML) that includes hyperlinks to detailed information from TAIR and the GO or as a text file which you can then save to your home computer.</font>
</p>
<p>
<h2><a name="bulkgo8"></a>Generating a whole genome annotation set.</h2>
<font class="cont">The Whole Genome Categorization function can be used to visualize the status of GO functional annotation of the Arabidopsis genome and to retrieve lists of genes according to these broad categories. Clicking the "Whole Genome Categorization" button will retrieve the GO Slim categories for the entire Arabidopsis genome. The results can be <a href="#bulkgo6">resorted</a> and  displayed as a <a href="#bulkgo7">pie chart</a> showing the distribution of either annotations or genes. The values will change from week to week as the annotation data in TAIR is constantly updated.</font>
</p>
<h2><a name="bulkgo4"> Understanding the results set</a></h2>
<p><font class="cont"> Choosing either the text or HTML option will return a list containing the following fields. The HTML (web page) includes hyperlinks to additional web pages that may be useful in analyzing and interpreting the results.</font>
<ul>
<li><b>Locus</b><%=DefinitionsLookup.createPopupLink("Locus","class")%>: Each gene model is associated to a locus. The locus name is hyperlinked to the TAIR locus detail page. Use this link to find other gene models associated to the locus such as ESTs, sequences, map locations, polymorphisms,clones and other associated data.
<li><b>Gene Models</b><%=DefinitionsLookup.createPopupLink("Gene","class")%>: This section list the names of all gene models associated to the locus. GO annotations are made to the gene model and any gene model can have potentially different annotations. For example, a locus may have two splice variants. One variant contains a DNA binding domain and the other does not. The GO term: DNA binding activity would then be associated to ONLY the variant that contains the domain. Depending upon the supporting evidence, a gene model can have more than one annotation for each aspect of the GO ontologies. That is, an experiment may indicate that a protein has DNA binding activity and a separate experiment shows the same protein is a transcriptional activator- therefore the protein will be annotated to both DNA binding activity AND transcription factor activity.
<li><b>GO id</b>: Each GO term has a unique identifier used by all member groups. GO ids may become obsolete if a terms definition changes substantially or if the term is no longer considered appropriate or valid.
<li><b>GO term</b>: Terms are hyperlinked to the AmiGO Gene Ontology browser at the Gene Ontology Consortium website. Click here to see the definition of the term, find annotations to the term from a variety of other organisms, browse the ontologies and more. For more information on how to use AmiGO see the <a href="http://www.godatabase.org/htdocs/docs.html">AmiGO User's Guide</a>.
<li><b>Aspect(asp)</b><%=DefinitionsLookup.createPopupLink("KeywordType","type")%>: Each of the ontologies covers an aspect or attribute of a gene product. The three aspects are : Molecular Function (func), Biological Process (proc) and Cellular Component (comp). 
<li><b>Code</b>:<%=DefinitionsLookup.createPopupLink("EvidenceDescription","evidence_code")%> Each annotation is associated with some form of evidence supporting the annotation. The different types of evidence are classified according to type.The evidence codes can be used to filter results according to the strength of the supporting evidence (e.g. IEA annotations , inferred from electronic annotation, are less well supported than IDA annotations which are inferred from direct assay). </li>
<li><b>GO slim</b><%=DefinitionsLookup.createPopupLink("Glossary","go_slim")%>: Each annotation can be grouped into a broader category -termed GO Slim. A GO slim term can correspond to one or more GO terms. See <a href="#bulkgo6">Understanding and using the GO Slim Functional Classification function</a> for more information about GO slim. For a complete listing of GO Slim terms see:<a href="go_slim_help.jsp">GO Slim Help</a>.</li>
<li> <b>Reference</b>: Sources of evidence supporting the annotation include research articles, abstracts, reviews, computational analysis among others. Citations to references in TAIR are hyperlinked to the TAIR detail page for the reference. These pages can be used to find the source article.
<li><b>Made by</b>: Arabidopsis GO annotations in TAIR include annotations made by TIGR curators and TAIR curators. 
</ul>
</td></tr></table>
<h2><a name="bulkgo5"></a>Understanding and using the GO Slim/Functional Classification function</h2>
<p>
<font class="cont">In addition to downloading entire sets of annotations for one or more loci, the Bulk GO annotation download tool can be used to group sets of genes into functional categories based upon their GO annotations. For each aspect of the GO ontologies, a set of 10-20 categories have been selected as major 'bins' for grouping related genes. This 'lite' version of the GO (called GO Slim <%=DefinitionsLookup.createPopupLink("Glossary","go_slim")%> represents a non-overlapping set of categories. Annotations are binned based upon the relationship of the term to a 'parent' GO slim term. That is: a gene annotated to the term MAP kinase kinase kinase activity which is a type of kinase would be grouped into the GO slim category, kinase activity because , if you follow the path of the term to the top of the ontology, it is a child of kinase activity (see the <a href="/servlets/Search?action=new_tree&type=tree&tree_type=keyword&node_id=1095">Tree View of MAP kinase kinase activity</a>). A list of GO Slim terms can be found <a href="go_slim_help.jsp">here</a>.</font> 
<h4>Functional Categorization Results</h4>
<font class="cont">To obtain a list of functional categories for a set of genes, upload the list of locus identifiers in the input box, choose HTML or text output  and click on the "Functional Categorization" button. The results will be displayed in a table format (in HTML or text depending on the output type selected). The results format is as follows:
<ul>
<li><b>Keyword Category</b>: The type of GO term.</li>
<li><b>Functional Category</b>: This corresponds to the GO slim term.</li>
<li><b>Annotation Count</b>: The annotation count  corresponds to the number of times a unique combination of locus and GO terms appears in the category. A gene product/locus can appear in more than one GO slim category of the same type (e.g. if the gene product is annotated to more than one molecular function) if the categories are non-overlapping. If a gene product is annotated to more than one term in a keyword category, and each term is a child of a different GO slim term, the gene product will be included in BOTH keyword category counts.
<br /></li>
<li><b>Gene Count</b>: The total number of unique loci represented within each category is displayed in this column. Clicking on the numerical value will display a list of all the loci/genes within the category. <br />
The gene list (number of locus/term combinations) often differs  from the number of annotations in the same category If fewer genes are listed than the number of annotations , this could be because one gene model may be annotated to the same term more than once or that more than one gene model for a locus may be annotated to the same term.</li>
</ul>
</font>
<h2><a name="bulkgo6"></a>Sorting the Functional Categorization Results</h2>
<p>
<font class="cont">If the results are displayed in HTML format, the display of the functional categories can be sorted either by annotation count or gene count. Choose the option you prefer from the drop down menu and ckick on the "resort" button. The default option is by gene count.</font></p>
<h2><a name="bulkgo7">Generating a graph of a GO slim/Functional Classification set</h2>
<p>
<font class="cont">If the HTML output option is chosen, you can choose to display the Functional Classification results as a pie chart. You can choose to plot the distribution of annotations or of genes by making the appropriate selection from the drop down menu.To display the graphs, click on the "Draw' button at the upper left of the page next to the Pie Chart selector drop down menu. The results will be displayed as three separate graphs, each representing the functional classification according to keyword category (GO Molecular Function, GO Biological Process and GO Cellular Component). The graphs are  in GIF format and can be saved to your local computer.</font>
<!-- footer using external javascript file starts here -->
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("");
setNext("annotdetail.jsp");
writeFooter();
</script>
<!-- end footer -->
</body>
</html>
