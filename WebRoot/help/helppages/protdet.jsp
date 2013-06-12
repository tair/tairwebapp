<html>
<head>
<title>TAIR Help:Protein Details</title>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("protres.jsp");
setNext("");
writeHeader();
</script>

<!-- End of header -->
</head>

<body>
<br>

<p>
<a name="det1"></a><h2>Using the protein detail pages</h2>
<p>
<a name=""></a><font class ="cont">The protein detail page displays information about the protein and related data.</font>
<p>
<a name="det2"></a><h4>Date last modified</h4>
<p>
<a name=""></a><font class="cont">This is the same as the last updated date. The date the record was last updated in TAIR. For example, if the sequence has been modified based on experimental verification of a cDNA sequence, or if a new domain has been added. Also, if corrections have been  made, the date will reflect that the record is changed.</font>
<p>
<a name="det3"></a><h4>TAIR accession</h4>
<p>
<a name=""></a><font class="cont">Uniquely identifies a record in TAIR's database. You can use this to create links from a web page to the detail page for the protein record. See the section on <a href="/about/linktotair.jsp">Hyperlinking to TAIR</a>.</font>
<p>
<a name="det4></a><h4>External IDs</h4>
<a name=""></a><font class="cont">The external ids link to a variety of protein databases where you can find additional information about the protein. The external databases include SwissPROT, Protein Information Resource (PIR) and GenPept at NCBI.Clicking on these links will take you from TAIR's database to the detail pages for the other database records for the same protein.</font>
<p><a name="det5></a><h4>Properties</h4>
<p>
<a name=""></a><font class="cont">This section displays the calculated properties for molecular weight (in Daltons)and isoelectric point.</font>
<p>
<p><a name="det6></a><h4>Domains</h4>
<p>
<a name=""></a><font class="cont">All domains identified by TAIR using computational methods are displayed in this section. The database field is the source database for the domain structure. The accession is the unique identifier for the domain in the source database. The INTERPRO field displays the identifier for the corresponding domain in the INTERPRO database. The position field displays the location of the domain in the amino acid sequence. If more than one domain is foudn in the sequence, all locations for that domain are found in the same band.</font>
<p>
<a name="det7></a><h4>Sequence</h4>
<p>
<a name=""></a><font class="cont">The amino acid sequence can be copied and pasted onto a clipboard for use in sequnce similarity searching or to save as a text record.To obtain large sets of protein sequences, or any sequence in FASTA format, use the <a href="/tools/bulk/sequences/index.jsp">Sequence Bulk Download</a>.</font>
<p>
<a name="det8></a><h4>Associated Genes</h4>
<p>
<a name=""></a><font class="cont">All gene models associated with the protein are displayed here. Click on the Gene Model name to see the detail page for the gene model. Click on the Locus name to see the locus detail page. The seqviewer link takes you too a 200 Kb view of the genome ,centered on the locus. </font>
<p>
<a name="det9></a><h4>Comments</h4>
<p>
<a name=""></a><font class="cont">Comments about the protein made by members of the community are displayed here. You can add your own comments to this record by clicking on the "add my comment" button. For more information about reading and adding comments, see <a href="addcomment.jsp">About Adding Comments to Detail Pages</a>.</font>
<p>
<a name="det10></a><h4>Comments</h4>
<p>
<a name="det11></a><h4>Attribution</h4>
<p>
<a name=""></a><font class="cont">This section displays information about the community sources of information and how they contributed. Click on the link in the name field to display the community record for the person or organization who contributed the data. </font>

<!-- footer using external javascript file starts here --> 
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("protres.jsp");
setNext("");
writeFooter();
</script>
<!-- end footer -->
</body>
</html>
