<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%!
String pageName = "TAIR - Gene Expression - Microarray Facilities";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11303" />
</jsp:include>

<jsp:include page="/jsp/includes/expressionSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Microarray Facilities"/>  
</jsp:include>
		<div id="rightcolumn">
        
		<span class="mainheader">Microarray Facilities</span>
			<dl id="results">

						<dd id="d_1">
						<dl>
							<dt><a href="http://www.york.ac.uk/res/garnet/backgroundsean.htm" target="_blank">NASCArrays</a></dt>
							<dd>IGF Initiative, UK</dd>
							
							<dt><a href="http://www.ag.arizona.edu/microarray/" target="_blank">Arabidopsis Oligonucleotide Microarrays</a></dt>
							<dd>Univ. of Arizona, USA</dd>
							<dt><a href="http://www.biotech.wisc.edu/GEC/" target="_blank">Gene Expression Center</a></dt>
							<dd>University of Wisconsin. Provides services for large-scale gene expression studies using both DNA microarrays and Affymetrix GeneChips.</dd> 
							<dt><a href="http://keck.med.yale.edu/dnaarrays/" target="_blank">NIDDK Biotechnology Consortium</a></dt>
							<dd>NIDDK Biotechnology Consortium, Yale University School of Medicine, USA</dd>
							<dt><a href="http://www.osa.sunysb.edu/udmf/" target="_blank">SUNY Stony Brook DNA Microarray Facility</a></dt>
							<dd>Stony Brook University, USA</dd>
							<dt><a href="http://www.plantgenomics.iastate.edu/microarray/" target="_blank">CPG Workgroups</a></dt>
							<dd>Iowa State Univerisity, USA</dd>
							<dt><a href="http://www.microarrays.be" target="_blank">VIB MicroArray Facility</a></dt>
							<dd>Flanders Interuniversity Institute for Biotechnology, Belgium</dd>
              <dt><a href="https://www.vbi.vt.edu/core_laboratory_facility/gene_expression_analysis/" target="_blank">Core gaboratory Facility</a></dt>
							<dd>Virginia Bioinformatics Institute at Virginia Tech, USA</dd>
						</dl>
						</dd>
			</dl>
		</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
