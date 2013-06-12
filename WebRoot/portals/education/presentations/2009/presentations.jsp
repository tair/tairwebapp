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
<dt>Plant and Animal Genome (PAG) Meeting - San Diego January 2009 </dt>
<dd><u>TAIR Workshop</u></dd>
<dd><a href="/portals/education/presentations/2009/PAG2009(tair).ppt">Part I</a> Top Four Essential TAIR resources <em>(presented by Debbie Alexander)</em></dd>
<dd><a href="/portals/education/presentations/2009/PAG2009(PMN).ppt">Part II</a> Metabolic Pathway Databases for Arabidopsis and Other Plants <i><em>(presented by Peifen Zhang)</em></i></dd>
</dt>
</dl>

<dl>
<dt>Carnegie Institution for Science, Department of Plant Biology - June 04, 2009 </dt>
<dd><b><a href="/portals/education/presentations/2009/Reading_Curating_Papers.ppt">Extracting information from scientific papers: Challenges and Opportunities for Researchers and Curators
 </a> </b>
  <em>(presented by Kate Dreher)</em></dd> 
</dt>
</dl>

<dl>
<dt>20th International Conference on Arabidopsis Research - June 30 - July 4 2009</dt>
<dd><b><a href="/portals/education/presentations/2009/ICAR/ICAR_workshop_2009.jsp">Putting TAIR to work for you - hands-on workshop for beginning and advanced users</a></dd>

<br />
<dd><b>Part I: Tips and techniques from curators</b></dd>
<dd><a href="/portals/education/presentations/2009/ICAR/ICAR2009-Eva-genesearch-1.ppt"> 1. Gene searches and the locus page</a> <em>(presented by Eva Huala)</em></dd>
<dd><a href="/portals/education/presentations/2009/ICAR/ICAR2009-Dave-GBrowse-2.ppt">2. TAIR9, GBrowse, and confidence scores</a> <em>(presented by Dave Swarbreck)</em></dd>
<dd><a href="/portals/education/presentations/2009/ICAR/ICAR2009-kate-datasets-3.ppt"> 3. Generating and working with data sets</a> <em>(presented by Kate Dreher)</em></dd>

<dd><b>Part II: Hands-on exercises and individual help</b></dd>
<dd><i><a href="/portals/education/presentations/2009/ICAR/ICAR_workshop_2009.jsp">Resource Guide, questions, practice data set, and answers</a></i></dd>
</dl>

<dl>
<dt>TGen (Invited Speaker) - July 13, 2009 Phoenix, AZ</dt>
<dd><b><a href="/portals/education/presentations/2009/TGEN_TAIR.ppt">Challenges in Biocuration
 </a> </b>
  <em>(presented by Phillippe Lamesch)</em></dd> 
</dt>
</dl>

<dl>
<dt>American Society of Plant Biologists - July 18-22 2009. Honolulu, HI, USA</dt>
<dd><b><a href="/portals/education/presentations/2009/ASPB_2009_TAIR_effectively_use_tair.ppt">TAIR Workshop I: How to effectively use the tools and resources at TAIR to enhance your research</a> </b>
  <em>(presented by A.S. Karthikeyan, Philippe Lamesch, and Donghui Li)</em></dd> 
<dd><b><a href="/portals/education/presentations/2009/ASPB_2009_TAIR_comparative_genomics.ppt">TAIR Workshop II: TAIR, PMN, Gramene and SGN workshop: focus on comparative genomics and new tools</a> </b>
  <em>(presented by A.S. Karthikeyan, Philippe Lamesch, and Donghui Li)</em></dd> 
</dl>

<dl>
<dt>International Plant Molecular Biology Congress - October 25-30 St. Louis, MO, USA</dt>
<dd><b><a href="/portals/education/presentations/2009/IPMB_2009_PMN_presentation.ppt">Putting the Plant Metabolic Network (PMN) to work for you</a></b>
<em>(presented by Kate Dreher)</em></dd>
<dd><b><a href="/portals/education/presentations/2009/IPMB_2009_TAIR_presentation.ppt">Working with TAIR</a></b>
<em>(presented by Eva Huala)</em></dd>
</dl>

<dl>
<dt>Frontiers in Plant Molecular Biology, November 14 - 18, 2009. Su Zhou, China</dt>
<dd><b> <a href="/portals/education/presentations/2009/TAIR_suzhou_2009.pdf">TAIR: New Features and New Tools, Challenges and Opportunities</a></b> <em>(presented by Donghui Li)</em></dd>
</dl>

<dl>
<dt><strong>Return to main <a href="/portals/education/presentations.jsp">Presentations page</a></strong></dt>$
</dl>

<center>
  <p>Last modified on September 29, 2010
  </p>
</center>
</div> 
<!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
