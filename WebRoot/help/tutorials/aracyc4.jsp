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
<jsp:param name="id" value="20003" />
</jsp:include>

<jsp:include page="/jsp/includes/aracyctutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Using the Metabolic Map Overview"/>
</jsp:include>

<div id="rightcolumn">


<!--content goes  here//-->
<span class="mainheader">Using the Metabolic Map Overview Diagram</span>
<p>The Metabolic Map Overview provides a bird's eye view of all of the pathways in AraCyc. The pathways are represented by schematic illustrations and provide an entry point for browsing data in AraCyc. The pathway overview diagram also forms the basis for the <a href="aracyc5.jsp">Omics viewer</a> which is used for painting expression, metabolomic and proteomic data onto biochemical pathways. The following tutorial illustrates how to interpret the metabolic map and to use it to find information about pathways, reactions, compounds and enzymes. See the  <a  href="aracycmap.mov" target="_blank">Quicktime movie</a> demonstrating how to use the Metabolic Map overview.</p>
<ol>
<li>To access the metabolic map go to the AraCyc <a  href="/biocyc/index.jsp" target="_blank">Main Query Page</a>, click on the link to the <a  href="http://www.plantcyc.org:1555/ARA/new-image?type=OVERVIEW" target="_blank">Metabolic Map</a>.
<br />The overview diagram shows all of the pathways in Arabidopsis that are included in the database. Pathways are arranged in the diagram into groupings that separate predominantly catabolic processes (right side), anabolic/biosynthetic pathways (center) and intermediary metabolism (left). To the extreme right are reactions that are currently not assigned to any pathway. Signal transduction pathways (if they exist) are represented on the bottom of the diagram.</li>
<li>To distinguish elements in the overview diagram, a key is provided in the upper right hand corner. Pointing the mouse over any of these elements will display a pop up window. On mouse-over,  it displays the name of compound name, pathway, and when available, the superpathway. Click the mouse and  the pop up expands and displays hyperlinks to the various elements, but additionally, shows the genes for each reaction. <br />
<img align="middle" src="metamap.gif" alt="metabolic map">
Within the diagram, blue lines represent individual reactions. Lighter grey lines represent reactions which are known to exist in other species, but in Arabidopsis, have no genes (enzymes) yet identified (also known as a pathway hole).</li>
<li>Click on any compound or reaction to display a <a  href="aracyc3.jsp#pathway">Pathway detail page</a>. When you mouse over objects, the status bar in the browser will indicate what data detail page the object links to (such as a compound, pathway, enzyme or reaction detail page).</li>
</ol>
<p><b>Note</b>: In order for the pop up windows and status bar to function as expected, your browser must support Javascript and have Javascript enabled. You can set your Javascript preferences from the Preferences menu in your browser.</p>

</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
