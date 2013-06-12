<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "MASC";
String highlight = "3";
String helpfile="";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
<jsp:param name="helpfile" value="<%= helpfile %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

<jsp:include page="/jsp/includes/mascSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Europe" />
</jsp:include>
<div id="rightcolumn">
<!-- Content goes here //--> 
<span class="mainheader">
Resources for Arabidopsis Functional Genomics Research in the United 
Kingdom
</span>
.
<p>MASC Representatives: <a href="mailto:Jim.Beynon@warwick.ac.uk">Jim Beynon</A>, Warwick University, <a href="mailto:sean@arabidopsis.info">Sean May</A>, Nottingham Arabidopsis Stock Centre, 
<A HREF="mailto:ruth@arabidopsis.info">Ruth Bastow</A>, Coordinator for the Genomic Arabidopsis Resource Network (GARNet), and <A HREF="mailto:i.lavagi@warwick.ac.uk">Irene Lavagi</A>, GARNet Liaison Officer. 
<hr>

<p><IMG SRC="/images/redball.gif"> New! Read the <a href="/portals/masc/countries/U.K._2009.pdf"><u>2009 United Kingdom MASC report (pdf).</u></a>
<p>Read the <a href="/portals/masc/countries/U.K._2008.pdf"><u>2008 United Kingdom MASC report (pdf).</u></a>
<br> Read the <a href="/portals/masc/countries/U.K._2007.pdf"><u>2007 United Kingdom MASC report (pdf).</u></a>
<br>
Read the <a href="/portals/masc/countries/U.K._2006.pdf"><u>2006 United Kingdom MASC report (pdf).</u></a></p>    
<p>
<dl>
If Arabidopsis researchers are to make the best possible progress as we move into the 21st century they will need to understand the contemporary questions in crop science in order to facilitate the translation of basic plant science into practical outcomes. Long-term funding, coordination and coherent data policies will also need to be developed at both national and international levels to provide the informatics, mathematical models and data required for a comprehensive framework of Arabidopsis biology in silico. 
<P>

<p>
<dt>
<A NAME="garnet" HREF="http://garnet.arabidopsis.org.uk">GARNet</A></dt>
<dd>GARNet, the <b>G</b>enomic <b>A</b>rabidopsis <b>R</b>esource <b>N</b>etwork was established in 2000 to provide publicly available functional genomics resources for Arabidopsis research. Funding was extended to move the services provided by GARNet to self-sustaining cost recovery. Coordination activities are funded 2005-2010, to provide an <a href="http://garnet.arabidopsis.info/">information resource</a> , newsletter, annual meeting) and point of contact for other UK plant communities and international plant genomics programs. Plant systems biology and translational research are now important parts of GARNet's activities.<dd>

<dt>UK Arabidopsis Meetings</dt>
<dd>
<ul>
<li>GARNet hosts an annual meeting for plant scientists across the UK and Europe to disseminate information about new technologies and resources.
GARNet 2008 was held at Nottingham University September 8-10 (http://garnet.arabidopsis.info/garnet_meeting.htm). 
</ul>
</dd>

<dt>Major funding sources for Arabidopsis functional genomics</dt>
<dd><a href="http://www.bbsrc.ac.uk/">The Biotechnology and Biological Science Research Council, BBSRC</a>  is the major funding agency for Arabidopsis functional genomics. BBSRC encourages applications that use genomic technologies and has launched several <a href="www.bbsrc.ac.uk/science/initiatives/">initiatives</a> to stimulate research in this area, including:
<ul>
<li><a href="http://www.bbsrc.ac.uk/science/initiatives/cisb_phase2.html">Centers for Integrative and Systems Biology</a>
<li><a href="http://www.bbsrc.ac.uk/science/initiatives/crop_science.html">The Crop Science Initiative</a>; exploitation of Arabidopsis Research for crop science
<li><a href="http://www.bbsrc.ac.uk/science/initiatives/trdf.html">Tools and Resources</a>
<li><a href="http://www.bbsrc.ac.uk/science/initiatives/escience/Welcome.html">E-science</a>
</ul>
</dd>
<P>
<dd>Other UK funding bodies supporting Arabidopsis research include:
<ul>
<li><a href="http://www.nerc.ac.uk/">NERC (Natural Environmental Research Council)</a>
<li><a href="http://www.defra.gov.uk/">DEFRA (Department for Environment Food and Rural Affairs)</a>
<li><a href="http://www.scotland.gov.uk/topics/agriculture">SEERAD (Scottish Executive Environment and Rural Affairs)</a>
</ul>
</dd>
<p>
<dd>International Genomics Funding<br>
The BBSRC is one of 17 funding bodies involved in ERA-PG (European Research Area in Plant Genomics), allowing UK researchers to participate in the funding initiative; <a href="http://www.erapg.org/">'Structuring Plant Genomic Research in Europe'</a>.
</dd>

<dt>Arabidopsis genomics tools and resources</dt>

<dd>Resources initiated by GARNet include transcriptomics, proteomics and metabolomics, insert clone libraries and insertional mutagenesis populations. Data from GARNet-funded Affymetrix and proteomics projects are available at NASC, and metabolomics results at <a href="http://www.metabolomics.bbsrc.ac.uk/">Rothamsted</a>. Many leading universities and institutes in the UK have established their own functional genomics centers and resources including METRO and ProtLocDB. </dd>

<dt>European Stock Centre</dt>
<dd>NASC (http://arabidopsis.info/) is an international resource for seed, DNA amplicons, clones and data. The UK BBSRC government funding body currently subsidizes all of NASC services.
<ul>
<li><a href="http://arabidopsis.info/bioinformatics/Ontology_details.html">Phenotype data</a> is held according to both plant ontology (PO) and Phenotype (PATO) standards. 
<li>The NASC genome browser (http://atensembl.arabidopsis.info) brings together MIPS and TIGR annotation; germplasm; Affymetrix GeneChip data; comprehensive insertion line coverage; and RNA-i knockdown clone resources. 
<li>NASC provides a not-for-profit international <a href="http://affy.arabidopsis.info">GeneChip hybridization service and database</a> and currently holds data from 3,000 GeneChips. 
<li>NASCs resources are available as BioMOBY web services (70+) for automated data-mining engines and desktop workflow GRID applications such as Taverna. 
</ul>



</dl>

<center>
  Last modified on January 29, 2010
</center>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


