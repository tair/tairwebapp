<html>
<head>
<title>TAIR Help:Protein Search Results</title>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("prosearch.jsp");
setNext("protdet.jsp");
writeHeader();
</script>

<!-- End of header -->
</head>

<body>
<br>

<p>
<a name="res1"></a><h2>Using the Protein Search Results</h2>
<p>
<a name=""></a><font class ="cont">When you submit your query for the Protein Search the results will be displayed as a numeric list. The total number of results pages depends on the number of results and the number of records selected per page for the output.</font>
<p>
<a name="res2"></a><h2>Protein Search Results</h2>
<p>
<a name=""></a><font class="cont">The results of your search will be displayed on the top of the page with the parameters highlighted in red. The total number of matching records is also displayed.</font>
<p>
<a name="res3"></a><h4>Perform a new Protein Search</h4>
<p>
<a name=""></a><font class="cont">If you want to try a new search, clicking on the New Protein Search button will take you to the Protein Search page where you can input new parameters for a new search.If you want to go back and to the previous search and alter parameters, use the back button on your browser.</font>
<p>
<a name="res4"></a><h4>Download</h4>
<a name=""></a><font class="cont">This option allows you to download the results of your search as a tab delimited file.Tab delimited files can be opened using a spreadsheet program such as Microsoft Excel. Choosing the 'Check All' option will select all of the records on the current page, or you can select specific records by checking the "Check to download" box next to each record. Clicking on the Download button will download ALL checked records from all selected pages. The downloaded fields are:</font>
<ul>
<li>TAIR accession:Uniquely identifies a record in TAIR's database. You can use this to create links from a web page to the detail page for the protein record. See the section on <a href="/about/linktotair.jsp">Hyperlinking to TAIR</a>.</font>
<li>Name: Name of the protein.
<li>Source: source of the protein sequence.
<li>Last updated: date the record was last updated.
<li>Gene: the gene that encodes the protein.
<li>Description: summary of the gene.
<li>Locus: name of the locus to which the gene model maps.
</li>
</ul>
<p>
<a name="res3"></a><h4>The search results</h4>
<p>
<a name=""></a><font class="cont">Each result from the search is listed in the numbered display.</font>
<p>
<a name="res4"></a><h4>Name</h4>
<p>
<a name=""></a><font class="cont">Clicking on the protein name will take you to the detail page for the protein record.</font>
<p>
<a name="res5"></a><h4>Source</h4>
<p>
<a name=""></a><font class="cont">Click on the name of the source for the protein record, to see the detail page for the community member who is the source of the protein sequence record.</font>
<p>
<a name="res6"></a><h4>Last updated</h4>
<p>
<a name=""></a><font class="cont">This indicates the date the record was last updated in TAIR.</font>
<p>
<a name="res7"></a><h4>Gene</h4>
<p><a name=""></a><font class="cont">Click on this link to see the detail page for the gene model that encodes the protein.</font>
<p>
<a name="res8"></a><h4>Description</h4>
<p>
<p><a name=""></a><font class="cont">This is a brief description of the gene. The complete description can be found on the gene detail page.</font> 
<p>
<a name="res9"></a><h4>Locus</h4>
<p><a name=""></a><font class="cont">Click on this link to see the locus detail page. The locus details include all gene models, EST sequences, cDNA and genomic nucleotide sequences, polymorphisms, genetic markers and a variety of other associated data.</font>
<a name="res10"></a><h4>Records display</h4>
<p><a name=""></a><font class="cont">The total number of pages of records is displayed at the bottom of the results page. To go to then next page, click the  'Next" link. To go to specific results pages, click on the numbered link.</font>
<!-- footer using external javascript file starts here --> 
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("prosearch.jsp");
setNext("protdet.jsp");
writeFooter();
</script>
<!-- end footer -->
</body>
</html>
