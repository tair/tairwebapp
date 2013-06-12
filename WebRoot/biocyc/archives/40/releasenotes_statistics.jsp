<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<!-- AraCyc 4.0-->
<%String pageName = "Archives AraCyc 4.0 - Statistics";
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

<span class="mainheader">Archives: Statistics for this release (AraCyc 4.0) </span>

<table width="100%" align="center">
<tr><td><table width="70%"  border="0" align="left">
  <tr bgcolor="#F4EAEA">
    <td width="90%">
      <div align="left"><strong> <em>Total number of pathways </em></strong><em>(excluding superpathways)</em><strong><em>:</em></strong></div></td>
    <td width="10%"> <div align="center"><em><strong>285</strong></em></div></td>
    </tr>
  <tr bgcolor="#F4EAEA">
    <td width="90%">... with experimental evidence:</td>
    <td width="10%"><div align="center">230</div></td>
    </tr>
  <tr bgcolor="#FFEFEA">
    <td width="90%"><strong><em>Total number of reactions:</em></strong></td>
    <td width="10%"><div align="center"><em><strong>1701</strong></em></div></td>
    </tr>
  <tr bgcolor="#FFEFEA">
    <td width="90%">... associated with genes:</td>
    <td width="10%"><div align="center">1136</div></td>
    </tr>
  <tr bgcolor="#FFEFEA">
    <td width="90%">... in pathways:</td>
    <td width="10%"><div align="center">1277</div></td>
    </tr>
  <tr bgcolor="#FFEFEA">
    <td width="90%">... in pathways, associated with genes:</td>
    <td width="10%"><div align="center">807</div></td>
    </tr>
  <tr bgcolor="#FFEFEA">
    <td width="90%">... associated with genes + experimental evidence:</td>
    <td width="10%"><div align="center">773</div></td>
    </tr>
  <tr bgcolor="#FFEFEA">
    <td width="90%">... in pathways, associated with genes + experimental evidence:</td>
    <td width="10%"><div align="center">599</div></td>
    </tr>
  <tr bgcolor="#F4FBF4">
    <td width="90%"><span class="style1">Total number of genes:</span></td>
    <td width="10%"><div align="center"><em><strong>5956</strong></em></div></td>
    </tr>
  <tr bgcolor="#F4FBF4">
    <td width="90%">... in pathways:</td>
    <td width="10%"><div align="center">1879</div></td>
    </tr>
  <tr bgcolor="#F4FBF4">
    <td width="90%">... with experimental evidence, in pathways:</td>
    <td width="10%"><div align="center">712</div></td>
    </tr>
  <tr bgcolor="#F4FBF4">
    <td width="90%"><div align="left">... in reactions:</div></td>
    <td width="10%"><div align="center">2675</div></td>
    </tr>
  <tr bgcolor="#F4FBF4">
    <td width="90%">... with experimental evidence, in reactions:</td>
    <td width="10%"><div align="center">815</div></td>
    </tr>
  <tr bgcolor="#EAEAFF">
    <td width="90%"><div align="left"><strong><em>Total number of proteins:</em></strong></div></td>
    <td width="10%"><div align="center"><em><strong>6011</strong></em></div></td>
    </tr>
  <tr bgcolor="#F5F5FA">
    <td width="90%">
      <div align="left"><strong><em>Total number of protein complexes:</em></strong></div></td>
    <td width="10%"> <div align="center"><em><strong>163</strong></em></div></td>
    </tr>
  <tr bgcolor="#FFFBEC">
    <td width="90%"><div align="left"><em><strong> Total number of compounds:</strong></em></div></td>
    <td width="10%"> <div align="center"><em><strong>1902</strong></em></div></td>
    </tr>
</table>
</td>
</tr>
</table>
<p><strong>AraCyc 4.0 </strong>'s release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives' page</strong></a>.</p>
<p><strong><em>Last modified:</em></strong> <em>July 3, 2007 </em></p>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

