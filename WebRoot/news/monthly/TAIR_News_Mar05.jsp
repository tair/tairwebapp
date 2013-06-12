<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h2 class="header">TAIR February/March 2005 News Release</h2>		

<P>

For the months of February and March 2005:

<P>


1. <a href="/tools/aracyc/">AraCyc 2.1 Release</a><br>

AraCyc, the Arabidopsis
metabolic pathway database, has been significantly updated. Genes and
pathways are now updated with the latest functional annotations of the
Arabidopsis genome. Eighteen new pathways have been recently curated from
the literature. Four pathways were extensively updated. AraCyc presently
features 1615 unique genes mapped onto 221 pathways. Of these pathways, 71
have been manually curated from the literature. Evidence and citations are
given to pathways and enzymes providing data quality assurance. You can
search and browse pathways, compounds, genes and more. You can also
overlay large-scale data from experiments such as microarray expression,
proteomics, and metabolic profiling onto the Metabolic Map of Arabidopsis
using the Omics Viewer. A tutorial on how to use AraCyc is now available
at <a href="http://arabidopsis.org/help/tutorials/aracyc_intro.jsp">http://arabidopsis.org/help/tutorials/aracyc_intro.jsp</a>.

<p>

2. <a href="http://arabidopsis.org/help/tutorials/micro_intro.jsp">Plant Structure Ontology</a><br>

TAIR is now using the Plant Structure Ontology (PO) - a set of controlled
vocabulary terms describing anatomy and morphology of a 'generic'
flowering plant, developed by the <a href="http://www.plantontology.org">Plant Ontology Consortium</a>. 
The new ontology (with unique PO term
identifiers) has replaced our archived Arabidopsis Anatomy Ontology and is
used for annotating gene expression patterns and microarray experiments in
TAIR. The TAIR Temporal Ontology, comprised of Arabidopsis growth and
development stages terms, is still in use and will be replaced by the new
PO temporal ontology later this year.
<P>
**************************************************************************************************************************
<P>
Note: if you prefer not to receive future email updates from us, please
log in to your TAIR account and update your profile by unchecking the '
Email me monthly TAIR release notes' check box.
<P>
To view previous news releases, go to <a href="http://arabidopsis.org/doc/news/breaking_news/140">http://arabidopsis.org/doc/news/breaking_news/140</a>
<P>
<P>
TAIR is committed to providing the best possible service to the Arabidopsis community. Should you have any questions or suggestions please contact us at <a href="mailto:curator@arabidopsis.org">curator@arabidopsis.org</a>
<P>
The TAIR Team<br>
<a href="/index.jsp"></a>
		<!-- Content goes here //--> 
<P>
<center><a href="/doc/news/breaking_news/140">Go back to TAIR News page</a></center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

