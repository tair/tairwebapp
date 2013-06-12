<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%!
String pageName = "TAIR - Gene Expression - Protein/RNA Localization";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1131" />
</jsp:include>

<jsp:include page="/jsp/includes/expressionSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Protein/RNA Localization"/>  
</jsp:include>

		<div id="rightcolumn">
		<span class="mainheader">Protein/RNA Localization</span>
			<dl>

						<dd id="d_1">
						<dl>
							<dt><a href="http://bioinf.scri.sari.ac.uk/cgi-bin/atnopdb/home">Arabidopsis Nucleolar Protein Database</a></dt>
							<dd> The Arabidopsis Nucleolar Protein database (AtNoPDB) provides information on the plant proteins identified to date with comparison to human and yeast proteins, and images of cellular localisations for over a third of the proteins.</dd>
							<dt><a href="http://www.arexdb.org">AREX</a></dt>
							<dd>Stores microarray and traditional (in situ, etc) spatial gene expression data by Philip Benfey, USA</dd>
							<dt><a href="http://deepgreen.stanford.edu">Plant Cell Imaging</a></dt>
							<dd>Images and movies of live Arabidopsis cells using GFP fusion proteins, David Ehrhardt, USA</dd>

							<dt><a href="http://www.psb.ugent.be/papers/cellbiol/">Cytokinesis GFP-tagged Protein Localization</a></dt>
							
							<dd>Subcellular localization of potential cytokinesis proteins in tobacco and Arabidopsis plants.</dd>
							<dt><a href="http://bioinf.scri.sari.ac.uk/cgi-bin/ProtLocDB/home">ProtLocDB</a></dt>
							<dd>Protein Localisation Database containing sequence information, BLAST results and the subcellular localisations of numerous partial plant cDNA-GFP fusions. </dd>

						</dl>
						</dd>
			</dl>
		</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
