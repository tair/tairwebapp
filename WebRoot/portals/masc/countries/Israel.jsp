<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "MASC";
String highlight = "3";
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

<jsp:include page="/jsp/includes/mascSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="MASC Submcomittees" />
</jsp:include>
<div id="rightcolumn">
<!--CONTENT HERE//-->
<span class="mainheader">
<i>Arabidopsis</i> Functional Genomics Research in Israel
</span>

<p>MASC representative:
<A HREF="mailto:dannyc@ex.tau.ac.il">Danny Chamovitz</A>, Tel Aviv University 
<hr>
<p>
<p><IMG SRC="/images/redball.gif"> New! Read the <a href="/portals/masc/countries/Israel_2009.pdf"><u>2009 Israel MASC report (pdf).</u></a>
<p>Read the <a href="/portals/masc/countries/Israel_2008.pdf"><u>2008 Israel MASC report (pdf).</u></a>
<br>Read the <a href="/portals/masc/countries/Israel_2007.pdf"><u>2007 Israel MASC report (pdf).</u></a>

<p>
<dl>
<I>Arabidopsis</I> projects in Israel are funded via national and bi-national grants.  Currently there are no national funding
initiatives specifically targeting <I>Arabidopsis</I> functional genomics.  A major German-Israel binational consortium studying
chemical-genetic platforms for the study of plant biology was funded by the German-Israel Coorporation Foundation (DIP).  This
consortium includes groups at The Hebrew University Faculty of Agriculture, Hebrew University, Tel Aviv University, and the Max
Planck Institute für Züchtungsforschung.
<p>
The major centers of <I>Arabidopsis</I> research are in Tel Aviv University (8 groups with funded research), The Hebrew University
of Jerusalem (primarily at the Faculty of Agriculture, 6 groups with funded research) and the Weizmann Institute of Science (4 groups
with funded research). These three centers have recently upgraded, or are in the process of upgrading, <I>Arabidopsis</I> growth
facilities.   For example, the Manna Center for Plant Biosciences at Tel Aviv University received a $1,000,000 donation this past year
for renovating and developing the <I>Arabidopsis</I> growth facility infrastructure.


<dt>Major funding sources for <I>Arabidopsis</I> functional genomics</dt>
<dd>
<ul>
<li><a href="http://www.isf.org.il">Israel Science Foundation</a>, Jerusalem; <A HREF="mailto:isakeren@isf.org.il">Email ISF</A>
<br>
Total <I>Arabidopsis</I> funding in 2006: approximately $842,750
<li><a href="http://www.bard-isus.com">The United States-Israel Binational Agricultural Research and Development Fund (BARD)</a>,
<A HREF="mailto:bard@bard-isus.com">Email Bet Dagon</A>
<br>
Total <I>Arabidopsis</I> funding in 2006: approximately $910,666
<li><a href="http://www.gifres.org.il">German-Israeli Foundation for Scientific Research and Development (GIF)</a>, Jerusalem;
<A HREF="mailto:gif-info@gif.org.il">Email GIF</A>
<br>
Total <I>Arabidopsis</I> funding in 2006: approximately $257,833
<li><a href="http://www.bsf.org.il">U.S.-Israel Binational Science Foundation (BSF)</a>, Jerusalem;
<A HREF="mailto:bsf@bsf.org.il">Email BSF</A>
<br>
Total <I>Arabidopsis</I> funding in 2006: approximately $74,000
<li><a href="http://www.internationales-buero.de/de/819.php">German-Israel Project/Deutsch-Israelisch Projektkooperation (DIP)</a>,
Bonn; <A HREF="mailto:nadia.meyer@dlr.de">Email DIP</A>
<br>

</ul>
</dd>
<P>

<dt><I>Arabidopsis</I> genomics tools and resources</dt>
<dd>
<ul>Vectors for using bimolecular fluorescence complementation (BiFC) for determining protein–protein interactions in plants
were constructed by the Yalovsky and Ohad labs at Tel Aviv university, and have been deposited with TAIR.
</ul>
</ol>
</dd>


</dl>

<center>Last modified on July 21, 2009</center>
</div><!--end rightcolumn-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

