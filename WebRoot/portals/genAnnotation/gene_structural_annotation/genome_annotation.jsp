<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR - Genome Annotation";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName%>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11411" />
</jsp:include>

<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Genome Annotation" />  
</jsp:include>
<div id="rightcolumn">
<!-- CONTENT IN HERE -->
<span class="mainheader">Genome Annotation</span>


<DL>
The Arabidopsis genome was initially annotated by the Arabidopsis Genome Initiative (AGI) and later 
reannotated by TIGR in collaboration with MIPs and TAIR. TAIR has now assumed primary responsibility 
for maintaining the Arabidopsis genome annotation in North America following TIGRs final release 
(TIGR5). The latest release (TAIR10; November 2010) builds upon the gene structures of the previous 
TAIR9 release using RNA-seq and proteomics datasets as well as manual updates informed by cross 
species alignments, peptides and community input regarding missing and incorrectly annotated genes.
<P>
If you have information about misannotated or unannotated genes, we would like to include your gene model in our database.  Submission forms can be found at the  <a href="/submit/index.jsp">Data submission page</a>
<P>
<DL>
<DT><a href="/portals/genAnnotation/gene_structural_annotation/tair_annotation.jsp">Genome Annotation Methods</a>
<DD>Provides information describing the annotation pipeline and release plan at TAIR.
<DT><a href="/portals/genAnnotation/gene_structural_annotation/annotation_data.jsp">Gene Annotation Data</a>
<DD>Provides information relating to past and present Arabidopsis genome releases. 
</DL>

<P>
For any annotation issues please contact us at: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a>
</DL>
<center>Last modified on May 28, 2009</center>

</div><!--right column-->
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


