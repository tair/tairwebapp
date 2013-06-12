<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String pageName = "Genome Annotation Tools: Comparative Resources";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11434" />
</jsp:include>

<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Comparative Resources" />
</jsp:include>
<div id="rightcolumn">

		
		<!-- Content goes here //--> 
<span class="mainheader">Comparative Resources</span>
<P>Genome comparison resources.



		<DL>
<DT><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=homologene">HomoloGene</a>
<dd>NCBI's system for automated detection of homologs among the annotated genes of several completely sequenced eukaryotic genomes.
<DT><a href="http://inparanoid.cgb.ki.se/">Inparanoid</A>
		<DD>A collection of pairwise comparisons between 17 eukaryotic whole genomes including Arabidopsis thaliana, useful for the identification of orthologs and differentiation between inparalogs and outparalogs.
<DT><a href="http://mips.gsf.de/cgi-bin/proj/planet/cos/seedSelect.pl">PlaNet</a>
 <dd>Conserved ortholog sets are built iteratively by searching putative orthologs for the seed and each non-seed organisms.

<DT><a href="http://www.phytome.org/">Phytome</a>
<dd>Contains phylogenetic and functional information for predicted protein sequences from a diverse set of plant species, with a focus on the angiosperms.

<DT><a href="http://www.phytozome.net/search/html/Phyto_info.html">Phytozome</a>
<dd>Contains comparisons of Arabidopsis, rice,and poplar.

<DT><a href="http://bioinformatics.psb.ugent.be/plaza/">PLAZA</a>
<dd>Access point for plant comparative genomics centralizing genomic data produced by different genome sequencing initiatives. PLAZA integrates plant sequence data and comparative genomics methods and provides an online platform allowing to perform evolutionary analyses and data mining within the green plant lineage (Viridiplantae).

<DT><a href="http://synteny.cnr.berkeley.edu/CoGe/">CoGe</a>
<dd>A comparative genomics platform designed to allow easy access to genomic data from any organism and provide analysis tools for finding and comparing homologous sequences from multiple genomic regions.

<DT><a href="http://biocon.berkeley.edu/athaliana/">Positional history of A. thaliana genes</a></DT>
<dd>Enter your gene of interest and see its chromosomal positional history throughout the rosid superorder, with evidence visible graphically by 
clicking the CoGe link on the results line.</dd>

		</DL>

            </div> <!--right column-->
<center>Last modified on April 19, 2012</center>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
