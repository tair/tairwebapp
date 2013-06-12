<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR- Proteome Resources- Data Repositories";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1180" />
</jsp:include>

<jsp:include page="/jsp/includes/proteomeSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Data Repositories" />
</jsp:include>

<div id="rightcolumn">

<!-- CONTENT IN HERE -->
<span class="mainheader">Data Repositories</span>

<P>
This section lists a series of links to websites where you can find protein sequences such as all the proteins of the complete Arabidopsis genome, computationally predicted protein domains of all the Arabidopsis proteins, available 3-D structure images of some Arabidopsis proteins, large scale proteome data sets such as Arabidopsis mitochondrial proteins, available Arabidopsis protein-protein interaction information, and enzyme biochemical properties. The resources are further grouped to:</P>

<DL>
<DT><a href="/portals/proteome/proteinSeq.jsp">Primary Sequence</a
></DT>
<dd>Where you can download Arabidopsis protein sequences.</dd>

<DT><a href="/portals/proteome/domain.jsp">Protein Domain</a
></DT>
<dd>Where you can find any known protein domains exist in the Arabidopsis proteins.</dd>

<DT><a href="/portals/proteome/proteinStructure.jsp">Protein Structure</a
></DT>
<dd>Find out if your interested Arabidopsis protein falls into any specific structural groups, or has a 3-D structure image.</dd>

<DT><a href="/portals/proteome/proteinLocation.jsp">Protein Location</a
></DT>

<dd>Find the subcellular and/or cellular locations of your protein of interest, or find all the proteins located in a specific organelle.</dd>

<DT><a href="/portals/proteome/proteinInteract.jsp">Protein-protein Interaction</a
></DT>
<dd>Find out which Arabidopsis proteins interact with each other.</dd>

<DT><a href="/portals/proteome/biochem.jsp">Biochemical Properties</a
></DT>
<dd>Find information on Arabidopsis enzymes and biochemical pathways.</dd>

</DL>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

