<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "Arabidopsis Stock Centers";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1160" />
</jsp:include>

<jsp:include page="/jsp/includes/forwardSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Stock Centers" />
</jsp:include>



<div id="rightcolumn">

               <span class ="mainheader">Arabidopsis Stock Centers</span>


                <p>You can order many seed stocks from the various stock centers listed below.  If none of them have the stocks you are interested in,
                    contact the corresponding author of the paper which describes your plants of interest.</p>

	<dl>
                    <dt><b>Arabidopsis Biological Resource Center (ABRC)</b></dt>
                          <dd>
                        <dl>

                          <dt><a href="http://arabidopsis.org/servlets/Order?state=catalog">ABRC stock catalog</a></dt>
                          <dd>Browse through the catalog of seed stocks.</dd>
                          <dt><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=polyallele">TAIR polymorphism search</a></dt>
                          <dd>Search for polymorphisms based on many different attributes. If the allele you are searching for has a seed stock available from ABRC, just click to order it.</dd>
                          <dt><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=germplasm">TAIR germplasm search</a></dt>
                          <dd>Search through the germplasms in the TAIR database, most are available as seed stocks from ABRC.</dd>
                          <dt><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=ecotype">TAIR ecotype search</a></dt>
                          <dd>A more specific search for Arabidopsis ecotypes/natural variants and relatives of Arabidopsis, most are available as seed stock from ABRC.</dd>
                        </dl>
</dl>

<dl>
                     <dt><b>Nottingham Arabidopsis Stock Center (NASC)</b></dt>
                         <dd>
                       <dl>
                          <dt><a href="http://arabidopsis.info/BrowsePage">NASC stock catalog</a></dt>
                          <dd>Browse through the catalog of seed stocks.</dd>
                          <dt><a href="http://arabidopsis.info/BasicForm">NASC germplasm search</a></dt>
                          <dd>Search through the NASC germplasm database using several different criteria.</dd>
                          <dt><a href="http://arabidopsis.info/InfoPages?template=photopage;web_section=germplasm">NASC photograph collection</a></dt>
                          <dd>Browse through the NASC collection of photographs of ecotypes and mutants. </dd>
                     <dt><a href="http://arabidopsis.info/EcoForm">NASC ecotype search</a></dt>
                          <dd>A more specific search for Arabidopsis ecotypes/natural variants.</dd>
                        </dl>
</dl>

<dl>
                     <dt><B>RIKEN Bioresource Center (BRC)/ SENDAI Arabidopsis Seed Stock Center (SASSC)</B></dt>
                         <dd>
                       <dl>
                          <dt><a href="http://sassc.epd.brc.riken.jp/sassc/strain_groups.php?mode=general">SASSC stock catalog</a></dt>
                          <dd>Browse through the catalog of seed stocks.</dd>
                          <dt><a href="http://sassc.epd.brc.riken.jp/sassc/create_search_panel2.php?mode=general">SASSC germplasm search</a></dt>
                          <dd>Search through the SASSC germplasm database using several different criteria.</dd>
                          <dt><a href="http://www.brc.riken.jp/lab/epd/Eng/catalog/seed.shtml">RIKEN BRC stock catalogue</a></dt>
                          <dd>Browse through the catalogue of seed stocks.</dd>
                          </dl>
</dl>
<dl>
                     <dt><a href="http://www-ijpb.versailles.inra.fr/en/cra/cra_accueil.htm">INRA-Versailles Genomic Resource Center</a></dt>
                     <dd>Provides: (1) seed stocks for T-DNA insertion mutant lines; (2) lines obtained from a worldwide collection of natural populations, specifically a core set that represents a maximum of genetic diversity within this collection; (3) different Recombinant Inbred Line populations will be soon available for ordering.</dd>
</dl>
<dl>
                     <dt><a href="http://www.arabidopsis.com/main/cat/!ct_seat.html">Lehle Seeds</a></dt>
                     <dd>Private company selling Arabidopsis seeds and growing systems.</dd>
       
</dl>



</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


