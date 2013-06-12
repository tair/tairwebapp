<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String pageName = "Genome Annotation Tools: Promoters-Cis Elements";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11435" />
</jsp:include>

<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Plant Promoter and Regulatory Element Resources" />
</jsp:include>
<div id="rightcolumn">
<!--CONTENT HERE-->
<span class="mainheader">Plant Promoter and Regulatory Element Resources</span>


<dl>
<dt> <a href="http://arabidopsis.med.ohio-state.edu/">AGRIS</a></dt>
          <dd> 
           Currently contains two databases, AtcisDB (Arabidopsis thaliana cis-regulatory database) and AtTFDB (Arabidopsis thaliana transcription factor database).</dd>


  <dt> <a href="http://www.athamap.de">AthaMap</a></dt>
          <dd> 
A genome-wide map of putative transcription factor binding sites in <I>Arabidopsis thaliana</I>.</dd>

  <dt> <a href="http://exon.cshl.org/cgi-bin/atprobe/atprobe.pl">AtProbe</a></dt>
          <dd> 
           The Arabidopsis thaliana promoter binding element database, an aid to find binding elements and check data against the primary literature.</dd>

  <dt> <a href="http://datf.cbi.pku.edu.cn">DATF: Database of Arabidopsis Transcription Factors</a></dt>
          <dd> 
           The Database of Arabidopsis Transcription Factors (DATF) contains known and predicted Arabidopsis transcription factors with sequences and many other features including 3D structure templates, EST expression information, transcription factor binding sites and Nuclear Location Signals. </dd>

<dt><a href="http://bioinformatics.psb.ugent.be/ATCOECIS/">ATCOECIS </a></dt>
<dd>This resource can be used to query co-expression data, GO and cis-regulatory elements annotations, submit user-defined gene sets for motif analysis for Arabidopsis and provides an access point to unravel the regulatory code underlying transcriptional control in Arabidopsis. </dd>
           
  <dt> <a href="http://doop.abc.hu/">DoOP: Databases of Orthologous Promoters</a></dt>
          <dd> 
A database containing orthologous clusters of promoters from Homo sapiens, Arabidopsis thaliana and other organisms.</dd>

  <dt> <a href="http://bioinformatics.psb.ugent.be/webtools/plantcare/html/">PlantCare</a></dt>
          <dd> 
           Database of plant cis-acting regulatory elements and a portal to tools for in silico analysis of promoter sequences.</dd>


  <dt> <a href="http://www.softberry.com/berry.phtml?topic=plantprom">PlantProm DB</a></dt>
          <dd> 
           Database with annotated, non-redundant collection of proximal promoter sequences for RNA polymerase II with experimentally determined transcription start sites &#040;TSS&#041; from various plant species.</dd>

           
  <dt> <a href="http://www.dna.affrc.go.jp/htdocs/PLACE/">Place</a></dt>
          <dd> 
           Database of motifs found in plant cis-acting regulatory DNA elements, all from previously published reports. It covers vascular plants only.</dd>


  <dt> <a href="http://plntfdb.bio.uni-potsdam.de/v1.0/">PlantTFDB: Plant Transcription Factor Database</a></dt>
          <dd>
          An integrative plant transcription factor database that provides a web interface to access large (close to complete) sets of transcription factors of several plant species, currently encompassing Arabidopsis thaliana (thale cress), Populus trichocarpa (poplar), Oryza sativa (rice), Chlamydomonas reinhardtii and Ostreococcus tauri.
          </dd>
  
  <dt> <a href="http://ppdb.agr.gifu-u.ac.jp"> ppdb &#040;Plant Promoter DB&#041;</a></dt>
          <dd> 
           Database that provides transcription start sites &#040;TSS&#041; and other structural information for Arabidopsis and rice promoters. </dd>    
           
    <dt> <a href="http://www.ab.wur.nl/pricat"> PRI-CAT </a></dt>
          <dd> 
           Plant Research International ChIP-seq analysis tool is a web-based workflow tool for the management and analysis of ChIP-seq experiments. Users can directly submit their sequencing data to PRI-CAT for automated analysis.  </dd>    
           

  <dt> <a href="http://www.gene-regulation.com/pub/databases.html#transfac">Transfac</a></dt>
          <dd> 
           Database on eukaryotic transcription factors, their genomic binding sites and DNA-binding profiles. Commercial site.</dd>
</dl>




            </div> <!--right column-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

