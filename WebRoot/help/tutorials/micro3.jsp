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
<jsp:param name="id" value="2022" />
</jsp:include>

<jsp:include page="/jsp/includes/microtutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="How to find information about the expression of specific genes"/>
</jsp:include>

<div id="rightcolumn">


<!--content goes  here//-->
<span class="mainheader">How to find information about the of specific genes from microarray experiments.</span>
<p> This section describes how to use the Microarray Expression Search and Results to find information about  gene expression from microarray experiments.</p>
<h2>Using the Microarray Expression Search </h2>
<p>This tool can be used to perform a simple search by name for expression data from a single gene or set of genes. The Advanced Options allow you to restrict your search to expression data that meets specific criteria.</p>
<ol>
<li>From the TAIR home page, click on the link to the <a href=" /servlets/Search?action=new_search&type=expression">Microarray Expression </a> in the Advanced Search section.</li>
<li> Choose the appropriate name type from the drop down list.</li>
<p class="sm"> The search by name option can be AGI locus name, a gene symbol (ARF1) or full name (e.g. Auxin Response Factor 1), the name of the array element or the GenBank accession number. If you choose the GenBank accession option, be aware that the accession must correspond to the accession of the cDNA used on the microarray. Therefore, only the expression of a gene from cDNA arrays will be found. To find the most COMPREHENSIVE set of expression data for a gene, use the locus identifier.</p>  
<li>Enter the name of the gene of interest (e.g. AT2G41280).</li>.
<li>Alternatively, if you want to search for expression data from multiple genes, upload a file containing a list of up to 100 names. The names can correspond to either the (AGI) locus name or the name of the array element. Click the correct radio button to select the appropriate name type for the list you are uploading.</li>
<li>Select the type of array/array design</li>
<p class="sm">This option allows you to limit the results by array platform and design. The default option only includes results from single channel arrays (e.g. Affymetrix). To search only within cDNA arrays, choose this option. As of January 2005, all cDNA array data in TAIR is from the AFGC project.</p>
<p class="sm"> <b>IMPORTANT NOTE</b>If you are searching with array element names or GenBank accessions you MUST choose the appropriate array type, otherwise you may get false negative results. We recommend using the broadest possible options -for either platform, choose any array design.</p>
</ol>
<h3>Using the Advanced Search options</h3>
<p>The advanced options can be accessed by clicking on the plus sign next to each of the optional fields.</p>
<h3>Limiting the search by expression values</h3>
<p class ="sm"> The default search will return results only for replicate hybridizations from single channel arrays. Depending on the type of array selected in the previous step, different parameters are available for restricting search results based upon expression values. These are optional parameters. </p>
<ol>
<li> Expand this selection by clicking on the plus [+] sign.</li>
<li> If you prefer to return results from all hybridizations, select the Data from All Arrays option. This will include data from hybridizations without replicates which may be of lower significance.</li>
<ul>Affymetrix Array Options
<li>Detection: This option allows you to limit results based on whether or not expression of a gene was detectable above background. The default option is set to "Present" meaning only hybridizations where the gene  is  'expressed' will be included. Choosing the "Absent"  options will return results for which the level of expression was not  significantly increased over background.</li>
<li>Signal: This option allows you to specify a range of expression values for the gene(s) of interest. The signal strength between arrays are comparable as all Affymetrix data is normalized to a target value of 200. An approximation of signal intensity to transcript abundance is shown below.<br /> 
less than 20: not expressed or very low abundance<br />
20-50: low <br />
50-200: moderate <br >
more than 200: high<br />
 </li>
<p class ="sm"> You should be cautious when using this option. Signal values across hybridizations are not necessarily comparable.  Some genes, such as transcription factors , or genes expressed strongly in a subset of cell types, may have values in the low 100's. 
<li>Signal Percentile: This option allows you to restrict results to only those hybridizations in which the relative expression of the target gene is above a certain threshold. This option is useful for selecting only those hybridizations in which your gene(s) of interest are most highly induced relative to other genes represented on the array.</li>
<p class="sm">Again, use caution when selecting or interpreting displayed values for signal intensity. This measure is only relative to all other elements on the same hybridized array. Many genes  with important functions, may never be in the 90% range if they are always expressed at low levels (e.g. transcription factors). Other genes may  nearly always represent the majority of transcripts in a hybridization.</p>
</ul>
<ul>cDNA Array Options
<li>Absolute Expression: The default option is 'Expressed' which  includes only those experiments in which absolute level of expression of a gene was above a defined threshold once the background is subtracted. Choosing the not expressed option allows you to find experiments/conditions under which the target gene does not appear to be expressed above background.</li>
<li>Relative Expression: The default option (Any) includes all hybridizations regardless of the degree of increased or decreased expression. You can use this option to limit the results to only those conditions under which the target gene is increased, decreased or unchanged. </li>
<li> Fold Change: This option can be used in combination with the Relative Expression option, to indicate the degree of increased or decreased expression.</li>
<li>Standard Error: This refers to the standard error for the overall fold change. You can use this option to set a 'quality' threshold for results (e.g. a smaller value means there is less variation among replicates). For best results leave the default value, Any. If necessary you can go back and re-do the query with more restrictive parameters.</li>
</ul>
</ol>
<h3>Limiting the search by Experiment Parameters</h3>
<p>The optional parameters in this section can be used to define a subset of expression values to display based upon characteristics of the experiment. For example, if you are interested in finding out how the expression of your gene is affected by environmental or developmental conditions. This option is particularly useful for narrowing down conditions under which your gene(s) of interest have the most varied expression. Also, it can be useful for obtaining smaller and more manageable data sets.</p>
<p>Remember, it is NOT necessary to select any of these options. The default parameters are the least restrictive and will return results regardless of the experimental parameters. First try the search without changing these parameters. If you get too many results you can always go back and refine your search.</p>
<ol>
<li>Expand the section by clicking on the plus  [+] sign.</li>
<li>Limit the search by Experiment name. These options can be used to limit the expression results set to include only the defined named experiments, or experimenters. </li>
<p class="sm">You can also use this option to show only the expression values for your gene(s) of interest in a specific experiment. For example, if you know of a public experiment that compares expression of a wild type and mutant strain and want to determine how a set of genes is affected, you can upload a list of target genes and select the results of a specific experiment.</p>
<li>Limit the search by keywords <%=DefinitionsLookup.createPopupLink("KeywordType","keyword_type")%>. Within this section are several options which allow you to input keywords and find expression values for all experiments annotated with those keywords. </li>
<p class="sm">You can use this option to find all experiments in which the experimental variable <%=DefinitionsLookup.createPopupLink("RelationshipType","experimental_factor")%>was exposure to blue light or the goal <%=DefinitionsLookup.createPopupLink("RelationshipType","experimental_goal")%>was to determine what genes are involved in the response to a pathogenic bacteria. Or, if you are interested in looking at patterns of expression of your gene(s) of interest in a specific tissue, you can input and select that body part.</p>
<li>Limit the search by experiment category<%=DefinitionsLookup.createPopupLink("RelationshipType","experiment_category")%>. Select one or more categories of experiments to include in the search. The default option includes all experiments regardless of type. To select more than one category, hold down the CTRL key (PC) or Apple key (Mac) when making your selections with a mouse click.</li>
<p class="sm">All experiments in TAIR are associated to one or more <a href="/help/helppages/exper_search.jsp#exper_cat" target="_blank">experimental categories</a>. This allows you to look at only a subset of experiments of interest in order to examine gene expression in a specific subset of environmental conditions/treatments , growth stages or genotypes.</p>
<li>Define the output format. Select the number of results per page to display and the color scheme for showing the fold change.
<p class="sm"> You can choose to display up to 200 individual results per page. Choosing the most records per page is a good idea, especially if you plan on downloading the results. You can always go back and redo the search with fewer or greater numbers of records/page. The fold change coloring option is used only for displaying cDNA array data. The fold change values can be overlayed with red/green , red/blue or yellow/blue to indicate increased or decreased expression levels.</p>
</li>
</ol>
<h2>Understanding and interpreting the Expression Search Results</h2>
<p>A successful query will return a list of results that match your search criteria. The format of the results will differ depending upon the array type option you selected in step 5. If you have not done the sample query, you can view the sample <a href="singleex.jsp" target="_blank">Single Channel Results</a> or <a href="dualex.jsp" target="_blank">Dual Channel Results</a>.</p>

<p>The results page lists all of the replicate hybridizations that match your query (and may include non-replicated hybridizations if you chose that option).The upper portion of the results shows what search criteria were used and lists the number of matching records. The following items list some of the things you can do once you have your results list.</pi
<ul>
<li>Resorting the results.</li>
<p>NOTE: on the example, page you will not be able to test the re-sort function.</p>
<p>This option allows you to sort the results by different parameters, such as locus or array element name (useful if you have uploaded a file of more than one element or locus), experiment,expression values/fold change. The different options allow you to find experiments in which the expression of your gene of interest varies with different conditions, or to find experiments in which the expression values were highest or lowest.<p>
<ol>
<li>Select the appropriate field from the drop down menu (e.g. Experiment Name).
<li>Click on the 're-sort by' button. If you chose the example above, the results would be displayed according to the name of the experiment. All replicate sets belonging to one experiment will be grouped together.</li>
</ol>
<li>Download results</li>
<p> One or more rows of results can be downloaded as a tab-delimited text file. These files can then be opened using a simple text editor or spreadsheet program such as Microsoft Excel.</p>
<ol>
<li>Select the records to download by checking the box at the far left side of each row.</li>
<li>Alternatively, if you want to download ALL of the records on a single page, use the 'Check All' option next to the re-sort button.</li>
<li>Download the file by clicking on the 'download' button below the TAIR toolbar. You will need to do this for each of the pages of results. Currently the download button only functions for a page of results at a time.</li>
<li>Save the file to the hard disk of your computer.</li>
</ol>
<li>Find information about the experimental methods and sample treatments. For more information about the contents of the experiment details and navigating expression set data, see the <a href="micro2.jsp">Microarray Experiment Search tutorial</a>.</li>
<li>Find and download the datasets. Click on the name of the replicate set, or the individual slide name if you just want information about that specific hybridization. From the slide/dataset details you can choose to download the dataset or find out more about the RNA sample used for the hybridization.</li>
<li>Find other experiments that include this array element. Click on the array element name to view the detailed information about this element including a list of all experiments in which the element is included on the array.</li>
<li>Find other information about the locus by clicking on the (AGI) locus name. This will open a new view showing the TAIR locus detail page. From this page you can find other information such as functional annotations, alleles/polymorphisms, gene and protein features and publications.</li>
<li>View a description of the sample treatment for each slide variables. Click on the sample variable term to view the sample details for that hybridization.</li>
</ul>
<h2>Troubleshooting Problems with the Microarray Expression Search and Results</h2>
<h3>Default parameters for signal values</h3>
<p>The default parameters for Affymetrix data returns data from all experiments where the signal call is 'Present'. For cDNA array data, the default results include all experiments in which the relative expression value is 'Expressed' above 2-fold.</p>
<h3>Not getting any results</h3>
<p>The most common reason why searches may fail to yield results is that too many restrictions have been imposed in the search.  Try using fewer, rather than more options. The default values are generally less restrictive. Resist the temptation to change these values unless you are absolutely sure you need to. You can always use the sort functions in the results pages to manipulate the data to show the most interesting results first.</p>
<p>The second most likely cause is incompatible combinations of selected parameters. For example, choosing the wrong combination of platform and array element name in step 5. </p>
<h3> Too many results obtained</h3>
<p>The default search works by finding every data point from replicate hybridizations that meet the search criteria. When searching for gene expression data in bulk (e.g. with a list of locus identifiers), this can result in quite a large set of data returned. Imposing more restrictions, such as limiting to expression values above a specific threshold, or searching with fewer genes can help produce a more manageable list. Alternatively, the results can be downloaded and post-processed using Excel or PERL scripts (if you happen to know how to write PERL). Up to 200 rows of data can be displayed and downloaded at a time in the results page. We are currently working to provide a download all option which will allow users to obtain the entire result set in one file.</p>
<h3> Suggestions for managing/organizing expression results </h3>
<p> The most common use of public microarray data is to generate an expression profile of a gene or set of genes to determine under  what conditions is the expression of the gene(s) of interest detected, increased or decreased? What follows are some suggestions for making interpretation of  the expression data a little more manageable.</p>
<p> Divide the query in to data sub sets. For example, use the 'Experiment Category' option to obtain results for specific types of treatments (abiotic and biotic treatments, tissue comparison).</p>
<p> Use the sort functions to find interesting expression patterns. On the results page, use the 'sort by' Experiment name option to group hybridizations from the same experiment together to find experiments in which the expression of your gene of interest is varied. </p>
<p>Use multiple windows. When opening links from the results page, use the "open in new window' or 'open in new tab' option in your browser. For example, if a gene shows an increase in expression in one slide in an experiment relative to another  slide , you will want to experimental/sample conditions for each slide to determine which is the experimental and which is the control slide. Opening the slide description in a second browser window allows you to view the information about the experimental condition at the same time as you are viewing the expression data.</p>
</div> <!--right column-->
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>