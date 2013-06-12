<%@page import="org.tair.utilities.*"%>
<html>
<head>
<title>Using the Microarray Experiment Search</title>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("");
setNext("exper_result.jsp");
writeHeader();
</script>

<!-- End of header -->
</head>

<body>
<br>

<h2><a name=""> </a>Using TAIR's Microarray Experiment Search</h2>

<p><a name=""> This tool can be used to search for all Microarray Experiments stored in TAIR's database. The search parameters can be used to find experiments by name, description or experimenters name and to restrict the search by experiment type, experiment variables, experimental goal, category and sample tissues. The <a href="exper_result.jsp">search</a> results display all records which match the query and the results are linked to <a href="exper_detail.jsp">detail pages</a> describing the experiment.To find ALL experiments in TAIR, leave all the parameters empty and click on the 'Submit Query' button.</a>
<ul>Contents
<li><a href="#expt1">Searching by name,description and experimenter.</a></li>
<li><a href="#expt2">Restricting by Keywords</a></li>
<li><a href="#expt3">Output Options</a></li>
</ul>
<p>
<h4><a name="expt1"> </a>Searching by name, description and experimenter</h4>

<font class="cont"><a name=""></a>To search for an experiment by name, description or experimenter name, type in the term you wish to find (e.g. Experimenter name- Weigel) and choose an exact (exactly) or inexact match (starts with, ends with or contains).For broadest searching, use the contains option.This search functions as an implicit AND,meaning each parameter must be found in the result set. For example, searching with experimenter name "Weigel" AND description contains "flower" will return ONLY results where the experiment description contains the term flower and the experimenters name is Weigel. </font>
<p>
<h4><a name="expt2"> </a>Restricting by keywords.</h4>

<font class="cont"><a name=""></a>Microarray experiments in TAIR are annotated using keywords <%=DefinitionsLookup.createPopupLink("KeywordType","keyword_type")%>including controlled vocabularies from the Gene Ontology Consortium (biological process, cellular component and molecular function), Arabidopsis anatomy, Arabidopsis Developmental stages and other keywords that describe chemicals or experimental methods.To browse experiments by keyword, use the <a href="/servlets/Search?action=new_search&type=keyword">Keyword Browser</a>.Different types of keywords are used to classify different aspects of a microarray experiment.</font>
<p>
<h4>Experimental Goal <%=DefinitionsLookup.createPopupLink("RelationshipType","experimental_goal")%></h4>
<font class="cont">Keywords in TAIR are used to classify experimental goals. For example, an experiment that is designed to assay expression of genes involved in flower development would be annotated with the GO biological process term 'flower development'.Type in the term corresponding to the experimental goal , such as 'response to pathogen' or 'flower development'.Leaving this field blank will include all experimental  goals in the query.</font>

<p>
<h4>Experimental Variables<%=DefinitionsLookup.createPopupLink("RelationshipType","experimental_factor")%></h4>
<font class="cont">Experimental variables may correspond to environmental variables such as light intensity or day length, or biological materials such as germplasms (mutant alleles, or natural variants), or chemical treatment (e.g. auxin, salt).Leaving this field blank will include experiments with any type of variable in the results.</font>

<p>
<h4>Plant Tissue</h4>

<font class="cont"><a name=""></a>Anatomy keywords <%=DefinitionsLookup.createPopupLink("KeywordType","keyword_type")%>describing the  parts of the plant used to prepare the RNA sample.Leaving the field blank will include experiments having any type of biological sample tissue.</font>
<p>
<h4>Experiment Category<%=DefinitionsLookup.createPopupLink("RelationshipType","experiment_category")%></h4>

<font class="cont"><a name="exper_cat"></a>Experiments are classified into broad categories which can be used to find related experiments.The default option is Any, which will return results for any type of experiment.Choosing multiple experiment categories is done by clicking on one selection and then clicking on additional ones while holding down either the CTRL key (PCs) or the Apple key (Mac).The categories are:<br/>

<b>abiotic treament</b>:Any method that tests the effect of a physical environmental condition on an organism. Examples are: temperature and light.<br/>
<b>biotic treament:</b>Any method that tests the effect of an agent due to, or derived from, living organisms on any other organism.<br/>
<b>chemical treatment</b>:Any treatment that tests the effect of a chemical substance on an organism, excluding plant hormones and nutrients.<br/>
<b>ecotype comparison</b>:Any method that tests differences among ecotypes.<br/>
<b>hormone treatment</b>:Any treatment that tests the effect of hormones on an organism<br/>
<b>non-wild type comparison</b>:Any method that tests differences between a wildtype and a non-wildtype organism, or between non-wiltypes. Examples are wildtype versus mutant, wildtype versus transgenic, and transgenic against transgenic.<br/>
<b>nutrient treatment</b>:Any treatment that tests the effect of nutrients on an organism.<br/>
<b>tissue comparision</b>:Any method that tests anatomical or developmental differences among tissues.<br/></font>
<p>
<h4><a name="expt3"> </a>Output Options</h4>

<font class="cont"><a name=""></a>These options can be used to display 25, 50, 100 or 200 records per page of results. The sort option is used to list results according to experiment name, experimenter's name, category, experimental goal or experimental variable. For example to sort results by experiment category, choose this option from the sort results by drop down menu.</font>
<p>


<!-- footer using external javascript file starts here --> 
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("");
setNext("exper_result.jsp");
writeFooter();
</script>
<!-- end footer -->
</body>
</html>
