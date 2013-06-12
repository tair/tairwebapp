<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "TAIR Microarray Tutorial";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="2021" />
</jsp:include>

<jsp:include page="/jsp/includes/microtutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="How to find microarray experiments"/>
</jsp:include>

<div id="rightcolumn">


<!--content goes  here//-->
<span class="mainheader">How to find microarray experiments</span>
<p>The most direct way to find information about microarray experiments in TAIR is using the <a href="/servlets/Search?type=expr&search_action=new_search">Microarray Experiment Search</a>. Additional information on using the Microarray Experiment search can be found in the <a href="/help/helppages/exper_search.jsp">Help document</a>
<h2>Using the <a href="/servlets/Search?type=expr&search_action=new_search" target="_new">Microarray Experiment Search</a> to find related experiments</h2>
<p>The following steps illustrate how to use the microarray experiment search.</p>
<ol>
<li> Start at the TAIR home page and in the Advanced Search Section, click on <a href="/servlets/Search?type=expr&search_action=new_search" target="_new"> Microarray Experiment Search page</a>.
<li>The first option allows you to search for experiments by experiment name, submission number <%=DefinitionsLookup.createPopupLink("ExpressionSet","submission_number")%>,description,author's name or organization. Choose one or more options from the drop down menus. For example, to find all of the experiments contributed by the AtGenExpress Consortium, select organization from the drop down menu, enter "AtGenExpress" into the text input box.</li> 
<p class="sm">If more than one option is specified, the second parameter is included as an implicit AND. So to narrow the results for AtGenExpress experiments to include only those experiments where development is studied, select 'description' from the second drop down menu, the contains option and type in 'development' into the text input box.</p>
<li> Next, choose the array manufacturer. The default option is set to 'Any' which will retrieve experiments from all types of manufacturers.</li>
<p class="sm">Different manufacturers use different technologies for making arrays. The most common commercial platform is the Affymetrix oligomer based arrays. Choosing this option will return experiments using both 8K (AG) and 25K <a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=pubmed&dopt=Abstract&list_uids=15086809" target="_new">(ATH1)</a> arrays. Other arrays such as Carnegie or AFGC use spotted cDNAs.</p>
<li>*OPTIONAL STEPS*: Searching with Keywords. You can use keywords to limit your results based specific experiment parameters such as goals,variables,tissue used for RNA extraction or category. For the first three options enter a word (e.g. disease) or a phrase (e.g. defense response) in the text input box. Choose the 'contains' option. If terms are entered in multiple options, the search is treated as an implicit AND search (e.g. Experiment Goals CONTAINS response to light AND Experimental variables CONTAINS  red light).</li>
<p class="sm">Keywords are assigned by TAIR curators when the data is loaded into the databases. These annotations include using controlled vocabularies to facilitate searching for related experiments.For example, if you wanted to find all of the experiments assaying similar biological processes in order to find patterns. Leaving this option blank includes all experiments regardless of experimental goal.</p>
<li>*OPTIONAL STEP: Selecting by experiment category. To choose more than one category press the CTRL key (PCs) or the Apple key (Mac) when making your selections with the mouse.The default option (ANY) will include all types of experiments in the results set.</li>
<p class="sm">When trying to find significant correlations in data obtained from diverse sources it is useful to be able to limit the analysis to related sets of data. For example, if you are trying to ascertain what genes may be involved in mediating environmental responses, it would be useful to compare results from all experiments involving biotic or abiotic treatments. </p>
<li>Select the output format. The output options can be set to display upto 200 records per page of results. The format of the results page can be ordered by experiment category, name, experimenter's name, goals or variables.</li>
<p class="sm"></p> 
<h2>Understanding and using the Experiment Details.</h2>
<p>The Experiment detail page can be accessed by clicking on the name of an experiment in the list of results that matched your query. A set of tabs at the top of the page allows  you to navigate quickly to different sub sections of the data. This section describes the contents of the Experiment Details and their uses. More information is available in the Experiment Search/Results and Detail page <a href="/help/helppages/exper_search.jsp" target="_blank">help document</a>.To navigate between sections of the experiment details, click on the tab.</p>
<p>
<ul>
<li>Experiment Summary</li>
<p>The first section displayed shows information about the experimenter,experimental variables,number of slides in the experiment and an abstract summarizing the experiment. For some large experiments, more than one variable may be listed. For example, an experiment that includes wild type and mutant tissue samples that are treated and untreated would list both the germplasm and the treatment as variables. Each experiment in TAIR is considered an "ExpressionSet" that includes multiple slides. The total number of slides in the experiment is shown on the bottom of this page along with the number of those slides which are either biological or technological replicates. The abstracts submitted by the experimenters, should provide an overview of the goals of the experiment. If there are papers associated to the experiment, these will also be displayed on the summary page.</p>
<li>Samples</li>
<p>Each tissue sample used to prepare RNA for the experiment is described in this section. In addition to the sample descriptions provided by the data donor,TAIR annotates the sample data using controlled vocabularies (<a href="http://plantontology.org">Plant Ontologies</a>) to describe anatomy and development. These keywords are in turn linked to keyword details where you can find other types of data (or other microarray experiments) which used similar tissue types. Each sample data has a table which lists all of the environmental conditions applied to that sample.</p>
<li>Slides and Datasets</li>
<p>This is the section where the main information about the slides that comprise the experiment is stored. You can browse through the list of slides to find the ones which may have your data of interest. Replicates are grouped together in alternating color bands. You can scan through the list of slides in the experiment and download the data for the slides you are most interested in. Each slide has a link to the sample data section where you can find information about the RNA sample used for hybridization. For example, the AtGenExpress <a href="/servlets/TairObject?type=expression_set&id=1006710873">Developmental Atlas</a> experiment includes arrays of many different types of tissues. For each entry, the experimental variables are listed which allows you to find specific datasets that examine a variable of interest. You can scan the variables to find the tissue samples of interest. For example, if you want to compare expression values between leaf and root tissues, you can select and download these hybridization data. If you were only interested in the differences between genes expressed in leaves versus stems then you might want to only download and analyze that subset of data. Find the slides which were hybridized with either stem cDNA or leaf cDNA. For each data set you want to download, click on the 'Download data' button. The data files are in a tab delimted text file which can be opened in a spreadsheet program such as Microsoft Excel.</p>
<li>Array Design</li>
<p>This section displays information about the design of the array including manufacturer (e.g. Affymetrix)and platform type (e.g.in situ synthesized oligomers). Because experiments in TAIR come from many sources, the technologies (array designs, hybridization methods) can be quite variable. We provide this information so that users can identify all possible sources of variation when comparing experiments, or to reproduce experiments in their own labs.</p>
</ul>
</div> <!--right column-->
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>