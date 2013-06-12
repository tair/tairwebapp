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

<span class="mainheader"> Austrian <I>Arabidopsis</I> Functional Genomics Research</span>
<table>
<p>MASC representatives: 
<A HREF="mailto:marie-theres.hauser@boku.ac.at">
Marie-Theres Hauser
</A>, University of Natural Resources and Applied Life Sciences, Vienna, and 
<A HREF="mailto:ortrun_mittelsten_scheid@gmi.oeaw.ac.at">
Ortrun Mittelsten-Scheid
</A>, GMI, Austrian Academy of Sciences, Vienna
</p>
<hr>
<p>
<p><IMG SRC="/images/redball.gif"> New! Read the <a href="/portals/masc/countries/Austria_2009.pdf"><u>2009 Austria MASC report (pdf).</u></a>
<p>Read the <a href="/portals/masc/countries/Austria_2008.pdf"><u>2008 Austria MASC report (pdf).</u></a>
<br>Read the <a href="/portals/masc/countries/Austria_2007.pdf"><u>2007 Austria MASC report (pdf).</u></a>
<br>Read the <a href="/portals/masc/countries/Austria_2006.pdf"><u>2006 Austria MASC report (pdf).</u></p>
<p>
<H4>Contents
</H4>
</p>
<p>
<H5>
<A HREF="#intro">Introduction
</A>
<br>
<A HREF="#apar">
APAR Activities
</A>
<P>
<A HREF="#addl">
Additional activities on 
<I>Arabidopsis
</I> research in Austria
</A>
<P>
<A HREF="#fund">
Funding Agencies
</A>
<br>
</H5>
</p>

_________________________________________
<DL>
<p>
<H4>
<A NAME="intro">Introduction
</A>
</H4>
</p>


<p>At present, APAR is comprised of the following projects:
</p>
<UL>
<LI>
<B>Molecular regulation of cytokinesis during plant 
development 
</B>
<br>
<I>Marie-Theres Hauser, Center for Applied Genetics, Vienna 
University of Agricultural Sciences
</I>
<br>Cell division is one key parameter of plant growth and 
development and consists of nuclear division followed by the 
division of the cytoplasm (cytokinesis). The cytoskeleton and 
in particular the dynamic microtubules play an essential role 
during cell cycle. In plants, they form four distinct arrays 
(cortical microtubules, the preprophase band, the spindle and 
the phargmoplast). Microtubule-associated proteins (MAPs) are 
important regulators of the structure and dynamic of these 
microtubule assemblies. The objective of the project is to 
determine the molecular mechanisms regulating cytokinesis. In 
preparatory investigations we identified cytokinesis mutants 
<I>hyade
</I> and 
<I>pleiade
</I> in 
<I>Arabidopsis thaliana
</I>. The proposal is divided in three main tasks focusing on 
the molecular, cell biological and biochemical analyses of 
the 
<I>HYADE
</I> and 
<I>PLEIADE
</I> genes and gene products. The third part concentrates on 
the functional characterization of the 
<I>PLEIADE
</I> gene family. Due to the molecular basis of the mutants 
and their homology to proteins of other eukaryotes, the 
results may lead to a fundamental understanding of the 
regulation of microtubules dynamics and the last steps during 
cell division.
<br> &nbsp;
<br>
</LI>


<LI>
<B> Molecular analysis of MAPK-mediated ethylene signaling in 
<I>Arabidopsis thaliana
</I>
</B>
<br>
<I>
<A href="mailto:Hehi@gem.univie.ac.at">
Heribert Hirt
</a>, Instititute of Microbiology and Genetics, University of 
Vienna and Gregor-Mendel-Institute of Molecular Plant 
Sciences, Academy of Sciences, Vienna
</I>
<br>Ethylene is one of the five classical plant hormones and 
plays important roles in development, growth, stress response 
and senescence. Although much is known on the action of 
ethylene, the perception and signal transduction processes 
are still not completely understood. Our research has 
unraveled that a particular MAPK pathway mediates ethylene 
responses in plants. The research proposal aims to 
investigate the molecular mechanisms how the MAPK module 
functions in the context of the known ethylene signaling 
components and physiological responses.   
<br> &nbsp;
<br>
</LI>


<LI>
<B>Analysis of glycogen synthase kinase/shaggy-like kinases: 
Novel aspects of salt stress signaling in plants
</B>
<br>
<I>
<a href="mailto:Jonak@gem.univie.ac.at">
Claudia Jonak
</a>, Institute of Microbiology and Genetics, University of 
Vienna
</I>
<br>High soil salinity is an increasingly deleterious 
obstacle to growth and yield of crop plants. Thus detailed 
knowledge of high salt signaling hierarchies and of metabolic 
changes involved in stress responses is of great 
significance. While physiological studies have been performed 
extensively, our understanding of the mechanisms of osmotic 
stress signal transduction is still limited. We have recently 
found that MsK4, a novel glycogen synthase kinase/shaggy-like 
protein kinase from 
<I>Medicago sativa
</I>, is involved in the rapid response to salinity. The MsK4 
protein kinase is plastid-localized and associates with 
starch grains. Our results show that the 
<I>Arabidopsis
</I> homolog, AtK-1, is rapidly activated by high salt 
stress, too. To unravel basic processes in high salinity 
stress signaling and adaptation to high salt conditions we 
propose to place the function of AtK-1 within the salt stress 
signaling network, to determine the dynamics of AtK-1 
localization under normal and high salt growth conditions and 
to investigate the putative role of AtK-1 activity in carbon 
allocation and starch composition under diverse environmental 
conditions. We seek to address these tasks by a molecular-
biochemical approach using 
<I>Arabidopsis
</I> mutants as well as by protoplast transient expression 
analysis.
<br> &nbsp;
<br>
</LI>


<LI>
<B> Specificity and functional analysis of a PP2C protein 
phosphatase gene subfamily
</B>
<br>
<I>
<A href="mailto:Irute@gem.univie.ac.at">
Irute Meskiene
</a>, Institute of Microbiology and Genetics, University of 
Vienna
</I>
<br>Signal transduction involves protein phosphatases and 
kinases as important components of growth control and stress 
responses. We identified a 
<I>Medicago
</I> PP2C-type protein phosphatase MP2C and 
<I>Arabidopsis
</I> AP2C as inhibitors of a stress induced MAPK (mitogen 
activated protein kinase). These phosphatases are induced by 
salt, wound and cold stresses. Within the large PP2C gene 
family in 
<I>Arabidopsis
</I> MP2C/AP2C forms a subfamily of four genes. The 
structure-functional analysis of MP2C and AP2C revealed that 
these phosphatases are binding and inhibiting MAPK. Based on 
the protein domain analysis we assume that PP2Cs of this 
subfamily are involved in MAPK inactivation. Therefore we 
propose to investigate the role of these PP2Cs in MAPK 
inactivation by applying a combined genetic, molecular 
biology and biochemistry approach. We will analyse the 
phenotype and MAPK activities in PP2C insertional knock out 
mutants and seek to identify which of the MAPK pathways might 
be targeted by various PP2C proteins.
<br> &nbsp;
<br>
</LI>


<LI>
<B> Calcium-dependent protein kinases in 
<I>Arabidopsis
</I> signal transduction
</B>
<br>
<I>
<a href="mailto:Markus.Teige@univie.ac.at">
Markus Teige
</a>, Institute of Microbiology and Genetics, University of 
Vienna
</I>
<br>Calcium is a ubiquitous second messenger in eukaryotic 
signal transduction. In plant cells, intracellular Ca
<sup>2+
</sup>levels are modulated in response to light, hormones, or 
biotic and abiotic stresses. We have recently cloned calcium 
dependent protein kinases from 
<I>Arabidopsis thaliana
</I>. Preliminary data indicate that certain CPKs are 
involved in environmental stress signal transduction. To 
elucidate the biological role of CPKs in plants, we will 
apply the following strategies: 1) examination of the 
subcellular localization, 2) identification of activating 
stimuli, 3) identification of potential targets, 4) 
<I>in planta
</I> overexpression of CPKs, and 5) analysis of CPK knockout 
lines.
<br> &nbsp;
<br>
</LI>


<LI>
<B>Functional study of the Ku complex at 
<I>Arabidopsis
</I> telomeres
</B>
<br>
<I>Karel Riha, Gregor-Mendel-Institute of Molecular Plant 
Sciences, Academy of Sciences, Vienna
</I>
<br>Telomeres are nucleoprotein structures at the end of 
eukaryotic chromosomes. They mask chromosome ends from being 
recognized and processed as DNA double strand breaks by a DNA 
checkpoint and repair machinery. Paradoxically, several DNA 
repair and checkpoint complexes have been recently localized 
at the telomeres in yeast and mammals. The Ku70/80 
heterodimer, which is essential for DNA repair through non-
homologous end joining, has the most controversial role. Ku 
is required for proper telomere maintenance protection, but 
it also mediates fusions of unprotected chromosome ends. My 
long-term goal is to employ 
<I>Arabidopsis
</I> as a higher eukaryotic model for investigating basic 
questions in telomere biology and genome stability. 
Previously, we characterized 
<I>Arabidopsis
</I> mutants deficient in catalytic subunit of telomerase and 
Ku70. We demonstrated that Ku negatively regulates telomerase 
at 
<I>Arabidopsis
</I> telomeres and is required for proper maintenance of 
telomeric C-strand.  In this project, a detailed analysis of 
the telomeric role of Ku is proposed in 
<I>Arabidopsis
</I>. We will examine functional interactions between Ku, 
telomerase and other DNA repair complexes implicated in 
telomere biogenesis. In addition, to further unravel 
molecular interactions at 
<I>Arabidopsis
</I> telomeres, a screen for novel Ku interacting proteins 
will be performed.
<br> &nbsp;
<br>
</LI>

</UL>
</p>

<p>
<H4>
<A NAME="addl">Additional activities on 
<I>Arabidopsis
</I> research in Austria:</A>
</H4>
</p>
<p>
<UL type=disc>

<LI>
<B>Structure-Function Relationships of Ribonucleoproteins
</B>
<br>
<a href="mailto:andrea@bch.univie.ac.at">
Andrea Barta
</a>
<br>
<a href="http://www.at.embnet.org/bch/">
http://www.at.embnet.org/bch/
</a>
<br> &nbsp;
<br>
</LI>


<LI>
<B>Signal transduction and cell cycle regulation
</B>
<br>
<a href="mailto:HEHI@gem.univie.ac.at">
Heribert Hirt
</a>
<br>
<a href="http://www.at.embnet.org/gem/research/Hirt/hirt.html">
http://www.at.embnet.org/gem/research/Hirt/hirt.html
</a>
<br> &nbsp;
<br>
</LI>


<LI>
<B>Auxin and cytokinin: transport and cell differentiation
</B>
<br>
<a href="mailto:clusch@edv2.boku.ac.at">
Christian Luschnig
</a>
<br>
<a href="http://hp09.boku.ac.at/research/search_person.show_person?person_id_in=4054">
http://hp09.boku.ac.at/research/search_person.show_person?person_id_in=4054
</a>
<br> &nbsp;
<br>
</LI>


<LI>
<B>Epigenetics
</B>
<br>
Marjorie and Tony Matzke
<br>
<a href="http://www.gmi.oeaw.ac.at/amatzke.htm">
http://www.gmi.oeaw.ac.at/amatzke.htm
</a>
<br> &nbsp;
<br>
</LI>


<LI>
<B>Chromosome Biology
</B>
<br>
<a href="mailto:dieter.schweitzer@oeaw.ac.at">
Dieter Schweitzer
</a>
<br>
<a href="http://www.gmi.oeaw.ac.at/dschweizer.htm">
http://www.gmi.oeaw.ac.at/dschweizer.htm
</a>
<br> &nbsp;
<br>
</LI>


<LI>
<B>Genes involved in the reprogramming of microspores
</B>
<br>
<a href="mailto:alisher@gem.univie.ac.at">
Alisher Touraev
</a> and
<a href="mailto:erwin@gem.univie.ac.at">
Erwin Heberle-Bors
</a>
<br>
<a href="http://www.at.embnet.org/gem/research/Touraev/touraev.html">
http://www.at.embnet.org/gem/research/Touraev/touraev.html
</a>
<br> &nbsp;
<br>
</LI>


<LI>
<B>MAP Kinase signal transduction in plants
</B>
<br>
<a href="mailto:cathal@gem.univie.ac.at">
Cathal Wilson
</a> and
<a href="mailto:erwin@gem.univie.ac.at">
Erwin Heberle-Bors
</a>
<br>
<a href="http://www.at.embnet.org/gem/research/Wilson/wilson.html">
http://www.at.embnet.org/gem/research/Wilson/wilson.html
</a>
<br> &nbsp;
<br>
</LI>

</UL>

<p>
<H4>
<A NAME="fund">Funding Agencies
</A>
</H4>
</p>
<p>Basic research only: FWF (Fonds zur F&#246;rderung der wissenschaftlichen Forschung)
<br>
<a href="http://www.fwf.ac.at">
www.fwf.ac.at
</a>
</p>

<p>Vienna region: WWTF (Wiener Wissenschafts-, Forschungs- und Technologiefonds)
<br>
<A href="http://www.wwtf.at">
www.wwtf.at
</a>
</p>

<p>Specific programs: Bundesministerium f&#252;r Wissenschaft, Bildung und Kultur
<br>
<A href="http://www.bmbwk.gv.at/start.asp?bereich=5">
http://www.bmbwk.gv.at/start.asp?bereich=5
</a>
</p>

<p> Applied research: FFF (Forschungsf&#246;rderungsonfds der gewerblichen Wirtschaft)
<br>
<a href="http://www.fff.at">
www.fff.at
</a>
</p>
</DL>
</table>
</div>


<center>Last modified on July 18, 2009</center>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

