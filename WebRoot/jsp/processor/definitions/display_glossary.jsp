<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<c:import url="/sitemap.xml" var="xml"/>
<c:import url="/navigation.xsl" var="xslnav"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
import="org.tair.querytools.*, org.tair.tfc.*, org.tair.utilities.*, java.util.*, org.tair.processor.definitions.*"
%>

<%!
String pageName = "TAIR Glossary";
String highlight = "1";
String id="206";
%>

<%
DefinitionsCollection glossary = (DefinitionsCollection) request.getAttribute( "glossary" );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<x:transform xml="${xml}" xslt="${xslnav}">
    <x:param name="id"><%= id %></x:param>
</x:transform>
 
<span class="mainheader">Glossary<A name="back"></a></span>
  
<br />

<h4>Click on a letter below to browse terms in TAIR starting with that letter.</h4>
<%-- The ABCDEF...Z header --%>
<center>
<% for(char ch = 'A'; ch <= 'Z'; ch++) { 
    Iterator iter = glossary.iteratorDisplayValueStartsWith(""+ch);
    if (iter == null) { %>
        <%= ch %>
    <% } else { %>
        <a href="#<%= ch %>"><%= ch %></a>
    <% } %>       
<% } %>
</center>


  <BR>
<p> This glossary defines terms as they are used in TAIR's database and website. 
<p>Many of the definitions used for TAIR terms were taken from dictionaries, text books, websites and other glossaries, including the ones listed in the following section.
<br>

<ul>
	<li> <b>Controlled Vocabularies</b></li>

	<ul>
	<li><a href="http://www.geneontology.org"> Gene Ontology Consortium</a>. Enter a search term and click on Amigo to view, terms, defintions and annotated gene products.</li>
	<li><a href="http://www.plantontology.org"> Plant Ontology Consortium</a>. Enter a search term and click on the ontology browser to view, terms, defintions and annotated gene products.</li>
	<li><a href="http://www.nlm.nih.gov/mesh/MBrowser.html">MESH Browser</a>. Medical Subject Headings from the National Library of Medicine.</li>
	<li><a href="http://ca.expasy.org/cgi-bin/keywlist.pl">Swiss-Prot Knowledge Base</a>:Definitions for keywords used at Swiss Prot.</li>
	</li>
	</ul>

	<li><b>Plants</b></li>
	<ul>
	<li><a href="http://www.mobot.org/MOBOT/research/APweb/">Angiosperm Phylogeny website glossary</a>:Glossary of botanical terms.</li>
	</ul>

	<li><b>Taxonomy</b></li>
	<ul>
	<li><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?db=Taxonomy">NCBI Taxonomy</a>: Search and browse NCBI's database of organisms.</li>
	</ul>

	<li><b>Genetics/Molecular Biology</b></li>
	<ul>
	<li><a href="http://www.mblab.gla.ac.uk/~julian/Dict.html">Dictionary of Cell and Molecular Biology</a>:For unregistered users, access is limited to one day per every ninety days.</li>
	<li><a href="http://www.weihenstephan.de/~schlind/genglos.html">Birgid Schlindwein's Hypermedia Glossary of Genetic Terms.</li>
	<li><a href="http://www.genome.gov/glossary.cfm">NHGRI Genome Glossary</a>:Talking glossary from the National Human Genome Research Institute.</li>
	</ul>
</ul>
<br>



<% for(char ch = 'A'; ch <= 'Z'; ch++) { %>
    <a name="<%= ch %>"></A>
        <h1><%= ch %> <font size=3><a href="#back">back to top</A></font></H1>
    
    <%
    Iterator iter = glossary.iteratorDisplayValueStartsWith(""+ch);
    if (iter == null) {
    %>

        <%-- Do nothing --%>

    <% } else { %>


        <ul>
        <%
        while (iter.hasNext()) {
            Definitions definition = (Definitions) iter.next();
        %>
            <li>
                <a name="<%= definition.get_definitions_id() %>">
                    <b><%=  definition.get_display_value() %></b>
                </a>&nbsp;
                <%=  definition.get_definition() %><P>
            </li>
        <% } %>
        </ul>

    <% } %>       
<% } %>




<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
