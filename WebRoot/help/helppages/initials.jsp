<<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import= "org.tair.search.*, org.tair.utilities.*, java.net.*, java.util.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("tairseaa.jsp");
setNext("");
writeHeader();
</script>
<title>TAIR Help-Simple Search</title>
<!-- End of header -->
</head>

<body>
<br>

<h2><a name="447173"> </a>Using TAIR's Simple Search </h2><hr>
<p><a name="447174"> </a><font class = "cont">
For simple queries of the database this search can be accessed from any of the database or website pages. If you know the exact name of a piece of data such as a gene or allele, you can use the exact name search. Alternatively, you can select a data type from the drop down menu and perform a more general search using names,descriptions or keywords. The following section describes exactly what data and fields are searched using each of the parameters in the drop down menu.
</font></p>
<h2>Search Options</h2>
<p><font class="cont">For each option in the drop down menu- different fields are searched. They are listed here along with example queries. To search fields or data types  NOT included in the simple search, use the Advanced Query tools for the data type in question.</font></p>
<p>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true" />
</p>
<br />
<br />
<table width="800" border="1">
<tr><th>Option</th><th>Parameters</th><th>Example</th></tr>
<tr><td>Clone</td><td>Performs a search for clones where the name, aliases or GenBank accession contains the query term</td><td>Find all Gateway clones in pENTR vector using the term pENTR.</td></tr>
<tr><td>Ecotype</td><td>Performs a search for all Ecotypes in TAIR where the full name,abbreviated name or alias contains the query term.</td><td> "Col" will  find all Col accessions in the database.</td><tr>
<tr><td>EST/BAC End</td><td>Performs a search for Expressed Sequence Tag Clones (ESTs) or BAC ends where the EST or BAC end name or GenBank accession contains the query term.</td><td>"75F4T7" Will find all EST or BAC ends containing 75F4T7 in the name. If you know the exact name, it may be faster to use the exact name option.</td></tr>
<tr><td>Gene</td><td>Performs a search for genes where the name, alias, locus code, description or Genbank sequence accession contains the query term.</td><td>"Flowering" will find all genes where the description or name(s) contains this term..</td></tr>
<tr><td>Germplasm</td><td>Performs a search for all Germplasms in TAIR where the name or alias contains the query term.</td><td>"gl1" will find all germplasms (including ecotypes) where the name or alias contains the term.</td><tr>
<tr><td>Keyword</td><td>Performs a search for all KEYWORDS in TAIR where the name or external database identifier contains the query term.</td><td>"Kinase" will find all keywords containing the term kinase. "GO:0016301" will find all terms with that string in the name or id field..<font class="em">NOTE:</font> Click on the keyword to link to the detail page to see all of the data types associated to the term. For example, to find genes by keyword, click on the keyword and then the link to genes from the keyword detail page.</td></tr>
<tr><td>Library</td><td>Performs a search for all DNA libraries where the name or alias contains the query term</td><td>"two-hybrid' will find two hybrid libraries.</td></tr>
<tr><td>Marker</td><td>Performs a search for all genetic markers where the name,alias or type contains the query term</td><td>"SGNSNP" will find all SNP markers from the Stanford Genome Center."CAPS" will  find all CAPS markers in the database.</td></tr>
<tr><td>People/Labs</td><td>Performs a search for Individuals or Organizations in TAIR database whose first or last name contains the query term. Does not search for combinations of first, last name</td><td>"Rhee" will find all people whose last name contains Rhee;" SALK" will find all organizations with this term in the name field..</td></tr>
<tr><td>Polymorphism</td><td>Performs a search for all alleles/polymorphisms where the name or alias contains the query term.</td><td>"MASC" will find all polymorphisms from the MASC project.</td></tr>
<tr><td>Protein</td><td>Performs a search for all proteins in the database where the name, alias, locus code, GenBank accession, UniProt id or protein domain name or identifier contains the query term.</td><td>"MADS" will find all proteins having a MADS box domain.</td></tr>
<tr><td>Seed Stock</td><td>Performs a search for all seed stocks in the database where the name or alias contains the query term.</td><td>"SAIL" will find all of the Syngentia SAIL lines.</td></tr>
<tr><td>DNA Stock</td><td>Performs a search for all DNA stocks such as clones, clone ends (BAC end, ESTS),pooled genomic DNA, vectors, libraries, filters and host strains where the STOCK name or alias contains the query term.</td><td>Use"BUN10" or the Stock number "CD3-626" to find the host strain for the pUNI vector..</td></tr>
<tr><td>Vector</td><td>Performs a search for all vectors in TAIR database (including those that are NOT ABRC stocks) where the name or alias contains the query term.</td><td>Use "pEarlyGate" to find all of these vectors.</td></tr>
<tr><td>Google TAIR Website</td><td>Using this option performs a search of the web pages at TAIR and NOT the database. Some of the data at TAIR is displayed in 'static' pages on the website and are not stored in the database. For example, the lists of community curated gene families are in this format. This search uses standard Google syntax meaning multiple terms can be used along with boolean operators (and, or, not) along with phrases.</td><td>Flower development will find all TAIR webpages containing the terms flower and/or development. Use quotes (e.g. "Flower development") to find the exact phrase as written..</td></tr>
<Tr><td>Exact Name Search</td>
<td>Use this option to search ALL of the data types listed above with an exact match to the query term in the name field. Names also include aliases (alternative names) for the object.</td>
<td>To find the gene PHOT1 enter either Phot1 (symbol), phototropin (full name) NPH1 (alias) or AT3G45780 (locus code).</td>
</table>

<h2><a name="447050"> Advanced or Specific Searches</h2>


<p><a name="447094"> </a><font class = "cont">Links to the  Advanced Search options appear below the Simple Search form. Use these advanced search form if you would like to make more complex queries or if the results returned from the simple search are to general and need to be narrowed down or to search fields NOT included in the Simple search (such as clone description).</font></p>
<p><a name="447105"> </a><font class = "cont">These options let you search within specific data types in TAIR. The data types are listed on the left. The search option appears to the right of each data type. When you select the search option for a data type, the advanced search form is opened. The specific search is most useful if you know the type of data you seek. Click on the 'Search" link to go to the advanced search for the specified data type. Clicking on the 'Help' link will take you to help documents describing how to use the search and understand the search results. Click on the <img src="/images/questionmark.gif"> to see a definition of a term or datatype or tool.</font></p>


<!-- footer using external javascript file starts here -->
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("tairseaa.jsp");
setNext("");
writeFooter();
</script>
<!-- end footer -->

</body>
</html>
