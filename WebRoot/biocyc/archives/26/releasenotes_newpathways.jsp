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

<p class="mainheader">Archives: Newly added pathways in AraCyc 2.6</p>
<p>This list summarizes the pathways that have been added to AraCyc in this release. <strong>Click on the pathway name</strong> to directly access the corresponding pathway detail page.</p>
<p>AraCyc 2.6's release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives' page</strong></a>.</p>
<br>
<dl>
<table width="100%" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5086">chlorophyll biosynthesis I </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5064">chlorophyll biosynthesis II </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5068">chlorophyll cycle </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-116">coniferin metabolism </a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5032">ent-kaurene biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5034">GA12 biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5070">gibberellin biosynthesis I </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5036">gibberellin biosynthesis II </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5035">gibberellin biosynthesis III </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-102">gibberellin inactivation </a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4841">inositol oxidation pathway </a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4541">lipid-dependent phytate biosynthesis I </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4562">lipid-dependent phytate biosynthesis II </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4661">lipid-independent phytate biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-112">lupeol biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5060">luteolin biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-83">monolignol glucoside biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5083">NAD/NADH phosphorylation and dephosphorylation </a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5027">phylloquinone biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4702">phytate degradation I </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4781">phytate degradation II </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5044">purine degradation </a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5041">S-adenosyl-L-methionine cycle </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5043">salvage pathway of purine nucleosides </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4427">sulfolipid biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-63">UDP-L-arabinose biosynthesis I </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-82">UDP-L-arabinose biosynthesis II </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-66">UDP-L-fucose biosynthesis I</a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-6">UDP-L-fucose biosynthesis II</a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4861">UDP-galacturonate biosynthesis I </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4">UDP-galacturonate biosynthesis II </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3261">UDP-rhamnose biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4821">UDP-xylose biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5080">very long chain fatty acid biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4203">volatile benzenoid ester biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5053">superpathway of GA12 biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5052">superpathway of gibberellin biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4765">superpathway of lipid-dependent phytate biosynthesis </a></td>
  </tr>
</table>
</dl>
<p>A complete list of <b><a href="releasenotes_allnewpathways.jsp">all new pathways</a> </b>added <b>since AraCyc's initial build</b>.</p>
<br>
<p>AraCyc 2.6's release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives' page</strong></a>.</p>
<br>
<strong><em>Date of release</em>:</strong> <em>February 2006</em></div>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

