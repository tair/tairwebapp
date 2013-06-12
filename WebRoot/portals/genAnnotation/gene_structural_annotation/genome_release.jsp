<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR - Genome Publications and Documents";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName%>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11412" />
</jsp:include>

<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Genome Publications and Documents" />  
</jsp:include>
<div id="rightcolumn">
<!-- CONTENT IN HERE -->
<span class="mainheader">Genome Publications and Documents</span>
<DL>
<DT>
 <B>Genome Publications</B> <p>

<DD>Analysis of the genome sequence of the flowering plant <I>Arabidopsis thaliana</I>. Nature 408, 796-815 [<a href="http://www.nature.com/nature/journal/v408/n6814/abs/408796a0.html">Summary</A> | <a href="http://www.nature.com/nature/journal/v408/n6814/full/408796a0.html">Full Text</A>  | <a href="http://www.nature.com/nature/journal/v408/n6814/pdf/408796a0.pdf">PDF</A>]
    
<DD>Sequence and analysis of chromosome 1 of the plant <I>Arabidopsis thaliana</I>. Nature 408, 816-820 (2000) [<a href="http://www.nature.com/nature/journal/v408/n6814/abs/408816a0.html">Summary</A> | <a href="http://www.nature.com/nature/journal/v408/n6814/full/408816a0.html">Full Text</A> | <a href="http://www.nature.com/nature/journal/v408/n6814/pdf/408816a0.pdf">PDF</A>]

<DD>Sequence and analysis of chromosome 2 of the plant <I>Arabidopsis thaliana</I>. Nature 402, 761 - 768 (1999) [<a href="http://www.nature.com/nature/journal/v402/n6763/abs/402761a0.html">Summary</A> | <a href="http://www.nature.com/nature/journal/v402/n6763/full/402761a0.html">Full Text</A> | <a href="http://www.nature.com/nature/journal/v402/n6763/pdf/402761a0.pdf">PDF</A>]

<DD>Sequence and analysis of chromosome 3 of the plant <I>Arabidopsis thaliana</I>. Nature 408, 820-823 (2000) [<a href="http://www.nature.com/nature/journal/v408/n6814/abs/408820a0.html">Summary</A> | <a href="http://www.nature.com/nature/journal/v408/n6814/full/408820a0.html">Full Text</A> | <a href="http://www.nature.com/nature/journal/v408/n6814/pdf/408820a0.pdf">PDF</A>]

<DD>Sequence and analysis of chromosome 4 of the plant <I>Arabidopsis thaliana</I>. Nature 402, 769 - 777 (1999) [<a href="http://www.nature.com/nature/journal/v402/n6763/abs/402769a0.html">Summary</A> | <a href="http://www.nature.com/nature/journal/v402/n6763/full/402769a0.html">Full Text</A> | <a href="http://www.nature.com/nature/journal/v402/n6763/pdf/402769a0.pdf">PDF</A>]

<DD>Sequence and analysis of chromosome 5 of the plant <I>Arabidopsis thaliana</I>. Nature 408, 823-826 (2000) [<a href="http://www.nature.com/nature/journal/v408/n6814/abs/408823a0.html">Summary</A> | <a href="http://www.nature.com/nature/journal/v408/n6814/full/408823a0.html">Full Text</A> | <a href="http://www.nature.com/nature/journal/v408/n6814/pdf/408823a0.pdf">PDF</A>]
    
<DD> <a href="http://www.nsf.gov/od/lpa/news/press/00/pr0094.htm">First-Ever Complete Plant Genome Sequence Is Announced</a>, <a href="http://www.nsf.gov/">National Science Fundation</a>, December 13, 2000.<p>

<DT>
 <B>Arabidopsis Genome Initiative Documents</B><P>

<DD> <B>NSF Genome Research Project Progress Reports for Years</B> <a href="http://www.nsf.gov/publications/pub_summ.jsp?ods_key=nsf92112">Two</a>, <a href="http://www.nsf.gov/publications/pub_summ.jsp?ods_key=nsf93173">Three</a>, <a href="http://www.nsf.gov/bio/pubs/reports/arabid/start.htm">Four</a>,  <a href="http://www.nsf.gov/bio/pubs/reports/nsf9643/start.htm">Five</a>, <a href="http://www.nsf.gov/pubs/1997/nsf97131/nsf97131.htm">Six</a>, and  <a href="/portals/genAnnotation/gene_structural_annotation/progrept7.jsp">Seven & Eight</a>.  
<DD><B><a href="/portals/masc/workshop2010.jsp">The Multinational Coordinated Arabidopsis 2010 Project</B></a>.  NSF-sponsored workshop, 2000.
<DD><B><a href="/portals/genAnnotation/gene_structural_annotation/carnegieworkshop.jsp">New Directions in Plant Biological Research</B></a>. NSF-sponsored workshop, 1999.

<DD><B><a href="/portals/genAnnotation/gene_structural_annotation/agipress.jsp">AGI Press Announcement</a></B>, September 1996.

<DD>
<B><a href="/portals/genAnnotation/gene_structural_annotation/agiMOU.jsp">AGI Memorandum of Understanding</a></B>, September 1996.

<DD>
<B><a href="/portals/genAnnotation/gene_structural_annotation/agiDataRelease.jsp">Data Release Policy</a></B>, Information concerning release of genomic sequence data by AGI members, gathered by David Meinke. July 1997.


<DD>
 <B><a href="/portals/genAnnotation/gene_structural_annotation/agiPIphoto.jsp">Photo of AGI Principal Investigators</a></B>, September 1996.<P>
</DL>
<center>Last modified on February 06, 2007</center>

</div><!--right column-->
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


