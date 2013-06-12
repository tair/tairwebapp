<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%!
String pageName = "Education";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
errorPage="/jsp/common/gen_error.jsp"%>
<style type="text/css">
<!--
.style1 {font-size: smaller}
-->
</style>






<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%= cssfile %>" />
<jsp:param name="id" value="1125" />
</jsp:include>

<jsp:include page="/jsp/includes/educationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="TAIR Presentations(ppt)" />
</jsp:include>

<div id="rightcolumn">
<span class="mainheader">TAIR Presentations </span>
<p>
This portal contains several PowerPoint presentations given by TAIR staff at a variety of meetings and conferences.
</p>
<dl>
<dt>Plant and Animal Genome (PAG) Meeting - San Diego January 2008 </dt>
<dd><u>TAIR Workshop: Community Annotation at TAIR </u></dd>
<dd><a href="/portals/education/presentations/2008/PAG2008_partI.ppt">Part I</a> Gene function community annotation <em>(presented by Donghui Li)</em></dd>
<dd><a href="/portals/education/presentations/2008/PAG_gene_structure_annotation.ppt">Part II</a>Gene structure annotation at TAIR <i><em>(presented by Philippe Lamesch)</em></i></dd>
</dt>
</dl>

<dl>
    <dt>UC Davis Plant Biology Graduate Seminar Series - May 2008</dt>
    <dd><a href="/portals/education/presentations/2008/TAIR-PMN+presentation+for+Davis+05-09-08.pdf"><u>TAIR-PMN Presentation</u></a></dd>
</dl>

<dl>
<dt>ASPB Plant Biology 2008 - Merida Mexico June 2008 </dt>
<dd><u>TAIR Workshop</u></dd>
<dd><a href="/portals/education/presentations/2008/ASPB2008-TAIR-overview.ppt ">Part I</a> Introduction  <em>(presented by Peifen Zhang)</em></dd>
<dd><a href="/portals/education/presentations/2008/ASPB_2008_structural_annotation.ppt">Part II</a> Gene structure annotation  <em>(presented by David Swarbeck)</em></dd>
<dd><a href="/portals/education/presentations/2008/ASPB_2008_functional_annotation.ppt">Part III</a> Gene function annotation <em>(presented by Donghui Li)</em></dd>
<dd><u>Joint PMN-SGN-Gramene Workshop</u></dd>
<dd><a href="/portals/education/presentations/2008/ASPB2008-pathway.ppt">How pathway databases were created and curated</a> <em>(presented by Peifen Zhang)</em></dd>
</dl>

<dl>
    <dt>19th International Conference on Arabidopsis Research - Montreal, Canada July 2008 </dt>
    <dd><u>
TAIR Workshop: Sources and strategies for gene structure, gene function, and metabolic pathway annotation at TAIR and AraCyc </u></dd>
    <dd><a href="/portals/education/presentations/2008/montreal_tair_talk_final_plamesch-1.ppt">Part I</a> Gene Structure Annotation <em>(presented by Philippe Lamesch)</em></dd>
    <dd><a href="/portals/education/presentations/2008/ICARMontreal debbie final.ppt">Part II</a> Gene Function Annotation <em>(presented by Debbie Alexander)</em></dd>
    <dd><a href="/portals/education/presentations/2008/Building+and+Refining+AraCyc+-+ICAR+2008.ppt">Part III</a> Building and Refining AraCyc: Data Content, Sources, and Methodologies <em>(presented by Kate Dreher)</em></dd>
    
    <dd><u>Joint Workshop: Advanced Bioinformatic Resources for Arabidopsis </u></dd>
    <dd><a href="/portals/education/presentations/2008/montreal_gbrowse_talk_plamesch_final_new.ppt">Part I</a> GBrowse at TAIR <em>(presented by Philippe Lamesch)</em></dd>
    <dd><a href="/portals/education/presentations/2008/Tools+Workshop+-+OMICS+Viewer.ppt">Part II</a> AraCyc and the OMICS Viewer: Making sense of metabolism in your favorite biological process <em>(presented by Kate Dreher)</em></dd>
    <dd>&#042;The presentations made by the other groups that participated in this workshop (BAR, Genevestigator, AT-TEDII, and NASC Arrays) can also be obtained from the <a href="http://bar.utoronto.ca/ICAR19/">Bio-Array</a> Resource site.</dd>    
    
    <dd><u>Evolution and Development Session </u></dd>
    <dd><a href="/portals/education/presentations/2008/Eva_+Montreal_2008.ppt"> Arabidopsis as a model for plant development</a> <em>(presented by Eva Huala)</em></dd>
</dl>
    
</dt>
    
<dl>
<dt><strong>Return to main <a href="/portals/education/presentations.jsp">Presentations page</a></strong></dt>
</dl>
<br>
<center>
  <p>Last modified on August 25, 2008
  </p>
</center>
</div> 
<!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
