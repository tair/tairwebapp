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
<jsp:param name="id" value="2011" />
</jsp:include>

<jsp:include page="/jsp/includes/gotutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Anatomy of a GO Annotation"/>
</jsp:include>

<div id="rightcolumn">


<!--content goes here //-->

<span class="mainheader">Anatomy of a GO annotation</span>
<p/>
<p>A GO annotation is the association of a controlled vocabulary term (from one of the GO ontologies) to a gene product. The assertion about the gene's function, location or biological role is supported by one or more forms of evidence. </p>
<p><b>Keyword</b><%=DefinitionsLookup.createPopupLink("KeywordType","type")%>: The keywords are controlled vocabulary terms defined by the Gene Ontology Consortium which belong to one of the three aspects of the ontologies (molecular function, biological process, cellular component). Included in the keywords are terms representing 'unknowns' for all three aspects. We annotate genes to these unknown terms when we cannot find any data in the available literature to support an association to an aspect of the GO.</p>
<p><b>Relationship type</b><%=DefinitionsLookup.createPopupLink("RelationshipType","class")%>:The association between the gene and the GO term is elaborated using relationship types. The primary function of the relationship type is to make the annotation easier to read by putting the gene and term into a gramatically correct context.</p>
<p><b>Evidence codes</b><%=DefinitionsLookup.createPopupLink("EvidenceDescription","evidence_code")%>:Evidence codes are used to classify the types of evidence and are a way to assess the relative 'reliability' of an assertion. An annotation of a gene to an enzyme activity that has been tested experimentally (evidence code IDA or inferred by direct assay) would be more well supported than an assertion based on sequence similarity (evidence code ISS or inferred by sequence similarity). </p>
<p>In some cases, there may be conflicting annotations, which may occur when different assay or analysis methods are used. For example a gene may be annotated to the nucleus based upon a direct assay (IDA inferred from direct assay) while a computational prediction (IEA-inferred from electronic annotation) might indicate localization to the mitochondrion. The evidence codes can therefore help identify cases where computational predictions are not supported by experimental evidence.</p>
<p><b>Evidence description</b> <%=DefinitionsLookup.createPopupLink("EvidenceDescription","description")%>: Evidence descriptions are included along with the evidence code. The evidence descriptions provide more detailed information about the type of evidence such as the experimental method, analysis method or source of evidence.</p>
<p><b>Evidence with</b>: For associations supported by certain types of evidence such as sequence similarity or genetic interactions, the with component refers to a database object. For example, a gene that is annotated to the term "positive regulation of flower development" based upon analysis of a double mutant would have the TAIR database identifier for the second, interacting locus in this column. For annotations of genes to functions based upon the presence of structural domains the database identifier for that domain would be supplied in the evidence with section (e.g. an InterPro domain id).</p>
<p><b>Reference</b> <%=DefinitionsLookup.createPopupLink("Reference","type")%>: The reference(s) for the annotation is/are the source of the evidence that supports the association between the gene and the GO term. For references that are papers it should be possible find the original reference describing the exact methods used to assay a genes function, location or biological role. For computational predictions, the reference includes the algorithm used, the sample dataset and the date of the analysis (as results may vary depending on all of these parameters.</p>.
</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>