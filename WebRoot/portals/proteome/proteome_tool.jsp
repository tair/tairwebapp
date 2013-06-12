<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR- Proteomics Resources- Data Analysis Tools";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11806" />
</jsp:include>

<jsp:include page="/jsp/includes/proteomeSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Data Analysis Tools" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->
<span class="mainheader">Data Analysis Tools</span>


<DL>

<!-- this link does not work  
<DT><a href="http://pedro.man.ac.uk/home.shtml">PEDRo</a></DT>
<dd>Provides both the software and data models (UML, XML and SQL schemata) to support the capture, storage and dissemination of proteomics experimental data - necessary components for the implementation of a proteome repository.</dd>
-->
          
<DT><a href="http://us.expasy.org/tools/">ExPASy Proteomics Tools</a></DT>
<dd>A suite of comprehensive proteomics tools used in identifying proteins by peptide mass fingerprints, mass spectrometry data, and by pI, moleculer weight and amino acid composition. Also many tools in predicting and computing with protein sequences, such as predicting protease cleavage site, protein structure, protein pattern and domain, posttranslational modification, and more.</dd>
          
<DT><a href="http://restools.sdsc.edu/biotools/biotools9.html">Protein Structure</a></DT>
<dd>A portal to Databases and analysis tools of protein 2D/3D structures.</dd>

<DT><a href="http://genome-www.stanford.edu/Sacch3D/urls.html">S3D URLs</a></DT><dd>Lists of web sites relevant to the analysis of protein structures.</dd>

<DT><a href="http://www.ebi.ac.uk/dali/">Dali server</a></DT>
<dd>Submit the coordinates of your protein structure and Dali compares them against those in PDB.</dd>

<DT><a href="http://blocks.fhcrc.org/">BLOCKS</a></DT>
<dd>Search your sequence against known blocks, multiply-aligned ungapped segments corresponding to the most highly conserved regions of proteins, to identify protein sequence homology.</dd>

<DT><a href="http://motif.stanford.edu/projects.html">EMOTIF, EMATRIX, 3MOTIF, 3MATRIX, LOCK2, FoldMiner, BioProspector, MDScan </a></DT>
<dd>Software packages from the Stanford 'Brutlag Bioinformatics Group.' Methods used for assigning functions to unidentified protein sequences, comparing protein structures and structural database searches, discovering transcription factor binding sites in co-regulated genes, and more. </dd> 

<DT><a href="http://arabidopsis.org/cgi-bin/patmatch/nph-patmatch.pl">Patmatch</a></DT>
<dd>Search TAIR's Arabidopsis protein dataset for short (< 20 residues) peptide sequences, or ambiguous/degenerate patterns.</dd>

<DT><a href="http://us.expasy.org/melanie/">ImageMaster/Melanie</a></DT>
<dd>Software for 2D PAGE image analysis.</dd>
     
<!--this is linked from ExPASy
<DT><a href="http://prospector.ucsf.edu">Protein Prospector</a></DT>
<dd>Proteomics tools for mining sequence databases in conjunction with Mass Spectrometry experiments.</dd>
-->


 

</DL>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

