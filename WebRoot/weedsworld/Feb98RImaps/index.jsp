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

<h1>The February 1998 RI map using the Lister and Dean mapping lines</h1><hr />

<b>Please Note:</b> This is <b>not</b> the current version of the
Lister & Dean RI map. The latest, Aug. 98, map is available from <a
href="/ww/Aug98RImaps/index.html">
AtDB</a> and from <a href="http://nasc.nott.ac.uk">NASC</a>.

<hr />

            <b>Text maps</b>
            <ul>
            <li><A HREF="html/chrom1.html">Chromosome 1 map</A> - Text</li>       
            <li><A HREF="html/chrom2.html">Chromosome 2 map</A> - Text</li>       
            <li><A HREF="html/chrom3.html">Chromosome 3 map</A> - Text</li>       
            <li><A HREF="html/chrom4.html">Chromosome 4 map</A> - Text</li>       
            <li><A HREF="html/chrom5.html">Chromosome 5 map</A> - Text</li>
            </ul>
            <b>Graphical Maps</b>
          <ul>
            <li><A HREF="gifs/chrom1.html">Chromosome 1 map</A> - Graphic</li>    
            <li><A HREF="gifs/chrom2.html">Chromosome 2 map</A> - Graphic</li>    
            <li><A HREF="gifs/chrom3.html">Chromosome 3 map</A> - Graphic</li>    
            <li><A HREF="gifs/chrom4.html">Chromosome 4 map</A> - Graphic</li>    
            <li><A HREF="gifs/chrom5.html">Chromosome 5 map</A> - Graphic</li>    
          </ul>




<center>Last modified on January 25, 2002</center>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

