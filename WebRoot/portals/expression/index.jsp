<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%!
String pageName = "TAIR - Gene Expression";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="113" />
</jsp:include>


<jsp:include page="/jsp/includes/expressionSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="" />  
</jsp:include>


<div id="rightcolumn">
<span class="mainheader">Gene Expression Resources</span>
<p>This section provides a gateway to finding gene expression-related information on <i>Arabidopsis thaliana</i> from high 
throughput expression data, such as microarrays, GFP-fusion proteins, and Massively Parallel Signature Sequencing technologies.</p>
<p>Click on a header from the menu to expand the links and view available descriptions.</p>
			<dl>
				
				<dd><b><a href="http://korflab.ucdavis.edu/cgi-bin/web-imeter.pl">IMEter</a></b> can be used to predict the ability of introns to boost gene expression. This analysis tool is provided by the Rose and Korf labs.</dd>
			
				<dd><b><a href="/portals/expression/microarray/index.jsp">Microarrays</a></b> provides information on microarray resources for Arabidopsis thaliana.</dd>

				<dd><b><a href="http://mpss.udel.edu/at?/">Massively Parallel Signature Sequencing</a></b> links to the Arabidopsis MPSS resource from the Meyers Lab.</dd>
				<dd><b><a href="/portals/expression/localization.jsp">Protein/RNA Localization</a></b> provides links to resources containing protein or RNA localization data.</dd>
				<dd><b><a href="/portals/expression/microarrayFunctionalV2.jsp">Functional Genomics Expression Projects</a></b> provides information on functional genomics projects that study gene expression in Arabidopsis.</dd>
			
			</dl>


</div>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

