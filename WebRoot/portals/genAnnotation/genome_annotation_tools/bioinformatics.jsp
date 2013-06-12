<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String pageName = "Genome Annotation Tools: Software Downloads";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11431" />
</jsp:include>

<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Software Downloads" />
</jsp:include>
<div id="rightcolumn">
<!--CONTENT HERE-->

<span class="mainheader">Software Downloads</span>

<dl>
<dt><a href="http://gmod.org">Generic Model Organism Database (GMOD) Pages at Sourceforge</a></dt>
<dd>Everything you need to set up a MOD and annotate a genome- all open source software.</dd>


<dt><a href="http://sourceforge.net">Sourceforge</a></dt>
<dd>The place to find and build  open source software</dd>


<dt><a href="http://www.bioconductor.org">BioConductor</a></dt>
<dd>Open source software downloads and open development environment for bioinformatics software.</dd>
</dl>


            </div> <!--right column-->
<center>Last modified on May 9, 2006</center>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>



