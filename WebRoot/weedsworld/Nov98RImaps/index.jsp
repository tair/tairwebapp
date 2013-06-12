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

<h1>The latest RI map using the Lister and Dean mapping lines: November 1998</h1><hr>

<p><b>Please Note:</b> The Lister & Dean RI map is prepared by Mary
Anderson and co-workers at <a href="http://nasc.nott.ac.uk">
NASC</a>.
</p>

<hr />


    <ul>
      <li><a href="map_help.html">Help with RI mapping</a></li>
    </ul>


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

