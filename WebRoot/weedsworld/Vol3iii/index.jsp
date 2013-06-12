<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR";
String highlight = "4";
String helpfile="";
String cssfile="/css/page/ais.css";
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
<div id="right_column">

<center>


<H1>Weeds World Volume 3(iii)</h1>
<h1>ISSN 1358-6912</h1>
</center>
<h4>
Editor: Mary Anderson, NASC, University of Nottingham, UK<br>
WWW mirror site curator: David Flanders, Stanford AtDB Project<br>
WWW mirror site curator: Doug Bigwood, Genome Informatics Group, NAL<br>
Markup: Mike Arnold, NASC <p>
<A HREF="../Vol2ii/editorq.html" target="_top">Comments to the editor</A>
<center>
<img src="images/blu_bar.gif" width=300 align=center>
</center>



<blockquote>

<h4>Map and Sequencing updates</h4>


<h3>Next deadline for submission is Sometime in 1997</h3>
<table width=90% border=0>
<tr><td><menu><li><A HREF="submit.html">How to submit information for publication</A><address>Mary Anderson</address></li></menu></t
d><td align=right>(pg 68-69)<br></td></tr>
</table>
<hr />
<a href="help.html" target="frame_main"><img src="images/btn-010.jpg" width=35 height=35 align=left wrap=right> A help page</a> is a
vailable to describe new features of the newsletter, and to provide for feedback if problems with the layout are encountered.
<hr />

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

