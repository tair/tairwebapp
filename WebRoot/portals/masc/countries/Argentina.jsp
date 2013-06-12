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
<jsp:param name="sidebarName" value="MASC By Country" />
</jsp:include>
<div id="rightcolumn">
		

		
<!-- Content goes here //--> 
<span class="mainheader">
<I>Arabidopsis
</I> Functional Genomics Efforts in Argentina
</span>
<dl>
<p>Compiled by 
<A HREF="mailto:casal@ifeva.edu.ar">
Jorge J. Casal</A>, 
<A HREF="http://www.ifeva.edu.ar/">
IFEVA
</A>, Faculty of Agronomy, University of Buenos Aires. 

<hr>
<p>
<p><IMG SRC="/images/redball.gif"> New! Read the <a href="/portals/masc/countries/Argentina_2009.pdf"><u>2009 Argentina MASC report (pdf).</u></a>    
<p>Read the <a href="/portals/masc/countries/Argentina_2008.pdf"><u>2008 Argentina MASC report (pdf).</u></a>
<br>Read the <a href="/portals/masc/countries/Argentina_2006.pdf"><u>2006 Argentina MASC report (pdf).</u></a>

<p>The following groups are using functional genomics tools 
to investigate different areas of plant biology:<br>
<DL>
<DT>
<IMG SRC="/images/redball.gif"> 
<B>Analysis of transcriptome in plant-pathogen interactions: 
plant genes required for susceptibility to fungal infection
</B>  
<DD>Malena Alvarez, 
<A HREF="mailto:malena@dqb.fcq.unc.edu.ar">
malena@dqb.fcq.unc.edu.ar
</A>
<br>CIQUIBIC-CONICET
<br>Facultad Ciencias Quimicas, Universidad Nacional de 
Cordoba
<br>Province of Cordoba
<br>URL: 
<A HREF="http://www.fcq.unc.edu.ar/ciquibic">
http://www.fcq.unc.edu.ar/ciquibic
</A>
</DD>
</DT>
</p>

<DT>
<IMG SRC="/images/redball.gif"> 
<B>The genetic network involved in plant responses to the 
light environment, analysis of transcriptome in phytochrome 
and cryptochrome mutant
</B>
<DD>Jorge J. Casal, 
<A HREF="mailto:casal@ifeva.edu.ar">
casal@ifeva.edu.ar
</A>
<br>
<A HREF="http://www.ifeva.edu.ar/">
IFEVA
</A>, Facultad de Agronomia, Universidad de Buenos Aires.
<br>Buenos Aires
<br>URL: 
<A HREF="http://www.ifeva.edu.ar/staff/perpages/casal.htm">
http://www.ifeva.edu.ar/staff/perpages/casal.htm
</A>
</DD>
</DT>
</p>

<DT>
<IMG SRC="/images/redball.gif"> 
<B>Functional analysis of genes involved in the biogenesis of the cytochrome c-dependent respiratory chain
</B>
<DD>Daniel H. Gonzalez, 
<A HREF="mailto:dhgonza@fbcb.unl.edu.ar">
dhgonza@fbcb.unl.edu.ar
</A>
<br>Facultad  de Bioquimica y Ciencias. Biologicas
<br>Universidad Nacional del Litoral. 
<br>Province of Santa Fe
</DD>
</DT>
</p>

<DT>
<IMG SRC="/images/redball.gif"> 
<B>Role of senescence associated genes in the formation of 
lytic vacuoles during senescence
</B>
<DD>Juan Jose Guiamet, 
<A HREF="mailto:jguiamet@museo.fcnym.unlp.edu.ar">
jguiamet@museo.fcnym.unlp.edu.ar
</A>
<br>Instituto de Fisiologia Vegetal
<br>Universidad de La Plata. 
<br>Province of Buenos Aires
</DD>
</DT>
</p>

<DT>
<IMG SRC="/images/redball.gif"> 
<B>Genes involved in Potassium and Sodium transport
</B>
<DD>Guillermo E. Santa-Maria, 
<A HREF="mailto:gsantama@pop.unsam.edu.ar">
gsantama@pop.unsam.edu.ar
</A>
<br>Instituto de Investigaciones Bioteconologicas, 
Universidad Nacional de San Martin
<br>Province of Buenos Aires
</DD>
</DT>
</p>

<DT>
<IMG SRC="/images/redball.gif"> 
<B>Regulatory genes involved in the control of transcription 
of genes of the photosynthetic antenna
</B>
<DD>Roberto J. Staneloni, 
<A HREF="mailto:RStaneloni@Leloir.org.ar">
RStaneloni@Leloir.org.ar
</A>
<br>Instituto Leloir
<br>Buenos Aires
</DD>
</DT>
</p>

<DT>
<IMG SRC="/images/redball.gif"> 
<B>Functional analysis of oxidative stress-regulated genes
</B>
<DD>Estela M. Valle, 
<A HREF="mailto:evalle@fbioyf.unr.edu.ar">
evalle@fbioyf.unr.edu.ar
</A>
<br>Instituto de Biologia Molecular y Celular de Rosario
<br>Facultad Ciencias Bioquimicas y Farmaceuticas
<br>Universidad Nacional de Rosario
<br>Province of Santa Fe
</DD>
</DT>
<p>
</p>

<DT>
<IMG SRC="/images/redball.gif"> 
<B>Identification of key components for retrograde signaling between mitochondria and nucleus in higher plants by transcriptomic, proteomic and functional analyses of respiratory complex mutants in <I>Arabidopsis</I>
</B>
<DD>Eduarado Zabaleta, 
<A HREF="mailto:ezabaleta@mdp.edu.ar">
ezabaleta@mdp.edu
</A>
<br>
Universidad de Mar del Plata
<br>Province of Buenos Aires
</DD>
</DT>
</p>

<DT>
<IMG SRC="/images/redball.gif"> 
<B>Regulatory genes involved in the biogenesis of mitochondrial Fe-S proteins. Metabolic analysis of <I>Arabidopsis</I> mutants deficient in enzymes involved in carbon metabolism.
</B>
<DD>Diego Gomez-Casati, 
<A HREF="mailto:diego.gomezcasati@intech.gov.ar">
diego.gomezcasati@intech.gov.a
</A>
<br>Instituto de Investigaciones Bioteconologicas, 
Universidad Nacional de San Martin
<br>Province of Buenos Aires
</DD>
</DT>

<p>
<p><B>The main sources of financial support are:</B>
<br>
</DL>
<UL>
<LI>
<A HREF="http://www.agencia.secyt.gov.ar/">
ANPCYT (Agencia Nacional de Promocion Cientifica y 
Tecnologica)
</A>
<LI>
<A HREF="http://www.conicet.gov.ar/">
CONICET (Consejo Nacional de Investigaciones Cientificas y 
Tecnicas)
</A>
<LI>
<A HREF="http://www.fic.nih.gov/programs/research_grants/firca/index.htm/">
FIRCA (NIH)
</A>
<LI>
<A HREF="http://www.twas.org/">
TWAS (Third World Academy of Sciences)
</A>
</UL>
<p>
<br>
</p>  
</dl>
<center>Last modified on July 21, 2009</center>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

