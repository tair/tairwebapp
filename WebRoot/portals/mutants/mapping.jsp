<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "Mutant/Mapping Resources: Map-based Cloning";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*,org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11630" />
</jsp:include>

<jsp:include page="/jsp/includes/forwardSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Map-based Cloning" />  
</jsp:include>


<div id="rightcolumn">


                <span class= "mainheader">Map-based Cloning</span>
                     <dl>
 <dd>You've got your mutation but don't know which gene is affected.  Try the following resources to help you find and/or design genetic markers, mapping stocks and
                        protocols for mapping and growing plants.</dd>

                     <dt><a href="/servlets/Search?action=new_search&type=marker">TAIR Genetic Marker Search</a></dt>
                     <dd>Find relevant genetic markers for your chromosomal region of interest.</dd>

                     <dt><a href="/servlets/Search?action=new_search&type=polyallele">TAIR Polymorphism Search</a></dt>
                     <dd>Find SNPs in your region of interest that could be used to design (d)CAPs markers. Incorporates SNP data from the Stanford Genome Center, MASC SNP DB, the Nordborg Genealogy study and the Perlegen resequencing arrays.</dd>

                     <dt><a href="/browse/Cereon/">Monsanto Ler Polymorphism Collection</a></dt>
                     <dd>Identify polymorphisms in your region of interest between Ler and Col. Requires registration and login for access.</dd>

                     <dt><a href="http://www2.mpiz-koeln.mpg.de/masc/search_masc_snps.php">MASC SNP Database</a></dt>
                     <dd>Identify polymorphisms in your region of interest for 13 Arabidopsis ecotypes, Arabis lyrata and Boechera drummondii.</dd>

                     <dt><a href="http://walnut.usc.edu/apache2-default/2010/index.html">The Genealogy of Arabidopsis thaliana:Nordborg lab</a></dt>
                     <dd>Identify polymorphisms in your region of interest for 96 Arabidopsis accessions. Undergoing updates.</dd>

                     <dt><a href="http://msqt.weigelworld.org">MSQT - Weigel lab</a></dt>
                     <dd>A tool developed by the Weigel lab for selecting SNPs between arbitrary groups of ecotypes/accessions.</dd>

                     <dt><a href="/servlets/Order?state=catalog">ABRC Stock Catalog - Mapping Lines</a></dt>
                     <dd>Browse through the ABRC catalog of RI and other mapping lines.</dd>

                     <dt><a href="/abrc/ri_mapping.jsp">ABRC Recombinant Inbred line information</a></dt>
                     <dd>Links to more information on the major RI and other mapping line stocks at ABRC.</dd>

                     <dt><a href="/servlets/Search?action=new_search&type=protocol">TAIR Protocol Search</a></dt>
                     <dd>Search the TAIR database for protocols for molecular mapping and plant growth methods.</dd>

                     <dt><a href="http://helix.wustl.edu/dcaps/dcaps.html">dCAPS finder</a></dt>
                     <dd>A web-based tool for designing PCR primers for dCAPS markers.</dd>

                     <dt><a href="http://bbc.botany.utoronto.ca/ntools/cgi-bin/ntools_blast_digester.cgi">BlastDigester</a></dt>
                     <dd>A web-based tool for CAPS marker generation for positional cloning. Identifies snip-SNPs (SNPs that alter a restriction endonuclease cut site) in BLAST sequence alignments and generates PCR primers surrounding them for easy CAPS marker generation.</dd>

                     <dt><a href="http://bbc.botany.utoronto.ca/markertracker/index.spy">Marker Tracker</a></dt>
                     <dd>Contains computationally generated CAPS markers across 96 accessions from Arabidopsis, based on sequence information from 2 datasets (Jander et al. 2002, and Nordborg et al. 2005).</dd>
                     <dt><a href="http://polymorph.weigelworld.org/cgi-bin/retrieve_snp.cgi">POLYMORPH</a></dt>
                     <dd>Find SNPs and PRPs by ecotype and region, or find coding SNPs by gene.</dd> 

      		    </dl>

<center>Last modified on September 26, 2007</center>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

