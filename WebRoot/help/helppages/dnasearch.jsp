 <html>
<title>TAIR Help:DNA Search</title>
<head>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("");
setNext("dnares.jsp");
writeHeader();
</script>
<!-- End of header -->
</head>
<body>

<h2> <a name="dnaser1"> </a>Using the DNA Search</h2><hr> 
 
 
<p><a name="dnaser2"> </a><font class="cont">The DNA Search  provides three ways of searching for DNA resources:A simple search by name only, complex search using more limits, and search by position. These are offered in three distinct sections of the window. Depending upon the TYPE of DNA you search for different feature parameters will be displayed.</font> </p> 
<h2> <a name="out"></a>Output options</h2> 
<p><a name="out2"></a><font class="cont">Use this section to restrict your search to a particular type of DNA, select the number of records to retrieve and how you wish to display the output.</font>
<h4>Number of records/page</h4>
<font class="cont">You can choose to display 25,50, 100,200 records per results page. Note that when you choose to display more results on a page the results will take longer to display.</font>
<h4>Sort records by</h4>
<font class="cont">You can choose to sort your clone and clone end results by name,type or position.For vectors you can sort either by name or type. For libaries, filters and pooled genomic DNA you can  only sort by name.</font>
<p> <a name="out3"> </a><font class="cont"><img src="images/dnaout.gif"></font></p>  
<p>
<a name="out4"></a><h4>Search for</h4>
<p> <a name="out5"> </a><font class="cont">The drop down menu allows you to choose they type of DNA to search. The following table lists the types of DNA  you can retrieve with this search along with their definitions. For help with feature parameters for specific DNA types, click the corresponding link to show feartures. </font></p> 

 <table width="602" border="1" align="center">
<tr bgcolor="#CCCCCC"><td><font class="cont">DNA Type</font></td>
<td><font class="cont">Definition</font></td>
<td><font class="cont">Feature Parameters</font></td></tr>
<tr><td><font class="cont">clone</font></td>
<td><font class="cont">A section of DNA that has been inserted into a vector molecule, such as a plasmid or a phage or yeast chromosome, and then replicated to form many identical copies.</font></td>
<td><font class="cont"><a href="#features">show features</a></font></td></tr>
<tr><td><font class="cont">vector</font></td>
<td><font class="cont">In DNA cloning, the plasmid or phage chromosome used to carry the cloned DNA segment. Also refers to the plasmids used to transform a plant.</font></td>
<td><font class="cont"><a href="#features">show features</a></font></td></tr>
<tr><td><font class="cont">clone end</font></td>
<td><font class="cont">In TAIR clone ends include expressed sequence tags (ESTs), bacterial artificial chromosome ends (BAC ends), yeast artificial chromosome ends (YAC ends), plasmids and clone ends of unknown type.</font></td>
<td><font class="cont"><a href="#features">show features</a></font></td></tr>
<tr><td><font class="cont">library</font></td><td><font class="cont">A collection of clones in any type of vector.</font></td>
<td><font class="cont"><a href="#features">show features</a></font></td></tr>
<tr><td><font class="cont">pooled DNA</font></td><td><font class="cont">Genomic DNA that has been isolated from a pool of plants (e.g.pools of T-DNA insertion lines representing multiple transformation events).</font></td><td><font class="cont"><a href="#features">show features</a></font></td></tr>
<tr><td><font class="cont">filter</font></td><td><font class="cont">A membrane containing DNA that has been bound to the surface.Filters in TAIR are generally from BAC, YAC, or plasmid colony libraries.</font></td><td><font class="cont"><a href="#features">show features</a></font></td></tr>
</table>
 <h4><a name="out7"></a>Number of records </h4> 
 <a name="out8"> </a><font class="cont">You can select to display 25, 50, or 100  result items on a single page. More results per page will take longer to load.</font></p> 
<h4><a name="out9"></a>Sort by</h4>
<a name="out10"> </a><font class="cont">Choose to have your out put ordered by name or type or position (for clones, clone ends), name or type (for vectors). All other types display results ordered by name only.</font>
<p>
<h2><a name ="search1">Search by Name</h2>
<font class="cont">Depending on the type of DNA you are searching for you can search with up to three of the following names/descriptions. Each name/description will be treated as a logical and. For example, a search for clone name =pROC + donor name = Ecker  will find all clones named pROC that were donated by Joe Ecker.</font>
<table width ="602" border="1" align="center">
<tr bgcolor="#CCCCCC"><td><font class="cont">Option</font></td><td><font class="cont">Definition</font></td><td><font class="cont">for which DNA type</font></td><td><font class="cont">Name help</font></td></tr>
<tr><td>clone name</td><td>the name of the clone</td><td>clone, clone end,library,vector</td><td><a href="/info/guidelines.jsp#clones">Help</a></td></tr>
<tr><td>gene name</td><td>name of the gene associated to the clone</td><td>clone,clone end</td><td>&nbsp;</td></tr>
<tr><td>clone end name</td><td>name of the clone end</td><td>clone,clone end</td><td>&nbsp;</td></tr>
<tr><td>locus name</td><td>chromosome based name for genomic sequence corresponding to a transcribed unit </td><td>clone, clone end</td><td><a href="/info/guidelines.jsp#locus">Help</a></td></tr>
<tr><td>library name</td><td>name of the library</td><td>clone,clone end, library,vector</td><td>&nbsp;</td></tr>
<tr><td>vector name</td><td>name of the vector</td><td>clone,clone end,library,vector,</td><td><a href="/info/guidelines.jsp#clones">Help</a></td></tr>
<tr><td>filter name</td><td>name of the filter</td><td>clone,library,filter</td><td>&nbsp;</td></tr>
<tr><td>donor last name</td><td>for ABRC stocks, the donor last name or donor organization name</td><td>clone,clone end,vector,library,filter,pooled genomic DNA</td><td>&nbsp;</td></tr>
<tr><td>GenBank Accession</td><td>unique identifier for a sequence entry in GenBank</td><td>clone,clone end,vector</td><td><a href="/info/guidelines.jsp#genbank">Help</a></td></tr>
<tr><td>Stock Description</td><td>text description of an ABRC stock</td><td>clone,clone end, library,filter,vector,pooled genomic DNA</td><td>&nbsp;</td></tr>
<tr><td>Stock number</td><td>unique accession for an ABRC stock, may be a combination of letter prefix (e.g. CS) and numbers.</td><td>clone,clone end, library,vector,filter,pooled genomic DNA</td><td><a href="/abrc/">Major ABRC stock info</a></td></tr>
</table>
<h2><a name="features"></a>Features</h2>
<font class="cont">The Restrict by Features options are below the Search by Name options on the DNA Search window. All the options in this section are an 'AND' operation. If the name input box is left blank, the software searches all the entries in the database matching the selected criteria.The following features are available for searching. Note not all features are available for all types of searches. </font>
<h4>Vector type</h4>
<font class="cont">Use this field to limit your search to one or more types of cloning vector. To select multiple vectors: select and press the APPLE key +mouse click (MAC) or press CTRL+ mouse click (PC). Choosing any will include all types of vectors in the results. </font>
<p><font class="cont"> Used for clone, clone end, libary and vector searches.</font>
<h4>Insert type</h4>
<font class="cont">Use this field to limit your search to clones, clone ends, vectors and libraries containing specific types of DNA inserted into the cloning vector.To select multiple insert types: select and press the APPLE key +mouse click (MAC) or press CTRL+ mouse click (PC). Choosing any will include all insert types in the results. </font>
<p><font class="cont">Used for clone, clone end, vector and library searches.</font>
<h4>Clone end type</h4>
<font class="cont">Use this field to limit your search to clones and clone ends having a specific type of end.To select types: select and press the APPLE key +mouse click (MAC) or press CTRL+ mouse click (PC). Choosing any will include all  types in the results. </font>
<p><font class="cont">Used for clone and clone end searches</a>
<a name="other_features"><h4>Other features </h4></a>Use these parameters to limit your search to include one or more of these features. To select multiple: select and press the APPLE key +mouse click (MAC) or press CTRL+ mouse click (PC). 
<table width="602" align="center" border="1">
<tr><th>Feature</th><th>Usage</th><th>Available searches</th></tr>
<tr><td>is sequenced</td><td>Restrict the search to only entries with sequence data.For example, to find an EST or BAC clone with sequence.</td><td>clone, clone end</td></tr>
<tr><td>is genetic marker</td><td>Restrict your search to clones and clone ends that are genetic markers. For example to find clones used as RFLP markers.</td><td>clone, clone end</td></tr>
<tr><td>is on a map</td><td>Restrict your search to clones and clone ends that have been placed on a sequence, genetic or physical map.</td><td>clone, clone end</td></tr>
<tr><td>is ABRC stock</td><td>Limit your search to only include DNAs that are ABRC stocks.</td><td>clone,clone end, vector, library,pooled genomic DNA, filter</td></tr>
<tr><td>is full length cDNA</td><td>Restrict your search to include only clones that contain full length cDNAs.</td><td>clone</td></tr>
</table>

<h2><a name ="time">Restrict by Time feature</h2>
<p>
<font class="cont">This option allows you to restrict your search to DNA that has been added or updated within the specified time period.</font>
<h2><a name = "maplocation"></a>Restrict by Map Location</h2>
<p>
  <font class="cont">This section lets you restrict your search by location. If you make a mistake and choose the wrong chromosome or map type, use the reset button to reset the parameters. Note that resetting will reset ALL of the search parameters (such as name, type and date restrictions).</font>
</p>
<p>
<img src="images/dnamap.gif"><p>
<p>
<p>
  <font class="cont">The options in this section let you use three parameters to restrict your search: Chromosome, Map Type, and Range.</font>
</p>

<h4><a name = "chromosome"> </a>Chromosome</h4>
<p>
  <font class="cont">Lets you limit your search to a single chromosome. There are five nuclear chromosomes in <em>Arabidopsis</em>: 1, 2, 3, 4, and 5.You can also search the chloroplast and mitochondrial genomes.</font>
</p>
<h4>  <a name="maptype"></a>Map Type</h4>
<p>
  <font class="cont">Lets you search entities by their position on a particular map and can be used with or without setting Range parameters. The map choices are: AGI sequence map and physical  maps.You can only choose one map type for each search- the acceptible units for selecting a Range will appear once a map has been selected. To search on multiple map types, use the <font  color="#0000ff" size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="/servlets/mapper">TAIR Map Viewer</a>.</font>You can also search and view clones and clone ends on the AGI sequence map using the <font  color="#0000ff" size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="http://tairvm09.tacc.utexas.edu/servlets/sv"> SeqViewer.</a></font>
</p>
<h4><a name="range">Range</h4>
<p>
  <font class="cont">Lets you specify a range search by the upper and lower bounds (when you select "Between") or a center point (when you select "Around"). The value is interpreted based on the selected range units. You can specify the range by  distance (cM), physical distance (kb), and by marker, gene or clone names. When you select "<b>Between</b>" from the drop-down menu, your search will be within the range defined by two entities or positions on a particular map. When you select "<b>Around</b>" from the drop-down menu, your search will be the area +/-10 cM and/or +/- 100 kb from the specified entity or position. When you choose search <b>around</b>, the second value input and units options are disabled.</font>
</p>


<p>

<!-- footer using external javascript file starts here -->
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("");
setNext("dnares.jsp");
writeFooter();
</script>
<!-- end footer -->

</body> 
</html> 
