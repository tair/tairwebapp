<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - Newsletter Archive";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="145" />
</jsp:include>

<jsp:include page="/jsp/includes/newsSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Job Postings"/>  
</jsp:include>


<div id="rightcolumn">

<span class="mainheader">TAIR Newsletter Archive</span>

<dl>

<dt><a href="/news/newsletter_archive/TAIR_Newsletter_Spring_2010.pdf">TAIR Spring 2010 Newsletter</a></dt>
<dt><a href="/news/newsletter_archive/TAIR_Newsletter_Summer_2009.pdf">TAIR Summer 2009 Newsletter</a></dt>
<dt><a href="/news/newsletter_archive/TAIR_Newsletter_Fall_2009.pdf">TAIR Fall 2009 Newsletter</a></dt>
<dt><a href="/news/newsletter_archive/TAIR_Newsletter_Spring_2008.pdf">TAIR Spring 2008 Newsletter</a></dt>
<dt><a href="/news/newsletter_archive/TAIR_Newsletter_Fall_2008.pdf">TAIR Fall 2008 Newsletter</a></dt>
<dt><a href="/news/newsletter_archive/TAIR_Newsletter_Fall_2007.pdf">TAIR Fall 2007 Newsletter</a></dt>

</dl>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
