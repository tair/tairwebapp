<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<!-- AraCyc 4.1-->
<%String pageName = "Archives: AraCyc 5.0 - Statistics";
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
.style1 {
	font-weight: bold;
	font-style: italic;
}
-->
</style>








<jsp:include page="/jsp/includes/aracycSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Release Notes" />
</jsp:include>
<div id="rightcolumn">
<!-- CONTENT IN HERE -->

<p align="center"><img src="aracyc_files/aracyc_logo.gif" width="100" height="58"></p>
<p class="mainheader"><span class="mainheader">Statistics for the AraCyc 5.0 release </span></p>

<table width="100%" align="center">
<tr><td><table width="70%"  border="0" align="left">
  <tr bgcolor="#F4EAEA">
    <td width="90%">
      <div align="left"><strong> <em>Total number of pathways </em></strong><em>(excluding superpathways)</em><strong><em>:</em></strong></div></td>
    <td width="10%"> <div align="center"><em><strong>332</strong></em></div></td>
    </tr>
  <tr bgcolor="#F4EAEA">
    <td width="90%">... with experimental evidence (EV-EXP or EV-AS):</td>
    <td width="10%"><div align="center">290</div></td>
    </tr>
  <tr bgcolor="#F4EAEA">
    <td width="90%">... with no associated genes:</td>
    <td width="10%"><div align="center">21</div></td>
    </tr>
  <tr bgcolor="#FFEFEA">
    <td width="90%"><strong><em>Total number of reactions:</em></strong></td>
    <td width="10%"><div align="center"><em><strong>1928</strong></em></div></td>
    </tr>
  <tr bgcolor="#FFEFEA">
    <td width="90%">... associated with genes:</td>
    <td width="10%"><div align="center">1270</div></td>
    </tr>
 <tr bgcolor="#FFEFEA">
    <td width="90%">... number of reactions associated with genes having experimental evidence:</td>
    <td width="10%"><div align="center">925</div></td>
    </tr> 
 <tr bgcolor="#FFEFEA">
    <td width="90%">... in pathways:</td>
    <td width="10%"><div align="center">1388</div></td>
    </tr>
  <tr bgcolor="#FFEFEA">
    <td width="90%">... in pathways, associated with genes:</td>
    <td width="10%"><div align="center">932</div></td>
    </tr>
  <tr bgcolor="#FFEFEA">
    <td width="90%">... in pathways, associated with genes having experimental evidence:</td>
    <td width="10%"><div align="center">723</div></td>
    </tr>
  <tr bgcolor="#F4FBF4">
    <td width="90%"><span class="style1">Total number of genes:</span></td>
    <td width="10%"><div align="center"><em><strong>5821</strong></em></div></td>
    </tr>
  <tr bgcolor="#F4FBF4">
    <td width="90%">... in pathways:</td>
    <td width="10%"><div align="center">1970</div></td>
    </tr>
  <tr bgcolor="#F4FBF4">
    <td width="90%">... with experimental evidence, in pathways:</td>
    <td width="10%"><div align="center">773</div></td>
    </tr>
  <tr bgcolor="#F4FBF4">
    <td width="90%"><div align="left">... in reactions:</div></td>
    <td width="10%"><div align="center">2787</div></td>
    </tr>
  <tr bgcolor="#F4FBF4">
    <td width="90%">... with experimental evidence, in reactions:</td>
    <td width="10%"><div align="center">952</div></td>
    </tr>
  <tr bgcolor="#EAEAFF">
    <td width="90%"><div align="left"><strong><em>Total number of proteins:</em></strong></div></td>
    <td width="10%"><div align="center"><em><strong>5869</strong></em></div></td>
    </tr>
  <tr bgcolor="#F5F5FA">
    <td width="90%">
      <div align="left"><strong><em>Total number of protein complexes:</em></strong></div></td>
    <td width="10%"> <div align="center"><em><strong>166</strong></em></div></td>
    </tr>
  <tr bgcolor="#FFFBEC">
    <td width="90%"><div align="left"><em><strong> Total number of compounds:</strong></em></div></td>
    <td width="10%"> <div align="center"><em><strong>2312</strong></em></div></td>
    </tr>
<tr bgcolor="#FFFBEC">
    <td width="90%"><div align="left"><em><strong> Total number of citations:</strong></em></div></td>
    <td width="10%"> <div align="center"><em><strong>2543</strong></em></div></td>
    </tr>
</table>
</td>
</tr>
</table>
<p><b>AraCyc 5.0</b>'s release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives page</strong></a>.</p>
<p><strong><em>Last modified:</em></strong> <em>March 12, 2009 </em></p>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

