<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "AraCyc Tutorial";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="20001" />
</jsp:include>

<jsp:include page="/jsp/includes/aracyctutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Understanding the AraCyc Detail Pages"/>
</jsp:include>

<div id="rightcolumn">


<!--content goes  here//-->
<span class="mainheader">Understanding and navigating the AraCyc detail pages</span>
<p>Each type of data in AraCyc has a detail page which can be accessed by the search function or through hyperlinks from other data detail pages.
This section describes the <a  href="#pathway">Pathway Details</a>, <a  href="#reaction">Reaction Details</a>, <a   href="#compound">Compound Details</a>, and <a  href="#enzyme">Enzyme Details</a>. These detail pages are essentially identical to the detail pages in MetaCyc.
</p>
<h3><a name="pathway"></a>Pathway Detail Pages</h3>
<p>Each pathway in AraCyc is represented on detail pages in a zoomable graphical format along with links to information about the reactant and product compounds, enzymes, genes and reactions. Starting with an example <a  href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&amp;object=SUCSYN-PWY" target= "_blank">Sucrose Biosynthesis</a> we will examine the features of the pathway detail page.</p>

<ol>
<li>Pathway Diagram: Each pathway contains some of the following color-coded information. Reactions are shown in blue lines, enzymes in yellow, genes in purple, compounds are red. Brown arrows indicate related pathways (e.g. pathways that feed into or depend upon the currently viewed pathway); click on the arrow to link to the pathway detail page for the related pathway. Each of the data types in the pathway diagram are linked to their own detail pages.</li>
<li>Zoom Level Controls: The upper portion of the pathway detail page has two buttons which allow you to zoom in (or out) on the diagram. Click on the "More Detail" button to zoom in and show more information about the pathway. When the highest level of resolution is displayed, only the "Less Detail" button will be displayed.</li>
<li>Evidence: Each pathway in AraCyc is associated with an evidence code which indicates the type of supporting data used to support the existance of the pathway in Arabidopsis. For more specific information, see the section on evidence codes in <a  href="aracyc6.jsp">this tutorial</a>. The evidence code icon is shown in the upper right hand corner of the pathway detail page. More than one type of evidence may be associated with a pathway. Click on the icon to see details about the evidence and links to the citations where the supporting evidence was derived.</li>
<li>Map locations of genes: A graphic displaying the genomic distribution of genes coding for enzymes in the pathway is shown below the pathway diagram.The five nuclear chromosomes of Arabidopsis are shown, with tick marks corresponding to the genes. Pointing a mouse over the tick marks will display a small pop up window with the name,chromosome and coordinates of the corresponding gene. Clicking with the mouse will open a new window showing the TAIR locus detail page for that gene. This feature is not available in MetaCyc</li>
<li>Related Pathways: Pathways in AraCyc and MetaCyc are classified into a hierarchy of superclasses. The superclasses are hyperlinked to a page displaying all of the pathways contained in that superclass. You can navigate up the hierarchy to display similar pathways.</li>
<li>Comment: Pathway details include a brief summary composed by the database curators.</li>
<li>Citations: For pathways that have been curated (as opposed to computationally predicted), the literature used as references are hyperlinked in this section. Clicking on the citation will display the references used to curate the pathway. Click on the reference to see details about the reference.</li>
<li>Unification Links: This section contains links to other databases containing related information. The links depend on the type of data being displayed. For example, on a pathway detail page, there may be links to the same pathway in MetaCyc where you can find curated data about the same pathway in other species. </li>
<li>Pathway Evidence Glyph: The pathway evidence glyph is displayed only for pathways that have been computationally predicted. The glyph is a symbolic representation of the evidence supporting the individual reactions within a pathway. Even if a pathway diagram shows an flask icon (indicating the pathway is has experimental support), not all reactions in a pathway may be equally well supported. The key below the glyph shows the correlation between the color codes and the evidence.</li>
</ol>
<h3><a name="reaction"></a>Reaction Details</h3>
<p>The reaction detail pages can be accessed directly from the search results (e.g. when searching for a specific reaction) and from the list browser. They are also linked from other, related detail pages such as pathway and enzyme details. To access specific reaction details from the pathway detail page, click on the blue reaction line corresponding to the pathway of interest. For example, in the example pathway 'Sucrose Biosynthesis' click on the blue line corresponding to the first reaction (<a  href="http://www.plantcyc.org:1555/ARA/new-image?type=REACTION-IN-PATHWAY&amp;object=F16BDEPHOS-RXN" target ="_blank">fructose-1,6-bisphosphate to fructose-6-phosphate</a>).The features of the reaction detail page are described below.</p>
<ol>
<li>Superclasses: The reaction hierarchy represented in AraCyc and MetaCyc is derived from the Enzyme Commission (EC) classification. Each superclass is linked to a list of all of the reactions within the category. You can browse the hierarchy to locate related reactions.</li>
<li>Enzymes and Genes:Because AraCyc does not distinguish among isozymes that may act in different pathways- perhaps because they are differentially expressed  temporally or located in physically different compartments, all of the known isozymes that can catalyze the reaction are listed in this section. The enzyme name is linked to the <a href="#enzyme">Enzyme detail page</a>. The gene name (e.g.AGI locus code, AT1G43680) is linked to the corresponding locus detail page in TAIR.</li>
<li>Pathways: Each reaction detail page lists all of the pathways in which the reaction is known or predicted to occur. More than one isozyme can catalyze the reaction; there is currently no correlation between specific isozymes and the pathways in which they act.</li>
<li>Reaction Diagram: A diagram of the reaction is displayed in accordance with the direction of that reaction within a pathway where the substrate compounds are shown to the left of the equation and the product compounds are displayed to the right. Clicking on the chemical structure or name of any compound will open a new display showing the <a  href="#compound">compound details</a> </li>
<li>Gene-Reaction Schematic: The gene-reaction schematic is a graphical representation of the relationship among sets of genes, enzymes and reactions. The blue box on the left indicates the reaction (e.g. EC 3.1.3.11). One or more yellow circles are linked to the reactions. These circles represent polypeptides and protein complexes. The yellow circles are linked to purple boxes which represent the genes which encode the proteins. In the example reaction detail page provided, the circles directly connect the genes to the reactions, indicating that the enzyme functions as a monomer. If the reaction was catalyzed by a  protein complex, each gene would point to the same circle.
Monomer<img src="enzyme1.jpg" alt="protein glyph" /><br />Protein Complex<img src="enzyme2.jpg" alt="enzyme glyph" /></li>
<li>Unification Links: As with the pathway detail page, the unification links point to other databases with similar information. For reactions, this may include links to other databases that describe enzymes, reactions and proteins.</li>
</ol>
<h3><a name="compound"></a>Compound Details</h3>
<p>Detailed information about substrate and product compounds can be accessed directly from the database search, or via links from other data detail pages.As an example, from the preceding reaction detail page (3.1.3.11) click on the compound <a  href="http://www.plantcyc.org:1555/ARA/new-image?type=COMPOUND&amp;object=FRUCTOSE-6P" target="_blank">fructose-6-phosphate</a>.</p>
<ol>
<li>Synonyms: Each compound may have one or more synonyms which are alternative names for the compound. When searching for compounds in the database, all names including synonyms are included in the search.</li>
<li>Superclasses: Compounds are grouped into classes, which indicate their relationship to other classes of compounds. Each superclass is hyperlinked to a list of compounds within that class. This list can be used to find similar compounds to any reactant or product.</li>
<li>Empirical formula and molecular weight: Basic information about the compound such as its empirical formula and molecular weight are shown here. This information can be useful for analyzing metabolomic data.</li>
<li>Structure: The structure of the compound is shown.</li>
<li>Smiles Profile: <a  href="http://www.daylight.com/dayhtml/smiles/smiles-intro.html" target="_blank">SMILES</a> is widely used as a general-purpose chemical nomenclature and data exchange format. This string can be used to find the same compound in other databases that use the SMILES format.</li>
<li>Unification Links: As with the other detail pages, links to similar or related information about the data (in this case, a compound) are listed here and hyperlinked to the corresponding database entry.</li>
<li>Reactions in which the compound is a reactant: For each compound, all of the reactions in AraCyc in which the compound is a reactant are listed here. Click on any of the reactions to see the <a  href="#reaction">reaction</a> details. Reactions that required the compound as a reactant may be affected by changes in the concentration of the compound. </li>
<li>Reactions in which the compound is a product: If a compound is a product of another reaction, the reaction is listed here and linked to the reaction detail page. From this list it may be possible to identify other pathways that are likely to be affected by the concentration of a given compound. For example, a mutation that affects an enzyme reaction that generates a specific compound may ultimately affect the functioning of a pathway in which that compound is used as a reactant.</li>
</ol>
<h3><a name="enzyme"></a>Enzyme Details</h3>
<p>The Enzyme detail pages can be accessed directly from the search results, from the list browser and from other detail pages. From a pathway detail page, click on the enzyme (yellow text) name , or click on the enzyme name on the reaction detail page. For example, from the example <a  href="http://www.plantcyc.org:1555/ARA/new-image?type=REACTION&amp;object=F16BDEPHOS-RXN" target="_blank">reaction detail page</a> click on the name <a  href="http://www.plantcyc.org:1555/ARA/new-image?type=ENZYME&amp;object=AT5G64380-MONOMER" target= "_blank">Fructose-bisphosphatase</a>. Some of the information displayed on the enzyme detail pages are described below.</p>
<ol>
<li>Synonyms: Alternative names for the enzyme are displayed. When searching for enzymes by name in AraCyc, the synonyms are also included in the search. Synonyms may be derived from TAIR's list of aliases or the Enzyme Commissions enzyme nomenclature list.</li>
<li>Superclassess: As with the reactions, pathways and compounds, enzymes are ordered into a hierarchy which can be browsed from this section. In general, reactions are classified according to EC hierarcy. Enzymes are not classified; most fall into the polypeptide category.</li>
<li>Comments: Comments include anything that the curators determine are useful information about the enzyme. Specific information about the isozymes that have been characterized includes data such as physico-chemical properties (e.g. pH, temperature optimum) and kinetic properties (e.g. Km).</li>
<li>Species: In AraCyc, the species indicates the natural accession/ecotype in which this enzyme was found. In MetaCyc, this would indicate the species in which the enzyme is found.</li>
<li>Gene: The gene(s) that encode for the protein(s) that make up the enzyme are listed and hyperlinked to the corresponding locus detail pages in TAIR. If an enzyme is multimeric and comprised of different protein products, all of the genes encoding the proteins will be listed here.</li>
<li>Gene-Reaction Schematic: This is the same diagram that is displayed on the <a  href="#reaction">reaction detail page</a>. In the diagram, the enzyme being displayed is indicated by the filled yellow circle.</li>
<li>Enzymatic reaction: The reaction(s) catalyzed by the enzyme are displayed, with the equation set up to reflect the observed directionality. It is followed by a list of all the pathways in which this reaction occurs. This information can be useful in determining how changes in a given enzyme may affect metabolic pathways. One enzyme may have multiple activities that can catalyze more than one reaction. Each activity and the reaction catalyzed is listed on the enzyme detail page along with the evidence supporting the enzymatic activity.</li>
</ol>
</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
