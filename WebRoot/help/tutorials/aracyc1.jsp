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
<jsp:param name="id" value="20000" />
</jsp:include>

<jsp:include page="/jsp/includes/aracyctutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Searching AraCyc: Pathways, Reactions, Genes and Compounds"/>
</jsp:include>

<div id="rightcolumn">


<!--content goes  here//-->
<span class="mainheader">Finding Pathways, Compounds, Reactions, Genes and Enzymes in AraCyc</span>
<p>The main AraCyc query page provides three options for finding data in the the database. The query function allows you to search the database for specific entries by name. If you are unsure of the name of what you are looking for , or simply want to know the extent of information in the database, you can browse through the classification data in AraCyc (the ontologies) to identify a pathway, reaction or enzyme of interest. Alternatively, you can select from a list of pathways, proteins, compounds or genes.</p>
<ol>
<li>From the <a href="/biocyc/index.jsp" target="_blank">AraCyc main page</a> go to the <a href="http://www.plantcyc.org:1555/ARA/server.html" target="_blank">Main Query Page</a>. </li>
<li>Select the A.thaliana COL dataset.</li>
<li>In the section marked 'Query' choose 'All (by name)' from the drop down menu.<br />The drop down menu selector can be used to specify a subset of data to search by name, or in some cases Enzyme Commission (EC) numbers (for proteins and reactions). The options are 'all' , 'genes', 'proteins', 'compounds,'  'reactions' and, 'pathways'.</li>
<li>Enter the search term (e.g. sucrose) into the text entry box.</li>
<li>Click the Submit button.<br /><i>This example search will find ALL objects in the database containing the term 'sucrose' as a substring anywhere in the name. That means you can also use shorter strings such as 'suc'. Note that the substring search means 'suc' would also return phrases like the reaction: "isocitrate = glyoxylate + <u>suc</u>cinate" The search is also case-insensitive.<br />
If more than one term is included in the search, you must format the query according to the following rules: If the two terms are separated by a comma, the search is treated as a logical OR. That is, a search for "starch", "biosynthesis" will return results where either starch OR biosynthesis is included in the name. If no comma is included, then the search is treated as a logical AND. Therefore, a search with the phrase 'biosynthesis starch', will return results where both terms are included in the same name.</i></li>
</ol>
<h2>Using the search results</h2>
<p>Using the example query above (find all objects containing the term 'sucrose') returns a list of results. Because there are many data types (e.g. compounds, reactions, pathways) in the database that contain this term in the name, multiple items are listed that are grouped by type. </p>
<ol>
<li>Scroll through the results to find the specific item of interest. For example, if you are interested in the sucrose biosynthetic pathway, locate the section labelled "Pathways" and click on the link to <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&amp;object=SUCSYN-PWY" target ="_blank">Sucrose Biosynthesis</a>.</li>
</ol>
<p> Each item in the results list is linked to a detail page that contains all of the information in AraCyc about that item. Detail pages in AraCyc are interlinked, therefore it is possible to find detailed information about related data from the detail pages. For example, details about genes, proteins, reactions and compounds involved in sucrose biosynthesis can be obtained by following links from the pathway detail page.</p>

</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
