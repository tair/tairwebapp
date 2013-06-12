<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "GO Tutorial";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="2010" />
</jsp:include>

<jsp:include page="/jsp/includes/gotutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="What is the Gene Ontology"/>
</jsp:include>

<div id="rightcolumn">


<!--content goes here //-->

<span class="mainheader">Why and how does TAIR use controlled vocabularies?</span>
<p>TAIR uses several controlled vocabularies (keywords <%=DefinitionsLookup.createPopupLink("KeywordType","type")%>)  to describe biological data such as genes, gene expression and phenotypes. For describing genes, we use the controlled vocabularies developed by the <a href="http://www.geneontology.org" target="_blank">Gene Ontology Consortium</a> (see below).For gene expression and phenotypes we use vocabularies for plant structures and developmental stages developed by the <a href="http://www.plantontology.org">Plant Ontology Consortium</a>. TAIR is a collaborator/co-developer of both sets of controlled vocabularies.</p>
<p>There are many advantages of using shared,controlled vocabularies?</p>
<ol>
<li>facilitates cross-species/cross database queries</li>
<p>For example:What genes in plants and animals are involved in stress responses?</p>
<li>Overcomes a limitation of gene nomenclature by allowing genes to be described in multiple ways.</li>
<p> Gene nomenclature is often limited to describing only one aspect of a gene (mutant phenotype, similarity to other genes,molecular function).</p>
<li>Eventually, can be used to perform more complex queries of databases.</li>
<p> For example: What protein kinases are involved in ethylene signaling and are expressed in petals of stage 13 flowers?</p>
</ol>
<h2 class="main">What is the Gene Ontology?</h2>
<p>
The<a href="http://www.geneontology.org" target="new"> Gene Ontology project</a> is developed by a collaboration of genome databases called the Gene Ontology Consortium. The ontologies (or controlled vocabularies) describe three aspects of gene products, molecular function, cellular component, and biological process. These controlled vocabularies are structured into directed acyclic graphs (DAGs)<%=DefinitionsLookup.createPopupLink("Glossary","dag")%> where each term represents a 'node' and the edges of each graph represent the relationship between the nodes.
</p>
<h2 class="main">How are terms organized into DAGs?</h2>
<p>In the GO, terms are related to each other as parents and children. Children that represent a more specific instance of a parent term have an 'instance of' or 'is a' relationship to the parent. Children that are a constituent of the parent term have a 'part of' relationship. Within the DAG structure, any path from the most granular term all the way to the top of the ontology must be 'true'. In the example <a href="goterms.mov" target="_blank">Quicktime movie</a> , the term 'transcription factor activity',  has both a transcription regulator activity AND a binding activity.</p>
<h2 class="main">What constitutes a GO term?</h2>
<p>The GO is used to describe genes from a wide variety of taxonomic groups including plants, microbes, animals and fungi. Terms represent the normal, non mutant state (e.g. disease resistance is a trait whereas response to pathogen is a biological process). In the case where an instance of a term is specific to a taxonomic class, a 'sensu' descriptor is appended to the term. For example, the thylakoids of higher plants (Viridiplantae), Cyanobacteria, Proteobacteria, and Glaucocystophyaceae are all different, therefore each of these types of thylakoids are distinguished by the appropriate sensu designation. There are over 13,000 terms in the GO ontologies, and many of these terms are not used to describe Arabidopsis (or other plant) genes.</p>
<h2 class="main">What is the significance of the organization of the ontologies?</h2>
<p>The structure of the controlled vocabularies are intended to reflect true, biological relationships. In contrast to strict hierarchies, DAGS allow multiple relationships between a more granular (child) term and a more general parent term. The relationship between terms affects how queries are made. For example,a query for all genes with binding activity would include transcription factors as well as genes with other types of binding activity (such as protein binding, ligand binding).</p>
</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>