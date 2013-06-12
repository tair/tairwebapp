<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR- Metabolomics Resources- Databases";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1190" />
</jsp:include>

<jsp:include page="/jsp/includes/metabolomeSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Pathway and Compound Databases" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->
<span class="mainheader">Pathway and Compound Databases</span>


<DL>


<DT><a href="http://www.plantcyc.org/">Plant Metabolic Network (PMN)</a></DT>
<dd>Metabolic pathways from a large number of plants are comprehensively cataloged in PMN's PlantCyc database. PlantCyc includes experimentally supported,computationally predicted, and hypothetical pathways and enzymes. PMN is also a gateway to species-specific pathway databases for several plants, including Arabidopsis, rice, tomato, medicago, and poplar.</dd>

<DT><a href="http://metacyc.org">MetaCyc</a></DT>
<dd>A universal metabolic pathway database for all organisms. MetaCyc only includes experimentally supported pathways and enzymes.</dd> 

<DT><a href="http://www.genome.jp/kegg/pathway.html">KEGG Pathways</a></DT>
<dd>Catalogs all kinds of pathways, including metabolic pathways.</dd>

<DT><a href="http://aralip.plantbiology.msu.edu/">ARALIP: Arabidopsis Acyl-Lipid Metabolism</a></DT>
<dd>Provides information for a large number of Arabidopsis genes involved in acyl-lipid metabolism pathways in conjunction with chapters from <a href="http://www.aspb.org/publications/arabidopsis/">The Arabidopsis Book</a>.
</dd>

<DT><a href="http://www.atipd.ethz.ch/">AtIPD: the Arabidopsis thaliana Isoprenoid Pathway Database</a></DT>
<dd>Includes information on manually curated Arabidopsis isoprenoid pathways and genes and allows to user to visualize pathway topology.</dd>

<DT><a href="http://www.expasy.ch/cgi-bin/search-biochem-index">ExPaSy Pathways</a></DT>
<dd>A searchable, digitized version of the Roche Applied Science "Biochemical Pathways" wall chart.</dd>

<DT><a href="http://bioweb.ucr.edu/ChemMineV2/">ChemMine (NSF2010 project)</a></DT>
<dd>A compound database that also provides tools for compound clustering and other types of analysis.</dd>

<DT><a href="http://pubchem.ncbi.nlm.nih.gov/">PubChem</a></DT>
<dd>A compound database.</dd>

<DT><a href="http://www.genome.jp/kegg/ligand.html">KEGG Ligand</a></DT>
<dd>A compound database.</dd>

<DT><a href="http://www.ebi.ac.uk/chebi/">ChEBI</a></DT>
<dd>A compound database. The compounds are classified by an ontological classification system. ChEBI uses nomenclature, symbolism and terminology endorsed by IUPAC and IUBMB.</dd>

<DT><a href="http://prime.psc.riken.jp/?action=metabolites_index">KNApSAcK</a></DT>
<dd>A compound database that links metabolites to species, focusing specifically on plants.</dd>

<DT><a href="http://bionumbers.hms.harvard.edu/">BioNumbers</a></DT>
<dd>A database that provides useful biological numbers. Some are related to metabolism and energy capture, such as the percent of total soluble protein in C3 plants that is Rubisco.</dd>
 
</DL>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

