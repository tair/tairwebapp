<%@page import="org.tair.utilities.*"%>
<html>
<head>
<title>Usign the Microarray Experiment Search Results</title>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("exper_search.jsp");
setNext("exper_detail.jsp");
writeHeader();
</script>

<!-- End of header -->
</head>

<body>
<br>

<h2><a name=""> </a>Understanding and using the Microarray Experiment Search Results</h2>
<font class ="cont"><a name=""> </a>After clicking on the submit button, the results of your query will be displayed in your browser. This page describes how to use the fields displayed to find more detailed information about the experiments and to find related information. It also describes how to download results as a tab delimited file.</font>
<ul>Contents
<li><a href="#expres1">Finding the experiment details</a></li>
<li><a href="#expres2">Finding information about the experimenter</a></li>
<li><a href="#expres3">Using the experiment category field</a></li>
<li><a href="#expres4">Using the experimental goals field</a></li>
<li><a href="#expres5">Using the experimental variables field</a></li>
<li><a href="#expres6">Downloading the list of results</a></li>
</ul>
<p>
<h4><a name="expres1"> </a>Finding the experiment details</h4>

<font class="cont"><a name=""> </a>To view detailed information about the experiment click on the name of the experment that is displayed in the first column. See <a href="exper_detail.jsp"> Using the experiment details</a> for help with understanding the details.</font>
<p>
<h4><a name="expres2">Finding more about the experimenter.</a></h4>
<font class="cont">Click on the name of the experimenter to display their community profile page in TIAR. This includes contanct information which you can use to contact the experimenter for more information.See <a href="commdet.jsp">Using the Community Details</a> for help understanding the community profile pages.</font>
<p>

<h4><a name="expres3"></a>Experiment categories</h4>
<font class="cont">Clicking on this link will display the keyword detail page for the corresponding experimental category term. From the detail page you can easily find all other microarray experiments that fall into the same category.See <a href="keyser.jsp#key5">Using the Keyword details</a> for more about the keyword detail pages.</font>
<p>
<h4><a name="expres4"></a>Experimental Goals</h4>
<font class="cont">Clicking on this link will display the keyword detail page for the corresponding experimental goal term. From the keyword details you can find other experiments having the same experimental goal, find genes annotated to the term and publications.See <a href="keyser.jsp#key5">Using the Keyword details</a> for more about the keyword detail pages.</font>
<p>
<h4><a name="expres5"></a>Experimental Variables</h4>
<font class="cont">Clicking on this link will display the keyword detail page for the experimental variable term.From the keyword details you can find other experiments which have the same variable condition.See <a href="keyser.jsp#key5">Using the Keyword details</a> for more about the keyword detail pages.</font>
<p>
<h4><a name="expres6"></a>Downloading the results set.</h4>
<font class="cont">The results of the query can be downloaded as a tab-delimited text file which can then be opened in a word processing or spreadsheet program. To download results first check the records you wish to save. Select all results (if on muliple pages check all relevant results for each page) and then click on the download button. The text file contains the following fields:<br/>
Tair accession (which is a unique id for the experiment)<br/>
Experiment name<br/>
Experimenter name(s)<br/>
Experiment category<br/>
Experimental factor(s)<br/>
Description<br/>
For help in opening the files See the <a href="/help/faq.jsp#download">How to open downloaded files FAQ</a></font>
<p>

<!-- footer using external javascript file starts here --> 
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("exper_search.jsp");
setNext("exper_detail.jsp");
writeFooter();
</script>
<!-- end footer -->
</body>
</html>
