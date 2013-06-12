<html>

<head>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("commsearch.jsp");
setNext("commdet.jsp");
writeHeader();
</script>

<!-- End of header -->
</head>

<h2><a name="913144"> </a>Using the Community Search Results</h2><hr>


<p><a name="447197"> </a><font class="cont">When you click on submit on the Community Search, if there are matches found that meet your search criteria a brief summary of the results will be displayed. In the event your search returns no results, please check your spelling and the general search parameters to identify potential sources of error before trying your search again. Alternatively, the person, or organization you are looking for may not yet be in the Database. Each results page displays the following header.</font></p>


<p><a name="447598"> </a><font class="cont"><img src="images/commres1.gif">
</font></p>
<h4><a name="447602"> </a>Search Again</h4>
<p><a name="447608"> </a><font class="cont">Lets you return to the Community Search Page with no parameters defined. Use this if you want to perform a new community search.</font></p>
<h4><a name="447603"> </a>Download</h4>
<p><a name="447609"> </a><font class="cont">Lets you download the selected search results data set in a tab-delimited text format. Use the checkboxes on the left to select specific entries to download, or use the check all button to select all of the results displayed on a page. To retrieve all of the results, you must click on each result page and select all for each page. When you click on download, you will retrieve all selected results from all pages. The format for downladed results is type [tab] name [tab] email [tab] country [tab]. </font></p>

<h4><a name="param"> </a>Summary</h4>
<p>
<a name="param2"> </a><font class="cont">The results page also displays the parameters you searched for, the number of records returned and the number of results displayed on the page.If multiple results pages are displayed you can move from page to page using the links at the bottom of the page.</font></p>
<p><a name="447610"> </a><font class="cont">The remainder of the Community Search Results window contains the search results data.</font></p>


<p><a name="447611"> </a><font class="cont"><img src="images/commres2.gif">
</font></p>

<h2><a name="447617"> </a>Community Search Results</h2>


<p><a name="447635"> </a><font class="cont">A numbered list of search results comprise the middle portion of this section. Each numbered line is a record. Records are numbered relative to the entire query results set so, for example, the second page of the query results shown above would contain 26 - 50.</font></p>
<h4>
<a name="access"></a><font color ="#003366" face ="Verdana, Arial, Helvetica, sans-serif">TAIR Accession</a></h4>
<p><a name="access2"></a><font class="cont">The unique identifier for an object, reference or community entry in TAIR's database. The accession is given as the object/reference/community type:unique numeric identifier.This accession can be used to create hyperlinks to TAIR detail pages (see <a href="/about/linktotair.jsp">Hyperlinking to TAIR DB</a>).</font>

<h4><a name="447636"> </a>Community type</h4>
<p><a name="447642"> </a><font class="cont">The type of community that matched the search criteria. The format is community type (person or organization) followed by subtype (e.g.organization: organization type or person:job title).</font></p>
<h4><a name="447676"> </a>Name</h4>
<p><a name="447681"> </a><font class="cont">Name of the community member (e.g. person's name or organization name).Clicking on the name will open the detail page for that community entry.</font></p>
<h4><a name="447641"> </a>Email</h4>
<p><a name="447648"> </a><font class="cont">The email address for the person or organization ,if known.</font></p>
<h4><a name="447638"> </a>Location(state,country)</h4>
<p><a name="447653"> </a><font class="cont">The state or province and country of the person or organizations address.</font></p>
<h4><a name="447625"> </a>Previous</h4>
<p><a name="447630"> </a><font class="cont">Accesses the set of results that fall immediately before the current set; e.g., if results 51 - 75 are currently shown in the window, results 26 - 50 will appear after you select <strong>previous</strong>. </font></p>
<h4><a name="447631"> </a>Next </h4>
<p><a name="447632"> </a><font class="cont">Accesses the set of results immediately following the current set; e.g., if results 51 - 75 are currently shown, results 76 - 100 will appear after you select <strong>next</strong>. </font></p>
<h4><a name="447634"> </a>Numbered links</h4>
<p><a name="447633"> </a><font class="cont">Let you jump forward or backward to a specific portion of the results list; e.g., if the page range is 50 records and you select 3, records 101 - 150 will appear.</font></p>

<!-- footer using external javascript file starts here -->
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("commsearch.jsp");
setNext("commdet.jsp");
writeFooter();
</script>
<!-- end footer -->

</body>
</html>
