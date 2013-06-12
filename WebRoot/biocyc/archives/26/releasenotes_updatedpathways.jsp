<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<!-- AraCyc 2.6 -->
<%String pageName = "Archive AraCyc 2.6";
String highlight = "4";
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
<!-- SIDEBAR -->


<jsp:include page="/jsp/includes/aracycSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Release Notes" />
</jsp:include>
<div id="rightcolumn">
<!-- CONTENT IN HERE -->

<p class="mainheader">Archives: Pathways updated in AraCyc 2.6</p>
<p>These pathways already existed in the AraCyc but have had their information updated in this release. <strong>Click on the pathway name</strong> to directly access the corresponding pathway detail page.</p>

<dl>
<table width="100%" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3701">biotin biosynthesis</a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=CHLOROPHYLL-SYN">chlorophyll biosynthesis</a></td>
  </tr>
   <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-401">glycosylglyceride biosynthesis</a></td>
  </tr>
   <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-622">starch biosynthesis</a></td>
  </tr>
</table>
</dl>
</div>
<p>AraCyc 2.6's release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives' page</strong></a>.</p>
<strong><em>Date of release</em>:</strong> <em>February 2006</em></div>
<p>
  <jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
  <jsp:param name="cssfile" value="<%=cssfile %>" />
  </jsp:include>
</p>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true"/>

