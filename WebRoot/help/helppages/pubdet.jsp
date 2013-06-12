<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("pubres.jsp");
setNext("");
writeHeader();
</script>

<!-- End of header -->
</head>

<h2><a name="pubdet1"></a>Using the  Publication Search Detail Pages</h2><hr>


<p><a name="pubdet2"></a><font class="cont">When you click title from the Publication Results this will open the Publication Detail Page in your browser window. The following fields may be displayed on the detail page, depending on data availability. For example, if there is no URL associated with this publication the URL band will not be displayed.</font>
<p><a name="pubdet3"></a><img src="images/pubdet1.gif">
<h4><a name="pubdet4"></a>Title</h4>
<p><a name="pubdet5"></a><font class="cont">This is the title of the publication as it appears in the journal, book,or conference proceedings.</font></p>
<h4><a name="pubdet6"> </a>Authors</h4>
<p><a name="pubdet7"> </a><font class="cont">This is the list of authors as it appears in the publication.</font></p>
<h4><a name="pubdet8"> </a>Community</h4>
<a name="pubdet9"> </a><font class="cont">This band lists the names and email addresses of TAIR community who are associated with the publication (as authors or editors). Clicking on the name will take you to the TAIR community detaail page for that person or organization. Note that not all authors/editors are linked to all publications.</font></p>
<h4><a name="pubdet10"> </a>Publication Source</h4>
<a name="pubdet11"> </a><font class="cont">This field indicates the type of publication. Values include: book, book chapter, abstract, research article,review and unknown. </font>
<h4><a name="pubdet12"></a>Year</h4>
<a name="pubdet13"></a><font class="cont">This corresponds to the publication date year. For example, the publication year for a journal or book.</font>
<p>
<h4><a name="pubdet14"></a>Volume</h4>
<a name="pubdet15"> </a><font class="cont">For publication sources that are published in multiple volumes, this is the volume number the publication appears in.</font>
<p>
<h4><a name="pubdet16"></a>Start Page</h4>
<a name="pubdet17"> </a><font class="cont">This corresponds to the first page number for the publication.</font>
<h4><a name="pubdet18"></a>TAIR Accession</h4>
<a name="pubdet19"> </a><font class="cont">The unique identifier for a publication in TAIR's database. The format is Publication:numeric id. This identifier can be used to create links from external websites/databases to TAIR detail pages. For information on making links see <a href="/about/linktotair.jsp">Hyperlinking to TAIR</a></font>
<h4><a name="pubdet20"></a>PubMedID</h4>
<a name="pubdet21"> </a><font class="cont">For papers that are obtained from PubMed downloads,this is the unique identifier for the PubMed record. Clicking on this link will open the PubMed record in your browser window.</font>
<h4><a name="pubdet22"></a>Abstract</h4>
<p>
<a name="pubdet23"> </a><font class="cont">This is the abstract for the publication. If the publication type is an abstract, this represents the entire text of the publication.</font>
<h4><a name="pubdet24"></a>URL</h4>
<a name="pubdet25"></a><font class="cont">For publications that are available on-line (e.g. electronic publications, websites, etc... ) this is the universal resource locator (URL). Clicking on this link will open the web page in your browser window. NOTE: While some publications are freely accessible on the web, others require a substription to view the full text. Your ability to view the full text may depend upon your personal or institutional subscriptions. </font>
<h4><a name="pubdet26"></a>Associated Keywords</h4>
<p><font class="cont">Keywords found in the paper are listed in this section. Clicking on any keyword will open a detail page for the keyword that includes a definition, synonyms and links to lists of other data annotated with the same keyword (such as genes and gene expression data). Each keyword detail page also includes links to annotations of children terms as well.</font>
<!-- footer using external javascript file starts here -->
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("pubres.jsp");
setNext("");
writeFooter();
</script>
<!-- end footer -->

</body>
</html>
