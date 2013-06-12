<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "GO Tutorial";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="2015" />
</jsp:include>

<jsp:include page="/jsp/includes/gotutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="How to classify sets of genes by function, location and biological role"/>
</jsp:include>

<div id="rightcolumn">


<span class="mainheader">How to find GO annotations for sets of genes and group them by function, location and biological role.</span>
<p>This tutorial describes how to:
<ol>
<li>Use TAIR's Bulk GO Annotation Download and Analysis tool to obtain lists of GO annotations for the whole genome or sets of genes.</li>
<li>Group sets of genes into broad categories of function, biological role and sub-cellular localization (GO Slim).</li>
<li>Obtain lists of gene products that fall within functional categories.</li>
<li>Create a pie chart showing the distribution of gene products within the GO Slim functional categories. </li>
</ol>
</p>
<p> You can try out the Bulk GO annotation download/analysis tool using one of the sample datasets. These datasets include gene families (Type I MADs box, Yabby), a set of genes all containing a WRKY domain and a set of genes that clustered together in a microarray experiment. Choose one of the following datasets and click on the "send to GO Annotations Download".</p>

<form action="/tools/bulk/go/index.jsp" target="_new" method="post">
<select name="loci">
<option value="At2g45190 At4g00180 At2g26580 At2g26580 At2g26580 At1g69180">Yabby Gene Family Sample(6)</option>
<option value="At1g18750 At2g03060 At1g65360 At1g01530 At2g34440 At2g26320 At5g27130 At4g36590 At2g26880 At5g58890 AT5g55690 At5g60440 At5g48670 At5g49490 At1g65330 At1g22590 At2g24840 At2g28700 At5g27960 At1g77950 At1g77980 At1g28460 At1g28450 At3g05860 At1g47760 At3g04100 At2g40210 At1g60880 At1g60920 At1g17310 At3g66656 At5g26575 At5g26625 At5g26645 At4g14530 At5g04640 At1g22130 At1g48150 At5g38620 At5g49420 At1g72350 At1g31640 At1g31630 At1g31630 At1g31140">Type1 Mads box gene family sample(53)</option>
<option value="AT4G23550 AT3G58710 AT4G22070 AT3G07500 AT2G21900 AT3G11402 AT5G07100 AT4G18170 AT1G66600 AT5G52830 AT4G15090 AT4G04450 AT4G39410 AT4G26640 AT2G34830 AT1G69310 AT4G31800 AT5G46350 AT5G28650 AT2G32250 AT5G64810 AT1G18860 AT5G56270 AT2G44745 AT4G12020 AT4G11070 AT5G15130 AT2G46130 AT5G22570 AT1G29280 AT1G55600 AT1G80590 AT1G13960 AT1G13960 AT5G13080 AT2G43280 AT3G04670 AT5G49520 AT3G62340 AT3G01970 AT1G68150 AT4G30935 AT1G66550 AT2G30590 AT4G23810 AT5G43290 AT2G04880 AT2G04880 AT4G09690 AT5G45270 AT4G26440 AT1G76320 AT5G24110 AT2G40740 AT2G37260 AT4G01250 AT1G66560 AT1G30650 AT1G62300 AT4G24240 AT5G26170 AT5G45050 AT2G24570 AT3G01080 AT1G80840 AT3G56400 AT2G47260 AT2G40750 AT2G23320 AT2G23320 AT3G22170 AT2G03340 AT2G25000 AT3G32090 AT4G01720 AT1G69810 AT5G01900 AT4G31550 AT1G64000 AT2G46400 AT3G11385 AT5G41570 AT2G30250 AT2G38470 AT1G29860">Domain Sample -WRKY(82)</option>
<option value="AT1G42970 AT3G55800 AT2G21330 AT2G21330 AT3G54050 AT1G42970 AT5G62790">phyA mutant Microarray Cluster Data (7)</option>
</select>
<input type="submit" value="Send to GO Annotations Download">
</form>

<h2>Obtaining lists of GO annotations for a set of genes.</h2>
<ol>
<li>Go to the <a href="/tools/bulk/go/index.jsp" target="_new">Bulk GO Annotation Download and Analysis tool</a>.</li>
<li>Type in, paste in or upload a file containing a list of locus identifiers separated by tabs, commas, spaces or carriage returns.</li>
<li>Choose the output format , HTML or Text.
<p> Choose the text option if you want to download a tab-delimited file which you can open in Excel or a text editor. The default option is HTML table which includes hyperlinks to relevant data pages in TAIR such as locus details and direct links to publications.</p>
</li>
<li>Submit the query. Click on <input type="button" value="Get all GO annotations" />.</li>
</ol>
<p>See also:<a href="/help/helppages/bulkgohelp.jsp" target="_new">Bulk GO Annotation Download Help</a> for a complete description of the columns in the displayed results.</p>
<h2>Whole Genome Functional Categorization</h2>
<p>This function can be used to display the GO slim functional groupings for the entire Arabidopsis genome. The results are calculated on the fly so that the most up to date information can be obtained. Just click on the <input type ="button" value="Whole Genome Categorization" />.Once you have generated the list, you can resort the display and plot a graph as described below.</p>
<h2>Grouping sets of genes into functional categories</h2>
<p>Often it is useful to be able to summarize GO functional annotation with more high level terms. For example, when describing a set of co-clustered genes from a microarray experiment it is helpful to be able to distinguish all genes involved in transcription or stress response. For each aspect of the GO ontologies (Biological Process, Molecular Function, Cellular Component) a subset of terms (or sets of terms) have been selected to represent 10-20 major 'bins'. These bins correspond to the GO Slim categories. If a gene is annotated to a 'child' term of one of the GO Slim terms, it is included in the 'bin'. Therefore a gene product annotated to the (more granular) term 'positive regulation of transcription' and another gene annotated to the term 'negative regulation of transcription' would both be grouped into the broader category 'transcription'.</p>
<p>See <a href="/help/helppages/go_slim_help.jsp" target="_new"> GO Slim Help Page</a> for a complete list of GO Slim terms and their definitions.</p>
<ol>
<li>Upload, paste or type in locus identifiers in the input box on the GO annotation Bulk Download/Analysis Tool.</li>
<li>Choose the output format. To use the graphing function (to make pie charts) select the 'HTML' option.</li>
<li>Submit the query. Click on the <input type="button" value ="Functional Categorization" /> button.</li>
</ol>
<h2>Sorting and displaying the results</h2>
<p>The Functional Categorization results are displayed on a table, which is first grouped by keyword category (type) and within each type, by functional category (GO slim term). Within each category the number of annotations and number of genes is shown. The annotation count corresponds to the number of times a given combination of GO term+Locus appears in each category. The gene count refers to the total number of unique loci represented within each category.</p>
<p>You may notice that the sum of the annotations can differ from the total number in the  gene count. This is because  the gene count in GO slim considers only the term-gene pair, whereas within the annotation count, an annotation to the same term but with different evidence, constitutes a distinct annotation.</p>

<p> The annotation count for any given keyword category can be greater than the sum of genes within the list for two reasons:</p>
<ul>
<li>A gene product is annotated to a term that has multiple parentage with the parents falling into separate bins. For example, a gene product annotated to the term. For example, a gene annotated to the term response to pest/pathogen/parasite (GO:0009613) will be represented in 2 functional categories: response to abiotic and biotic stimulus and response to other stresses (GO:0006950)</li>.
<li>If a gene is annotated to more than one term in each keyword category, and the terms fall into separate bins the gene will be represented in both categories.</li>
</ul>
<p>
<h2>Graph the results</h2>
<p>From the functional categorization results you can draw a pie chart showing either the distribution of annotations in each category or distribution of genes in each category.</p>
<ul>
<li>Choose Annotation Pie Chart or Gene Pie Chart from the drop down menu in the upper left corner of the results.</li>
<li>Click on the <input type="button" value="Draw"> button.</li>
</ul>
</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>