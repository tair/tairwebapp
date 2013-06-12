<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<!-- AraCyc 3.5-->
<%String pageName = "Archives: AraCyc 4.5 - Deleted pathways";
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
<style type="text/css">
<!--
.style2 {font-size: small}
.style7 {font-size: xx-small; font-style: italic; }
-->
</style>


<jsp:include page="/jsp/includes/aracycSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Release Notes" />
</jsp:include>

<div id="rightcolumn">
<!-- CONTENT IN HERE -->

<p align="center"><a name="Top"></a><img src="aracyc_files/aracyc_logo.gif" width="100" height="58"></p>
<p class="mainheader">Archives: Pathways deleted from the database in AraCyc 4.5</p>
<p>This list summarizes the pathways that have been deleted from AraCyc in this release. The pathway name in the 'Deleted' column are hyperlinked to the <strong>corresponding MetaCyc pathway detail page</strong>.</p>
<table width="100%"  border="0">
  <tr>
    <td width="42%">&nbsp;</td>
    <!--<td width="12%"><span class="style7"><a href="#Bottom">Bottom of page </a></span></td>-->
    <td width="46%">&nbsp;</td>
  </tr>
</table>
<dl>
      <table width="100%" height="97" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50%" height="19"><strong>Pathways deleted in this release </strong></td>
    <!--<td width="50%"><strong>Replaced by: </strong></td>-->
      </tr>
      <tr>
  	<td>&nbsp;</td>
      </tr>
      <tr>
        <td height="19" align="left"><strong>P.</strong></td>
        <td align="left">&nbsp;</td>
      </tr>
      <tr>
        <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=PHESYN">phenylalanine biosynthesis II </a></td>
        <td align="left">&nbsp;</td>
      </tr>
       <tr>
         <td height="19" align="left"><strong>T.</strong></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=TRYPTOPHAN-DEGRADATION-1">tryptophan degradation</a></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
  	<td>&nbsp;</td>
      </tr>
    </table>
</dl>
<p><a name="Bottom"></a>A complete list of <b><a href="releasenotes_alldeletedpathways.jsp">all the pathways</a> </b>removed from AraCyc <b>since its initial build</b>.</p>
<p><strong>AraCyc 4.5 </strong>'s release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives page</strong></a>.</p>
<table width="100%"  border="0">
  <tr>
    <td width="42%">&nbsp;</td>
    <!--<td width="12%"><span class="style7"><a href="#Top">Top of page </a></span></td>-->
    <td width="46%">&nbsp;</td>
  </tr>
</table><br>
<strong><em>Last modified</em>:</strong> <em>June 11, 2008 </em></div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

