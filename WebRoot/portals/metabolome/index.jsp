<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR- Metabolomics Resources";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="119" />
</jsp:include>

<jsp:include page="/jsp/includes/metabolomeSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->
<span class="mainheader">Metabolomics Resources</span>

<DL>

<DT><a href="/portals/metabolome/metabolome_database.jsp">Pathway and Compound Databases</a></DT>
<dd>This section contains various websites where you can search and visualize metabolic pathways and compounds.</dd>

<DT><a href="/portals/metabolome/metabolome_data.jsp">Metabolite Profiling Data</a></DT>
<dd>Find out where you can download public metabolite profiling data.</dd>


<DT><a href= "/portals/metabolome/metabolome_tool.jsp">Data Analysis Tools</a></DT>
<dd>This section contains links to websites where you can use varies tools to visualize and analyze metabolic networks, and analyze metabolite MS and NMR data.</dd>


<DT><a href="/portals/metabolome/metabolome_facility.jsp" >Services and Facilities</a></DT>
<dd>Find out where you can submit samples and get your metabolite profiling experiments done.</dd>

<DT><a href="/portals/metabolome/metabolome_standard.jsp">Metabolomics Standards</a></DT>
<dd>Find out standards for data representation in metabolome. Follow the rules to better facilitate data comparison, exchange and verification.</dd>

<DT><a href="/portals/metabolome/metabolome_chemicals.jsp">Chemical Structure Tools</a></DT>
<dd>You can download several software programs to help visualize and manipulate chemical structures.</dd>

</DL>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

