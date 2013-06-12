<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "TAIR Tutorials";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="200" />
</jsp:include>

<jsp:include page="/jsp/includes/helpSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Tutorials"/>
</jsp:include>

<div id="rightcolumn">



<p>We have generated some tutorials to help you learn about how to use specific resources at TAIR.These tutorials also include Quicktime demos illustrating how to use different tools. To view these movies you must have Quicktime installed, you can download the software from <a href="http://apple.com/quicktime/download">Apple's Quicktime Site</a>.
</p>

</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>