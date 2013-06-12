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
<jsp:param name="sidebarName" value="Asia/Pacific" />
</jsp:include>
<div id="rightcolumn">

<!-- Content goes here //--> 

<span class="mainheader"><I>Arabidopsis</I> Functional Genomics Efforts in Japan</span>
<p>MASC representative: 
<A HREF="mailto:sinozaki@rtc.riken.go.jp">
Kazuo Shinozaki
</A> of the 
<A HREF="http://www.gsc.riken.go.jp/">
RIKEN Genomic Sciences Center
</A>
</p>
<hr>
<p><img src="/images/redball.gif"> <strong>New!</strong><a href="http://www.nsf.gov/pubs/2011/nsf11045/nsf11045.jsp"> Please see the 'Dear Colleague Letter for New Zeland and Japan' </a> from the U.S. National Science Foundation regarding
mechanisms in place at the NSF to respond to immediate research and education needs that may arise from unexpected evevnts.<p>

<p><img src="/images/redball.gif"> <strong>New!</strong>
<li><a href="http://nipponsciencesupport.net/">Support for Japanese scientists </a> affected by the March 11, 2011 earthquake and tsunami in Japan.<p>
<li>A <a href="http://nipponsciencesupport.net/home-us.html">U.S.-based effort</a> has been established recently.</li><p>

<p> Read the <a href="/portals/masc/countries/Japan_2009.pdf"><u>2009 Japan MASC report (pdf).</u></a>
<p>
Read the <a href="/portals/masc/countries/Japan_2008.pdf"><u>2008 Japan MASC report (pdf).</u></a>    <br>
Read the <a href="/portals/masc/countries/Japan_2007.pdf"><u>2007 Japan MASC report (pdf).</u></a>
<br>
Read the <a href="/portals/masc/countries/Japan_2006.pdf"><u>2006 Japan MASC report (pdf).</u></p>

<hr>
<p>


<dt> The following are Research activities in 
<I>Arabidopsis
</I> functional
genomics, metabolomics, transcriptomics and proteomics in Japan.
</dt>

<UL type=disc>
<LI>Metabolites profiling in 
<I>Arabidopsis
</I>.
<br>Contact: 
<A HREF="mailto:ksaito@p.chiba-u.ac.jp">
Prof. Kazuki Saito
</A>, 
<A HREF="http://www.chiba-u.ac.jp/">
Chiba University.
</A>
<br>&nbsp;

<LI>Comparative genomics using 
<I>Arabidopsis
</I> and 
<I>Brassica
</I>
<br>Contact: 
<A HREF="mailto:shibata@kazusa.or.jp">
Dr. Daisuke Shibata
</A>, 
<A HREF="http://www.kazusa.or.jp/en/plant/">
Kazusa DNA Research Institute
</A>
<br>&nbsp;

<LI>Structural proteomics of plant regulatory proteins with novel structures.
<br>Contact Dr. Shigeyuki Yokoyama and 
<A HREF="mailto:sinozaki@rtc.riken.go.jp">
Kazuo Shinozaki
</A> at 
<A HREF="http://pfgweb.gsc.riken.go.jp/">
RIKEN Genomic Sciences Center
</A>.
<br>&nbsp;

<LI>Reverse proteomics for functional analysis of in vitro expressed
proteins. 
<br>Contact 
<A HREF="mailto:yendo@en3.ehime-u.ac.jp">
Prof. Yaeta Endo
</A> (
<A HREF="http://www.ehime-u.ac.jp/">
Ehime University
</A>) and 
<A HREF="mailto:sinozaki@rtc.riken.go.jp">
Kazuo Shinozaki
</A> (
<A HREF="http://pfgweb.gsc.riken.go.jp/">
RIKEN GSC
</A>)
<br>&nbsp;

<LI>Transcriptome analysis of genes expression in response to both abiotic
and biotic stress. Full-length cDNA microarray analysis.
<br>Contact 
<A HREF="mailto:mseki@rtc.riken.go.jp">
Motoaki Seki
</A> and 
<A HREF="mailto:sinozaki@rtc.riken.go.jp">
Kazuo Shinozaki
</A> at 
<A HREF="http://pfgweb.gsc.riken.go.jp/">
RIKEN GSC
</A>.
<br>&nbsp;

<LI>Genome-wide analysis of two-component system in 
<I>Arabidopsis
</I> and rice.
<br>Contact: 
<A HREF="mailto:tmizuno@agr.nagoya-u.ac.jp">
Prof. Takeshi Mizuno
</A>, 
<A HREF="http://www.nagoya-u.ac.jp/">
Nagoya University
</A>.
<br>&nbsp;

<LI>Genome-wide analysis of transcription factor function using repressor
domain.
<br>Contact: 
<A HREF="mailto:m-takagi@aist.go.jp">
Dr. Masaru Ohme-Takagi
</A>, 
<A HREF="http://www.aist.go.jp/">
AIST
</A>, Tsukuba
<br>&nbsp;

<LI>Collection and phenotype analysis of Ds transposon-
tagged lines with the goal of making a library of 
phenotypes, and collection of full-length cDNAs at 
<A HREF="http://pfgweb.gsc.riken.go.jp/">
RIKEN Genomic Sciences Center
</A>
<br>Contacts: 
<A HREF="mailto:sinozaki@rtc.riken.go.jp">
Kazuo Shinozaki
</A> and 
<A HREF="mailto:mseki@rtc.riken.go.jp">
Motoaki Seki
</A>
<br>&nbsp;

<LI>Collaborating with the RIKEN group on the phenotypic 
analysis project is the 
<A HREF="http://www.riken.go.jp/engn/r-world/research/lab/plant/geno/">
group of Kiyotaka Okada
</A> at the 
<A HREF="http://www.psc.riken.go.jp/indexE.html">
RIKEN Plant Science Center
</A>
<br>Contact 
<A HREF="mailto:Kiyo@ok-lab.bot.Kyoto-u.ac.jp">
Kiyotaka Okada
</A>
<br>&nbsp;

<LI>
<A HREF="http://www.riken.go.jp/engn/r-world/research/lab/brc/gene/plant/">
The Functional Genomics Research Group
</A> of 
<A HREF="http://www.gsc.riken.go.jp/index.html">
RIKEN Genomic Sciences Center
</A>, in collaboration with the 
<A HREF="http://sequence-www.stanford.edu/ara/SPP.html">
<I>Arabidopsis
</I> SPP Group
</A> of the United States, have made about 8,000 
sequenced, full-length cDNAs publicly available through 
the 
<A HREF="http://www.brc.riken.go.jp/Eng/index.html">
RIKEN Bioresource Center
</A>
<br>Contact 
<A HREF="mailto:kobayasi@rtc.riken.go.jp">
Masatomo Kobayashi
</A>
<br>&nbsp;

<LI>Collection of activation tagging lines at 
<A HREF="http://pfgweb.gsc.riken.go.jp/">
RIKEN Genome Science Center
</A>
<br>Contact 
<A HREF="mailto:minami@postman.riken.go.jp">
Minami Matsui
</A> and 
<A HREF="mailto:miki@postman.riken.go.jp">
Miki Nakazawa
</A>
<br>&nbsp;

<LI>Genome-wide analysis of the cell wall genes
<br>Contact 
<A HREF="mailto:nishitan@mail.cc.tohoku.ac.jp">
Kazuhiko Nishitani
</A>
<br>&nbsp;

<LI>
 Analysis of the Homeo-box genes of 
<I>Arabidopsis
</I> and rice
<br>Contact 
<A HREF="mailto:makoto@nuagr1.agr.nagoya-u.ac.jp">
Makoto Matsuoka
</A>
<br>&nbsp;

<LI>Collection of T-DNA tagged lines created by the 
<A HREF="http://www.kazusa.or.jp/en/plant/">
Kazusa group
</A>, 
<A HREF="http://www.kazusa.or.jp/en/plant/arabi/EST/">
<I>Arabidopsis
</I>
</A> and 
<A HREF="http://www.kazusa.or.jp/en/plant/lotus/EST/">
Lotus
</A> ESTs
<br>Contact 
<A HREF="mailto:tabata@kazusa.or.jp">
Satoshi Tabata
</A>
<br>&nbsp;

<LI>Distribution and Data accumulation of 
<I>Arabidopsis
</I> cDNA arrays 
<br>Contact JCAA, 
<A HREF="mailto:Japan Arabidopsis Array Consortium@isize.egroups.co.jp">
Japan Arabidopsis Array Consortium@isize.egroups.co.jp
</A>
<br>&nbsp;
</UL>

<dt>Funding opportunities:</dt> 
<UL type=disc>
<LI>
<A HREF="http://www.jst.go.jp/EN/Intro/crest.html">
Core Research for Evolutional Science and Technology (
<b>CREST
</b>)
</A> of 
<A HREF="http://www.tokyo.jst.go.jp/EN/">
Japan Science & Technology Council (
<b>JST
</b>)
</A>
<LI>
<A HREF="http://www.tokyo.brain.go.jp/index_E.html">
Program of Promotion of Basic Research Activities for Innovative Biosciences of BRAIN
</A>

</UL> 
</p>
<p>
<dt> Biological Resources:</dt>
 <UL type=disc>
<LI>
<A HREF="http://www.brc.riken.go.jp/Eng/index.html">
RIKEN Bioresource Center
</A> collects 
<I>Arabidopsis
</I> resources produced in Japan, such as: full-length 
cDNAs; Ds tagging lines and Activation tagging lines 
produced at the 
<A HREF="http://www.gsc.riken.go.jp/">
RIKEN Genomic Sciences Center
</A>; various ecotypes and mutants from 
<A HREF="http://www.shigen.nig.ac.jp/arabidopsis/">
Sendai 
<I>Arabidopsis
</I> Seed Stock Center
</A> (PI: Prof 
<A HREF="mailto:n-goto@staff.miyakyo-u.ac.jp">
Nobuharu Goto
</A>); and T-DNA tagging lines from 
<A HREF="http://www.kazusa.or.jp/en/plant/">
Kazusa DNA Research Institute
</A>.  The PI for the RIKEN Bioresource Center is 
<A HREF="mailto:kobayasi@rtc.riken.go.jp">
Masatamo Kobayashi
</A>.
</UL>
 <p>
<dt> New and continuing programs for <I>Arabidopsis</I> functional Genomics in Japan:</dt>
 <UL type=disc>
<LI>
<A HREF="http://pfgweb.gsc.riken.go.jp/">
RIKEN Genomic Sciences Center, Plant Functional Genomics Research Group
</A>
<LI>
<A HREF="http://www.psc.riken.go.jp/indexE.html">
RIKEN Plant Science Center
</A>
<LI>
<A HREF="http://www.kazusa.or.jp/en/plant/">
Kazusa DNA Research Institute
</A>
<LI>
<A HREF="http://www.jst.go.jp/EN/Intro/crest.html">
CREST
</A> of 
<A HREF="http://www.tokyo.jst.go.jp/EN/">
Japan Science & Technology Council
</A>
 </UL>
<p>
<dt> Bioinformatics:</dt>
 <UL type=disc>
<LI>
<A HREF="http://pfgweb.gsc.riken.go.jp/">
RIKEN Genomic Sciences Center, Plant Functional Genomics Research Group
</A> 
<LI>
<A HREF="http://www.kazusa.or.jp/en/plant/">
Kazusa DNA Research Institute
</A>
 </UL>

</DL>  
<center>Last modified on July 21, 2009
</center> 


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
