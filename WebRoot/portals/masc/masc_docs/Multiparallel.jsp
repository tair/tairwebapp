<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "MASC";
String cssfile="/css/page/search.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
		
<!-- Content goes here //--> 

<span class="mainheader">
2003 Report of the Multiparallel Analytical Tools  subcommittee
</a>
</span>



<p>One of the requirements to advance post-genomic biology is the development of multiparallel analytical tools to a level where whole system analysis of gene expression can be integrated with similar measurement of the proteome and metabolome. 

<p>Massive, high-throughput analysis of gene expression using DNA microarrays is now developing into a routine technique in many laboratories and the establishment of service facilities in several countries provides access to the technology for most 
<I>Arabidopsis
</I> researchers.  Considerable effort is being put into refining the technology to provide arrays that are fully representative of the 
<I>Arabidopsis
</I> transcriptome or contain oligonucleotides specific for each gene in the genome.  In Japan, the 
<A HREF="http://pfgweb.gsc.riken.go.jp/projects/">
RIKEN GSC
</A>, a plant functional genomics group (
<A HREF="http://pfgweb.gsc.riken.go.jp/projects/">
http://pfgweb.gsc.riken.go.jp/projects/
</A>) is collecting more than 15,000 full-length cDNAs (RAFL clones) and sequencing more than 4,000 RAFL clones.  In the USA, the 
<A HREF="http://signal.salk.edu/SSP/">
SSP group
</A> (
<A HREF="http://signal.salk.edu/SSP/">
http://signal.salk.edu/SSP/
</A>) in conjunction with the 
<A HREF="http://pfgweb.gsc.riken.go.jp/projects/index.html">
RIKEN plant functional genomics group
</A> are sequencing and verifying ORFs for 8,000 genes.  The EU funded 
<A HREF="http://www.catma.org">
CATMA project
</A> (
<A HREF="http://www.catma.org">
http://www.catma.org
</A>) has produced gene sequence tags representing about 70% coverage of the 
<I>Arabidopsis
</I> genome.  A new EU project, 
<A HREF="http://www.psb.rug.ac.be/CAGE/">
CAGE
</A> (Compendium of 
<I>Arabidopsis
</I> Gene Expression, 
<A HREF="http://www.psb.rug.ac.be/CAGE/">
http://www.psb.rug.ac.be/CAGE/
</A>), will develop the bioinformatics and experimental methodology, using the CATMA arrays in a large-scale standardized screen of gene expression in 
<I>Arabidopsis
</I>.  Finally, a large collaborative project, AtGenExpress, has been proposed by the German DFG's 
<A HREF="http://www.uni-frankfurt.de/fb15/botanik/mcb/AFGN/AFGNHome.html ">
AFGN
</A> (
<A HREF="http://www.uni-frankfurt.de/fb15/botanik/mcb/AFGN/AFGNHome.html ">
http://www.uni-frankfurt.de/fb15/botanik/mcb/AFGN/AFGNHome.html
</A>) project, the 
<A HREF="http://www.nsf.gov">
US NSF
</A>, 
<A HREF="http://www.riken.go.jp/engn/index.html">
RIKEN
</A>, 
<A HREF="http://www.york.ac.uk/res/garnet/garnet.htm">
GARNet
</A>, and several smaller groups that will combine resources to use microarray technology to profile gene expression patterns across developmental time and in response to hormones and stress.  RIKEN GSC opens the RAFL cDNA microarray data from 
<A HREF="http://rarge.gsc.riken.go.jp/">
RARGE
</A> (
<A HREF="http://rarge.gsc.riken.go.jp/">
http://rarge.gsc.riken.go.jp/
</A>).  These projects and the recent commercial release of more extensive 
<I>Arabidopsis
</I> genome microarrays are moving 
<I>Arabidopsis
</I> genomics towards the mid-term goal, set out in June 2002, to be able to determine all mRNA expression profiles at the organ, cellular and subcellular levels.  
<b>It is critical that scientists carrying out microarray experiments make their datasets available to the community in a timely fashion to allow comparisons across experiments.
</b>


<p>The tools for global analysis of proteins rely on separation of proteins prior to identification by mass spectrometry of peptides derived from them by proteolytic digestion.  A variety of large-scale and service projects have been initiated, e.g., 
<A HREF="http://www.york.ac.uk/res/garnet/garnet.htm">
GARNet
</A> (
<A HREF="http://www.york.ac.uk/res/garnet/garnet.htm">
http://www.york.ac.uk/res/garnet/garnet.htm
</A>) and 
<A HREF="http://www.gabi.de">
GABI-LAPP
</A> (
<A HREF="http://www.gabi.de">
http://www.gabi.de
</A>) projects.  Tools for the cataloguing of proteins in plant or organ extracts are based on two-dimensional SDS-PAGE, capillary electrophoretic or HPLC separation before mass spectrometry.  The technology is not able to quantitate all of the proteins in an organism, and research has concentrated on proteomics of organelles or comparative proteomics using labeling techniques such as Isotope-Coded Affinity Tags (ICAT) or Cy3.Cy5 dyes to focus only on differences in proteins/peptides in two samples.  Systematic heterologous expression of all proteins and study of protein-protein interactions using two hybrid techniques are in their infancy.  The goal of being able to routinely catalogue protein profiles has not yet been achieved although new angles on the technology such as Multidimensional Protein Identification Technology (MudPIT) (see Koller et al. (2002).  
<A HREF="http://www.pnas.org/cgi/content/full/99/18/11969">
PNAS 99 (18):11969-74
</A>) have proven to be very rewarding when applied to organisms with full genome sequences.  Despite these advances, we have only begun to chip away at the tip of the proteome iceberg.


<p>Amongst the 'omics' technologies the ability to simultaneously quantify all of the metabolites at the cell, organ or plant level is the goal that may prove to be the most difficult to achieve.  Traditional analytical techniques based on chromatographic separation of metabolites and subsequent identification such as GC-MS and LC-MS have played an important role in the opening developments in this area.  However application of 'fingerprinting' to unchromatographed extracts by NMR and direct injection ESI-MS or FT-ICR-MS are promising methods that will play a role in mass screening of mutants and natural variants, highlighting areas of metabolism for more detailed analysis by targeted and high resolution techniques.  Much 
<I>Arabidopsis
</I> metabolomics is being pursued in the private sector.  Service and large-scale activities in publicly funded 
<I>Arabidopsis
</I> metabolomics are less prevalent than the other 'omics'.  Nevertheless, the UK 
<A HREF="http://www.york.ac.uk/res/garnet/garnet.htm">
GARNet
</A> project contains an 
<I>Arabidopsis
</I> metabolomics service, and activities in 
<I>Arabidopsis
</I> metabolomics are beginning to emerge in the Netherlands (
<A HREF="http://www.biosystemsgenomics.nl/">
http://www.biosystemsgenomics.nl/
</A>) and in Sweden (
<A HREF="http://wcn.ntech.se/platforms/Metabolomics.htm">
http://wcn.ntech.se/platforms/Metabolomics.htm
</A>). 
<p>




<center>Last modified on August 15, 2006

</center>
</p>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>



