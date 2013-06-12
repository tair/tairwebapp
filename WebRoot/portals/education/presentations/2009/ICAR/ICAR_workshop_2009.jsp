<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%!
String pageName = "ICAR 2009 Workshop";
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
<span class="mainheader">ICAR Workshop 2009 </span>
<p>
TAIR gave a workshop at the <a href="http://arabidopsis2009.com/">20th International Conference on Arabidopsis Research</a>.
</p>
<dt><b>Putting TAIR to work for you - hands-on workshop for beginning and advanced users</b></dt>
<dd><ul>
<li>Date: July 2, 2009</li>
<li>Time: 4:30 - 6:00 PM</li>
<li>Location: Kilsyth</li>
<li>Conference site: Edinburgh, Scotland</li>
</ul></dd>
<dd><b>Part I: Tips and strategies from curators</b></dd>
<br />
<dd><a href="ICAR2009-Eva-genesearch-1.ppt">1. Gene searches and the locus page</a> <em>(presented by Eva Huala)</em></dd>
<dd><a href="ICAR2009-Dave-GBrowse-2.ppt">2. TAIR9, GBrowse, and confidence scores</a> <em>(presented by Dave Swarbreck)</em></dd>
<dd><a href="ICAR2009-kate-datasets-3.ppt">3. Generating and working with data sets</a> <em>(presented by Kate Dreher)</em></dd>
<dd><ul>
<li><a href="resource_guide.doc">TAIR ICAR Workshop Resource Guide</a></li>
</ul></dd>


<dd><b>Part II: Hands-on exercises and individual help</b></dd>
<dd><i><em>(presenters and participants)</em></i></dd>
<dd><ul>
<li><a href="ICAR_Q_final.doc">TAIR ICAR Workshop Practice Questions</a></li><br />
<li><a href="TAIR_workshop_part_2_data_file.txt">TAIR workshop - part 2 - data file</a><br />
(Microarray / OMICs viewer data file for Question #1)</li><br />
<li><a href="ICAR+Q+and+A_final.doc">TAIR ICAR Workshop Practice Questions with Answers</a></li><br />
</ul></dd>
<dd>
<p></p>


<p></p>
</dd>
<dd>If you have any further questions . . .
<ul>
<li>Visit our curation booth at the back of the exhibition hall for one-on-one help</li><br />
<li>Send us an e-mail:</li>
<ul>
<li>TAIR: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');"> curator@arabidopsis.org</A></p> </li>
<li>PMN: <a href="mailto:curator@plantcyc.org"> curator@plantcyc.org</A></p></li>
</ul>
</ul></dd>
</dt>
</dl>
 
</dt>
    

<center>
  <p>Last modified on June 30, 2009
  </p>
</center>
</div> 
<!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
