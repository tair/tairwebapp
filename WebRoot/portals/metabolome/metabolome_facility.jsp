<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR- Metabolomics Resources- Services and Facilities";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1193" />
</jsp:include>

<jsp:include page="/jsp/includes/metabolomeSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Services and Facilities" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->
<span class="mainheader">Services and Facilities</span>



<dl>

<dt><a href="http://gmd.mpimp-golm.mpg.de/">The Golm Metabolome Database</a></dt>
<dd>Performs qualitative analysis of any biological samples.</dd>

<dt><a href="http://www.metabolomics.bbsrc.ac.uk/MeT-RO.htm">Met-Ro</a></dt>
<dd>Provides general metabolite profiling service for plants and microbes.</dd>

<dt><a href="http://www.metabolomics.bbsrc.ac.uk/GARNethome.htm                        ">GARNet  </a></dt>
<dd>Provides metabolite profiling service for Arabidopsis.</dd>


</dl>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

