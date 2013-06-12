<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR- Proteomics Resources- Proteomics Standards";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11809" />
</jsp:include>

<jsp:include page="/jsp/includes/proteomeSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Proteomics Standards" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->
<span class="mainheader">Proteomics Standards</span>

<DL>


<DT><a href="http://psidev.sourceforge.net">Proteomics Standards Initiative</a></DT>
<dd>The Proteomics Standards Initiative (PSI) aims to define community standards for data representation in proteomics to facilitate data comparision, exchange and verification. </dd>


</DL>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

