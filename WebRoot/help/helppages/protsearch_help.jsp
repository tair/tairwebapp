<%@page import="org.tair.utilities.*"%>
<html>
<head>
<title>Protocol Search Help</title>
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

<h2><a name=""> </a>Using TAIR's Protocol Search</h2>

<font class ="cont"><a name=""> </a>This document describes how to use TAIR's Protocol search to find techniques and methods for plant genetics, molecular biology, growth and other methods.</font>
<p />
<ul>Contents
<li><a href="#prot1">Using the Protocol Search</a></li>
<li><a href="#prot2">Understanding the Protocol Search Results</a></li>
<li><a href="#prot3">Understanding and using the protocol detail pages</a></li>
</ul>



<h2><a name="prot1"> Using the Protocol Search</a></h2>

<font class="cont"><a name=""> </a>The Protocol Search can be used to find experimental protocols in TAIR by description, title, authors and keyword. Protocols in TAIR are available as downloadable PDF (portable document format) and text documents from the FTP site. The protocols include contributions from TAIR's community and compilations from a variety of sources.</font>
<p>
<h2>Searching by title, description and authors</h2>
<p><font class="cont"> Choose either title, author or description from the drop down menu. For an exact search, choose the 'exactly' option from the second drop down menu. For broader, less exact searching, use the contains, starts with or ends with options. When searching for more than one word in the title, description or authors, be aware that the search functions as an implicit AND. For example, searching for any protocol description containing the term 'transformation' and 'plant' will identify protocols that contain BOTH terms in the description.</font></p>
<h2>Searching by keyword</h2>
<p><font class="cont">Protocols can also be searched or browsed by keywords. The keywords used to describe protocols are a controlled vocabulary of methods. To search for more than one method, select the keyword and hold down either the CTRL key (PCs) or the Apple key (Mac).</font></p>
<h4>Output options</h4>
<p><font class="cont">Results can be sorted by title or author. The default is title. You can also select the number of results to display on the results page (25,50, 100 or 200) , the default option is 25 records.</font></p>
<h2><a name="prot2">Understanding and Using the Protocol Search Results</a></h2>
<p><font class="cont">After clicking the submit button, the results of your query are returned to your browser window.</font></p>
<h4>Finding the protocol</h4>
<p><font class="cont">Each protocol that matches the query is listed in a separate section in the results display. Click on the title of the protocol to view the detail page to see a full description of the protocol and to download the protocol from TAIR.</font></p>
<h4>Downloading the results</h4>
<p><font class="cont"> The results of the query can be downloaded as a tab delimited text file.Use the check boxes to select the protocols from the list to download and then click on the 'download' button. The downloaded fields are: Authors (who wrote the protocol), Title, Description, PubMed id (for protocols from papers, this is the paper),Usage (what the protocol can be used for), Methods  and Keywords.</p>
<h2><a name="prot3">Understanding and Using the Protocol Details</a></h2>
<p><font class="cont">Clicking on the name of the protocol from the search results page will display a new page showing the detailed record for the protocol. From this page you can read the entire description, download the protocol in pdf (and in some cases view as html file),and find the source of the protocol. The details include keywords for the method(s) described in the protocol including specific techniques and experimental assays the methods can be applied towards. For detailed information about each of the fields shown on the detail page, click on the question mark next to each field.</font></p>
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
