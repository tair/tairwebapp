<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - About Arabidopsis";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1120" />
</jsp:include>
<jsp:include page="/jsp/includes/educationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="About Arabidopsis" />  
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->
<a name="top"></a>
<span class="mainheader">About Arabidopsis</span>
<ul>
<li><a href="#sum">Summary</a></li>
<li><a href="#hist">History of <i> Arabidopsis thaliana</i></a></li>
<li><a href="#names">Common names for an uncommon weed.</a></li>
<li><a href="#world">Geographic distribution of ecotypes and the history of some favorite "lab" strains.</a></li>
<li><a href="#time">Arabidopsis growth stages and timeline of events</a></li>
<li><a href="http://www.hort.purdue.edu/hort/facilities/greenhouse/101exp.shtml">101 Ways to grow Arabidopsis</a></li>
<li><a href="#res">The role and importance of Arabidopsis as a model organism</a></li>
<li><a href="/portals/genAnnotation/genome_snapshot.jsp">Genome Snapshot</a></li>
<li><a href="#books">Books about Arabidopsis and  methods in Arabidopsis research</a></li>
<li><a href="#reshist">Timeline of major events in Arabidopsis research</a></li>
</ul>
<a name="sum"></a>
<dl>
<dt>Summary</dt>
<dd><I>Arabidopsis thaliana</I> is a small flowering plant that is widely used as a model organism in plant biology.  Arabidopsis is a member of the mustard (Brassicaceae) family, which includes cultivated species such as cabbage and radish. Arabidopsis is not  of major agronomic significance, but it offers important advantages for basic research in genetics and molecular biology. Click on the link to NCBI's Taxonomy Browser to view <a href ="http://www.ncbi.nlm.nih.gov:80/Taxonomy/Browser/wwwtax.cgi?mode=Undef&amp;name=Arabidopsis+thaliana&amp;lvl=0&amp;srchmode=1">Arabidopsis taxonomy</a> or view the <a href= "http://www.ncbi.nlm.nih.gov:80/Taxonomy/Browser/wwwtax.cgi?mode=Undef&amp;id=3700&amp;lvl=3&amp;keep=1&amp;srchmode=1&amp;unlock">Brassicaceae</a>. A <a href="http://en.wikipedia.org/wiki/Arabidopsis_thaliana">Wikipedia entry</a> is also available.</dd>
<dt>Some useful statistics:</dt>
<dd>Small genome (114.5 Mb/125 Mb total) has been sequenced in the year 2000 (<A HREF="http://tairvm09.tacc.utexas.edu/servlets/sv">SequenceViewer</A>, <A HREF="/portals/genAnnotation/gene_structural_annotation/index.jsp">AGI</A>).</dd>
<dd>Extensive genetic and physical maps of all 5 chromosomes  </dd>
<dd><A HREF="/servlets/mapper">(MapViewer)</A>. </dd>
<dd>A rapid life cycle (about 6 weeks from germination to mature seed). </dd>
<dd>Prolific seed production and easy cultivation in restricted space. </dd>
<dd>Efficient transformation methods utilizing <I>Agrobacterium tumefaciens</I>. </dd>
<dd>A large number of mutant lines and genomic resources many of which are available from <A HREF="/links/atlinks.jsp"> Stock Centers</A>.</dd>
<dd>Multinational research community of academic, government and industry laboratories.</dd>

<dt>Such advantages have made Arabidopsis a model organism for studies of the cellular and molecular biology of flowering plants.TAIR collects and makes available the information arising from these efforts. </dt>
<dd><IMG SRC="/images/arabi_bw1tr.gif" alt="Arabidopsis drawing"></dd>
<dd>View of <I>Arabidopsis thaliana</I></dd>              
</dl>
<p><a href="#top">[Back to top]</a></p>

<dl>
<Dt><a name="hist"></a>History of Arabidopsis thaliana as a research organism.</dt>

<dd><i>"Arabidopsis thaliana</i> was discovered by Johannes Thal (hence, thaliana) in the Harz mountains in the sixteenth century, though he called it Pilosella siliquosa (and it has gone through a number of name changes since). The earliest report of a mutant (that I know of) was in 1873 (by A. Braun). F. Laibach first summarized the potential of Arabidopsis thaliana as a model organism for genetics in 1943 - he did some work on it much earlier though, publishing its correct chromosome number in 1907. The first collection of induced mutants was made by Laibach's student E. Reinholz. Her thesis was submitted in 1945, the work published in 1947. Langridge played an important role in establishing the properties and utility of the organism for laboratory studies in the 1950s, as did Rédei and others (such as J.H. van der Veen in the Netherlands, J. Veleminsky in Czechoslovakia and G. Röbbelen in Germany) in the 1960s. One of Rédei's many important contributions was to write scholarly reviews on Arabidopsis, a particularly thorough one is in Bibliographica Genetica vol 20, No. 2, 1970, pp. 1- 151. He wrote a more easily found one in Ann. Rev. Genet. (1975) vol. 9,111-127. Both go through some of the early history of the use of Arabidopsis in the laboratory, though the longer 1970 one has all the details."<p> --from Elliot Meyerowitz, 1998</p> </dd>
</dl>
<p><a href="#top">[Back to top]</a></p>

<a name="names"></a>
<DL>
<dt>Common names for Arabidopsis</dt>
<dd>According to Redei, GP. (1992) A heuristic glance at the past of Arabidopsis genetics. <a href="#books">In Methods in Arabidopsis Research</a>, eds C. Koncz, NH Chua, J Schell, Wold Scientific,Singapore pp1-15.</dd>
<DD>English: Wall cress; mouse-ear cress</dd>
<DD>German: Schmalwand, G&#228;nsekraut, Thal's G&#228;nsekresse</dd>
<DD>French: <a href="http://www.dijon.inra.fr/malherbo/hyppa/hyppa-f/arbth_fh.htm" target="_blank">arabette rameuse</a>, arabette des dames</dd>
<DD>Spanish: arabide</dd>
<DD>Dutch: zandraket</dd>
<DD>Danish: g&#229;semad</dd>
<DD>Norwegian: v&#229;rskrinneblom</dd>
<DD>Hungarian: l&uacute;df&#252;</dd>
<DD>Polish: rzodkiewnik</dd>
<DD>Japanese: shiro-inu-nazuna</dd>
</DL>
<p><a href="#top">[Back to top]</a></p>

<a name="world"></a>
<dl>
<dt>Arabidopsis Ecotypes and Geographic Distribution of Arabidopsis</dt>
<dd>Over 750 natural accessions of <i>Arabidopsis thaliana</i> have been collected from around the world and are available from the two major <a href="/links/atlinks.jsp"> seed stock centers</a>, ABRC and NASC. These accessions are quite variable in terms of form and development (e.g. leaf shape,hairiness) and physiology (e.g. flowering time, disease resistance). Researchers around the world are using these differences in natural accessions to uncover the complex genetic interactions such as those underlying plant responses to environment and evolution of morphological traits. While many collections of natural accessions may not meet a strict definition of an ecotype, they are commonly referred to as ecotypes in the scientific literature.</dd>
<dd><a href="/images/geo_distribution.png">PNG image of world wide distribution (1993, from Jonothan Clarke).</a>
This figure was produced by Jonathan Clarke for his Ph.D. (1993) thesis with Caroline Dean at Norwich, U.K. This map was based on, i.e., re-drawn, from an original by George Redei (1969).</dd>

<dd>World <a href="/i/arabidopsis_ecotype_map.jpg">map</a> showing the geographical distribution (longitude, latitude, elevation) of more than 30 Arabidopsis ecotypes. This image was kindly provided to us by the University of Toronto and is also available as interactive map on their website <a href="http://www.bar.utoronto.ca/.">http://www.bar.utoronto.ca/</a></dd>
<dd>Distribution<a href="/images/plantsdbdist.gif"> map</a> of Arabidopsis in the USA from the <a href ="http://plants.usda.gov">USDA's Plants Database</a>.To view the map interactively (clicking on the states links to county wide distribution) and view other data go to the Plants Database website and enter a query for Scientific Name =Arabidopsis thaliana. Follow the links to view distribution and other links.</dd>
<dd>Information about the origins of frequently used ecotypes (Landsberg <i>erecta</i>, Columbia, and Wassilewskija from <a href="http://seeds.nottingham.ac.uk/Nasc/detail/2005/bglines.lasso">NASC.</a></dd>

</DL>
<p><a href="#top">[Back to top]</a></p>

<a name="time"></a>
<dl>
<dt>Arabidopsis Growth Stages and Timeline</dt>
<dd><a href="growth.jsp">Time table of growth stages</a> determined for Arabidopsis ecotype Columbia-O from <a href="boyes2001.pdf">Boyes, et.Hal. (2001) The Plant Cell 1499-1510.</a></dd>

<dd><a href="/portals/education/movies/germination.mov">View a time lapse movie of a germinating Arabidopsis seed</a>, from 0 to 65 hours after planting. Ecotype is Col-0, images were captured every 10 minutes. This Quicktime movie was graciously provided to TAIR by Dr. Ronny Joosen (Wageningen University). <dd>

<dd><a href="/info/arabgrowth.mov">View a time lapse movie showing the growth of Arabidopsis</a> from 4 days after planting (dap) to 22 dap. Columbia plants were grown in constant light in a growth chamber; images were captured every thirty minutes. This 65MB Quicktime video spans events following germination up til bolting. The original video was graciously provided to TAIR by Dr. Nick Kaplinsky (Swarthmore College, PA) and ported into Quicktime format. You may download Quicktime <a href="http://www.apple.com/quicktime/download/">here</a>.</dd>
</dl>
<p><a href="#top">[Back to top]</a></p>

<a name="res"></a>
<dl>
<dt>Information about Arabidopsis as a model genetic organism</dt>
<dd><a href="http://www.nsf.gov/pubs/2002/bio0202/model.htm">Arabidopsis as a model plant</a>: report from the NSF and MASC.</dd>
<dd><a href="http://www.nsf.gov/od/lpa/nsf50/nsfoutreach/htm/n50_z2/pages_z3/05_pg.htm">Arabidopsis - A Plant Genome Project</a>, one of the Nifty50 from the  National Science Foundation, USA.</dd>
</dl>
<p><a href="#top">[Back to top]</a></p>
<a name="books"></a>
<dl>
<dt>Books about Arabidopsis</dt>
                
 <dt><a href="http://www.cshlpress.com/default.tpl?action=full&amp;cart=10397155407809306&--eqskudatarq=365&amp;newtitle=Arabidopsis%3A%20A%20Laboratory%20Manual">Arabidopsis: A Laboratory Manual</a></dt>
	    <DD> Detef Weigel and Jane Glazebrook</dd>
	    <DD>Cold Spring Harbor Lab Press, 2002</dd>
	    <DD><i>A comprehensive,detailed laboratory manual for Arabidopsis including sections on plant growth, genetic analysis, proteomics, and genomics.</i></dd>
        <DT><a href="http://www.aspb.org/publications/arabidopsis/index.cfm">The Arabidopsis Book</a></dt>
        <DD>Chris Somerville and Elliot Meyerowitz</dd>
        <DD>American Society of Plant Biologists.</dd>
        <DD><I>A web based dynamic compendium of Arabidopsis biology. Contributed chapters written by experts in their fields are available on-line and free of charge as portable document format (PDF) documents.</I></dd>
        <DT>Arabidopsis : A Practical Approach. (2000)</dt>
        <DD>Zoe Wilson ed.</dd>
        <DD>Oxford University Press, Oxford, UK. </dd>
        <DD><I>More protocols and methods</I></dd>
        <DT>Arabidopsis: Annual Plant Reviews, Vol.1. (1998)</dt>
        <DD>Mary Anderson and Jeremy Roberts, eds.</dd>
        <DD>CRC Press, Boca Raton, FL, USA.</dd>
        <DT><a href="http://www.cshlpress.com/default.tpl?action=full&cart=10159597584788494&--eqskudatarq=163&newtitle=Arabidopsis">Arabidopsis</a>. (1994)</dt>
        <DD>Elliot M. Meyerowitz, Chris R. Somerville, eds.</dd>
        <DD>CSHL Press, New York, USA.</dd>
        <DD><I>A pretty comprehensive overview of Arabidopsology</I></dd>

        <dt>Arabidopsis : an Atlas of Morphology and Development. (1993) </dt>
        <DD>John L. Bowman ed.</dd>
        <DD>Springer-Verlag, Berlin & New York.</dd>
        <DD><I>Images and descriptions of normal and mutant Arabidopsis plants</I></dd>
	<dt>Methods in Arabidopsis research. (1992)</dt>
        <DD>Csaba Koncz, Nam-Hai Chua, Jeff Schell eds.</dd>
        <DD><I>Protocols and methods for Arabidopsis researchers</I></dd>
</dl>
                        

<p><a href="#top">[Back to top]</a></p>
<a name="reshist"></a>
<dl>
<dt>Timeline</dt>

<dd>2005: TAIR first Genome release (version TAIR 6.0, Nov 2005).</dd>
<dd>2004: Final TIGR Genome release (version TIGR 5.0, March 2004).</dd>
<dd>2003: TIGR 4.0 Genome release (Jun 2003).</dd>
<dd>2001:   Increased emphasis on functional and comparative genomics, NSF2010 Program.</dd>
<dd>2000:     Completion of genome sequence.</dd>
<dd>1999:     DNA chips and microarrays available .</dd>
<dd>1999:     Chromosomes II and IV sequenced .</dd>
<dd>1998:     Arabidopsis featured in Science genome issue .</dd>
<dd>1997:     Physical maps of all chromosomes completed.</dd>
<dd>1996:     Arabidopsis Genome Initiative organized.</dd>
<dd>1995:     Standard BAC and P1 libraries constructed.</dd>
<dd>1994:     cDNA sequencing efforts initiated .</dd>
<dd>1993:     High-efficiency transformation established.</dd>
<dd>1992:     First chromosome walk published.</dd>
<dd>1991:     Stock centers and database established.</dd>
<dd>1990:     Arabidopsis Genome Project initiated .</dd>
<dd>1989:     First T-DNA tagged mutant gene cloned.</dd>
<dd>1988:     First RFLP chromosome map published.</dd>
<dd>1988:     Electronic Arabidopsis newsgroup established.</dd>
<dd>1986:     First Arabidopsis gene sequences published.</dd>
<dd>1986:     Transformation with Agrobacterium reported </dd>
<dd>1985:     First promoted as model for molecular genetics.</dd>
<dd>1984:     Genome size and complexity characterized .</dd>
<dd>1983: First detailed genetic map published.</dd>
<dd>1980:     Expanded interest in use of Arabidopsis to study plant biochemistry, physiology, and development.</dd>
<dd>1976:     Second International Arabidopsis Conference. </dd>
<dd>1970:     First major review article published. </dd>
<dd>1965: First International Arabidopsis Conference.</dd>
<dd>1964: First Arabidopsis newsletter published. </dd>
</dl>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

