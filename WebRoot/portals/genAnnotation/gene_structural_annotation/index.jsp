<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR - Genome Structural Annotation";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName%>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1141" />
</jsp:include>

<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Gene Structural Annotation" />  
</jsp:include>
<div id="rightcolumn">
<!-- CONTENT IN HERE -->
<span class="mainheader">Gene Structural Annotation</span>
<P>
This page displays information about the structural annotation of the <i>Arabidopsis thaliana</i> genome.
<DL>
<DT><a href="/portals/genAnnotation/gene_structural_annotation/agicomplete.jsp">Genome Assembly</a>
<DD>Provides a summary of current <i>Arabidopsis thaliana</i> genome assembly, including remaining gaps and unsequenced clones, and information on the groups involved in the sequencing effort.
<DT><a href="/portals/genAnnotation/gene_structural_annotation/genome_annotation.jsp">Genome Annotation</a>
<DD>Describes the current structural annotation pipeline and information on the past and present annotation data.
<DT><a href="/submit/gene_annotation.submission.jsp">Submit Structural Annotation to TAIR</a>
<DD>Information on how to submit gene structure information to TAIR.
<DT><a href="/portals/genAnnotation/gene_structural_annotation/genome_release.jsp">Genome Publications and Documents</a>
<DD>Links to publications related to the release of the <i>Arabidopsis thaliana</i> genome and documents about the Arabidopsis Genome Initiative.
<DT><a href="/doc/portals/genAnnotation/gene_structural_annotation/ref_genome_sequence/11413">Reference Genome Sequence</a>
<DD>A proposed policy statement on the <i>Arabidopsis thaliana</i> reference sequence with community comments.


</DL>
<center>Last modified on April 12, 2006</center>

</div><!--right column-->
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


