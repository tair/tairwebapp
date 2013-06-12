<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String pageName = "TAIR - Downloads";
String cssfile="/css/page/pagelevels.css";

%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="150" />
</jsp:include>
<jsp:include page="/jsp/includes/downloadSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value=""/>
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->
<span class="mainheader">FTP Download Overview</span>

<dl>
<dt><a href="ftp://ftp.arabidopsis.org/home/tair/Genes/">Genes</a></dt>
<dd>Contains TAIR's genome release files, gene family data, and lists of gene names, 
aliases and descriptions for all TAIR genes.</dd>

<dt><a href="ftp://ftp.arabidopsis.org/home/tair/Ontologies/">GO and PO Annotations</a></dt>
<dd>Contains files of all Gene Ontology (biogical process, cellular component and 
molecular function) and Plant Ontology (plant growth and developmental stage, plant structure) 
annotations in TAIR, updated weekly.</dd>

<dt><a href="ftp://ftp.arabidopsis.org/home/tair/Maps">Maps</a></dt>
<dd>Contains files of map coordinates for Arabidopsis genes and their features, ESTs, cDNAs, BAC clones, polymorphisms, and markers on the sequence map (seqviewer_data subdirectory).  Also contains map data for older maps, including physical and genetic maps.</dd>

<dt><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/">Microarray Data</a></dt>
<dd>Contains Affymetrix, AFGC, Agilent and CATMA mapping files matching array element identifiers to AGI loci.  Also contains original and reanalyzed microarray datasets for some experiments including AtGenExpress.</dd>

<dt><a href="ftp://ftp.plantcyc.org/Pathways/">Pathways</a></dt>
<dd>Contains data files (including pathways, reactions, enzymes and loci) from the AraCyc biochemical pathway database.</dd>

<dt><a href="ftp://ftp.arabidopsis.org/Polymorphisms">Polymorphisms</a></dt>
<dd>Contains polymorphism data files describing SNPs, insertions, deletions and T-DNAs in TAIR. Also contains predicted and experimental polymorphism data provided by the community.</dd>


<dt><a href="ftp://ftp.arabidopsis.org/home/tair/Proteins/">Proteins</a></dt>
<dd>Files containing protein domains, molecular weights, isoelectric points, TargetP predictions, transmembrane domains, and SCOP structure information for all TAIR proteins.</dd>

<dt><a href="ftp://ftp.arabidopsis.org/home/tair/Protocols/">Protocols</a></dt>
<dd>Contains protocols for growing Arabidopsis and other common laboratory procedures, along with archived Weeds World and Arabidopsis Information Service (AIS) articles.</dd>

<dt><a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/">Sequences</a></dt>
<dd>Contains TAIR's blast datasets and other sequence files in FASTA format.</dd>

<dt><a href="ftp://ftp.arabidopsis.org/home/tair/Software/">Software</a></dt>
<dd>Downloadable software for analyzing microarray data, mapping mutations, finding sequence matches and looking at linkage disequilibrium.</dd>

<dt><a href="ftp://ftp.arabidopsis.org/home/tair/User_Requests/">User Requests</a></dt>
<dd>Custom Arabidopsis datasets requested by the community.  Email your request to curator@arabidopsis.org.</dd>

</dl>
<center>Last modified on October 2, 2006</center>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
