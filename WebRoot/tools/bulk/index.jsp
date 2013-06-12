<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR: Bulk Data Retrieval";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="81" />
</jsp:include>

<jsp:include page="/jsp/includes/bulkToolsSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value=""/>  
</jsp:include>

<!-- CONTENT IN HERE -->
<div id="rightcolumn">
<span class="mainheader">Bulk Data Retrieval and Analysis</span>

	<dl>
	<dt><a href="/tools/bulk/genes/index.jsp">Gene Descriptions</a></dt>
	<dd>Download gene descriptions using locus identifiers (AGI codes) or gene names.</dd>
	<dt><a href="/tools/bulk/go/index.jsp">Gene Ontology (GO) Annotations</a></dt>
	<dd>Search and download GO annotations using locus identifiers. Functionally classify Arabidopsis genes and view the results as tables or pie charts.</dd>
	<dt><a href="/tools/bulk/po/index.jsp">Plant Ontology (PO) Annotations</a></dt>
	<dd>Search and download PO annotations using locus identifiers.</dd>
	<dt><a href="/tools/bulk/sequences/index.jsp">Sequences</a></dt>
	<dd>Download nucleotide and protein sequences using locus identifiers.Send FASTA formatted sequences to ClustalW multiple sequence alignment program at the European Bioinformatics Institute.</dd>
	<dt><a href="/tools/bulk/protein/index.jsp">Proteins</a></dt>
	<dd>Search proteins according to predicted protein properties. Now includes SCOP's structural class prediction.
	<dt><a href="/tools/bulk/locushistory/index.jsp">Locus History</a></dt>
	<dd>Find out how a locus has been modified during different releases of the genome by entering a locus name.
	<dt><a href="/tools/bulk/microarray/index.jsp">Microarray Elements</a></dt>
	<dd>Search array elements on the Affymetrix 8K, 25K, and all the AFGC arrays.</dd>
	</dl>
</div>
<center>Last modified on June 18, 2006</center>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

