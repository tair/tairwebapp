<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String pageName = "TAIR - Portals - Gene Annotation- Functional Annotation";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11420" />
</jsp:include>

<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Ontologies" />
</jsp:include>
<div id="rightcolumn">
<!-- CONTENT IN HERE -->

<span class="mainheader">Ontologies</span>
<dl>
<dt>Gene Ontology</dt>
<dd>TAIR is a member of the <a href="http://www.geneontology.org">Gene Ontology Consortium</a> and actively contributes to the development of the three ontologies aimed at describing genes: biological process, molecular function, and cellular component. 
<P>TAIR annotates Arabidopsis genes using GO terms. To learn about Gene Ontology development and gene annotation at TAIR see <a href="/portals/genAnnotation/functional_annotation/go.jsp">Gene Ontology Annotations</a>. To learn how to find genes using GO terms and how to functionally classify gene sets, read the <a href="/help/tutorials/go_intro.jsp">TAIR GO Tutorial</a>.
<P>To search and download gene annotations from Arabidopsis and other species use the links on the left menu.
</dd>
<dt>Plant Ontology</dt>
<dd>TAIR is a member of the <a href="http://www.plantontology.org">Plant Ontology Consortium</a> and contributes to the development of ontologies for plant structures and plant growth and developmental stages. 
<P>TAIR annotates Arabidopsis genes, germplasms and microarray experiment data using PO terms.

<P>Download the Plant Ontology terms and definitions from the <a href="http://www.plantontology.org/download/download.html">Plant Ontology</a> website.
<P>To search and download Plant Ontology annotations from Arabidopsis and other species use the links on the left menu.
</dd>

<dt>Other Ontology Resources</dt>
<dd><a href="http://obo.sourceforge.net">Open Biomedical Ontologies</a> website at Sourceforge
<P><a href="http://bioontology.org/">National Center for Biomedical Ontologies</a></dd>
</dl>

 <p>

<center>Last modified on April 17, 2006</center>
</div>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


