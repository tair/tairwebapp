<html>
<head>
<title>TAIR Help: Keyword Browser </title>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("");
setNext("annotdetail.jsp");
writeHeader();
</script>
<!-- End of header -->
</head>

<body>
<br>
<table ="602"><tr><td>
<h2><a name="browse"></a>Using the keyword browser (TreeViewer)</h2>
<p><font class"cont">The treeviewer can be used to browse the controlled vocabularies from the top-most level, down to the most granular (leaf) terms. Starting from each keyword category (or domain)- it is possible to traverse any branch from each parent to each child term. At any point you can choose to see a summary of data associated to the keywords. You can also search directly for a specific keyword, for help on keyword searching see <a href="keyser.jsp">Keyword Search Help</a>.</font>
<p>
<ul><b>Contents</b>
<li><a href="#browse1">Opening the browser</a>
<li><a href="#browse2">Navigating with the browser</a>
<li><a href="#browse3">Types of keyword parent-child relationships</a>
<li><a href="#browse4">Choosing types of associated data to display</a>
<li><a href="#browse5">Viewing associated data</a>
<li><a href="#browse6">The keyword definition display</a>
</li></ul>
<p>
<h2><a name="browse1"></a>Opening the browser</h2>
<p><font class="cont">Choose the keyword category you want to browse and click on the link.This will open a new window with the tree viewer displaying the category as the top most node.Alternatively, you can also access the TreeView from the keyword detail pages and the keyword search results. In these instances, the browser will open showing the specified term and its parentage. While browsing keywords, at any point you can choose to browse another category by clicking on the category name.</font>
<p><img src="images/key2.gif" border="1"><p>

<h2><a name="browse2"></a>Navigating with the browser</h2>
<p><font class="cont">Terms that have children are indicated by a <img src="images/more.gif"> more symbol. Clicking on the more symbol will expand the parent node to reveal the children. The open node will now display a <img src="images/less.gif">. To collapse a node, click on the <img src="images/less.gif"> less symbol.</font>

<h4><a name="browse3"></a>Types of keyword parent-child relationships</h4>
<p><font class="cont"><img src="images/isa.gif"><b>is a</b>: the child term is a subtype of the parent term.<br>
<img src="images/partof.gif"><b>part of</b>: the child term is a component or part of the parent term.<br> For example, the dark reactions of photosynthesis is a TYPE of carbohydrate biosynthesis AND a part of the over all process of photosynthesis. </font>
<p><img src="images/keyword7.gif" border="1"><p>
<h4><a name="browse4"></a>Choosing types of associated data to display</h4>
<p><font class="cont">To select a datatype to display click on the appropriate button in the data type selector and press the 'Display' button. The number and type of associated data will now appear to the right of the keyword in the browser window. If no data displays, this means that no data is associated to the term or its children.</font>
<h4><a name="browse5"></a>Viewing associated data</h4>
<p><font class="cont">Clicking on any of the named data types will open a new window containing a summary page showing all the data (e.g. genes) associated to the term as well as data associated to any children term. For example to see a list of genes annotated with the term click on the data to term link. Clicking on the data to children link will show all of the genes annotated to terms that are CHILDREN of the parent term. For a description of the annotation details and how to use them see <a href="annotdetail.jsp">Annotation Detail Page Help</a></font>
<p><img src="images/key4.gif" border="1"><p>
<h4><a name="browse6"></a>The keyword definition display</h4>
<p><font class="cont">When browsing keywords, the definition displayed in this section is the definition of the 'current' parent term. By default, when starting to browse, the parent term is same as the category term.When opening and closing nodes, the definition displayed is for the current open parent node. However, when the tree viewer is accessed from a keyword detail page, the definition corresponds to current child term (see <a href="keyser.jsp">Keyword help</a>for more about the keyword details). </font>

</td></tr></table>
<!-- footer using external javascript file starts here -->
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("");
setNext("annotdetail.jsp");
writeFooter();
</script>
<!-- end footer -->
</body>
</html>