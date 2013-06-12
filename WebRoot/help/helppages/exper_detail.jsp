<%@page import="org.tair.utilities.*"%>
<html>
<head>
<title>Using the Microarray Experiment Details</title>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("exper_result.jsp");
setNext("");
writeHeader();
</script>

<!-- End of header -->
</head>

<body>
<br>

<h2><a name=""> </a>Understanding and Using the Microarray Experiment Details</h2>

<font class ="cont">The microarray experiment detail pages are broken out into different sections. Use the tabs at the top of the page to navigate through the different information sections. To view definitions for terms click on the <img src="/images/questionmark.gif"/> next to the term.To view the entire page, click on the View All tab. Note: For experiments with large amounts of data,the view all option may take a long time to load. Click on the table of contents topic you wish to start with.</font>
<p>

<ul>Contents
<li><a href="#experdet1">Experiment Summary</a></li>
<li><a href="#experdet2">Samples</a></li>
<li><a href="#experdet3">Slides and Datasets</a></li>
<li><a href="#experdet4">Array Design</a></li>
<li><a href="#experdet5">View All</a></li>
</ul>
<h2><a name="experdet1"> </a>Experiment Summary</h2>

<font class="cont"></font>
<p>
<h4>Submission Number<%=DefinitionsLookup.createPopupLink("ExpressionSet","submission_number")%></h4>

<font class="cont">This accession number can be used by submitters to refer to a specific microarray experiment set submitted to TAIR. The Submission number can be used for publications, similar to GenBank accessions, to refer to a microarray experiment in TAIR.</font>
<p>

<h4>TAIR Accession</h4>

<font class="cont">The TAIR accession is used to uniquely identify a record in TAIR and for making hyperlinks to TAIR detail pages. Read the <a href="/about/linktotair.jsp"> linking to TAIR page</a> for more information about hyperlinking to TAIR pages.</font>
<p>
<h4>Experimenter(s)</h4>

<font class="cont">Clicking on the researchers name(s) in this section will display the persons TAIR community profile. From this page you can find their contact information such as email address, telephone and postal address.</font>
<p>
<h4>Experimental Variables<%=DefinitionsLookup.createPopupLink("RelationshipType","experimental variables")%></h4>

<font class="cont">Clicking on the variable name will open a new page showing the keyword details for the experimental variable(s).The keyword detail page will include a definition of the term, and annotations of all other objects to the term such as genes, other microarray experiments, publications and more. Use this link to find other experiments with similar experimental variables.</font>
<p>

<h4>Variable type</h4>
<font class="cont">Variables are classified according to types which include, Plant Material, Probe Type, Environmental Condition or Harvesting Time. This information can be used to identify the appropriate sections in the Sample pages to find the variable condition.</font>
<p>
<h4>Experiment Category<%=DefinitionsLookup.createPopupLink("RelationshipType","experiment_category")%></h4>
<font class="cont">Experiments are grouped into categories based upon the type of experimental method employed. Types include the following:</font>
<b>abiotic treatment</b>:Any method that tests the effect of a physical environmental condition on an organism. Examples are: temperature and light.<br/>
<b>biotic treatment:</b>Any method that tests the effect of an agent due to, or derived from, living organisms on any other organism.<br/>
<b>chemical treatment</b>:Any treatment that tests the effect of a chemical substance on an organism, excluding plant hormones and nutrients.<br/>
<b>ecotype comparison</b>:Any method that tests differences among ecotypes.<br/>
<b>hormone treatment</b>:Any treatment that tests the effect of hormones on an organism<br/>
<b>non-wild type comparison</b>:Any method that tests differences between a wild type and a non-wildtype organism, or between non-wild types. Examples are wildtype versus mutant, wildtype versus transgenic, and transgenic against transgenic.<br/>
<b>nutrient treatment</b>:Any treatment that tests the effect of nutrients on an organism.<br/>
<b>tissue comparison</b>:Any method that tests anatomical or developmental differences among tissues.<br/></font>
<p>
<p/>
<h4>Experiment Goals</h4>
<font class="cont">Clicking on the experimental goal term will display a keyword detail page which includes a definition of the term and links to other experiments having the same experimental goal term. The keyword detail pages also include links to other types of data associated to the term such as genes and publications.</font>
<p/>
<h4>Description</h4>
<font class="cont">The description is an abstract for the experiment and is supplied by the submitter. It summarizes the main points of the experiment.</font>
<p/>
<h4>Data Counts</h4>
<font class="cont">This section summarizes the number of main types of data associated to the experiment that are stored in TAIR. This includes the total number of slides, the number of slides that are replicate sets, and the number of biological samples used in the experiment.</font>
<p/>
<h2><a name="experdet2"> </a>Samples</h2>

<font class="cont">This section contains information about the biological sample material used as the source of RNA.</font>
<p>
<h4>Sample Description</h4>
<font class="cont">The data submitters summary of the source of the RNA sample.</font>
<p/>
<h4>Organism</h4>
<font class="cont">Refers to the organism which was the source of the RNA used to make the cDNA.</font>
<p/>
<h4>Tissue Origin<%=DefinitionsLookup.createPopupLink("BioSample","biomaterial_type")%></h4>
<font class="cont">Used to distinguish between RNA samples derived from a plant grown from seed or callus tissue or cultured cells.This is distinct from the actual parts of the plant used to make the RNA.</font>
<p/>
<h4>Germplasm<%=DefinitionsLookup.createPopupLink("Germplasm","class")%></h4>
<font class="cont">Clicking on this link will display the TAIR germplasm detail page for the corresponding plant material used to generate the RNA sample.</font>
<p/>
<h4>Anatomy Keywords<%=DefinitionsLookup.createPopupLink("KeywordType","type")%></h4>
<font class="cont">Keywords used by TAIR curators to describe the plant parts used to generate the RNA sample.Clicking on the term will display a keyword detail page which includes links to other experiments which used the same type of body parts for making RNA. The detail pages also displays links to other experiments which used the same body parts for making RNA.</font>
<p/>
<h4>Anatomy Description</h4>
<font class="cont">Data submitters description of the parts of the plant used to generate the RNA sample.</font>
<p/>
<h4>Development Keywords<%=DefinitionsLookup.createPopupLink("KeywordType","type")%></h4>
<font class="cont">Keywords used by TAIR curators to describe the developmental stage of the plant or organ from which the RNA sample was extracted. Clicking on the keyword will display a detail page which includes annotations of other experiments to the term as well as annotations of other objects such as genes or publications.</font>
<p/>
<h4>Developmental Stage Description</h4>
<font class="cont">Data submitters description of the developmental stage of the plant or organ which was used to generate the RNA sample.</font>
<p/>
<h4>Sample Type<%=DefinitionsLookup.createPopupLink("Glossary","sample_type")%></h4>
<font class="cont">Distinguishes between reference (control) RNA samples and test (variable) RNA samples.</font>
<p/>
<h4>Probe Type and Concentration</h4>
<font class="cont">This refers to the source of the template RNA used to generate the labelled cDNA. Typically either RNA or mRNA. The concentration is shown in parenthesis (if known).</font>
<p/>
<h4>Labeling Protocol</h4>
<font class="cont">Click on this link to display the TAIR protocol detail page which describes the method for labeling the cDNA></font>
<p/>
<h4>Environmental conditions and treatments<%=DefinitionsLookup.createPopupLink("EnvironmentalCondition","class")%></h4>
<font class="cont">The table in this section displays all of the environmental conditions and treatments used. If the condition is an experimental variable, this is noted in the last column of the table.</font>
<p/>
<h2><a name="experdet3"> </a>Slides and Datasets</h2>

<font class="cont">This section contains information about the individual slides/hybridizations for the experiment including normalized data for downloading.</font>
<p>
<h4>Slide Details</h4>
<font class="cont">Information about the individual slides used in the experiment including analysis methods.</font>
<p/>
<h4>Slide Name/Description.</h4>
<font class="cont">Names and descriptions for the slides, supplied by submitters.<font color="red">Note:</font> Slides marked with an asterisk<%=DefinitionsLookup.createPopupLink("Glossary","asterisk")%> were not included in TAIR's analysis. The asterisks indicate slides which were flagged by the submitter as having spatial bias. For some of these slides, the spatial bias was eliminated by TAIR's normalization method.</font>
<p/>
<h4>External ID</h4>
<font class="cont">Unique accession for finding the hybridization data in other databases. Where possible, this is linked to the corresponding details in the other database.For example for the AFGC data, this corresponds to the Stanford Microarray Databases (SMD) experimental ID.</font>
<p/>
<h4>Replicate number/name<%=DefinitionsLookup.createPopupLink("HybDescription","class")%></h4>
<font class="cont">For sets of hybridizations that are replicates, they are grouped into replicate sets. Each replicate set has a name and description and a number. When two replicate sets are the same reverse dye of each othe, the reversed set is indicated in the 'reverse of replicate column'. Click on the replicate number to view the detailed information about the replicate.</font>
<p/>
<h4>Replicate type<%=DefinitionsLookup.createPopupLink("Glossary","replicate_type")%></h4>
<font class="cont">Used to distinguish technical replicates from biological replicates.</font>
<p/>
<h4>Reverse Replicate Number<%=DefinitionsLookup.createPopupLink("HybDescription","reverse_id")%></h4>
<font class="cont">Clicking on the number in this column will center the display on the reverse replicate slide.It can be used to quickly navigate to the corresponding replicate section.</font>
<p/>
<h4>Sample<%=DefinitionsLookup.createPopupLink("BioSample","class")%></h4>
<font class="cont">Clicking on this link will go to the Sample display page centered on the sample used to hybridize with the current slide.</font>
<p/>
<h4>Experimental Variable</h4>
<font class="cont">Click on the link to display the details for the experimental variable keyword.</font>
<p/>
<h4>Label<%=DefinitionsLookup.createPopupLink("LabeledSample","label")%></h4>
<font class="cont">Used to indicate the chemical used to label each sample in the hybridization.</font>
<p/>
<h4>Download user normalized data</h4>
<font class="cont">Click on this link to begin downloading the submitters analyzed data for this hybridization. Downloaded files are compressed and must be <a href="/help/faq.jsp#microarray">decompressed</a> before opening.. See the section on Analysis Information for information on how the data was analyzed.</font>
<p/>
<h4>Download TAIR normalized data</h4>
<font class="cont">Click on this link to begin downloading a tab-delimited file of data for this hybridization. The <a href ="/tools/bulk/microarray/analysis/index.jsp">TAIR normalized data</a> uses the method of<a href="http://nar.oupjournals.org/cgi/content/full/30/4/e15">Yang,et al, 2002</a> . Downloaded files are compressed and must be <a href="/help/faq.jsp#microarray">decompressed</a> before opening. See the section on Analysis Information for information on how the data was analyzed.</font>
<p/>
<h4>Analysis Information</h4>
<font class="cont">This section contains information about the software and parameters used by the data submitter to analyze the slide data.</font>
<p/>

<h2><a name="experdet4">Array Design<%=DefinitionsLookup.createPopupLink("ArrayDesign","class")%></a></h2>

<font class="cont">This section contains information about the array used (e.g. Affymetrix 23 K).</font>
<p>
<h4>Array Information</h4>
<font class="cont">This section displays information about the design of the arrays used in the experiment. The data includes the specific name of the array, the manufacturer, platform, surface type and the total number of elements contained on the array. The array name can be used when searching for all other  experiments which use the same array design.</font>
<p/>
<h4>Hybridization Information<%=DefinitionsLookup.createPopupLink("HybDescription","hyb_protocol_ref_id")%></h4>
<font class="cont">Clicking on this link will display a new page showing the detailed method used for hybridization.</font>
<p/>


<h2><a name="experdet5"> </a>View All</h2>

<font class="cont">Clicking on this tab will change the display to show ALL of the data associated with the experiment. <font color="red">Note:</font>for experiments with a lot of data, it may take a long time for the page to load.</font>
<p>

<!-- footer using external javascript file starts here --> 
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("exper_result.jsp");
setNext("");
writeFooter();
</script>
<!-- end footer -->
</body>
</html>
