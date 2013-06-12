<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR- Proteomics Resources";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="118" />
</jsp:include>

<jsp:include page="/jsp/includes/proteomeSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->
<span class="mainheader">Proteomics Resources</span>

<DL>
<DT><a href="/portals/proteome/proteome_data.jsp">Data Repositories</a></DT>
<dd>This section lists a series of links to websites where you can find protein sequences such as all the proteins of the complete Arabidopsis genome, computationally predicted protein domains of all the Arabidopsis proteins, available 3-D structure images of some Arabidopsis proteins, large scale proteome data sets such as Arabidopsis mitochondrial proteins, available Arabidopsis protein-protein interaction information, and enzyme biochemical properties.</dd>


<DT><a href= "/portals/proteome/proteome_tool.jsp">Data Analysis Tools</a></DT>
<dd>This section contains links to websites where you can use varies tools to identify proteins based on protein properties such as mass, or compute with a protein sequence such as predicting domains or posttranslational modifications.</dd>  


<DT><a href="/portals/proteome/proteome_facility.jsp" >Proteome Facilities</a></DT>
<dd>This section contains links to public services including 2-D PAGE analysis, protein 3-D structure determination, and plant protein antibody production.</dd>

<DT><a href="/portals/proteome/proteome_standard.jsp">Proteomics Standards</a></DT>
<dd>Find out standards for data representation in proteomics.  Follow the rules to better facilitate data comparison, exchange and verification.</dd>



</DL>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

