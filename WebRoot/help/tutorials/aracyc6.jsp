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
<jsp:param name="id" value="20005" />
</jsp:include>

<jsp:include page="/jsp/includes/aracyctutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Evidence Codes and Their Usage in AraCyc"/>
</jsp:include>

<div id="rightcolumn">


<!--content goes  here//-->
<span class="mainheader">Evidence codes and their usage in AraCyc</span>
<p>As with any informatics resource it is important to be able to assay the quality of the data in the AraCyc database. There are several ways in which the certainty of data in AraCyc can be determined: 1) Through the use of evidence codes associated to the pathways, enzymes and reactions, and 2) for computationally derived pathways, color coding of the pathway glyph to indicate how well supported individual reactions are. This tutorial describes the evidence codes used in AraCyc and how they can be used to evaluate data quality.</p>
<a  name="codes"></a><h3>Evidence Codes</h3>
<p>AraCyc (and all other databases in the MetaCyc/BioCyc family) use a controlled vocabulary of evidence codes. The three main classes of evidence are graphically represented on database detail pages. The evidence codes are organized into an ontology which is available from the <a href="http://bioinformatics.ai.sri.com/evidence-ontology/" target="_blank">SRI pathway tools site</a>.</p>
<a name="pathevidence"></a><h3>Evidence in Pathways</h3>
<p>An icon representing the evidence is shown in the upper right hand corner of  each <a href="aracyc2.jsp#pathway">pathway detail page</a>. The icons include a flask (experimental evidence) <img src="flask.gif" alt="flask" />, a book (evidence that is a traceable author statement from  the literature) <img src="book.gif" alt="book" />,  or a computer (computational evidence) <img src="computer.gif" alt="computer" />.</p>
<p>As an example, take a look at the pathway detail page for <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=NIL&object=PWY-361" target="_blank">Lignin Biosynthesis</a>.</p>
<ol>
<li>Go to the upper right hand corner of the overview. In this pathway there are two evidence icons displayed, a flask and a book.</li>
<p class="sm">More than one evidence type can be used. The book represents evidence taken from an author statement in from the literature. The flask indicates that evidence for the pathway was also based on experimental data from the literature.</p>
<li>Point the mouse over one of the icons to see a brief explanation of the evidence code.</li><p />
<li>Click on the evidence icon to display a definition of the evidence code and a link to the source of the evidence (e.g. the paper in which an experimental assay is described).</li>
<p class="sm"> In this example, the Evidence based on author statement is listed in the reference section. This is linked to the PubMed record for the paper.</p>
</ol>
<a name="reacevidence"></a><h3>Evidence for enzymatic activities</h3>
<p>Enzymes catalyzing reactions  are also annotated with evidence codes. The same codes and icons are used for enzymes and pathways.</p>
<ol>
<li>Using the same example pathway as before (lignin biosynthesis), zoom in on the pathway using the 
'more detail' button. Let's say you are interested in the enzyme which catalyzes the conversion of coumaroyl-CoA to 4-coumaroylshikimiate (hydroxycinnamoyl CoA:shikimate hydroxycinnamoyltransferase). Click on the name of the enzyme on the pathway diagram to see the <a href="http://aracyc.stanford.edu:1555/ARA/new-image?type=ENZYME&object=MONOMER-3362" target="_blank">enzyme detail page</a>.</li>
<p class="sm"> Each of the activities catalyzed by this enzyme has an evidence icon in the upper right corner. In this example, both enzyme activities are supported by author statements (book icon). Click on the icon to see the reference(s) supporting the function of the enzyme in this reaction.</p>
</ol>
<a name="schemevidence"></a><h3>Understanding the pathway evidence glyphs</h3>
<p>The pathway evidence glyph on the pathway detail page for PREDICTED pathways is another source of information about how well supported any pathway is. Each of the reactions in the pathway is color coded to indicate how much is known about a given pathway. For example if an enzyme catalyzes a reaction that is unique to a pathway and is found in Arabidopsis, this may represent stronger evidence for the existence of that pathway compared to an enzyme that functions in multiple pathways (e.g. it is not clear if all pathways are represented). It can also be useful for identifying so called, pathway holes where the enzymes which catalyze specific reactions have not yet been identified. This may suggest experiments to identify the missing components.</p>
<p>An example of a pathway evidence glyph is seen in the bottom of the <a href="http://www.plantcyc.org:1555/ARA/new-image?type=PATHWAY&object=ARO-PWY" target="_blank">Chorismate Biosynthesis</a> detail page. Most of the reaction lines are green, meaning the enzyme that catalyzes the reaction has been identified in Arabidopsis. Some are also colored orange, meaning the reactions are unique to Chorismate biosynthesis. Note that a few of the enzymes catalyzing unique reactions have not yet been identified in Arabidopsis.</p>

</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>