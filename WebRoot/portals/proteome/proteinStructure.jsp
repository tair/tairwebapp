<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR- Proteome Resources- Protein Structure";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11802" />
</jsp:include>

<jsp:include page="/jsp/includes/proteomeSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Protein Structure" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->
<span class="mainheader">Protein Structure</span>

<DL>

<DT> <a href="http://www.coiled-coil.org/arabidopsis">Arabidopsis coiled-coil protein database (ARABI-COIL)</a> </DT>
<dd> A searchable database for Arabidopsis long coiled-coil proteins.</dd>
       
<DT> <a href="http://www.rcsb.org/pdb/static.do?p=search/index.html">PDB (Protein Data Bank)</a></DT>
<dd> 3-D structures (images) of proteins from various organisms including Arabidopsis.</dd>


</DL>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

