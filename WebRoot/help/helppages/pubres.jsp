<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("publicsearch.jsp");
setNext("pubdet.jsp");
writeHeader();
</script>

<!-- End of header -->
</head>

<h2><a name="pubres1"></a>Using the  Publication Search Results</h2><hr>


<p><a name="pubres2"></a><font class="cont">When you click on submit on the Publication Search, if there are matches found that meet your search criteria a brief summary of the results will be displayed. In the event your search returns no results, please check your spelling and the general search parameters to identify potential sources of error before trying your search again. Alternatively, the publication you are looking for may not yet be in the Database. Each results page displays the following header.</font></p>


<p><a name="pubres3"> </a><font class="cont"><img src="images/pubres1.gif">
</font></p>
<h4><a name="pubres4"> </a>New Publication Search</h4>
<p><a name="447608"> </a><font class="cont">Lets you return to the Publication Search Page with no parameters defined. Use this if you want to perform a new publication search.</font></p>
<h4><a name="pubres5"> </a>Download</h4>
<p><a name="pubres6"> </a><font class="cont">Lets you download the selected search results data set in a tab-delimited text format. Use the checkboxes on the left to select specific entries to download, or use the check all button to select all of the results displayed on a page. To retrieve all of the results, you must click on each result page and select all for each page. When you click on download, you will retrieve all selected results from all pages. The format for downladed results is TAIR Accession [tab]Authors  [tab]Title [tab]Publication Name [tab] Year [tab] Volume[tab] Page Start [tab] Associated Keywords. </font></p>

<h4><a name="pubres7"> </a>Summary</h4>
<p>
<a name="pubres8"> </a><font class="cont">The results page also displays the parameters you searched for, the number of records returned and the number of results displayed on the page.If multiple results pages are displayed you can move from page to page using the links at the bottom of the page.</font></p>
<p><a name="pubres9"> </a><font class="cont">The remainder of the Publication Search Results window contains the search results data.Clicking on the title in the results page will take you to the detail page for that publication.</font></p>
<h2><a name="pubres11"> </a>Publication Search Results</h2>
<p><a name="pubres12"> </a><font class="cont">A numbered list of search results comprise the middle portion of this section. Each numbered line is a record. Records are numbered relative to the entire query results set so, for example, the second page of the query results shown above would contain 26 - 50.</font></p>
<p><a name="pubres10"> </a><img src="images/pubres2.gif">
<h4><a name="pubres15"></a>Authors</h4>
<p><a name="pubres16"></a><font class="cont">The list of authors as it appears in the journal, abstract, article or book</font>
<h4><a name="pubres17"></a>Title</h4>
<p><a name="pubres18"> </a><font class="cont">The title of the publication (e.g.article title, book title, meeting abstract title).Clicking on this link will take you to the Publication detail page.</font>
<h4><a name="pubres19"></a>Source</h4>
<p><a name="pubres20"> </a><font class="cont">The name of the source of the publication.For example, a journal name, book name,book chapter title or conference proceedings name.</font>
<h4><a name="pubres21"></a>Year</h4>
<p><a name="pubres22"> </a><font class="cont">Year of publication.</font>
<h4><a name="pubres23"></a>Volume</h4>
<p><a name="pubres24"> </a><font class="cont">For serials, this is the volume in which the publication appears in.</font>
<h4><a name="pubres25"></a>Page</h4>
<p><a name="pubres26"> </a><font class="cont">The page number the publication starts at.</font>
<h4><a name="pubreskey"></a>Keywords</h4>
<p><font class="cont">Controlled vocabulary (keywords) associated to the publication.</font>
<h4><a name="pubres27"></a>Previous</h4>
<p><a name="pubres28"></a><font class="cont">Accesses the set of results that fall immediately before the current set; e.g., if results 51 - 75 are currently shown in the window, results 26 - 50 will appear after you select <strong>previous</strong>. </font></p>
<h4><a name="pubres29"> </a>Next </h4>
<p><a name="pubres30"> </a><font class="cont">Accesses the set of results immediately following the current set; e.g., if results 51 - 75 are currently shown, results 76 - 100 will appear after you select <strong>next</strong>. </font></p>
<h4><a name="pubres31"> </a>Numbered links</h4>
<p><a name="pubres32"> </a><font class="cont">Let you jump forward or backward to a specific portion of the results list; e.g., if the page range is 50 records and you select 3, records 101 - 150 will appear.</font></p>

<!-- footer using external javascript file starts here -->
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("publicsearch.jsp");
setNext("pubdet.jsp");
writeFooter();
</script>
<!-- end footer -->

</body>
</html>
