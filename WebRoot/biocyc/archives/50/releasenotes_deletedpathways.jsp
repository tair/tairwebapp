<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<!-- AraCyc 3.5-->
<%String pageName = "Archives: AraCyc 5.0 - Deleted pathways";
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
<p class="mainheader">Archives: Pathways deleted from the database in AraCyc 5.0</p>
<p>This list summarizes the pathways that have been deleted from AraCyc in this release. The pathway name in the 'Deleted' column are hyperlinked to the <strong>corresponding MetaCyc pathway detail page</strong>.</p>
<table width="100%"  border="0">
  <tr>
    <td width="42%">&nbsp;</td>
    <!--td width="12%"><span class="style7"><a href="#Bottom">Bottom of page </a></span></td>-->
    <td width="46%">&nbsp;</td>
  </tr>
</table>
<dl>
      <table width="100%" height="97" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50%" height="19"><strong>Pathways deleted in this release </strong></td>
    <td width="50%"><strong>Replaced by: </strong></td>
      </tr>
      <tr>
  	<td>&nbsp;</td>
      </tr>
      <tr>
        <td height="19" align="left"><strong>G.</strong></td>
        <td align="left">&nbsp;</td>
      </tr>
      <tr>
        <td valign="middle" class="xl24">geranylgeranyldiphosphate biosynthesis II (plastidic)<span class="xl24 style2 style8"> <em>(pathway ID 'PWY-5121' has been modified from its original structure in MetaCyc and two pathways have been substituted to match it)</em></span></td>
        <td width="50%" class="xl24"><p>i) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5120">geranylgeranyldiphosphate biosynthesis</a><br>
	ii) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5123">trans,trans-farnesyl diphosphate biosynthesis </a><br>
	</a></p></td>
	</tr>
      	<tr><td>&nbsp;</td></tr>  
      
        <td align="left">&nbsp;</td>
      </tr>
       <tr>
         <td height="19" align="left"><strong>T.</strong></td>
         <td align="left">&nbsp;</td>
       </tr>
      <tr> <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=THISYN-PWY">thiamine biosynthesis</a></td><td align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=THISYNARA-PWY">thiamine biosynthesis</a></td></tr>
       <tr><td>&nbsp;</td></tr>
       <tr>
         <td height="19" align="left"><strong>U.</strong></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
        <td valign="middle" class="xl24">ubiquinone-9 biosynthesis<span class="xl24 style2 style8"> <em>(pathway ID 'PWYQT-4448', no longer exists in either MetaCyc or AraCyc)</em></span></td>
        <td width="50%" class="xl24"><p>- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5871">ubiquinone-9 biosynthesis</a><br></p></td>
      </tr>
      <tr><td>&nbsp;</td></tr>
      <tr><td align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=URDEGR-PWY">ureide degradation</a></td></tr>
      <tr><td>&nbsp;</td></tr>
      <tr>
         <td height="19" align="left"><strong>Superpathways.</strong></td>
         <td align="left">&nbsp;</td>
       </tr> 
       <tr><td align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=GLUCONSUPER-PWY">superpathway of gluconate degradation</a></td></tr>
       
       
       <tr>
  	<td>&nbsp;</td>
      </tr>
    </table>
</dl>
<p><a name="Bottom"></a>A complete list of <b><a href="releasenotes_alldeletedpathways.jsp">all the pathways</a> </b>removed from AraCyc <b>since its initial build</b> up to and including AraCyc 5.0.</p>
<p><b>AraCyc 5.0</b>'s release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives page</strong></a>.</p>
<table width="100%"  border="0">
  <tr>
    <td width="42%">&nbsp;</td>
    <!--<td width="12%"><span class="style7"><a href="#Top">Top of page </a></span></td>-->
    <td width="46%">&nbsp;</td>
  </tr>
</table><br>
<strong><em>Last modified</em>:</strong> <em>March 6,2009 </em></div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

