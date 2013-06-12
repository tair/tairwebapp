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

<span class="mainheader">2003 Report of the cDNAs and Clone-Based Functional Proteomics (ORFeomics) subcommittee
</a>
</span>

<p>The following groups are focusing on the large-scale analysis of 
<I>Arabidopsis
</I> cDNAs and/or their functional characterization.
<UL type="disc">
<LI>
<A HREF="http://www.gsc.riken.go.jp/">
RIKEN Genomic Sciences Center
</A> (Motoaki Seki, Kazuo Shinozaki)
<br>Isolation and characterization of full-length cDNA sequences.  Full-length cDNA sequencing.  RIKEN clones are named RAFL clones or R clones.  Most of the U clones of 
<A HREF="http://signal.salk.edu/SSP/index.html">
SSP
</A> are originally recloned RAFL cDNA inserts placed into pUNI vector.  RAFL clones are now available from 
<A HREF="http://www.riken.go.jp/engn/r-world/research/lab/brc/">
RIKEN Bioresource Center (BRC)
</A> for the entire community.  (Seki M et al. (2002).  Functional annotation of a full-length Arabidopsis cDNA collection.  
<A HREF="http://www.sciencemag.org/cgi/content/full/296/5565/141">
Science 296:141-5
</A>)
<br>
<A HREF="http://pfgweb.gsc.riken.go.jp/projects/raflcdna.html">
http://pfgweb.gsc.riken.go.jp/projects/raflcdna.html
</A>
<br>
<A HREF="http://rarge.gsc.riken.go.jp/">
http://rarge.gsc.riken.go.jp/
</A>

<br>&nbsp;
<br>
<LI>
<A HREF="http://signal.salk.edu/SSP/">
SSP consortium
</A> (Joe Ecker, Ron Davis, Sakis Theologis)
<br>
Full-length cDNA clone sequencing, ORF cloning, transcript unit mapping with genome tiling arrays.  As a result of the work of this consortium, thousands of cDNA clones have been deposited at 
<A HREF="http://abrc.osu.edu/">
ABRC
</A> and are immediate available to the entire community.
<br>
<A HREF="http://signal.salk.edu/SSP/">
http://signal.salk.edu/SSP/
</A>

<br>&nbsp;
<br>
<LI>
<A HREF="http://www.ceres-inc.com/">
CERES
</A> and 
<A HREF="http://www.tigr.org/">
TIGR
</A>
<br>Isolation and characterization of full-length cDNA sequences.  (Haas BJ et al (2002).  Full-length messenger RNA sequences greatly improve genome annotation.  
<A HREF="http://genomebiology.com/2002/3/6/research/0029">
Genome Biology 3: research0029.1-0029.12
</A>)

<br>&nbsp;
<br>
<LI>
<A HREF="http://www.genoscope.cns.fr/">
G&#239;&#191;&#189;noscope
</A>, 
<A HREF="http://www.evry.inra.fr/public/index.html">
Unit&#239;&#191;&#189; de Recherche en G&#239;&#191;&#189;nomique V&#239;&#191;&#189;g&#239;&#191;&#189;tale (URGV)
</A> and 
<A HREF="http://www.invitrogen.com">
Invitrogen
</A> (Marcel Salanoubat)
<br>
A novel collection of full-length cDNA clones has been characterized and will be released shortly.  This collection matches at least partially 11,500 genes.  It provides information about roughly an additional 2,000 genes covered by new full-length cDNA sequences, 60% confirming pre-existing gene models and 40% correcting them.  In addition, 165 genomic regions not previously annotated were detected with this novel cDNA collection.

<br>&nbsp;
<br>
<LI>
<A HREF=" http://www.evry.inra.fr/public/projects/Atome/index.html ">
Atome URGV
</A> (Claire Lurin, Ian Small)
<br>
ORF cloning based on the G&#239;&#191;&#189;noscope collection
<br>
<A HREF="http://www.evry.inra.fr/public/projects/Atome/index.html ">
http://www.evry.inra.fr/public/projects/Atome/index.html
</A>

<br>&nbsp;
<br>
<LI>
<A HREF="http://www.orfeome.org/orfweb/">
AtORFEUS
</A> (coordinator: Pierre Hilson)
<br>
ORF cloning coordinated between multiple European laboratories
<br>
<A HREF="http://www.orfeome.org/orfweb/">
http://www.orfeome.org/orfweb/
</A>

<br>&nbsp;
<br>
<LI>
<A HREF="http://www.uwstructuralgenomics.org/">
CESG
</A> (directors: John Markley, George Phillips)
<br>
Large-scale, genome-wide study of protein structure, especially those proteins with unknown function (X-ray crystallography and NMR spectroscopy).
<br>
<A HREF="http://www.uwstructuralgenomics.org/">
http://www.uwstructuralgenomics.org
</A>

<br>&nbsp;
<br>
<LI>REGIA (coordinator: Javier Paz-Ares)
Transcription factor ORF collection, primarily used for yeast two-hybrid protein-protein interaction mapping (Paz-Ares et al (2002).  REGIA, an EU project on functional genomics of transcription factors from 
<I>Arabidopsis thaliana
</I>.  
<A HREF="http://www3.interscience.wiley.com/cgi-bin/fulltext/91014005/HTMLSTART ">
Comparative and Functional Genomics 3: 102-108
</A>)
</UL>

<p>As of Spring 2003, the community had full-length cDNA sequence information for approximately 15,000 unique 
<I>Arabidopsis
</I> genes.  Due to the effort of 
<A HREF="http://www.gsc.riken.go.jp/">
RIKEN GSC
</A>, over 13,000 RAFL cDNAs are now available from the 
<A HREF="http://www.riken.go.jp/engn/r-world/research/lab/brc/">
RIKEN Bioresource Center
</A>.  Via the effort of the 
<A HREF="http://signal.salk.edu/SSP/">
SSP consortium
</A>, over 10,000 ORFs will soon be available thru the 
<A HREF="http://abrc.osu.edu/">
ABRC
</A>, in vectors compatible with recombinational cloning, the majority of them in pUNI derivates, others in Gateway(tm)-compatible plasmids.  All SSP ORFs are in the closed configuration (with stop codon).  Additional consortia have joined in similar efforts in the last year.  For example, European laboratories, lead by the 
<A HREF="http://www.evry.inra.fr/public/index.html">
URGV
</A> group and coordinating their efforts in the framework of 
<A HREF="http://www.orfeome.org/orfweb/">
AtORFEUS
</A>, are building an ORF collection in the open configuration (no stop) in a Gateway(tm) entry vector.  Other projects, such as REGIA and 
<A HREF="http://www.uwstructuralgenomics.org/">
CESG
</A>, have chosen alternative formats dictated by the specific application in which the ORFs are generated and utilized in the project.  Coordination between these major consortia remains a major goal for the future efforts of the MASC.


</p>
<p>
<p>
<center>Last modified on August 15, 2006 </center>
</p>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>




