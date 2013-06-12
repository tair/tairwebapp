<html>
<head>
<title>TAIR Publication Search Help</title>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("");
setNext("pubres.jsp");
writeHeader();
</script>

<!-- End of header -->
</head>

<body>
<br>

<h2><a name="pub1"> </a>Using the Publication Search</h2>

<font class ="cont"><a name="pub2"> </a>TAIR publications are derived from a number of databases including: PubMed, Agricola and Biosis. In addition, articles from the Weeds World and the Electronic Arabidopsis Information Service archives are included in this search. Publications include research articles, books, book chapters, newspaper articles, conference abstracts and reviews. For a current list of Publications in TAIR see: <a href="/jsp/tairjsp/pubDbStats.jsp">TAIR DB statistics</a></font>
<p>
<img src="images/public1.gif">
<p>
<h2><a name="pub3">Search Terms</a></h2>
<font class="cont"><a name="pub3"> </a>You can include up to three terms in your search parameters. Each field will be included with an implicit AND in the query. For example, you can search for Author [my name] AND Title [Arabidopsis]. For each term you have the option to use <a href="initials.jsp#447225">wild cards.</font>
<p>
<h4><a name ="pub4"></a>Author</h2>
<font class="cont"><a name="pub5">Use this to search with the name of the author. Note that this search does not include aliases. For example John Public will not retrieve results for "Public", "Public, JQ", "John Q. Public". For the most open-ended search try searching with the last name only and the *contains* option.
<p>
<h4><a name="pub6"></a>Abstract</h2>
<font class="cont"><a name="pub7"></a>This option allows you to search for a given term within any abstract</font>
<p>
<h4><a name="pub8"></a>Title</h4>
<font class="cont"><a name="pub9"></a>This option allows you to search for a term only in the title.</font>
<p>
<h4><a name="pub10"></a>Title/Abstract</h4>
<font class="cont"><a name="pub11"></a>This option searches BOTH the title and abstract for your query term.</font>
<p>
<h4><a name="pub12"></a>Journal/Book Title</h4>
<font class="cont"><a name="pub13"></a>This option allows you to search by Journal name (e.g. The Plant Cell) and book title (e.g. Molecular Biology of the Cell). Alternative and abbreviated names are included in this field. For example, you can search with PNAS or  Proceedings of the National Academy of Sciences.</font>
<p>
<h4><a name="pub14"></a>URL</h4>
<font class="cont"><a name="pub15"></a>This option is by universal record locator (URL) for finding web pages such as electronic publications that are only found on the web.</font>
<p>
<h4><a name="pub16"></a>Search by year (Year from and to)</h4>
<font class="cont"><a name="pub17"></a> You can restrict your search to within  a range of years from 1947 to the present year. By default, the start year is 1988.</font>
<h4><a name="pub25"></a>Publication Type</h4>
<font class="cont"> Used to restrict your search to specific types of publications such as journal articles, books, conference proceedings, dissertations, news articles and reviews.</font>
<p>
<h2><a name ="pub26"></a>Search By Associated Keyword</h2><p><font class="cont">This option allows you to search for publications  by keywords.Keywords include molecular function,subcellular localization and biological process terms from the Gene Ontology Consortium and Arabidopsis Anatomy and development. You can choose to restrict your search to a specific type of keyword. Typing in a keyword and choosing any will search for by keywords regardless of type. As with ohter keyword searches, the results will include matches to children as well as parent terms.</font>
<h2><a name="pub18"></a>Output Options</h2>
<font class="cont"><a name="pub19"></a>There are several options you can select to define how your search results are displayed.</font>
<p>
<h4><a name="pub20"></a>Records Per Page</h4>
<font class="cont"><a name="pub21"></a>You can choose to have 25,50,100 or 200 records per page of results. Note that increasing the number of records/page will increase the amount of time to load the search results.</font>
<p>
<h4><a name="pub21"></a>Sort by</h4>
<font class="cont"><a name="pub22"></a>You can choose to sort by date or by author's last name. If you sort by date, the results will be presented in descending order from most recent to least recent. If you sort by name, the results will be displayed alphabetically according to the FIRST authors name.</font>
<!-- footer using external javascript file starts here --> 
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("");
setNext("pubres.jsp");
writeFooter();
</script>
<!-- end footer -->
</body>
</html>
