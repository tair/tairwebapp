<html>

<head>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("dnares.jsp");
setNext("");
writeHeader();
</script>

<!-- End of header -->
</head>
<h2><a name="913144"> </a>DNA search result detail pages</h2><hr>
<font class="cont">Clicking on the name of the DNA type you searched for will take you to a detail page. The detail page will display different information depending on the type. Hyperlinks within the detail pages will take you to new pages detailing the related information.
<ul><b>Contents</b>
<li><a href="#clone">Clone details</a>
<li><a href="#end">Clone end details</a>
<li><a href="#vector">Vector details</a>
<li><a href="#library">Library details</a>
<li><a href="#dna">Pooled genomic DNA details</a>
<li><a href="#dna">Filter details</a>
</li></ul>
<hr></hr>
<a name="clone"></a><h2>Clone Details</h2>
<h4>Date Last Modified</h4>
<font class="cont">This indicates the last time this record was changed.</font>
<a name="447642"></a><h4>Clone Name</h4>
<a name="447642"> </a><font class ="cont">The name used in TAIR.</font>
<h4><a name="447676"> </a> Aliases</h4>
<font class ="cont">Synonym(s) of the clone name</font>
<h4>TAIR Accession</h4>
<font class="cont"> The unique identifier for the clone in TAIR. For information on using TAIR accessions for linking to TAIR detail pages see: <a href="/about/linktotair.jsp">Making Hyperlinks to TAIR DB</a>
<h4><a name="447641"> </a>Clone</h4>
<a name="447648"> </a><font class ="cont">This row displays information about certain clone characteristics.
<ul>
<li>insert type: Refers to the type of DNA that has been cloned into the vector.
<li>insert size : the length of the inserted DNA.
<li>host species: the host organism used to propigate the clone.
<li>host strain: the specific strain required to propigate the clone.
<li>vector type: the type of cloning vector used.
</li></ul>
<h4><a name="447638"> </a>Chromosome</h4>
<a name="447653"> </a><font class ="cont">The chromosome on which the clone is located.</font></p>
<h4><a name="447639"> </a> Antibiotic Resistance</h4>
<a name="447654"> </a><font class ="cont">The antibiotic name (and sometimes effective concentration) if the clone contains a selectible marker conferring resistance to an antibiotic.</font>

<h4><a name="447640"> </a>Sequence</h4>
<a name="447655"> </a><font class ="cont">Information about the sequence of the clone.
<ul>
<li>BioSource: the biological source of the sequence (e.g. genomic or mRNA).
<li>Source: where the DNA sequence information was obtained (e.g. GenBank).
<li>GenBank Accession: The unique identifier to the clone sequence in GenBank. Clicking on this link will take you to the GenBank record for the clone.
<li>Sequence: The type of sequence of the cloned DNA. Clicking on this link open a window displaying the sequence from TAIR database.
</li></ul></font>
<h4>Associated Gene/Locus</h4>
<font class="cont">Links to all gene models and loci contained in the clone.Clicking on the gene model name open a window displaying the gene detail page. Clicking on the locus name will open a window displaying the locus detail page.</font>
<h4>Annotation Unit</h4>
<font class="cont">BAC clones used for genomic sequencing that have been modified (e.g. sequences trimmed or added) to facilitate construction of contiguous, non-overlapping chromosome sequence.Clicking on the name of the Annotation unit will open a window containing details for that clone. </font>
<h4>Map Locations</h4>
<font class="cont"> Information about the locations of clones that have been placed on a map either by fingerprinting or sequence identity. All the information displayed on a row reflects data for one map location.
<ul>
<li>chromosome: the chromosome where the clone maps.
<li>map: The name of the map the clone maps to. Clicking on the name of the map will open a window displaying detailed information about the map.
<li> map type: 
<li> coordinates: the range of coordinates on the map where the clone maps.
<li> orientation: If known, the orientation of the clone, relative to the direction of the map (e.g. forward, reverse).
<li>attrib: Clicking on the details under attribution will open a window displaying information about who made the assignment to the map and how (if known).
</ul></font>
<h4>Library</h4>
<font class="cont">If the clone is part of a library of clones, this section displays the name of the  library. Clicking on the name will open a page displaying details about the library.</font>
<h4>Vector</h4>
<font class="cont">If the clones vector is in TAIR, this displays the name and type of the vector.Clicking on the vector name opens a page with details about the vector.</font>
<h4>Restriction Enzyme</h4>
<font class="cont">The restriction sites into which the cloned DNA was inserted.Clicking ont he enzyme name will display a page containing information about the specific restriction enzyme.</font>
<h4>External Link</h4>
<font class="cont"> Links to external sites related to the data type. For example, other databases or tools.</font>
<h4>Comments</h4>
<font class="cont">TAIR community comments can be made and displayed here. For more information about this feature see: <a href="addcomment.jsp">Adding and Viewing comments</a>.</font>
<h4>Attribution</h4>
<font class="cont">Displays the type, community name, reference, and date of the attribution for the clone.
<ul>
<li>name: links to the TAIR community page of the contributor.
<li> reference: Links to the record for the reference in TAIR.
</ul>
<h4>Stock</h4>
<font class="cont"> If the clone is available as a stock, the name of the stock is displayed. Click on the stock name to see details about the stock. Clicking on the "Order from ARBC" button will add this item to your list of stocks to order if you are logged in. If you are not yet logged in , you will be prompted to do so.</font>
<a name="end"></a><h2>Clone End Details</h2>
<h4>Date Last Modified</h4>
<font class="cont">This indicates the last time this record was changed.</font>
<a name="447642"></a><h4>Clone End Name</h4>
<a name="447642"> </a><font class ="cont">The name used in TAIR.</font>
<h4><a name="447676"> </a> Aliases</h4>
<font class ="cont">Synonym(s) of the clone end</font>
<h4>TAIR Accession</h4>
<font class="cont"> The unique identifier for the clone in TAIR. For information on using TAIR accessions for linking to TAIR detail pages see: <a href="/about/linktotair.jsp">Making Hyperlinks to TAIR DB</a>
<h4>Type</h4>
<font class="cont"> The type of clone end.</font>
<h4><a name="447641"> </a>Clone</h4>
<a name="447648"> </a><font class ="cont">This row displays information about the clone from which the clone end is derived.
<ul>
<li>name: the name of the clone. Clicking on the clone name will open a page displaying the clone details.
<li>vector type: The type of cloning vector used.
<li>insert type: Refers to the type of DNA that has been cloned into the vector.
<li>ABRC stock: If the clone is an ABRC stock, the stock name will be shown. Clicking on the stock name will open a page displaying the stock details.
</li></ul>
<h4><a name="447638"> </a>Chromosome</h4>
<a name="447653"> </a><font class ="cont">The chromosome on which the clone is located.</font></p>
<h4>Associated Gene/Locus</h4>
<font class="cont">Links to all gene models and loci contained in the clone.Clicking on the gene model name open a window displaying the gene detail page. Clicking on the locus name will open a window displaying the locus detail page.</font>
<h4>Map Locations</h4>
<font class="cont"> Information about the locations of clones that have been placed on a map either by fingerprinting or sequence identity. All the information displayed on a row reflects data for one map location.
<ul>
<li>chromosome: the chromosome where the clone end maps.
<li>map: The name of the map the clone end maps to. Clicking on the name of the map will open a window displaying detailed information about the map.
<li> map type: 
<li> coordinates: the range of coordinates on the map where the clone end maps.
<li> orientation: If known, the orientation of the clone end sequence, relative to the direction of the map (e.g. forward, reverse).
<li>attrib: Clicking on the details under attribution will open a window displaying information about who made the assignment to the map and how (if known).
</ul></font>
<h4>Map Links</h4>
<font class="cont">Hyperlinks to either the SeqViewer or MapViewer displaying the clone end of interest.</font>
<h4><a name="447640"> </a>Sequence</h4>
<a name="447655"> </a><font class ="cont">Information about the sequence of the clone.
<ul>
<li>BioSource: the biological source of the sequence (e.g. genomic or mRNA).
<li>Source: where the DNA sequence information was obtained (e.g. GenBank).
<li>GenBank Accession: The unique identifier to the clone sequence in GenBank. Clicking on this link will take you to the GenBank record for the clone.
<li>Sequence: The type of sequence of the cloned DNA. Clicking on this link open a window displaying the sequence from TAIR database.
</li></ul></font>
<h4>Comments</h4>
<font class="cont">TAIR community comments can be made and displayed here. For more information about this feature see: <a href="addcomment.jsp">Adding and Viewing comments</a>.</font>
<h4>Attribution</h4>
<font class="cont">Displays the type, community name, reference, and date of the attribution for the clone end.
<ul>
<li>name: links to the TAIR community page of the contributor.
<li> reference: Links to the record for the reference in TAIR.
</ul></font>
<a name="vector"></a><h2>Vector Details</h2>
<font class="cont">The following information may be displayed on a vector detail page.</font>
<h4>Date Last Modified</h4>
<font class="cont">This indicates the last time this record was changed.</font>
<a name="447642"></a><h4>Vector Name</h4>
<a name="447642"> </a><font class ="cont">The name used in TAIR.</font>
<h4><a name="447676"> </a> Aliases</h4>
<font class ="cont">Synonym(s) of the clone name</font>
<h4>TAIR Accession</h4>
<font class="cont"> The unique identifier for the vector in TAIR. For information on using TAIR accessions for linking to TAIR detail pages see: <a href="/about/linktotair.jsp">Making Hyperlinks to TAIR DB</a>
<a name="447654"> </a><font class ="cont">The antibiotic name (and sometimes effective concentration) if the vector contains a selectible marker conferring resistance to an antibiotic.</font>
<h4>Comments</h4>
<font class="cont">TAIR community comments can be made and displayed here. For more information about this feature see: <a href="addcomment.jsp">Adding and Viewing comments</a>.</font>
<h4>Attribution</h4>
<font class="cont">Displays the type, community name, reference, and date of the attribution for the vector.
<ul>
<li>name: links to the TAIR community page of the contributor.
<li> reference: Links to the record for the reference in TAIR.
</ul></font>
<h4>Stock</h4>
<font class="cont"> If the vector is available as a stock, the name of the stock is displayed. Click on the stock name to see details about the stock. Clicking on the "Order from ARBC" button will add this item to your list of stocks to order if you are logged in. If you are not yet logged in , you will be prompted to do so.</font>
<a name="library"></a><h2>Library Details</h2>
<font class="cont">The following information may appear on the library detail page.</font>
<h4>Date Last Modified</h4>
<font class="cont">This indicates the last time this record was changed.</font>
<a name="447642"></a><h4> Name</h4>
<a name="447642"> </a><font class ="cont">The name used in TAIR.</font>
<h4><a name="447676"> </a> Aliases</h4>
<font class ="cont">Synonym(s) for the library</font>
<h4>TAIR Accession</h4>
<font class="cont"> The unique identifier for the library in TAIR. For information on using TAIR accessions for linking to TAIR detail pages see: <a href="/about/linktotair.jsp">Making Hyperlinks to TAIR DB</a>
<h4>Library Description</h4>
<font class="cont">A brief description of the library.</font>
<h4>Insert Type</h4>
<font>Refers to the type of DNA that has been cloned into the vector.</font>
<h4>Insert size range</h4>
<font class="cont" the range or average size of inserts contained in the library.</font>
<h4>Vector</h4>
<font class="cont">If the vector is in TAIR, this displays the name and type of the vector.Clicking on the vector name opens a page with details about the vector.</font>
<h4>Comments</h4>
<font class="cont">TAIR community comments can be made and displayed here. For more information about this feature see: <a href="addcomment.jsp">Adding and Viewing comments</a>.</font>
<h4>Attribution</h4>
<font class="cont">Displays the type, community name, reference, and date of the attribution for the vector.
<ul>
<li>name: links to the TAIR community page of the contributor.
<li> reference: Links to the record for the reference in TAIR.
</ul></font>
<h4>Stock</h4>
<font class="cont"> If the vector is available as a stock, the name of the stock is displayed. Click on the stock name to see details about the stock. Clicking on the "Order from ARBC" button will add this item to your list of stocks to order if you are logged in. If you are not yet logged in , you will be prompted to do so.</font>
<a name="dna"></a><h2>Pooled genomic DNA and Filter Stock Details</h2>
<font class="cont"> All filters and pooled genomic DNAs are in TAIR as ABRC stocks. Therefore what you see is a stock detail page.</font>
<h4>Stock Number(#)</h4>
<font class="cont">The unique identifier assigned by the ABRC.</font>
<h4>TAIR Accession</h4>
<font class="cont"> The unique identifier used in TAIR. For information on using TAIR accessions for linking to TAIR detail pages see: <a href="/about/linktotair.jsp">Making Hyperlinks to TAIR DB</a>
<h4>Stock type</h4>
<font class="cont"> The type of stock: For DNA's this includes clone, library, clone set,vector, pooled Genomic DNA, genomic DNA, filter, amplified DNA, RNA. For seed stocks this includes strain,strain sets, pools and pool sets.</font>
<h4>Availabilty</h4>
<font class="cont">Indicates if the stock is available to order or not.</font>
<h4>Restricted to academic organization?</h4>
<font class="cont">Indicates of the stock  is only available to members of academic, non-profit institutions.</font>
<h4>Academic Fee</h4>
<font class="cont">Fee charged to members of academic institutions.</font>
<h4>Commercial Fee</h4>
<font class="cont">Fee charged to commercial for profit institutions.</font>
<h4>MTA release required?</h4>
<font class="cont"></font>
<h4>MTA release signature required before shipping?</h4>
<font class="cont"></font>
<h4>Library</h4>
<font class="cont">For filters that are from libraries in TAIR, this is a link to the library detail page.Click on the name of the library to see th e detail page.</font>
<h4>Description</h4>
<font class="cont">A brief description of the stock</font>
<h4>Comments</h4>
<font class="cont">TAIR community comments can be made and displayed here. For more information about this feature see: <a href="addcomment.jsp">Adding and Viewing comments</a>.</font>
<h4>Attribution</h4>
<font class="cont">Displays the type, community name, reference, and date of the attribution.
<ul>
<li>name: links to the TAIR community page of the contributor.
<li> reference: Links to the record for the reference in TAIR.
</ul>
<h4>Donors</h4>
<font class="cont">Links to the community detail page for the person or lab who dontated the stock.</font>
<h4>Order from ARBC/Order History</h4>
<font class="cont">If you are logged in, clicking on "order from ABRC will add this stock to your list to be ordered. Clicking on View Order History will display a list of people/groups who have placed orders for this stock.</font>
<!-- footer using external javascript file starts here -->
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("dnadet.jsp");
setNext("");
writeFooter();
</script>
<!-- end footer -->


</body>
</html>
