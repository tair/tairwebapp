<html>
<head>
<title>TAIR Help: Keyword Search</title>
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
<table ="602"><tr><td>
<h2><a name=""> Using the TAIR Keyword Search and Understanding the results and detail pages</a></h2>
<font class="cont"><a name""></a>These pages describe how to search TAIR database with keywords.</font>

<ul><b>Contents</b>
<li><a href="#key1">Introduction</a>
<li><a href="#key2">Searching with keywords</a>
<li><a href="#key3">Choosing types of keywords to search</a>
<li><a href="#key4">Keyword search results</a>
<li><a href="#key5">Understanding and using the keyword details</a>
<li><a href="#key6">Viewing data associated to keywords</a>
<li><a href="annotdetail.jsp">Understanding the annotation details</a>
<li><a href="keybrowse.jsp">Using the keyword browser (TreeViewer)</a>
</li></ul>
<h4><a name="key1"></a>Introduction</h4>

<p><font class ="cont">Keywords in TAIR are used to describe a variety of data such as genes, publications and  microrarray experiments. The keywords are controlled vocabulary terms that are used by collaborating model organism databases to provide a uniform set of descriptive terms that can be used by all member groups. The keyword search allows you to find all types of data associated with a given phrase such as "leaf development' or "signal transduction".
<p>
A major use of keywords are for functional annotations of genes by association to Gene Ontology terms. The GO annotations describe gene products in terms of their molecular functions, sub cellular and roles in biological processes. GO ontologies are developed by the <a  href="http://www.geneontology.org">Gene Ontology Consortium</a>. 
<p>Plant structure and developmental stage keywords are primarily used to describe patterns of gene expression and characteristics of biological materials such a germplasms. Plant structure and development terms are being developed in collaboration with the <a href="http://www.plantontology.org/">Plant Ontology Consortium</a>.
<p>


<h4><a name="key2"> </a>Searching for Keywords</h4>
<p><font class="cont">You can search for keywords using exact or inexact (starts with, contains, ends with) matching. If you are unsure of the phrasing of the term, choose a [contains] search. This will be slower but is likely to retrieve more results. </font></p>
<p><img src="images/key3.gif" border="1"></p>
<p>
<h4><a name="key3"></a>Choosing the type of keywords to search</h4>
<p><font class=""cont">You can choose to restrict your search to a subset of keywords by selecting the types of keywords to search. The default option searches all keywords regardless of type. Checking any of the boxes will limit your search to only keywords of the selected type; more than one keyword type can be searched.</font>
<h2><a name="key4"></a>Keyword search results</h2>
<p><font class="cont"> The keyword search results are displayed on a summary page which shows all of the keywords that were found in the query. 
From this summary page you can find information about the keywords, find data associated to keywords and keyword children terms, as well as perform a new keyword search.</font>
<p><img src="images/keyres1.gif" border="1">
<p>
<h2><a name="key5"></a>The keyword details</h2>
<p><font class"cont">Clicking  on the keyword term will open a new window showing detailed information about the keyword. To see the definitions for any of the fields, click on the question mark icon. </font>
<p><img src="images/key5.gif" border="1">
<h2><a name="key6"></a>Viewing associated data</h2>
<p><font class="cont">Data types that are associated to each keyword are listed according to type. The number represents the total number of objects (e.g. genes, annotations) that are associated to either the term itself or its children terms. Click on the link for each data type to view a summary list.The current set of data types associated to keywords includes: genes, publications, annotations (functional annotations of genes) and expression sets(microarray experiments).For information about interpriting the annotation details see <a href="annotdetail.jsp">Annotation Detail Page help</a>.</font>
<p><img src="images/keyword4.gif" border="1">
<p>
<h2><a name="key7"></a>TreeView</h2>
<p><font class="cont">Clicking on the TreeView will open a new window showing the keyword in relation to the over all keyword category structure (ontology). The structure is similar to a hierarchical tree in that any term can have children. It differs in that any child term can have more that one parent. This representation is termed a 'directed acyclic graph'. For help in understanding and using the TreeViewer see the <a href="keybrowse.jsp">Keyword Browse Help</a>.
<p><img src="images/key4.gif" border="1">

</td></tr></table>
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
