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
<I>Arabidopsis</I> Functional Genomics Research in Belgium
</span>

<p>MASC representative: 
<A HREF="mailto:pierre.hilson@psb.ugent.be">Pierre Hilson</A>, Department of Plant Systems Biology, VIB, Ghent University 
<hr>
<p>
<p><IMG SRC="/images/redball.gif"> New! Read the <a href="/portals/masc/countries/Belgium_2009.pdf"><u>2009 Belgium MASC report (pdf).</u></a>
<p>Read the <a href="/portals/masc/countries/Belgium_2008.pdf"><u>2008 Belgium MASC report (pdf).</u></a>
<br>Read the <a href="/portals/masc/countries/Belgium_2007.pdf"><u>2007 Belgium MASC report (pdf).</u></a>
<br>Read the <a href="/portals/masc/countries/Belgium_2006.pdf"><u>2006 Belgium MASC report (pdf).</u></p></a>    
    
<p>
<dl>
Belgian <I>Arabidopsis</I> projects are funded via university-, regional- or 
federal-level grants, but not within calls specifically targeting this model 
plant species or plants. In addition, the Flanders Interuniversity Institute 
for Biotechnology provides significant support (about 5 million Euro per year)
to the Department of Plant Systems Biology (PSB) in which the Functional Genomics
Division (P. Hilson) mainly carries out <I>Arabidopsis</I> research. The Flanders government also participates to the European ERA-Plant Genomics
initiative and has earmarked funding specifically supporting research in that
framework.
Furthermore, PSB continuously develops and disseminates an exhaustive
collection of destination vectors, designed for the functional analysis of
genes in plant cells and compatible with the recombinational cloning <A  HREF="http://www.psb.ugent.be/gateway/"> Gateway</A>
technology (www.psb.ugent.be/gateway). Finally, PSB participates to efforts to 
confederate database systems and aims at providing information about clone 
resources and phenotypes via integrated webservices.
<p/>


<p>
<dt>Current Research Projects</dt>
<dd>
<ul>
<li>A Belgian national research project (IAP) focuses on the study of the molecular 
mechanisms regulating the development of plant roots and the interaction of roots with 
their environment.
<li>Other current Arabidopsis research topics in Belgium include the cell cycle (D. 
Inz&#239;&#191;&#189;, L. De Veylder), root and leaf growth and development (T. Beeckman, G. Beemster, M. 
Van Lijsebettens), abiotic stress (F. Van Breusegem), genome annotation and evolution 
(Y. Van de Peer, P. Rouz&#239;&#191;&#189;), computational biology (M. Kuiper), proteomics (G. De 
Jaegher), transcriptional networks and heterosis (M. Vuylsteke), lignin biosynthesis (W. 
Boerjan), ethylene signaling (D. Van Der Straeten), hormone biology (Harry Van 
Onckelen), membrane proteins (M. Boutry), salt stress and tolerance to heavy metal (N. 
Verbruggen), and plant pathogen interaction (B. Cammue).
</ul></dd>
<dt>Major funding sources for Arabidopsis functional genomics</dt>
<dd>
<ul>
<li><a href="http://www.vib.be">Flanders Interuniversity Institute for Biotechnology</a>
<li><a href="http://www.cordis.lu">European Union Framework Programmes</a>
<li><a href="http://www.belspo.be">Belgian Federal Science Policy Office</a>
<li><a href="http://www.iwt.be">Institute for the Promotion of Innovation by Science and 
Technology in Flanders(IWT)</a>
<li><a href="http://www.erapg.org">European ERA-Plant Genomics Initiative</a>
</ul>
</dd>
<P>

<dt>Arabidopsis genomics tools and resources</dt>
<dd>
<ul>
<li><A HREF="http://www.psb.ugent.be/gateway/"> Gateway-compatible destination vectors 
</A>(www.psb.ugent.be/gateway)</a>
<li> Large generic ongoing programs include:
<OL>
<li><A HREF="http://www.catma.org/"> CATMA database</A> (www.catma.org)</A> hosted at 
PSB, maintains a repertoire of more than 30,000 gene-specific sequence tags for 
transcription profiling and RNAi (available from the Nottingham Stock Centre)
<li><A HREF="http://www.agrikola.org">AGRIKOLA database</A> (www.agrikola.org) hosted at 
PSB for creating and exploiting genome-scale resources for targeted hairpin RNA gene 
silencing (available from NASC).  In collaboration with the Belgian Coordinated 
Collections of Microorganisms (BCCM/LMBP), PSB is also setting up a service for the 
sequence validation and dissemination of AGRIKOLA resources 
(http://www.belspo.be/belspo/fedra/proj.asp?l=en &COD=C3/020)
<li><A HREF="http://www.psb.ugent.be/SAP">SAP</A> (www.psb.ugent.be/SAP) for creating and exploiting a 
genome-scale promoter amplicon collection for the analysis of transcriptional networks.
</ul>
</ol>
</dd>


</dl>

<center>Last modified on July 18, 2009</center>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


