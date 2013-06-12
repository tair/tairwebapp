<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - News Page";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="14" />
</jsp:include>

<jsp:include page="/jsp/includes/newsSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="News"/>  
</jsp:include>


<div id="rightcolumn">


<!-- CONTENT IN HERE -->
  <span class="mainheader">News Overview</span>
<p>This page provides news and events for the Arabidopsis research community.</p>
<dl>
<dt>TAIR News</dt>
<dd>Announcements of new releases and updates of data, tools, and other other developments
from TAIR.</dd>
<dd><dl>
<dt><a href="/doc/news/breaking_news/140">Breaking News</a>
<dd>News announcements for the past 9 months.
<dt><a href="/news/oldnews.jsp">What was News</a>
<dd>News announcements older than 9 months.</dd>
</dl></dd>
<dt><a href="/news/newsgroup.jsp">Arabidopsis Newsgroup</a></dt>
<dd>A moderated newsgroup for Arabidopsis researchers.</dd>
<dd><dl>
<dt><a href="http://www.bio.net/bionet/mm/arab-gen/">Archives</a></dt>
<dd>The Arab-gen newsgroup archives</dd>
<dt><a href="/news/newsgroup.jsp">Newsgroup</a>
<dd>Instructions on using the Arab-gen newsgroup site. How to subscribe/unsubscribe.</dd>
</dl></dd>

<dt><a href="/news/newsletter_archive.jsp">TAIR Newsletter Archive</a></dt>
<dd>TAIR newsletters in PDF format (2007-current) are stored here.</dd>

<dt><a href="/news/events.jsp">Conferences and Events</a></dt>
<dd>Conferences, workshops, and meetings of interest to the plant scientist.</dd>

<dt><a href="/news/jobs.jsp">Job Postings</a></dt>
<dd>Jobs available in plant sciences.</dd>

<dt><a href="/help/faq.jsp#jobs">How to Post a Job</a></dt>
<dd>Directions on how to automatically post a job to the TAIR website. No fee.</dd>
</dl>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


