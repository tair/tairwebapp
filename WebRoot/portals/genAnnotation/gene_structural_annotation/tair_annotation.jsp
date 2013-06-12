<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR - Genome Annotation Methos";
String highlight = "4";
String helpfile="";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName%>" />
<jsp:param name="highlight" value="<%=highlight%>" />
<jsp:param name="helpfile" value="<%= helpfile %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Genome Annotation" />  
</jsp:include>
<div id="rightcolumn">
<!-- CONTENT IN HERE -->
<span class="mainheader">Genome Annotation</span>

<DL>
<DT>Genome Annotation Methods</DT>
<DD>

The TAIR structural annotation pipeline incorporates both manual and automated gene updates. Automated updates are carried out using the TIGR PASA annotation pipeline (Haas et al 2003). Arabidopsis cDNAs and ESTs are initially trimmed for contaminating vector sequences and poly-A tails removed (Seqclean). Initial alignments to the genome are carried out Via BLAT with a validation requirement of min 95% identity, min 90% transcript length aligned. Non-validated alignments are realigned via Sim4. Validated alignments are then assembled into distinct structures and compared to the pre-existing gene models. Strict validation criteria are applied, including min ORF size, max number of UTR exons, as well as a minimum length and similarity test. Manual annotators are provided with a web interface to review suggested automated updates. Alignments of arabidopsis cDNAs, ESTs and plant proteins can be viewed by manual curators in the Apollo annotation interface, where curators can utilise them as evidence to support manual updates to gene structures.

<br />
<br />
Manual updates are also made following communication from the community of new or incorrectly annotated genes.
Computational gene descriptions are generated using information derived from TAIR, Genbank, Uniprot and Interpro. Gene symbol, name and GO molecular function terms/s are derived from the TAIR DB.  Protein similarity matches are identified from Arabidopsis and other species using Blast. Protein domains are identified via interpro scan.
<br />
<br />
Genome annotation releases are made approximately every 9 months and are released via TAIR and NCBI.
<br />
<br />
TAIR wishes to thank Cornell University for use of the CBSU computer clusters at the Cornell Theory Center. 
<br />
<br />
Go to <a href="/portals/genAnnotation/gene_structural_annotation/annotation_data.jsp">Gene Annotation Data</a>.
</DD>
</DL>
<center>Last modified on July 11, 2007</center>

</div><!--right column-->
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

