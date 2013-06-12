<%@page import="org.tair.utilities.*"%>
<html>
<head>
<title>TAIR Help:Protein Search</title>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("");
setNext("protres.jsp");
writeHeader();
</script>

<!-- End of header -->
</head>

<body>
<br>

<p>
<a name="intro"></a><h2>Using the Protein Search</h2>
<p>
<a name=""></a><font class ="cont">TAIR's Protein search allow you to search for proteins with a variety of parameters. You can perform a simple search by name, restrict your search to proteins having specific physio-chemial properties and domains,as well as limiting your search to proteins encoded in specified regions of the genome. </font>
<p>
<a name="name"></a><h2>Search by Name</h2>
<p>
<a name=""></a><font class="cont">You can search for proteins by the following names:</font>
<p>
<ul>
<li>Locus name: For sequenced genes, the locus name corresponds to the orf name determined by AGI orf naming convention. For genetic loci (e.g. genes identified by mutation but not yet associated with a sequence) the name corresponds to the accepted symbolic name.AGI orf names have the format AT(1-5 or C,M)gXXXXXX.Where the value in parenthesis here corresponds to the chromosome number or organelle genome.
<li>Gene Symbol:The (usually) three letter symbolic name for the gene.
<li>Product Name: The name of the protein (e.g. Agamous protein or Dihydroflavanol 4-reductase).
<li>Gene Description: Brief summaries of the gene which encodes the protein of interest.This option is useful for including aspects of protein function or localization that are not indicated in the gene or product name.
<li>GenPeptID: Use this if you know the unique GenBank identifier for the protein.
</li></ul>
<p>
<a name="struc"></a><h2>Search by Structural Class Type</h2>
<p>
<a name=""></a><font class ="cont">This feature allows you to restrict your search to include only those proteins belonging to the specified structural class<%=DefinitionsLookup.createPopupLink("StructuralClassType","structural_class_type_id")%>. You may select multiple options within each parameter by clicking on one selection and then clicking on additional ones while holding down either the CTRL key (PCs) or the Apple key (Mac).</font>
<p>
<font class="cont">Structural class assignment was performed from annotations of SCOP's superfamilies using HMM models against TIGR's 4.0 Release by Drs JulianGough and Martin Madera at SCOP database. More information can be found
in the following papers.</font>
<p>
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=11697912&dopt=Abstract">Gough, J., Hughey ,R., Karplus ,K., and Chothia ,C.(2001). Assignment ofgenome sequences using a library of hidden Markov models that represent all proteins of known structure. J Mol Biol. 2001 Nov 2;313(4):903-19</a>
<p>
<a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=11752312&dopt=Abstract">Gough, J., Chothia, C.(2002).SUPERFAMILY:HMMs representing all proteins of known structure. SCOP sequence searches, alignments, and genome assignments. Nucl. Acids Res., 2002 Jan 1;30(1):268-72</a></font>
<p>
<a name="prop"></a><h2>Search by Physio-chemical Properties</h2>
<p>
<a name=""></a><font class="cont">You can limit your search to include only proteins having specific physical/chemical properties.</font>
<p>
<a name="prop1"></a><h4>Length</h4>
<p>
<a name=""></a><font class="cont">The calculated length of the translated protein in amino acids. This does not include lengths after processing such as cleavage of signal peptides.</font>
<p>
<a name="prop1"></a><h4>Calculated MW</h4>
<p>
<a name=""></a><font class="cont">The predicted molecular weight in kiloDaltons. Molecular weights were calculated using the ATH1.pep file provided by TIGR including all predicted, experimentally verified and hypothetical proteins using the Bioperl function get_mol_wt (found in the SeqStats object at www.bioperl.org).</font>
<p>
<a name="prop2"></a><h4>Calculated PI</h4>
<p>
<a name=""></a><font class="cont">The predicted isoelectric point.The isoelectric point is the point at which, on an isoelectric focusing gel the pH at which a protein has a net charge of zero. The pI of a protein is determined by its amino acid composition-and the net contribution of positive and negative charges of the side chains.The calculated pIs were determined using the ATH1.pep file from TIGR and the iep program from  EMBOSS <a href="http://www.hgmp.mrc.ac.uk/Software/EMBOSS/">www.hgmp.mrc.ac.uk/Software/EMBOSS/</a>.Values are between pH 1-14.</font>
<p>
<a name="domain"></a><h2>Domains</h2>
<p>
<a name=""></a><font class="cont">Use this option if you want to restrict your search to include only proteins having a specified domain composition.The drop down menus allow you to select the number of occurances of each domain along with the syntax for identifying the domain. For example, to search for proteins that have one or more occurances of domain PS00027 do the following: <br />
<ol>
<li> Select the greater than symbol in the first column.</li>
<li> Enter one in the adjacent input box.</li>
<li> Select Prosite from the domain type drop down menu</li>
<li>Choose exact match</li>
<li>Enter the name of the domain (PS00027)</li>
</ol>
</p>
<p> If searching for more than one domain, the search is treated as a logical AND. Therefore, inputing  PROSITE domain PS00027 AND PFAM domain PF04618 will limit your search to proteins having BOTH domains.</p>
<p> Protein domains are conserved regions of amino acid /structural similarity in protein sequences. Domains generally represent functional units having some form of biological activity. Domains are useful in grouping proteins with little overall sequence similarity.This search allows you to specify both the type and number of domains and use either the domain name , or unique domain identifier. Leaving this option blank will include all proteins in your search.The domains were identified using the interproscan.pl program and INTERPRO databases supplied with the program. For more information see: <a href="http://www.ebi.ac.uk/interpro">INTERPRO database</a>.</font>
<p>
<a name="time"></a><h2>Restrict by Time</h2>
<p>
<a name=""></a><font class="cont">Use this option to limit  your search to protein records that are new or have been updated within the specified time period.</font>
<p>
<a name="loc"></a><h2>Restrict by Location</h2>
<a name=""></a><font class="cont">This option allows you to restrict your search to proteins encoded by loci on a particular chromosome and within a specified range. You can search any one of the five nuclear chromosomes or any of the organellar genomes (mitochondrial and chloroplast).</font>
<a name="loc2"></a><h4>MapType</h4>
<p>
<a name=""></a><font class="cont">The available map for searching proteins is the AGI sequence map.</font>
<p>
<a name="loc3"></a><h4>Range</h4>
<a name=""></a><font class="cont">Lets you specify a range search by the upper and lower bounds (when you select "Between") or a center point (when you select "Around"). The value is physical distance (kb). When you select "Between" from the drop-down menu, your search will be within the range defined by two entities or positions on a particular map. When you select "Around" from the drop-down menu, your search will be the area +/-10 cM and/or +/- 100 kb from the specified entity or position. When you choose search around, the second value input and units options are disabled. </font>
<p>

<a name="out1"></a><h2>Output Options</h2>

<h4><a name="out2"></a>Number of records </h4> 
 <a name=""> </a><font class="cont">You can select to display 25, 50, 100 or 200 result items on a single page. More results per page will take longer to load.</font></p> 
<h4><a name="out3"></a>Sort by</h4>
<a name=""> </a><font class="cont">You can choose to sort the results by protein name, position of the locus, or locus name.</font>

<!-- footer using external javascript file starts here --> 
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("");
setNext("protres.jsp");
writeFooter();
</script>
<!-- end footer -->
</body>
</html>
