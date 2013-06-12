<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<!-- AraCyc 4.0-->
<%String pageName = "AraCyc 6.0 - Updated pathways";
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
.style1 {color: #000000}
.style5 {font-size: x-small}
.style7 {font-size: xx-small; font-style: italic; }
-->
</style>



<jsp:include page="/jsp/includes/aracycSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Release Notes" />
</jsp:include>

<div id="rightcolumn">
<!-- CONTENT IN HERE -->

<p align="center"><a name="Top"></a><img src="aracyc_files/aracyc_logo.gif" width="100" height="58"></p>
<p class="mainheader"> Updated pathways in AraCyc 6.0 </p>
<p>Please see the <a href="http://www.plantcyc.org/release_notes/aracyc/aracyc_release_notes_updatedpathways.faces">AraCyc release notes</a> housed at the Plant Metabolic Network for the most up-to-date information.</p>

<strong><em>Last modified</em>:</strong> <em>October 12, 2009</em></div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


