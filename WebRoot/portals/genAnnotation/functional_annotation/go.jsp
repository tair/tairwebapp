<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String pageName = "TAIR- Functional Annotation";
String highlight = "3";
String helpfile="";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>

<%
AnnotationStatistics stats = new AnnotationStatistics();
Calendar calendar = Calendar.getInstance();
%>



<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
<jsp:param name="helpfile" value="<%= helpfile %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Ontologies" />
</jsp:include>

<div id="rightcolumn">
<!--CONTENT HERE-->
<a name="top"></a>
<span class="mainheader">Gene Ontology Annotations</span>

<dl>
<dt>About The Gene Ontologies and Annotations</dt>
<dd>
<p>The goal of the <a href="http://www.geneontology.org/">Gene Ontology Consortium</a> is to produce dynamic controlled vocabularies that can be used to describe the roles of genes and gene products in all organisms even as knowledge of gene and protein roles in cells is accumulating and changing. The three organizing principles of GO are molecular function, biological process and cellular component. TAIR has been a member of GO since 2000.</p>

<p>GO terms are used as attributes of gene products by collaborating databases, facilitating uniform queries across them. The controlled vocabularies of terms are structured to allow both attribution and querying to be at different levels of granularity.</p>
<p>
Function, process and component are represented as directed acyclic graphs (DAGs) or networks. The difference between a DAG and a hierarchy is that in the latter each child can only have one parent; a DAG allows a child to have more than one parent. A child term may be an "instance" of its parent term (isa relationship) or a component of its parent term (part-of relationship). A child term may have more than one parent term and may have a different class of relationship with its different parents. </p>
<p>
At TAIR, we display both GO annotations made by TAIR curators and those made by TIGR's Arabidopsis annotation effort.  The GO annotations in TAIR are made using a combination of manual and computational methods.  Details of our annotation methods can be found in our paper cited below.  Please cite this publication when using TAIR's GO annotations in your research. </p>
<p>
Berardini, TZ, Mundodi, S, Reiser, R, Huala, E, Garcia-Hernandez, M,
Zhang, P, Mueller, LM, Yoon, J, Doyle, A, Lander, G, Moseyko, N, Yoo,
D, Xu, I, Zoeckler, B, Montoya, M, Miller, N, Weems, D, and Rhee, SY
(2004) Functional annotation of the Arabidopsis genome using
controlled vocabularies. Plant Physiol. 135(2):1-11. </p>

<p>
Annotations can also be found using GO terms as keywords from the 
<a href="/servlets/Search?type=general&action=new_search"> Advanced Search page</a>, 
<a href="/servlets/Search?action=new_search&type=gene"> Gene Search page</a>, or the
<a href="/servlets/Search?action=new_search&type=keyword"> Keyword Search page</a>,and the entire set of Arabidopsis GO annotations can be downloaded from the <a href="ftp://ftp.arabidopsis.org/home/tair/Ontologies/Gene_Ontology/">TAIR FTP site</a>.
</p>
</dd>
</dl>
<p>[Back to <a href="#top">top</a>]</p>
<dl>
<dt>Annotation Statistics</dt>
<dd>
<table  border="1" cellpadding="2">
<caption>
Annotation Statistics as of <%= calendar.get(Calendar.MONTH)+1 %>/<%= calendar.get(Calendar.DAY_OF_MONTH) %>/<%= calendar.get(Calendar.YEAR) %>
</caption>
  <tr><th id="header1">Aspect</th><th id="header2">Number of Annotations*</th>
<th id="header1">Number of Loci</th></tr>
  <tr><td headers="header1">Process Ontology</td>
<td headers="headers2"><%= stats.getStat(AnnotationStatistics.PROCESS_ANNOTATIONS) %></td>
<td><%= stats.getStat(AnnotationStatistics.PROCESS_LOCI) %></td></tr>
  <tr><td headers="header1">Molecular Function Ontology</td>
<td headers="headers2"><%= stats.getStat(AnnotationStatistics.FUNCTION_ANNOTATIONS) %></td>
<td><%= stats.getStat(AnnotationStatistics.FUNCTION_LOCI) %></td></tr>
  <tr><td headers="header1">Component Ontology</td>
<td headers="headers2"><%= stats.getStat(AnnotationStatistics.COMPONENT_ANNOTATIONS) %></td>
<td><%= stats.getStat(AnnotationStatistics.COMPONENT_LOCI) %></td></tr>
  <tr><td headers="header1">Experimental Annotations***</td>
<td headers="header2"><%= stats.getStat(AnnotationStatistics.EXPERIMENTAL_ANNOTATIONS_ANNOTATIONS) %></td>
<td><%= stats.getStat(AnnotationStatistics.EXPERIMENTAL_ANNOTATIONS_LOCI) %></td></tr>
  <tr><td headers="header1">Non-IEA Annotations, Non-ND Annotations**</td>
<td headers="header2"><%= stats.getStat(AnnotationStatistics.NON_ANNOTATIONS_ANNOTATIONS) %></td>
<td><%= stats.getStat(AnnotationStatistics.NON_ANNOTATIONS_LOCI) %></td></tr>
  
  <tr><td headers="header1">Distinct GO terms</td>
<td headers="header2"><%= stats.getStat(AnnotationStatistics.DISTINCT_GO_TERMS) %></td>
  
<td>&nbsp;</td></tr>
<tr><td headers="header1">Total Number</td>
<td headers="headers2"><%= stats.getStat(AnnotationStatistics.TOTAL_ANNOTATIONS) %></td>
<td><%= stats.getStat(AnnotationStatistics.TOTAL_LOCI) %></td></tr>

</table>
* numbers are for annotations from both TAIR and TIGR<br />
** non-IEA annotations exclude computational annotations (evidence code IEA); they are manually curated annotations and thus  considered of higher quality.<br />

*** experimental annotations include those with evidence code IDA, IEP, IPI, IMP, and IGI
</dd>
</dl>
<p>[Back to <a href="#top">top</a>]</p>
<dl>
<dt>Evidence Codes</dt>

<dd>Every GO annotation includes an Evidence Code that gives information about the evidence from which the annotation has been made. For example, an annotation that was made on the basis of an automatic computational analysis would have the evidence code IEA, an annotation made on the basis of an enzyme assay would have the evidence code IDA (or ISS, if it has been reviewed by a curator). All currently used evidence codes used by the <a href="http://www.geneontology.org/GO.evidence.html">Gene Ontology Consortium</a> are given below.</dd>
<dl>
 <a name="IDA"></a>
    <dt>IDA inferred from direct assay</dt>
      <dd>
	  <ul>
	  <li>Enzyme assays</li>
<li>In vitro reconstitution (e.g. transcription)</li>
<li>Immunofluorescence (for cellular component)</li>
<li>Cell fractionation (for cellular component)</li>
<li>Physical interaction/binding assay (sometimes appropriate for cellular component)</li>
</ul>
</dd>
</dl>
<dl>
<a name="IEA"></a>
      <dt>IEA inferred from electronic annotation</dt>
      <dd>
       <ul>
      <li>Annotations based on "hits" in sequence similarity searchs, if they have not been reviewed by curators (curator-reviewed hits would get ISS)</li>
      <li>Annotations transferred from database records, if not reviewed by curators (curator-reviewed items may use NAS, or the reviewing process may lead to print references for the annotation)</li>

</ul>
</dd>
</dl>
<dl>
<a name="IEP"></a>
      <dt>IEP inferred from expression pattern</dt>
      <dd>
<ul>
	<li>Transcript levels (e.g. Northerns, microarray data)</li>
        <li>Protein levels (e.g. Western blots)</li>

</ul>
</dd>
</dl>
<dl>
<a name="IGI"></a>
<dt>IGI inferred from genetic interaction</dt>
<dd><ul>
  <li>"Traditional" genetic interactions such as suppressors, synthetic lethals, etc.</li>
  <li>Functional complementation</li>
  <li>Rescue experiments</li>
  <li>Inference about one gene drawn from the phenotype of a mutation in a different gene</li>
      </ul>
</dd>
</dl>
<dl>
<a name="IMP"></a>      
<dt>IMP inferred from mutant phenotype</dt>
<dd>
<ul>
  <li>Any gene mutation/knockout</li>
  <li>Overexpression/ectopic expression of wild-type or mutant genes</li>
  <li>Anti-sense experiments</li>
  <li>RNAi experiments</li>
  <li>Specific protein inhibitors</li>

</ul>
</dd>
</dl>
<dl>
<a name="IPI"></a>
<dt>IPI inferred from physical interaction</dt>
<dd>
<ul>
  <li>2-hybrid interactions</li>
  <li>Co-purification</li>
  <li>Co-immunoprecipitation</li>
  <li>Ion/protein binding experiments</li>
</ul>
</dd>
</dl>
<dl>
<a name="ISS"></a>
<dt>ISS inferred from sequence or structural similarity</dt>
<dd>
<ul>
  <li>Sequence similarity (homologue of/most closely related to)</li>
  <li>Recognized domains</li>
  <li>Structural similarity</li>
  <li>Southern blotting</li>
</ul>
</dd>
</dl>
<dl>
<dl>
<a name="IBA"></a>
<dt>IBA Inferred from biological aspect of ancestor</dt>
<dd>
<ul>
  <li>A type of phylogenetic evidence whereby an aspect of a descendent is inferred 
      through the characterization of an aspect of a ancestral gene.</li>
</ul>
</dd>
</dl>
<dl>
<dl>
<a name="IKA"></a>
<dt>IKR Inferred from key residues</dt>
<dd>
<ul>
  <li>A type of manually-curated evidence derived from sequence analysis, 
      characterized by the lack of key sequence residues.</li>
  <li>All annotations that apply this evidence code should use the 'NOT' qualifier.</li>
  <li>This evidence code is used to annotate a gene product when, although homologous 
      to a particular protein family, it has lost essential residues and is very 
      unlikely to be able to carry out an associated function, participate in the 
      expected associated process, or found in a certain location.</li>
</ul>
</dd>
</dl>
<dl>  
<a name="NAS"></a>
<dt>NAS non-traceable author statement</dt>
<dd>
<ul>
<li>Database entries that don't cite a paper (e.g. SwissProt records, YPD protein reports)</li>
<li>Statements in papers (abstract, introduction, or discussion) that a curator cannot trace to another publication</li>
</ul>
</dd>
</dl>
<dl>
<a name="ND"></a>
<dt>ND no biological data available</dt>
    <dd>
<ul>
<li>Used for annotations to "unknown" molecular function, biological process, or cellular component.</li>
<p>Comment: This code is used only for annotations to "unknown," and it is the only evidence code recommended for annotations to unknown (except in cases where a cited source explicitly says that something is unknown). It should be accompanied by a reference that explains that curators looked but found no information.</p>
</ul>
</dd>
</dl>

<dl>
<a name="RCA"></a>
<dt>RCA inferred from Reviewed Computational Analysis</dt>
    <dd>
    <ul>
        <li>Predictions based on computational analyses of large-scale experimental data sets</li>
        <li>Predictions based on computational analyses that integrate datasets of several types, including 
        experimental data (e.g. expression data, protein-protein interaction data, genetic interaction data, etc.), 
        sequence data (e.g. promoter sequence, sequence-based structural predictions, etc.), or mathematical models </li>
    </ul>
    </dd>
</dl>


<dl>
<a name="TAS"></a>
<dt>TAS traceable author statement</dt>
<dd>
<ul>
<li>Anything in a review article where the original experiments are traceable through that article (material from introductions to non-review papers will sometimes meet this standard)</li>
<li>Anything found in a text book or dictionary; usually text book material has become common knowledge (e.g. "everybody" knows thatenolase is a glycolytic enzyme).</li>
</ul>
</dd>
</dl>
<dl>
<a name="NR"></a>
<dt>NR not recorded</dt>
<dd>
    <ul>
      <li>Used for annotations done before curators began tracking evidence types (appears in SGD and FlyBase annotations). It should not be used for new annotations--use TAS or NAS.</li>
    </ul>
</dd>
</dl>
</dl>
<p>[Back to <a href="#top">top</a>]</p>
                </div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
