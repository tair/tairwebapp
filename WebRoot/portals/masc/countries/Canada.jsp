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
<jsp:param name="sidebarName" value="North America" />
</jsp:include>
<div id="rightcolumn">

<!-- Content goes here //--> 
<span class="mainheader">
<I>Arabidopsis
</I> Functional Genomics Efforts in Canada
</span>
<p>MASC representatives: 
<A HREF="mailto:bcrosby@uwindsor.ca">
Bill Crosby
</A>, 
<A HREF="http://www.uwindsor.ca/">
University of Windsor</A>, and 
<A HREF="mailto:malcolm.campbell@utoronto.ca">
Malcolm Campbell
</A>, 
<A HREF="http://www.utoronto.ca/">
University of Toronto
</A>
</p>
<hr>
<p>
<p><IMG SRC="/images/redball.gif"> New! Read the <a href="/portals/masc/countries/Canada_2009.pdf"><u>2009 Canada MASC report (pdf).</u></a>    
<p>Read the <a href="/portals/masc/countries/Canada_2007.pdf"><u>2007 Canada MASC report (pdf).</u></a>
<br>Read the <a href="/portals/masc/countries/Canada_2006.pdf"><u>2006 Canada MASC report (pdf).</u></a>
<p>
<dl>
<dt>Contents</dt>
<dd>
<ul>
<li><A HREF="#utoronto">
Functional Genomics Projects at the University of 
Toronto
</A>
<li>
<A HREF="#ubc">
Functional Genomics Projects at the University of BC
</A>
<li>
<A HREF="#nrcpbi">
Functional Genomics Projects at the NRC-PBI
</A>
<li>
<A HREF="#saskatoon">
Functional Genomics Projects at Agriculture Canada, 
Saskatoon
</A>
</ul>
</dd>
<hr>


</p>
<p>
<H4>
<A NAME="utoronto">
Functional Genomics Projects at the University of 
Toronto
</H4>
</a>(
<A HREF="mailto:coleman@botany.utoronto.ca">
Coleman
</A>, 
<A HREF="mailto:mccourt@botany.utoronto.ca">
McCourt
</A>, 
<A HREF="mailto:berleth@botany.utoronto.ca">
Berleth
</A>, Cutler, 
<A HREF="mailto:goring@botany.utoronto.ca">
Goring
</A>, 
<A HREF="mailto:david.guttman@utoronto.ca">
Guttman
</A>, Christendat, Provart)
<p>The 
<I>Arabidopsis
</I> Research Group (ARG) at the University of Toronto, 
which includes eight research groups housed out of the 
<A HREF="http://www.botany.utoronto.ca/">
Department of Botany
</A>, was originally established to provide resources 
and expertise for the 
<I>Arabidopsis
</I> community in Canada. These programs are jointly 
funded through the Ontario Genomics Initiative (OGI), 
<A HREF="http://www.genomecanada.ca/select.asp">
Genome Canada
</A>, the 
<A HREF="http://www.nserc.ca/">
National Science and Engineering Research Council
</A> (NSERC) and by private industry. All resources and 
data will be made publicly available through various 
databases and international stock centers. Contacts for 
each program are listed, or the ARG program director, 
Dr. John Coleman, can be reached directly at 
<A HREF="mailto:coleman@botany.utoronto.ca">
coleman@botany.utoronto.ca
</A>.
</p>
<p>Ongoing programs include:
<UL TYPE=DISC>
<LI>Collection and characterization of random insertion 
GFP enhancer trap lines in 
<I>Arabidopsis
</I> (
<A HREF="mailto:berleth@botany.utoronto.ca">
Thomas Berleth
</A>)
<LI>Collection and phenotypic characterization of 
inducible activation tagged lines in 
<I>Arabidopsis
</I> (
<A HREF="mailto:mccourt@botany.utoronto.ca">
Peter McCourt
</A>)
<LI>Bioinfomatic analysis of transcript profiling and 
predictions of protein structure in 
<I>Arabidopsis
</I> (Denish Christendat, Nick Provart).
<LI>Functional genomics of protein localization in 
<I>Arabidopsis
</I> (Sean Cutler) 
<LI>Functional genomics of receptor-like kinases in 
<I>Arabidopsis
</I> (
<A HREF="mailto:goring@botany.utoronto.ca">
Daphne Goring
</A>)
</UL>
</p>
<p>
<br>
</p>
<p>
<H4>
<A NAME="ubc">
Functional Genomics Projects at the 
</A>
<A HREF="http://www.ubc.ca/">
University of British Columbia
</A>
</H4>(
<A HREF="mailto:bohlmann@interchange.ubc.ca">
Bohlmann
</A>, 
<A HREF="mailto:cdouglas@interchange.ubc.ca">
Douglas
</A>, 
<A HREF="mailto:bee@interchange.ubc.ca">
Ellis
</A>, 
<A HREF="mailto:haughn@interchange.ubc.ca">
Haughn
</A>, 
<A HREF="mailto:xinli@interchange.ubc.ca">
Li
</A>)
<p>The functional genomics program at the UBC includes 
participants from the 
<A HREF="http://www.biotech.ubc.ca/">
Biotechnology Laboratory
</A>, 
<A HREF="http://www.botany.ubc.ca/">
Department of Botany
</A> and the 
<A HREF="http://www.agsci.ubc.ca/">
Department of Plant Science
</A>, among others. The program has recently received 
diverse funding input in support of its programs, 
including 
<A HREF="http://www.innovation.ca/index.cfm">
Canada Foundation for Innovation
</A> (CFI), 
<A HREF="http://www.nserc.ca/">
the National Science and Engineering Research Council
</A> (NSERC), 
<A HREF="http://www.for.gov.bc.ca/TIP/">
Operational Tree Improvement Program
</A> (OTIP), 
<A HREF="http://www.scbc.org/prog_schol/prsc_forebc.html">
Forest Renewal BC
</A> (FRBC), 
<A HREF="http://www.hfsp.org/">
Human Frontier Science Program
</A> (HFSP), 
<A HREF="http://www.genomebc.ca/">
Genome BC
</A> and 
<A HREF="http://www.genomecanada.ca/select.asp">
Genome Canada
</A>. Select program elements are listed below.
<UL TYPE=DISC>
<LI>The exploitation of 
<I>Arabidopsis
</I> as a model system for studying development, 
including metabolism and deposition of compounds of 
importance to wood fiber production in Conifers and 
<I>Populus
</I> species (
<A HREF="mailto:bee@interchange.ubc.ca">
Ellis
</A>, 
<A HREF="mailto:cdouglas@interchange.ubc.ca">
Douglas
</A>, 
<A HREF="mailto:bohlmann@interchange.ubc.ca">
Bohlmann
</A>).
<LI>Development of 
<A HREF="http://tilling.fhcrc.org/">
TILLING
</A> resources, in collaboration with 
<A HREF="mailto:steveh@fhcrc.org">
Dr. Steve Henikoff
</A> (
<A HREF="http://www.fhcrc.org/">
Fred Hutchison Cancer Research Centre
</A>, Univ. Washington, Seattle) in support of the joint 
<A HREF="http://www.genomecanada.ca/select.asp">
Genome Canada
</A> project concerned with Abiotic Stress of Crops (
<A HREF="mailto:haughn@interchange.ubc.ca">
Haughn
</A>).
<LI>Molecular biology of SAR response pathways in 
<I>Arabidopsis
</I> (
<A HREF="mailto:xinli@interchange.ubc.ca">
Li
</A>).
</UL>
</p>
<p>
<br>
</p>
<p>
<H4>
<A NAME="nrcpbi">
Functional Genomics Projects at the 
</A>
<A HREF="http://www.pbi.nrc.ca/en/pbi.html">
NRC-PBI
</A>
</H4>( Risseeuw)
<p>The Plant Biotechnology Institute (PBI) program 
derives from activity initiated in late 1999, under the 
auspices of the 
<A HREF="http://www.nrc.ca/">
NRC
</A> "
<A HREF="http://www.nrc.ca/research/biotechnology_e.html#7">
Genomics in Health and Agriculture Initiative
</A>" (GHI). The program was additionally funded by 
<A HREF="http://www.genomecanada.ca/select.asp">
Genome Canada
</A>, the 
<A HREF="http://www.agr.gov.sk.ca/afif/">
Saskatchewan-Canada Agri-Food Innovation Fund
</A> and, more recently, has linked to an 
<A HREF="/portals/masc/workshop2010.jsp">
NSF 2010 project
</A> concerned with the 
<A HREF="https://www.fastlane.nsf.gov/servlet/showaward?award=0115870">
Functional Genomics of the Ubiquitin-Protein Ligase (E3) 
families in 
<I>Arabidopsis
</I>
</A>. The following is a summary of the structural and 
functional genomics sub-programs:
<UL TYPE=DISC>
<LI>A limited EST program for 
<I>Brassica napus
</I> (40,000 runs)
<LI>Development of a T-DNA disrupted population of 
<I>Arabidopsis
</I> (in collaboration with 
<A HREF="mailto:ecker@salk.edu">
J. Ecker
</A>, 
<A HREF="http://signal.salk.edu/">
Salk Institute
</A>, La Jolla, CA)
<LI>Development of a genomic amplicon microarray for 
known and predicted genes of 
<I>Arabidopsis
</I>
<LI>Development of a 2-hybrid 'map' for proteins 
involved in the E3 Ligase functions in 
<I>Arabidopsis
</I>
<LI>Bioinformatics program including HPC (cluster) 
support, gene annotation and data integration tools
<LI>Investigation of the role of ASK genes in SCF 
function in 
<I>Arabidopsis
</I> (Risseeuw)
<LI>Molecular biology of pathogen response signaling in 
<I>Arabidopsis
</I> (
<A HREF="mailto:Pierre.Fobert@nrc.ca">
Fobert
</A>, D&#233;pres)
</UL>
<p>
<br>
</p>
<p>
<H4>
<A NAME="saskatoon">
Functional Genomics Projects at 
</A>
<A HREF="http://res2.agr.ca/saskatoon/">
Agriculture Canada, Saskatoon
</A> (AAFC-SRC)
</H4>(
<A HREF="mailto:lydiated@em.agr.ca">
Lydiate
</A>, 
<A HREF="mailto:ParkinI@em.agr.ca">
Parkin
</A>)
<p>The Saskatoon Research Center of Agriculture Canada 
is conducting an active program designed to exploit 
<I>Arabidopsis
</I> model system in support of genomics approaches to 
<I>Brassica
</I> crop development. The program is funded by the 
<A HREF="http://www.agr.gc.ca/index_e.phtml">
Agriculture Canada
</A> Genomics Program, and is supplemented by recent 
support from 
<A HREF="http://www.genomecanada.ca/select.asp">
Genome Canada
</A>. Program elements include:
<UL TYPE=DISC>
<LI>Genetic, physical and bioinformatics approaches to 
defining the relationship between the 
<I>Arabidopsis
</I> and 
<I>Brassica
</I> genomes
<LI>Targeted EST programs in 
<I>Brassica
</I> and 
<I>Arabidopsis
</I>, with a biological emphasis on cold adaptation and 
biotic stress response (fungal pathogenesis; insect 
herbivory)
<LI>Development of an 
<I>Arabidopsis
</I> activation-tagged T-DNA insert population
<LI>Development of SAGE libraries and tools for analysis 
of gene expression in 
<I>Arabidopsis
</I> and 
<I>Brassica
</I> crop species.
</UL>
</p>
<p>
<br>
</p>
</DL>
<center>Last modified on July 21, 2009</center>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


