<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "AraCyc - Archives";
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

<p align="center"><img src="aracyc_files/aracyc_logo.gif" width="100" height="58"></p>
<p class="mainheader">AraCyc Archives</p>
<p>For record-tracking, we have compiled on this page the records of all the previous AraCyc releases as they appeared on the website. The earliest of those archives dates back from AraCyc version 2.5.
<dl>
<dd><b><a href="25/releasenotes.jsp">AraCyc v.2.5</a></b><em> (November 2005)</em> </dd>
<dd><b><a href="26/releasenotes.jsp">AraCyc v.2.6</a></b><em> (February 2006)</em> </dd>
<dd><b><a href="35/releasenotes.jsp">AraCyc v.3.5</a></b><em> (February 2007)</em> </dd>
<dd><b><a href="40/releasenotes.jsp">AraCyc v.4.0</a></b><em> (July 2007)</em> </dd>
<dd><b><a href="41/releasenotes.jsp">AraCyc v.4.1</a></b><em> (November 2007)</em> </dd>
<dd><b><a href="45/releasenotes.jsp">AraCyc v.4.5</a></b><em> (June 2008)</em> </dd>
<dd><b><a href="50/releasenotes.jsp">AraCyc v.5.0</a></b><em> (March 2009)</em> </dd><br />
<dd>To find archived AraCyc release notes for <b>AraCyc 6.0 and above</b>, please visit the <a href="http://www.plantcyc.org/release_notes/release_notes_archives/release_notes_archives.faces">PMN Release Notes Archive</a></dd>
</dl>
<p>Release notes: <a href="../releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p><br>
    <strong><em>Last modified</em>:</strong> June 17, 2010</p>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

