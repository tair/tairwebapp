<html>
<head>
<title>TAIR Help:Ecotype Search</title>
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

<p>
<a name="eco1"></a><h2>Using the Ecotype/Species Search</h2>
<p>
<a name="eco2"></a><font class ="cont">The Ecotype/Species search allows you to search TAIR's database for natural variants of Arabidopsis thaliana,other genera and species, and to place orders for seeds that are ABRC stocks. You can perform simple searching by name or add certain restrictions to narrow down the results. If you want to find other types of germplasm (e.g. transgenic strains, mutant strains, mapping strains, please use the  <a href="/servlets/Search?type=germplasm&search_action=new_search">Germplasm Search</a>.  For help on searching for other germplasms see <a href="germsearch.jsp">Germplasm Search Help</a></font>
<p>
<a name="eco3"></a><h2>Search by Name</h2>
<p>
<a name="eco4"></a><font class="cont">Use the Species drop down menu to select from the available genera and species. The default is set for Arabidopsis thaliana.</font>
<font class="cont">
<ul>
<li>Ecotype abbreviated name : The short version of the ecotype name (e.g. Col, Nd,La).
<li>Ecotype full name: The full name of the ecotype (e.g.Columbia, Niederzenz, Landsberg).Usually the names are based on the location of the collection site (e.g. town, state, district, province).
<li>Stock number: The unique stock number designated by the ABRC (e.g. CS20).
<li>Donor last name: Last name of the person who donated the stock (e.g.Kranz). Use this if you want to find a set of ecotypes donated by a specific person.
<li>Description:Use this field to search within the description. For example, to find germplasms that have 'yellow-green leaves' enter CONTAINS 'yellow-green leaves' in this box.
</ul></font>

<a name="eco5"></a><h2>Restrict by Collection Details</h2>
<font class="cont">
<ul>
<li>Country of Collection : Refers to the country in which the sample was collected.
<li>Location/City/Region: Refers to a more specific location within the country where the sample was collected.
<li>Habitat: Refers to the immediate environment that the sample was collected in, for example, sandy ground.
</ul></font>

<a name="eco6"></a><h2>Output Options</h2>

<h4><a name="eco7"></a>Number of records </h4> 
 <a name="out8"> </a><font class="cont">You can select to display 25, 50, 100 or 200 result items on a single page. More results per page will take longer to load.</font></p> 
<h4><a name="eco8"></a>Sort by</h4>
</a><font class="cont">Choose to have your output ordered by ecotype full name, country or location.</font>

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
