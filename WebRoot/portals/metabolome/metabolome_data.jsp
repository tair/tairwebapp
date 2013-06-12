<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR- Metabolomics Resources- Data Repositories";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1191" />
</jsp:include>

<jsp:include page="/jsp/includes/metabolomeSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Metabolite Profiling Data" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->
<span class="mainheader">Metabolite Profiling Data</span>


<DL>

<DT><a href="http://www.metabolome-express.org">MetabolomeExpress</a></DT>
<dd>Provides a public metabolomics data repository and processing pipeline enabling web-based processing, analysis and transparent dissemination of metabolite profiling datasets from all organisms, including Arabidopsis. Available data include metabolite response statistics, raw and processed GC/MS data, data matrices, mass-spectrum and retention-index libraries and standards-compliant metadata in systematic text file formats. Data may be analysed online using a wide variety of built-in analysis tools or downloaded for offline analysis.
.</dd>

          
<DT><a href="http://plantmetabolomics.org">NSF2010 Metabolomics</a></DT>
<dd>Allows access to Arabidopsis metabolite profiling data.</dd>


<DT><a href="http://gmd.mpimp-golm.mpg.de">The Golm Metabolome Database</a></DT>
<dd>Allows access to mass spectra and retention time index libraries, and metabolite profiling experiments.</dd>
 
<DT><a href="http://prime.psc.riken.jp/?action=nmr_search">SpinAssign</a></DT>
<dd>Performs batch-assignments of NMR peaks.</dd>

<DT><a href="http://prime.psc.riken.jp/?action=standard_index">Standard Spectrum</a></DT>
<dd>Allows access to mass spectra data for compounds measured through mass spectrometry or NMR.</dd>

</DL>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

