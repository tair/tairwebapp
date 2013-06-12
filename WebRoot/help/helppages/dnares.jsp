<html>

<head>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("dnasearch.jsp");
setNext("dnadet.jsp");
writeHeader();
</script>

<!-- End of header -->
</head>
<h2><a name="913144"> </a>The DNA search results</h2><hr>
<font class="cont">
<ul><b>Contents</b>
<li><a href="#gen">General format of results pages</a>
<li><a href="#447602">Downloading Results</a>
<li><a href="#clone">Clone search results</a>
<li><a href="#end">Clone end search results</a>
<li><a href="#vector">Vector search results</a>
<li><a href="#library">Library search results</a>
<li><a href="#dna">Pooled genomic DNA search results</a>
<li><a href="#filter">Filter search results</a>
</li></ul>
<p><h2><a name="gen"></a>General format of results pages</h2>
<p><a name="gen1"></a><font class ="cont">The format of the results will differ depending on the type of DNA you searched for, however at the top of ALL results pages you will see the following:</font>
<h4><a name="447525"> </a> New Search</h4>
<font class ="cont">Click on this button to start a new advanced DNA search</font>
<h4><a name="447602"> </a>Download</h4>
<p><font class ="cont">This feature lets you download selected search results from one or more pages in a tab-delimited text format. To select all of the results on a page to download choose the check all option. To download only certain results from the page, use the check boxes in the left hand column of the results section. When you click on the download button, you will download all checked items from all results pages. If you have a LARGE number of results that are displayed 25/page- go back and change the output option to the maximun. The results will take longer to load there will be fewer pages to click through. Tab delimited files can be opened using a spreadsheet program such as Excel. The following table shows what fields will be downloaded for each DNA type.</font>
<br>
<table width ="602" border="1" align="center">
<tr><th>DNA type</th><th>Downloaded Fields</th></tr>
<tr><td>Clone</td><td>TAIR accession; Name;Aliases; Vector Type; Chromosome;Position;Locus; ABRC Stocks</td></tr>
<tr><td>CloneEnd</td><td>TAIR accession; Name;Aliases; Clone End Type; Chromosome;Position;Locus; ABRC Stocks</td></tr>
<tr><td>Library</td><td>TAIR accession; Name;Description;ABRC stocks</td></tr>
<tr><td>Vector</td><td>TAIR accession; Name; Aliases;Vector Type</td></tr>
<tr><td>Filter</td><td>TAIR accession; Name; Description; Stock Availability</td></tr>
<tr><td>Pooled Genomic DNA</td><td>TAIR accession; Name; Description; Stock Availability</td></tr>
<tr><td>Stock</td><td>TAIR accession; Name; Description; Stock Availability</td></tr>
</table>
<a name="447603"></a><h4>Search Parameters.</h4>
<p><font class ="cont">Above the search results is a brief report of your query and the number of results found.</font>
<p><font class="cont">If more than one page of results is returned, on the bottom of each page you will see the following:</font>
<h4>Check All </h4>
<font class="cont">Clicking this button will select all results on this page for downloading.</font>
<h4>UnCheck All</h4>
<font class="cont">Clicking this button will de-select all results on this page.</font>
<h4>Order Checked Stocks</h4>
<font class="cont">Allows you to place an order for stocks you have selected directly from this page. If you are not logged in you will be prompted to login first.</font>
<a name="447625"> </a> <h4>Previous</h4>
<p><font class ="cont">Accesses the set of results that fall immediately before the current set; e.g., if results 51 - 75 are currently shown in the window, results 26 - 50 will appear after you select <strong>previous</strong>. </font>
<a name="447631"></a> <h4>Next </h4>
<p><font class ="cont">Accesses the set of results immediately following the current set; e.g., if results 51 - 75 are currently shown, results 76 - 100 will appear after you select <strong>next</strong>. </font>
<a name="447634"> </a><h4> Numbered links</h4>
<p><font class ="cont">Let you jump forward or backward to a specific portion of the results list; e.g., if the page range is 50 records and you select 3, records 101 - 150 will appear.</font>

<a name="clone"></a><h2>Clone Search Results</h2>
<h4>Check to download</h4>
<font class="cont">Check the box if you want to include this record in your download.</font>
<a name="447642"></a><h4>Clone Name</h4>
<a name="447642"> </a><font class ="cont">The name of the clone that matched the search criteria. Each name is linked to detailed information about the clone.</font>
<h4><a name="447676"> </a> Aliases</h4>
<font class ="cont">Synonym of the clone name.</font>
<h4><a name="447641"> </a>Vector Type</h4>
<a name="447648"> </a><font class ="cont">The type of cloning vector clone,if known.</font>
<h4><a name="447638"> </a>Chrom</h4>
<a name="447653"> </a><font class ="cont">The chromosome on which the clone is located.</font></p>
<h4><a name="447639"> </a> Position</h4>
<a name="447654"> </a><font class ="cont">The location of the clone on the chromosome.</font></p>
<h4><a name="447640"> </a> Map View</h4>
<a name="447655"> </a><font class
<font class ="cont">A link to a display of a map containing the cloned in the map visualization tool.</font>
<h4>Stock to order</h4>
<font class="cont">Checking this box will add the stock to your order (if there is an available ABRC stock). When are done selecting your items to order, click on the "order checked stock" button to begin placing your order.</font>
<h4>Stock name</h4>
<font class="cont">The name of the stock corresponding to the clone. Click on the name to view the stock details.</font>
<a name="end"></a><h2>Clone end search results</h2>
<h4>Check to download</h4>
<font class="cont">Check the box if you want to include this record in your download.</font>
<a name="end0"></a><h4>Clone End Name</h4>
<a name="end2"> </a><font class ="cont">The name of the clone end that matched the search criteria. Each name is linked to detailed information about the clone end.</font>
<h4><a name="end3"> </a> Aliases</h4>
<font class ="cont">Synonym of the clone end.</font>
<h4><a name="end4"> </a> Type</h4>
<a name="end5"> </a><font class ="cont">The type of clone end.</font>
<h4><a name="end6"> </a>Chrom</h4>
<a name="end7"> </a><font class ="cont">The chromosome on which the clone end is located.</font></p>
<h4><a name="end8"> </a> Position</h4>
<a name="447654"> </a><font class ="cont">The location of the clone on the chromosome.</font></p>
<h4><a name="end9"> </a> SeqView</h4>
<font class ="cont">A link to the SeqViewer displaying the location of the clone end on the sequence map.</font></p>
<a name="end10"><h4>Assoc Clone Name</h4>
<font class ="cont">The name of the clone from which the clone end is derived. Click on the name to view the clone detail page</font>
<a name="end11"></a><h4>Stock to order</h4>
<font class="cont">Checking this box will add the stock to your order (if there is an available ABRC stock). When are done selecting your items to order, click on the "order checked stock" button to begin placing your order.</font>
<a name="end12"></a><h4>Stock name</h4>
<font class="cont">The name of the stock corresponding to the clone. Click on the name to view the stock details.</font>
<a name="vector"></a><h2>Vector search results</h2>
<h4>Check to download</h4>
<font class="cont">Check the box if you want to include this record in your download.</font>
a name="vec1"></a><h4>Vector Name</h4>
<a name="vec2"> </a><font class ="cont">The name of the vector that matched the search criteria. Each name is linked to detailed information about the vector.</font>
<h4><a name="vec3"> </a> Aliases</h4>
<font class ="cont">Synonym of the vector.</font>
<h4><a name="vec4"> </a> Type</h4>
<a name="vec5"></a><font class ="cont">The type of cloning vector.</font>
<a name="vec11"></a><h4>Stock to order</h4>
<font class="cont">Checking this box will add the stock to your order (if there is an available ABRC stock). When are done selecting your items to order, click on the "order checked stock" button to begin placing your order.</font>
<a name="vec12"></a><h4>Stock name</h4>
<font class="cont">The name of the stock corresponding to the vector. Click on the name to view the stock details.</font>

<a name="library"></a><h2>Library search results</h2>
<h4>Check to download</h4>
<font class="cont">Check the box if you want to include this record in your download.</font>
<a name="lib1"></a><h4>Name</h4>
<a name="lib2"> </a><font class ="cont">The name of the library that matched the search criteria. Each name is linked to detailed information about the library.</font>
<h4><a name="lib3"> </a> Description</h4>
<font class ="cont">A short description of the library.</font>
<a name="lib12"></a><h4>Stock to order</h4>
<font class="cont">Checking this box will add the stock to your order (if there is an available ABRC stock). When are done selecting your items to order, click on the "order checked stock" button to begin placing your order.</font>
<a name="lib13"></a><h4>Stock name</h4>
<font class="cont">The name of the stock corresponding to the library. Click on the name to view the stock details.</font>

<a name="dna"></a><h2>Pooled genomic DNA search results</h2>
<h4>Check to download</h4>
<font class="cont">Check the box if you want to include this record in your download.</font>
<a name="dna1"></a><h4>Name/Stock Number</h4>
<a name="dna2"> </a><font class ="cont">All pooled genomic DNAs are ABRC stocks. Clicking on the name will take you to the stock detail page.</font>
<a name="dna3"></a><h4>Description</h4>
<font class="cont">A brief description of the stock (e.g. # plants/pool).</font>
<a name="dna12"></a><h4>Check Stock to order</h4>
<font class="cont">Checking this box will add the stock to your order (if there is an available ABRC stock). When are done selecting your items to order, click on the "order checked stock" button to begin placing your order.</font>
<a name="filter"></a><h2>Filter search results</h2>
<h4>Check to download</h4>
<font class="cont">Check the box if you want to include this record in your download.</font>
<a name="fil11"></a><h4>Name/Stock Number</h4>
<font class ="cont">Filter names correspond to ABRC stock ids.</font>
<a name="fil6"> </a><h4>Description</h4>
<font class ="cont">A brief description of the filter.</font>
<a name="fil11"></a><h4>Stock to order</h4>
<font class="cont">Checking this box will add the stock to your order (if there is an available ABRC stock). When are done selecting your items to order, click on the "order checked stock" button to begin placing your order.</font>


<!-- footer using external javascript file starts here -->
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("dnasearch.jsp");
setNext("dnadet.jsp");
writeFooter();
</script>
<!-- end footer -->


</body>
</html>
