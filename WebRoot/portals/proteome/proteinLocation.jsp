<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR- Proteome Resources- Protein Location";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11803" />
</jsp:include>

<jsp:include page="/jsp/includes/proteomeSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Protein Location" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->
<span class="mainheader">Protein Location</span>

<DL>

<DT> <a href="http://bioinf.scri.sari.ac.uk/cgi-bin/atnopdb/home">Arabidopsis Nucleolar Protein Database</a> </DT>
<dd> The Arabidopsis Nucleolar Protein database (AtNoPDB) provides information
on the plant proteins identified to date with comparison to human and
yeast proteins, and images of cellular localisations for over a third of
the proteins.</dd>

<DT> <a href="http://www.plantenergy.uwa.edu.au/applications/ampdb/index.html">Arabidopsis Mitochondrial Protein Database</a> (Australia) </DT>
<dd> A relational database
of experimentally identified proteins from purified Arabidopsis
mitochondria using LC-MS/MS. The database also includes predictions of
subcellular localisation by TargetP, SubLoc, MitoProt II, Predotar and
iPSORT.</dd>

<dt><a href="http://aramemnon.botanik.uni-koeln.de/">ARAMEMNON</a></dt>
<dd>A specialized database for Arabidopsis thaliana membrane proteins.</dd>
            
<DT> <a href="http://www.gartenbau.uni-hannover.de/genetik/AMPP">Arabidopsis Mitochondrial Proteome</a> (Germany) </DT>
<dd> The proteome of mitochondria isolated from Arabidopsis suspension cell cultures is characterized. </dd>

<DT> <a href="http://www.grenoble.prabi.fr/at_chloro">AT_CHLORO</a></dt>
<dd>An AMT (accurate mass and time tags) database dedicated to experimentally determined subplastidial localization of 
Arabidopsis thaliana chloroplast proteins. Several types of information can be found in the AT_CHLORO database: 
subplastidial localization (Envelope, Stroma, Thylakoids) as revealed by spectral counting, analytical coordinates (RT, 
Mr) of all the peptides corresponding to the proteins stored in the database, curated localization and function of 
proteins that were identified in envelope fractions and links to public web sites (TAIR, PPDB, AtProteome, SUBA, Aramemnon).</dd>

<DT><a href="http://ppdb.tc.cornell.edu/">Plastid Proteome Database (PPDB)</a></DT>
<dd>Data deposit for predicted and experimentally determined plastid proteins, their annotated functions, as well as their molecular and biophysical properties.</dd>

<DT> <a href="http://www.psb.ugent.be/papers/cellbiol/">Cytokinesis GFP-tagged Protein Localization</a></DT>
<dd> Subcellular localization of potential cytokinesis proteins in 
tobacco and Arabidopsis plants.</dd>

<DT> <a href="http://www.plantenergy.uwa.edu.au/applications/suba/index.php">Arabidopsis Subcellular Proteomic Database (SUBA)</a> </DT>
<dd> Contains large scale proteomic and GFP localisation data sets from cellular compartments of Arabidopsis. </dd>

<DT> <a href="http://www.seed-proteome.com">Arabidopsis Seed Proteome</a> </DT>
<dd> Proteomic web site on Arabidopsis seed germination.</dd>

<DT><a href="http://deepgreen.stanford.edu/">Plant Cell Imaging</a></dt>
<dd>Images and movies of live Arabidopsis cells using GFP fusion proteins</dd>

<DT><a href="http://bioinf.scri.sari.ac.uk/cgi-bin/ProtLocDB/home">ProtLocDB</a></dt>
<dd>Protein Localization Database containing sequence information, BLAST results and the subcellular localizations of numerous partial plant cDNA-GFP fusions.</dd>
<dt><a href="http://gpcr2.biocomp.unibo.it/esldb/index.htm ">Eukaryotic Subcellular Localization DataBase (eSLDB)</a></dt>
<dd>A database of protein subcellular localization which aims to provide an annotation for the entire proteomes of eukaryotic organisms. The database contains the experimental localizations, when available, the homology-based annotations, when feasible, and predictions performed with machine learning based methods. Currently five proteomes are available including human, mouse, C. elegans, yeast and Arabidopsis. </dd>

<dt><a href="http://podb.nibb.ac.jp/Organellome/">The Plant Organellome Database</a>
</dt>
<dd>A database of transgenic plants or cultured cells, mostly Arabidopsis, expressing fluorescent 
protein-tagged proteins to visualize organellar locations.</dd>

<dt><a href="http://data.jic.bbsrc.ac.uk/cgi-bin/gfp/">GFP database, John Innes Center</a>
</dt>
<dd>Subcellular GFP images of Arabidopsis proteins.</dd>
</DL>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

