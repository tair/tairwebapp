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

<p class="mainheader">Archives: Pathways deleted from the database in AraCyc 2.6</p>
<p>This list summarizes the pathways that have been deleted from AraCyc in this release. The pathway name in the 'Deleted' column are hyperlinked to the <strong>corresponding MetaCyc pathway detail page</strong>.</p>
<p>AraCyc 2.6's release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives' page</strong></a>.</p>
<br>
<dl>
    <table width="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50%"><strong>Pathways deleted in this release </strong></td>
    <td width="50%"><strong>Replaced by: </strong></td>
  </tr>
      <tr>
        <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=BIOTIN-BIOSYNTHESIS-PWY">biotin biosynthesis I</a></td>
        <td width="50%" align="left"><span class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3701">biotin biosynthesis</a></span></td>
      </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
       <tr>
         <td width="50%" valign="middle" class="xl24">gibberellin biosynthesis <em>(no longer in MetaCyc or AraCyc)</em> </td>
         <td width="50%" class="xl24"><p>- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5034">GA12 biosynthesis </a><br>
      - <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5070">gibberellin biosynthesis I </a><br>
      - <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5036">gibberellin biosynthesis II </a><br>
      - <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5035">gibberellin biosynthesis III </a><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4321"></a></p></td>
       </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
       <tr>
         <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=MANNIDEG-PWY">mannitol degradation</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=MANNICAT-PWY">mannose degradation</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=NADPHOS-DEPHOS-PWY">NAD phosphorylation and dephosphorylation</a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5083">NAD/NADH phosphorylation and dephosphorylation </a></td>
      </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=VALDEG-PWY">valine degradation I </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
    </table>
</dl>
<p>A complete list of <b><a href="releasenotes_alldeletedpathways.jsp">all the pathways</a> </b>removed from AraCyc <b>since its initial build</b>.</p>
<br>
<strong><em>Date of release</em>:</strong> <em>February 2006</em></div>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

