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
<dt>ASPB Meeting - Chicago July 2007</dt>
<dd><u>TAIR Workshop I (Sunday): Gene Ontology and metabolic databases</u></dd>
<dd><a href="/portals/education/presentations/2007/ASPB2007_GO.ppt">Part I</a> Gene Ontology (GO) introduction: purpose and structure of GO. <em>(presented by Tanya Berardini)</em></dd>
<dd><a href="/portals/education/presentations/2007/ASPB2007_PO.ppt">Part II</a> Introduction to the Plant Ontology (PO). <i><em>[presented by Chih-Wei Tung (from <a href="http://www.gramene.org/">Gramene</a>)]</em></i></dd>
<dd><a href="/portals/education/presentations/2007/ASPB2007_metabolism.ppt">Part III</a> Presentation of the metabolic databases AraCyc and MetaCyc: their content and functionalitites. <em>(presented by Hartmut Foerster)</em></dd>
  <dd><u>TAIR Workshop II (Tuesday): An introduction to TAIR</u><strong>*</strong></dd>
  <dd><a href="/portals/education/presentations/2007/ASPB2007_TAIR.ppt">Part I</a> About TAIR, its tools and order stocks. <i>(presented by Christophe Tissier)</i></dd>
<br>
  <dt class="style1">*If you would like to obtain the presentation of the <a href="http://www.sgn.cornell.edu/">SGN</a> or <a href="http://www.gramene.org/">Gramene</a> groups, please contact Lukas Mueller and Pankaj Jaiswal, respectively.</dt>
</dl>
<dl>
<dt>18th Arabidopsis Meeting - Beijing June 2007</dt>
<dd><u>TAIR Workshop</u></dd>
<dd><a href="/portals/education/presentations/2007/ICAR2007_TAIR_intro.ppt">Part I</a> An introduction to the TAIR database. <em>(presented by Eva Huala)</em></dd>
<dd><a href="/portals/education/presentations/2007/ICAR2007_TAIR7_genome_release.ppt">Part II</a> TAIR7 and the annotation of the <em>Arabidopsis</em> genome. <em>(presented by Eva Huala)</em></dd>
<dd><a href="/portals/education/presentations/2007/ICAR2007_GO.ppt">Part III</a> Introduction to the Gene Ontology (GO). <em>(presented by Donghui Li)</em></dd>
<dd><a href="/portals/education/presentations/2007/ICAR2007_Aracyc.ppt">Part IV</a> Presentation of AraCyc, the <em>Arabidopsis thaliana </em>metabolic database. <em>(presented by Donghui Li)</em></dd>
</dl>
<dl>
<dt><strong>Return to main <a href="/portals/education/presentations.jsp">Presentations page</a></strong></dt>
</dl>
<br>
<center>
  <p>Last modified on June 12, 2007
  </p>
</center>
</div> 
<!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
