<%@page import="org.tair.utilities.*"%>
<html>
<head>
<title>TAIR Help  Understanding the Annotation Results Page</title>
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

<ul>Contents
<li><a href="#annotdet1">Definitions and Uses of Gene and Keyword annotation detail page fields</a></li>
<li><a href="#annotdet12">Example of an annotation detail page for a gene</a></li>
<li><a href="#annotdet13">Example of an annotation detail page for a keyword</a></li>
</ul>
<h2><a name="annotdet1"> </a>Using the Annotation Detail Page</h2>

<font class ="cont"><a name=""></a>When you click on the "Annotation Details" link from the <a href="genedeta.jsp">Gene Detail Page</a> or Locus Detail Page,you will see a complete list of terms annotated to the gene/locus. At the top, the gene/locus name and number of annotations is displayed. The annotations are displayed in a table with the following fields.</font>
<p>



<h4><a name="annotdet2"> </a>Keyword Category</h4>

<font class="cont"><a name=""> </a>This defines the type of keyword used for the annotation. Keywords in TAIR annotations include  biological process,molecular function, cellular component, development and plant structure. There may be more than one annotation to different types of keywords (such as a gene with multiple functions). In cases where annotations to some categories of keywords are not shown it means that this aspect has not yet been annotated (such as gene expression or subcellular localization). This is distinct from cases where we have looked for the information but have not found the data in the available literature (see <a href="#annotdet4">Keyword </a> field description for more about 'unknown' annotations).</font>
<p>
<h4><a name="annotdet14"> </a>Gene</h4>

<font class="cont"><a name=""> </a>Annotations are made to specific gene models; this field displays the name of the gene to which the term was assigned. Clicking on this link will open a page with the Gene detail display.<font color="red">Note: Used on Keyword Annotation Detail Page</font></font>
<p>

<h4><a name="annotdet15"> </a>Locus</h4>

<font class="cont"><a name=""> </a>Annotations made to gene models are then associated to a locus; this field displays the name of the locus to which the gene model belongs. One locus can have one or more gene models. Clicking on this link will open a page with the Locus detail display.<font color="red">Note: Used on Keyword Annotation Detail Page</font>
<p>

<h4><a name="annotdet3"> </a>Relationship Type</h4>

<font class="cont"><a name=""> </a>Relationship types define the way in which a gene product is related to the term. TAIR uses a variety of Relationship types<%=DefinitionsLookup.createPopupLink("RelationshipType","type")%> to clarify the nature of the annotation.</font>
<p>
<h4><a name="annotdet4"> </a>Keyword</h4>

<font class="cont"><a name=""> </a>This field displays the specific term or keyword used for the annotation. In some cases, the term will be to an unknown (e.g. molecular function unknown, biological process unknown or cellular component unknown). This indicates that someone (a curator) has reviewed the available literature and found no experimental evidence to support an assertion as to function, location or biological role. When used with the evidence code IEA , this means that a genome wide computational analysis (for example, to predict subcellular localization) did not produce a significant result for that gene product. </font>
<p>
<h4><a name="annotdet5"></a>Evidence Code</h4>

<font class="cont"><a name=""> </a>Evidence codes are used to indicate the type of evidence used to support the assertion made in the annotation.TAIR uses evidence codes <%=DefinitionsLookup.createPopupLink("EvidenceDescription","evidence_code")%> defined by the Gene Ontology Consortium. The evidence codes can be used to 'rank' the annotations based upon supporting evidence. For example, an annotation made to an enzymatic function term based on an enzyme assay (inferred by direct assay or IDA) would be more significant than an annotation based on computational prediction (inferred by electronic annotation or IEA).</font>
<p>
<h4><a name="annotdet6"> </a>Evidence Description</h4>

<font class="cont"><a name=""> The evidence descriptions are a unique feature of TAIR annotations. They are used to provide additional insight as to the nature of the evidence supporting the annotation.TAIR uses a variety of evidence descriptions <%=DefinitionsLookup.createPopupLink("EvidenceDescription","description")%> representing a variety of experimental and computational methods as well as descriptions of the nature of traceable and non traceable author statements. More than one experimental method may be used to support an annotation (e.g. immumolocalization and co-fractionation for an annotation to a cellular component). As with the evidence codes, the experimental basis can be used to rank the significance of the annotation.</a></font>
<p>
<h4><a name="annotdet7"> </a>Evidence with</h4>

<font class="cont"><a name=""> </a>This field indicates any object (such as a gene product, allele or protein domain) that is required for the evidence assertion. An example would be an annotation to a biological process that is inferred by genetic interaction, IGI, based on double mutant analysis. The evidence with in this case ,could be the second gene in the double mutant strain. Another example would be an annotation of a gene product to the term DNA binding inferred from physical assay (IPI, yeast one-hybrid), the evidence with would indicate the target gene bound by the gene product..</font>
<p>
<h4><a name="annotdet8"> </a>Reference</h4>

<font class="cont"><a name=""></a>Each annotation is associated to a reference where the evidence supporting the assertion can be found. Evidence from papers is linked to the record for that publication in TAIR. Following this link will open a publication detail page which includes the abstract (and if known the PubMed id). Researchers can read the papers and determine for themselves, if the annotation is credible.</font>
<p>

<h4><a name="annotdet10"> </a>Annotated By</h4>

<font class="cont"><a name=""> </a>Annotations in TAIR include those made by TIGR and by TAIR. Annotations in TAIR are made by trained biologists with Ph.D's who primarily annotate using published literature. Ph.D scientists at TIGR have mostly annotated based upon sequence similarity: using literature to annotate a representative member of a gene family and then transferring the annotations (based on sequence similarity or ISS) to the other members of the family.</font>
<p>
<h4><a name="annotdet11"> </a>Date Last Modified</h4>

<font class="cont"><a name=""> </a>The date stamp indicates when the annotation was made. This information is useful as it indicates how recent (or dated) is the annotation being displayed. Older annotations may eventually be superseded by newer ones as new data is evaluated. Pay particular attention to annotations based on computational prediction as gene structures (and hence predictions based on sequence) can change over time.</font>
<p>
<h2><a name="annotdet12"></a>Example of an Annotation Detail Page for a Gene</h2>
<p/>
<font class="cont">The following is an example of an annotation detail page for the gene PDF2. This view can be accessed from either the <a href="genedeta.jsp">gene detail page</a> ( by clicking on the link to view Annotation Details in the annotation section) or from the <a href="keyser.jsp"> Keyword Search</a> and <a href="keybrowse.jsp">Browser</a>.</font>
<img src="images/annotation_detail.jpg"/>

<p/>
<h2><a name="annotdet13"></a>Example of an Annotation Detail Page for a Keyword</h2>
<font class ="cont">This annotation detail page shows annotations to the keyword "epidermal cell differentiation". All gene products annotated to this term are displayed. Different data shown for annotations to other data types such as publications and microarray experiments. This detail page can be accessed from either the <a href="keyser.jsp">Keyword search</a> results or the <a href="keybrowse.jsp">Keyword Browser</a></font>
<img src="images/annot_detail2.jpg"/>

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
