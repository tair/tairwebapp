<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - News - About the Newsgroup";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="142" />
</jsp:include>

<jsp:include page="/jsp/includes/newsSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="About and How to Subscribe"/>  
</jsp:include>


<div id="rightcolumn">


<span class="mainheader">The Arabidopsis Newsgroup</span>

<p>
Arab-gen is the moderated electronic Arabidopsis newsgroup [bionet.genome.arabidopsis] that provides a 
forum for the discussion of Arabidopsis-related topics.  The newsgroup is supported by BIOSCI. BIOSCI 
is a set of electronic communication fora - the bionet USENET newsgroups and parallel e-mail lists - 
used by biological scientists worldwide. No fees are charged for the service.  The WWW Interface to 
the BIOSCI/bionet newsgroup also includes a complete searchable archive of all previously posted messages.
</p>
<p>
You can subscribe to, read and post to the newsgroup by using the BIOSCI WWW web site:

<a href="http://www.bio.net/biomail/listinfo/arab-gen">
http://www.bio.net/biomail/listinfo/arab-gen</a>
</p>



</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
