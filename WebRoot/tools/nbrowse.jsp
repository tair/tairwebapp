<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR - NBrowse";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="803" />
</jsp:include>

<div id="nbrowse" style="margin:5px;width:750px">
<!--CONTENT HERE//-->

<div style="text-align:center" class="mainheader">N-Browse for Arabidopsis: A protein-protein interaction viewer</div>
<p style="font-weight:bold">N-Browse is an interactive graphical browser for biological networks. From this page you can launch N-Browse for <i>Arabidopsis thaliana</i>. The current curated TAIR Arabidopsis interaction network contains 8626 experimentally verified protein-protein interactions curated by TAIR, BioGrid and/or IntAct.</p>

<%--
<p style="font-size:1.5em;font-weight:bold"><input type="button" onclick="location.href='http://aquila.bio.nyu.edu:8080/NBrowse2/NBrowseJnlp'" value="Launch N-Browse" /></p>
--%>

<script type="text/javascript">
function cb_click(elem){
 var group = document.getElementById('querygroup');
 var tb = elem.form['-q'];
 if(elem.checked){
  tb.disabled = false;
  tb.focus();
 } else {
  tb.disabled = true;
 }
}
</script>

<form action="http://aquila.bio.nyu.edu/cgi-bin/NBrowseJnlp" method="GET">
<div style="border:1px solid grey;padding:0 0 15px 10px">
<p style="font-size:1.5em;font-weight:bold">Launch N-Browse</p>
<p id="querygroup"><input type="checkbox" id="withquery" onclick="cb_click(this)"/><label for="withquery" style="padding-left:5px">Launch with query:</label> <input type="text" value="" name="-q" disabled="disabled"/> (use AGI name i.e. AT1G01040 or Symbol i.e. COP9)</p>
<input type="submit" value="Launch" onClick="urchinTracker('/outgoing/nbrowse');" />
<input type="hidden" value="TAIR" name="-d" />
</div>
</form>

<p style="font-weight:bold">Contents<p>
<ul style="padding-left:10px;">
 <li style="list-style-type:none"><a href="#nb-tut" alt="tutorial">N-Browse tutorial</a></li>
 <li style="list-style-type:none"><a href="#nb-about" alt="about">About the dataset</a></li>
 <li style="list-style-type:none"><a href="#nb-req" alt="requirements">Systems Requirements</a></li>
 <li style="list-style-type:none"><a href="#nb-contact" alt="contact">Contact</a></li>
</ul>

<hr /><hr />

<div style="font-size:1.5em;font-weight:bold;margin:10px 4px"><a name="nb-tut" style="color:black">N-Browse Tutorial</a></div>

<h2 style="border-bottom:1px solid grey">Overview of the main sections of the N-Browse viewer</h2>
<img src="/images/figure_overview_squares.jpg" />
<p>N-Browse is composed of 4 main sections: The header (1) contains a query window allowing the user to search for their gene of interest using AGI, symbol or
full-name search terms. In addition, a search window on the right hand side of the header, allows the user to locate a gene within the network, which is of
particular use when the interaction network is large. The protein-protein interaction network is visualized in the main window (2). 
If no interactions were identified for the queried gene, no interaction network will appear. On the upper left, the 'Edge Filter' window (3) provides the user with edge attributes that can be used to
filter edges. Currently the only available edge attribute here are the experiments used to identify
the protein interactions. On the bottom left the 'Information' panel (4) displays information about nodes (protein function)
and edges (links to the specific papers in Pubmed where the protein interaction data was published).</p>


<h2 style="border-bottom:1px solid grey">Launching a query and finding information about nodes (proteins)</h2>
<img src="/images/figure1_nodes_edges.jpg" />
<p>To start a new query, (1) enter a gene locus name (AGI name i.e. AT1G01040 or symbol name i.e. COP9)
in the 'Search New Gene' textbox and hit enter. In the example shown in the figure above, a query was done using the
symbol HY5. The resulting interaction network is composed of nodes (proteins) and edges (interactions) and
the queried protein HY5 (2) is highlighted in the center of the interacion network. As indicated in red text below the graph, this network is composed of 10 proteins and 41 interactions. Edges are color-coded based on the type 
of experiment used to detect the interaction. For example, the edge colored in red (3)
was identified using a Biochemical assay (see 'Edge Filter' section in the upper left corner for all color-coded experiments).
By mousing over a node, the functional information of that protein, including all symbols and full-names as well as the
functional description, are displayed in the 'Info' section as shown in (4). The network can be expanded on a node-by-node basis by simply double-clicking on the nodes of interest. As a result of the expansion, part of the network might extend beyond the viewable area. The horizontal scrollbar can be used to zoom in and out to either see the complete network or look add some interactions in more detail.
If a query term is ambigious either because the search term is partial and contained in several names (i.e. RPS) or because the query term, although complete, 
corresponds to several different genes (i.e. RPS2 which is the symbol of the genes AT3G03600, AT4G26090 and ATCG00160) a 'Query Completion Table' pops
up containing all possible terms among which the user can choose from.</p>

<h2 style="border-bottom:1px solid grey">Finding information about edges (interactions)</h2>
<img src="/images/figure2_edges.jpg" />
<p>By clicking on an edge (1), the information in the 'Info' section switches to 'Edge Info' (2). It displays the names of
the nodes that are involved in this interaction, the experiment-category and the specific method 
that identified the interaction, as well as a link to the interaction's publication in Pubmed.
If an interaction was found by multiple methods and papers, all of these are listed here. The user can filter interactions based on their method by unselecting methods in the 'Edge Filter' 
section (3). Edges that correspond to the unselected methods disappear in the current view and will
not be visible in any new networks until the method is reselected. By selecting the 'Multi-Edge Only'
option, only those nodes will remain visible that are linked by 2 or more edges. Be advised that
the Multi-Edge functionality defines an edge as an 'Interaction <u>Category'</u> such as 'Biochemical Assays' or 'Biophysical Assays' and
not as an 'Interaction <u>Method</u>' such as 'Affinity technology' or 'Enzymatic study'. This means that when
selecting the 'Multi-Edge Only' button, 2 proteins that were identified as interacting by 'Fluorescence technology' and 'Affinity
technology' would remain visible but 2 proteins identified as interacting by 'Enzymatic Study' and 'Affinity
Technology' would disappear.</p>

<h2 style="border-bottom:1px solid grey">How to select and move nodes</h2>
<img src="/images/figure3_selecting_and_dragging.jpg" />
<p>By selecting Ctrl + right-click in the empty area around the network, a menu will appear that allows the user to select
all nodes and to customize styles and colors of nodes and edges. By right-clicking on a node, all other nodes
that directly interact with the selected node are highlighted (in the above example, all direct interactors of COP1 are highlighted). All highlighted nodes are grouped and can be moved
by selecting (right-clicking) one of them and dragging them.</p>

<h2 style="border-bottom:1px solid grey">How to visualize GO terms from a selected set of nodes</h2>
<img src="/images/figure4_goterms.jpg" />
<p>For a selected set of genes, or for a single gene, all associated Gene Ontology (GO) terms are shown in the GO tree. First, click on
the 'GO Browser' tab (1), then click on 'Show Selection' (2). The GO tree then expands in the GO Browser window in order to show all GO terms (highlighted in red)
assigned to the selected nodes. By clicking on a given GO term, all nodes in the current network that share this GO term, <u>including</u> nodes that
were <u>not</u> originally selected, are highlighted in yellow.</p>

<h2 style="border-bottom:1px solid grey">How to load your own file and overlay it with the curated interaction data</h2>
<img src="/images/figure5_uploadfile.jpg" />
<p>In order to load your own list of interactions to N-Browse, select 'Open File' in the File menu (1), then upload your file (2) (Please follow this <a href="http://aquila.bio.nyu.edu:8080/NBrowse/upload_tutorial.html" alt="upload tutorial">link</a> to see all possible formats when uploading files. In this example
the file contained the following 4 interactions: HY5-AT1G01010, HY5-PAP1, HY5-DET1 and HY5-COP9 as shown in (3)). 
In the resulting network, edges found in the user's interaction list are displayed in a distinct color (yellow in this example). Also, a new edge category, called 'Unknown' (unless a specific name is indicated in the uploaded file), appears in the 'Edge Filter' panel.The option 'Correlate with DB' is checked by default, allowing the user to overlay their own interactions with the curated dataset. To see the uploaded interaction set independently from the curated set, 'Correlate with DB' needs to be unchecked. The node given as 'Starting Point' will be the center of the shown
network. To see interactions from your list or the database that do not represent <u>direct</u> interactions of the 'Starting Point', expand the
network by clicking on each node of interest.
</p>

<h2 style="border-bottom:1px solid grey">How to save your session and export your data</h2>
<img src="/images/figure6_export.jpg" />
<p>A protein interaction network visualized in N-Browse can be saved in 3 different ways: If the users wants to continue working on the exact same network interactively, with the same settings,
they can do so by saving their session (this option is not available on non-Intel based Macs). The session can be re-opened at a later time by choosing 'Open Session' from the File menu. This can be done by selecting the 'Save Session File' (2) option in the 'File' menu. If the users want to save a static image of
the analyzed network, this can be done by selecting 'Export Image' (3) from the 'File' menu. A list of binary interactions coresponding to all edges in the current network can be saved by selected 'Save File' (1) in the 'File' menu.</p>

<hr /><hr />

<div style="font-size:1.5em;font-weight:bold;margin:10px 4px"><a name="nb-about" style="color:black">About the dataset: How the current N-Browse Arabidopsis protein interaction set was generated</a></div>
<p>The current protein-protein interaction set shown in N-Browse was generated using the following 3 sources: TAIR, BioGRID and IntAct:</p>

<ul>
 <li><b>BioGRID</b>: We used the BIOGRID-IDENTIFIERS-2.0.60.tab.txt set, downloaded from <a href="http://www.thebiogrid.org" alt="the bio grid">www.thebiogrid.org</a>.</li>
 <li><b>IntAct</b>: To retrieve Intact interactions, we used the Intact Ontology search tool at <a href="http://www.ebi.ac.uk/intact/main.xhtml" alt="Inact Ontology">www.ebi.ac.uk/intact/main.xhtml</a> and searched for Arabidopsis thaliana interactions. Interactions that originated from spoke expanded co-complexes are currently not included in the IntAct dataset used in N-Browse.</li>
 <li><b>TAIR</b>: A list of protein interactions curated by TAIR curators, available from the TAIR ftp site, was also included in this project.</li>
</ul>

<p>Several filters were applied on these original 3 lists to eliminate interactions:</p>
<ul>
 <li>where one interacting protein was NOT an Arabidopsis protein</li>
 <li>where names did not correspond to valid current TAIR9 AGI names</li>
 <li>for which no pubmed ID was available</li>
</ul>


<p>We then collapsed interactions that only differed in their directionality (information on whether an interaction is bidirectional will be added in the next N-Browse release).  Currently, all interactions shown in N-Browse are experimentally verified but we are planning on adding a distinct set of computationally predicted interactions in a later version of N-Browse.</p>

<p>We used the Molecular Interaction (MI) Ontology (<a href="http://www.ebi.ac.uk/ontology-lookup/browse.do?ontName=MI" alt="Molecular Interaction Ontology">http://www.ebi.ac.uk/ontology-lookup/browse.do?ontName=MI</a>) to group interactions into experimental categories that can be used to filter out edges in N-Browse. Although IntAct and BioGRID provided information on the method used for the detection of most interactions, these methods are found on different levels of the MI Ontology and some manual work was necessary to group detection methods into higher-level categories.
We used the 6 root 'experiment' detection terms in the MI Ontology (biophysical, biochemical, imaging technique, protein complementation assay, genetic interference, post transcriptional interference) and their direct child terms (f.ex. 'Affinity technology' is a direct child term of 'biochemical' experiment) to categorize all protein interactions.</p>

<hr /><hr />

<div style="font-size:1.5em;font-weight:bold;margin:10px 4px"><a name="nb-req" style="color:black">Systems Requirements</a></div>

<p>Requirements:</p>
<ol>
 <li>The web browser must be configured to accept cookies. N-Browse uses cookies to maintain session information for each user.</li>
 <li>Java JRE/JDK version 1.4.2 and above.</li>
</ol>

<p>Suggested internet browsers:</p>

<table>
 <tr><td>Operating System</td><td>Internet browser</td></tr>
 <tr><td>Linux (Redhat, Debian, Fedora ...)</td><td>Mozilla Firefox 1.0.4 and above</td></tr>
 <tr><td>Windows</td><td>Internet Explorer 6 and above</td></tr>
 <tr><td>Mac OS 10.3</td><td>Safari 1.3/Mozilla Firefox 1.0.4 and above</td></tr>
</table>

<hr /><hr />

<div style="font-size:1.5em;font-weight:bold;margin:10px 4px"><a name="nb-contact" style="color:black">Contact</a></div>
<p>The N-Browse team:<br>
Huey-Ling Kao, MS<br>
Fabio Piano, PhD<br>
Kris Gunsalus, PhD<br>
Monty Schuman<br>
Mark Gibson<br>
Please direct questions and comments to the administrator at: hueyling@nyu.edu<br>
For questions regarding the Arabidopsis N-Browse dataset, please contact Philippe Lamesch at plamesch@stanford.edu
</p>

</div>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

