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
<dt>21st International Conference on Arabidopsis Research - June 06-10, 2010. Yokohama, Japan</dt>
<dd><a href="/portals/education/presentations/2010/ICAR_2010_Phil.ppt"><b>Making the Best Use of TAIR Tools and Datasets</b></a> <em>(presented by Philippe Lamesch)</em></dd>
<dd><a href="/portals/education/presentations/2010/ICAR_2010_Donghui.ppt"><b>Tips for Accessing Gene Function Data</b></a> <em>(presented by Donghui Li)</em></dd>
<dd><a href="/portals/education/presentations/2010/ICAR_2010_Eva.ppt"><b>New Data and Tools at TAIR</b></a> <em>(presented by Eva Huala)</em></dd>
</dt>
</dl>

<dl>
<dt>American Society of Plant Biologists - July 31 - August 4, 2010. Montreal, Canada</dt>
<dd><b><u>Plant Ontology and Gramene's Gene Annotation Workshop</u></b></dd>
<dd><b><a href="/portals/education/presentations/2010/ASPB_2010_Kate.ppt">TAIR Resources for Plant Biology Research</a></b> <em>(presented by Kate Dreher)</em>
<br />Saturday July 31, 8:00 am - 12:00 pm</dd>
<br />
<dd><b><u>TAIR: Bringing Together Data for the Global Plant Biology Community</u></b></dd>
<dd><b><a href="/portals/education/presentations/2010/ASPB_2010_Phil.ppt">Part One</a></b> <em>(presented by Phillipe Lamesch)</em>
<br />Monday August 2, 8:00 - 9:30 pm</dd>
<dd><b><a href="/portals/education/presentations/2010/ASPB_2010_Kate-main.ppt">Part Two</a></b> <em>(presented by Kate Dreher)</em>
<br />Monday August 2, 8:00 - 9:30 pm</dd>
</dd>
</dl>

<dl>
<dt>Lehman College, CUNY (City University of New York) - September 13, 2010. NY, USA</dt>
<dd><b><a href="/portals/education/presentations/2010/CUNY_Kate_2010.ppt">Biocuration: Helping Researchers Harness the Data Explosion at TAIR and the Plant Metabolic Network</a></b>
<em>(presented by Kate Dreher)</em></dd>
</dl>

<dl>
<dt>University of California, Davis - October 11, 2010, CA, USA</dt>
<dd><b><a href="/portals/education/presentations/2010/PBGG_Kate_2010.ppt">Putting TAIR and the PMN to work for you: Tips and Techniques for Accessing Data for Plant Biology Research</a></b>
<em>(presented by Kate Dreher)</em></dd>
</dl>

<dl>
<dt>22nd International Conference on Arabidopsis Research - June 22-25, 2011. Madison, Wisconsin</dt>
<dd><a href="/portals/education/presentations/2011/madison2011_worshoptair_plamesch_final.pdf"><b>Gene structure curation at TAIR</b></a> <em>(presented by Philippe Lamesch)</em></dd>
<dd><a href="/portals/education/presentations/2011/Donghui_ICAR2011Madison_final_1.pdf"><b>Gene function annotation at TAIR</b></a> <em>(presented by Donghui Li)</em></dd>
<dd><a href="/portals/education/presentations/2011/Donghui_ICAR2011Madison_final_2.pdf"><b>Community annotation: coupling data submission with publication</b></a> <em>(presented by Donghui Li)</em></dd>
</dt> 
</dl>


<dl>
<a name="archive"></a><dt>Presentations archive </dt>
<dd><a href="/portals/education/presentations/2006/presentations.jsp">2006</a></dd>
<dd><a href="/portals/education/presentations/2007/presentations.jsp">2007</a></dd>
<dd><a href="/portals/education/presentations/2008/presentations.jsp">2008</a></dd>
<dd><a href="/portals/education/presentations/2009/presentations.jsp">2009</a></dd>
</dl>

<center>
  <p>Last modified on December 16, 2009
  </p>
</center>
</div> 
<!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
