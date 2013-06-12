<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR - About TAIR - Data Sources";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="401" />
</jsp:include>

<jsp:include page="/jsp/includes/aboutSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="TAIR data sources"/>  
</jsp:include>


<div id="rightcolumn">	


		<!--
		
			Content goes here
			
		//-->
		
<span class="mainheader">TAIR Data Sources</span>
<p>
<dl>
This page gives information on where the data in TAIR come from, and what datasets are not yet in TAIR. For more up-to-date, detailed statistics of TAIR database content, please refer to our <a href="/jsp/tairjsp/pubDbStats.jsp">DB Statistics page</a>
</p>
<table width="500" border=1>
<TR><TD>
<B>Datasets in TAIR:</B>
</TD><TD><B>Sources</B></TD></TR>
<TR><TD>Plant Structure Ontology</TD><TD>Plant Ontology consortium</TD></TR>
<TR><TD>
Cereon SNPs</TD><TD>Cereon Genomics</TD></TR>
<TR><TD>
Classical genetic map</TD><TD>Meinke Lab Website</TD></TR>
<TR><TD>
Clones</TD><TD>AtDB, GenBank, ABRC, user submissions</TD></TR>
<TR><TD>
Community (people & organizations)</TD><TD>ABRC, AtDB, NASC, user submissions</TD></TR>
<TR><TD>Growth & Developmental Stages Ontologies</TD><TD>POC</TD></TR>
<TR><TD>
DNA sequences</TD><TD>GenBank, AtDB, TIGR, IMA</TD></TR>
<TR><TD>
Expression Data</TD><TD>AFGC, Websites, Literature, ATGenExpress, user submissions, NASCArrays</TD></TR>
<TR><TD>
Gene Families</TD><TD>User submissions, Websites</TD></TR>
<TR><TD>Gene Ontology Controlled Vocabularies</TD><TD>Gene Ontology Consortium</TD></TR>
<TR><TD>Gene Ontology Functional Annotations</TD><TD>TAIR, Literature, TIGR</TD></TR>
<TR><TD>
Gene Structure Annotations </TD><TD>TIGR, TAIR, user submissions</TD></TR>
<TR><TD>
Genes</TD><TD>TIGR, GenBank, AtDB, Kazusa, Meinke Lab Website, Literature, user submissions</TD></TR>
<TR><TD>
Images</TD><TD>ABRC, Literature, user submissions</TD></TR>
<TR><TD>Libraries</TD><TD>ABRC, GenBank</TD></TR>
<TR><TD>
Markers (physical and genetic) </TD><TD>AtDB, NASC, user submissions</TD></TR>
<TR><TD>
Metabolic pathways</TD><TD>MetaCyc, literature</TD></TR>
<TR><TD>
Phenotypes</TD><TD>AtDB, ABRC, Literature</TD></TR>
<TR><TD>
Physical maps</TD><TD>User submissions, Websites, Literature, AtDB</TD></TR>
<TR><TD>
Polymorphisms</TD><TD>Stanford Genome Center, SALK, Arabidopsis Tilling Project, User submissions</TD></TR>
<TR><TD>
Proteins</TD><TD>TIGR, TAIR</TD></TR>
<TR><TD>
Protein subcellular localizations</TD><TD>Literature, Websites, user submissions</TD></TR>
<TR><TD>
Protocols</TD><TD>User submissions</TD></TR>
<TR><TD>
Publications</TD><TD>AtDB, PubMed, Agricola, Biosis</TD></TR>
<TR><TD>
RI map</TD><TD>NASC, user submissions</TD></TR>
<TR><TD>
Stocks</TD><TD>NASC, ABRC</TD></TR>
<TR><TD>Vectors</TD><TD>ABRC, GenBank</TD></TR>

</table>


<P>
<table border=1 width="500">
<TR><TD>
<B>Datasets not in TAIR</B>
</TD><TD><B>Sources</B></TD></TR>

<TR><TD>
Genetic interactions</TD><TD>Literature</TD></TR>
<TR><TD>
Metabolic profiling</TD><TD>Literature</TD></TR>
<TR><TD>
Physical interactions</TD><TD>Literature, Websites</TD></TR>
<TR><TD>
Signal transduction pathways</TD><TD>Literature</TD></TR>

<TR><TD>
Tryptic digest patterns</TD><TD>Websites</TD></TR>


</table>
</DL>
<P>
<center>Date last modified: March 31, 2005</center>
</P>
</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
