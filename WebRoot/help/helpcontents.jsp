<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%!
String pageName = "TAIR Database Help";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page errorPage="/jsp/common/gen_error.jsp"%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="204" />
</jsp:include>

<jsp:include page="/jsp/includes/helpSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Database/Tool Help Pages"/>  
</jsp:include>

<div id="rightcolumn">

 

<p>
Use the links below to access help pages for help with TAIR search interfaces, understanding search results, community registration and using TAIR's analysis tools.</p>
<dl>
<dt>Help for database searching and understanding search results and detail pages </dt>
<dd> <a href="helppages/tairseaa.jsp">Website Navigation/QuickSearch Help</a></dd>
<dd> <a href="helppages/initials.jsp">General Search Help</a></dd>
<dd> <a href="helppages/addcomment.jsp">Adding comments to detail pages</a></dd>
<dd> <a href="helppages/markerse.jsp">Marker Search and Results Help</a></dd>
<dd> <a href="helppages/genesear.jsp#913144">Gene Search and Results Help</a></dd>
<dd> <a href="helppages/dnasearch.jsp">DNA Search and Results Help</a></dd>
<dd> <a href="helppages/polyser.jsp">Polymorphism Search and Results Help</a></dd>
<dd> <a href="helppages/germsearch.jsp">Germplasm Search Help</a></dd>
<dd> <a href="helppages/ecosearch.jsp">Ecotype/Species Search Help</a></dd>
<dd> <a href="helppages/publicsearch.jsp">Publication Search and Results Help</a></dd>
<dd> <a href="helppages/prosearch.jsp">Protein Search and Results Help</a></dd>
<dd> <a href="helppages/protsearch_help.jsp">Protocol Search, Results and Details Help</a></dd>
<dd> <a href="helppages/bulkseqhelp.jsp">Bulk Sequence Download Help</a></dd>
<dd> <a href="helppages/bulkgohelp.jsp">Bulk GO Annotation Download Help</a><br>
<dd> <a href="helppages/proteinhelp.jsp">Bulk Protein Search</a></dd>
<dd> <a href="helppages/locushistoryhelp.jsp">Locus History Search and Results Help</a></dd>
<dd> <a href="helppages/exper_search.jsp">Microarray Experiments Search, results and details Help</a></dd>
<dd> <a href="helppages/microarray_readme.jsp">Microarray Elements Search and Results Help</a></dd>
<dd> <a href="helppages/expression_search.jsp">Microarray Expression Search Help</a></dd>
<dd> <a href="helppages/commsearch.jsp">Community Search and Results Help</a></dd>
<dd> <a href="helppages/keyser.jsp">Keyword Search and Results Help</a></dd>
<dd> <a href="helppages/keybrowse.jsp">Keyword Browser (TreeView) Help</a></dd>
<dd> <a href="helppages/annotdetail.jsp">TAIR GO Annotation Details Help</a></dd>
<dd> <a href="helppages/go_slim_help.jsp">Understanding the Plant GO Slim</a></dd>
</dl>
<dl>

<dt>Help with registering at TAIR</dt>
<dd><a href="helppages/commreg.jsp">Registration</a></dd>
<dd><a href="helppages/affiliate.jsp">Affiliations Help</a></dd>
<dd><a href="helppages/addlab.jsp">Adding Labs Help</a></dd>
<dd><a href="helppages/addorg.jsp">Adding Organizations  Help</a></dd>
<dd><a href="helppages/addpub.jsp">Help Adding/Updating Publications</a></dd>
</dl>
<dl>
<dt>Help Documents for Analysis Tools</dt>
<dd> <a href="/seqViewer/help/sv_intro.html">SeqViewer Help</a></dd>
<dd> <a href="/mapViewer/help/tairmapa.jsp">MapViewer Help</a></dd>
<dd> <a href="helppages/BLAST_help.jsp">Blast Help</a></dd>
<dd> <a href="helppages/Blastresults.jsp">WU BLAST help</a></dd>
<dd> <a href="/browse/Cereon/help.jsp">Cereon SNPs Help</a></dd>
<dd> <a href="helppages/help_expression.jsp">Expression Viewer Help</a></dd>
<dd> <a href="helppages/motif_help.jsp">Motif Finder Help</a></dd>
</dl>

</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
