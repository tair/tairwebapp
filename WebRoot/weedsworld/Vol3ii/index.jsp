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


<H1>Weeds World Volume 3(ii)</h1>
<h1>ISSN 1358-6912</h1>
</center>
<h4>
Editor: <A HREF="mailto:arabidopsis@nottingham.ac.uk">Mary Anderson</A>, NASC, University of Nottingham, UK<br>
WWW mirror site curator: <a href="mailto:flanders@genome.stanford.edu">David Flanders</a>, Stanford AtDB Project<br>
WWW mirror site curator: <a href="mailto:dbigwood@locus.nalusda.gov">Doug Bigwood</a>, Genome Informatics Group, NAL<br>
Markup: <a href="mailto:mike@thale.nott.ac.uk">Mike Arnold</a>, NASC <p>
<A HREF="../Vol2ii/editorq.html" target="_top">Comments to the editor</A>
<center>
<img src="images/blu_bar.gif" width=300 align=center>
</center>



<blockquote>

<h4>Conference Report</h4><p>

<table border=0 width=90%>
<tr><td><menu><li><a href="reports/Norwich.html" target="frame_main">Report on the 7th International Arabidopsis Conference</a> at U
EA, Norwich.</li></menu></td><td align=right>(pg 1-24)<p></td></tr>
</table>
<p>
<h4>Map and Sequencing updates</h4>
<table width=90% border=0>
<tr><td><menu><li><A HREF="RI_map_move.html">Lister and Dean RI map database and mapping service moves to NASC</A></li></menu></td><td align=right>(pg 25-26)<br /></td></tr>

<p>
<tr><td><menu><li><A HREF="mapping/mapping.html">The latest RI map using Lister and Dean RI lines</A></li></menu></td><td align=righ
t>(pg 27-42)<br></td></tr>
</table>
<h4>Protocols</h4>
<table width=90% border=0>
<tr><td><menu><li><a href="sol-modGFP.html">Soluble derivatives of green fluorescent protein (GFP) for use in <I>Arabidopsis thalian
a</I></a><address>Seth J. Davis and Richard D. Vierstra</address></li></menu></td><td align=right>(pg 43-48)<br></td></tr>
</table>

<h4>Informatics News</h4><p>
<table width=90% border=0>
<tr><td><menu><li><a href="Cherry-Flanders-Petel.WW.html" target="frame_main">New Directions in Genome Databases at Stanford.</a>
<address>Mike Cherry, David Flanders and Fabien Petel</address></li></menu></td><td align=right>(pg 49-54)<br></td></tr>
</table>

<h4>Stock Centre Updates</h4>

<table width=90% border=0>
<tr><td><menu><li><a href="Netscape.html">Changes for Change Sake? The NASC WWW Server Upgrade</a><address>Mike Arnold and Mary Ande
rson</address></menu></li></td><td align=right>(pg 55-58)<br></td></tr>
<tr><td><menu><li><a href="abrc.html">Arabidopsis Biological Resource Center and AIMS News</a><address>Randy Scholl, Keith Davis and
 Sakti Pramanik</address></menu</td><td align=right>(pg 59-60)<br></table>
<p>
<h4>Positions Available</h4>
<table width=90% border=0>
<tr><td><menu><li><A HREF="minnesota_adv.html">Opportunity for a Computational Biologist in Plant EST Analysis</a> - University of M
innesota</li></menu></td><td>(pg 61)<br></td></tr>
</table>

<h4>Video Review</h4><p>
<table width=90% border=0>
<tr><td><menu><li><a href="mulligan.html">Arabidopsis as a Model organism. Homoetic genes and development in a plant.</a><address>Be
rnard Mulligan</address></li></menu></td><td align=right>(pg 62-63)<br></td></tr>
</table>

<h4>Meeting information-Dates for your Diary</h4>
<p>
<table width=90% border=0>
<tr><td><menu><li><A HREF="madison.html">8th Arabidopsis Conference at Madison</A></li></menu></td><td align=right>(pg 64)<br></td></tr>
<p>
<tr><td><menu><li><A HREF="PGenome.html">Plant and Animal Genome V meeting</A></li></menu></td><td align=right>(pg 65)<br></td></tr>
<p>
<tr><td><menu><li><A HREF="plant_mol.html">Fifth International Congress of Plant Molecular Biology</A></li></menu></td><td align=rig
ht>(pg 66)<br></td></tr>
<p>
<tr><td><menu><li><A HREF="amspp.html">American Society of Plant Physiologists meeting</A></li></menu></td><td align=right>(pg 67)<b
r></td></tr>
<p>
</table>
<h3>Next deadline for submission is Monday 25th November 1996</h3>
<table width=90% border=0>
<tr><td><menu><li><A HREF="submit.html">How to submit information for publication</A><address>Mary Anderson</address></li></menu></t
d><td align=right>(pg 68-69)<br></td></tr>
</table>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

