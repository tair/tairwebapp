<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "TAIR Microarray Tutoriall";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="2023" />
</jsp:include>

<jsp:include page="/jsp/includes/microtutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Finding arrays that contain a gene or set of genes"/>
</jsp:include>

<div id="rightcolumn"



<!--content goes  here//-->
<span class="mainheader">Finding array elements (probe sets) for a gene or sets of genes</span>
<p>Depending on the type of array, the element may correspond to a cDNA/EST or set of short oligomers that hybridize to the mRNA product of the locus. Not all genes are represented on all arrays. Some array designs (particularly cDNA arrays) include only a specific subset of genes, such as genes thought to be expressed in response to pathogens. Affymetrix has two commercially available array designs for Arabidopsis. The <a href="http://www.plantphysiol.org/cgi/content/full/124/4/1472" target="_blank"> AG</a> or 8K array, includes probe sets for approximately 8000 Arabidopsis genes.The <a href="http://www.blackwell-synergy.com/links/doi/10.1111/j.1365-313X.2004.02061.x/abs/;jsessionid=lpOEV1Xo-FOg" target="_blank">ATH1 array</a> (also known as the 23K or 25K array) includes probe sets that were designed to represent approximately 23,000 genes. Another popular platform is the Complete Arabidopsis Transcriptome MicroArray (<a href="http://www.catma.org/" target="_blank">CATMA</a>), which is used by several services. The CATMA arrays use spotted gene-specific tags (GSTs) representing approximately 21,500 Arabidopsis genes (<a href="http://www.genome.org/cgi/content/abstract/14/10b/2176" target="_blank">Hilson, et.al. Genome Research, 2004</a>).</p>
<p>At TAIR, we use BLAST to map array elements to the corresponding Arabidopsis locus. In some cases, an element cannot be unambiguously assigned to a locus-which may be a design feature for some arrays. For example, in the ATH1 array, probe sets that end in a _at suffix are unique, those ending in a _s_at suffix match two  or more paralogs and those with a _x_at suffix represent hypothetical genes from paralogous groups (<a href="http://www.blackwell-synergy.com/links/doi/10.1111/j.1365-313X.2004.02061.x/abs/;jsessionid=lpOEV1Xo-FOg" target="_blank">Redman, et.al.,Plant Phys.2004</a>). These mappings off array elements to the genome is updated whenever the genome annotation is updated. The current mapping reflects the Arabidopsis genome annotation from the final TIGR release (Version 5.0).</p>
<h3> Finding array elements from the locus detail pages.</h3>
<p>The locus detail pages present a comprehensive view of experimentally verified and predicted genes in the Arabidopsis genome. The detailed views include associated information including array elements that map to that locus.</p>
<ol>
<li>From any locus detail page (e.g.<a href="/servlets/TairObject?id=40536&type=locus">AT3G45780 or NPH1</a>) scroll to the section labelled RNA Data. </li>
<p class="sm">This section lists all of the microarray elements, cDNA and EST clones for the locus. In the event that a locus does not have any associated microarray elements, cDNA or EST clones, the RNA data section will not appear on the locus page.</p>
<li>Find the section marked Data from Expression Microarrays. One or more element may appear in this list.</li>
<p class="sm">Each array element may be associated with an average log ratio and standard error. The log ratio is the normalized intensity of that element across all experiments stored in TAIR. The standard error is a measure of the significance of the log ratio.</p>
<li>Click on the array element name to find detailed information.</li>
<p class="sm">From the array element detail page you can find a list of all experiments in expression of the gene was detected, sequence of the element (if available) and all of the array designs (in TAIR) that contain this element.</p>
<li>Find similarly expressed genes in Arabidopsis by clicking on the link to the Expression Viewer.</li>
<p class="sm">The <a href="/help/helppages/help_expression.jsp">Expression Viewer</a> is a tool for visualizing clusters of genes that are similarly expressed within a subset (categories) of experiments. This option is currently only available for array elements from the AFGC cDNA arrays. See the <a href="micro5.jsp">next page</a> of this tutorial to learn about other related resources. </p>
<li>Click on the Spot History link to visualize the behavior of this element across all experiments.</li>
<p class="sm">The spot history shows a histogram indicating the normalized, log-transformed red/green intensity of the spotted element graphed against the frequency of occurrence in all arrays. It can be used to identify experiments in which the expression of a given gene is most interesting. This option is currently only available for the array elements from the AFGC cDNA arrays. <a href="http://arabidopsis.info">NASC</a> also has a Spot History tool available for all of the experiments using CATMA arrays that are stored in the <a href="http://affymetrix.arabidopsis.info/narrays/experimentbrowse.pl">NASCArrays database</a> (<a href="http://nar.oupjournals.org/cgi/content/full/32/suppl_1/D575">Craigon, et.al., NAR, 2004)</a>.</p>
</ol>
<h3> Using the Microarray Element Search</h3>
<p> The Microarray Element search can be used to find a gene or set of genes is represented on an array. The search is limited to only those array elements stored in TAIR. It can also be used to find the locus or loci that correspond to an array element(e.g. a probe set or EST). For example, if you have identified a cluster of array elements that have an interesting expression profile, you can use the Microarray Element Search to find more information in TAIR about the corresponding locus.</p>
<ol>
<li>Go to the <a href="/tools/bulk/microarray/index.jsp" target ="_blank">Microarray Element Search</a>. From the home page, this is in the Advanced Search section and in the Search section of the navigation bar.</li>
<li>Enter the name(s) of the genes or array elements of interest.</li>
<p class="sm">You can enter a list of locus identifiers (e.g. At5g01810) or array element names (e.g. 12647_s_at) but not both. For elements that have sequences in GenBank (such as EST/GST or clone sequences) you can also use the GenBank accession. For more than one entry , each item on the list must  be separated by a tab,comma or carriage return. You can also upload the list as a text only file from your computer.</p>
<li>Choose an array design to search against.</li>
<p class="sm"> You can only search one array design at a time. </p>
<li> Select the output format.  Choose either text or HTML.</li>
<p class="sm">Choose the HTML option if you want to view links to additional information in TAIR such as locus detail pages. For array elements from the AFGC, the links include a link to the Spot History at the Stanford Microarray Database and the <a href="/help/helppages/help_expression.jsp">Expression Viewer</a>.Choose text if you want to download the list to your computer. If your query returns more than  1000 matches, only the text output will be given.<p>
<h2>Troubleshooting the Microarray Experiment Search</h2>
<h3>No results found when searching with a locus name</h3>
<p> If you do not find any array elements for one or more loci on your list, try searching against a different array design. For example, fewer genes are represented on the Affymetrix 8K and AFGC cDNA arrays. You can take the list of genes/elements not found in your search and redo the query using that set of identifiers against a different design.</p>
<h3>No results found when searching with an array element name</h3>
<p> The most likely reason why this occurs is that the combination of name and array design is not compatible. For example you searched with an EST element name against an  Affymetrix array design.</p>
<h3>Downloading mapping files from the FTP site</h3>
<p>TAIR's complete sets of mappings between array elements and loci can be downloaded using the file transfer protocol (FTP) from our FTP site. The text files can be saved onto your personal computer and opened in a spreadsheet program such as Microsoft Excel or any text editor.</p>
<ol>
<li>From the home page, find the section marked 'FTP Downloads' or from the navigation bar, click on the link to FTP.</li>
<li>Click on the Microarray link from the home page, or the folder in the FTP directory.</li>
<li>From within the Microarray folder, find the folder containing the elements for the array you are using (e.g. AFGC, Affymetrix or CATMA). For example, to find the mapping file for the Affymetrix ATH1 array, select the Affymetrix folder.</li>
<li>Within the Affymetrix folder you will find two files, click on the one named affy_25k_array_elements to begin downloading the file.</li>
<p class="sm"> Each file also has a date appended that indicates when the file was last created.Older versions of the mapping files are stored in the same directory in a folder labelled 'old'. TAIR maintains these older mappings for researchers to be able to recreate an analysis that may have been done with an older version of the genome annotation because the association of an element to a locus can change.</p>
<li>To find a description of all of the fields in the mapping file, click on the README file in the same directory.</li>
<p class="sm">The README file is a text file that describes the contents of the data files in that directory.</p>
</ol>
</div> <!--right column-->
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>