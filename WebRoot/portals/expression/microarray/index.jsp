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
<jsp:param name="id" value="1130" />
</jsp:include>


<jsp:include page="/jsp/includes/expressionSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Microarrays" />  
</jsp:include>


<div id="rightcolumn">
<span class="mainheader">Microarrays</span>
<p>This section provides information on microarray expression-related for <i>Arabidopsis thaliana</i>.</p>
<p>Click on a header from the menu to expand the links and view available descriptions.</p>
			<dl>
				
				<dd><b><a href="/portals/expression/microarray/microarrayDatasetsV2.jsp">Public Datasets</a></b> provides links to public repositories or private web sites that allow searching and downloading complete microarray expression datasets.</dd>
				<dd><b><a href="/portals/expression/microarray/microarrayExpressionV2.jsp">Data Mining Tools</a> </b>provides links to tools for mining analyzed data available in public databases and web sites.</dd>
				<dd><b><a href="/portals/expression/microarray/microarrayElementsV2.jsp">Array Designs/Array Element Mapping</a></b> links to information on the the available array designs for Arabidopsis, and tools for mapping array elements to genes.</dd>
				<dd><b><a href="/portals/expression/microarray/microarrayFacilitiesV2.jsp">Microarray Facilities</a></b> links to sites where microarray hybridizations are performed for a fee.</dd>
				<dd><b><a href="/portals/expression/microarray/microarraySoftwareV2.jsp">Data Analysis Tools</a></b> provides links to stand-alone software for analyzing raw data and for data visualization.</dd>
				<dd><b><a href="/portals/expression/microarray/microarrayStandardsV2.jsp">Microarray Standards and User Groups</a></b> links to information on microarray standards from the MAGE society and several microarray discussion groups.</dd>
			</dl>


</div>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

