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
<jsp:param name="id" value="20002" />
</jsp:include>

<jsp:include page="/jsp/includes/aracyctutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Browsing AraCyc: Pathways, Reactions, Genes and Compounds"/>
</jsp:include>

<div id="rightcolumn">


<!--content goes  here//-->
<span class="mainheader">Browsing Pathways, Genes, Compounds and Reactions in AraCyc</span>
<p>There are two ways to browse information in AraCyc: by list or by ontology. The first option allows you to see a <a href="#list">list of all entries</a> for a specific data type (Pathways, Proteins, Compounds or Genes). The second option allows you to <a href="#category">browse the data by category</a> (superclasses). </p>
<a name="list"></a><h3>Browsing by list</h3>
<p>The browse by list option can be used to scan through a list of all entries for a given data type (Proteins, Genes, Pathways and Reactions) in AraCyc.</p>
<ol>
<li>From the <a href="http://www.plantcyc.org:1555/ARA/server.html" target="_blank">Main Search Page</a> go to the section marked "browse by list".</li>
<li>Choose a datatype to list such as Pathways.</li>
<li>A list of all the pathways in AraCyc will be displayed along with the total number of entries in the database.</li>
<li>To view detailed information for a pathway, click on the name of the pathway to view the <a href="aracyc2.jsp#pathway">pathway detail page</a>.</li><p />
</ol>
<a name="category"></a><h3>Browsing by ontology</h3>
<p>The ontology browser allows you to browse related categories for each data type (Pathways, Compounds, Genes and reactions- by EC hierarchy). This option is useful if you want to view specific subsets of data, such as only pathways involved in hormone biosynthesis. The representation of data in hierarchies also is useful for describing the relationships among different data types- such as related pathways, compounds, reactions and genes. </p>
<p>AN IMPORTANT NOTE: Genes in AraCyc are not classified. If you want to browse genes by ontologies of function or biological role, please use the <a href="/servlets/Search?action=new_search&amp;type=keyword" target="_blank">TAIR Keyword Browser</a> to browse the Gene Ontologies. For more information on the Gene Ontologies and browsing keywords,  please read the <a href="go_intro.jsp" target= "_blank">TAIR GO tutorial</a>.</p>
<ol>
<li>From the <a href="http://www.plantcyc.org:1555/ARA/server.html" target="_blank">Main Search Page</a> go to the section marked "Browse Ontology". Choose a data type (e.g. Pathways) from the drop down menu. Then click on the submit button.</li>
<li>The top level of superclasses within the ontology will then be displayed in a hierarchical tree view. A plus sign next to the superclass indicates that there are 'children' terms of this class. To expand a node, click on the plus sign next to the name. Alternatively, to expand all nodes, click on the Expand All button above the tree view.</li>
<li>To see all of the superclasses of pathways involved in biosynthesis, expand this node by clicking on the plus sign next to the term "Biosynthesis".</li>
<li>When the node is expanded, all of the classes of biosynthetic pathways are shown. These classes can be expanded by clicking on the plus sign next to the name of the class.
<i>Expanded classes can be collapsed by clicking on the minus sign next to the name. Alternatively, all expanded classes can be collapsed by clicking on the Collapse All button at the top of the hierarchy.</i></li>
<li>Multiple levels of classes can be found for most of the pathways. Continue to expand nodes until no more plus ( or minus signs) appear. For example, to see all of the pathways for hormone biosynthesis, click on the plus sign to expand this node. Click again, to expand the node for plant hormones.<i>Because AraCyc uses the same ontology as MetaCyc, classes may appear for which there are no entries in AraCyc. Plant hormones are distinct from 'animal' hormones and thus are included in a separate category.</i></li>
<li>To view a pathway on the list, click on the pathway name. This will open a new window showing the <a href="aracyc2.jsp#pathway">Pathway detail page</a></li>
</ol>

</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
