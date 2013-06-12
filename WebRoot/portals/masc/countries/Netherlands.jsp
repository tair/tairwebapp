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
<span class="mainheader"> 
<I>Arabidopsis
</I> Functional Genomics Research in the Netherlands
</span>

<p>MASC representatives: 
<a href="mailto:b.scheres@uu.nl">Ben Scheres</a>, 
<a href="http://www.uu.nl/uupublish/homeuu/homeenglish/1757main.html">
University of Utrecht</a>, and 
<a href="mailto:Sacco.deVries@wur.nl">Sacco de Vries</a>, <a href="http://biochemistry.wur.nl/Biochem/research/sigtrans.htm"> Wageningen University.</a> 
<p><IMG SRC="/images/redball.gif"> New! Read the <a href="/portals/masc/countries/Netherlands_2009.pdf"><u>2009 Netherlands MASC report (pdf).</u></a>
<p>Read the <a href="/portals/masc/countries/Netherlands_2008.pdf"><u>2008 Netherlands MASC report (pdf).</u></a>
<br>Read the <a href="/portals/masc/countries/Netherlands_2007.pdf"><u>2007 Netherlands MASC report (pdf).</u></a>
<br>Read the <a href="/portals/masc/countries/Netherlands_2006.pdf"><u>2006 Netherlands MASC report (pdf).</u></p></a>
<hr>

<p>Many previously established research groups 
continued active research using 
<I>Arabidopsis
</I> studying a wide variety of topics from signal 
transduction to ecological questions.

These groups are located at the universities of 
<a href="http://www.uva.nl/">
Amsterdam
</a>, 
<a href="http://www.leidenuniv.nl/">
Leiden
</a>, 
<a href="http://kunweb.hosting.kun.nl/">
Nijmegen
</a>, 
<a href="http://www.rug.nl/">
Groningen
</a>, 
<a href="http://www.uu.nl/">
Utrecht
</a> and 
<a href="http://www.wau.nl/">
Wageningen
</a>. An annual meeting of the so-called ARANED group is held 
every year and is attended by almost 100 participants.
</p>

<p>
Important for 
<I>Arabidopsis
</I> research was extra funding provided by two genomics 
initiatives: one by 
<a href="http://www.nwo.nl/">
NWO
</a>, the Dutch NSF and by a novel initiative of the Dutch 
government to promote genomics. In the latter program a large 
grant was awarded to the 
<a href="http://www.biosystemsgenomics.nl/">
CBSG (Centre for Biosystems Genomics)
</a> headed by Prof WJ Stiekema (
<a href="http://www.biosystemsgenomics.nl">
www.biosystemsgenomics.nl
</a>). This program aims at genomics research in tomato and 
potato but also has a strong 
<I>Arabidopsis
</I> part, which provides additional funding for eight 
<I>Arabidopsis groups
</I>. CBSG can be considered as the Dutch counterpart of 
other European programs such as Garnet, GABI and Genoplante.
</p>

<p>In addition, NWO awarded a grant to the Wageningen 
Phytoinformatics group (also headed by Stiekema) dealing with 
bioinformatics issues related to plants. This group is also 
involved in the 
<a href="http://mips.gsf.de/proj/planet/">
EU PLANET
</a> project that aims to develop and deliver a high level 
plant genome database for the systematic exploration of 
Arabidopsis and other plants.
</p>

<p>Resources have been developed in ongoing research. The 
generation of new recombinant inbred line populations as part 
of the EU project NATURAL (
<a href="http://www.natural-eu.org">
www.natural-eu.org
</a>) by Koornneef and co-workers and the generation of a 
large activation tag population using the En transposon 
within the EU EXOTIC project by Pereira (Wageningen) deserves 
mentioning. Dutch researchers (Angenent, Smeekens) also 
participate in the EU REGIA project looking at areas such as 
functional interdependences among transcriptional factors.
</p>

<p>At 
<a href="http://www.uu.nl/">
Utrecht University
</a>, a facility for 
<I>Arabidopsis
</I> microarray analysis was set up (Weisbeek) which is 
linked to the EU 
<a href="http://www.CATMA.org">
CATMA
</a> and CAGE projects. One of the groups that will use this 
facility is the NWO funded project QTL-Express (coordinator 
Koornneef), which combines the analysis of natural variation 
with gene expression analysis and which includes five groups 
from 
<a href="http://www.wau.nl/">
Wageningen
</a> and 
<a href="http://www.uu.nl/">
Utrecht University</a>.
 The same NWO genomics program also supports work on the 
role of chromatin (Bisseling coordinator).
</p>

<p>Other EU projects having Dutch participants and that use 
<I>Arabidopsis
</I> as a model are the EU APOTOOL project coordinated by de 
Vries (Wageningen) aimed at a deeper understanding of 
apomixis using Arabidopsis and to apply this knowledge as a 
novel tool in plant breeding. Hooykaas (Leiden) is involved 
in the EU PLANTREC project aiming at homologous recombination 
in plants.
</P>
<p>Information about EU projects can be found at 
<a href="http://www.cordis.lu">
http://www.cordis.lu
</a>.
<center>Last modified on July 18, 2009</center>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

