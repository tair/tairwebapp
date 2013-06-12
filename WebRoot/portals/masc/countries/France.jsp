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

<span class="mainheader">Ongoing <I>Arabidopsis</I> genome programmes in France</span>
<table>
<p>MASC representative: 
<A HREF="mailto:bouchez@versailles.inra.fr">
David Bouchez</A>, at the Institut Jean-Pierre Bourgin, SGAP-INRA Centre de Versailles
</p>
<hr>
<p><IMG SRC="/images/redball.gif"> New! Read the <a href="/portals/masc/countries/France_2009.pdf"><u>2009 France MASC report (pdf).</u></a>
<p>Read the <a href="/portals/masc/countries/France_2008.pdf"><u>2008 France MASC report (pdf).</u></a>
<br>Read the <a href="/portals/masc/countries/France_2007.pdf"><u>2007 France MASC report (pdf).</u></a>
<br>Read the <a href="/portals/masc/countries/France_2006.pdf"><u>2006 France MASC report (pdf).</u></p>    
<p>
<H4>Contents
</H4>
<DL>
<A HREF="#agencies">
Agencies funding 
<I>Arabidopsis
</I> functional genomics in France
</A>
<br>
<A HREF="#programs">
Major current programmes in France on the 
<I>Arabidopsis
</I> genome
</A> 
<DD>
<A HREF="#genoplante">
G&#233;noplante-funded programmes
</A>
<br>
<A HREF="#nongenoplante">
Non-G&#233;noplante Programmes
</A>
<br>   
</DD>
<A HREF="#bioinformatics">
Bioinformatics projects
</A>
<br>

</p>
<p>
<hr>
<p>
<DL>
<H4>
<A NAME="agencies">
Agencies funding 
<I>Arabidopsis
</I> functional genomics in France
</A>
</H4>
<p>
<IMG SRC="/images/redball.gif"> 
The major source of funding in France for Arabidopsis functional genomics projects is <A HREF="http://www.Genoplante.com/">
G&#233;noplante
</A> a federative program for plant genomics research created by public institutions (<A HREF="http://www.inra.fr/">
INRA
</A>, 
<A HREF="http://www.cnrs.fr/">
CNRS
</A>, 
<A HREF="http://www.cirad.fr/">
CIRAD
</A>, 
<A HREF="http://www.ird.fr/">
IRD</A>) and several French ag-biotech companies (
<A HREF="http://www.biogemma.com/">
Biogemma
</A>, 
<A HREF="http://www.bayercropscience.com">
Bayer CropScience
</A>, and 
<A HREF="http://ide.online.fr/BioPlante/">
Bioplante</A>). Created in 1999, it has supported research on the genomes of crop plants, and also has directed over 62 million Euros worth of research on Arabidopsis, supporting creation of high thrvoughput genomics tools and resources as well as functional genomics studies. Over a hundred projects have been funded by the ministries of research and agriculture.
<p>	A new initiative was launched in April 2005 to sustain research in plant genomics to the year 2010:<A Href="http://www.genoplante.com/content.php?idcontent=objectifs&lg=en"> "GENOPLANTE 2010"</A> is a 6 year initiative involving seven partners from the public sector (INRA, CNRS, CIRAD, IRD) and private companies (Biogemma, Arvalis, Sofiproteol). This program is now administered by the <A Href="http://www.gip-anr.fr/">  French National Research Agency </A> (ANR: Agence Nationale de la Recherche). The annual budget for the program for the next few years is planned to be around 12 million Euros per year. Although a large part is devoted to crop plants, several Arabidopsis projects are funded through the "Functional Analysis" and "New Tools" committees. The ANR also contributes to funding Arabidopsis research through its "white programs" for fundamental research.
</p>


<p>
<H4>
<A NAME="programs">
Major current programmes in France on the 
<I>Arabidopsis
</I> genome
</A>
</H4>
<I>Arabidopsis
</I> programmes funded by G&#233;noplante started in Spring 
2000 when the funds allocated to these programmes were 
effectively made available to the contributing 
laboratories.  A second phase of programmes started in the 
year 2002.  In general, data from G&#233;noplante-
funded programmes is released after a 6-month delay during 
which any IP protection deemed necessary is applied for.
</p>


<p>
<B>
<I>
<A NAME="genoplante">
G&#233;noplante-funded programmes
</A>
</I>
</B>
</p>
<p>
<IMG SRC="/images/redball.gif"> 
<A HREF="http://genoplante-info.infobiogen.fr/FLAGdb/">
FLAGdb++
</A>, an 
<I>Arabidopsis
</I> genomics database including an inventory of flanking 
sequence tags from the Versailles
<I>Arabidopsis
</I> T-DNA collection.
<br>
<DD>Coordinators: 
<A HREF="mailto:Lepiniec@versailles.inra.fr">
Lo&#239;c Lepiniec
</A>, LBS, INRA-Versailles
<br> 
<A HREF="mailto:Pelletie@versailles.inra.fr">
Georges Pelletier
</A>, INRA-Versailles
<br>This G&#233;noplante programme is an inventory of the 
<I>Arabidopsis
</I> genomic sequences flanking T-DNA insertions (FSTs) 
obtained through the vacuum infiltration technique.  The 
data are collected in 
<A HREF="http://genoplante-info.infobiogen.fr/FLAGdb/">
FLAGdb++
</A>, a database set up at the URGV by the team of 
<A HREF="mailto:lecharny@evry.inra.fr">
Alain Lecharny
</A>.  They establish a direct link between the FST, its 
genomic location and a specific T-DNA line.  The 
programme should lead to 30,000 FSTs.  Sequence data and 
lines are accessible after a 6 month confidentiality delay as 
sequences are being produced.  FST sequences have been 
accessible through G&#233;noplante-info since August 2001.
<br>Access to T-DNA lines: Lines will be accessible 
through INRA-Agriobtentions, as indicated on the web site of 
<A HREF="http://genoplante-info.infobiogen.fr/">
G&#233;noplante-info
</A>.  A contribution to the cost of maintenance of the 
collection and distribution of the lines will be requested.  
Unlimited access for academic research.  An agreement that 
G&#233;noplante partners can obtain non-exclusive licences if 
a patent is filed by the requesting laboratory/company will 
be required.  Restrictions for industrial exploitation of 
cell cycle genes.
</DD>

</p>


<p>
<IMG SRC="/images/redball.gif"> 
<A HREF="http://www.CATMA.org/">
CATMA
</A>, A Complete 
<I>Arabidopsis thaliana
</I> MicroArray
<br>
<DD>Coordinator: 
<A HREF="mailto:pihil@gengenp.rug.ac.be">
Pierre Hilson
</A>
<br>A programme involving several EEC countries and funded by 
G&#233;noplante in France.  Programme started in Spring 2001.  
A set of Gene-Specific Tags (GSTs) (genomic fragments as 
specific as possible to each of the annotated genes of 
<I>Arabidopsis
</I>) is being developed.  The programme includes three 
steps:
<br>(1) Reannotation of the entire 
<I>Arabidopsis
</I> genome with EUGENE, a tool developed for the annotation 
of 
<I>Arabidopsis
</I> sequences.
<br>(2) Identification of a complete set of GSTs and design of specific primers for all of them.
<br>(3) Microarrays will be distributed in each participant 
country, depending on the level of funding available.
<br>CATMA microarray data produced in France will be made 
freely available after a 6 month confidentiality delay, 
through G&#233;noplante-info.
</DD>
</p>


<p>
<IMG SRC="/images/redball.gif"> 
<A HREF="http://www.evry.inra.fr/public/projects/Atome/index.html">
ATOME: An 
<I>Arabidopsis
</I> ORFeome
</A>
<br>
<DD>Coordinator: 
<A HREF="mailto:lurin@evry.inra.fr">
Claire Lurin
</A>
<br>The goal of this project is to construct a collection of 
full-length 
<I>Arabidopsis
</I> ORFs in a Gateway entry vector to facilitate large-scale 
functional genomics experiments.  5,000 ORFs from the 
G&#233;noscope/Invitrogen/INRA collection described above 
will be reamplified and cloned by recombination in such a way 
as to permit subsequent transfer to destination vectors 
permitting expression of N-terminal or C-terminal fusion 
proteins in bacteria, yeast, plants, etc.  Clones will be 
distributed within France by the 
<A HREF=" http://www.evry.inra.fr/">
URGV
</A> and elsewhere by 
<A HREF="http://www.invitrogen.com/">
Invitrogen
</A>.
</DD>
</p>


<p>
<IMG SRC="/images/redball.gif"> 
Analysis of the proteome of 
<I>Arabidopsis
</I>
<br> 
<DD>Coordinators: 
<A HREF="mailto:jjoyard@cea.fr">
Jacques Joyard
</A>
<br>
<A HREF="mailto:rossignol@ensam.inra.fr">
Michel Rossignol
</A>
<br>This project involves 7 teams studying specific 
aspects of the 
<I>Arabidopsis
</I> proteome.  The goal of this program is to perform the 
inventory of proteins expressed in 
<I>Arabidopsis
</I> tissues, especially  and to develop functional 
proteomics.
</p>
<p> 
<B>Membrane proteomics:
</B>
<br>New techniques of membrane protein purification, 
separation and identification are being developed in the 
frame of this programme, and the corresponding data 
published.  The different objectives are:
<UL TYPE=DISC>     
<LI>Development of nanoLC-MS/MS techniques and bioinformatics 
for membrane proteome analysis (J&#233;r(tm)me Garin, 
Laboratoire de Chimie des Prot&#233;ines, CEA-Grenoble)
<br>
<LI>FPLC-based identification of membrane intrinsic proteins 
(R&#233;my Gibrat, UMR 5004 (CNRS/INRA/ENSA) Montpellier)
<br>
<LI>Directory of hydrophobic proteome from plant membranes 
(plasma membranes, tonoplast, chloroplast envelope membranes, 
chromoplast membranes)(Helene Barbier-Brygoo, ISV, 
Gif-sur-Yvette); Jacques Joyard, UMR 5019 (CEA/CNRS/UJF) 
Grenoble; Marcel Kuntz, UMR 5575, CNRS/Universit&#233; Joseph 
Fourier)
<br>
</UL>
</p>
<p>
<B>Functional proteomics:
</B>
<br>The objective is to mine changes at the protein level in 
response to environmental stresses (selected as a model, 
because such situations, typical for a plant, correspond to 
complex responses) in order to cluster proteins according to 
their expression profile and to map these clusters into 
cellular functions.  In a first step, the project involves 
global analysis of root, leaf and seed proteomes, based on 2D 
gel analysis and MS analysis. (Michel Rossignol, UMR 5004 
(CNRS/INRA/ENSA) Montpellier, Jacques Joyard, UMR 5019 
(CEA/CNRS/UJF) Grenoble)
<br>Access to the data: All the data are collected in AFPdb (
<I>Arabidopsis
</I> Functional Protein database), a database being set up at 
the VIB Ghent by the team of Pierre Rouz&#233;.  This 
database is now operational, and starts collecting the data 
produced by the different teams.  The data will be accessible 
through G&#233;noplante-Info, once AFPdb has been integrated 
in the database.
</DD>
</p>


<p>
<IMG SRC="/images/redball.gif"> 
<A NAME="metabolomics">
Metabolomics
</A>
<DD>Several projects are starting that will analyse levels of 
various metabolites or protein co-factors in 
<I>Arabidopsis
</I> mutants: 
</DD>
<UL type=disc>
<LI>The 
<I>Arabidopsis
</I> metabolome by NMR and mass spectroscopy
<br>R. Bligny, CEA, Grenoble
<br>&nbsp;
<br>
</LI>
<LI>Cytochromes P450
<br>D. Werck, IBMP, Strasbourg
<br>&nbsp;
<br>
</LI>
<LI>Glycoproteins
<br>V. Gomord, U. de Rouen
<br>&nbsp;
<br>
</LI>
<LI>Cell wall polysaccharides
<br>Herman H&#246;fte, INRA, Versailles
</UL>
</p>


<p>
<IMG SRC="/images/redball.gif"> 
Functional analysis of specific 
<I>Arabidopsis
</I> functions: projects funded by G&#233;noplante (The 
results of these programmes will be released as standard 
publications)
<UL type=disc> 

<LI>New genes involved in nitrogen metabolism (
<A HREF="mailto:vedele@versailles.inra.fr">
Fran&#231;oise Vedele
</A>)
<br>&nbsp;
<br>
</LI>
 
<LI>Storage proteins accumulation in the seed (
<A HREF="mailto:giraudat@isv.cnrs-gif.fr">
J&#233;rome Giraudat
</A>)
<br>&nbsp;
<br>
</LI>
 
<LI>Lignification and secondary cell wall formation (
<A HREF="mailto:jouanin@versailles.inra.fr">
Lise Jouanin
</A>)
<br>&nbsp;
<br>
</LI>
 
<LI>Genes involved in proteolytic mechanisms (
<A HREF="mailto:Pascal.Genschik@ibmp-ulp.u-strasbg.fr">
Pascal Genschik
</A>)
<br>&nbsp;
<br>
</LI>
 
<LI>Key genes for hypersensitivity and resistance to 
bacterial pathogens (
<A HREF="mailto:Roby@toulouse.inra.fr">
Dominique Roby and Yves Marco
</A>)
<br>&nbsp;
<br>
</LI>
 
<LI>Genetic analysis of embryogenesis (
<A HREF="mailto:Devic@univ-perp.fr">
Martine Devic
</A>)
<br>&nbsp;
<br>
</LI>
 
<LI>Cellulose biosynthesis (
<A HREF="mailto:hofte@versailles.inra.fr">
Herman H&#246;fte
</A>)
<br>&nbsp;
<br>
</LI>
 
<LI>Membrane transport systems (
<A HREF="mailto:Helene.Brygoo@isv.cnrs-gif.fr">
Helene Barbier-Brygoo
</A>)
<br>&nbsp;
<br>
</LI>
 
<LI>Mutants affected in chloroplast biogenesis (
<A HREF="mailto:Silva.Lerbs-Mache@ujf-grenoble.fr">
Silva Lerbs-Mache
</A>)
<br>&nbsp;
<br>
</LI>
 
<LI>Plant genes induced by root-knot nematodes (
<A HREF="mailto:Abad@antibes.inra.fr">
Pierre Abad
</A>)
<br>&nbsp;
<br>
</LI>
 
<LI>Inducible promoters (
<A HREF="mailto:Jean-Marc.Ferullo@aventis.com">
Jean-Marc Ferullo
</A>)
<br>&nbsp;
<br>
</LI>
 
<LI>Identification and characterization of salt resistant 
mutants (
<A HREF="mailto:Berthom@ensam.inra.fr">
Pierre Berthomieu
</A>)
<br>&nbsp;
<br>
</LI>
 
<LI>Mineral nutrition and response to abiotic stress (
<A HREF="mailto:Casse@ensam.inra.fr">
Francine Casse-Delbart
</A>)
<br>&nbsp;
<br>
</LI>
 
<LI>Compared methodologies for the analysis of genome 
expression during nutritional stress (
<A HREF="mailto:Gojon@ensam.inra.f">
Alain Gojon
</A>)
<br>&nbsp;
<br>
</LI>
 
<LI>Gene transcription regulatory network during seed 
development (
<A HREF="mailto:Zhou@ibp.u-psud.fr">
Dao-Xiu Zhou
</A>)
<br>&nbsp;
<br>
</LI>
 
<LI>Identification of root promoters (
<A HREF="mailto:Lnussaume@cea.fr">
Laurent Nussaume
</A>)
<br>&nbsp;
<br>
</LI>
 
<LI>Influence of gene-toxic stresses on transcriptome (
<A HREF="mailto:Marie.helene.Montane@cea.fr">
Marie-H&#233;l&#232;ne Montan&#233;
</A>)
<br>&nbsp;
<br>
</LI>
 
<LI>Functions involved in DNA repair and recombination (
<A HREF="mailto:marie-pascale.doutriaux@ibp.u-psud.fr">
Marie-Pascale Doutriaux
</A>)
<br>&nbsp;
<br>
</LI>
 
<LI>Genes encoding small ORFs (
<A HREF="mailto:crespi@isv.cnrs-gif.fr">
Martin Crespi
</A>)
<br>&nbsp;
<br>
</LI>
</UL>
</p>


<p>
<B>
<I>
<A NAME="nongenoplante">
Non-G&#233;noplante Programmes
</A>
</I>
</B>
</p>
<p>

<IMG SRC="/images/redball.gif"> 
<A HREF="http://www.evry.inra.fr/public/projects/cdna/cdna.html">
A panel of sequenced 
<I>Arabidopsis thaliana
</I> full-length cDNAs
</A>
<br> 
<DD>Contact: 
<A HREF="mailto:salanou@genoscope.cns.fr">
Marcel Salanoubat
</A>, 
<A HREF="http://www.genoscope.cns.fr/">
Genoscope
</A>, Evry
<br> A collaborative project was initiated between 
<A HREF=" http://www.genoscope.cns.fr/">
G&#233;noscope
</A>, 
<A HREF="http://www.invitrogen.com/">
Invitrogen
</A> and 
<A HREF="http://www.inra.fr/">
INRA
</A> for the construction, sequencing, analysis and 
distribution of full-length cDNAs from 
<I>A. thaliana
</I>.  A total of 50,000 clones from 5 libraries made 
from various RNA pools will be sequenced by the 
Genoscope.  Around 15,000 clones have been sequenced so 
far, giving more than 8,000 non-redundant clones of which 
more than 70% are full-ORF.  Sequences will be deposited 
in Genbank in 2002.  CDNA clones will be supplied world-
wide by Invitrogen, and will be distributed by the URGV to 
French academic institutions.
</DD>
</p>


<p>
<IMG SRC="/images/redball.gif"> 
AraCORE: Analysis of genetic variability between 
<I>Arabidopsis thaliana
</I> ecotypes
<br> 
<DD>
<A HREF="mailto:bouchez@versailles.inra.fr">
David Bouchez
</A>, 
<A HREF="mailto:brunel@versailles.inra.fr">
Domininque Brunel
</A>, and
<A HREF="mailto:pelletie@versailles.inra.fr">
Georges Pelletier
</A>
<br>Several hundred accessions, thousands of recombinant inbred lines, constitution of an 
<I>Arabidopsis
</I> core collection based on SNP genotyping.
</DD>
</p>


<p>
<IMG SRC="/images/redball.gif"> 
<A HREF="http://www.agrikola.org">
AGRIKOLA (
<I>Arabidopsis
</I> Genomic RNAi Knock-out Line Analysis)
</A>
<br>
<DD>
<A HREF="mailto:small@evry.inra.fr">
Ian Small
</A>, 
<A HREF="http://www.evry.inra.fr/">
URGV
</A>, Evry, France
<br>The URGV is coordinating a European-wide project to 
produce a genome-wide collection of hairpin RNA constructs 
for knock-down gene-silencing of targeted 
<I>Arabidopsis
</I> genes.  The project is in collaboration with Peter 
Waterhouse's group at the 
<A HREF="http://www.pi.csiro.au/">
CSIRO
</A> in Australia.  The gene-specific sequences used to 
target the hpRNA come from the CATMA GSTs used for microarray 
analysis (see below).  Funding for AGRIKOLA has recently been obtained 
from The European Union's 5th Framework Programme.
</DD>
</p>

<br>

<p>
<H4>
<A NAME="bioinformatics">
Bioinformatics projects
</A>
</H4>
<p>
<IMG SRC="/images/redball.gif"> 
PlantGene, GeneFarm
<br>
<DD>Coordinator: 
<A HREF="mailto:aubourg@evry.inra.fr">
S&#233;bastien Aubourg
</A>
<br> PlantGene contains annotations of experimentally 
verified 
<I>Arabidopsis
</I> genes.  GeneFarm contains annotations of 
<I>Arabidopsis
</I> gene families.  In each case, the annotations are 
provided by a network of experts familiar with the genes in 
question.  The goal is to greatly improve the standard of 
annotations available for the 
<I>Arabidopsis
</I> genome.
</DD>
</p>


<p>
<IMG SRC="/images/redball.gif"> 
LASSAP: Massive sequence comparisons
<br> 
<DD>Coordinator: 
<A HREF="mailto:risler@genopole.cnrs.fr">
Jean-Loup Risler
</A>, Laboratoire G&#233;nome et Informatique, Evry, France
<br> All the (putative) protein sequences from 
<I>Arabidopsis
</I> as well as all the protein sequences from other plants 
available from SwissProt/trEMBL (ca. 48,000 sequences in all) 
are being compared to each other with the program LASSAP 
through the Smith & Waterman algorithm.  Clusters of 
orthologous/paralogous sequences are built based on the 
pairwise Z-scores and, within each cluster, the sequences are 
classified and their domain composition established.  The 
resulting database (PHYTOPROT) will be publicly available 
through 
<A HREF="http://genoplante-info.infobiogen.fr/">
G&#233;noplante-Info
</A>.
</DD>
</p>


<p>
<IMG SRC="/images/redball.gif"> 
<A HREF="http://genoplante-info.infobiogen.fr/">
G&#233;noplante-Info DataBase
</A>
<br> 
<DD>Coordinator: 
<A HREF="mailto:manu@infobiogen.fr">
Emmanuel Barillot
</A>, INFOBIOGEN, Evry, France
<br> The data produced by G&#233;noplante programmes will be 
accessible through a main database set up at INFOBIOGEN, the 
French national facility for bioinformatics.  This 
G&#233;noplante database named G&#233;noplante-Info will 
establish a data environment brought up to collect, organize 
and cross-reference data of the various projects.  This 
information produced by G&#233;noplante relates mainly to the 
following data (referring to all species under study in 
G&#233;noplante: 
<I>Arabidopsis thaliana
</I>, rice, wheat, maize, rapeseed, sunflower and pea):
<br> 
<UL TYPE=DISC>    
<LI>Sequence annotations  
<LI>ESTs and their clustering and automatic annotations 
<LI>FSTs (Flanking Tag Sequence) of the collection of mutants  
<LI>Model genome complete sequences and other genomic 
sequences  
<LI>Expression data (transcriptome)  
<LI>Mapping data (comparative mapping, markers RFLP, QTL)
<LI>Proteome data 
</UL> This database will specifically include the following 
type of 
<I>Arabidopsis
</I> data.
<br> 
<UL TYPE=DISC>    
<LI>
<A HREF=" http://flagdb-genoplante-info.infobiogen.fr/">
FLAGdb
</A>, the FST database  
<LI>GENEFARM, a list of fully annotated 
<I>Arabidopsis
</I> gene families  
<LI>LASSAP, the result of a massive comparison of 
<I>Arabidopsis
</I> genome sequence data with other genomes.  
<LI>AFPdb, the data produced by the proteome project 
</UL> Access to these 
<I>Arabidopsis
</I> G&#233;noplante data will be possible without any 
restrictions after a 6 month confidentiality delay to 
G&#233;noplante partners.  G&#233;noplante-Info is accessible 
at the following web site 
<A HREF="http://genoplante-info.infobiogen.fr/">
http://genoplante-info.infobiogen.fr/
</A>
<br> G&#233;noplante-Info will be connected to other 
databases in Europe through the PLANET/EEC-funded programme.
</DD>

</DL>
</dl>
</table>
<p>
<IMG SRC="/images/redball.gif"> 
<A HREF="/portals/masc/countries/France.ppt">
<I>Arabidopsis
</I> functional genomics research in France
</A> - Download the PowerPoint presentation given by Dr. Ian
Small at the XIII International Conference on 
<I>Arabidopsis
</I> Research in Seville, Spain in July, 2002.
</p>
<p>
</div>
<center>Last modified on July 18, 2009</center>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


